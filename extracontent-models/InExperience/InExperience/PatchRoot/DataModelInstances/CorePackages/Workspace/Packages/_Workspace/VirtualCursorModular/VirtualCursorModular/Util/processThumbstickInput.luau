local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Properties);
return function(v2) --[[ Line: 7 ]] --[[ Name: processThumbstickInput ]]
    -- upvalues: v1 (copy)
    local v3 = 0;
    local v4 = 0;
    if v2.Magnitude >= v1.ThumbstickDeadzone then
        local v5 = math.atan2(v2.Y, v2.X);
        local v6 = math.abs(math.cos(v5) * v1.ThumbstickDeadzone);
        local v7 = math.abs(math.sin(v5) * v1.ThumbstickDeadzone);
        v3 = math.max(math.abs(v2.X) - v6, 0) / (1 - v6) * math.sign(v2.X);
        v4 = math.max(math.abs(v2.Y) - v7, 0) / (1 - v7) * math.sign(v2.Y);
    end;
    return Vector2.new(v3, -v4);
end;