local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.t);
return v1.strictInterface({
    Color = v1.ColorSequence, 
    Transparency = v1.NumberSequence, 
    Rotation = v1.number, 
    Offset = v1.optional(v1.Vector2)
});