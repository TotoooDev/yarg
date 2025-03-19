local Concord = require("lib.Concord")
local Util = require("util")

local EnemySystem = Concord.system({
    enemyPool = { "transform", "enemy" },
    projectilePool = { "transform", "projectile" },
})

function EnemySystem:update(dt)
    for _, pEntity in ipairs(self.projectilePool) do
        for _, eEntity in ipairs(self.enemyPool) do
            local collision = Util.aabbCollision(
                pEntity.transform.pos,
                pEntity.transform.size,
                eEntity.transform.pos,
                eEntity.transform.size
            )

            if collision then
                pEntity:destroy()
                eEntity.enemy.hp = eEntity.enemy.hp - 1
            end
        end
    end
end

return EnemySystem
