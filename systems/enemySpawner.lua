local Concord = require("lib.Concord")
local Vector = require("lib.hump.vector")
local Enemy = require("assemblers.enemy")

local waveLayouts = {
    {
        { 1, 1, 1, 1, 1 },
        { 1, 1, 1, 1, 1 },
    }
}

local EnemySpawnerSystem = Concord.system({
    pool = { "enemySpawner" }
})

function EnemySpawnerSystem:spawn()
    local enemyPadding = 8

    for _, entity in ipairs(self.pool) do
        local waveLayout = waveLayouts[entity.enemySpawner.wave]

        for y, line in ipairs(waveLayout) do
            for x, level in ipairs(line) do
                local enemy = Enemy(entity.world:newEntity("enemy"), level)
                -- this works and i don't know why
                local initialX = love.graphics.getWidth() / 2 - #line * (enemy.transform.size.x + enemyPadding) / 2 + enemy.transform.size.x / 2 + enemyPadding / 2
                enemy.transform.pos.x = (x - 1) * (enemy.transform.size.x + enemyPadding) + initialX
                enemy.transform.pos.y = (y - 1) * (enemy.transform.size.y + enemyPadding) + enemy.transform.size.y / 2 + enemyPadding
            end
        end
    end
end

return EnemySpawnerSystem
