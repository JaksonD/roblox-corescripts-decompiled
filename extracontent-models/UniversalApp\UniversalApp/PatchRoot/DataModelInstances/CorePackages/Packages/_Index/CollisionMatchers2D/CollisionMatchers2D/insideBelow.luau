local v0 = require(script.Parent.toRect);
local v1 = require(script.Parent.returnValue);
return function(v2, v3, v4) --[[ Line: 29 ]] --[[ Name: insideBelow ]]
    -- upvalues: v0 (copy), v1 (copy)
    local v5 = v0(v2);
    local v6 = v0(v3);
    local v7 = v5.Min - v6.Min;
    if v4 then
        if typeof(v4) == "number" then
            v4 = NumberRange.new(v4);
        end;
        local l_v1_0 = v1;
        local v9 = false;
        if v4.Min <= v7.Y then
            v9 = v4.Max >= v7.Y;
        end;
        return l_v1_0(v9, "Was within range", "Was not within range ( " .. tostring(v4) .. ")");
    else
        return v1(v7.Y >= 0, "Was not above the element", "Was too far above the element");
    end;
end;