local Concord = require("lib.Concord")

local DeathParticlesSystem = Concord.system({
    pool = { "transform", "deathParticles" }
})

function DeathParticlesSystem:update(dt)
    for _, entity in ipairs(self.pool) do
        local particles = entity.deathParticles
        if not particles.hasEmitted then
            particles.system:emit(5)
            particles.hasEmitted = true
        else
            particles.system:update(dt)

            if particles.system:getCount() == 0 then
                entity:destroy()
            end
        end
    end
end

return DeathParticlesSystem
