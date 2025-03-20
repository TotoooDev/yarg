local Vector = require("lib.hump.vector")
local Concord = require("lib.Concord")

Concord.component("transform", function (c, pos, rotation, scale)
    c.pos = pos or Vector(0.0, 0.0)
    c.rotation = rotation or 0.0
    c.scale = scale or Vector(1.0, 1.0)
end)
