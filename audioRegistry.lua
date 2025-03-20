local AudioRegistry = {
    music = {
        rep = nil
    },

    bpm = 0
}

function AudioRegistry.load()
    AudioRegistry.music.rep = love.sound.newSoundData("assets/1408549_Rep.mp3")
end

function AudioRegistry.setCurrentBPM(bpm)
    AudioRegistry.bpm = bpm
end

function AudioRegistry.getCurrentBPM()
    return AudioRegistry.bpm
end

return AudioRegistry
