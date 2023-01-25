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
The definnition is `substitute({expression}, {pattern}, {replacement}, {flags})`

In the replacement component we open with \=. This special operator tells Vim to treat everything that follows as an expression, evaluate it, and use the result as the replacement of the final matched text.

```
# This replaces all the dashes with spaces
doo-a-a-a-ood

:%s!\vd.*d!\=substitute(submatch(0), '-', ' ', 'g')!gc  

> doo a a a ood
```

See https://vi.stackexchange.com/questions/20704/how-to-run-a-substitute-command-on-only-a-certain-part-of-the-line/20706#20706


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
