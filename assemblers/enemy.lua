local Timer = require("lib.hump.timer")
local Vector = require("lib.hump.vector")
local Beat = require("beat")

return function (entity, level, pos)
    entity:give("enemy", level)
        :give("ship")
        :give("drawable")

    if pos then
        entity.transform.pos = pos:clone()
    else
        entity.transform.pos = Vector(0.0, 0.0)
    end

    Beat(entity, {
        func = function ()
            local projectile = entity.world:newEntity("projectile")
                :give("transform", entity.transform.pos:clone(), nil, Vector(32.0, 32.0))
                :give("projectile", nil, Vector(0.0, -1.0), true)
                :give("drawable")
            Beat(projectile, { shrinkStrength = 2.0, growStrength = 2.0 })
        end
    })

    return entity
end
