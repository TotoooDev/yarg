local Gamestate = require("lib.hump.gamestate")
local Vector = require("lib.hump.vector")
local States = require("states")
local World = require("world")
local LevelRegistry = require("levelRegistry")

return function (state)
    local world
    local items = {}
    local selection = 1

    function state:enter()
        world = World()

        world:newEntity("title")
            :give("transform", Vector(200, 100), 0, Vector(5.0, 5.0))
            :give("text", "yarg!")
            :give("beat")

        world:newEntity("quit")
            :give("transform", Vector(190, 170))
            :give("text", "for the LÖVE JAM 2025 :)")
            :give("beat")

        for i, level in ipairs(LevelRegistry) do
            local entity = world:newEntity(level.songName .. "text")
                :give("transform", Vector(200, 300 + i * 32))
                :give("text", level.songName .. " by " .. level.artist, { 0.3, 0.3, 0.3 })
                :give("beat")

            table.insert(items, entity)
        end

        local quitEntity = world:newEntity("quit")
            :give("transform", Vector(200, 600))
            :give("text", "quit", { 0.3, 0.3, 0.3 })
            :give("beat")
        table.insert(items, quitEntity)
    end

    function state:update(dt)
        for i, entity in ipairs(items) do
            if i == selection then
                entity.text.color = { 1.0, 1.0, 1.0 }
            else
                entity.text.color = { 0.3, 0.3, 0.3 }
            end
        end

        world:update(dt)
    end

    function state:draw()
        world:draw()
    end

    function state:keypressed(key, scancode)
        if scancode == "up" and selection > 1 then
            selection = selection - 1
        end
        if scancode == "down" and selection < 3 then
            selection = selection + 1
        end

        if scancode == "space" then
            if selection == #items then
                love.event.quit()
            else
                Gamestate.switch(States.game, LevelRegistry[selection])
            end
        end
    end
end
