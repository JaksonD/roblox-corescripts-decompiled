local l_Parent_0 = script:FindFirstAncestor("SduiSharedUtilities").Parent;
local v1 = require(l_Parent_0.React);
return function(v2) --[[ Line: 5 ]] --[[ Name: useStatefulRef ]]
    -- upvalues: v1 (copy)
    local v3, v4 = v1.useState(nil);
    return v3, (v1.useCallback(function(v5) --[[ Line: 7 ]]
        -- upvalues: v2 (copy), v4 (copy)
        if typeof(v2) == "function" then
            v2(v5);
        elseif typeof(v2) == "table" then
            v2.current = v5;
        end;
        v4(v5);
    end, {
        v2
    }));
end;