local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_IsVRAppBuild_0 = v2.IsVRAppBuild;
local v5 = require(l_Modules_0.LuaApp.AppPage);
local v6 = require(l_CorePackages_0.Packages.React);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v9 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useUiModeInfo_0 = v9.useUiModeInfo;
local l_usePrevious_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.usePrevious;
local v14 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v15 = require(l_Modules_0.LuaApp.Navigation.AndroidBackButtonConnection);
local l_Common_0 = l_Modules_0.AvatarExperience.Common;
local v17 = if require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXTransitionMenuV2)() then require(l_Modules_0.AvatarExperience.Common.Components.AXTransitionSegmentedMenu) else require(l_Modules_0.AvatarExperience.Common.Components.AXTransitionSegmentedMenu_DEPRECATED);
local v18 = require(l_Common_0.Components.TopBar.makeAvatarBackButton);
local v19 = require(l_Common_0.Components.TopBar.ManageButton);
local v20 = require(l_Common_0.Components.TopBar.CommunityAvatarEntryButton);
local v21 = require(l_Common_0.Components.TopBar.makeTitleDropDown);
local v22 = require(l_Common_0.Components.RoactNavigation.Utils.isAvatarRouteVisible);
local v23 = require(l_Modules_0.AvatarExperience.Flags.GetIfUserInFStringAXCommunityAvatarsEntryPointWhiteList);
local l_FFlagAXAvatarSharingEntryPoint_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarSharingEntryPoint;
local l_FFlagAXOpaqueMarketplaceTopbar_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXOpaqueMarketplaceTopbar;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local function v28(v27) --[[ Line: 61 ]] --[[ Name: selectIsPortrait ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy)
    return v27.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
end;
local function v30(v29) --[[ Line: 65 ]] --[[ Name: selectIsCurrentUserAllowedToCreateShares ]]
    return v29.AvatarExperience.Catalog.Metadata.isCurrentUserAllowedToCreateShares;
end;
return function(v31) --[[ Line: 69 ]] --[[ Name: AvatarEditorTopBar ]]
    -- upvalues: l_useSelector_0 (copy), v28 (copy), v30 (copy), l_useLocalization_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v6 (copy), v15 (copy), v5 (copy), l_AvatarScreen_0 (copy), v22 (copy), l_usePrevious_0 (copy), v18 (copy), v21 (copy), l_IsVRAppBuild_0 (copy), v17 (copy), v19 (copy), v23 (copy), l_FFlagAXAvatarSharingEntryPoint_0 (copy), v20 (copy), v14 (copy), l_FFlagAXOpaqueMarketplaceTopbar_0 (copy)
    local v32 = l_useSelector_0(v28);
    local v33 = l_useSelector_0(v30);
    local l_navigation_0 = v31.navigation;
    local v35 = l_useLocalization_0({
        title = "Feature.Catalog.Action.Customize"
    });
    local v36 = false;
    if l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot then
        v36 = not l_FFlagEnableLeftNavOnConsole_0;
    end;
    local l_current_0 = v6.useRef(v15()).current;
    local l_showManageOutfitButton_0 = v31.showManageOutfitButton;
    local v40 = v6.useCallback(function() --[[ Line: 82 ]]
        -- upvalues: v5 (ref), v36 (copy), l_AvatarScreen_0 (ref), l_navigation_0 (copy)
        local l_Home_0 = v5.Home;
        if v36 then
            l_Home_0 = l_AvatarScreen_0.AvatarExperienceLandingPage;
        end;
        l_navigation_0.navigate(l_Home_0);
    end, {
        l_navigation_0, 
        v36
    });
    v6.useEffect(function() --[[ Line: 90 ]]
        -- upvalues: v22 (ref), v31 (copy), l_current_0 (copy), v40 (copy)
        if v22(v31) then
            l_current_0.connect(v40);
        end;
        return function() --[[ Line: 94 ]]
            -- upvalues: l_current_0 (ref)
            l_current_0.disconnect();
        end;
    end, {
        v31.navigation, 
        v31.avatarRoute, 
        l_current_0, 
        v40
    });
    local v41 = l_usePrevious_0(v31);
    v6.useEffect(function() --[[ Line: 105 ]]
        -- upvalues: v41 (copy), v22 (ref), v31 (copy), l_current_0 (copy), v40 (copy)
        if not v41 then
            return;
        elseif not v22(v41) and v22(v31) then
            l_current_0.connect(v40);
            return;
        else
            if v22(v41) and not v22(v31) then
                l_current_0.disconnect();
            end;
            return;
        end;
    end, {
        v31.navigation, 
        v31.avatarRoute, 
        v41, 
        l_current_0
    });
    local v42 = v18(v40);
    local v43 = v21("Feature.Catalog.Action.Customize", v31.overlayClosedCallback);
    local v44 = nil;
    local v45 = nil;
    local v46 = nil;
    if l_IsVRAppBuild_0() then
        v44 = nil;
        v45 = nil;
        v46 = {};
    else
        v44 = v42;
        v45 = if v36 then v43 else v17;
        v46 = if l_showManageOutfitButton_0 then {
            v19
        } else {};
    end;
    v46 = if not (not not v33 or v23()) or v36 or l_FFlagAXAvatarSharingEntryPoint_0 then {} else {
        v20
    };
    return v6.createElement(v14.Container, {
        transparentBackground = not l_FFlagAXOpaqueMarketplaceTopbar_0 or v32 and true or false, 
        hideSiteMessageBanner = v32, 
        ref = v31.topBarRef, 
        NextSelectionDown = v31.NextSelectionDown, 
        NextSelectionRight = v31.NextSelectionRight, 
        titleText = v35.title, 
        leftItem = v44, 
        centerItem = v45, 
        rightItems = v46, 
        useParentSizeForCenterItem = true
    });
end;