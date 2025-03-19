local Concord = require("lib.Concord")

local DrawSystem = Concord.system({
    pool = { "transform", "drawable" },
    playerPool = { "transform", "drawable", "player" }
})

function DrawSystem:default(entity)
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

function DrawSystem:player(entity)
    local player = entity.player

    -- draw heat gauge
    if player.overheating then
        love.graphics.setColor({ 1.0, 0.0, 0.0 })
    else
        love.graphics.setColor({ 1.0, 1.0, 1.0 })
    end

    love.graphics.rectangle(
        "fill",
        0,
        love.graphics.getHeight() / (player.overheatLimit / player.heat),
        10.0,
        love.graphics.getHeight()
    )
    
    love.graphics.setColor({ 1.0, 1.0, 1.0 })
end

function DrawSystem:draw()
    for _, entity in ipairs(self.pool) do
        self:default(entity)
    end

    for _, entity in ipairs(self.playerPool) do
        self:player(entity)
    end
end

return DrawSystem
