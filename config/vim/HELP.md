# Search/Replace ALL
```
:Rg <search term>
:cfdo %s/<search term>/<replace term>/gc
:cdo update #(save all files)
```

# How to find uniqe entries in vim
Save both buffers to some tmp file.

```
comm -13 <(sort -u /tmp/a) <(sort -u /tmp/b)    
```

This will tell you which things are unique to the second file (things that the first file doesn't contain.

# Regex
## Non-greedy Quantifier
Use `.\{-}` in place of `.*?`.

If using `\v` (very magic mode), use `.{-}` instead.

## Capture Groups
Capture groups actually have to be escaped like so `\(someWord\).`

`:%s/\(someWord\)`

Or you can use `\v` to not have to escape them:

`:%s/\v(someWord)`

## Match start & Match end
When using substitution, you can use `\zs` and `\ze` to denote the match start and match end. This is useful if you only want to replace one part of a match.

So if you only want to remove a single part of the pattern, but still want to assert that the stuff around is also there, use `\zs` (match start) and `\ze` (match end):

Example to only remove the dash:

```
Keep - me

:%s/Keep\zs-\zeme//`

> Keep me
```

## Replace all occurrences within a pattern
Use something like `\=substitute(submatch(0), '_', ' ', 'g')`. 
The definition is `substitute({expression}, {pattern}, {replacement}, {flags})`

In the replacement component we open with \=. This special operator tells Vim to treat everything that follows as an expression, evaluate it, and use the result as the replacement of the final matched text.

```
# This replaces all the dashes with spaces
doo-a-a-a-ood

:%s!\vd.*d!\=substitute(submatch(0), '-', ' ', 'g')!gc  

> doo a a a ood
```

See https://vi.stackexchange.com/questions/20704/how-to-run-a-substitute-command-on-only-a-certain-part-of-the-line/20706#20706

# Commands

## Command Window
Enter the command window with `q:`. Here you can edit commands in normal mode.

To execute a command in normal mode, press `Enter`.
To select it without executing, press `CTRL-c`.
To exit the command window, press `CRTL-c` twice.


## Global Commands
Global commands start with `:g` and are followed by a regexp and then a command: `:g/regexp/cmd`

## Yank all lines matching a pattern
1. Clear register that you want to yank in to: `qaq`.
2. Then yank using: `:g/regex/y A`.
  1. Register must be capitalized. This means to append rather than rewrite to register `a`.
3. Paste using: `"ap`.


# Terminal Commands
## jq
1. Select text
2. `:`
3. `!jq`

## Run command in temp buffer
1. Visual selection
2. `:<,'>w !bash`

## Run command and replace selected with output
1. Visual selection
2. `:<,'> !bash

# File
## Got to file
Go to file using `gf`. To go to a file path that uses spaces instead of escaped spaces, visually select the path and then press `gf`.

# Viewing
## View Mappings
Use `:map` to view custom mappings or `:Map` for fzf finding.

## View commands
Use `:commands` or `:Commands` for fzf finding.

# Global Commands
Global commands are issued with `:g`.

## Yank all matching lines
1. Clear register: `qaq`
2. Issue global command: `g/.*blah/y A`

Ensure that the register is capitalized, as this indicates to vim that it should append to the register rather than overwrite it.

## Delete all matching lines
1. Clear register: `qaq`
2. Issue global command: `g/\v.*\[".+"\]/d A` 

# Reordering lines
This works on up to 9 lines.

1. Move the cursor to "line 1" and type `dd` to delete the line. Go to "line 2" and press `.` to repeat (delete another line. 
2. Repeat this on "line 3", and so on, until everything has been deleted in order.
3. Now type "1P to paste the contents of register 1 before the cursor.
4. Repeat with the dot command, eight times.

NOTE: This doesn't work in IntelliJ.

# Diff Windows
`:windo diffthis` will diff all windows. `:windo` performs the operation on all windows.
To turn it off, use `:diffoff!`. `!` applies it to al windows.

# Only replace within visual selection on a line
Use `%V`.

`:'<,'>s/\%V /_/g`

# Copy from buffer to vim Terminal buffer
To paste from a register into the terminal window you have to be in Terminal-Job ("insert") mode.

Press CTRL-W " followed by the register.
