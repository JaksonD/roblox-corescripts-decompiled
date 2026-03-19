local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Control.Enum.ControlState);
return function(v2, v3, v4) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    local v5 = v2[v3] or v2[v1.Default];
    local v6 = {
        Color = v4.Theme[v5].Color, 
        Transparency = v4.Theme[v5].Transparency
    };
    if v3 == v1.Disabled or v3 == v1.Pressed then
        v6.Transparency = 0.5 * v6.Transparency + 0.5;
    end;
    return v6;
end;