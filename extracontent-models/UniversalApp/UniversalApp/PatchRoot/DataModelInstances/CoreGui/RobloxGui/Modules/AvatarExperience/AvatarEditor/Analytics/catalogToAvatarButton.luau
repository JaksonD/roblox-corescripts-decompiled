local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Constants);
return function(v2, v3) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    v2:sendTelemetryEvent(v3, "catalogToAvatarButton", {
        feature = v1.AnalyticsTag
    });
end;