local Concord = require("lib.Concord")

Concord.component("text", function (c, str, color, align, limit)
    c.str = str or ""
    c.color = color or { 1.0, 1.0, 1.0, 1.0 }
    c.align = align or "left"
    c.limit = limit or 1024.0
end)
