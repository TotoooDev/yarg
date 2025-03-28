local Vector = require("lib.hump.vector")
local Projectile = require("assemblers.projectile")

return function (entity, level, pos)
    entity:give("enemy", level)
        :give("ship")
        :give("rectangleShape")
        :give("beat")
        :give("spawnAnimation")
        :give("dieAnimation")

    if pos then
        entity.transform.pos = pos:clone()
    else
        entity.transform.pos = Vector(0.0, 0.0)
    end

    return entity
end
