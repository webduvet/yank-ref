" plugin/yank_ref.vim


if exists('g:loaded_yank_ref')
  finish
endif
let g:loaded_yank_ref = 1

" 1. Function for Visual Mode (Includes line numbers)
function! s:VisualReference() abort
  let l:filename = expand('%')
  if l:filename ==# ''
    let l:filename = 'unnamed_file'
  endif

  " '< and '> represent the start and end of the visual selection
  let l:start_line = line("'<")
  let l:end_line = line("'>")

  let l:ref_string = '@' . l:filename . '  (' . l:start_line . ':' . l:end_line . ')'
  
  " Save to system clipboard
  let @+ = l:ref_string
  
  " Output confirmation
  echom l:ref_string . ' saved to clipboard'
endfunction

" 2. Function for Normal Mode (Filename only)
function! s:NormalReference() abort
  let l:filename = expand('%')
  if l:filename ==# ''
    let l:filename = 'unnamed_file'
  endif

  let l:ref_string = '@' . l:filename
  
  let @+ = l:ref_string
  echom l:ref_string . ' saved to clipboard'
endfunction

" xnoremap targets visual mode. <C-U> clears the automatic '<,'> range.
xnoremap <silent> <leader>a :<C-U>call <SID>VisualReference()<CR>

" nnoremap triggers only in normal mode (no selection)
nnoremap <silent> <leader>a :call <SID>NormalReference()<CR>
