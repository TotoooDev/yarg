local Concord = require("lib.Concord")

Concord.component("enemy", function (c, hp, projectileProbability)
    c.hp = hp or 1
    c.projectileProbability = projectileProbability or 0.025
    c.beats = 0
    c.goingDown = false
end)
