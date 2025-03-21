local Vector = require("lib.hump.vector")

return function (entity, pos, direction, enemy)
    entity:give("projectile", direction:clone(), enemy)
        :give("transform", pos:clone())
        :give("beat", 2.0, 2.0)
        :give("rectangleShape", Vector(32.0, 32.0))
        :give("dieAnimation")

    return entity
end