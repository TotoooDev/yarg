-- vscode debugger stuff
if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

local Gamestate = require("lib.hump.gamestate")
local AudioRegistry = require("audioRegistry")
local States = require("states")
local MenuState = require("states.menu")
local GameState = require("states.game")
local GameOverState = require("states.gameOver")

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.graphics.setFont(love.graphics.newFont("assets/font/c64esque.ttf", 32.0))
    -- love.mouse.setGrabbed(true)
    -- love.mouse.setVisible(false)

    AudioRegistry.load()

    MenuState(States.menu)
    GameState(States.game)
    GameOverState(States.gameOver)

    Gamestate.registerEvents()
    Gamestate.switch(States.game)
end
