local l_Parent_0 = script:FindFirstAncestor("SduiSharedUtilities").Parent;
local v1 = require(l_Parent_0.React);
return function(v2, v3, v4) --[[ Line: 5 ]] --[[ Name: useLocalAnalyticsData ]]
    -- upvalues: v1 (copy)
    return v1.useMemo(function() --[[ Line: 6 ]]
        -- upvalues: v4 (copy), v2 (copy), v3 (copy)
        local v5 = if v4 then v4 else {};
        v5.configKey = v2;
        v5.appPage = v3;
        return v5;
    end, {
        v2, 
        v3, 
        v4
    });
end;