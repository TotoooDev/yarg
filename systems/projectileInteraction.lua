local Concord = require("lib.Concord")
local Score = require("score")
local Util = require("util")

local EnemySystem = Concord.system({
    playerPool = { "transform", "player", "rectangleShape" },
    enemyPool = { "transform", "enemy", "rectangleShape" },
    projectilePool = { "transform", "projectile", "rectangleShape" },
})

function EnemySystem:update(dt)
    for _, pEntity in ipairs(self.projectilePool) do
        for _, plEntity in ipairs(self.playerPool) do
            local collision = Util.aabbCollision(
                pEntity.transform.pos,
                pEntity.rectangleShape.size,
                plEntity.transform.pos,
                plEntity.rectangleShape.size
            )

            if collision and pEntity.projectile.enemy then
                pEntity.world:emit("cameraShake", 0.2)
                pEntity:destroy()
                plEntity.player.hp = plEntity.player.hp - 1
            end
        end

        for _, eEntity in ipairs(self.enemyPool) do
            local collision = Util.aabbCollision(
                pEntity.transform.pos,
                pEntity.rectangleShape.size,
                eEntity.transform.pos,
                eEntity.rectangleShape.size
            )

            if collision and not pEntity.projectile.enemy and not eEntity.enemy.isDying then
                pEntity:destroy()
                eEntity.enemy.hp = eEntity.enemy.hp - 1
            end
        end

        for _, ppEntity in ipairs(self.projectilePool) do
            if pEntity ~= ppEntity then
                local collision = Util.aabbCollision(
                    pEntity.transform.pos,
                    pEntity.rectangleShape.size,
                    ppEntity.transform.pos,
                    ppEntity.rectangleShape.size
                )

                if collision then
                    pEntity:destroy()
                    ppEntity:destroy()

                    Score.add(Score.Values.projectileDead)
                end
            end
        end
    end
end

return EnemySystem
