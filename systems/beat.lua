local Concord = require("lib.Concord")
local Timer = require("lib.hump.timer")
local Vector = require("lib.hump.vector")

local BeatSystem = Concord.system({
    pool = { "transform", "beat" }
})

function BeatSystem:onBeat()
    for _, entity in ipairs(self.pool) do
        local transform = entity.transform
        local scale = transform.scale:clone()
        local beat = entity.beat

        if not beat.doAnimation then
            return
        end

        local shrink
        local grow
        local normal

        shrink = function ()
            local target = scale:clone()
            target = target * 0.8 * 1 / beat.shrinkStrength
            Timer.tween(beat.time, transform, { scale = target:clone() }, "linear", grow)
        end
        grow = function ()
            local target = scale:clone()
            target = target * beat.growStrength
            Timer.tween(beat.time, transform, { scale = target:clone() }, "linear", normal)
        end
        normal = function ()
            local target = scale:clone()
            Timer.tween(beat.time, transform, { scale = target:clone() }, "linear")
        end

        shrink()
    end
end

return BeatSystem
