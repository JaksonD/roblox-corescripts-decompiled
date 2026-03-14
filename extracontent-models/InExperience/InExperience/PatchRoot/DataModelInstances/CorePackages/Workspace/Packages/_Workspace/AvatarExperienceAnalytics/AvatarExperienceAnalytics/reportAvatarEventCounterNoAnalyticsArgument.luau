local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v1 = require(script.Parent.getAvatarEventCounterNameWithPlatform);
return function(v2) --[[ Line: 4 ]] --[[ Name: reportAvatarEventCounterNoAnalyticsArgument ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), v1 (copy)
    if not v2 then
        l_RbxAnalyticsService_0:ReportCounter("AvatarExperienceCounterMiss", 1);
        return;
    else
        local v3 = v1(v2);
        l_RbxAnalyticsService_0:ReportCounter(v3, 1);
        return;
    end;
end;