local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Packages_0 = l_CorePackages_0.Workspace.Packages;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v9 = require(l_CorePackages_0.Workspace.Packages.SocialUpsell);
local l_useResponsiveLayout_0 = v5.Core.Layout.Responsive.useResponsiveLayout;
local l_useAppPolicy_0 = require(l_Packages_0.UniversalAppPolicy).useAppPolicy;
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local l_FFlagEnableSocialUpsellUIFixes_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableSocialUpsellUIFixes;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v15 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_Modules_1 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_OmniFeedProps_0 = l_Modules_1.Personalization.OmniFeed.OmniFeedProps;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local v20 = require(l_CorePackages_0.Workspace.Packages.CollectionViews);
local v21 = require(l_CorePackages_0.Workspace.Packages.SocialExperiments);
local l_FFlagTestDeviceForFAEUpsell_0 = v21.FFlagTestDeviceForFAEUpsell;
local l_deviceMeetsRequirementsForFAE_0 = v21.deviceMeetsRequirementsForFAE;
local l_usePageSideMargin_0 = v20.usePageSideMargin;
local v25 = require(l_Modules_0.LuaApp.Components.Home.HomePageUpsellCardWithIcon);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_UpsellBanner_0 = v9.UpsellBanner;
local l_createBannerConfigFromUpsellCardVariation_0 = v9.Utils.createBannerConfigFromUpsellCardVariation;
local l_PostHomePageContactMethodModuleVariationDismiss_0 = l_Modules_1.LuaApp.Thunks.PostHomePageContactMethodModuleVariationDismiss;
local l_FFlagEnableAEGIS1HomePageBanner_0 = v9.Flags.FFlagEnableAEGIS1HomePageBanner;
local l_FFlagAddMinorFixesToUpsellAnalytics_0 = v9.Flags.FFlagAddMinorFixesToUpsellAnalytics;
local l_UpsellEntrySurfaceType_0 = v9.Analytics.Enum.UpsellEntrySurfaceType;
local l_SocialUpsellType_0 = v9.Enums.SocialUpsellType;
local l_UpsellComponent_0 = v9.Analytics.Enum.UpsellComponent;
local l_startFacialAgeEstimation_0 = v9.Thunks.startFacialAgeEstimation;
local l_useSocialUpsellOverlayController_0 = v9.Hooks.useSocialUpsellOverlayController;
local l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 = v9.Constants.DEFAULT_FAE_ENTRY_POINT_EVENT_CTX;
local l_FFlagLuaAppCompositionSupport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppCompositionAlways;
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v15.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v15.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING;
return function(v42) --[[ Line: 54 ]]
    -- upvalues: l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_OmniFeedProps_0 (copy), l_useSelector_0 (copy), l_useAppPolicy_0 (copy), l_FFlagEnableSocialUpsellUIFixes_0 (copy), v3 (copy), l_FFlagEnableAEGIS1HomePageBanner_0 (copy), l_useDispatch_0 (copy), l_useSocialUpsellOverlayController_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_startFacialAgeEstimation_0 (copy), l_FFlagAddMinorFixesToUpsellAnalytics_0 (copy), l_SocialUpsellType_0 (copy), l_UpsellEntrySurfaceType_0 (copy), l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 (copy), v9 (copy), l_UpsellComponent_0 (copy), l_PostHomePageContactMethodModuleVariationDismiss_0 (copy), l_useStyle_0 (copy), l_useResponsiveLayout_0 (copy), l_FormFactor_0 (copy), l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 (copy), l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 (copy), l_usePageSideMargin_0 (copy), l_FFlagTestDeviceForFAEUpsell_0 (copy), l_deviceMeetsRequirementsForFAE_0 (copy), v4 (copy), v25 (copy), l_isSubjectToDesktopPolicies_0 (copy), l_IsVRAppBuild_0 (copy), l_UpsellBanner_0 (copy), l_createBannerConfigFromUpsellCardVariation_0 (copy)
    local v43 = l_FFlagLuaAppCompositionAlways_0 and true or if l_FFlagLuaAppCompositionSupport_0 then v42[l_OmniFeedProps_0.key].appCompositionEnabled else nil;
    local v45 = l_useSelector_0(function(v44) --[[ Line: 60 ]]
        return v44.HomePageUpsellCardVariation;
    end);
    local v47 = l_useAppPolicy_0(function(v46) --[[ Line: 63 ]]
        return v46.useGridPageLayout();
    end);
    local v48 = nil;
    if l_FFlagEnableSocialUpsellUIFixes_0 then
        v48 = v3.useRef(nil);
    end;
    local v49 = nil;
    local v50 = nil;
    local v51 = nil;
    local v52 = nil;
    local v53 = l_FFlagEnableAEGIS1HomePageBanner_0 and v45 and v45.upsellCardType and v45.upsellCardV2Config;
    if l_FFlagEnableAEGIS1HomePageBanner_0 then
        v49 = l_useDispatch_0();
        local v54 = l_useSocialUpsellOverlayController_0(false);
        local v55 = l_useRoactService_0(l_RoactNetworking_0);
        v50 = v3.useCallback(function(_) --[[ Line: 85 ]]
            -- upvalues: v45 (copy), v49 (ref), l_startFacialAgeEstimation_0 (ref), l_FFlagAddMinorFixesToUpsellAnalytics_0 (ref), l_SocialUpsellType_0 (ref), l_UpsellEntrySurfaceType_0 (ref), l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 (ref)
            if v45 and v45.upsellCardType == "Fae" then
                v49(l_startFacialAgeEstimation_0(if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_SocialUpsellType_0.FacialAgeEstimation .. l_UpsellEntrySurfaceType_0.Homepage else l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 .. l_UpsellEntrySurfaceType_0.HomepageBanner, nil, nil, if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_UpsellEntrySurfaceType_0.Homepage else l_UpsellEntrySurfaceType_0.HomepageBanner));
            end;
        end, {
            v49, 
            v45
        });
        v51 = v3.useCallback(function(v57) --[[ Line: 101 ]]
            -- upvalues: v45 (copy), v54 (copy), v9 (ref), l_FFlagAddMinorFixesToUpsellAnalytics_0 (ref), l_UpsellEntrySurfaceType_0 (ref), l_UpsellComponent_0 (ref)
            if v45 and v45.upsellCardType == "Fae" then
                v54.openSocialOverlay(v9.Enums.SocialUpsellType.FacialAgeEstimation, {
                    upsellEntrySurface = if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_UpsellEntrySurfaceType_0.Homepage else l_UpsellEntrySurfaceType_0.HomepageBanner, 
                    upsellEntryComponent = if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_UpsellComponent_0.Banner else nil, 
                    impressionId = v57
                });
            end;
        end, {
            v45, 
            v54.openSocialOverlay
        });
        local l_v55_0 = v55 --[[ copy: 11 -> 16 ]];
        v52 = v3.useCallback(function(_) --[[ Line: 114 ]]
            -- upvalues: v49 (ref), v45 (copy), l_PostHomePageContactMethodModuleVariationDismiss_0 (ref), l_v55_0 (copy)
            if v49 and v45 then
                v49(l_PostHomePageContactMethodModuleVariationDismiss_0(l_v55_0, v45.upsellCardType));
            end;
        end, {
            v45, 
            v55
        });
    end;
    local l_Theme_0 = l_useStyle_0().Theme;
    local v62 = l_useSelector_0(function(v61) --[[ Line: 126 ]]
        return v61.FormFactor;
    end);
    local v63 = if not l_FFlagLuaAppCompositionAlways_0 then l_useResponsiveLayout_0("margin") else nil;
    local v64 = nil;
    v64 = if v43 then nil else if v47 then v63 else if v62 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0;
    if not l_FFlagLuaAppCompositionAlways_0 and l_FFlagEnableSocialUpsellUIFixes_0 then
        local v65 = l_usePageSideMargin_0(v48.current);
        if v53 then
            v64 = v65;
        end;
    end;
    if l_FFlagTestDeviceForFAEUpsell_0 and v53 and not l_deviceMeetsRequirementsForFAE_0() then
        return nil;
    else
        return v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            ref = if l_FFlagEnableSocialUpsellUIFixes_0 then v48 else nil
        }, {
            UIPadding = v4.createElement("UIPadding", {
                PaddingLeft = if v43 then nil else UDim.new(0, v64), 
                PaddingRight = if v43 then nil else UDim.new(0, v64), 
                PaddingTop = UDim.new(0, 1)
            }), 
            HomePageUpsellCard = if l_FFlagEnableAEGIS1HomePageBanner_0 and v53 then nil else v4.createElement(v25, {
                upsellCardVariation = v45, 
                isCentered = l_isSubjectToDesktopPolicies_0() or l_IsVRAppBuild_0()
            }), 
            HomePageUpsellBannerV2 = if l_FFlagEnableAEGIS1HomePageBanner_0 and v53 and v45.upsellCardType ~= "" then v4.createElement(l_UpsellBanner_0, {
                config = l_createBannerConfigFromUpsellCardVariation_0(v45), 
                onPrimaryAction = v50, 
                onSecondaryAction = v51, 
                onDismiss = v52, 
                upsellEntrySurface = if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_UpsellEntrySurfaceType_0.Homepage else l_UpsellEntrySurfaceType_0.HomepageBanner, 
                upsellEntryComponent = if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_UpsellComponent_0.Banner else nil
            }) else nil
        });
    end;
end;