local Concord = require("lib.Concord")

local ProjectileSystem = Concord.system({
    pool = { "transform", "projectile" }
})

function ProjectileSystem:update(dt)
    for _, entity in ipairs(self.pool) do
        entity.transform.pos.y = entity.transform.pos.y - entity.projectile.speed * dt

        if entity.transform.pos.y <= -entity.transform.size.y / 2.0 then
            entity:destroy()
        end
    end
end

return ProjectileSystem
