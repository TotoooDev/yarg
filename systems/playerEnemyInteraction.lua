local Concord = require("lib.Concord")
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

            if collision then
                eEntity:destroy()
                pEntity.player.hp = pEntity.player.hp - 1
            end
        end
    end
end

return PlayerEnemyInteractionSystem
