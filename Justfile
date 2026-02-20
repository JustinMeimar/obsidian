
VAULT     := "obsidian-vault"
TARBALL   := VAULT + ".tar.gz"
ENCRYPTED := TARBALL + ".gpg"

sync KEY:
    just compress
    just encrypt {{KEY}}

compress:
    tar -czvf {{TARBALL}} ./{{VAULT}}

decompress OUT_DIR:
    tar -xvzf {{TARBALL}} -C {{OUT_DIR}}

encrypt KEY:
    gpg --batch --yes --passphrase `cat {{KEY}}` -c {{TARBALL}}

decrypt KEY:
    gpg --batch --yes --passphrase `cat {{KEY}}` -d {{ENCRYPTED}} > {{TARBALL}}

