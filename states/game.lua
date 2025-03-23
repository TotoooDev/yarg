local Timer = require("lib.hump.timer")
local Signal = require("lib.hump.signal")
local Gamestate = require("lib.hump.gamestate")
local World = require("world")
local Input = require("input")
local States = require("states")
local Score = require("score")
local ScoreAssembler = require("assemblers.score")
local Player = require("assemblers.player")

return function (state)
    local world
    local currentLevel
    local creditsAlpha = { 1.0 }

    function state:enter(_, level)
        Timer.after(2.0, function ()
            Timer.tween(
                1.0,
                creditsAlpha,
                { 0.0 }
            )
        end)

        Signal.register("levelOver", function (hasWin)
            local f = function (t)
                currentLevel.track:setVolume(t)
                return t
            end
            Timer.tween(2.0, {}, {}, Timer.tween.out(f), function ()
                -- currentLevel.track:stop()
                -- Gamestate.switch(States.gameOver, hasWin)
                love.event.quit()
            end)
        end)

        world = World()
        -- world.printEntities = true

        currentLevel = level
        currentLevel.track:play(true)
            :setBeat(currentLevel.startOnBeat)
            :on("beat", function (n) world.world:emit("onBeat", n) end)

        local function fadeIn (t)
            currentLevel.track:setVolume(t)
            return t
        end
        Timer.tween(2.0, {}, {}, fadeIn)

        world:newEntity("spawner")
            :give("enemySpawner", currentLevel)
            :give("beat")
        world.world:emit("spawn")

        world:newEntity("camera"):give("camera")

        ScoreAssembler(world:newEntity("score"))
        Player(world:newEntity("player"))

        Score.reset()
    end

    function state:leave()
        world.world:clear()

        Input.left = false
        Input.right = false
        Input.shoot = false
    end

    function state:update(dt)
        Timer.update(dt)
        currentLevel.track:update()
        world:update(dt)
    end

    function state:draw()
        world:draw()
        love.graphics.print({ { 1.0, 1.0, 1.0, creditsAlpha[1] }, "song: Socialize by Demonicity" }, 10, 0)
    end

    function state:keypressed(key, scancode, isrepeat)
        if scancode == "a" or scancode == "left"  then Input.left  = true end
        if scancode == "d" or scancode == "right" then Input.right = true end
        if scancode == "space" then Input.shoot = true end

        if scancode == "escape" then love.event.quit() end
    end

    function state:keyreleased(key, scancode)
        if scancode == "a" or scancode == "left"  then Input.left  = false end
        if scancode == "d" or scancode == "right" then Input.right = false end
        if scancode == "space" then Input.shoot = false end
    end

    function state:joystickpressed(joystick, button)
        Input.shoot = true
    end

    function state:joystickreleased(joystick, button)
        Input.shoot = false
    end

    function state:joystickaxis(joystick, axis, value)
        if axis == 1 then
            if value >= 0.1 then
                Input.right = true
            else
                Input.right = false
            end
            if value <= -0.1 then
                Input.left = true
            else
                Input.left = false
            end
        end
    end

    function state:addScore(n)
        score = score + n
    end

    function state:getScore()
        return score
    end
end
