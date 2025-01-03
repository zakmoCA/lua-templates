local html = require("templater")
local cli = require("cli")

local headerTemplate = [[
    {{head}}
    {{title}}
]]

local filledHeader = html.template(headerTemplate, {
  head = html.head("This is a head el"),
  title = html.title("This is a title el"),
})


local bodyTemplate = [[
    {{h1}}
    {{p}}
]]

-- fill template
local filledBody = html.template(bodyTemplate, {
    h1 = html.h1("This is a h1 el"),
    p = html.p("This is a p el"),
})

-- create page
local page = html.page(filledHeader, filledBody)

-- generates at './index.html'
html.write("index.html", page)
-- './index.html' ⬇️
-- <!DOCTYPE html>
-- <html>
--     <head>This is a head el</head>
--     <title>This is a title el</title>

-- <body>
--     <h1>This is a h1 el</h1>
--     <p>This is a p el</p>

-- </body>
-- </html>


-- display page content in terminal
cli.displayPageContent(page)
-- Page Content Preview:


--     This is a head el
--     This is a title el


--     This is a h1 el

--     This is a p el

