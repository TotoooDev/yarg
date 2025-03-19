local Util = {}

function Util.sinBetween(x, min, max)
    local halfRange = (max - min) / 2
    return min + halfRange + math.sin(x) * halfRange
end

function Util.aabbCollision(posA, sizeA, posB, sizeB)
    return
        posA.x + sizeA.x / 2 > posB.x - sizeB.x / 2 and
        posA.x - sizeA.x / 2 < posB.x + sizeB.x / 2 and
        posA.y + sizeA.y / 2 > posB.y - sizeB.y / 2 and
        posA.y - sizeA.y / 2 < posB.y + sizeB.y / 2
end

return Util
