local Concord = require("lib.Concord")

local DrawSystem = Concord.system({
    pool = { "transform", "drawable" }
})

function DrawSystem:draw()
    for _, entity in ipairs(self.pool) do
        love.graphics.rectangle(
            "fill",
            entity.transform.pos.x - entity.transform.size.x / 2,
            entity.transform.pos.y - entity.transform.size.y / 2,
            entity.transform.size.x,
            entity.transform.size.y
        )
    end
end

return DrawSystem
