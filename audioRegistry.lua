local AudioRegistry = {
    music = {
        rep = nil
    }
}

function AudioRegistry.load()
    AudioRegistry.music.rep = love.sound.newSoundData("assets/1408549_Rep.mp3")
end

return AudioRegistry
