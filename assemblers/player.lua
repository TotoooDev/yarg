return function (entity)
    entity:give("player")
        :give("ship", 700.0)
        :give("rectangleShape")
        :give("dieAnimation")

    entity.transform.pos.x = love.graphics.getWidth() / 2.0
    entity.transform.pos.y = 750.0

    return entity
end
