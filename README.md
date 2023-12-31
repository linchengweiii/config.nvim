# neovim config

### Introduction

My own nvim config

### Installation

Requirements:
* Make sure to review the readmes of the plugins if you are experiencing errors. In particular:
  * [ripgrep](https://github.com/BurntSushi/ripgrep#installation) is required for multiple [telescope](https://github.com/nvim-telescope/telescope.nvim#suggested-dependencies) pickers.

Neovim's configurations are located under the following paths, depending on your OS:

| OS | PATH |
| :- | :--- |
| Linux | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| MacOS | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows | `%userprofile%\AppData\Local\nvim\` |

Clone config.nvim:

```sh
# on Linux and Mac
git clone https://github.com/linchengweiii/config.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
# on Windows
git clone https://github.com/linchengweiii/config.nvim.git %userprofile%\AppData\Local\nvim\ 
```

### Post Installation

Telescope.nvim:

- [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep) is required for
  `live_grep` and `grep_string` and is the first priority for `find_files`.

Run the following command and then **you are ready to go**!

```sh
nvim --headless "+Lazy! sync" +qa
```

