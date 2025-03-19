local Concord = require("lib.Concord")
local Vector = require("lib.hump.vector")
local Input = require("input")

local PlayerSystem = Concord.system({
    pool = { "transform", "ship", "player" }
})

function PlayerSystem:update(dt)
    for _, entity in ipairs(self.pool) do
        local transform = entity.transform
        local player = entity.player

        if Input.left then
            transform.pos.x = transform.pos.x - entity.ship.speed * dt
        end

        if Input.right then
            transform.pos.x = transform.pos.x + entity.ship.speed * dt
        end

        if Input.shoot and love.timer.getTime() - player.lastShoot >= player.cooldown then
            if not player.overheating then
                entity.world:newEntity("projectile")
                    :give("transform", transform.pos:clone())
                    :give("projectile")
                    :give("drawable")

                -- overheat
                player.heat = player.heat + player.heatRate
                if player.heat >= player.overheatLimit then
                    player.overheating = true
                end

                player.lastShoot = love.timer.getTime()
            end
        else
            -- dissipate heat
            if player.heat >= 0.0 then
                player.heat = player.heat - player.overheatDissipationRate * dt
            end
            if player.heat < 0.0 then
                player.overheating = false
                player.heat = 0.0
            end
        end

        print(player.heat)
    end
end

return PlayerSystem
