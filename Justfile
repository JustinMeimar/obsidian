
archive:= "obsidian-vault"

compress:
    tar -czvf {{archive}}.tar.gz ./obsidian-vault

encrypt:
    gpg -c {{archive}}.tar.gz

decrypt:
    gpg -d {{archive}}.tar.gz.gpg > directory_name.tar.gz

