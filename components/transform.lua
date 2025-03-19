local Vector = require("lib.hump.vector")
local Concord = require("lib.Concord")

Concord.component("transform", function (c, pos, rotation, size)
    c.pos = pos or Vector(0.0, 0.0)
    c.rotation = rotation or Vector(0.0, 0.0)
    c.size = size or Vector(64.0, 64.0)
end)
