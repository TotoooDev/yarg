local Timer = require("lib.hump.timer")
local Signal = require("lib.hump.signal")
local Gamestate = require("lib.hump.gamestate")
local lovebpm = require("lib.lovebpm")
local AudioRegistry = require("audioRegistry")
local World = require("world")
local Input = require("input")
local States = require("states")
local Score = require("score")
local ScoreAssembler = require("assemblers.score")
local Player = require("assemblers.player")

return function (state)
    local world
    local track

    function state:enter()
        Signal.register("levelOver", function (hasWin)
            local f = function (t)
                track:setVolume(t)
                return t
            end
            local foo = { foo = 1 }
            Timer.tween(2.0, foo, { foo = 2 }, Timer.tween.out(f), function () Gamestate.switch(States.gameOver, hasWin) end)
        end)

        world = World()
        -- world.printEntities = true

        track = lovebpm.newTrack()
            :load(AudioRegistry.music.rep)
            :setBPM(130)
            -- :setBeat(4)
            :play(true)
            -- :setVolume(0.0)
            :on("beat", function (n) world.world:emit("onBeat", n) end)
        AudioRegistry.setCurrentBPM(130)

        world:newEntity("spawner")
            :give("enemySpawner")
            :give("beat")
        world.world:emit("spawn")

        ScoreAssembler(world:newEntity("score"))
        Player(world:newEntity("player"))

        Score.reset()
    end

    function state:leave()
        Input.left = false
        Input.right = false
        Input.shoot = false
    end

    function state:update(dt)
        Timer.update(dt)
        track:update()
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

    function state:addScore(n)
        score = score + n
    end

    function state:getScore()
        return score
    end
end
