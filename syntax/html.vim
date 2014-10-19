imap <buffer>			<leader>sc		<script type="text/javascript"></script>O

map <buffer>			<leader>r		:! open %<cr>

syntax clear Javascript

inoremap <buffer> <leader>if {{#if }}{{/if}}O
inoremap <buffer> { {{}}F{a
inoremap <buffer> <leader>fo {{#each }}{{/each}}k0f}i

inoremap <buffer> <leader>fg <div class="form-group"></div>O
inoremap <buffer> <leader>op <option></option>F<i
