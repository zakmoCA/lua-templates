local function openWithLiveServer()
    local os_name = io.popen("uname -s"):read("*l")

    local check_cmd = "lsof -i :5500"

    -- try server process
    local live_server_running = os.execute(check_cmd .. " > /dev/null 2>&1")

    if not live_server_running then
        local commands = {
            Linux = "code . && code --goto index.html",
            Darwin = "code . && code --goto index.html", -- macOS
            Windows_NT = "code . && code --goto index.html"
        }

        local command = commands[os_name] or commands["Linux"]
        os.execute(command)
        print("Opening VS Code with index.html...")
        print("Please click 'Go Live' in the VS Code status bar to start Live Server")
    else
        print("Live Server already running on port 5500")
    end
end

return {
    openWithLiveServer = openWithLiveServer
}
