local Concord = require("lib.Concord")

local EnemySystem = Concord.system({
    pool = { "transform", "enemy" }
})

function EnemySystem:update(dt)
    for _, entity in ipairs(self.pool) do
        if entity.enemy.hp <= 0 then
            entity:destroy() -- YOU SHOULD KILL YOURSELF, NOW!
        end
    end
end

return EnemySystem
