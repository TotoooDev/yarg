local Concord = require("lib.Concord")

Concord.component("player", function (c)
    c.cooldown = 0.1 -- cooldown in seconds
    c.lastShoot = 0.0

    c.heat = 0.0
    c.heatRate = 10.0
    c.overheatLimit = 100.0
    c.overheatDissipationRate = 50.0
    c.overheating = false
end)
