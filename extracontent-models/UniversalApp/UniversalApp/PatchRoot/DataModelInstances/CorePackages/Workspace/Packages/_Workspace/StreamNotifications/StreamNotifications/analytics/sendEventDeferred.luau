local l_Parent_0 = script:FindFirstAncestor("StreamNotifications").Parent;
local l_getPlatformTarget_0 = require(l_Parent_0.Analytics).getPlatformTarget;
return function(v2) --[[ Line: 5 ]]
    -- upvalues: l_getPlatformTarget_0 (copy)
    return function(v3, v4, v5) --[[ Line: 6 ]]
        -- upvalues: v2 (copy), l_getPlatformTarget_0 (ref)
        v2:SendEventDeferred(l_getPlatformTarget_0(), v3, v4, v5);
    end;
end;