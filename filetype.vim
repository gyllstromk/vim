if exists("did_load_filetypes")

    finish

else

    augroup filetypedetect

    au! BufRead,BufNewFile *.m       setfiletype objc
    au! BufRead,BufNewFile *.mm       setfiletype objcpp

    augroup END
endif
