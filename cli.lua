local cli = {}

function cli.displayPageContent(html)
    -- remove DOCTYPE and stock html structure ---> just want page cont
    local content = html:gsub("<!DOCTYPE[^>]*>", "")
        :gsub("<html[^>]*>", "")
        :gsub("</html>", "")
        :gsub("<title[^>]*>", "")
        :gsub("</title>", "")
        :gsub("<head[^>]*>", "")
        :gsub("</head>", "")
        :gsub("<body[^>]*>", "")
        :gsub("</body>", "")
    
    -- c basic html els to plain text
    content = content:gsub("<title>(.-)</title>", "%1\n")
    -- content = content:gsub("<head>(.-)</head>", "%1\n")
    content = content:gsub("<h1>(.-)</h1>", "%1\n")
    content = content:gsub("<p>(.-)</p>", "%1\n")
    
    print("Page Content Preview:")
    print(content)
end

return cli