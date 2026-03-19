local v0 = require(script.Parent.toRect);
local v1 = require(script.Parent.returnValue);
local function _(v2, v3) --[[ Line: 4 ]] --[[ Name: isPointInside ]]
    local v4 = false;
    if v2.X >= v3.Min.X then
        v4 = false;
        if v2.X <= v3.Max.X then
            v4 = false;
            if v2.Y >= v3.Min.Y then
                v4 = v2.Y <= v3.Max.Y;
            end;
        end;
    end;
    return v4;
end;
return function(v6, v7) --[[ Line: 26 ]] --[[ Name: inside ]]
    -- upvalues: v0 (copy), v1 (copy)
    local v8 = v0(v6);
    local v9 = v0(v7);
    local l_v1_0 = v1;
    local l_Min_0 = v8.Min;
    local v12 = false;
    if l_Min_0.X >= v9.Min.X then
        v12 = false;
        if l_Min_0.X <= v9.Max.X then
            v12 = false;
            if l_Min_0.Y >= v9.Min.Y then
                v12 = l_Min_0.Y <= v9.Max.Y;
            end;
        end;
    end;
    if v12 then
        l_Min_0 = v8.Max;
        v12 = false;
        if l_Min_0.X >= v9.Min.X then
            v12 = false;
            if l_Min_0.X <= v9.Max.X then
                v12 = false;
                if l_Min_0.Y >= v9.Min.Y then
                    v12 = l_Min_0.Y <= v9.Max.Y;
                end;
            end;
        end;
    end;
    return l_v1_0(v12, "Is inside the element", "Is not inside the element");
end;