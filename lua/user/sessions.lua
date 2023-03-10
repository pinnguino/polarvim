local autocmd = vim.api.nvim_create_autocmd
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
autocmd({ "VimLeave", "ExitPre" },
  {
  pattern = '',
  command = ":mksession! ~/.config/nvim/lastsession.vim"
})


