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
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local v65 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local v68 = {
    dampingRatio = 0.8, 
    frequency = 4
};
local function v70(v69) --[[ Line: 123 ]] --[[ Name: mapValuesToPropsLeft ]]
    return {
        Position = UDim2.new(0.5, -13, v69.yPosition, 0)
    };
end;
local function v72(v71) --[[ Line: 131 ]] --[[ Name: mapValuesToPropsRight ]]
    return {
        Position = UDim2.new(0.5, 13, v71.yPosition, 0)
    };
end;
local function v74(v73) --[[ Line: 139 ]] --[[ Name: mapValuesToPropsMiddle ]]
    return {
        Position = UDim2.new(0.5, 0, v73.yPosition, 13)
    };
end;
local v75 = v5.PureComponent:extend("AvatarExperienceLandingPage");
v75.validateProps = v12.strictInterface({
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
v75.init = function(v76) --[[ Line: 182 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v22 (copy), v23 (copy), l_AvatarScreen_0 (copy), l_UserInputService_0 (copy), l_isGamepadInput_0 (copy), v4 (copy), l_FFlagAXEnableTTIViaModule_0 (copy), l_TimeToInteractiveTracker_0 (copy), v35 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v33 (copy), v39 (copy)
    v76.robuxBalanceRef = v5.createRef();
    v76.quickMenuRef = v5.createRef();
    v76.state = {
        buttonsOffscreen = false, 
        buttonTransparencyModifier = 0
    };
    v76.luaAppReloadPageEventConnection = v22.ReloadPage:connect(function(v77) --[[ Line: 191 ]]
        -- upvalues: v23 (ref), v76 (copy), l_AvatarScreen_0 (ref)
        if v77 == v23.AvatarExperienceRoot then
            if v76.props.is10ftUI then
                v76.props.navigation.navigate(l_AvatarScreen_0.AvatarExperienceLandingPage);
                return;
            else
                v76.props.navigation.navigate(l_AvatarScreen_0.Catalog);
            end;
        end;
    end);
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    v76.lastInputTypeChangedCallback = function(v79) --[[ Line: 203 ]]
        -- upvalues: l_isGamepadInput_0 (ref), v76 (copy)
        local v80 = l_isGamepadInput_0(v79);
        if v80 ~= v76.state.lastInputIsGamepad then
            v76:setState({
                lastInputIsGamepad = v80
            });
        end;
    end;
    v76.state.lastInputIsGamepad = l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0);
    v76.updateButtonPositions = function() --[[ Line: 214 ]]
        -- upvalues: v76 (copy), v4 (ref)
        v76:setState({
            buttonsOffscreen = true
        });
        if v76.motor then
            v76.motor:setGoal(v4.spring(1), {
                frequency = 3
            });
        end;
    end;
    v76.showProfilePictureEditorCallback = function() --[[ Line: 226 ]]
        -- upvalues: v76 (copy), l_AvatarScreen_0 (ref)
        v76.props.profilePictureEditorAnalytics.profilePictureEditorOpenedFromLandingPage();
        v76.updateButtonPositions();
        delay(0.2, function() --[[ Line: 231 ]]
            -- upvalues: v76 (ref), l_AvatarScreen_0 (ref)
            v76.props.navigation.navigate(l_AvatarScreen_0.ProfilePictureEditorEmotes);
        end);
    end;
    v76.showAvatarEditorCallback = function() --[[ Line: 236 ]]
        -- upvalues: v76 (copy), l_AvatarScreen_0 (ref)
        v76.props.avatarAnalytics.avatarEditorOpenedFromLandingPage();
        v76.updateButtonPositions();
        delay(0.2, function() --[[ Line: 242 ]]
            -- upvalues: v76 (ref), l_AvatarScreen_0 (ref)
            if v76.isMounted then
                v76.props.navigation.navigate(l_AvatarScreen_0.AvatarEditor);
            end;
        end);
    end;
    v76.showCatalogCallback = function() --[[ Line: 249 ]]
        -- upvalues: v76 (copy), l_FFlagAXEnableTTIViaModule_0 (ref), l_TimeToInteractiveTracker_0 (ref), v35 (ref), l_AvatarScreen_0 (ref)
        v76.props.catalogAnalytics.catalogOpenedFromLandingPage();
        v76.updateButtonPositions();
        if l_FFlagAXEnableTTIViaModule_0 then
            l_TimeToInteractiveTracker_0.trackStart(v35.Counter.PREFIX .. v35.Counter.Latency.Organic.Tiles .. "_Percieved");
            l_TimeToInteractiveTracker_0.trackStart(v35.Counter.PREFIX .. v35.Counter.Latency.Organic.Thumbnails .. "_Percieved");
            l_TimeToInteractiveTracker_0.trackStart(v35.Counter.PREFIX .. v35.Counter.Latency.Widget.Tiles .. "_Percieved");
            l_TimeToInteractiveTracker_0.trackStart(v35.Counter.PREFIX .. v35.Counter.Latency.Widget.Thumbnails .. "_Percieved");
        end;
        v76.props.startPercievedCatalogTTITracker();
        delay(0.2, function() --[[ Line: 270 ]]
            -- upvalues: v76 (ref), l_AvatarScreen_0 (ref)
            if v76.isMounted then
                v76.props.navigation.navigate(l_AvatarScreen_0.Catalog);
            end;
        end);
    end;
    v76.transitionOnscreen = function() --[[ Line: 277 ]]
        -- upvalues: v76 (copy), v4 (ref)
        v76:setState({
            buttonsOffscreen = false
        });
        if v76.motor then
            v76.motor:setGoal(v4.spring(0), {
                frequency = 3
            });
        end;
    end;
    v76.pageButtonsRef = v5.createRef();
    v76.catalogPageButtonRef = v5.createRef();
    v76.avatarPageButtonRef = v5.createRef();
    v76.topFrameRef = v5.createRef();
    v76.topBarRef = v5.createRef();
    v76.robuxButtonRef = v5.createRef();
    v76.profilePictureEditorPageButtonRef = v5.createRef();
    v76.topFrameRef = v5.createRef();
    v76.sceneUIContainerRef = v5.createRef();
    v76.onComplete = function() --[[ Line: 301 ]]
        -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v76 (copy), v33 (ref)
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v76.isFocused and v76.props.lastInputGroup == v33.InputType.Gamepad and v76.props.avatarRoute.isVisible and not v76.state.buttonsOffscreen and v76.props.shouldCaptureFocus then
            v76.props.focusController.captureFocus();
        end;
    end;
    v76.onWillFocus = function() --[[ Line: 313 ]]
        -- upvalues: v76 (copy), v4 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v33 (ref)
        if not v76.isMounted then
            return;
        else
            v76.isFocused = true;
            v76.motor = v4.createSingleMotor(v76.state.buttonTransparencyModifier);
            v76.motor:onStep(function(v81) --[[ Line: 321 ]]
                -- upvalues: v76 (ref)
                if not v76.isFocused and not v76.isMounted then
                    return;
                else
                    v76:setState({
                        buttonTransparencyModifier = v81
                    });
                    return;
                end;
            end);
            v76.transitionOnscreen();
            if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v76.isFocused and v76.props.lastInputGroup == v33.InputType.Gamepad and v76.props.avatarRoute.isVisible and v76.props.shouldCaptureFocus then
                v76.props.focusController.captureFocus();
            end;
            return;
        end;
    end;
    v76.onWillBlur = function() --[[ Line: 343 ]]
        -- upvalues: v76 (copy)
        if v76.motor then
            v76.motor:destroy();
        end;
        v76.isFocused = false;
    end;
    v76.resetCategoryNavigation = function() --[[ Line: 352 ]]
        -- upvalues: v76 (copy)
        local l_avatarCategory_0 = v76.props.avatarCategory;
        local l_avatarSubcategory_0 = v76.props.avatarSubcategory;
        local l_catalogCategoryId_0 = v76.props.catalogCategoryId;
        local l_catalogSubcategoryId_0 = v76.props.catalogSubcategoryId;
        if l_avatarCategory_0 ~= 1 or l_avatarSubcategory_0 ~= 1 then
            v76.props.resetAvatarCategories(v76.props.avatarAnalytics);
            return;
        else
            if l_catalogCategoryId_0 ~= "1" or l_catalogSubcategoryId_0 ~= "1" then
                v76.props.resetCatalogCategories(v76.props.catalogAnalytics);
            end;
            return;
        end;
    end;
    v76.setUIFullView = function() --[[ Line: 366 ]]
        -- upvalues: v76 (copy), l_AvatarScreen_0 (ref), v39 (ref)
        local l_avatarExperienceAnalytics_0 = v76.props.avatarExperienceAnalytics;
        v76.props.setFullView(l_avatarExperienceAnalytics_0, l_AvatarScreen_0.CatalogSearch, v39.UIFullView);
    end;
end;
v75.renderTopBar = function(v87) --[[ Line: 373 ]] --[[ Name: renderTopBar ]]
    -- upvalues: v57 (copy), l_withLocalization_0 (copy), v5 (copy), v60 (copy), v32 (copy), l_Focusable_0 (copy), v34 (copy), v56 (copy)
    local v88 = 0;
    if v57() then
        v88 = 2;
    end;
    return l_withLocalization_0({
        title = "CommonUI.Features.Label.Avatar"
    })(function(v89) --[[ Line: 381 ]]
        -- upvalues: v5 (ref), v60 (ref), v32 (ref), l_Focusable_0 (ref), v57 (ref), v34 (ref), v88 (ref), v56 (ref), v87 (copy)
        return v5.createElement(if v60 then v32.Container else l_Focusable_0[v32.Container], {
            titleText = v89.title, 
            searchType = v57() and v34.SearchTypes.Catalog or nil, 
            transparentBackground = true, 
            ZIndex = v88, 
            onConfirmSearchCallback = v56() and v87.setUIFullView or nil, 
            rightItems = if v57() then {
                v32.SearchButton
            } else {}, 
            [v5.Ref] = v87.topBarRef, 
            NextSelectionDown = if v60 then nil else v87.catalogPageButtonRef, 
            NextSelectionRight = if v60 then nil else v87.sceneUIContainerRef, 
            NextSelectionUp = if v60 then nil else v87.props.NextSelectionUp
        });
    end);
end;
v75.makeLeftFrame = function(v90, v91, v92, v93) --[[ Line: 401 ]] --[[ Name: makeLeftFrame ]]
    -- upvalues: v5 (copy), l_SpringAnimatedItem_0 (copy), v70 (copy), v68 (copy), v60 (copy), v28 (copy), l_Focusable_0 (copy)
    local l_buttonsOffscreen_0 = v90.state.buttonsOffscreen;
    return v5.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
        regularProps = {
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.new(0.5, -v92 * 3 / 4, v91, 0)
        }, 
        animatedValues = {
            xPosition = 0.5, 
            yPosition = l_buttonsOffscreen_0 and v93 or 0.5
        }, 
        mapValuesToProps = v70, 
        springOptions = v68, 
        onComplete = v90.onComplete
    }, {
        AvatarPageButton = v5.createElement(if v60 then v28 else l_Focusable_0[v28], {
            onActivated = v90.showAvatarEditorCallback, 
            transparencyModifier = v90.state.buttonTransparencyModifier, 
            [v5.Ref] = v90.avatarPageButtonRef, 
            NextSelectionRight = if v60 then nil else v90.catalogPageButtonRef, 
            NextSelectionDown = if v60 then nil else v90.profilePictureEditorPageButtonRef, 
            NextSelectionUp = if v60 then nil else v90.topBarRef
        })
    });
end;
v75.makeRightFrame = function(v95, v96, v97, v98) --[[ Line: 437 ]] --[[ Name: makeRightFrame ]]
    -- upvalues: v5 (copy), l_SpringAnimatedItem_0 (copy), v72 (copy), v68 (copy), v60 (copy), v29 (copy), l_Focusable_0 (copy)
    local l_buttonsOffscreen_1 = v95.state.buttonsOffscreen;
    return v5.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
        regularProps = {
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.new(0.5, -v97 * 3 / 4, v96, 0)
        }, 
        animatedValues = {
            xPosition = 0.5, 
            yPosition = l_buttonsOffscreen_1 and v98 or 0.5
        }, 
        mapValuesToProps = v72, 
        springOptions = v68
    }, {
        CatalogPageButton = v5.createElement(if v60 then v29 else l_Focusable_0[v29], {
            onActivated = v95.showCatalogCallback, 
            transparencyModifier = v95.state.buttonTransparencyModifier, 
            [v5.Ref] = v95.catalogPageButtonRef, 
            NextSelectionLeft = if v60 then nil else v95.avatarPageButtonRef, 
            NextSelectionRight = if v60 then nil else v95.sceneUIContainerRef, 
            NextSelectionDown = if v60 then nil else v95.profilePictureEditorPageButtonRef, 
            NextSelectionUp = if v60 then nil else v95.topBarRef
        })
    });
end;
v75.makeMiddleFrame = function(v100, v101, v102, v103) --[[ Line: 473 ]] --[[ Name: makeMiddleFrame ]]
    -- upvalues: v5 (copy), l_SpringAnimatedItem_0 (copy), v74 (copy), v68 (copy), v60 (copy), v30 (copy), l_Focusable_0 (copy)
    local l_buttonsOffscreen_2 = v100.state.buttonsOffscreen;
    return v5.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
        regularProps = {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, -v102, v101, -v102 / 2)
        }, 
        animatedValues = {
            xPosition = 0.5, 
            yPosition = l_buttonsOffscreen_2 and v103 or 0.5
        }, 
        mapValuesToProps = v74, 
        springOptions = v68, 
        onComplete = v100.onComplete
    }, {
        ProfilePictureEditorPageButton = v5.createElement(if v60 then v30 else l_Focusable_0[v30], {
            onActivated = v100.showProfilePictureEditorCallback, 
            transparencyModifier = v100.state.buttonTransparencyModifier, 
            [v5.Ref] = v100.profilePictureEditorPageButtonRef, 
            NextSelectionUp = if v60 then nil else v100.topFrameRef
        })
    });
end;
v75.renderAvatarExperienceView = function(v105, v106) --[[ Line: 507 ]] --[[ Name: renderAvatarExperienceView ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v5 (copy), v27 (copy), v60 (copy), v57 (copy), v37 (copy), v42 (copy), v58 (copy), v10 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v31 (copy), l_Focusable_0 (copy), v35 (copy)
    local v107 = v105.props.deviceOrientation == l_DeviceOrientationMode_0.Portrait;
    local v108 = v107 and 0.8 or 0.5;
    local v109 = v107 and 52 or 48;
    local v110 = nil;
    local v111 = nil;
    local v112 = nil;
    local v113 = nil;
    local v114 = nil;
    v110 = v107 and 0.528 or 0.33;
    v111 = v107 and 0.27199999999999996 or 0.16999999999999998;
    v112 = v107 and 0.8 or 0.5;
    v108 = 1;
    v113 = 0.5 + (0.5 + 0.5 * v112) / v110;
    v114 = 0.5 + (0.5 + 0.5 * v112) / v111;
    return v5.createElement(v27, {
        topBar = v106 and v105:renderTopBar() or nil, 
        ZIndex = 1, 
        bottomBarEnabled = true, 
        isSceneFullView = false, 
        isUIFullView = false, 
        isLandingPage = true, 
        showRobuxBalance = false, 
        [v5.Ref] = v105.sceneUIContainerRef, 
        NextSelectionLeft = if v60 then nil else if v57() then v105.topBarRef else nil, 
        NextSelectionDown = if v60 then nil else v105.pageButtonsRef, 
        NextSelectionUp = if v60 then nil else v105.props.NextSelectionUp
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
            onWillFocus = v105.onWillFocus, 
            onWillBlur = v105.onWillBlur
        }), 
        GamepadFocusHandlerForPage = if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v105.props.shouldCaptureFocus then v5.createElement(v31, {
            focusController = v105.props.focusController
        }) else nil, 
        Buttons = v5.createElement(v60 and "Frame" or l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            [v5.Ref] = v105.pageButtonsRef, 
            NextSelectionUp = if v60 then nil else v105.sceneUIContainerRef, 
            defaultChild = if v60 then nil else v105.topFrameRef, 
            restorePreviousChildFocus = not v60 or nil
        }, {
            TopFrame = v5.createElement(v60 and "Frame" or l_Focusable_0.Frame, {
                Size = UDim2.new(1, 0, v110, 0), 
                Position = UDim2.new(0, 0, v110 + 0.5 - v112 / 2, 0), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = 1, 
                [v5.Ref] = v105.topFrameRef, 
                defaultChild = if v60 then nil else v105.avatarPageButtonRef, 
                restorePreviousChildFocus = not v60 or nil
            }, {
                LeftFrame = v105:makeLeftFrame(v108, v109, v113), 
                RightFrame = v105:makeRightFrame(v108, v109, v113), 
                uiSizeConstraint = v5.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(0, v35.LandingPageMinTopFrameHeightPix)
                })
            }), 
            BottomFrame = v5.createElement("Frame", {
                Size = UDim2.new(1, 0, v111, 0), 
                Position = UDim2.new(0, 0, 0.5 - v112 / 2 + v110, 0), 
                BackgroundTransparency = 1
            }, {
                MiddleFrame = v105:makeMiddleFrame(v108, v109, v114), 
                uiSizeConstraint = v5.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(0, v35.LandingPageMinBottomFrameHeightPix)
                })
            })
        })
    });
end;
v75.renderMainView = function(v115) --[[ Line: 598 ]] --[[ Name: renderMainView ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v5 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy)
    if not (v115.props.deviceOrientation == l_DeviceOrientationMode_0.Portrait) then
        return v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            [v5.Ref] = v115.props.focusNavigationBindingsRef
        }, {
            LastInputTypeChangedConnection = v5.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.LastInputTypeChanged, 
                callback = v115.lastInputTypeChangedCallback
            }), 
            TopBar = v115:renderTopBar(), 
            AEView = v115:renderAvatarExperienceView(false)
        });
    else
        return v115:renderAvatarExperienceView(true);
    end;
end;
v75.render = function(v116) --[[ Line: 620 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v60 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    return v5.createElement(v60 and "Frame" or l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v116.props.focusController, 
        defaultChild = if v60 then nil else v116.pageButtonsRef
    }, {
        v116:renderMainView()
    });
end;
v75.didMount = function(v117) --[[ Line: 631 ]] --[[ Name: didMount ]]
    v117.isMounted = true;
end;
v75.willUnmount = function(v118) --[[ Line: 635 ]] --[[ Name: willUnmount ]]
    v118.isFocused = false;
    v118.isMounted = false;
    if v118.luaAppReloadPageEventConnection ~= nil then
        v118.luaAppReloadPageEventConnection:disconnect();
        v118.luaAppReloadPageEventConnection = nil;
    end;
end;
local function v121(v119, v120) --[[ Line: 645 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy)
    return {
        avatarCategory = v119.AvatarExperience.AvatarEditor.Categories.category, 
        avatarSubcategory = v119.AvatarExperience.AvatarEditor.Categories.subcategory, 
        catalogCategory = if l_FFlagAXCatalogCategoriesStore_0 then v120.catalogCategory else nil, 
        catalogSubcategory = if l_FFlagAXCatalogCategoriesStore_0 then v120.catalogSubcategory else nil, 
        catalogCategoryId = v119.AvatarExperience.Catalog.Categories.categoryId, 
        catalogSubcategoryId = v119.AvatarExperience.Catalog.Categories.subcategoryId, 
        deviceOrientation = v119.DeviceOrientation, 
        statusBarHeight = v119.TopBar.statusBarHeight
    };
end;
local function v128(v122) --[[ Line: 658 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v43 (copy), v44 (copy), v38 (copy), v54 (copy)
    return {
        resetAvatarCategories = function(v123) --[[ Line: 660 ]] --[[ Name: resetAvatarCategories ]]
            -- upvalues: v122 (copy), v43 (ref)
            v122(v43(1, nil, v123));
        end, 
        resetCatalogCategories = function(v124) --[[ Line: 664 ]] --[[ Name: resetCatalogCategories ]]
            -- upvalues: v122 (copy), v44 (ref)
            v122(v44(1, nil, v124));
        end, 
        setFullView = function(v125, v126, v127) --[[ Line: 668 ]] --[[ Name: setFullView ]]
            -- upvalues: v122 (copy), v38 (ref)
            v122(v38(v125, v126, v127));
        end, 
        startPercievedCatalogTTITracker = function() --[[ Line: 672 ]] --[[ Name: startPercievedCatalogTTITracker ]]
            -- upvalues: v122 (copy), v54 (ref)
            v122(v54.PercievedTrackingStarted());
        end
    };
end;
v75 = v21(v75);
v75 = l_RoactServices_0.connect({
    avatarAnalytics = v13, 
    catalogAnalytics = v14, 
    avatarExperienceAnalytics = v16, 
    profilePictureEditorAnalytics = v15
})(v75);
v75 = v36((v9.connect(v121, v128)(v75)));
return function(v129) --[[ Line: 691 ]] --[[ Name: AvatarExperienceLandingPageContainer ]]
    -- upvalues: l_useRegistryEntry_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_useFirstFocusableDescendantRef_0 (copy), l_useDescendantHasFocus_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v6 (copy), v7 (copy), v51 (copy), v50 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v65 (copy), l_useSignalState_0 (copy), v5 (copy), v75 (ref)
    local v130 = l_useRegistryEntry_0(l_FocusNavigableSurfaceIdentifierEnum_0.NavBar);
    local v131 = l_useFirstFocusableDescendantRef_0(v130);
    local v132 = l_useDescendantHasFocus_0(v130);
    local v133 = table.clone(v129);
    v133.NextSelectionUp = if v130 then v131 else nil;
    v133.shouldCaptureFocus = not v132;
    local v134 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v6.useRef(if v129.focusController then v129.focusController else v7.createFocusController()).current;
    local v135 = v51(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v134);
    local v136 = v50({
        overlayClosedCallback = v135
    });
    v133.focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v134;
    v133.focusNavigationBindingsRef = v136;
    local v137 = false;
    if l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot then
        v137 = not l_FFlagEnableLeftNavOnConsole_0;
    end;
    v133.is10ftUI = v137;
    if l_FFlagAXCatalogCategoriesStore_0 then
        v137 = v65.getCatalogSelectionStore();
        local v138 = l_useSignalState_0(v137.selectedCategoryId);
        local v139 = l_useSignalState_0(v137.selectedSubcategoryId);
        v133.catalogCategoryId = v138;
        v133.catalogSubcategoryId = v139;
    end;
    return v5.createElement(v75, v133);
end;