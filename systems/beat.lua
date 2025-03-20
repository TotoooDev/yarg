local Concord = require("lib.Concord")
local Timer = require("lib.hump.timer")
local Vector = require("lib.hump.vector")

local BeatSystem = Concord.system({
    pool = { "transform", "beat" }
})


function BeatSystem:onBeat()
    for _, entity in ipairs(self.pool) do
        local transform = entity.transform
        local beat = entity.beat

        local shrink
        local grow
        local normal

        shrink = function ()
            Timer.tween(beat.time, transform, { scale = Vector(0.8 * 1 / beat.shrinkStrength, 0.8 * 1 / beat.shrinkStrength) }, "linear", grow)
        end
        grow = function ()
            Timer.tween(beat.time, transform, { scale = Vector(1.0 * beat.growStrength, 1.0 * beat.growStrength) }, "linear", normal)
        end
        normal = function ()
            Timer.tween(beat.time, transform, { scale = Vector(1.0, 1.0) }, "linear")
        end

        shrink()
        beat.func()
    end
end

return BeatSystem
