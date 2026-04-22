local colors = {
  -- Deep Forest Teal: Balanced for contrast and comfort
  background = "#0b1614", 
  -- Original warm sand text
  text       = "#d0b892",
  -- Keywords (brighter off-white)
  keyword_hi = "#e6d5c5", 
  -- Primitives (numbers, booleans, null)
  primitive  = "#d58853", 
  -- Strings (Original bright green)
  string     = "#53d549",
  -- Comments (Darker, muted green)
  comment    = "#3a7a35",

  type = "#84f5f1";

  -- UI
  highlight  = "#1a2a26",
  line_fg    = "#354a44",
}

vim.cmd("highlight clear")
vim.o.background = "dark"
vim.g.colors_name = "onecolor"

local set = vim.api.nvim_set_hl

-- UI
set(0, "Normal",      { fg = colors.text, bg = colors.background })
set(0, "CursorLine",  { bg = colors.highlight })
set(0, "LineNr",      { fg = colors.line_fg })
set(0, "CursorLineNr",{ fg = colors.text })

-- 1. Uniform Base (Defaults to text color)
local uniform = {
  "Identifier", "Function", "Statement", "Keyword",
  "Type", "Constant", "Operator", "PreProc",
  "Macro", "Typedef", "@variable",
  "@parameter", "@field", "@property", "@type",
  "@function", "@keyword", "@constant"
}

for _, group in ipairs(uniform) do
  set(0, group, { fg = colors.text })
end

-- 2. Keywords
set(0, "Keyword",   { fg = colors.keyword_hi })
set(0, "Statement", { fg = colors.keyword_hi })
set(0, "@keyword",  { fg = colors.keyword_hi })

-- 3. Primitives
local primitives = {
  "Number", "Boolean", "Float",
  "@number", "@boolean", "@null"
}
for _, group in ipairs(primitives) do
  set(0, group, { fg = colors.primitive })
end


set(0, "@type", { fg = colors.type })

-- 4. Strings and Characters ('A', 'c')
-- Treating Character as a String for that consistent green pop
local strings = {
  "String", "Character", 
  "@string", "@character"
}
for _, group in ipairs(strings) do
  set(0, group, { fg = colors.string })
end

-- 5. Comments
set(0, "Comment",   { fg = colors.comment, italic = true })
set(0, "@comment",  { fg = colors.comment, italic = true })
