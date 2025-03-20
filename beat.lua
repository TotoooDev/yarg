local Timer = require("lib.hump.timer")
local Vector = require("lib.hump.vector")

return function (entity, config)
    local transform = entity.transform
    if transform == nil then return end

    config = config or {}
    config = {
        func = config.func or function () end,
        time = config.time or 0.05,
        shrinkStrength = config.shrinkStrength or 1.0,
        growStrength = config.growStrength or 1.0,
    }

    local shrink
    local grow
    local normal

    shrink = function ()
        Timer.tween(config.time, transform, { scale = Vector(0.8 * 1 / config.shrinkStrength, 0.8 * 1 / config.shrinkStrength) }, "linear", grow)
    end
    grow = function ()
        Timer.tween(config.time, transform, { scale = Vector(1.0 * config.growStrength, 1.0 * config.growStrength) }, "linear", normal)
    end
    normal = function ()
        Timer.tween(config.time, transform, { scale = Vector(1.0, 1.0) }, "linear")
    end

    TRACK:on("beat", function ()
        shrink()
        config.func()
    end)
end
