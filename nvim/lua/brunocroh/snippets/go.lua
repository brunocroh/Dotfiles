require("luasnip.session.snippet_collection").clear_snippets "go"

local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets("go", {
  s(
    'err',
    fmt([[if err != nil {{
        {}
}}]], i(1))
  ),

  s(
    'if',
    fmt(
      [[
      if {1} {{
        {2}
      }}
      ]]
      , {
        i(1),
        i(2)
      })
  ),

  s(
    'fn',
    fmt(
      [[
      func ({1}) {2}() {{
        {3}

      }}
      ]]
      , {
        i(1),
        i(2),
        i(3)
      })
  ),
})
