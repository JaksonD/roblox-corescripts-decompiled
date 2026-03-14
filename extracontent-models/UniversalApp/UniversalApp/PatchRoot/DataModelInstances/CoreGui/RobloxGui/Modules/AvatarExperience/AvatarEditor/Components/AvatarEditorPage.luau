local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.Packages.React);
local l_Focusable_0 = v5.Focusable;
local v8 = require(l_CorePackages_0.Packages.Cryo);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v10 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v11 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceExperiments);
local v12 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_useAvatarRoute_0 = v12.AvatarRoute.Hooks.useAvatarRoute;
local l_AvatarScreen_0 = v12.Enums.AvatarScreen;
local v15 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceView);
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AvatarNavigationItemsView);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.BoundInputsUpdater);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v24 = require(l_Modules_0.AvatarExperience.Common.Actions.SetItemDetailsPeekViewState);
local v25 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemPrompt);
local v26 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v27 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v28 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenQuickMenu);
local v29 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_ExternalEventConnection_0 = v29.ExternalEventConnection;
local l_isGamepadInput_0 = v29.isGamepadInput;
local l_useDispatch_0 = v29.Hooks.RoactRodux.useDispatch;
local v33 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v34 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v35 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v36 = require(l_Modules_0.AvatarExperience.Experiments.AXDisableAlwaysRenderedScreensIXP);
local v37 = require(l_Modules_0.AvatarExperience.Experiments.AXCombineGetOutfitDispatchesIXP);
local v38 = require(l_Modules_0.AvatarExperience.Catalog.Components.OnFocusExposureLogger);
local v39 = require(l_Modules_0.AvatarExperience.Catalog.Components.OnFocusExperimentExposureLogger);
local v40 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAvatarExperienceFocusNavigationBindings);
local v41 = require(script.Parent.useAvatarEditorPageFocusNavigationBindings);
local v42 = require(l_Modules_0.AvatarExperience.Common.Hooks.useOpenQuickMenuCallback);
local v43 = require(l_Modules_0.AvatarExperience.Common.Hooks.useQuickMenuAvailable);
local v44 = require(l_Modules_0.AvatarExperience.Common.Hooks.useOverlayClosedCallback);
local v45 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local l_useUiModeInfo_0 = v45.useUiModeInfo;
local l_useRoactService_0 = v45.useRoactService;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v49 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v51 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AvatarEditorTopBar);
local v52 = require(l_Modules_0.AvatarExperience.Flags.UniversalAppCameraIXPTest);
local v53 = require(l_Modules_0.AvatarExperience.Flags.AvatarMarketplaceBackendIXPTests);
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local v55 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v56 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXDisableEditorLayerExposure);
local v57 = require(l_Modules_0.AvatarExperience.Flags.GetFlagAXEnableInitialTopLevelPageCounter);
local v58 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXCustomizeOverhaulEditorExposure);
local v59 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXCatalogAndEditorExposureUseFStringLayer);
local v60 = require(l_Modules_0.AvatarExperience.Flags.GetFStringAXCatalogAndEditorExposureLayerName);
local l_AXRemoveBackButtonDesktopClientsIXPTest_0 = v11.AXRemoveBackButtonDesktopClientsIXPTest;
local l_FFlagAXMigrateAvatarEditorPageInputBindings_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAvatarEditorPageInputBindings;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagDynamicHeadsMigration_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagDynamicHeadsMigration;
local v65 = require(l_Modules_0.AvatarExperience.AvatarRefinement.HeadRefinement.Stores.GetHeadShapeInventoryStore);
local v66 = v3.PureComponent:extend("AvatarEditorPage");
v66.init = function(v67) --[[ Line: 100 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_UserInputService_0 (copy), l_isGamepadInput_0 (copy), v35 (copy), v57 (copy), l_sendAXCounterV2_0 (copy), v55 (copy)
    v67.topBarRef = v3.createRef();
    v67.sceneUIContainerRef = v3.createRef();
    v67.refinementButtonsRef = v3.createRef();
    v67.quickButtonsRef = v3.createRef();
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    v67:setState({
        lastInputIsGamepad = l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0)
    });
    v67.changeView = function() --[[ Line: 111 ]]
        -- upvalues: v67 (copy), v35 (ref)
        local l_avatarExperienceAnalytics_0 = v67.props.avatarExperienceAnalytics;
        local v70 = v35.getNewFullViewEnum(v67.props.fullView);
        v67.props.setFullView(l_avatarExperienceAnalytics_0, v67.props.avatarRoute.opaque.name, v70);
    end;
    v67.defaultChildRef = v3.createRef();
    v67.lastInputTypeChangedCallback = function(v71) --[[ Line: 120 ]]
        -- upvalues: l_isGamepadInput_0 (ref), v67 (copy)
        local v72 = l_isGamepadInput_0(v71);
        if v72 ~= v67.state.lastInputIsGamepad then
            v67:setState({
                lastInputIsGamepad = v72
            });
        end;
    end;
    if v57() then
        l_sendAXCounterV2_0(v55.Counter.TopLevelPageInitialView.Editor);
    end;
end;
if v58 then
    v66.didMount = function(_) --[[ Line: 135 ]] --[[ Name: didMount ]]
        -- upvalues: v49 (copy), v59 (copy), v60 (copy), l_AppUserLayers_0 (copy)
        v49.logLayerExposure(if v59 then v60() else l_AppUserLayers_0.AvatarExperienceUAAllViews);
    end;
end;
if not l_FFlagAXMigrateAvatarEditorPageInputBindings_0 then
    v66.getInputBindings = function(v74) --[[ Line: 145 ]] --[[ Name: getInputBindings ]]
        -- upvalues: l_AvatarScreen_0 (copy), v8 (copy), v5 (copy), v23 (copy)
        local l_avatarRoute_0 = v74.props.avatarRoute;
        local l_name_0 = l_avatarRoute_0.current.name;
        local v77 = {};
        if l_name_0 == l_AvatarScreen_0.ItemDetails then
            v77 = v8.Dictionary.join(v77, {
                NavigateBack = v5.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 153 ]]
                    -- upvalues: v23 (ref), v74 (copy)
                    v23.closeFocusedScreen(v74.props.navigation);
                end), 
                OpenItemPrompt = v5.Input.onBegin(Enum.KeyCode.ButtonX, function() --[[ Line: 156 ]]
                    -- upvalues: v74 (copy), l_avatarRoute_0 (copy)
                    v74.props.openItemPrompt(v74.props.networking, v74.props.catalogAnalytics, v74.props.overlayClosedCallback, v74.props.navigation, l_avatarRoute_0);
                end, {
                    key = "Feature.Catalog.Action.Buy"
                }), 
                OpenCatalogContextMenu = v5.Input.onBegin(Enum.KeyCode.ButtonL3, function() --[[ Line: 167 ]]
                    -- upvalues: v74 (copy), l_AvatarScreen_0 (ref), l_avatarRoute_0 (copy)
                    v74.props.navigation.navigate(l_AvatarScreen_0.CatalogContextMenu, {
                        itemId = l_avatarRoute_0.current.params.itemId, 
                        itemType = l_avatarRoute_0.current.params.itemType, 
                        onOverlayClosed = v74.props.overlayClosedCallback
                    });
                end, {
                    key = "Feature.Catalog.Action.ItemOptions"
                })
            });
        end;
        return v77;
    end;
end;
v66.render = function(v78) --[[ Line: 183 ]] --[[ Name: render ]]
    -- upvalues: v27 (copy), v3 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateAvatarEditorPageInputBindings_0 (copy), v38 (copy), v52 (copy), v39 (copy), v36 (copy), v37 (copy), l_AXRemoveBackButtonDesktopClientsIXPTest_0 (copy), v56 (copy), v53 (copy), v20 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), v21 (copy), v17 (copy), v6 (copy), v51 (copy), v19 (copy), v18 (copy)
    local v79 = v78.props.fullView == v27.SceneFullView;
    local v80 = v78.props.fullView == v27.UIFullView;
    local l_quickButtonsRef_0 = v78.quickButtonsRef;
    return v3.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        [v3.Ref] = v78.ref, 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v78.props.focusController, 
        defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v78.defaultChildRef, 
        inputBindings = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or l_FFlagAXMigrateAvatarEditorPageInputBindings_0 then nil else v78:getInputBindings(), 
        restorePreviousChildFocus = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else false
    }, {
        UniversalAppCameraExposure = v3.createElement(v38, {
            ixpTest = v52
        }), 
        OnFocusExperimentExposureLogger = v3.createElement(v39, {
            ixpTests = {
                if v36.isEnabled() then v36 else nil, 
                if v37.isEnabled() then v37 else nil, 
                if l_AXRemoveBackButtonDesktopClientsIXPTest_0.isEnabled() then l_AXRemoveBackButtonDesktopClientsIXPTest_0 else nil
            }
        }), 
        EditorExposure = if v56() then nil else v3.createElement(v38, {
            ixpTest = v53.Editor
        }), 
        BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v3.createElement(v20), 
        LastInputTypeChangedConnection = v3.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = v78.lastInputTypeChangedCallback
        }), 
        NavigationEventsLogger = v3.createElement(v21, {
            pageName = "AvatarEditor"
        }), 
        AvatarExperienceView = v3.createElement(v17, {
            allowAdaptiveScrolling = true, 
            bottomBarEnabled = false, 
            changeViewFunction = v78.changeView, 
            isSceneFullView = v79, 
            isUIFullView = v80, 
            topBar = v6.createElement(v51, {
                showManageOutfitButton = v78.props.showManageOutfitButton, 
                overlayClosedCallback = v78.props.overlayClosedCallback, 
                topBarRef = v78.topBarRef, 
                NextSelectionDown = v78.defaultChildRef, 
                NextSelectionRight = v78.sceneUIContainerRef, 
                navigation = v78.props.navigation, 
                avatarRoute = v78.props.avatarRoute
            }), 
            refinementButtonsRef = v78.refinementButtonsRef, 
            quickButtonsRef = v78.quickButtonsRef, 
            ref = v78.sceneUIContainerRef, 
            NextSelectionDown = v78.defaultChildRef, 
            NextSelectionLeft = v78.topBarRef, 
            defaultChildRef = v78.defaultChildRef
        }, {
            GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v3.createElement(v19, {
                focusController = v78.props.focusController, 
                captureFocusOnMount = true
            }), 
            AvatarNavigationItemsView = v3.createElement(v18, {
                defaultChildRef = v78.defaultChildRef, 
                NextSelectionUp = v78.topBarRef, 
                NextSelectionRight = l_quickButtonsRef_0
            })
        })
    });
end;
v66 = l_RoactServices_0.connect({
    avatarExperienceAnalytics = v15, 
    catalogAnalytics = if l_FFlagAXMigrateAvatarEditorPageInputBindings_0 then nil else v16, 
    networking = if l_FFlagAXMigrateAvatarEditorPageInputBindings_0 then nil else v10
})(v66);
v66 = v22((v4.connect(function(v82, _) --[[ Line: 270 ]]
    -- upvalues: v35 (copy), v34 (copy), l_AvatarScreen_0 (copy), v33 (copy)
    local v84 = v35.getAvatarEditorCategoryInfoFromState(v82);
    return {
        fullView = v34(v82, l_AvatarScreen_0.AvatarEditor), 
        isPortrait = v33(v82), 
        itemDetailsExpanded = v82.AvatarExperience.Common.ItemDetailsExpanded, 
        showManageOutfitButton = v84.ManageOutfitsEnabled == true, 
        isCurrentUserAllowedToCreateShares = v82.AvatarExperience.Catalog.Metadata.isCurrentUserAllowedToCreateShares
    };
end, function(v85) --[[ Line: 280 ]]
    -- upvalues: l_FFlagAXMigrateAvatarEditorPageInputBindings_0 (copy), v25 (copy), v24 (copy), v28 (copy), v26 (copy)
    return {
        openItemPrompt = if l_FFlagAXMigrateAvatarEditorPageInputBindings_0 then nil else function(v86, v87, v88, v89, v90) --[[ Line: 284 ]]
            -- upvalues: v85 (copy), v25 (ref)
            v85(v25(v86, v87, v88, v89, v90));
        end, 
        setItemDetailsPeekViewState = if l_FFlagAXMigrateAvatarEditorPageInputBindings_0 then nil else function(v91) --[[ Line: 289 ]]
            -- upvalues: v85 (copy), v24 (ref)
            v85(v24(v91));
        end, 
        navigateIntoQuickMenu = if l_FFlagAXMigrateAvatarEditorPageInputBindings_0 then nil else function(v92, v93) --[[ Line: 294 ]]
            -- upvalues: v85 (copy), v28 (ref)
            v85(v28(v92, v93));
        end, 
        setFullView = function(v94, v95, v96) --[[ Line: 297 ]] --[[ Name: setFullView ]]
            -- upvalues: v85 (copy), v26 (ref)
            v85(v26(v94, v95, v96));
        end
    };
end)(v66)));
return function(v97) --[[ Line: 305 ]] --[[ Name: AvatarEditorPageContainer ]]
    -- upvalues: l_FFlagDynamicHeadsMigration_0 (copy), v6 (copy), v65 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v5 (copy), v44 (copy), l_FFlagAXMigrateAvatarEditorPageInputBindings_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), v16 (copy), v10 (copy), v43 (copy), l_useAvatarRoute_0 (copy), l_AvatarScreen_0 (copy), v42 (copy), v23 (copy), v25 (copy), v41 (copy), v40 (copy), v8 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), v66 (ref)
    if l_FFlagDynamicHeadsMigration_0 then
        v6.useEffect(function() --[[ Line: 307 ]]
            -- upvalues: v65 (ref)
            local v98 = v65(false);
            if v98 then
                v98.getInventory(false);
            end;
        end, {});
    end;
    local v99 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v6.useRef(v5.createFocusController()).current;
    local v100 = v44(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v99);
    local v101 = nil;
    if l_FFlagAXMigrateAvatarEditorPageInputBindings_0 then
        local v102 = l_useDispatch_0();
        local v103 = l_useRoactService_0(v16);
        local v104 = l_useRoactService_0(v10);
        local v105 = v43();
        local v106 = l_useAvatarRoute_0();
        local v107 = v106.current.name == l_AvatarScreen_0.ItemDetails;
        local v108 = v42(v100);
        local v110 = v6.useCallback(function(v109) --[[ Line: 332 ]]
            -- upvalues: v23 (ref), v97 (copy)
            v109.cancelled = true;
            v23.closeFocusedScreen(v97.navigation);
        end, {
            v97.navigation
        });
        local l_v102_0 = v102 --[[ copy: 4 -> 14 ]];
        local v112 = v6.useCallback(function() --[[ Line: 338 ]]
            -- upvalues: l_v102_0 (copy), v25 (ref), v104 (copy), v103 (copy), v100 (copy), v97 (copy), v106 (copy)
            l_v102_0(v25(v104, v103, v100, v97.navigation, v106));
        end, {
            v102, 
            v104, 
            v103, 
            v100, 
            v97.navigation, 
            v106
        });
        local v113 = v6.useCallback(function() --[[ Line: 346 ]]
            -- upvalues: v97 (copy), l_AvatarScreen_0 (ref), v106 (copy), v100 (copy)
            v97.navigation.navigate(l_AvatarScreen_0.CatalogContextMenu, {
                itemId = v106.current.params.itemId, 
                itemType = v106.current.params.itemType, 
                onOverlayClosed = v100
            });
        end, {
            v97.navigation, 
            v106, 
            v100
        });
        v101 = v41({
            onNavigateBack = v110, 
            onOpenQuickMenu = if v105 then v108 else nil, 
            onOpenBuyItemPrompt = if v107 then v112 else nil, 
            onOpenContextMenu = if v107 then v113 else nil
        });
    else
        v101 = v40({
            overlayClosedCallback = v100
        });
    end;
    local v114 = v8.Dictionary.join(v97, {
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v99, 
        overlayClosedCallback = v100, 
        is10ftUI = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot
    });
    return v6.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        ref = v101
    }, v6.createElement(v66, v114));
end;