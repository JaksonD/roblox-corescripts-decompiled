local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_getPlatformTarget_0 = require(l_Parent_0.Analytics).getPlatformTarget;
local v3 = require(l_Parent_0.Cryo);
return function(v4) --[[ Line: 8 ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), v3 (copy), l_getPlatformTarget_0 (copy)
    local l_l_RbxAnalyticsService_0_PlaySessionId_0 = l_RbxAnalyticsService_0:GetPlaySessionId();
    return function(v6, v7, v8) --[[ Line: 11 ]]
        -- upvalues: v3 (ref), l_l_RbxAnalyticsService_0_PlaySessionId_0 (copy), v4 (copy), l_getPlatformTarget_0 (ref)
        local v9 = v3.Dictionary.join(v8 or {}, {
            playSessionId = l_l_RbxAnalyticsService_0_PlaySessionId_0
        });
        v4:SendEventDeferred(l_getPlatformTarget_0(), v6, v7, v9);
    end;
end;