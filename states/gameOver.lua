local Gamestate = require("lib.hump.gamestate")
local States = require("states")

return function (state)
    local str = ""

    function state:enter(_, hasWin)
        if hasWin then
            str = "you win"
        else
            str = "you lose"
        end
    end

    function state:draw()
        love.graphics.print(str, 0, 0)
        love.graphics.print("press space to return to menu", 0, 32)
    end

    function state:keypressed(_, scancode)
        if scancode == "space" then
            Gamestate.switch(States.menu)
        end
    end
end
