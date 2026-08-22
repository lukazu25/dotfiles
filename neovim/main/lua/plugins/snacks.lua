return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = { enabled = true },
    explorer = { enabled = true },
    statuscolumn = { enabled = true },
    dashboard = {
      enabled = true,
      sections = {
        { section = "header" }, 
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
      
      preset = {
        header = [[
      ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ 
      ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ 
      ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ 
      ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ 
      ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ 
      ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ 
        ]],
        
        keys = {
          { icon = " ", key = "e", desc = "New file", action = ":ene | startinsert" },
          { icon = " ", key = "f", desc = "Find file", action = ":lua Snacks.picker.files()" },
          { icon = " ", key = "r", desc = "Recent", action = ":lua Snacks.picker.recent()" },
          { icon = " ", key = "s", desc = "Settings", action = ":lua Snacks.explorer({cwd = '~/.config/nvim'})" },
          { icon = "󰩈 ", key = "q", desc = "Quit NVIM", action = ":qa" },
        },
      },
    },
  },
  keys = {
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Find Buffers" },
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Live Grep" },
    { "<leader>fh", function() Snacks.picker.help() end, desc = "Help Tags" },
    { "<leader>e",  function() Snacks.explorer() end, desc = "File Explorer" },
  },
}
