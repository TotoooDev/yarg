local Concord = require("lib.Concord")

local DrawSystem = Concord.system({
    pool = { "transform", "drawable" }
})

function DrawSystem:draw()
    for _, entity in ipairs(self.pool) do
        if entity.drawable.image then
            love.graphics.draw(
                entity.drawable.image,
                entity.transform.pos.x - entity.transform.size.x / 2,
                entity.transform.pos.y - entity.transform.size.y / 2,
                0.0,
                entity.transform.size.x,
                entity.transform.size.y
            )
        else
            love.graphics.rectangle(
                "fill",
                entity.transform.pos.x - entity.transform.size.x / 2,
                entity.transform.pos.y - entity.transform.size.y / 2,
                entity.transform.size.x,
                entity.transform.size.y
            )
        end
    end
end

return DrawSystem
