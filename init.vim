lua <<EOF
require 'setup'
EOF


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $LANG = 'en'
set langmenu=en 	" 设置界面语言



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 分屏窗口移动
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
imap <c-H> <esc><c-w>h
imap <c-L> <esc><c-w>l
imap <c-J> <esc><c-w>j
imap <c-K> <esc><c-w>k

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
let g:vimspector_enable_mappings = 'HUMAN'
nmap  <Leader>di <Plug> VimspectorBalloonEval
xmap  <Leader>di <Plug> VimspectorBalloonEval
let g:vimspector_sidebar_width = 65
packadd! vimspector


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
noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 状态栏
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
