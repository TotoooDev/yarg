local Concord = require("lib.Concord")
local Vector = require("lib.hump.vector")
local Timer = require("lib.hump.timer")

local SpawnAnimationSystem = Concord.system({
    pool = { "transform", "spawnAnimation" },
})

-- copy-pasted from hump.timer
local function custom(s)
    local amp = 1.0
    local period = 0.6
    return (-amp * math.sin(2*math.pi/period * (s-1) - math.asin(1/amp/2))) * 2^(10*(s-1))
end

function SpawnAnimationSystem:update(dt)
    for _, entity in ipairs(self.pool) do
        if not entity.spawnAnimation.isSpawning then
            entity.spawnAnimation.isSpawning = true

            local transform = entity.transform
            local targetPos = transform.pos:clone()
            transform.pos.y = transform.pos.y - 600.0
            Timer.tween(
                1.0,
                transform,
                { pos = targetPos },
                Timer.tween.out(custom)
            )
            Timer.tween(
                0.5,
                transform,
                { rotation = math.rad(360) },
                "out-cubic"
            )
        end
    end
end

return SpawnAnimationSystem
