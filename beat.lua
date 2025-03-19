local Timer = require("lib.hump.timer")
local Vector = require("lib.hump.vector")

return function (entity, shrinkStrength, growStrength, time)
    local transform = entity.transform
    if transform == nil then return end

    shrinkStrength = shrinkStrength or 1.0
    growStrength = growStrength or 1.0
    time = time or 0.05

    local shrink
    local grow
    local normal

    shrink = function ()
        Timer.tween(time, transform, { scale = Vector(0.8 * 1 / shrinkStrength, 0.8 * 1 / shrinkStrength) }, "linear", grow)
    end
    grow = function ()
        Timer.tween(time, transform, { scale = Vector(1.0 * growStrength, 1.0 * growStrength) }, "linear", normal)
    end
    normal = function ()
        Timer.tween(time, transform, { scale = Vector(1.0, 1.0) }, "linear")
    end

    TRACK:on("beat", function ()
        shrink()
    end)
end
