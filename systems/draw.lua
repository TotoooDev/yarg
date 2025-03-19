local Concord = require("lib.Concord")

local DrawSystem = Concord.system({
    pool = { "transform", "drawable" },
    playerPool = { "transform", "drawable", "player" }
})

function DrawSystem:default(entity)
    local transform = entity.transform

    love.graphics.push()
    love.graphics.translate(transform.pos.x, transform.pos.y)
    love.graphics.rotate(transform.rotation)
    love.graphics.scale(transform.scale.x, transform.scale.y)

    love.graphics.rectangle(
        "fill",
        -transform.size.x / 2,
        -transform.size.y / 2,
        transform.size.x,
        transform.size.y
    )

    love.graphics.pop()
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
