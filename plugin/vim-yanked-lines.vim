" plugin/yank_ref.vim

if exists('g:loaded_yank_ref')
  finish
endif
let g:loaded_yank_ref = 1

function! s:VisualReference() abort
  let l:filename = expand('%')
  if l:filename ==# ''
    let l:filename = 'unnamed_file'
  endif

  let l:start_line = line("'<")
  let l:end_line = line("'>")

  let l:ref_string = '@' . l:filename . '  (' . l:start_line . ':' . l:end_line . ')'
  
  let @+ = l:ref_string
  echom l:ref_string . ' saved to clipboard'
endfunction

function! s:NormalReference() abort
  let l:filename = expand('%')
  if l:filename ==# ''
    let l:filename = 'unnamed_file'
  endif

  let l:ref_string = '@' . l:filename
  
  let @+ = l:ref_string
  echom l:ref_string . ' saved to clipboard'
endfunction

" --- Public Interface ---

" 1. Expose as Command Line Commands
command! YankRefNormal call s:NormalReference()
" -range prevents Vim from running the command N times for N selected lines
command! -range YankRefVisual call s:VisualReference()

" 2. Expose as <Plug> mappings for user vimrc configuration
nnoremap <silent> <Plug>(YankRefNormal) :<C-U>YankRefNormal<CR>
xnoremap <silent> <Plug>(YankRefVisual) :<C-U>YankRefVisual<CR>
