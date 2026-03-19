local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v3.Focusable;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSearch);
local v7 = require(l_CorePackages_0.Packages.Foundation);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v9 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useTokens_0 = v7.Hooks.useTokens;
local v14 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_Common_0 = l_Modules_0.AvatarExperience.Common;
local v16 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v17 = require(l_Common_0.Context.NamedRefsContext);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v19 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local l_getUseSelectorDeepEquals_0 = v8.Utils.getUseSelectorDeepEquals;
local v21 = require(l_Common_0.Hooks.useOverlayClosedCallback);
local v22 = require(l_Common_0.Hooks.useAvatarExperienceFocusNavigationBindings);
local v23 = require(l_Common_0.Hooks.useFullView);
local v24 = require(l_Common_0.Selectors.selectIsPortrait);
local v25 = require(l_Modules_0.AvatarExperience.Catalog.Components.Search.LandingPage.SearchLandingFocusedWidgetPageItemsView);
local v26 = require(l_Common_0.Components.BoundInputsUpdater);
local v27 = require(l_Common_0.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v28 = require(l_Common_0.Components.AvatarExperienceView);
local v29 = require(l_Common_0.Components.GamepadFocusHandlerForPage);
local v30 = require(l_Common_0.Components.RoactNavigation.withStackVisibilityWrapper);
local l_SearchBar_0 = v6.Components.SearchBar;
local v32 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v33 = require(l_Common_0.Enum.FullView);
local l_Counter_0 = v6.Enums.Counter;
local l_SearchLandingPageWidgetEnum_0 = v6.Enums.SearchLandingPageWidgetEnum;
local v36 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ClearResultsListFocusedWidget);
local v37 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetResultsListFocusedWidget);
local l_AXRecentlyViewedSearchItemsIXPTest_0 = v8.Experiments.AXRecentlyViewedSearchItemsIXPTest;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
selectTopBarHeight = function(v40) --[[ Line: 60 ]] --[[ Name: selectTopBarHeight ]]
    -- upvalues: v32 (copy)
    return v32.selectTopBarHeight(v40);
end;
selectWidgetState = function(v41) --[[ Line: 64 ]] --[[ Name: selectWidgetState ]]
    return v41.AvatarExperience.Common.Widgets.ContextWidgetInfo;
end;
selectWidgetInfo = function(v42, v43) --[[ Line: 68 ]] --[[ Name: selectWidgetInfo ]]
    local v44 = if v42 then v42[v43] else nil;
    if v44 and v44.Details then
        return v44.Details[v43];
    else
        return nil;
    end;
end;
return (v30(function() --[[ Line: 73 ]] --[[ Name: SearchLandingFocusedWidgetPage ]]
    -- upvalues: l_useTokens_0 (copy), l_useNavigation_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v2 (copy), v3 (copy), v21 (copy), v14 (copy), v19 (copy), l_useDispatch_0 (copy), v23 (copy), v33 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), v24 (copy), v22 (copy), v17 (copy), v16 (copy), v18 (copy), l_AvatarScreen_0 (copy), l_SearchLandingPageWidgetEnum_0 (copy), v9 (copy), l_AXRecentlyViewedSearchItemsIXPTest_0 (copy), l_Counter_0 (copy), v37 (copy), v36 (copy), l_Focusable_0 (copy), v26 (copy), v27 (copy), v28 (copy), v7 (copy), l_SearchBar_0 (copy), v29 (copy), v25 (copy)
    local v45 = l_useTokens_0();
    local v46 = l_useNavigation_0();
    local v47 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v2.useRef(v3.createFocusController()).current;
    local v48 = v2.useRef(nil);
    local v49 = v21(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v47);
    local v50 = v14(v19);
    local v51 = l_useDispatch_0();
    local v52, v53 = v23();
    local v54 = v52 == v33.SceneFullView;
    local v55 = v52 == v33.UIFullView;
    local v56 = l_useSelector_0(selectTopBarHeight, l_getUseSelectorDeepEquals_0());
    local v57 = l_useSelector_0(v24, l_getUseSelectorDeepEquals_0());
    local v58 = v2.useRef(nil);
    local v59 = v2.useRef(nil);
    local v60 = v2.useRef(nil);
    local v61 = v2.useRef(nil);
    local v62 = v2.useRef(nil);
    local v63 = v2.useMemo(function() --[[ Line: 100 ]]
        -- upvalues: v49 (copy)
        return {
            overlayClosedCallback = v49
        };
    end, {
        v49
    });
    local v64 = v22(v63);
    local v65 = v2.useContext(v17);
    local v66 = v3.useRefCache();
    local v67 = v46.getParam("widgetType");
    local v68 = l_useSelector_0(selectWidgetState, l_getUseSelectorDeepEquals_0());
    local v69 = v2.useMemo(function() --[[ Line: 110 ]]
        -- upvalues: v68 (copy), v67 (copy)
        return selectWidgetInfo(v68, v67);
    end, {
        v68, 
        v67
    });
    local v71 = v2.useCallback(function() --[[ Line: 115 ]]
        -- upvalues: v16 (ref), v52 (copy), v53 (copy)
        local v70 = v16.getNewFullViewEnum(v52);
        v53(v70);
    end, {
        v52, 
        v53
    });
    local v72 = v2.useCallback(function() --[[ Line: 120 ]]
        -- upvalues: v18 (ref), v46 (copy), l_AvatarScreen_0 (ref)
        v18.closeSearchLandingPageFocusedWidget(v46);
        v46.navigate(l_AvatarScreen_0.CatalogSearchLanding);
    end, {
        v46
    });
    local v74 = v2.useCallback(function(v73) --[[ Line: 125 ]]
        -- upvalues: v72 (copy)
        v73:ReleaseFocus();
        v72();
    end, {
        v72
    });
    local v75 = v2.useCallback(function() --[[ Line: 131 ]]
        -- upvalues: v18 (ref), v46 (copy), l_AvatarScreen_0 (ref)
        v18.closeSearchLandingPageFocusedWidget(v46);
        v46.navigate(l_AvatarScreen_0.Catalog);
    end, {
        v51, 
        v46
    });
    v2.useEffect(function() --[[ Line: 136 ]]
        -- upvalues: v69 (copy), v50 (copy), v67 (copy), l_SearchLandingPageWidgetEnum_0 (ref), v9 (ref), l_AXRecentlyViewedSearchItemsIXPTest_0 (ref), l_Counter_0 (ref), v51 (copy), v37 (ref), v36 (ref), v53 (copy), v33 (ref)
        if v69 then
            if v50 and v67 == l_SearchLandingPageWidgetEnum_0.RecentlyViewedItems then
                local v76 = v9.readTestVariable(l_AXRecentlyViewedSearchItemsIXPTest_0.EnabledTopVariant) or false;
                local v77 = v9.readTestVariable(l_AXRecentlyViewedSearchItemsIXPTest_0.EnabledSaveInCatalog) or false;
                v50.sendAXCounterV2(l_Counter_0.RecentlyViewedFocusedWidgetEntered, {
                    isPositionTopVariant = tostring(v76), 
                    isGlobalSaveVariant = tostring(v77)
                });
            end;
            v51(v37(v69.requestId, v69.id, v69.template));
        end;
        return function() --[[ Line: 155 ]]
            -- upvalues: v69 (ref), v51 (ref), v36 (ref), v53 (ref), v33 (ref)
            if v69 then
                v51(v36(v69.requestId));
            end;
            v53(v33.None);
        end;
    end, {});
    return v2.createElement("Frame", {
        ref = v64, 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1)
    }, v2.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        ref = v65[l_AvatarScreen_0.SearchLandingFocusedWidgetPage], 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v47, 
        defaultChild = v62, 
        restorePreviousChildFocus = false
    }, {
        BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v2.createElement(v26), 
        NavigationEventsLogger = v2.createElement(v27, {
            pageName = l_AvatarScreen_0.SearchLandingFocusedWidgetPage
        }), 
        SearchLandingFocusedWidgetPageAvatarExperienceView = v2.createElement(v28, {
            allowAdaptiveScrolling = true, 
            bottomBarEnabled = false, 
            changeViewFunction = v71, 
            isSceneFullView = v54, 
            isUIFullView = v55, 
            topBar = v2.createElement(v7.View, {
                ZIndex = 2, 
                Size = UDim2.new(1, 0, 0, v56), 
                backgroundStyle = {
                    Color3 = v45.Color.Surface.Surface_0.Color3, 
                    Transparency = v57 and 1 or v45.Color.Surface.Surface_0.Transparency
                }, 
                tag = "padding-x-large auto-xy col align-y-bottom"
            }, {
                SearchBar = v2.createElement(l_SearchBar_0, {
                    showCancelButton = true, 
                    autofocus = false, 
                    onFocus = v74, 
                    onCancel = v75
                })
            }), 
            refinementButtonsRef = v60, 
            quickButtonsRef = v61, 
            ref = v59, 
            NextSelectionDown = v62, 
            NextSelectionLeft = v58, 
            defaultChildRef = v62, 
            multiTryOnBottomBarRef = v48, 
            itemDetailsPeekViewRefs = v66, 
            adaptiveScrollingProps = {
                fullHeightOptions = {
                    opaqueBackground = true, 
                    draggerToDivider = true
                }
            }
        }, {
            GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v2.createElement(v29, {
                focusController = v47, 
                captureFocusOnMount = true
            }), 
            FocusedWidgetItemsView = if v69 then v2.createElement(v25, {
                defaultChildRef = v62, 
                NextSelectionUp = v58, 
                NextSelectionRight = v61, 
                multiTryOnBottomBarRef = v48, 
                itemDetailsPeekViewRefs = v66, 
                onCloseFocusedWidget = v72, 
                searchUuid = v69.requestId
            }) else nil
        })
    }));
end));