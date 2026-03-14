local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_InfoPeekView_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).InfoPeekView;
return function() --[[ Line: 6 ]] --[[ Name: SponsoredTooltipPeekView ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), l_InfoPeekView_0 (copy)
    local v4 = l_useLocalization_0({
        SponsoredTitle = "CoreScripts.Ads.Label.SponsoredAds", 
        SponsoredDisclosure = "CoreScripts.Ads.Label.SponsoredAdsDisclosureStatic"
    });
    return v1.createElement(l_InfoPeekView_0, {
        title = v4.SponsoredTitle, 
        body = v4.SponsoredDisclosure
    });
end;