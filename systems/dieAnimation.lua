local Concord = require("lib.Concord")
local Timer = require("lib.hump.timer")
local Vector = require("lib.hump.vector")

local DieAnimationSystem = Concord.system({
    pool = { "transform", "dieAnimation" }
})

function DieAnimationSystem:doDieAnimation()
    for _, entity in ipairs(self.pool) do
        local animation = entity.dieAnimation
        if not animation.doAnimation then
            goto continue
        end

        if not animation.isDying then
            animation.isDying = true

            Timer.tween(
                animation.time,
                entity.transform,
                { scale = Vector(0.0, 0.0) },
                "in-back",
                function ()
                    animation.isDying = false
                    animation.doAnimation = false
                    entity.world:emit("dieAnimationOver")
                end
            )
        end

        ::continue::
    end
end

return DieAnimationSystem
