
source $NVIM_ROOT/general/settings.vim

if exists('g:vscode')
  " VS Code extension
  "source $HOME/.config/nvim/vscode/settings.vim
  "source $HOME/.config/nvim/plug-config/easymotion.vim
else
  source $NVIM_ROOT/keys/mappings.vim
  source $NVIM_ROOT/plugins/plugins.vim
  source $NVIM_ROOT/themes/sonokai.vim
  "source $NVIM_ROOT/themes/onedark.vim
  "source $NVIM_ROOT/themes/palenight.vim
  source $NVIM_ROOT/themes/airline.vim
  source $NVIM_ROOT/plug-config/coc.vim
  source $NVIM_ROOT/plug-config/fzf.vim
  source $NVIM_ROOT/plug-config/nerdtree.vim
  source $NVIM_ROOT/plug-config/neoterm.vim
  source $NVIM_ROOT/plug-config/signify.vim
  source $NVIM_ROOT/plug-config/scroll.vim
endif

lua <<EOF

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,
    use_languagetree = false, -- Use this to enable language injection (this is very unstable)
    custom_captures = {
      -- Highlight the @foo.bar capture group with the “Identifier” highlight group.
      ["@todo"] = "Identifier",
    },
  },
}
EOF

