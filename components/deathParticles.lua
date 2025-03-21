local Concord = require("lib.Concord")

Concord.component("deathParticles", function (c)
    c.hasEmitted = false

    local width = 128
    local height = 128
    local canvas = love.graphics.newCanvas(width, height)
    love.graphics.setCanvas(canvas) -- Switch to drawing on canvas 'c'
    love.graphics.setBlendMode("alpha")
    love.graphics.setColor(1.0, 1.0, 1.0, 1.0)
    love.graphics.circle("fill", width / 2, height / 2, width / 2)
    love.graphics.setCanvas() -- Switch back to drawing on main screen

    c.system = love.graphics.newParticleSystem(canvas, 500)
    c.system:setColors({0.9, 0.9, 0.9, 1}, {0.9, 0.9, 0.9, 0})
    c.system:setDirection(-1.5707963705063)
    c.system:setEmissionArea("none", 0, 0, 0, false)
    c.system:setEmissionRate(50.191875457764)
    c.system:setEmitterLifetime(0.088175281882286)
    c.system:setInsertMode("top")
    c.system:setLinearAcceleration(0.051036551594734, 0.051036551594734, 0.45932897925377, 0.45932897925377)
    c.system:setLinearDamping(3.2926743030548, 9.2619094848633)
    c.system:setOffset(50, 50)
    c.system:setParticleLifetime(0.15694761276245, 0.2880911231041)
    c.system:setRadialAcceleration(0.91865795850754, -0.91865795850754)
    c.system:setRelativeRotation(false)
    c.system:setRotation(0, 0)
    c.system:setSizes(1, 0.39913154840469, 0.29272736907005)
    c.system:setSizeVariation(0.50159746408463)
    c.system:setSpeed(1533.490234375, 1999.2701416016)
    c.system:setSpin(0, 0)
    c.system:setSpinVariation(0)
    c.system:setSpread(6.2831854820251)
    c.system:setTangentialAcceleration(2778.9401855469, -2580.5102539063)
end)
