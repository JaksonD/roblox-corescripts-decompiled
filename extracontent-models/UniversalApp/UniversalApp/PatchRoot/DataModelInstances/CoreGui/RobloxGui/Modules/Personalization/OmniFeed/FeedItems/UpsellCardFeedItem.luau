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
local l_UpsellEntrySurfaceType_0 = v9.Analytics.Enum.UpsellEntrySurfaceType;
local l_SocialUpsellType_0 = v9.Enums.SocialUpsellType;
local l_UpsellComponent_0 = v9.Analytics.Enum.UpsellComponent;
local l_startFacialAgeEstimation_0 = v9.Thunks.startFacialAgeEstimation;
local l_useSocialUpsellOverlayController_0 = v9.Hooks.useSocialUpsellOverlayController;
local l_FFlagLuaAppCompositionSupport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppCompositionAlways;
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v15.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v15.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING;
return function(v39) --[[ Line: 50 ]]
    -- upvalues: l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_OmniFeedProps_0 (copy), l_useSelector_0 (copy), l_useAppPolicy_0 (copy), l_FFlagEnableSocialUpsellUIFixes_0 (copy), v3 (copy), l_useDispatch_0 (copy), l_useSocialUpsellOverlayController_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_startFacialAgeEstimation_0 (copy), l_SocialUpsellType_0 (copy), l_UpsellEntrySurfaceType_0 (copy), v9 (copy), l_UpsellComponent_0 (copy), l_PostHomePageContactMethodModuleVariationDismiss_0 (copy), l_useStyle_0 (copy), l_useResponsiveLayout_0 (copy), l_FormFactor_0 (copy), l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 (copy), l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 (copy), l_usePageSideMargin_0 (copy), l_FFlagTestDeviceForFAEUpsell_0 (copy), l_deviceMeetsRequirementsForFAE_0 (copy), v4 (copy), v25 (copy), l_isSubjectToDesktopPolicies_0 (copy), l_IsVRAppBuild_0 (copy), l_UpsellBanner_0 (copy), l_createBannerConfigFromUpsellCardVariation_0 (copy)
    local v40 = l_FFlagLuaAppCompositionAlways_0 and true or if l_FFlagLuaAppCompositionSupport_0 then v39[l_OmniFeedProps_0.key].appCompositionEnabled else nil;
    local v42 = l_useSelector_0(function(v41) --[[ Line: 56 ]]
        return v41.HomePageUpsellCardVariation;
    end);
    local v44 = l_useAppPolicy_0(function(v43) --[[ Line: 59 ]]
        return v43.useGridPageLayout();
    end);
    local v45 = nil;
    if l_FFlagEnableSocialUpsellUIFixes_0 then
        v45 = v3.useRef(nil);
    end;
    local v46 = v42 and v42.upsellCardType and v42.upsellCardV2Config;
    local v47 = l_useDispatch_0();
    local v48 = l_useSocialUpsellOverlayController_0(false);
    local v49 = l_useRoactService_0(l_RoactNetworking_0);
    local v51 = v3.useCallback(function(_) --[[ Line: 75 ]]
        -- upvalues: v42 (copy), v47 (copy), l_startFacialAgeEstimation_0 (ref), l_SocialUpsellType_0 (ref), l_UpsellEntrySurfaceType_0 (ref)
        if v42 and v42.upsellCardType == "Fae" then
            v47(l_startFacialAgeEstimation_0(l_SocialUpsellType_0.FacialAgeEstimation .. l_UpsellEntrySurfaceType_0.Homepage, nil, nil, l_UpsellEntrySurfaceType_0.Homepage));
        end;
    end, {
        v47, 
        v42
    });
    local v53 = v3.useCallback(function(v52) --[[ Line: 87 ]]
        -- upvalues: v42 (copy), v48 (copy), v9 (ref), l_UpsellEntrySurfaceType_0 (ref), l_UpsellComponent_0 (ref)
        if v42 and v42.upsellCardType == "Fae" then
            v48.openSocialOverlay(v9.Enums.SocialUpsellType.FacialAgeEstimation, {
                upsellEntrySurface = l_UpsellEntrySurfaceType_0.Homepage, 
                upsellEntryComponent = l_UpsellComponent_0.Banner, 
                impressionId = v52
            });
        end;
    end, {
        v42, 
        v48.openSocialOverlay
    });
    local v55 = v3.useCallback(function(_) --[[ Line: 96 ]]
        -- upvalues: v47 (copy), v42 (copy), l_PostHomePageContactMethodModuleVariationDismiss_0 (ref), v49 (copy)
        if v47 and v42 then
            v47(l_PostHomePageContactMethodModuleVariationDismiss_0(v49, v42.upsellCardType));
        end;
    end, {
        v42, 
        v49
    });
    local l_Theme_0 = l_useStyle_0().Theme;
    local v58 = l_useSelector_0(function(v57) --[[ Line: 105 ]]
        return v57.FormFactor;
    end);
    local v59 = if not l_FFlagLuaAppCompositionAlways_0 then l_useResponsiveLayout_0("margin") else nil;
    local v60 = nil;
    v60 = if v40 then nil else if v44 then v59 else if v58 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0;
    if not l_FFlagLuaAppCompositionAlways_0 and l_FFlagEnableSocialUpsellUIFixes_0 then
        local v61 = l_usePageSideMargin_0(v45.current);
        if v46 then
            v60 = v61;
        end;
    end;
    if l_FFlagTestDeviceForFAEUpsell_0 and v46 and not l_deviceMeetsRequirementsForFAE_0() then
        return nil;
    else
        return v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            ref = if l_FFlagEnableSocialUpsellUIFixes_0 then v45 else nil
        }, {
            UIPadding = v4.createElement("UIPadding", {
                PaddingLeft = if v40 then nil else UDim.new(0, v60), 
                PaddingRight = if v40 then nil else UDim.new(0, v60), 
                PaddingTop = UDim.new(0, 1)
            }), 
            HomePageUpsellCard = if not v46 then v4.createElement(v25, {
                upsellCardVariation = v42, 
                isCentered = l_isSubjectToDesktopPolicies_0() or l_IsVRAppBuild_0()
            }) else nil, 
            HomePageUpsellBannerV2 = if v46 and v42.upsellCardType ~= "" then v4.createElement(l_UpsellBanner_0, {
                config = l_createBannerConfigFromUpsellCardVariation_0(v42), 
                onPrimaryAction = v51, 
                onSecondaryAction = v53, 
                onDismiss = v55, 
                upsellEntrySurface = l_UpsellEntrySurfaceType_0.Homepage, 
                upsellEntryComponent = l_UpsellComponent_0.Banner
            }) else nil
        });
    end;
end;