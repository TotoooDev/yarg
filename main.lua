-- vscode debugger stuff
if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

local Vector = require("lib.hump.vector")
local World = require("world")
local Input = require("input")
local Player = require("assemblers.player")
local Enemy = require("assemblers.enemy")

local world

function love.load()
    world = World()

    Player(world:newEntity("player"))
    Enemy(world:newEntity("enemy"), 1, Vector(100.0, 100.0))
end

function love.update(dt)
    world:update(dt)
end

function love.draw()
    world:draw()
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
