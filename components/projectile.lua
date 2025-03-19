local Concord = require("lib.Concord")

Concord.component("projectile", function (c, speed)
    c.speed = speed or 800.0
end)
