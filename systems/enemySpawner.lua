local Concord = require("lib.Concord")
local Gamestate = require("lib.hump.gamestate")
local States = require("states")
local Enemy = require("assemblers.enemy")

local waveLayouts = {
    {
        { 2, 2, 2, 2, 2, 2, 2, 2 },
        { 2, 2, 2, 2, 2, 2, 2, 2 },
        { 2, 2, 2, 2, 2, 2, 2, 2 },
        { 2, 2, 2, 2, 2, 2, 2, 2 },
    },
    {
        { 2, 2, 2, 2, 2, 2, 2, 2 },
        { 2, 2, 2, 2, 2, 2, 2, 2 },
    },

    {{1}},
    {{2, 2}},
}

local EnemySpawnerSystem = Concord.system({
    pool = { "enemySpawner" }
})

function EnemySpawnerSystem:spawn()
    local enemyPadding = 8

    for _, entity in ipairs(self.pool) do
        entity.enemySpawner.enemiesAlive = 0
        local waveLayout = waveLayouts[entity.enemySpawner.wave]

        for y, line in ipairs(waveLayout) do
            for x, level in ipairs(line) do
                local enemy = Enemy(entity.world:newEntity("enemy"), level)
                -- this works and i don't know why
                local initialX = love.graphics.getWidth() / 2 - #line * (enemy.rectangleShape.size.x + enemyPadding) / 2 + enemy.rectangleShape.size.x / 2 + enemyPadding / 2
                enemy.transform.pos.x = (x - 1) * (enemy.rectangleShape.size.x + enemyPadding) + initialX
                enemy.transform.pos.y = (y - 1) * (enemy.rectangleShape.size.y + enemyPadding) + enemy.rectangleShape.size.y / 2 + enemyPadding

                entity.enemySpawner.enemiesAlive = entity.enemySpawner.enemiesAlive + 1
            end
        end
    end
end

function EnemySpawnerSystem:onEnemyDead()
    for _, entity in ipairs(self.pool) do
        if entity.enemySpawner.wave > #waveLayouts then
            Gamestate.switch(States.gameOver, true)
        end
    end
end

function EnemySpawnerSystem:onBeat()
    for _, entity in ipairs(self.pool) do
        entity.enemySpawner.currentBeat = entity.enemySpawner.currentBeat + 1
        if entity.enemySpawner.currentBeat >= entity.enemySpawner.beatInterval then
            entity.enemySpawner.currentBeat = 0
            entity.enemySpawner.wave = entity.enemySpawner.wave + 1
            entity.world:emit("spawn")
        end
    end
end

return EnemySpawnerSystem
