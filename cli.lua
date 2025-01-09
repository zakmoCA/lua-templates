local cli = {}

function cli.displayPageContent(html)
    -- remove DOCTYPE and basic HTML structure
    local content = html:gsub("<!DOCTYPE[^>]*>", ""):gsub("<html[^>]*>", ""):gsub("</html>", ""):gsub("<body[^>]*>", "")
        :gsub("</body>", ""):gsub("<head>(.-)<title>(.-)</title>(.-)</head>", "%1%2%3\n") -- extract content inside <head> and <title>

    -- convert html els to plain text
    content = content:gsub("<h1>(.-)</h1>", "%1\n"):gsub("<p>(.-)</p>", "%1\n"):gsub("<[^>]+>", "")

    print("Page Content Preview:")
    print(content)
end

function cli.displayMarkup(html)
    -- indent it up
    local formatted = html:gsub(">%s*<", ">\n<")
    local indent = 0
    local indented = {}

    for line in formatted:gmatch("[^\n]+") do
        if line:match("^%s*</") then
            indent = math.max(0, indent - 2)
        end
        table.insert(indented, string.rep(" ", indent) .. line)
        if line:match("<[^/][^>]*[^/]>$") then
            indent = indent + 2
        end
    end

    print("\nMarkup:\n" .. table.concat(indented, "\n") .. "\n")
end

return cli
