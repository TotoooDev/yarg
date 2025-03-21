local lovebpm = require("lib.lovebpm")

local LevelRegistry = {}

function LevelRegistry.load()
    local levelDir = "levels"
    local files = love.filesystem.getDirectoryItems(levelDir)

    for _, file in ipairs(files) do
        local isFile = love.filesystem.getInfo(levelDir .. "/" .. file).type == "file"

        if isFile and string.match(file, '%.lua$') ~= nil then
                local name = file:sub(1, #file - 4)
                local path = levelDir.."."..name

                local value = require(path:gsub("%/", "."))
                table.insert(LevelRegistry, value)
        end
    end

    for _, level in ipairs(LevelRegistry) do
        level.track = lovebpm.newTrack()
            :load(love.sound.newSoundData(level.songPath))
            :setBPM(level.bpm)
    end
end

return LevelRegistry
