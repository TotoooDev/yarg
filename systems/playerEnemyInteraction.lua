local Concord = require("lib.Concord")
local Util = require("util")

local PlayerEnemyInteractionSystem = Concord.system({
    playerPool = { "transform", "player" },
    enemyPool = { "transform", "enemy" }
})

function PlayerEnemyInteractionSystem:update(dt)
    for _, eEntity in ipairs(self.enemyPool) do
        for _, pEntity in ipairs(self.playerPool) do
            local collision = Util.aabbCollision(
                eEntity.transform.pos,
                eEntity.transform.size,
                pEntity.transform.pos,
                pEntity.transform.size
            )

            if collision then
                eEntity:destroy()
                pEntity.player.hp = pEntity.player.hp - 1
            end
        end
    end
end

return PlayerEnemyInteractionSystem
