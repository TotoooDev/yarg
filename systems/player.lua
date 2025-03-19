local Concord = require("lib.Concord")
local Vector = require("lib.hump.vector")
local Input = require("input")

local PlayerSystem = Concord.system({
    pool = { "transform", "ship", "player" }
})

function PlayerSystem:update(dt)
    for _, entity in ipairs(self.pool) do
        if Input.left then
            entity.transform.pos.x = entity.transform.pos.x - entity.ship.speed * dt
        end

        if Input.right then
            entity.transform.pos.x = entity.transform.pos.x + entity.ship.speed * dt
        end

        if Input.shoot and love.timer.getTime() - entity.player.lastShoot >= entity.player.cooldown then
            entity.world:newEntity("projectile")
                :give("transform", entity.transform.pos:clone())
                :give("projectile")
                :give("drawable")

            entity.player.lastShoot = love.timer.getTime()
        end
    end
end

return PlayerSystem
