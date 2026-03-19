local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v1 = require(script.Parent.getAvatarEventCounterNameWithPlatform);
return function(v2) --[[ Line: 5 ]] --[[ Name: reportAvatarEventCounterV1 ]]
    -- upvalues: v1 (copy), l_RbxAnalyticsService_0 (copy)
    v2 = v1(v2);
    l_RbxAnalyticsService_0:ReportCounter(v2, 1);
end;