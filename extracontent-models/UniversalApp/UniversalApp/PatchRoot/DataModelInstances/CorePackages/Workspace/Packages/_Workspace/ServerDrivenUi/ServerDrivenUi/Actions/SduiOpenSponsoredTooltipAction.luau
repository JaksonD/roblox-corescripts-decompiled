local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local l_localizeStrings_0 = require(l_Parent_0.Localization).localizeStrings;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local v3 = require(l_Parent_0.Responsive);
local l_GetInputModeStore_0 = v3.GetInputModeStore;
local l_OpenInfoPeekView_0 = require(l_Parent_0.DiscoveryRouting).OpenInfoPeekView;
local l_OpenCloseOnlyInteractiveAlert_0 = require(l_Parent_0.DiscoveryRouting).OpenCloseOnlyInteractiveAlert;
local l_SduiResponsiveHelpers_0 = require(l_Parent_0.SduiCoreSystem).SduiResponsiveHelpers;
return function(_, _, v10) --[[ Line: 19 ]]
    -- upvalues: l_localizeStrings_0 (copy), l_SduiResponsiveHelpers_0 (copy), l_GetInputModeStore_0 (copy), v3 (copy), l_OpenInfoPeekView_0 (copy), l_OpenCloseOnlyInteractiveAlert_0 (copy), l_CloseCentralOverlay_0 (copy)
    local l_dispatch_0 = v10.dependencies.dispatch;
    local l_localization_0 = v10.dependencies.localization;
    local v13 = l_localizeStrings_0(l_localization_0, {
        SponsoredDisclosure = "CoreScripts.Ads.Label.SponsoredAdsDisclosureStatic", 
        SponsoredTitle = "CoreScripts.Ads.Label.SponsoredAds"
    });
    local v14 = l_SduiResponsiveHelpers_0.isPortraitOrientation();
    local v15 = l_GetInputModeStore_0(false).getLastInputType(false);
    local l_SponsoredDisclosure_0 = v13.SponsoredDisclosure;
    local l_SponsoredTitle_0 = v13.SponsoredTitle;
    if v15 == v3.Input.Touch and v14 then
        l_dispatch_0(l_OpenInfoPeekView_0(l_SponsoredTitle_0, l_SponsoredDisclosure_0));
        return;
    else
        l_dispatch_0(l_OpenCloseOnlyInteractiveAlert_0(l_SponsoredTitle_0, l_SponsoredDisclosure_0, function() --[[ Line: 38 ]]
            -- upvalues: l_dispatch_0 (copy), l_CloseCentralOverlay_0 (ref)
            return l_dispatch_0(l_CloseCentralOverlay_0());
        end));
        return;
    end;
end;