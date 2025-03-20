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
    for _, system in pairs(self.systems) do
        if type(system) == "boolean" then
            error("bro you forgot to return the system (what an idiot lol)")
        end
        self.world:addSystems(system)
    end
end

function World:newEntity(name)
    local entity = Concord.entity(self.world)
        :give("label", name)
        :give("transform")
    entity.world = self
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

function World:emit(function_name, ...)
    self.world:emit(function_name, ...)
end

return World
