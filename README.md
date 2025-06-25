# LitFill's zshrc

untuk mempermudah replikasi lingkunganku di perangkat baru.

## Dependency

konfigurasi ini bergantung pada paket berikut:

```md
git zoxide fzf opam nvim zen-browser
```

```sh
# oh-my-posh
curl -s https://ohmyposh.dev/install.sh | bash -s
```

```sh
# ghcup
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

## Usage

```sh
git clone https://github.com/LitFill/zsh-config ~/.config/zsh/
mv ~/.zshrc ~/.zshrc.backup
ln -s ~/.config/zsh/.zshrc
```
