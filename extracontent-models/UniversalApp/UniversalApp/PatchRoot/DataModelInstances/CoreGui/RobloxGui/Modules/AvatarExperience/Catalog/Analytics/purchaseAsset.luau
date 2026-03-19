local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
return function(v5, v6, v7, v8, v9, v10, v11, v12) --[[ Line: 13 ]]
    -- upvalues: v3 (copy), v4 (copy), l_RbxAnalyticsService_0 (copy)
    v3.isType(v6, "string", "purchaseAsset event expects eventContext");
    v3.isType(v7, "string", "purchaseAsset event expects itemId");
    v3.isType(v8, "string", "purchaseAsset event expects itemSubType");
    v3.isTypeOrNil(v9, "number", "purchaseAsset event expects priceInRobux");
    v3.isTypeOrNil(v10, "boolean", "purchaseAsset event expects fromProfile");
    v3.isTypeOrNil(v12, "boolean", "purchaseAsset event expects fromContentFeed");
    local l_AnalyticsTag_0 = v4.AnalyticsTag;
    if v10 then
        l_AnalyticsTag_0 = v4.ProfileAnalyticsTag;
    elseif v12 then
        l_AnalyticsTag_0 = v4.ContentFeedAnalyticsTag;
    end;
    v5:sendTelemetryEvent(v6, v6, {
        feature = l_AnalyticsTag_0, 
        itemID = v7, 
        itemSubType = v8, 
        priceInRobux = v9
    });
    if v11 then
        v5:sendTelemetryEvent(v6, "purchaseAssetHasAccessoryAdjustment", {
            feature = l_AnalyticsTag_0, 
            itemID = v7, 
            itemSubType = v8, 
            priceInRobux = v9, 
            refineSessionId = l_RbxAnalyticsService_0:GetSessionId()
        });
    end;
end;