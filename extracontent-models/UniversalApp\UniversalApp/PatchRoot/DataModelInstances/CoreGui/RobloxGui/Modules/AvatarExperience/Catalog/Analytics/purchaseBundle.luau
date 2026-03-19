local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
return function(v4, v5, v6, v7, v8, v9, v10) --[[ Line: 11 ]]
    -- upvalues: v2 (copy), v3 (copy)
    v2.isType(v5, "string", "purchaseBundle event expects eventContext");
    v2.isType(v6, "string", "purchaseBundle event expects itemId");
    v2.isType(v7, "string", "purchaseBundle event expects itemSubType");
    v2.isTypeOrNil(v8, "number", "purchaseBundle event expects priceInRobux");
    v2.isTypeOrNil(v9, "boolean", "purchaseAsset event expects fromProfile");
    v2.isTypeOrNil(v10, "boolean", "purchaseAsset event expects fromContentFeed");
    local l_AnalyticsTag_0 = v3.AnalyticsTag;
    if v9 then
        l_AnalyticsTag_0 = v3.ProfileAnalyticsTag;
    elseif v10 then
        l_AnalyticsTag_0 = v3.ContentFeedAnalyticsTag;
    end;
    v4:sendTelemetryEvent(v5, v5, {
        feature = l_AnalyticsTag_0, 
        itemID = v6, 
        itemSubType = v7, 
        priceInRobux = v8
    });
end;