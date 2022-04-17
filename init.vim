"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" loading lua
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
require 'setup'
EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $LANG = 'en'
set langmenu=en         " 设置界面语言
set nowrap              " 禁止换行
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 分屏窗口移动
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
tnoremap <c-a> <c-\><c-n>
let g:terminal_key = '<C-T>'
let g:terminal_list = 0
let g:terminal_height = 15
let g:terminal_cwd = 2
let g:terminal_kill = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Debug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
" nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
" nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
" nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
" nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
" nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>

" let g:vimspector_enable_mappings = 'HUMAN'
" nmap  <Leader>di <Plug> VimspectorBalloonEval
" xmap  <Leader>di <Plug> VimspectorBalloonEval
" let g:vimspector_sidebar_width = 65
" packadd! vimspector
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"LeaderF模糊搜索插件配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Lf_ShowDevIcons = 1 
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 状态栏
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
