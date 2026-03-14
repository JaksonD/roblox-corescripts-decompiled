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
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local v19 = require(l_CorePackages_0.Workspace.Packages.CollectionViews);
local v20 = require(l_CorePackages_0.Workspace.Packages.SocialExperiments);
local l_FFlagTestDeviceForFAEUpsell_0 = v20.FFlagTestDeviceForFAEUpsell;
local l_deviceMeetsRequirementsForFAE_0 = v20.deviceMeetsRequirementsForFAE;
local l_usePageSideMargin_0 = v19.usePageSideMargin;
local v24 = require(l_Modules_0.LuaApp.Components.Home.HomePageUpsellCardWithIcon);
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
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v15.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v15.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING;
return function(_) --[[ Line: 50 ]]
    -- upvalues: l_useSelector_0 (copy), l_useAppPolicy_0 (copy), l_FFlagEnableSocialUpsellUIFixes_0 (copy), v3 (copy), l_FFlagEnableAEGIS1HomePageBanner_0 (copy), l_useDispatch_0 (copy), l_useSocialUpsellOverlayController_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_startFacialAgeEstimation_0 (copy), l_FFlagAddMinorFixesToUpsellAnalytics_0 (copy), l_SocialUpsellType_0 (copy), l_UpsellEntrySurfaceType_0 (copy), l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 (copy), v9 (copy), l_UpsellComponent_0 (copy), l_PostHomePageContactMethodModuleVariationDismiss_0 (copy), l_useStyle_0 (copy), l_useResponsiveLayout_0 (copy), l_FormFactor_0 (copy), l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 (copy), l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 (copy), l_usePageSideMargin_0 (copy), l_FFlagTestDeviceForFAEUpsell_0 (copy), l_deviceMeetsRequirementsForFAE_0 (copy), v4 (copy), v24 (copy), l_isSubjectToDesktopPolicies_0 (copy), l_IsVRAppBuild_0 (copy), l_UpsellBanner_0 (copy), l_createBannerConfigFromUpsellCardVariation_0 (copy)
    local v41 = l_useSelector_0(function(v40) --[[ Line: 51 ]]
        return v40.HomePageUpsellCardVariation;
    end);
    local v43 = l_useAppPolicy_0(function(v42) --[[ Line: 54 ]]
        return v42.useGridPageLayout();
    end);
    local v44 = nil;
    if l_FFlagEnableSocialUpsellUIFixes_0 then
        v44 = v3.useRef(nil);
    end;
    local v45 = nil;
    local v46 = nil;
    local v47 = nil;
    local v48 = nil;
    local v49 = l_FFlagEnableAEGIS1HomePageBanner_0 and v41 and v41.upsellCardType and v41.upsellCardV2Config;
    if l_FFlagEnableAEGIS1HomePageBanner_0 then
        v45 = l_useDispatch_0();
        local v50 = l_useSocialUpsellOverlayController_0(false);
        local v51 = l_useRoactService_0(l_RoactNetworking_0);
        v46 = v3.useCallback(function(_) --[[ Line: 76 ]]
            -- upvalues: v41 (copy), v45 (ref), l_startFacialAgeEstimation_0 (ref), l_FFlagAddMinorFixesToUpsellAnalytics_0 (ref), l_SocialUpsellType_0 (ref), l_UpsellEntrySurfaceType_0 (ref), l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 (ref)
            if v41 and v41.upsellCardType == "Fae" then
                v45(l_startFacialAgeEstimation_0(if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_SocialUpsellType_0.FacialAgeEstimation .. l_UpsellEntrySurfaceType_0.Homepage else l_DEFAULT_FAE_ENTRY_POINT_EVENT_CTX_0 .. l_UpsellEntrySurfaceType_0.HomepageBanner, nil, nil, if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_UpsellEntrySurfaceType_0.Homepage else l_UpsellEntrySurfaceType_0.HomepageBanner));
            end;
        end, {
            v45, 
            v41
        });
        v47 = v3.useCallback(function(v53) --[[ Line: 92 ]]
            -- upvalues: v41 (copy), v50 (copy), v9 (ref), l_FFlagAddMinorFixesToUpsellAnalytics_0 (ref), l_UpsellEntrySurfaceType_0 (ref), l_UpsellComponent_0 (ref)
            if v41 and v41.upsellCardType == "Fae" then
                v50.openSocialOverlay(v9.Enums.SocialUpsellType.FacialAgeEstimation, {
                    upsellEntrySurface = if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_UpsellEntrySurfaceType_0.Homepage else l_UpsellEntrySurfaceType_0.HomepageBanner, 
                    upsellEntryComponent = if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_UpsellComponent_0.Banner else nil, 
                    impressionId = v53
                });
            end;
        end, {
            v41, 
            v50.openSocialOverlay
        });
        local l_v51_0 = v51 --[[ copy: 10 -> 15 ]];
        v48 = v3.useCallback(function(_) --[[ Line: 105 ]]
            -- upvalues: v45 (ref), v41 (copy), l_PostHomePageContactMethodModuleVariationDismiss_0 (ref), l_v51_0 (copy)
            if v45 and v41 then
                v45(l_PostHomePageContactMethodModuleVariationDismiss_0(l_v51_0, v41.upsellCardType));
            end;
        end, {
            v41, 
            v51
        });
    end;
    local l_Theme_0 = l_useStyle_0().Theme;
    local v58 = l_useSelector_0(function(v57) --[[ Line: 117 ]]
        return v57.FormFactor;
    end);
    local v59 = l_useResponsiveLayout_0("margin");
    local v60 = nil;
    v60 = if v43 then v59 else if v58 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0;
    if l_FFlagEnableSocialUpsellUIFixes_0 then
        local v61 = l_usePageSideMargin_0(v44.current);
        if v49 then
            v60 = v61;
        end;
    end;
    if l_FFlagTestDeviceForFAEUpsell_0 and v49 and not l_deviceMeetsRequirementsForFAE_0() then
        return nil;
    else
        return v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            ref = if l_FFlagEnableSocialUpsellUIFixes_0 then v44 else nil
        }, {
            UIPadding = v4.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v60), 
                PaddingRight = UDim.new(0, v60), 
                PaddingTop = UDim.new(0, 1)
            }), 
            HomePageUpsellCard = if l_FFlagEnableAEGIS1HomePageBanner_0 and v49 then nil else v4.createElement(v24, {
                upsellCardVariation = v41, 
                isCentered = l_isSubjectToDesktopPolicies_0() or l_IsVRAppBuild_0()
            }), 
            HomePageUpsellBannerV2 = if l_FFlagEnableAEGIS1HomePageBanner_0 and v49 and v41.upsellCardType ~= "" then v4.createElement(l_UpsellBanner_0, {
                config = l_createBannerConfigFromUpsellCardVariation_0(v41), 
                onPrimaryAction = v46, 
                onSecondaryAction = v47, 
                onDismiss = v48, 
                upsellEntrySurface = if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_UpsellEntrySurfaceType_0.Homepage else l_UpsellEntrySurfaceType_0.HomepageBanner, 
                upsellEntryComponent = if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_UpsellComponent_0.Banner else nil
            }) else nil
        });
    end;
end;