local Timer = require("lib.hump.timer")
local lovebpm = require("lib.lovebpm")
local World = require("world")
local Input = require("input")
local Player = require("assemblers.player")

return function (state)
    love.graphics.setDefaultFilter("nearest", "nearest")

    local world = World()
    world.printEntities = true

    TRACK = lovebpm.newTrack()
        :load("assets/1408549_Rep.mp3")
        :setBPM(130)
        :play(true)
        :setVolume(0.0)
        :setTime(1.7)
        :on("beat", function () world.world:emit("onBeat") end)

    local spawner = world:newEntity("spawner")
        :give("enemySpawner")
    world.world:emit("spawn")

    Player(world:newEntity("player"))

    function state:enter()
        print("enter game state")
    end

    function state:update(dt)
        Timer.update(dt)
        TRACK:update()
        world:update(dt)
    end

    function state:draw()
        world:draw()
    end

    function state:keypressed(key, scancode, isrepeat)
        if scancode == "a" then Input.left  = true end
        if scancode == "d" then Input.right = true end
        if scancode == "space" then Input.shoot = true end
    end

    function state:keyreleased(key, scancode)
        if scancode == "a" then Input.left  = false end
        if scancode == "d" then Input.right = false end
        if scancode == "space" then Input.shoot = false end
    end
end
