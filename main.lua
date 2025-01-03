local html = require("templater")

local template = [[
    {{header}}
    {{content}}
    {{footer}}
]]

-- fill template
local filled = html.template(template, {
    header = html.h1("Welcome"),
    content = html.p("Hello World!"),
    footer = html.p("Copyright 2025")
})

-- create page
local page = html.page("Template Test", filled)

-- generates at './index.html'
html.write("index.html", page)
-- './index.html' ⬇️
-- <!DOCTYPE html>
-- <html>
-- <head>
--     <title>Template Test</title>
-- </head>
-- <body>
--     <h1>Welcome</h1>
--     <p>Hello World!</p>
--     <p>Copyright 2025</p>

-- </body>
-- </html>