return function (entity, level, pos)
    entity:give("enemy", level)
        :give("ship")
        :give("drawable")

    entity.transform.pos = pos:clone()
end
