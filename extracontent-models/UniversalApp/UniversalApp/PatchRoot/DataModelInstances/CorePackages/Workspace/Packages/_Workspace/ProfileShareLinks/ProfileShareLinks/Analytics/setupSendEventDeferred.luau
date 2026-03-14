local l_Parent_0 = script:FindFirstAncestor("ProfileShareLinks").Parent;
local l_getPlatformTarget_0 = require(l_Parent_0.Analytics).getPlatformTarget;
return function(v2) --[[ Line: 5 ]]
    -- upvalues: l_getPlatformTarget_0 (copy)
    return function(_, v4, v5, v6) --[[ Line: 6 ]]
        -- upvalues: v2 (copy), l_getPlatformTarget_0 (ref)
        local v7 = if v6 then v6.context else v4;
        v2:sendEventDeferred(l_getPlatformTarget_0(), v7, v5, v6);
    end;
end;