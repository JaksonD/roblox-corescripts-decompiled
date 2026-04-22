local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Otter);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.React);
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v7.Focusable;
local v9 = require(l_CorePackages_0.Packages.RoactRodux);
local v10 = require(l_CorePackages_0.Packages.RoactNavigation);
local v11 = require(l_CorePackages_0.Packages.UIBlox);
local v12 = require(l_CorePackages_0.Packages.t);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v15 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Services.Analytics);
local v16 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.withLastInputGroup);
local v22 = require(l_Modules_0.LuaApp.LuaAppEvents);
local v23 = require(l_Modules_0.LuaApp.AppPage);
local v24 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v24.Enums.AvatarScreen;
local l_AvatarRoute_0 = v24.AvatarRoute.AvatarRoute;
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceView);
local v28 = require(l_Modules_0.AvatarExperience.Common.Components.Landing.AvatarPageButton);
local v29 = require(l_Modules_0.AvatarExperience.Common.Components.Landing.CatalogPageButton);
local v30 = require(l_Modules_0.AvatarExperience.Common.Components.Landing.ProfilePictureEditorPageButton);
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v32 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v33 = require(l_Modules_0.LuaApp.Constants);
local v34 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local v35 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v36 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v37 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v38 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local l_FullView_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.FullView;
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v42 = require(l_Modules_0.AvatarExperience.Catalog.Components.OnFocusExperimentExposureLogger);
local v43 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory);
local v44 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SetCategoryAndSubcategory);
local v45 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v45.FocusNavigableSurfaceIdentifierEnum;
local l_useRegistryEntry_0 = v45.FocusNavigableSurfaceRegistry.useRegistryEntry;
local l_useFirstFocusableDescendantRef_0 = v45.useFirstFocusableDescendantRef;
local l_useDescendantHasFocus_0 = v45.useDescendantHasFocus;
local v50 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAvatarExperienceFocusNavigationBindings);
local v51 = require(l_Modules_0.AvatarExperience.Common.Hooks.useOverlayClosedCallback);
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v54 = require(l_Modules_0.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker);
local l_SpringAnimatedItem_0 = v11.Utility.SpringAnimatedItem;
local v56 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAvatarAutocompleteEnabledForAll);
local v57 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAllowAvatarLandingPageSearch);
local v58 = require(l_Modules_0.AvatarExperience.Experiments.AXDisableAlwaysRenderedScreensIXP);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v60 = game:DefineFastFlag("AXMigrateLandingPageToAutoFocus", false) and l_FFlagAXMigrateAXToGlobalAutofocus_0;
local v61 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXCatalogCategoriesStore_0 = v61.FFlagAXCatalogCategoriesStore;
local l_FFlagAXEnableTTIViaModule_0 = v61.FFlagAXEnableTTIViaModule;
local l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 = v61.FFlagAXEnableMilestoneTrackingForAvatarExperience;
local l_FFlagAXMoveAllTabToWidgetOnly_0 = v61.FFlagAXMoveAllTabToWidgetOnly;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local v67 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceTTIPerformance);
local l_TTIPerformanceManager_0 = v67.TTIPerformanceManager;
local l_WidgetsPercievedTTIManager_0 = v67.WidgetsPercievedTTIManager;
local v70 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local v73 = {
    dampingRatio = 0.8, 
    frequency = 4
};
local function v75(v74) --[[ Line: 130 ]] --[[ Name: mapValuesToPropsLeft ]]
    return {
        Position = UDim2.new(0.5, -13, v74.yPosition, 0)
    };
end;
local function v77(v76) --[[ Line: 138 ]] --[[ Name: mapValuesToPropsRight ]]
    return {
        Position = UDim2.new(0.5, 13, v76.yPosition, 0)
    };
end;
local function v79(v78) --[[ Line: 146 ]] --[[ Name: mapValuesToPropsMiddle ]]
    return {
        Position = UDim2.new(0.5, 0, v78.yPosition, 13)
    };
end;
local v80 = v5.PureComponent:extend("AvatarExperienceLandingPage");
v80.validateProps = v12.strictInterface({
    avatarCategory = v12.number, 
    avatarSubcategory = v12.number, 
    catalogCategoryId = v12.optional(v12.string), 
    catalogSubcategoryId = v12.optional(v12.string), 
    deviceOrientation = v12.string, 
    statusBarHeight = v12.number, 
    resetAvatarCategories = v12.callback, 
    resetCatalogCategories = v12.callback, 
    setFullView = v12.callback, 
    startPercievedCatalogTTITracker = v12.callback, 
    avatarAnalytics = v12.table, 
    catalogAnalytics = v12.table, 
    profilePictureEditorAnalytics = v12.table, 
    avatarExperienceAnalytics = v12.table, 
    lastInputGroup = v12.string, 
    navigation = v12.table, 
    avatarRoute = l_AvatarRoute_0.Interface, 
    NextSelectionUp = v12.optional(v12.any), 
    shouldCaptureFocus = v12.boolean, 
    is10ftUI = v12.boolean, 
    focusNavigationBindingsRef = v12.callback, 
    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v12.table
});
v80.init = function(v81) --[[ Line: 189 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v22 (copy), v23 (copy), l_AvatarScreen_0 (copy), l_UserInputService_0 (copy), l_isGamepadInput_0 (copy), v4 (copy), l_FFlagAXEnableTTIViaModule_0 (copy), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), l_WidgetsPercievedTTIManager_0 (copy), l_TTIPerformanceManager_0 (copy), l_TimeToInteractiveTracker_0 (copy), v35 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v33 (copy), l_FullView_0 (copy)
    v81.robuxBalanceRef = v5.createRef();
    v81.quickMenuRef = v5.createRef();
    v81.state = {
        buttonsOffscreen = false, 
        buttonTransparencyModifier = 0
    };
    v81.luaAppReloadPageEventConnection = v22.ReloadPage:connect(function(v82) --[[ Line: 198 ]]
        -- upvalues: v23 (ref), v81 (copy), l_AvatarScreen_0 (ref)
        if v82 == v23.AvatarExperienceRoot then
            if v81.props.is10ftUI then
                v81.props.navigation.navigate(l_AvatarScreen_0.AvatarExperienceLandingPage);
                return;
            else
                v81.props.navigation.navigate(l_AvatarScreen_0.Catalog);
            end;
        end;
    end);
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    v81.lastInputTypeChangedCallback = function(v84) --[[ Line: 210 ]]
        -- upvalues: l_isGamepadInput_0 (ref), v81 (copy)
        local v85 = l_isGamepadInput_0(v84);
        if v85 ~= v81.state.lastInputIsGamepad then
            v81:setState({
                lastInputIsGamepad = v85
            });
        end;
    end;
    v81.state.lastInputIsGamepad = l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0);
    v81.updateButtonPositions = function() --[[ Line: 221 ]]
        -- upvalues: v81 (copy), v4 (ref)
        v81:setState({
            buttonsOffscreen = true
        });
        if v81.motor then
            v81.motor:setGoal(v4.spring(1), {
                frequency = 3
            });
        end;
    end;
    v81.showProfilePictureEditorCallback = function() --[[ Line: 233 ]]
        -- upvalues: v81 (copy), l_AvatarScreen_0 (ref)
        v81.props.profilePictureEditorAnalytics.profilePictureEditorOpenedFromLandingPage();
        v81.updateButtonPositions();
        delay(0.2, function() --[[ Line: 238 ]]
            -- upvalues: v81 (ref), l_AvatarScreen_0 (ref)
            v81.props.navigation.navigate(l_AvatarScreen_0.ProfilePictureEditorEmotes);
        end);
    end;
    v81.showAvatarEditorCallback = function() --[[ Line: 243 ]]
        -- upvalues: v81 (copy), l_AvatarScreen_0 (ref)
        v81.props.avatarAnalytics.avatarEditorOpenedFromLandingPage();
        v81.updateButtonPositions();
        delay(0.2, function() --[[ Line: 249 ]]
            -- upvalues: v81 (ref), l_AvatarScreen_0 (ref)
            if v81.isMounted then
                v81.props.navigation.navigate(l_AvatarScreen_0.AvatarEditor);
            end;
        end);
    end;
    v81.showCatalogCallback = function() --[[ Line: 256 ]]
        -- upvalues: v81 (copy), l_FFlagAXEnableTTIViaModule_0 (ref), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (ref), l_FFlagAXMoveAllTabToWidgetOnly_0 (ref), l_WidgetsPercievedTTIManager_0 (ref), l_TTIPerformanceManager_0 (ref), l_TimeToInteractiveTracker_0 (ref), v35 (ref), l_AvatarScreen_0 (ref)
        v81.props.catalogAnalytics.catalogOpenedFromLandingPage();
        v81.updateButtonPositions();
        if l_FFlagAXEnableTTIViaModule_0 then
            if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                if l_FFlagAXMoveAllTabToWidgetOnly_0 and l_WidgetsPercievedTTIManager_0 then
                    l_WidgetsPercievedTTIManager_0.startPerceivedTracking();
                else
                    l_TTIPerformanceManager_0.Surface.Marketplace.Root.startPerceivedTracking();
                end;
            else
                l_TimeToInteractiveTracker_0.trackStart(v35.Counter.PREFIX .. v35.Counter.Latency.Organic.Tiles .. "_Percieved");
                l_TimeToInteractiveTracker_0.trackStart(v35.Counter.PREFIX .. v35.Counter.Latency.Organic.Thumbnails .. "_Percieved");
                l_TimeToInteractiveTracker_0.trackStart(v35.Counter.PREFIX .. v35.Counter.Latency.Widget.Tiles .. "_Percieved");
                l_TimeToInteractiveTracker_0.trackStart(v35.Counter.PREFIX .. v35.Counter.Latency.Widget.Thumbnails .. "_Percieved");
            end;
        end;
        v81.props.startPercievedCatalogTTITracker();
        delay(0.2, function() --[[ Line: 284 ]]
            -- upvalues: v81 (ref), l_AvatarScreen_0 (ref)
            if v81.isMounted then
                v81.props.navigation.navigate(l_AvatarScreen_0.Catalog);
            end;
        end);
    end;
    v81.transitionOnscreen = function() --[[ Line: 291 ]]
        -- upvalues: v81 (copy), v4 (ref)
        v81:setState({
            buttonsOffscreen = false
        });
        if v81.motor then
            v81.motor:setGoal(v4.spring(0), {
                frequency = 3
            });
        end;
    end;
    v81.pageButtonsRef = v5.createRef();
    v81.catalogPageButtonRef = v5.createRef();
    v81.avatarPageButtonRef = v5.createRef();
    v81.topFrameRef = v5.createRef();
    v81.topBarRef = v5.createRef();
    v81.robuxButtonRef = v5.createRef();
    v81.profilePictureEditorPageButtonRef = v5.createRef();
    v81.topFrameRef = v5.createRef();
    v81.sceneUIContainerRef = v5.createRef();
    v81.onComplete = function() --[[ Line: 315 ]]
        -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v81 (copy), v33 (ref)
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v81.isFocused and v81.props.lastInputGroup == v33.InputType.Gamepad and v81.props.avatarRoute.isVisible and not v81.state.buttonsOffscreen and v81.props.shouldCaptureFocus then
            v81.props.focusController.captureFocus();
        end;
    end;
    v81.onWillFocus = function() --[[ Line: 327 ]]
        -- upvalues: v81 (copy), v4 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v33 (ref)
        if not v81.isMounted then
            return;
        else
            v81.isFocused = true;
            v81.motor = v4.createSingleMotor(v81.state.buttonTransparencyModifier);
            v81.motor:onStep(function(v86) --[[ Line: 335 ]]
                -- upvalues: v81 (ref)
                if not v81.isFocused and not v81.isMounted then
                    return;
                else
                    v81:setState({
                        buttonTransparencyModifier = v86
                    });
                    return;
                end;
            end);
            v81.transitionOnscreen();
            if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v81.isFocused and v81.props.lastInputGroup == v33.InputType.Gamepad and v81.props.avatarRoute.isVisible and v81.props.shouldCaptureFocus then
                v81.props.focusController.captureFocus();
            end;
            return;
        end;
    end;
    v81.onWillBlur = function() --[[ Line: 357 ]]
        -- upvalues: v81 (copy)
        if v81.motor then
            v81.motor:destroy();
        end;
        v81.isFocused = false;
    end;
    v81.resetCategoryNavigation = function() --[[ Line: 366 ]]
        -- upvalues: v81 (copy)
        local l_avatarCategory_0 = v81.props.avatarCategory;
        local l_avatarSubcategory_0 = v81.props.avatarSubcategory;
        local l_catalogCategoryId_0 = v81.props.catalogCategoryId;
        local l_catalogSubcategoryId_0 = v81.props.catalogSubcategoryId;
        if l_avatarCategory_0 ~= 1 or l_avatarSubcategory_0 ~= 1 then
            v81.props.resetAvatarCategories(v81.props.avatarAnalytics);
            return;
        else
            if l_catalogCategoryId_0 ~= "1" or l_catalogSubcategoryId_0 ~= "1" then
                v81.props.resetCatalogCategories(v81.props.catalogAnalytics);
            end;
            return;
        end;
    end;
    v81.setUIFullView = function() --[[ Line: 380 ]]
        -- upvalues: v81 (copy), l_AvatarScreen_0 (ref), l_FullView_0 (ref)
        local l_avatarExperienceAnalytics_0 = v81.props.avatarExperienceAnalytics;
        v81.props.setFullView(l_avatarExperienceAnalytics_0, l_AvatarScreen_0.CatalogSearch, l_FullView_0.UIFullView);
    end;
end;
v80.renderTopBar = function(v92) --[[ Line: 387 ]] --[[ Name: renderTopBar ]]
    -- upvalues: v57 (copy), l_withLocalization_0 (copy), v5 (copy), v60 (copy), v32 (copy), l_Focusable_0 (copy), v34 (copy), v56 (copy)
    local v93 = 0;
    if v57() then
        v93 = 2;
    end;
    return l_withLocalization_0({
        title = "CommonUI.Features.Label.Avatar"
    })(function(v94) --[[ Line: 395 ]]
        -- upvalues: v5 (ref), v60 (ref), v32 (ref), l_Focusable_0 (ref), v57 (ref), v34 (ref), v93 (ref), v56 (ref), v92 (copy)
        return v5.createElement(if v60 then v32.Container else l_Focusable_0[v32.Container], {
            titleText = v94.title, 
            searchType = v57() and v34.SearchTypes.Catalog or nil, 
            transparentBackground = true, 
            ZIndex = v93, 
            onConfirmSearchCallback = v56() and v92.setUIFullView or nil, 
            rightItems = if v57() then {
                v32.SearchButton
            } else {}, 
            [v5.Ref] = v92.topBarRef, 
            NextSelectionDown = if v60 then nil else v92.catalogPageButtonRef, 
            NextSelectionRight = if v60 then nil else v92.sceneUIContainerRef, 
            NextSelectionUp = if v60 then nil else v92.props.NextSelectionUp
        });
    end);
end;
v80.makeLeftFrame = function(v95, v96, v97, v98) --[[ Line: 415 ]] --[[ Name: makeLeftFrame ]]
    -- upvalues: v5 (copy), l_SpringAnimatedItem_0 (copy), v75 (copy), v73 (copy), v60 (copy), v28 (copy), l_Focusable_0 (copy)
    local l_buttonsOffscreen_0 = v95.state.buttonsOffscreen;
    return v5.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
        regularProps = {
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.new(0.5, -v97 * 3 / 4, v96, 0)
        }, 
        animatedValues = {
            xPosition = 0.5, 
            yPosition = l_buttonsOffscreen_0 and v98 or 0.5
        }, 
        mapValuesToProps = v75, 
        springOptions = v73, 
        onComplete = v95.onComplete
    }, {
        AvatarPageButton = v5.createElement(if v60 then v28 else l_Focusable_0[v28], {
            onActivated = v95.showAvatarEditorCallback, 
            transparencyModifier = v95.state.buttonTransparencyModifier, 
            [v5.Ref] = v95.avatarPageButtonRef, 
            NextSelectionRight = if v60 then nil else v95.catalogPageButtonRef, 
            NextSelectionDown = if v60 then nil else v95.profilePictureEditorPageButtonRef, 
            NextSelectionUp = if v60 then nil else v95.topBarRef
        })
    });
end;
v80.makeRightFrame = function(v100, v101, v102, v103) --[[ Line: 451 ]] --[[ Name: makeRightFrame ]]
    -- upvalues: v5 (copy), l_SpringAnimatedItem_0 (copy), v77 (copy), v73 (copy), v60 (copy), v29 (copy), l_Focusable_0 (copy)
    local l_buttonsOffscreen_1 = v100.state.buttonsOffscreen;
    return v5.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
        regularProps = {
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.new(0.5, -v102 * 3 / 4, v101, 0)
        }, 
        animatedValues = {
            xPosition = 0.5, 
            yPosition = l_buttonsOffscreen_1 and v103 or 0.5
        }, 
        mapValuesToProps = v77, 
        springOptions = v73
    }, {
        CatalogPageButton = v5.createElement(if v60 then v29 else l_Focusable_0[v29], {
            onActivated = v100.showCatalogCallback, 
            transparencyModifier = v100.state.buttonTransparencyModifier, 
            [v5.Ref] = v100.catalogPageButtonRef, 
            NextSelectionLeft = if v60 then nil else v100.avatarPageButtonRef, 
            NextSelectionRight = if v60 then nil else v100.sceneUIContainerRef, 
            NextSelectionDown = if v60 then nil else v100.profilePictureEditorPageButtonRef, 
            NextSelectionUp = if v60 then nil else v100.topBarRef
        })
    });
end;
v80.makeMiddleFrame = function(v105, v106, v107, v108) --[[ Line: 487 ]] --[[ Name: makeMiddleFrame ]]
    -- upvalues: v5 (copy), l_SpringAnimatedItem_0 (copy), v79 (copy), v73 (copy), v60 (copy), v30 (copy), l_Focusable_0 (copy)
    local l_buttonsOffscreen_2 = v105.state.buttonsOffscreen;
    return v5.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
        regularProps = {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, -v107, v106, -v107 / 2)
        }, 
        animatedValues = {
            xPosition = 0.5, 
            yPosition = l_buttonsOffscreen_2 and v108 or 0.5
        }, 
        mapValuesToProps = v79, 
        springOptions = v73, 
        onComplete = v105.onComplete
    }, {
        ProfilePictureEditorPageButton = v5.createElement(if v60 then v30 else l_Focusable_0[v30], {
            onActivated = v105.showProfilePictureEditorCallback, 
            transparencyModifier = v105.state.buttonTransparencyModifier, 
            [v5.Ref] = v105.profilePictureEditorPageButtonRef, 
            NextSelectionUp = if v60 then nil else v105.topFrameRef
        })
    });
end;
v80.renderAvatarExperienceView = function(v110, v111) --[[ Line: 521 ]] --[[ Name: renderAvatarExperienceView ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v5 (copy), v27 (copy), v60 (copy), v57 (copy), v37 (copy), v42 (copy), v58 (copy), v10 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v31 (copy), l_Focusable_0 (copy), v35 (copy)
    local v112 = v110.props.deviceOrientation == l_DeviceOrientationMode_0.Portrait;
    local v113 = v112 and 0.8 or 0.5;
    local v114 = v112 and 52 or 48;
    local v115 = nil;
    local v116 = nil;
    local v117 = nil;
    local v118 = nil;
    local v119 = nil;
    v115 = v112 and 0.528 or 0.33;
    v116 = v112 and 0.27199999999999996 or 0.16999999999999998;
    v117 = v112 and 0.8 or 0.5;
    v113 = 1;
    v118 = 0.5 + (0.5 + 0.5 * v117) / v115;
    v119 = 0.5 + (0.5 + 0.5 * v117) / v116;
    return v5.createElement(v27, {
        topBar = v111 and v110:renderTopBar() or nil, 
        ZIndex = 1, 
        bottomBarEnabled = true, 
        isSceneFullView = false, 
        isUIFullView = false, 
        isLandingPage = true, 
        showRobuxBalance = false, 
        [v5.Ref] = v110.sceneUIContainerRef, 
        NextSelectionLeft = if v60 then nil else if v57() then v110.topBarRef else nil, 
        NextSelectionDown = if v60 then nil else v110.pageButtonsRef, 
        NextSelectionUp = if v60 then nil else v110.props.NextSelectionUp
    }, {
        NavigationEventsLogger = v5.createElement(v37, {
            pageName = "LandingPage"
        }), 
        OnFocusExperimentExposureLogger = v5.createElement(v42, {
            ixpTests = {
                if v58.isEnabled() then v58 else nil
            }
        }), 
        navigationEvents = v5.createElement(v10.NavigationEvents, {
            onWillFocus = v110.onWillFocus, 
            onWillBlur = v110.onWillBlur
        }), 
        GamepadFocusHandlerForPage = if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v110.props.shouldCaptureFocus then v5.createElement(v31, {
            focusController = v110.props.focusController
        }) else nil, 
        Buttons = v5.createElement(v60 and "Frame" or l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            [v5.Ref] = v110.pageButtonsRef, 
            NextSelectionUp = if v60 then nil else v110.sceneUIContainerRef, 
            defaultChild = if v60 then nil else v110.topFrameRef, 
            restorePreviousChildFocus = not v60 or nil
        }, {
            TopFrame = v5.createElement(v60 and "Frame" or l_Focusable_0.Frame, {
                Size = UDim2.new(1, 0, v115, 0), 
                Position = UDim2.new(0, 0, v115 + 0.5 - v117 / 2, 0), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = 1, 
                [v5.Ref] = v110.topFrameRef, 
                defaultChild = if v60 then nil else v110.avatarPageButtonRef, 
                restorePreviousChildFocus = not v60 or nil
            }, {
                LeftFrame = v110:makeLeftFrame(v113, v114, v118), 
                RightFrame = v110:makeRightFrame(v113, v114, v118), 
                uiSizeConstraint = v5.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(0, v35.LandingPageMinTopFrameHeightPix)
                })
            }), 
            BottomFrame = v5.createElement("Frame", {
                Size = UDim2.new(1, 0, v116, 0), 
                Position = UDim2.new(0, 0, 0.5 - v117 / 2 + v115, 0), 
                BackgroundTransparency = 1
            }, {
                MiddleFrame = v110:makeMiddleFrame(v113, v114, v119), 
                uiSizeConstraint = v5.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(0, v35.LandingPageMinBottomFrameHeightPix)
                })
            })
        })
    });
end;
v80.renderMainView = function(v120) --[[ Line: 612 ]] --[[ Name: renderMainView ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v5 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy)
    if not (v120.props.deviceOrientation == l_DeviceOrientationMode_0.Portrait) then
        return v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            [v5.Ref] = v120.props.focusNavigationBindingsRef
        }, {
            LastInputTypeChangedConnection = v5.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.LastInputTypeChanged, 
                callback = v120.lastInputTypeChangedCallback
            }), 
            TopBar = v120:renderTopBar(), 
            AEView = v120:renderAvatarExperienceView(false)
        });
    else
        return v120:renderAvatarExperienceView(true);
    end;
end;
v80.render = function(v121) --[[ Line: 634 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v60 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    return v5.createElement(v60 and "Frame" or l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v121.props.focusController, 
        defaultChild = if v60 then nil else v121.pageButtonsRef
    }, {
        v121:renderMainView()
    });
end;
v80.didMount = function(v122) --[[ Line: 645 ]] --[[ Name: didMount ]]
    v122.isMounted = true;
end;
v80.willUnmount = function(v123) --[[ Line: 649 ]] --[[ Name: willUnmount ]]
    v123.isFocused = false;
    v123.isMounted = false;
    if v123.luaAppReloadPageEventConnection ~= nil then
        v123.luaAppReloadPageEventConnection:disconnect();
        v123.luaAppReloadPageEventConnection = nil;
    end;
end;
local function v126(v124, v125) --[[ Line: 659 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy)
    return {
        avatarCategory = v124.AvatarExperience.AvatarEditor.Categories.category, 
        avatarSubcategory = v124.AvatarExperience.AvatarEditor.Categories.subcategory, 
        catalogCategory = if l_FFlagAXCatalogCategoriesStore_0 then v125.catalogCategory else nil, 
        catalogSubcategory = if l_FFlagAXCatalogCategoriesStore_0 then v125.catalogSubcategory else nil, 
        catalogCategoryId = v124.AvatarExperience.Catalog.Categories.categoryId, 
        catalogSubcategoryId = v124.AvatarExperience.Catalog.Categories.subcategoryId, 
        deviceOrientation = v124.DeviceOrientation, 
        statusBarHeight = v124.TopBar.statusBarHeight
    };
end;
local function v133(v127) --[[ Line: 672 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v43 (copy), v44 (copy), v38 (copy), v54 (copy)
    return {
        resetAvatarCategories = function(v128) --[[ Line: 674 ]] --[[ Name: resetAvatarCategories ]]
            -- upvalues: v127 (copy), v43 (ref)
            v127(v43(1, nil, v128));
        end, 
        resetCatalogCategories = function(v129) --[[ Line: 678 ]] --[[ Name: resetCatalogCategories ]]
            -- upvalues: v127 (copy), v44 (ref)
            v127(v44(1, nil, v129));
        end, 
        setFullView = function(v130, v131, v132) --[[ Line: 682 ]] --[[ Name: setFullView ]]
            -- upvalues: v127 (copy), v38 (ref)
            v127(v38(v130, v131, v132));
        end, 
        startPercievedCatalogTTITracker = function() --[[ Line: 686 ]] --[[ Name: startPercievedCatalogTTITracker ]]
            -- upvalues: v127 (copy), v54 (ref)
            v127(v54.PercievedTrackingStarted());
        end
    };
end;
v80 = v21(v80);
v80 = l_RoactServices_0.connect({
    avatarAnalytics = v13, 
    catalogAnalytics = v14, 
    avatarExperienceAnalytics = v16, 
    profilePictureEditorAnalytics = v15
})(v80);
v80 = v36((v9.connect(v126, v133)(v80)));
return function(v134) --[[ Line: 705 ]] --[[ Name: AvatarExperienceLandingPageContainer ]]
    -- upvalues: l_useRegistryEntry_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_useFirstFocusableDescendantRef_0 (copy), l_useDescendantHasFocus_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v6 (copy), v7 (copy), v51 (copy), v50 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v70 (copy), l_useSignalState_0 (copy), v5 (copy), v80 (ref)
    local v135 = l_useRegistryEntry_0(l_FocusNavigableSurfaceIdentifierEnum_0.NavBar);
    local v136 = l_useFirstFocusableDescendantRef_0(v135);
    local v137 = l_useDescendantHasFocus_0(v135);
    local v138 = table.clone(v134);
    v138.NextSelectionUp = if v135 then v136 else nil;
    v138.shouldCaptureFocus = not v137;
    local v139 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v6.useRef(if v134.focusController then v134.focusController else v7.createFocusController()).current;
    local v140 = v51(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v139);
    local v141 = v50({
        overlayClosedCallback = v140
    });
    v138.focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v139;
    v138.focusNavigationBindingsRef = v141;
    local v142 = false;
    if l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot then
        v142 = not l_FFlagEnableLeftNavOnConsole_0;
    end;
    v138.is10ftUI = v142;
    if l_FFlagAXCatalogCategoriesStore_0 then
        v142 = v70.getCatalogSelectionStore();
        local v143 = l_useSignalState_0(v142.selectedCategoryId);
        local v144 = l_useSignalState_0(v142.selectedSubcategoryId);
        v138.catalogCategoryId = v143;
        v138.catalogSubcategoryId = v144;
    end;
    return v5.createElement(v80, v138);
end;