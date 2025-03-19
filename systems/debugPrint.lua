local Concord = require("lib.Concord")

local PlayerSystem = Concord.system({
    pool = { "label" }
})

function PlayerSystem:debugDraw(dt)
    for i, entity in ipairs(self.pool) do
        love.graphics.print(entity.label.str, 0, (i - 1) * 16)
    end
end

return PlayerSystem
