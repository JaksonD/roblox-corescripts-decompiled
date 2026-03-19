local l_Parent_0 = script:FindFirstAncestor("SocialLuaAnalytics").Parent;
local l_getPlatformTarget_0 = require(l_Parent_0.Analytics).getPlatformTarget;
return function(v2) --[[ Line: 6 ]]
    -- upvalues: l_getPlatformTarget_0 (copy)
    return function(_, v4, v5, v6) --[[ Line: 7 ]]
        -- upvalues: v2 (copy), l_getPlatformTarget_0 (ref)
        v2:sendEventDeferred(l_getPlatformTarget_0(), v4, v5, v6);
    end;
end;