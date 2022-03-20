-- Nvim-tree
local ok, nvimtree = pcall(require, "nvim-tree")
if not ok then
  return
end

nvimtree.setup {
  options = {
    nvim_tree_gitignore = 1,
    nvim_tree_refresh_wait = 500,
    nvim_tree_highlight_opened_files = 1,
    nvim_tree_add_trailing = 1,
    nvim_tree_show_icons = {
      ['git'] = 1,
      ['folders'] = 0,
      ['files'] = 0
    }
  }
}
