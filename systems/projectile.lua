local Concord = require("lib.Concord")
local Vector = require("lib.hump.vector")
local Util = require("util")

local ProjectileSystem = Concord.system({
    pool = { "transform", "projectile" }
})

function ProjectileSystem:update(dt)
    for _, entity in ipairs(self.pool) do
        local transform = entity.transform

        transform.pos = transform.pos - entity.projectile.direction * entity.projectile.speed * dt
        transform.rotation = transform.rotation + 10.0 * dt

        local windowWidth, windowHeight = love.graphics.getDimensions()
        if transform.pos.y <= -transform.size.y / 2.0 or
            transform.pos.y >= windowHeight - transform.size.y / 2.0 then
            entity:destroy()
        end
    end
end

return ProjectileSystem
