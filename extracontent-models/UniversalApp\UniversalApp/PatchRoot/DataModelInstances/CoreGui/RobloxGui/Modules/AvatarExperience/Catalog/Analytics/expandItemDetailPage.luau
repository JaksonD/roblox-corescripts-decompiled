local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
return function(v4, v5, v6, v7) --[[ Line: 10 ]]
    -- upvalues: v2 (copy), v3 (copy)
    v2.isType(v6, "string", "expandItemDetailPage event expects itemId");
    v2.isType(v7, "string", "expandItemDetailPage event expects itemType");
    v4:sendTelemetryEvent(v5, "swipeUpItemDetailPage", {
        feature = v3.AnalyticsTag, 
        itemID = v6, 
        itemType = v7
    });
end;