-- make, grepなどのコマンドの後に自動的にQuickFixを開く
vim.cmd("autocmd init QuickfixCmdPost make,grep,grepadd,vimgrep copen")

-- フォルダが存在しない場合に自動作成する
function mkdir(dir, force)
  if vim.fn.isdirectory(dir) and (force or string.match(vim.fn.input(vim.fn.printf('"%s" does not exist. Create? [y/N]', dir)), "^y(es)?$")) then
    vim.fn.mkdir(dir, "p")
  end
end
vim.cmd("autocmd init BufWritePre * call v:lua.mkdir(expand('<afile>:p:h'), v:cmdbang)")
