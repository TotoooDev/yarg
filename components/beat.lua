local Concord = require("lib.Concord")

Concord.component("beat", function (c, shrinkStrength, growStrength, time)
    c.shrinkStrength = shrinkStrength or 1.0
    c.growStrength = growStrength or 1.0
    c.time = time or 0.05
    c.doAnimation = true
end)
