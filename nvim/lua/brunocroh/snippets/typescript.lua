require("luasnip.session.snippet_collection").clear_snippets "typescriptreact"

local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require('luasnip.extras.fmt').fmt

local same = function(index, prefix)
  return f(function(arg)
    if type(arg[1][1]) == "string" then
      return prefix .. (arg[1][1]:gsub("^%l", string.upper))
    end
    return arg[1]
  end, { index })
end

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
    'try',
    fmt(
      [[
      try {{
        {1}
      }} catch({2}) {{
        {3}
      }}
      ]]
      , {
        i(1),
        i(2),
        i(3)
      })
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
    fmt('const [{1},{2}] = useState({3})', { i(1), same(1, "set"), i(3, "null") })
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
