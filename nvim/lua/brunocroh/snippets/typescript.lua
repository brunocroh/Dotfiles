require("luasnip.session.snippet_collection").clear_snippets "typescript"

local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt
-- local rep = require('luasnip.extras').rep

ls.add_snippets("typescriptreact", {
  s(
    'cl',
    fmt('className="{}"', i(1))
  ),

  s(
    'useS',
    fmt('const [{},] = useState() ', i(1))
  ),

  s(
    'useE',
    fmt('useEffect(() => {{ {} }}, [])', i(1))
  ),

  s(
    'useC',
    fmt('useCallback(() => {{ {} }}, [])', i(1))
  ),
})
