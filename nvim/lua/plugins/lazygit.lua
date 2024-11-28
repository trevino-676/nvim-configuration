return {
    'kdheepak/lazygit.nvim',
    cmd = {
        'LazyGit',
        'LazyGitConfig',
        'LazyGitCurrentFile',
        'LazyGitFilter',
        'LazyGitFilterCurrentFile',
    },
    depenedencies = {
        'nvim-lua/plenary.nvim',
    },
    keys = {
        { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'Open lazy git' },
    },
}
