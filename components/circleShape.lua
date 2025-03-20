local Concord = require("lib.Concord")

Concord.component("circleShape", function (c, radius, numSegments, fill)
    c.radius = radius or 32.0
    c.numSegments = numSegments or nil
    if fill == nil then c.fill = true else c.fill = fill end
end)
