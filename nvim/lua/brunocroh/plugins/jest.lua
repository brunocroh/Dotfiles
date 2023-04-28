
require'nvim-jest'.setup({
  -- Jest executable
  -- By default finds jest in the relative project directory
  -- To override with an npm script, provide 'npm test --' or similar
  jest_cmd = 'JEST_DEBUG=true npm test --silent=false --coverage=false --',
  silent = true,
})
