local Concord = require("lib.Concord")

Concord.component("enemy", function (c, hp)
    c.hp = hp or 1
end)
