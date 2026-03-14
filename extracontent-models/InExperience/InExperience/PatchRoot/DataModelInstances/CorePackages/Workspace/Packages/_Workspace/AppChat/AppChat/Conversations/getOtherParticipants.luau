local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Cryo);
return function(v2, v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    if v2 and v2.participants then
        return v1.List.filter(v2.participants, function(v4) --[[ Line: 8 ]]
            -- upvalues: v3 (copy)
            return tostring(v4) ~= tostring(v3);
        end);
    else
        return {};
    end;
end;