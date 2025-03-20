Score = {
    Values = {
        enemyDead = 100,
        enemyDeadWhileDiving = 200,
        projectileDead = 400,
        waveCompleted = 100
    },
    value = 0
}

function Score.add(n)
    Score.value = Score.value + n
end

function Score.get()
    return Score.value
end

function Score.reset()
    Score.value = 0
end

return Score
