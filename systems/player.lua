local Concord = require("lib.Concord")
local Vector = require("lib.hump.vector")
local Input = require("input")

local PlayerSystem = Concord.system({
    pool = { "transform", "ship", "player" }
})

local function move(entity, dt)
    local transform = entity.transform
    local windowWidth = love.graphics.getWidth()

    if Input.left and transform.pos.x - transform.size.x / 2 >= 0.0 then
        transform.pos.x = transform.pos.x - entity.ship.speed * dt
    end

    if Input.right and transform.pos.x + transform.size.x / 2 <= windowWidth then
        transform.pos.x = transform.pos.x + entity.ship.speed * dt
    end
end

function PlayerSystem:update(dt)
    for _, entity in ipairs(self.pool) do
        local transform = entity.transform
        local player = entity.player

        move(entity, dt)

        local canShoot = love.timer.getTime() - player.lastShoot >= player.cooldown and not player.overheating
        if Input.shoot and canShoot then
            entity.world:newEntity("projectile")
                :give("transform", transform.pos:clone(), nil, Vector(10.0, 32.0))
                :give("projectile")
                :give("drawable")

            -- overheat
            player.heat = player.heat + player.heatRate
            if player.heat >= player.overheatLimit then
                player.overheating = true
            end

            player.lastShoot = love.timer.getTime()
        end

        -- dissipate heat
        if player.heat >= 0.0 then
            player.heat = player.heat - player.overheatDissipationRate * dt
        end
        if player.heat < 0.0 then
            player.overheating = false
            player.heat = 0.0
        end
    end
end

return PlayerSystem
