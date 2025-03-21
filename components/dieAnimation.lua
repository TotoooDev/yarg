local Concord = require("lib.Concord")

Concord.component("dieAnimation", function (c, time)
    c.time = time or 0.2
    c.doAnimation = false
    c.isDying = false
end)
