# SOPS

'''
sudo apt-get install gnupg
gpg --full-generate-key
gpg --list-secret-keys --keyid-format LONG
sudo apt-get install sops
helm plugin install https://github.com/jkroepke/helm-secrets
export GPG_TTY=$(tty)
gpg --armor --export <your key id> > public.key
gpg --armor --export-secret-keys <your key id> > private.key
gpg --import public.key
gpg --import private.key
'''
