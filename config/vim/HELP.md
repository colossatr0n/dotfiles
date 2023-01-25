# Regex
## Non-greedy Quantifier
Use `.\{-}` in place of `.*?`.

If using `\v` (very magic mode), use `.{-}` instead.

## Capture Groups
Capture groups actually have to be escaped like so `\(someWord\).`

`:%s/\v\(someWord\)`

Or you can use `\v` to not have to escape them:

`:%s/\v(someWord)`

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
