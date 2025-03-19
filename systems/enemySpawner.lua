local Concord = require("lib.Concord")
local Vector = require("lib.hump.vector")
local Enemy = require("assemblers.enemy")

local waveLayouts = {
    {
        { 1, 1, 1, 1 },
        { 1, 1, 1, 1 },
    }
}

local EnemySpawnerSystem = Concord.system({
    pool = { "enemySpawner" }
})

function EnemySpawnerSystem:spawn()
    for _, entity in ipairs(self.pool) do
        local waveLayout = waveLayouts[entity.enemySpawner.wave]

        for y, line in ipairs(waveLayout) do
            for x, level in ipairs(line) do
                Enemy(
                    entity.world:newEntity("enemy"),
                    level,
                    Vector((x - 1) * 70.0, (y - 1) * 70.0)
                )
            end
        end
    end
end

return EnemySpawnerSystem
