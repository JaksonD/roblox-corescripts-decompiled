local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.React);
return v1.memo(function(v2) --[[ Line: 13 ]] --[[ Name: StyleRule ]]
    -- upvalues: v1 (copy)
    local v4 = v1.useCallback(function(v3) --[[ Line: 14 ]]
        -- upvalues: v2 (copy)
        if v3 ~= nil then
            v3:SetProperties(v2.properties);
        end;
    end, {
        v2.properties
    });
    return v1.createElement("StyleRule", {
        Priority = v2.Priority or 1, 
        Selector = v2.Selector, 
        ref = v4
    });
end);