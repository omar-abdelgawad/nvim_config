**This repo is supposed to used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!

# Custom

to use this config you can just clone it inside ~/.config with nvim name.

```bash
git clone https://github.com/omar-abdelgawad/nvim_config.git ~/config/nvim
```
and then open nvim to install dependencies automatically.

## notes for myself and things to do:

- remember that pyright install is ignored because it breaks with some versions of npm so I just gave up and installed it with uv
- nvchad requirements keeps changing so I found out that now tree sitter requires installing a cli using `cargo install --locked tree-sitter-cli`
- remember to have rust-analyzer installed for rustaceanvim plugin
- remember that you still need installers like npm, cargo and python for mason as it uses them for installing the lsps. for more info use `checkhealth mason`
- remember to have installed `rg` and `fd` for faster telesecope search. I installed them using `cargo install`
