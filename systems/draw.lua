local Concord = require("lib.Concord")

local DrawSystem = Concord.system({
    cameraPool = { "camera" },
    rectanglePool = { "transform", "rectangleShape" },
    circlePool = { "transform", "circleShape" },
    textPool = { "transform", "text" },
    deathParticlesPool = { "transform", "deathParticles" },
    playerPool = { "transform", "player" }
})

function DrawSystem:rectangle(entity)
    local transform = entity.transform
    local rectangle = entity.rectangleShape
    local mode = "fill"
    if not rectangle.fill then mode = "line" end

    love.graphics.push()
    love.graphics.translate(transform.pos.x, transform.pos.y)
    love.graphics.rotate(transform.rotation)
    love.graphics.scale(transform.scale.x, transform.scale.y)

    love.graphics.rectangle(
        mode,
        -rectangle.size.x / 2,
        -rectangle.size.y / 2,
        rectangle.size.x,
        rectangle.size.y,
        rectangle.radius,
        rectangle.radius
    )

    love.graphics.pop()
end

function DrawSystem:circle(entity)
    local transform = entity.transform
    local circle = entity.circleShape
    local mode = "fill"
    if not circle.fill then mode = "line" end

    love.graphics.push()
    love.graphics.translate(transform.pos.x, transform.pos.y)
    love.graphics.rotate(transform.rotation)
    love.graphics.scale(transform.scale.x, transform.scale.y)

    love.graphics.circle(
        mode,
        0.0,
        0.0,
        circle.radius,
        circle.numSegments
    )

    love.graphics.pop()
end

function DrawSystem:text(entity)
    local transform = entity.transform
    local text = entity.text

    local font = love.graphics.getFont()

    love.graphics.push()
    love.graphics.translate(transform.pos.x, transform.pos.y)
    love.graphics.rotate(transform.rotation)
    love.graphics.scale(transform.scale.x, transform.scale.y)
    love.graphics.setColor(text.color)

    love.graphics.printf(
        text.str,
        -font:getWidth(text.str) / 2,
        -font:getHeight() / 2,
        text.limit,
        text.align
    )

    love.graphics.setColor({ 1.0, 1.0, 1.0, 1.0 })
    love.graphics.pop()
end

function DrawSystem:deathParticles(entity)
    local transform = entity.transform
    local particles = entity.deathParticles

    love.graphics.draw(
        particles.system,
        transform.pos.x,
        transform.pos.y
    )
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
        0.0,
        love.graphics.getHeight() - 10.0,
        love.graphics.getWidth() / (player.overheatLimit / player.heat),
        10.0,
        8.0,
        8.0
    )

    love.graphics.setColor({ 1.0, 1.0, 1.0 })
end

function DrawSystem:draw()
    for _, entity in ipairs(self.textPool) do
        self:text(entity)
    end

    for _, entity in ipairs(self.cameraPool) do
        entity.camera.camera:attach()
    end

    for _, entity in ipairs(self.rectanglePool) do
        self:rectangle(entity)
    end

    for _, entity in ipairs(self.circlePool) do
        self:circle(entity)
    end

    for _, entity in ipairs(self.deathParticlesPool) do
        self:deathParticles(entity)
    end

    for _, entity in ipairs(self.playerPool) do
        self:player(entity)
    end

    for _, entity in ipairs(self.cameraPool) do
        entity.camera.camera:detach()
    end
end

return DrawSystem
