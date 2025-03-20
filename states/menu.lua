local Gamestate = require("lib.hump.gamestate")
local States = require("states")
local World = require("world")

return function (state)
    local world = World()
    world.printEntities = true
    world:newEntity("BAM")

    function state:enter()
        print("enter menu state")
    end

    function state:update(dt)
        print("menu update!")
    end

    function state:draw()
        love.graphics.print("menu state", 0, 0)
        world:draw()
    end

    function state:keyreleased(key, scancode)
        if scancode == "space" then
            Gamestate.switch(States.game)
        end
    end
end
