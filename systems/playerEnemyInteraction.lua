local Concord = require("lib.Concord")
local Signal = require("lib.hump.signal")
local Util = require("util")

local PlayerEnemyInteractionSystem = Concord.system({
    playerPool = { "transform", "player", "rectangleShape" },
    enemyPool = { "transform", "enemy", "rectangleShape" }
})

function PlayerEnemyInteractionSystem:update(dt)
    for _, eEntity in ipairs(self.enemyPool) do
        for _, pEntity in ipairs(self.playerPool) do
            local collision = Util.aabbCollision(
                eEntity.transform.pos,
                eEntity.rectangleShape.size,
                pEntity.transform.pos,
                pEntity.rectangleShape.size
            )

            if collision and not eEntity.enemy.isDying then
                pEntity.world:emit("cameraShake", 0.2)
                Signal.emit("levelOver", false)
                pEntity.world:emit("playerDie")
                eEntity:destroy()
            end
        end
    end
end

return PlayerEnemyInteractionSystem
