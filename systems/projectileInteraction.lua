local Concord = require("lib.Concord")
local Util = require("util")

local EnemySystem = Concord.system({
    playerPool = { "transform", "player" },
    enemyPool = { "transform", "enemy" },
    projectilePool = { "transform", "projectile" },
})

function EnemySystem:update(dt)
    for _, pEntity in ipairs(self.projectilePool) do
        for _, plEntity in ipairs(self.playerPool) do
            local collision = Util.aabbCollision(
                pEntity.transform.pos,
                pEntity.transform.size,
                plEntity.transform.pos,
                plEntity.transform.size
            )

            if collision and pEntity.projectile.enemy then
                print("HAHAHAHAH")
                pEntity:destroy()
                plEntity.player.hp = plEntity.player.hp - 1
            end
        end

        for _, eEntity in ipairs(self.enemyPool) do
            local collision = Util.aabbCollision(
                pEntity.transform.pos,
                pEntity.transform.size,
                eEntity.transform.pos,
                eEntity.transform.size
            )

            if collision and not pEntity.projectile.enemy then
                pEntity:destroy()
                eEntity.enemy.hp = eEntity.enemy.hp - 1
            end
        end
    end
end

return EnemySystem
