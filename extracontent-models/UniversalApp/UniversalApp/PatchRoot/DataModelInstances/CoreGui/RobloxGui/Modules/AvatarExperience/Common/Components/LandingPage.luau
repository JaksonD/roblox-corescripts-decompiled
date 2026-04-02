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
local v39 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
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
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_TTIPerformanceManager_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceTTIPerformance).TTIPerformanceManager;
local v67 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local v70 = {
    dampingRatio = 0.8, 
    frequency = 4
};
local function v72(v71) --[[ Line: 127 ]] --[[ Name: mapValuesToPropsLeft ]]
    return {
        Position = UDim2.new(0.5, -13, v71.yPosition, 0)
    };
end;
local function v74(v73) --[[ Line: 135 ]] --[[ Name: mapValuesToPropsRight ]]
    return {
        Position = UDim2.new(0.5, 13, v73.yPosition, 0)
    };
end;
local function v76(v75) --[[ Line: 143 ]] --[[ Name: mapValuesToPropsMiddle ]]
    return {
        Position = UDim2.new(0.5, 0, v75.yPosition, 13)
    };
end;
local v77 = v5.PureComponent:extend("AvatarExperienceLandingPage");
v77.validateProps = v12.strictInterface({
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
v77.init = function(v78) --[[ Line: 186 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v22 (copy), v23 (copy), l_AvatarScreen_0 (copy), l_UserInputService_0 (copy), l_isGamepadInput_0 (copy), v4 (copy), l_FFlagAXEnableTTIViaModule_0 (copy), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (copy), l_TTIPerformanceManager_0 (copy), l_TimeToInteractiveTracker_0 (copy), v35 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v33 (copy), v39 (copy)
    v78.robuxBalanceRef = v5.createRef();
    v78.quickMenuRef = v5.createRef();
    v78.state = {
        buttonsOffscreen = false, 
        buttonTransparencyModifier = 0
    };
    v78.luaAppReloadPageEventConnection = v22.ReloadPage:connect(function(v79) --[[ Line: 195 ]]
        -- upvalues: v23 (ref), v78 (copy), l_AvatarScreen_0 (ref)
        if v79 == v23.AvatarExperienceRoot then
            if v78.props.is10ftUI then
                v78.props.navigation.navigate(l_AvatarScreen_0.AvatarExperienceLandingPage);
                return;
            else
                v78.props.navigation.navigate(l_AvatarScreen_0.Catalog);
            end;
        end;
    end);
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    v78.lastInputTypeChangedCallback = function(v81) --[[ Line: 207 ]]
        -- upvalues: l_isGamepadInput_0 (ref), v78 (copy)
        local v82 = l_isGamepadInput_0(v81);
        if v82 ~= v78.state.lastInputIsGamepad then
            v78:setState({
                lastInputIsGamepad = v82
            });
        end;
    end;
    v78.state.lastInputIsGamepad = l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0);
    v78.updateButtonPositions = function() --[[ Line: 218 ]]
        -- upvalues: v78 (copy), v4 (ref)
        v78:setState({
            buttonsOffscreen = true
        });
        if v78.motor then
            v78.motor:setGoal(v4.spring(1), {
                frequency = 3
            });
        end;
    end;
    v78.showProfilePictureEditorCallback = function() --[[ Line: 230 ]]
        -- upvalues: v78 (copy), l_AvatarScreen_0 (ref)
        v78.props.profilePictureEditorAnalytics.profilePictureEditorOpenedFromLandingPage();
        v78.updateButtonPositions();
        delay(0.2, function() --[[ Line: 235 ]]
            -- upvalues: v78 (ref), l_AvatarScreen_0 (ref)
            v78.props.navigation.navigate(l_AvatarScreen_0.ProfilePictureEditorEmotes);
        end);
    end;
    v78.showAvatarEditorCallback = function() --[[ Line: 240 ]]
        -- upvalues: v78 (copy), l_AvatarScreen_0 (ref)
        v78.props.avatarAnalytics.avatarEditorOpenedFromLandingPage();
        v78.updateButtonPositions();
        delay(0.2, function() --[[ Line: 246 ]]
            -- upvalues: v78 (ref), l_AvatarScreen_0 (ref)
            if v78.isMounted then
                v78.props.navigation.navigate(l_AvatarScreen_0.AvatarEditor);
            end;
        end);
    end;
    v78.showCatalogCallback = function() --[[ Line: 253 ]]
        -- upvalues: v78 (copy), l_FFlagAXEnableTTIViaModule_0 (ref), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (ref), l_TTIPerformanceManager_0 (ref), l_TimeToInteractiveTracker_0 (ref), v35 (ref), l_AvatarScreen_0 (ref)
        v78.props.catalogAnalytics.catalogOpenedFromLandingPage();
        v78.updateButtonPositions();
        if l_FFlagAXEnableTTIViaModule_0 then
            if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                l_TTIPerformanceManager_0.Surface.Marketplace.Root.startPerceivedTracking();
            else
                l_TimeToInteractiveTracker_0.trackStart(v35.Counter.PREFIX .. v35.Counter.Latency.Organic.Tiles .. "_Percieved");
                l_TimeToInteractiveTracker_0.trackStart(v35.Counter.PREFIX .. v35.Counter.Latency.Organic.Thumbnails .. "_Percieved");
                l_TimeToInteractiveTracker_0.trackStart(v35.Counter.PREFIX .. v35.Counter.Latency.Widget.Tiles .. "_Percieved");
                l_TimeToInteractiveTracker_0.trackStart(v35.Counter.PREFIX .. v35.Counter.Latency.Widget.Thumbnails .. "_Percieved");
            end;
        end;
        v78.props.startPercievedCatalogTTITracker();
        delay(0.2, function() --[[ Line: 277 ]]
            -- upvalues: v78 (ref), l_AvatarScreen_0 (ref)
            if v78.isMounted then
                v78.props.navigation.navigate(l_AvatarScreen_0.Catalog);
            end;
        end);
    end;
    v78.transitionOnscreen = function() --[[ Line: 284 ]]
        -- upvalues: v78 (copy), v4 (ref)
        v78:setState({
            buttonsOffscreen = false
        });
        if v78.motor then
            v78.motor:setGoal(v4.spring(0), {
                frequency = 3
            });
        end;
    end;
    v78.pageButtonsRef = v5.createRef();
    v78.catalogPageButtonRef = v5.createRef();
    v78.avatarPageButtonRef = v5.createRef();
    v78.topFrameRef = v5.createRef();
    v78.topBarRef = v5.createRef();
    v78.robuxButtonRef = v5.createRef();
    v78.profilePictureEditorPageButtonRef = v5.createRef();
    v78.topFrameRef = v5.createRef();
    v78.sceneUIContainerRef = v5.createRef();
    v78.onComplete = function() --[[ Line: 308 ]]
        -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v78 (copy), v33 (ref)
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v78.isFocused and v78.props.lastInputGroup == v33.InputType.Gamepad and v78.props.avatarRoute.isVisible and not v78.state.buttonsOffscreen and v78.props.shouldCaptureFocus then
            v78.props.focusController.captureFocus();
        end;
    end;
    v78.onWillFocus = function() --[[ Line: 320 ]]
        -- upvalues: v78 (copy), v4 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v33 (ref)
        if not v78.isMounted then
            return;
        else
            v78.isFocused = true;
            v78.motor = v4.createSingleMotor(v78.state.buttonTransparencyModifier);
            v78.motor:onStep(function(v83) --[[ Line: 328 ]]
                -- upvalues: v78 (ref)
                if not v78.isFocused and not v78.isMounted then
                    return;
                else
                    v78:setState({
                        buttonTransparencyModifier = v83
                    });
                    return;
                end;
            end);
            v78.transitionOnscreen();
            if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v78.isFocused and v78.props.lastInputGroup == v33.InputType.Gamepad and v78.props.avatarRoute.isVisible and v78.props.shouldCaptureFocus then
                v78.props.focusController.captureFocus();
            end;
            return;
        end;
    end;
    v78.onWillBlur = function() --[[ Line: 350 ]]
        -- upvalues: v78 (copy)
        if v78.motor then
            v78.motor:destroy();
        end;
        v78.isFocused = false;
    end;
    v78.resetCategoryNavigation = function() --[[ Line: 359 ]]
        -- upvalues: v78 (copy)
        local l_avatarCategory_0 = v78.props.avatarCategory;
        local l_avatarSubcategory_0 = v78.props.avatarSubcategory;
        local l_catalogCategoryId_0 = v78.props.catalogCategoryId;
        local l_catalogSubcategoryId_0 = v78.props.catalogSubcategoryId;
        if l_avatarCategory_0 ~= 1 or l_avatarSubcategory_0 ~= 1 then
            v78.props.resetAvatarCategories(v78.props.avatarAnalytics);
            return;
        else
            if l_catalogCategoryId_0 ~= "1" or l_catalogSubcategoryId_0 ~= "1" then
                v78.props.resetCatalogCategories(v78.props.catalogAnalytics);
            end;
            return;
        end;
    end;
    v78.setUIFullView = function() --[[ Line: 373 ]]
        -- upvalues: v78 (copy), l_AvatarScreen_0 (ref), v39 (ref)
        local l_avatarExperienceAnalytics_0 = v78.props.avatarExperienceAnalytics;
        v78.props.setFullView(l_avatarExperienceAnalytics_0, l_AvatarScreen_0.CatalogSearch, v39.UIFullView);
    end;
end;
v77.renderTopBar = function(v89) --[[ Line: 380 ]] --[[ Name: renderTopBar ]]
    -- upvalues: v57 (copy), l_withLocalization_0 (copy), v5 (copy), v60 (copy), v32 (copy), l_Focusable_0 (copy), v34 (copy), v56 (copy)
    local v90 = 0;
    if v57() then
        v90 = 2;
    end;
    return l_withLocalization_0({
        title = "CommonUI.Features.Label.Avatar"
    })(function(v91) --[[ Line: 388 ]]
        -- upvalues: v5 (ref), v60 (ref), v32 (ref), l_Focusable_0 (ref), v57 (ref), v34 (ref), v90 (ref), v56 (ref), v89 (copy)
        return v5.createElement(if v60 then v32.Container else l_Focusable_0[v32.Container], {
            titleText = v91.title, 
            searchType = v57() and v34.SearchTypes.Catalog or nil, 
            transparentBackground = true, 
            ZIndex = v90, 
            onConfirmSearchCallback = v56() and v89.setUIFullView or nil, 
            rightItems = if v57() then {
                v32.SearchButton
            } else {}, 
            [v5.Ref] = v89.topBarRef, 
            NextSelectionDown = if v60 then nil else v89.catalogPageButtonRef, 
            NextSelectionRight = if v60 then nil else v89.sceneUIContainerRef, 
            NextSelectionUp = if v60 then nil else v89.props.NextSelectionUp
        });
    end);
end;
v77.makeLeftFrame = function(v92, v93, v94, v95) --[[ Line: 408 ]] --[[ Name: makeLeftFrame ]]
    -- upvalues: v5 (copy), l_SpringAnimatedItem_0 (copy), v72 (copy), v70 (copy), v60 (copy), v28 (copy), l_Focusable_0 (copy)
    local l_buttonsOffscreen_0 = v92.state.buttonsOffscreen;
    return v5.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
        regularProps = {
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.new(0.5, -v94 * 3 / 4, v93, 0)
        }, 
        animatedValues = {
            xPosition = 0.5, 
            yPosition = l_buttonsOffscreen_0 and v95 or 0.5
        }, 
        mapValuesToProps = v72, 
        springOptions = v70, 
        onComplete = v92.onComplete
    }, {
        AvatarPageButton = v5.createElement(if v60 then v28 else l_Focusable_0[v28], {
            onActivated = v92.showAvatarEditorCallback, 
            transparencyModifier = v92.state.buttonTransparencyModifier, 
            [v5.Ref] = v92.avatarPageButtonRef, 
            NextSelectionRight = if v60 then nil else v92.catalogPageButtonRef, 
            NextSelectionDown = if v60 then nil else v92.profilePictureEditorPageButtonRef, 
            NextSelectionUp = if v60 then nil else v92.topBarRef
        })
    });
end;
v77.makeRightFrame = function(v97, v98, v99, v100) --[[ Line: 444 ]] --[[ Name: makeRightFrame ]]
    -- upvalues: v5 (copy), l_SpringAnimatedItem_0 (copy), v74 (copy), v70 (copy), v60 (copy), v29 (copy), l_Focusable_0 (copy)
    local l_buttonsOffscreen_1 = v97.state.buttonsOffscreen;
    return v5.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
        regularProps = {
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.new(0.5, -v99 * 3 / 4, v98, 0)
        }, 
        animatedValues = {
            xPosition = 0.5, 
            yPosition = l_buttonsOffscreen_1 and v100 or 0.5
        }, 
        mapValuesToProps = v74, 
        springOptions = v70
    }, {
        CatalogPageButton = v5.createElement(if v60 then v29 else l_Focusable_0[v29], {
            onActivated = v97.showCatalogCallback, 
            transparencyModifier = v97.state.buttonTransparencyModifier, 
            [v5.Ref] = v97.catalogPageButtonRef, 
            NextSelectionLeft = if v60 then nil else v97.avatarPageButtonRef, 
            NextSelectionRight = if v60 then nil else v97.sceneUIContainerRef, 
            NextSelectionDown = if v60 then nil else v97.profilePictureEditorPageButtonRef, 
            NextSelectionUp = if v60 then nil else v97.topBarRef
        })
    });
end;
v77.makeMiddleFrame = function(v102, v103, v104, v105) --[[ Line: 480 ]] --[[ Name: makeMiddleFrame ]]
    -- upvalues: v5 (copy), l_SpringAnimatedItem_0 (copy), v76 (copy), v70 (copy), v60 (copy), v30 (copy), l_Focusable_0 (copy)
    local l_buttonsOffscreen_2 = v102.state.buttonsOffscreen;
    return v5.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
        regularProps = {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, -v104, v103, -v104 / 2)
        }, 
        animatedValues = {
            xPosition = 0.5, 
            yPosition = l_buttonsOffscreen_2 and v105 or 0.5
        }, 
        mapValuesToProps = v76, 
        springOptions = v70, 
        onComplete = v102.onComplete
    }, {
        ProfilePictureEditorPageButton = v5.createElement(if v60 then v30 else l_Focusable_0[v30], {
            onActivated = v102.showProfilePictureEditorCallback, 
            transparencyModifier = v102.state.buttonTransparencyModifier, 
            [v5.Ref] = v102.profilePictureEditorPageButtonRef, 
            NextSelectionUp = if v60 then nil else v102.topFrameRef
        })
    });
end;
v77.renderAvatarExperienceView = function(v107, v108) --[[ Line: 514 ]] --[[ Name: renderAvatarExperienceView ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v5 (copy), v27 (copy), v60 (copy), v57 (copy), v37 (copy), v42 (copy), v58 (copy), v10 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v31 (copy), l_Focusable_0 (copy), v35 (copy)
    local v109 = v107.props.deviceOrientation == l_DeviceOrientationMode_0.Portrait;
    local v110 = v109 and 0.8 or 0.5;
    local v111 = v109 and 52 or 48;
    local v112 = nil;
    local v113 = nil;
    local v114 = nil;
    local v115 = nil;
    local v116 = nil;
    v112 = v109 and 0.528 or 0.33;
    v113 = v109 and 0.27199999999999996 or 0.16999999999999998;
    v114 = v109 and 0.8 or 0.5;
    v110 = 1;
    v115 = 0.5 + (0.5 + 0.5 * v114) / v112;
    v116 = 0.5 + (0.5 + 0.5 * v114) / v113;
    return v5.createElement(v27, {
        topBar = v108 and v107:renderTopBar() or nil, 
        ZIndex = 1, 
        bottomBarEnabled = true, 
        isSceneFullView = false, 
        isUIFullView = false, 
        isLandingPage = true, 
        showRobuxBalance = false, 
        [v5.Ref] = v107.sceneUIContainerRef, 
        NextSelectionLeft = if v60 then nil else if v57() then v107.topBarRef else nil, 
        NextSelectionDown = if v60 then nil else v107.pageButtonsRef, 
        NextSelectionUp = if v60 then nil else v107.props.NextSelectionUp
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
            onWillFocus = v107.onWillFocus, 
            onWillBlur = v107.onWillBlur
        }), 
        GamepadFocusHandlerForPage = if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v107.props.shouldCaptureFocus then v5.createElement(v31, {
            focusController = v107.props.focusController
        }) else nil, 
        Buttons = v5.createElement(v60 and "Frame" or l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            [v5.Ref] = v107.pageButtonsRef, 
            NextSelectionUp = if v60 then nil else v107.sceneUIContainerRef, 
            defaultChild = if v60 then nil else v107.topFrameRef, 
            restorePreviousChildFocus = not v60 or nil
        }, {
            TopFrame = v5.createElement(v60 and "Frame" or l_Focusable_0.Frame, {
                Size = UDim2.new(1, 0, v112, 0), 
                Position = UDim2.new(0, 0, v112 + 0.5 - v114 / 2, 0), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = 1, 
                [v5.Ref] = v107.topFrameRef, 
                defaultChild = if v60 then nil else v107.avatarPageButtonRef, 
                restorePreviousChildFocus = not v60 or nil
            }, {
                LeftFrame = v107:makeLeftFrame(v110, v111, v115), 
                RightFrame = v107:makeRightFrame(v110, v111, v115), 
                uiSizeConstraint = v5.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(0, v35.LandingPageMinTopFrameHeightPix)
                })
            }), 
            BottomFrame = v5.createElement("Frame", {
                Size = UDim2.new(1, 0, v113, 0), 
                Position = UDim2.new(0, 0, 0.5 - v114 / 2 + v112, 0), 
                BackgroundTransparency = 1
            }, {
                MiddleFrame = v107:makeMiddleFrame(v110, v111, v116), 
                uiSizeConstraint = v5.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(0, v35.LandingPageMinBottomFrameHeightPix)
                })
            })
        })
    });
end;
v77.renderMainView = function(v117) --[[ Line: 605 ]] --[[ Name: renderMainView ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v5 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy)
    if not (v117.props.deviceOrientation == l_DeviceOrientationMode_0.Portrait) then
        return v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            [v5.Ref] = v117.props.focusNavigationBindingsRef
        }, {
            LastInputTypeChangedConnection = v5.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.LastInputTypeChanged, 
                callback = v117.lastInputTypeChangedCallback
            }), 
            TopBar = v117:renderTopBar(), 
            AEView = v117:renderAvatarExperienceView(false)
        });
    else
        return v117:renderAvatarExperienceView(true);
    end;
end;
v77.render = function(v118) --[[ Line: 627 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v60 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    return v5.createElement(v60 and "Frame" or l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v118.props.focusController, 
        defaultChild = if v60 then nil else v118.pageButtonsRef
    }, {
        v118:renderMainView()
    });
end;
v77.didMount = function(v119) --[[ Line: 638 ]] --[[ Name: didMount ]]
    v119.isMounted = true;
end;
v77.willUnmount = function(v120) --[[ Line: 642 ]] --[[ Name: willUnmount ]]
    v120.isFocused = false;
    v120.isMounted = false;
    if v120.luaAppReloadPageEventConnection ~= nil then
        v120.luaAppReloadPageEventConnection:disconnect();
        v120.luaAppReloadPageEventConnection = nil;
    end;
end;
local function v123(v121, v122) --[[ Line: 652 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy)
    return {
        avatarCategory = v121.AvatarExperience.AvatarEditor.Categories.category, 
        avatarSubcategory = v121.AvatarExperience.AvatarEditor.Categories.subcategory, 
        catalogCategory = if l_FFlagAXCatalogCategoriesStore_0 then v122.catalogCategory else nil, 
        catalogSubcategory = if l_FFlagAXCatalogCategoriesStore_0 then v122.catalogSubcategory else nil, 
        catalogCategoryId = v121.AvatarExperience.Catalog.Categories.categoryId, 
        catalogSubcategoryId = v121.AvatarExperience.Catalog.Categories.subcategoryId, 
        deviceOrientation = v121.DeviceOrientation, 
        statusBarHeight = v121.TopBar.statusBarHeight
    };
end;
local function v130(v124) --[[ Line: 665 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v43 (copy), v44 (copy), v38 (copy), v54 (copy)
    return {
        resetAvatarCategories = function(v125) --[[ Line: 667 ]] --[[ Name: resetAvatarCategories ]]
            -- upvalues: v124 (copy), v43 (ref)
            v124(v43(1, nil, v125));
        end, 
        resetCatalogCategories = function(v126) --[[ Line: 671 ]] --[[ Name: resetCatalogCategories ]]
            -- upvalues: v124 (copy), v44 (ref)
            v124(v44(1, nil, v126));
        end, 
        setFullView = function(v127, v128, v129) --[[ Line: 675 ]] --[[ Name: setFullView ]]
            -- upvalues: v124 (copy), v38 (ref)
            v124(v38(v127, v128, v129));
        end, 
        startPercievedCatalogTTITracker = function() --[[ Line: 679 ]] --[[ Name: startPercievedCatalogTTITracker ]]
            -- upvalues: v124 (copy), v54 (ref)
            v124(v54.PercievedTrackingStarted());
        end
    };
end;
v77 = v21(v77);
v77 = l_RoactServices_0.connect({
    avatarAnalytics = v13, 
    catalogAnalytics = v14, 
    avatarExperienceAnalytics = v16, 
    profilePictureEditorAnalytics = v15
})(v77);
v77 = v36((v9.connect(v123, v130)(v77)));
return function(v131) --[[ Line: 698 ]] --[[ Name: AvatarExperienceLandingPageContainer ]]
    -- upvalues: l_useRegistryEntry_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_useFirstFocusableDescendantRef_0 (copy), l_useDescendantHasFocus_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v6 (copy), v7 (copy), v51 (copy), v50 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v67 (copy), l_useSignalState_0 (copy), v5 (copy), v77 (ref)
    local v132 = l_useRegistryEntry_0(l_FocusNavigableSurfaceIdentifierEnum_0.NavBar);
    local v133 = l_useFirstFocusableDescendantRef_0(v132);
    local v134 = l_useDescendantHasFocus_0(v132);
    local v135 = table.clone(v131);
    v135.NextSelectionUp = if v132 then v133 else nil;
    v135.shouldCaptureFocus = not v134;
    local v136 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v6.useRef(if v131.focusController then v131.focusController else v7.createFocusController()).current;
    local v137 = v51(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v136);
    local v138 = v50({
        overlayClosedCallback = v137
    });
    v135.focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v136;
    v135.focusNavigationBindingsRef = v138;
    local v139 = false;
    if l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot then
        v139 = not l_FFlagEnableLeftNavOnConsole_0;
    end;
    v135.is10ftUI = v139;
    if l_FFlagAXCatalogCategoriesStore_0 then
        v139 = v67.getCatalogSelectionStore();
        local v140 = l_useSignalState_0(v139.selectedCategoryId);
        local v141 = l_useSignalState_0(v139.selectedSubcategoryId);
        v135.catalogCategoryId = v140;
        v135.catalogSubcategoryId = v141;
    end;
    return v5.createElement(v77, v135);
end;