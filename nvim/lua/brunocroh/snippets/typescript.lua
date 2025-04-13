require("luasnip.session.snippet_collection").clear_snippets "typescript"

local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets("typescriptreact", {
  s(
    'cl',
    fmt('className="{}"', i(1))
  ),

  s(
    'frag',
    fmt('<>{1}</>{2}', { i(1), i(2) })
  ),

  s(
    'log',
    fmt("console.log({{{1}: {2}}})", { i(1), i(2) })
  ),

  s(
    'afn',
    fmt(
      [[
      const {1} = () => {{
        {2}
      }}
      ]]
      , {
        i(1),
        i(2)
      })
  ),

  s(
    'af',
    fmt(
      [[
      () => {{
        {1}
      }}
      ]]
      ,
      i(1)
    )
  ),

  s(
    'useState',
    fmt('const [{},] = useState() ', i(1))
  ),

  s(
    'useEffect',
    fmt('useEffect(() => {{ {} }}, [])', i(1))
  ),

  s(
    'useCallback',
    fmt('useCallback(() => {{ {} }}, [])', i(1))
  ),

  s(
    'useMemo',
    fmt('useMemo(() => {{ {} }}, [])', i(1))
  ),
})
