local Concord = require("lib.Concord")

Concord.component("player", function (c)
    c.cooldown = 0.1 -- cooldown in seconds
    c.lastShoot = 0.0
end)
