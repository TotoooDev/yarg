-- vscode debugger stuff
if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

local Input = require("input")

function love.draw()
    love.graphics.print("SHMUP")
end

function love.keypressed(key, scancode, isrepeat)
    if scancode == "a" then Input.left  = true end
    if scancode == "d" then Input.right = true end
    if scancode == "space" then Input.shoot = true end
end

function love.keyreleased(key, scancode)
    if scancode == "a" then Input.left  = false end
    if scancode == "d" then Input.right = false end
    if scancode == "space" then Input.shoot = false end
end
