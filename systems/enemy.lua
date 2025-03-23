local Concord = require("lib.Concord")
local Vector = require("lib.hump.vector")
local Timer = require("lib.hump.timer")
local Score = require("score")
local Projectile = require("assemblers.projectile")

local EnemySystem = Concord.system({
    pool = { "transform", "enemy", "dieAnimation" }
})

function EnemySystem:update(dt)
    for _, entity in ipairs(self.pool) do
        if entity.enemy.hp <= 0 then
            entity.enemy.isDying = true
            entity.dieAnimation.doAnimation = true
            entity.world:emit("doDieAnimation")
        end
    end
end

function EnemySystem:onBeat(n)
    for _, entity in ipairs(self.pool) do
        if love.math.random() < entity.enemy.projectileProbability then
            -- Projectile(
            --     entity.world:newEntity("projectile"),
            --     entity.transform.pos:clone(),
            --     Vector(0.0, -1.0),
            --     true
            -- )
        end
    end
end

function EnemySystem:dive()
    for _, entity in ipairs(self.pool) do
        Timer.tween(
            0.3,
            entity.transform,
            { pos = Vector(entity.transform.pos.x, love.graphics.getHeight() + entity.rectangleShape.size.y) },
            "in-back",
            function ()
                entity.world:emit("onEnemyDead")
                entity:destroy()
            end
        )
        entity.enemy.diving = true
    end
end

function EnemySystem:dieAnimationOver()
    for _, entity in ipairs(self.pool) do
        if entity.enemy.hp <= 0 then
            entity.world:emit("onEnemyDead")
            entity:destroy() -- YOU SHOULD KILL YOURSELF, NOW!

            if entity.enemy.diving then
                Score.add(Score.Values.enemyDeadWhileDiving)
            else
                Score.add(Score.Values.enemyDead)
            end
        end
    end
end

return EnemySystem
