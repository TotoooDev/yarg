local Concord = require("lib.Concord")

Concord.component("enemySpawner", function (c, level)
    c.level = level
    c.wave = 1
    c.enemiesAlive = 0
    c.beatInterval = 8
    c.currentBeat = 0
end)
