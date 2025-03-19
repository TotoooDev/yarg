local Vector = require("lib.hump.vector")
local Concord = require("lib.Concord")

Concord.component("transform", function (c, pos, rotation, size, scale)
    c.pos = pos or Vector(0.0, 0.0)
    c.rotation = rotation or Vector(0.0, 0.0)
    c.size = size or Vector(64.0, 64.0)
    c.scale = scale or Vector(1.0, 1.0)
end)
