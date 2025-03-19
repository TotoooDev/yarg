-- vscode debugger stuff
if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

function love.draw()
    love.graphics.print("SHMUP")
end
