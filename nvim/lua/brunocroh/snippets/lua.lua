require("luasnip.session.snippet_collection").clear_snippets "lua"

local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

ls.add_snippets("lua", {
  s(
    "lovei",
    fmt(
      [[
      {1} = {{}}

      function {2}:load()
        {5}
      end

      function {3}:update(dt)
        {6}
      end

      function {4}:draw()
        {7}
      end
    ]], {
        i(1, "love"),
        rep(1),
        rep(1),
        rep(1),
        i(2),
        i(3),
        i(0),
      })
  ),

  s(
    'req',
    fmt("require('{}')", i(1))
  ),

})

