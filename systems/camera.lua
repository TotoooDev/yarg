local Concord = require("lib.Concord")
local Camera = require("lib.hump.camera")

local CameraSystem = Concord.system({
    pool = { "camera" }
})

local smoother = Camera.smooth.damped(10)

function CameraSystem:cameraShake(time, intensity)
    for _, entity in ipairs(self.pool) do
        entity.camera.shakeTime = time or 0.5
        entity.camera.intensity = intensity or 7.0
    end
end

function CameraSystem:update(dt)
    for _, entity in ipairs(self.pool) do
        if entity.camera.shakeTime > 0.0 then
            local x, y = entity.camera.camera:position()
            local randX = love.math.random(-entity.camera.intensity, entity.camera.intensity)
            local randY = love.math.random(-entity.camera.intensity, entity.camera.intensity)
            entity.camera.camera:lookAt(x + randX, y + randY, smoother)
            entity.camera.shakeTime = entity.camera.shakeTime - dt
        else
            entity.camera.camera:lockPosition(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, smoother)
        end
    end
end

return CameraSystem
