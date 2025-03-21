local Rep = {
    songName = "Rep!",
    songPath = "assets/1408549_Rep.mp3",
    bpm = 130,
    difficulty = "easy",

    layout = {
        {
            beats = 4,
            layout = {{}}
        },
        {
            beats = 8,
            layout = {{0, 1, 0, 0, 0, 0, 1, 0}}
        },
        {
            beats = 8,
            layout = {{1, 1, 0, 1, 1, 0, 1, 1}}
        },
        {
            beats = 8,
            layout = {{1, 1, 1, 0, 0, 1, 1, 1}}
        },
        {
            beats = 8,
            layout = {
                {0, 1, 0, 0, 0, 0, 1, 0},
                {1, 1, 1, 0, 0, 1, 1, 1}
            }
        },
        {
            beats = 8,
            layout = {
                {0, 1, 0, 0, 0, 0, 1, 0},
                {1, 1, 1, 1, 1, 1, 1, 1}
            }
        },
        {
            beats = 8,
            layout = {
                {0, 1, 0, 0, 0, 0, 1, 0},
                {1, 1, 1, 1, 1, 1, 1, 1},
                {1, 0, 0, 1, 1, 0, 0, 1},
                {1, 1, 1, 1, 1, 1, 1, 1},
                {1, 1, 1, 0, 0, 1, 1, 1},
            }
        }
    }
}

return Rep
