find . -type f -name '*.md' |
    while read f; do
        pandoc -f markdown -t json "$f" |
            ~/Work/minorg/minorg generate -o "${f}.norg"
        done
