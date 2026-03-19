local l_Parent_0 = script:FindFirstAncestor("ProfileShareLinks").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.initializeProfileShareLinksAnalytics);
return function() --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.useMemo(function() --[[ Line: 8 ]]
        -- upvalues: v2 (ref)
        return v2();
    end, {});
end;