local html = {}

-- html el generator
function html.el(tag, content)
    if content == nil then content = "" end
    return string.format("<%s>%s</%s>", tag, content, tag) -- <tag>Content</tag>
end

-- basic els
function html.title(content) return html.el("title", content) end
function html.head(content) return html.el("head", content) end
function html.p(content) return html.el("p", content) end
function html.h1(content) return html.el("h1", content) end

function html.template(content, vars)
    local result = content
    for key, value in pairs(vars) do
        result = result:gsub("{{" .. key .. "}}", value) -- strip
    end
    return result
end

function html.page(title, body)
  return string.format([[
<!DOCTYPE html>
<html>
%s
<body>
%s
</body>
</html>]], title, body)
end

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