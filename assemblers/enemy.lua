local Timer = require("lib.hump.timer")
local Vector = require("lib.hump.vector")

return function (entity, level, pos)
    entity:give("enemy", level)
        :give("ship")
        :give("drawable")

    if pos then
        entity.transform.pos = pos:clone()
    else
        entity.transform.pos = Vector(0.0, 0.0)
    end

    local transform = entity.transform
    local wait
    local shrink
    local grow

    wait = function ()
        Timer.after(love.math.random(0.5, 1.5), shrink)
    end
    shrink = function ()
        Timer.tween(0.1, transform, { scale = Vector(0.8, 0.8) }, "linear", grow)
    end
    grow = function ()
        Timer.tween(0.1, transform, { scale = Vector(1.0, 1.0) }, "linear", wait)
    end

    wait()

    return entity
end
