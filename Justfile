
archive:= "obsidian-vault"

sync:
    just compress
    just encrypt
    git push origin main

compress:
    tar -czvf {{archive}}.tar.gz ./obsidian-vault

encrypt:
    gpg -c {{archive}}.tar.gz

decrypt:
    gpg -d {{archive}}.tar.gz.gpg > directory_name.tar.gz

