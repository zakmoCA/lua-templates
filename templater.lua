local html = {}

-- el generator
function html.el(tag, content)
    if content == nil then
        content = ""
    end
    return string.format("<%s>%s</%s>\n", tag, content, tag) -- <tag>Content</tag>
end

function html.title(content)
    return html.el("title", content)
end

function html.head(content, title)
    local headContent = content .. "\n    " .. (title and html.title(title) or "")
    return string.format("<head>%s\n</head>", headContent)
end

function html.p(content)
    return html.el("p", content)
end

function html.h1(content)
    return html.el("h1", content)
end

-- main.lua template populator
function html.template(content, vars)
    local result = content
    for key, value in pairs(vars) do
        local indentedValue = value:gsub("^(.-)$", "    %1")
        result = result:gsub("{{" .. key .. "}}", indentedValue)
    end
    return result
end

function html.page(headContent, bodyContent)
    return string.format([[<!DOCTYPE html>
<html>
%s
<body>
%s
</body>
</html>]], headContent, bodyContent)
end

-- file writing
function html.write(filename, content)
    local file = io.open(filename, "w")
    if file then
        file:write(content)
        file:close()
        return true
    end
    return false
end

return html
