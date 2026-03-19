local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Constants);
return function(v2, v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    v2:sendTelemetryEvent(v3, "avatarToCatalogButton", {
        feature = v1.AnalyticsTag
    });
end;