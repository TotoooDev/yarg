local Vector = require("lib.hump.vector")
local Projectile = require("assemblers.projectile")

return function (entity, level, pos)
    entity:give("enemy", level)
        :give("ship")
        :give("drawable")
        :give("beat", nil, nil, nil, function ()
            if love.math.random() < entity.enemy.projectileProbability then
                Projectile(
                    entity.world:newEntity("projectile"),
                    entity.transform.pos:clone(),
                    Vector(0.0, -1.0),
                    true
                )
            end
        end)

    if pos then
        entity.transform.pos = pos:clone()
    else
        entity.transform.pos = Vector(0.0, 0.0)
    end

    return entity
end
