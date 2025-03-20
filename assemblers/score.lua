local Vector = require("lib.hump.vector")

return function (entity)
    entity:give("transform", Vector(230, 325), nil, Vector(5.0, 5.0))
        :give("text", "", { 0.3, 0.3, 0.3 }, "center", 100)
        :give("score")
        :give("beat")
end
