local class = require("lib.hump.class")
local Concord = require("lib.Concord")

local World = class({
    systems = {},
    printEntities = false
})

function World:init()
    Concord.utils.loadNamespace("components")
    Concord.utils.loadNamespace("systems", self.systems)

    self.world = Concord.world()

    self.world:addSystems(
        self.systems.debugPrint,
        self.systems.draw,
        self.systems.player
    )
end

function World:newEntity(name)
    local entity = Concord.entity(self.world)
        :give("label", name)
        :give("transform")
    return entity
end

function World:update(dt)
    self.world:emit("update", dt)
end

function World:draw()
    self.world:emit("draw")
    if self.printEntities then
        self.world:emit("debugDraw")
    end
end

return World
