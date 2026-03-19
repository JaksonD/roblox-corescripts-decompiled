local l_Parent_0 = script:FindFirstAncestor("Ads").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_IconWithTooltip_0 = require(l_Parent_0.AppBlox).IconWithTooltip;
return function(v5) --[[ Line: 20 ]] --[[ Name: SponsoredTooltipHover ]]
    -- upvalues: l_useLocalization_0 (copy), v2 (copy), l_IconWithTooltip_0 (copy), v1 (copy)
    local v6 = l_useLocalization_0({
        SponsoredDisclosure = "CoreScripts.Ads.Label.SponsoredAdsDisclosureStatic"
    });
    return v2.createElement(l_IconWithTooltip_0, v1.Dictionary.join(v5, {
        hoverText = v6.SponsoredDisclosure, 
        triggerPointName = "SponsoredTooltip"
    }));
end;