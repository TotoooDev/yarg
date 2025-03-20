local Concord = require("lib.Concord")

Concord.component("enemySpawner", function (c)
    c.wave = 1
    c.enemiesAlive = 0
end)
