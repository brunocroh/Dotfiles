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
})
