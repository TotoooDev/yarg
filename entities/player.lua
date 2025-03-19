return function (world)
    local player = world:newEntity("player")
        :give("player")
        :give("ship", 700.0)
        :give("drawable")

    player.transform.pos.x = love.graphics.getWidth() / 2.0
    player.transform.pos.y = 750.0

    return player
end
