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
