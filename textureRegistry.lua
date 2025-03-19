local TextureRegistry = {
    playerShip = nil,
    projectile = nil
}

function TextureRegistry.load()
    TextureRegistry.playerShip = love.graphics.newImage("assets/graphics/playership.png")
    TextureRegistry.projectile = love.graphics.newImage("assets/graphics/projectile.png")
end

return TextureRegistry
