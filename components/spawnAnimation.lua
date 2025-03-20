local Concord = require("lib.Concord")

Concord.component("spawnAnimation", function (c, time)
    c.time = time or 0.5
    c.isSpawning = false
end)
