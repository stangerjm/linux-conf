# linux-conf

## Quick setup (new machine)

### 1. Install Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Clone configs
```bash
git clone <this-repo> ~/linux-conf
git clone https://github.com/stangerjm/titanium.nvim.git ~/.config/nvim
```

### 3. Install tools
```bash
brew bundle --file=~/linux-conf/Brewfile
```

### 4. Install Oh My ZSH + plugins + theme
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### 5. Install Node via NVM
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
source ~/.zshrc
nvm install 20
```

### 6. Install Neovim LSP dependencies
```bash
npm install -g typescript typescript-language-server @vue/language-server @vue/typescript-plugin eslint_d vscode-langservers-extracted@4.8.0 neovim
```

## What's included

Via `Brewfile`:
* [Neovim](https://github.com/neovim/neovim)
* [eza](https://github.com/eza-community/eza)
* [fzf](https://github.com/junegunn/fzf)
* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [lua-language-server](https://github.com/LuaLS/lua-language-server)

Via Oh My ZSH:
* [oh-my-zsh](https://ohmyz.sh/)
* [powerlevel10k](https://github.com/romkatv/powerlevel10k)
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

Via NVM:
* [Node.js 20](https://nodejs.org/)
