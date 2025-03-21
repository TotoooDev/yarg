local Concord = require("lib.Concord")
local Signal = require("lib.hump.signal")
local Score = require("score")
local Enemy = require("assemblers.enemy")

local EnemySpawnerSystem = Concord.system({
    pool = { "enemySpawner" }
})

function EnemySpawnerSystem:spawn()
    local enemyPadding = 8

    for _, entity in ipairs(self.pool) do
        entity.enemySpawner.enemiesAlive = 0
        local wave = entity.enemySpawner.level.layout[entity.enemySpawner.wave]
        entity.enemySpawner.beatInterval = wave.beats

        for y, line in ipairs(wave.layout) do
            for x, hp in ipairs(line) do
                if #line > 8 then
                    print("WARNING! TOO MANY OBSTACLES IN THIS LINE TO FIT ON THE SCREEN!")
                end

                if hp == 0 then goto continue end

                local enemy = Enemy(entity.world:newEntity("enemy"), hp)
                -- this works and i don't know why
                local initialX = love.graphics.getWidth() / 2 - #line * (enemy.rectangleShape.size.x + enemyPadding) / 2 + enemy.rectangleShape.size.x / 2 + enemyPadding / 2
                enemy.transform.pos.x = (x - 1) * (enemy.rectangleShape.size.x + enemyPadding) + initialX
                enemy.transform.pos.y = (y - 1) * (enemy.rectangleShape.size.y + enemyPadding) + enemy.rectangleShape.size.y / 2 + enemyPadding

                entity.enemySpawner.enemiesAlive = entity.enemySpawner.enemiesAlive + 1

                ::continue::
            end
        end
    end
end

function EnemySpawnerSystem:onBeat()
    for _, entity in ipairs(self.pool) do
        entity.enemySpawner.currentBeat = entity.enemySpawner.currentBeat + 1

        if entity.enemySpawner.currentBeat == entity.enemySpawner.beatInterval - 1 then
            entity.world:emit("dive")
        end

        if entity.enemySpawner.currentBeat >= entity.enemySpawner.beatInterval then
            entity.enemySpawner.currentBeat = 0
            entity.enemySpawner.wave = entity.enemySpawner.wave + 1
            entity.world:emit("newWave")


            if entity.enemySpawner.wave > #entity.enemySpawner.level.layout then
                Signal.emit("levelOver", true)
            else
                entity.world:emit("spawn")
            end
        end
    end
end

function EnemySpawnerSystem:newWave()
    Score.add(Score.Values.waveCompleted)
end

return EnemySpawnerSystem
