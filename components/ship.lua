local Concord = require("lib.Concord")

Concord.component("ship", function (c, speed)
    c.speed = speed or 500.0
end)
