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

# Terminal Commands
## jq
1. Select text
2. `:`
3. `!jq`

# File
## Got to file
Go to file using `gf`. To go to a file path that uses spaces instead of escaped spaces, visually select the path and then press `gf`.

# Viewing
# View Mappings
Use `:map` to view custom mappings.
