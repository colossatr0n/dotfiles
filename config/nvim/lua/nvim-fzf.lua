vim.cmd(
    "call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --cached'}))"
)
