local html = require("templater")
local cli = require("cli")
local dev = require("dev")

local headContent = html.head("This is a head el", "This is a title el")

local bodyContent = html.template([[{{h1}} {{p}}]], {
    h1 = html.h1("This is a h1 el"),
    p = html.p("This is a p el")
})

local pageContent = html.page(headContent, bodyContent)

html.write("index.html", pageContent)

-- display page content/markup in terminal
cli.displayPageContent(pageContent)
cli.displayMarkup(pageContent)

dev.openWithLiveServer()

-- ⬇️ generated page content with cli.displayPageContent(pageContent)

-- This is a title el

-- This is a head el

-- This is a h1 el

-- This is a p el

-- ⬇️ generated markup with cli.displayMarkup(pageContent)
--  <!DOCTYPE html>
--    <html>
--      <head>
--        <title>This is a title el</title>
--        This is a head el
--      </head>
--      <body>
--        <h1>This is a h1 el</h1>
--        <p>This is a p el</p>
--      </body>
--    </html>

