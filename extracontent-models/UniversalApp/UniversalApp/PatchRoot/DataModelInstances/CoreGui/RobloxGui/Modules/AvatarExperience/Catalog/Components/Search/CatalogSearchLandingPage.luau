local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSearch);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_Common_0 = l_Modules_0.AvatarExperience.Common;
local v9 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v10 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v12 = require(l_Modules_0.LuaApp.Thunks.FetchAutocompleteSuggestion);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchSearchRecentlyViewed);
local v14 = require(l_Modules_0.AvatarExperience.Common.Thunks.ToggleTryOnThunk);
local v15 = require(l_Common_0.Thunks.SetFullView);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v18 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v19 = require(l_Modules_0.AvatarExperience.Common.Hooks.useSendCounter);
local v20 = require(script.Parent.useSearchTelemetry);
local v21 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v22 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local v23 = require(l_Common_0.Enum.FullView);
local _ = require(l_Modules_0.AvatarExperience.Catalog.SearchTypes);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v27 = require(l_Modules_0.LuaApp.SearchUuid);
local l_wasLastInputGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).wasLastInputGamepad;
local l_getAvatarEventCounterNameWithPlatform_0 = v6.getAvatarEventCounterNameWithPlatform;
local v30 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local l_getUseSelectorDeepEquals_0 = v5.Utils.getUseSelectorDeepEquals;
local v32 = require(l_Modules_0.LuaApp.Actions.SetSearchParameters);
local v33 = require(l_Modules_0.LuaApp.Actions.SetSearchType);
local l_Focusable_0 = v3.Focusable;
local v35 = require(l_Common_0.Components.AvatarExperienceView);
local l_SearchLandingPage_0 = v4.Features.SearchLandingPage;
local l_useSearchLandingPageProps_0 = v4.Features.useSearchLandingPageProps;
local v38 = require(l_Common_0.Components.GamepadFocusHandlerForPage);
local v39 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v40 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local l_AXRecentlyViewedSearchItemsIXPTest_0 = v5.Experiments.AXRecentlyViewedSearchItemsIXPTest;
local v42 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXMoveRobuxBalanceButtonLower);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
return (v40((v39(function(v44) --[[ Line: 61 ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v2 (copy), v3 (copy), l_useDispatch_0 (copy), l_AXRecentlyViewedSearchItemsIXPTest_0 (copy), v18 (copy), v11 (copy), v9 (copy), v10 (copy), v19 (copy), v20 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), v21 (copy), v13 (copy), v12 (copy), v22 (copy), v33 (copy), v32 (copy), v15 (copy), l_AvatarScreen_0 (copy), v23 (copy), v26 (copy), v30 (copy), v14 (copy), l_getAvatarEventCounterNameWithPlatform_0 (copy), l_Focusable_0 (copy), v35 (copy), l_DeviceOrientationMode_0 (copy), v42 (copy), v38 (copy), l_wasLastInputGamepad_0 (copy), l_SearchLandingPage_0 (copy), l_useSearchLandingPageProps_0 (copy), v27 (copy)
    local v45 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v2.useRef(v3.createFocusController()).current;
    local v46 = v2.useRef(nil);
    local v47 = v2.useRef(nil);
    local v48 = l_useDispatch_0();
    local v49 = if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() then v18(v11) else nil;
    local v50 = v18(v9);
    local v51 = v18(v10);
    local v52 = v19();
    local v53 = v20();
    local v55 = l_useSelector_0(function(v54) --[[ Line: 78 ]]
        return v54.AvatarExperience.AvatarAutocompleteSuggestions;
    end, l_getUseSelectorDeepEquals_0());
    local v57 = l_useSelector_0(function(v56) --[[ Line: 81 ]]
        return v56.TopBar.statusBarHeight;
    end, l_getUseSelectorDeepEquals_0());
    local v59 = l_useSelector_0(function(v58) --[[ Line: 84 ]]
        return v58.DeviceOrientation;
    end, l_getUseSelectorDeepEquals_0());
    local v60 = l_useSelector_0(v21, l_getUseSelectorDeepEquals_0());
    local v63 = if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() then v2.useCallback(function(v61, v62) --[[ Line: 94 ]]
        -- upvalues: v48 (copy), v13 (ref), v50 (copy)
        v48(v13(v50, v61, v62));
    end, {
        v50, 
        v48
    }) else nil;
    local v65 = v2.useCallback(function(v64) --[[ Line: 99 ]]
        -- upvalues: v48 (copy), v12 (ref), v50 (copy), v22 (ref)
        v48(v12.Fetch(v50, v64, nil, v22.SearchTypes.Catalog));
    end, {
        v50, 
        v48, 
        v55
    });
    local v67 = v2.useCallback(function(v66) --[[ Line: 104 ]]
        -- upvalues: v48 (copy), v33 (ref), v22 (ref)
        v48(v33(v66, v22.SearchTypes.Catalog));
    end, {
        v48
    });
    local v70 = v2.useCallback(function(v68, v69) --[[ Line: 108 ]]
        -- upvalues: v48 (copy), v32 (ref)
        v48(v32(v68, v69));
    end, {
        v48
    });
    local v71 = v2.useCallback(function() --[[ Line: 112 ]]
        -- upvalues: v48 (copy), v15 (ref), v51 (copy), l_AvatarScreen_0 (ref), v23 (ref)
        v48(v15(v51, l_AvatarScreen_0.CatalogSearch, v23.UIFullView));
    end, {
        v48, 
        v51
    });
    local v74 = v2.useCallback(function(v72, v73) --[[ Line: 116 ]]
        -- upvalues: v26 (ref), v44 (copy)
        v26.navigateToSearch(v44.navigation, v72, v73);
    end, {
        v44.navigation
    });
    local v79 = if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() then v2.useCallback(function(v75) --[[ Line: 121 ]]
        -- upvalues: v30 (ref), v48 (copy), v14 (ref), v50 (copy), v51 (copy), v44 (copy)
        local l_id_0 = v75.id;
        local l_itemType_0 = v75.itemType;
        local v78 = v30.GetItemSubType(l_itemType_0, v75);
        v48(v14(v50, v51, l_itemType_0, v78, l_id_0, true, v44.avatarRoute, v44.navigation));
    end, {
        v50, 
        v51, 
        v44.avatarRoute, 
        v44.navigation, 
        v48
    }) else nil;
    local v83 = v2.useCallback(function(v80, v81) --[[ Line: 141 ]]
        -- upvalues: l_getAvatarEventCounterNameWithPlatform_0 (ref), v51 (copy)
        local v82 = l_getAvatarEventCounterNameWithPlatform_0(v80);
        v51.Diag:reportStats(v82, v81);
    end, {
        v51
    });
    return v2.createElement(l_Focusable_0.Frame, {
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v45, 
        defaultChild = v46, 
        restorePreviousChildFocus = true, 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1)
    }, {
        AvatarExperienceView = v2.createElement(v35, {
            defaultChildRef = v46, 
            avatarRoute = v44.avatarRoute, 
            allowAdaptiveScrolling = false, 
            isSceneFullView = false, 
            isUIFullView = v59 == l_DeviceOrientationMode_0.Portrait, 
            NextSelectionDown = v46, 
            showMultiTryOnBottomBar = not v60, 
            showRobuxBalance = if v42 then not v60 else nil
        }, {
            GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v2.createElement(v38, {
                focusController = v45, 
                isGamepadInput = l_wasLastInputGamepad_0(), 
                captureFocusOnMount = true
            }), 
            SearchLandingPage = v2.createElement(l_SearchLandingPage_0, l_useSearchLandingPageProps_0({
                navigation = v44.navigation, 
                statusBarHeight = v57, 
                deviceOrientation = v59, 
                autocompleteState = v55, 
                navigateToSearch = v74, 
                fetchAutocompleteSuggestions = v65, 
                fetchSearchRecentlyViewed = if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() then v63 else nil, 
                createSearchUuid = v27, 
                setSearchType = v67, 
                setSearchParameters = v70, 
                setFullView = v71, 
                toggleTryOn = if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() then v79 else nil, 
                searchBarRef = v46, 
                firstSuggestedItemRef = v47, 
                focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v45, 
                sendStats = v83, 
                sendCounter = v52, 
                searchTelemetry = v53, 
                catalogAnalytics = if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() then v49 else nil
            }))
        })
    });
end))));