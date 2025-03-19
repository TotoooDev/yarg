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

    Beat(entity)

    return entity
end
