local Concord = require("lib.Concord")
local Vector = require("lib.hump.vector")

Concord.component("rectangleShape", function (c, size, radius, fill)
    c.size = size or Vector(64.0, 64.0)
    c.radius = radius or 8.0
    c.fill = fill or true
end)
