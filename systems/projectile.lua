local Concord = require("lib.Concord")
local Vector = require("lib.hump.vector")
local Util = require("util")

local ProjectileSystem = Concord.system({
    pool = { "transform", "projectile" }
})

function ProjectileSystem:update(dt)
    for _, entity in ipairs(self.pool) do
        entity.transform.pos.y = entity.transform.pos.y - entity.projectile.speed * dt
        entity.transform.rotation = entity.transform.rotation + 10.0 * dt
        entity.transform.scale = Vector(1.0, 1.0) * Util.sinBetween(love.timer.getTime() * 50.0, 0.8, 1.0)

        if entity.transform.pos.y <= -entity.transform.size.y / 2.0 then
            entity:destroy()
        end
    end
end

return ProjectileSystem
