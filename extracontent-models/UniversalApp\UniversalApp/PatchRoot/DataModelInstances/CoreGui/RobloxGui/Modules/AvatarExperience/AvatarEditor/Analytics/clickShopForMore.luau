local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
return function(v4, v5, v6, v7) --[[ Line: 9 ]] --[[ Name: analyticsImpl ]]
    -- upvalues: v2 (copy), v3 (copy)
    v2.isType(v5, "string", "clickShopForMore event expects eventContext to be a string");
    v2.isType(v6, "string", "clickShopForMore event expects categoryName to be a string");
    v2.isType(v7, "string", "clickShopForMore event expects subCategoryName to be a string");
    v4:sendTelemetryEvent(v5, "clickShopForMore", {
        feature = v3.AnalyticsTag, 
        nav = v6, 
        subNav = v7
    });
end;