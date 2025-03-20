local Concord = require("lib.Concord")
local Vector = require("lib.hump.vector")

Concord.component("projectile", function (c, speed, direction, enemy)
    c.speed = speed or 800.0
    c.direction = direction or Vector(0.0, 1.0)
    c.enemy = enemy or false
end)
