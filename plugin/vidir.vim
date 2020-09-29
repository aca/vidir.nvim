if exists('g:loaded_vidir')
  finish
endif
let g:loaded_vidir = 1

if @% =~ "dir....." 
  augroup vidir
    autocmd!
    autocmd VimEnter * lua require'vidir'.ls()
    autocmd CursorHold   * lua require'vidir'.ls()
    autocmd CursorMoved  * lua require'vidir'.ls()
    autocmd CursorMovedI * lua require'vidir'.ls()
  augroup end
endif
