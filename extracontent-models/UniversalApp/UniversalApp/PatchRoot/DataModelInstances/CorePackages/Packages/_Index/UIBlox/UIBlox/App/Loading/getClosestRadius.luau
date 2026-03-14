local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Radius_0 = require(l_Parent_0.Foundation).Enums.Radius;
return function(v2, v3) --[[ Line: 9 ]] --[[ Name: getClosestRadius ]]
    -- upvalues: l_Radius_0 (copy)
    if not v3 or v3 == UDim.new(0, 0) then
        return l_Radius_0.None;
    elseif v3.Scale >= 0.5 then
        return l_Radius_0.Circle;
    else
        local v4 = nil;
        local v5 = 1e999;
        for v6, v7 in {
            [l_Radius_0.None] = 0, 
            [l_Radius_0.XSmall] = 2, 
            [l_Radius_0.Small] = v2.Small, 
            [l_Radius_0.Medium] = v2.Medium, 
            [l_Radius_0.Large] = v2.XLarge, 
            [l_Radius_0.Circle] = v2.Circle
        } do
            local v8 = math.abs(v3.Offset - v7);
            if v8 < v5 then
                v5 = v8;
                v4 = v6;
            end;
        end;
        return v4;
    end;
end;