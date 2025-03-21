local Concord = require("lib.Concord")
local Camera = require("lib.hump.camera")

Concord.component("camera", function (c)
    c.camera = Camera()
    c.shakeTime = 0
    c.intensity = 10.0
end)
