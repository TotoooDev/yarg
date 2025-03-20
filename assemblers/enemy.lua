local Vector = require("lib.hump.vector")

return function (entity, level, pos)
    entity:give("enemy", level)
        :give("ship")
        :give("drawable")
        :give("beat")

    if pos then
        entity.transform.pos = pos:clone()
    else
        entity.transform.pos = Vector(0.0, 0.0)
    end

    return entity
end
