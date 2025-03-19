local Concord = require("lib.Concord")
local Input = require("input")

local PlayerSystem = Concord.system({
    pool = { "transform", "player" }
})

function PlayerSystem:update(dt)
    for _, entity in ipairs(self.pool) do
        if Input.left then
            entity.transform.pos.x = entity.transform.pos.x - 100.0 * dt
        end

        if Input.right then
            entity.transform.pos.x = entity.transform.pos.x + 100.0 * dt
        end
    end
end

return PlayerSystem
