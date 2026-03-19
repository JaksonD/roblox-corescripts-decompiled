local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return function(v2, v3, v4) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    v1.isType(v3, "string", "premiumUpsellCancelled event expects assetId");
    v1.isType(v4, "boolean", "premiumUpsellCancelled event expects isBundle");
    v2:sendTelemetryEvent("PremiumUpsell", v4 and "BundlePremiumUpsellCanceled" or "AssetPremiumUpsellCanceled", {
        BundleID = v3, 
        Location = "Catalog"
    });
end;