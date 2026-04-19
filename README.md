readme_content = """# vim-yankref

A minimal, unintrusive Vim plugin that extracts your current filename and selected line numbers, formats them as a reference string, and writes them directly to your system clipboard.

## Features

- **Visual Mode:** Select text to copy the filename and line range `@{filename} ({startLine}:{endLine})`.
- **Normal Mode:** Trigger without a selection to copy just the filename `@{filename}`.
- **Clipboard Native:** Writes directly to the system clipboard (`+` register) for immediate pasting outside of Vim.
- **No Default Mappings:** Exposes `<Plug>` targets instead of hardcoding mappings, ensuring zero conflicts with your existing configuration.

## Requirements

Your Vim or Neovim environment must be compiled with clipboard support. You can verify this by running:
```vim
:echo has('clipboard')
```
If it returns `1`, you are ready. If it returns `0`, you need to install a clipboard provider (like `xclip` or `wl-clipboard` on Linux) or use a Vim build with `+clipboard`.


## Installation
Vim 8+ Native Packages

Clone or download the file into your package directory:

```bash
mkdir -p ~/.vim/pack/plugins/start/yank_ref/plugin
curl -L [https://raw.githubusercontent.com/YOUR_USERNAME/vim-yankref/main/plugin/yank_ref.vim](https://raw.githubusercontent.com/YOUR_USERNAME/vim-yankref/main/plugin/yank_ref.vim) -o ~/.vim/pack/plugins/start/yank_ref/plugin/yank_ref.vim
```

*(For Neovim, replace `~/.vim` with `~/.config/nvim)`*

## vim-plug
Add this to your `virmrc` or `init.vim`:

```vim
Plug 'webduvet/vim-yankref'
```
Then run `:PlugInstall`.

## Configuration
This plugin does not map any keys by default. You must bind the exposed `<Plug>` targets in your `vimrc` or `init.vim`.

Add the following configuration, adjusting `<leader>a` to your preferred key combination:
```vim
" Map Normal mode trigger (Filename only)
nmap <leader>a <Plug>(YankRefNormal)

" Map Visual mode trigger (Filename + Line range)
xmap <leader>a <Plug>(YankRefVisual)
```

## Commands

If you prefer to trigger the functions via the command line or use them in your own scripts, the following commands are exposed:

- `:YankRefNormal` - Copies `@{filename}` to clipboard.

- `:'<,'>YankRefVisual` - Copies `@{filename} ({startLine}:{endLine})` to clipboard.
