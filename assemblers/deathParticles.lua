return function(entity, pos)
    entity:give("transform", pos:clone())
        :give("deathParticles")
    return entity
end
