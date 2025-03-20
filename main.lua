-- vscode debugger stuff
if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

local Gamestate = require("lib.hump.gamestate")
local States = require("states")
local MenuState = require("states.menu")
local GameState = require("states.game")
local GameOverState = require("states.gameOver")

function love.load()
    MenuState(States.menu)
    GameState(States.game)
    GameOverState(States.gameOver)

    Gamestate.registerEvents()
    Gamestate.switch(States.game)
end
