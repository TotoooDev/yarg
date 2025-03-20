local Concord = require("lib.Concord")

local PlayerSystem = Concord.system({
    pool = { "label" }
})

function PlayerSystem:debugDraw(dt)
    love.graphics.setColor({ 1.0, 0.0, 0.0 })
    love.graphics.print(#self.pool .. " entities")
    for i, entity in ipairs(self.pool) do
        love.graphics.print(entity.label.str, 0, i * 16)
    end
    love.graphics.setColor({ 1.0, 1.0, 1.0 })
end

return PlayerSystem
