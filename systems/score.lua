local Concord = require("lib.Concord")
local Util = require("util")
local Score = require("score")

local ScoreSystem = Concord.system({
    pool = { "transform", "score", "text" }
})

function ScoreSystem:update(dt)
    for _, entity in ipairs(self.pool) do
        entity.text.str = "SCORE\n" .. Score.get()
    end
end

return ScoreSystem
