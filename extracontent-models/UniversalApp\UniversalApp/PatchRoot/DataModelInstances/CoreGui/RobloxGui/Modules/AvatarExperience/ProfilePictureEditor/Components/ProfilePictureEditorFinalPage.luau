local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.Otter);
local l_CameraUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).CameraUtility;
local v9 = require(l_CorePackages_0.Packages.Cryo);
local v10 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_useFocusGuiObject_0 = v10.useFocusGuiObject;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v13 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v14 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v17 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v17.Focusable;
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v21 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Components.PeekabooWidget);
local v22 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v23 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v22.FocusNavigationEventNameEnum;
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v28 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Components.ProfilePictureEditorBottomBar);
local v29 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Constants);
local v30 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local v31 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Utils);
local v32 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Thunks.WritePPEConfig);
local v33 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetFinalPageViewMode);
local v34 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Services.Analytics);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v36 = require(l_Modules_0.AvatarExperience.Common.Components.BottomInsetBackground);
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v39 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXF10ftFixPeekabooWidget);
local v40 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXFocusBehaviorRoot and game:DefineFastFlag("AXMigrateProfilePictureEditorFinalPageToFocusNavigation", false);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXOpaqueMarketplaceTopbar_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXOpaqueMarketplaceTopbar;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local v44 = require(l_CorePackages_0.Packages.UIBlox);
local l_ImageSetLabel_0 = v44.Core.ImageSet.ImageSetLabel;
local l_ButtonStack_0 = v44.App.Button.ButtonStack;
local l_ButtonType_0 = v44.App.Button.Enum.ButtonType;
local l_withStyle_0 = v44.Style.withStyle;
local v49 = {
    frequency = 1 / v29.FullscreenTweenTimeSeconds, 
    dampingRatio = 1
};
local v50 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
local function v56(v51, v52) --[[ Line: 97 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v10 (copy), v50 (copy), v5 (copy), l_FocusNavigationEventNameEnum_0 (copy), v23 (copy)
    local v53 = v10.useEventMap(v50, v51);
    local v55 = v5.useMemo(function() --[[ Line: 99 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v23 (ref), v52 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v23.onRelease(function(v54) --[[ Line: 102 ]]
                    -- upvalues: v52 (ref)
                    v54.cancelled = true;
                    v52();
                end)
            }
        };
    end, {
        v52
    });
    return v10.useEventHandlerMap(v55, v53);
end;
local v57 = v3.PureComponent:extend("ProfilePictureEditorFinalPage");
v57.validateProps = v6.strictInterface({
    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v6.optional(v6.table), 
    avatarRoute = v6.table, 
    resolvedFocusNavigationRef = if v40 then v6.table else nil, 
    topBarRef = if v40 then v6.table else nil, 
    globalGuiInset = v6.strictInterface({
        left = v6.integer, 
        top = v6.integer, 
        right = v6.integer, 
        bottom = v6.integer
    }), 
    screenSize = v6.Vector2, 
    fieldOfViewDeg = v6.optional(v6.number), 
    zoomSliderValue = v6.number, 
    rotateSliderValue = v6.number, 
    emoteAssetId = v6.optional(v6.string), 
    finalPageViewMode = v6.userdata, 
    currentCharacter = v6.optional(v6.instanceIsA("Model", nil)), 
    equippedAssets = v6.optional(v6.table), 
    isPortrait = v6.boolean, 
    writePPEConfig = v6.callback, 
    setFinalPageViewMode = v6.callback, 
    navigation = v6.table, 
    networking = v6.callback, 
    profilePictureEditorAnalytics = v6.table, 
    is10ftUI = v6.boolean
});
v57.init = function(v58) --[[ Line: 150 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v17 (copy), v40 (copy), v3 (copy), l_AvatarScreen_0 (copy), v30 (copy), v7 (copy)
    v58.focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v58.props.focusController or v17.createFocusController();
    if not v40 then
        v58.topBarRef = v3.createRef();
    end;
    v58.bottomBarRef = v3.createRef();
    v58.toggleFullViewButtonRef = v3.createRef();
    v58.goBack = function() --[[ Line: 160 ]]
        -- upvalues: v58 (copy)
        v58.props.navigation.goBack();
    end;
    v58.onSave = function() --[[ Line: 164 ]]
        -- upvalues: v58 (copy), l_AvatarScreen_0 (ref)
        v58:writePPEConfig();
        local v59 = if v58.props.is10ftUI then l_AvatarScreen_0.AvatarExperienceLandingPage else l_AvatarScreen_0.Catalog;
        v58.props.navigation.navigate(v59);
    end;
    v58.toggleFinalPageViewMode = function() --[[ Line: 173 ]]
        -- upvalues: v58 (copy), v30 (ref)
        local v60 = if v58.props.finalPageViewMode == v30.Closeup then v30.FullBody else v30.Closeup;
        v58.props.setFinalPageViewMode(v60);
    end;
    v58:setState({
        isAnimating = false
    });
    local v61, v62 = v3.createBinding(0);
    v58.animationBinding = v61;
    v58.animationBindingUpdate = v62;
    v58.sizeBinding = v58.animationBinding:map(function(v63) --[[ Line: 188 ]]
        return UDim2.fromScale(1 + v63, 1 + v63);
    end);
    v58.motor = v7.createSingleMotor(0);
    v58.motor:onStep(v58.animationBindingUpdate);
    v58.motor:onComplete(function() --[[ Line: 194 ]]
        -- upvalues: v58 (copy)
        v58:setState({
            isAnimating = false
        });
    end);
end;
v57.writePPEConfig = function(v64) --[[ Line: 201 ]] --[[ Name: writePPEConfig ]]
    -- upvalues: v31 (copy)
    local l_fieldOfViewDeg_0 = v64.props.fieldOfViewDeg;
    local l_zoomSliderValue_0 = v64.props.zoomSliderValue;
    local l_rotateSliderValue_0 = v64.props.rotateSliderValue;
    local l_emoteAssetId_0 = v64.props.emoteAssetId;
    local v69 = v31.getYRotDegFromSliderValue(l_rotateSliderValue_0);
    local v70 = v31.getCameraDistanceScaleFromSliderValue(l_zoomSliderValue_0);
    v64.props.writePPEConfig(v64.props.networking, v64.props.profilePictureEditorAnalytics, l_emoteAssetId_0, v70, v69, l_fieldOfViewDeg_0);
end;
v57.renderBottomContents = function(v71, v72, v73) --[[ Line: 221 ]] --[[ Name: renderBottomContents ]]
    -- upvalues: l_getSafeAreaSize_0 (copy), l_TextService_0 (copy), v30 (copy), v3 (copy), l_Focusable_0 (copy), v40 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy)
    local l_Theme_0 = v73.Theme;
    local l_Font_0 = v73.Font;
    local l_BaseSize_0 = l_Font_0.BaseSize;
    local v77 = l_Font_0.Header1.RelativeSize * l_BaseSize_0;
    local l_Font_1 = l_Font_0.Header1.Font;
    local l_screenSize_0 = v71.props.screenSize;
    local l_globalGuiInset_0 = v71.props.globalGuiInset;
    local v81 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0);
    local v82 = l_Font_0.Header2.RelativeSize * l_BaseSize_0;
    local l_Font_2 = l_Font_0.Header2.Font;
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v72.finalContent, v82, l_Font_2, Vector2.new(v81.X.Offset * 0.9, 10000));
    local v85 = nil;
    v85 = if v71.props.finalPageViewMode == v30.Closeup then v72.switchToFullBody else v72.switchToCloseup;
    local v86 = v81.X.Offset - 20 - 20;
    local l_l_TextService_0_TextSize_1 = l_TextService_0:GetTextSize(v85, v82, l_Font_2, Vector2.new(v86, 10000));
    return v3.createFragment({
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0.0625, 0)
        }), 
        ContentTopPadding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0.0625, 0)
        }), 
        ButtonFrame = v3.createElement(l_Focusable_0.Frame, {
            Size = UDim2.new(0, l_l_TextService_0_TextSize_1.X + 20, 0, l_l_TextService_0_TextSize_1.Y + 17), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            [v3.Ref] = v71.toggleFullViewButtonRef, 
            NextSelectionUp = if v40 then v71.props.topBarRef else v71.topBarRef, 
            NextSelectionDown = v71.bottomBarRef
        }, {
            ButtonStack = v3.createElement(l_ButtonStack_0, {
                buttonHeight = l_l_TextService_0_TextSize_1.Y + 17, 
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v71.toggleFinalPageViewMode, 
                            text = v85
                        }
                    }
                }
            })
        }), 
        Header1TextLabel = v3.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, v77), 
            BackgroundTransparency = 1, 
            Font = l_Font_1, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            Text = v72.finalHeader, 
            TextSize = v77, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            LayoutOrder = 2
        }), 
        Header2TextLabel = v3.createElement("TextLabel", {
            Size = UDim2.new(0.9, 0, 0, l_l_TextService_0_TextSize_0.Y), 
            BackgroundTransparency = 1, 
            Font = l_Font_2, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            Text = v72.finalContent, 
            TextSize = v82, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            RichText = true, 
            TextWrapped = true, 
            LayoutOrder = 3
        })
    });
end;
v57.renderMiddleContents = function(v88, v89) --[[ Line: 320 ]] --[[ Name: renderMiddleContents ]]
    -- upvalues: v30 (copy), v3 (copy), l_ImageSetLabel_0 (copy), v29 (copy)
    local l_Theme_1 = v89.Theme;
    if v88.props.finalPageViewMode == v30.Closeup or v88.state.isAnimating then
        return v3.createElement(l_ImageSetLabel_0, {
            Size = v88.sizeBinding, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Image = v29.CircleCutoutAsset, 
            ImageColor3 = l_Theme_1.BackgroundDefault.Color, 
            BackgroundTransparency = 1, 
            ZIndex = 4
        });
    else
        return nil;
    end;
end;
v57.renderWithProviders = function(v91, v92, v93) --[[ Line: 337 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_getSafeAreaSize_0 (copy), v3 (copy), l_Focusable_0 (copy), v39 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v40 (copy), v17 (copy), v20 (copy), v14 (copy), l_FFlagAXOpaqueMarketplaceTopbar_0 (copy), v21 (copy), v28 (copy), v36 (copy)
    local l_screenSize_1 = v91.props.screenSize;
    local l_globalGuiInset_1 = v91.props.globalGuiInset;
    local v96 = l_getSafeAreaSize_0(l_screenSize_1, l_globalGuiInset_1);
    local l_isPortrait_0 = v91.props.isPortrait;
    local v98 = l_globalGuiInset_1.bottom > 0;
    return v3.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = if v39 then UDim2.fromScale(1, 1) else v96, 
        Position = UDim2.new(0, 0, 0, 0), 
        Active = true, 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v91.focusController, 
        defaultChild = v91.bottomBarRef, 
        [v3.Ref] = if v40 then v91.props.resolvedFocusNavigationRef else v91.props[v3.Ref], 
        inputBindings = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or v40 then nil else {
            NavUp = v17.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 360 ]]
                -- upvalues: v91 (copy)
                v91.focusController.moveFocusTo(v91.topBarRef);
            end)
        }
    }, {
        GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v3.createElement(v20, {
            focusController = v91.focusController, 
            captureFocusOnMount = true
        }), 
        SimpleTopBar = v3.createElement(v14.Container, {
            titleText = v92.title, 
            [v3.Ref] = if v40 then v91.props.topBarRef else v91.topBarRef, 
            NextSelectionDown = v91.toggleFullViewButtonRef, 
            transparentBackground = not l_FFlagAXOpaqueMarketplaceTopbar_0 or l_isPortrait_0 and true or false, 
            hideSiteMessageBanner = l_isPortrait_0, 
            leftItem = v14.BackButton
        }), 
        PeekabooWidget = v3.createElement(v21, {
            viewportYScale = 0.375, 
            viewportXScale = 0.8, 
            topMarginYScale = 0.2, 
            renderBottomContents = function() --[[ Line: 385 ]] --[[ Name: renderBottomContents ]]
                -- upvalues: v91 (copy), v92 (copy), v93 (copy)
                return v91:renderBottomContents(v92, v93);
            end, 
            renderMiddleContents = function() --[[ Line: 388 ]] --[[ Name: renderMiddleContents ]]
                -- upvalues: v91 (copy), v93 (copy)
                return v91:renderMiddleContents(v93);
            end
        }), 
        BottomBar = v3.createElement(v28, {
            baseRef = v91.bottomBarRef, 
            NextSelectionUp = v91.toggleFullViewButtonRef, 
            button1 = {
                textKey = "Authentication.CrossDevice.Action.GoBack", 
                onActivated = v91.goBack
            }, 
            button2 = {
                textKey = "Feature.Avatar.Action.Save", 
                isDisabled = v91.props.fieldOfViewDeg == nil, 
                onActivated = v91.onSave
            }
        }), 
        BottomInsetBackground = if v98 then v3.createElement(v36, {
            globalGuiInset = l_globalGuiInset_1
        }) else nil
    });
end;
v57.render = function(v99) --[[ Line: 415 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_withStyle_0 (copy)
    return l_withLocalization_0({
        title = "Feature.Avatar.Label.PPEFinalHeader", 
        finalHeader = "Feature.Avatar.Label.PPEFinalSubheader", 
        finalContent = "Feature.Avatar.Label.PPEFinalBody", 
        switchToFullBody = "Feature.Avatar.Label.PPEViewFullButton", 
        switchToCloseup = "Feature.Avatar.Label.PPEViewCloseupButton"
    })(function(v100) --[[ Line: 422 ]]
        -- upvalues: l_withStyle_0 (ref), v99 (copy)
        return l_withStyle_0(function(v101) --[[ Line: 423 ]]
            -- upvalues: v99 (ref), v100 (copy)
            return v99:renderWithProviders(v100, v101);
        end);
    end);
end;
v57.didUpdate = function(v102, v103, _) --[[ Line: 429 ]] --[[ Name: didUpdate ]]
    -- upvalues: v30 (copy), v7 (copy), v49 (copy)
    local v105 = nil;
    if v103.finalPageViewMode == v30.Closeup and v102.props.finalPageViewMode == v30.FullBody then
        v105 = 1;
    elseif v103.finalPageViewMode == v30.FullBody and v102.props.finalPageViewMode == v30.Closeup then
        v105 = 0;
    end;
    if v105 then
        v102.motor:stop();
        v102.motor:setGoal(v7.spring(v105, v49));
        v102.motor:start();
        v102:setState({
            isAnimating = true
        });
    end;
end;
v57.willUnmount = function(v106) --[[ Line: 452 ]] --[[ Name: willUnmount ]]
    if v106.motor then
        v106.motor:destroy();
        v106.motor = nil;
    end;
end;
v57 = v4.connect(function(v107, _) --[[ Line: 459 ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy)
    return {
        isPortrait = v107.DeviceOrientation == l_DeviceOrientationMode_0.Portrait, 
        globalGuiInset = v107.GlobalGuiInset, 
        screenSize = v107.ScreenSize, 
        fieldOfViewDeg = v107.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.fieldOfViewDeg, 
        zoomSliderValue = v107.AvatarExperience.ProfilePictureEditor.CameraSliders.zoomSliderValue, 
        rotateSliderValue = v107.AvatarExperience.ProfilePictureEditor.CameraSliders.rotateSliderValue, 
        emoteAssetId = v107.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.emoteAssetId, 
        finalPageViewMode = v107.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode, 
        currentCharacter = v107.AvatarExperience.AvatarScene.Character.CurrentCharacter, 
        equippedAssets = v107.AvatarExperience.AvatarEditor.Character.EquippedAssets
    };
end, function(v109) --[[ Line: 474 ]]
    -- upvalues: v32 (copy), v30 (copy), l_CameraUtility_0 (copy), v33 (copy)
    return {
        writePPEConfig = function(_, v111, v112, v113, v114, v115) --[[ Line: 476 ]] --[[ Name: writePPEConfig ]]
            -- upvalues: v109 (copy), v32 (ref), v30 (ref), l_CameraUtility_0 (ref)
            v109(v32(v111, v30.Closeup, v112, v113, v114, v115));
            v109(v32(v111, v30.FullBody, v112, l_CameraUtility_0.DistanceScaleForFullBody, v114, v115));
        end, 
        setFinalPageViewMode = function(v116) --[[ Line: 508 ]] --[[ Name: setFinalPageViewMode ]]
            -- upvalues: v109 (copy), v33 (ref)
            return v109(v33(v116));
        end
    };
end)(v57);
v57 = v19((v26((l_RoactServices_0.connect({
    profilePictureEditorAnalytics = v34, 
    networking = v13
})(v57)))));
return function(v117) --[[ Line: 522 ]] --[[ Name: ProfilePictureEditorFinalPageContainer ]]
    -- upvalues: v40 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusGuiObject_0 (copy), v5 (copy), v17 (copy), v56 (copy), l_useTableWrappedCallbackRef_0 (copy), v9 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v57 (ref)
    local v118 = nil;
    if v40 then
        local v119 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useFocusGuiObject_0() else nil;
        local v120 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.useRef(v17.createFocusController()).current;
        local v121 = v5.useRef(nil);
        local v122 = v5.useCallback(function() --[[ Line: 531 ]]
            -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v119 (copy), v121 (copy), v120 (copy)
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                if v119 and v121 and v121.current then
                    v119(v121.current);
                    return;
                end;
            else
                v120.moveFocusTo(v121);
            end;
        end, {
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v119 else v120
        });
        local v123 = v56(nil, v122);
        local v124 = l_useTableWrappedCallbackRef_0(v123);
        local l_join_0 = v9.Dictionary.join;
        local l_v117_0 = v117;
        local v127 = {};
        local v128 = false;
        if l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot then
            v128 = not l_FFlagEnableLeftNavOnConsole_0;
        end;
        v127.is10ftUI = v128;
        v127.focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v120;
        v127.topBarRef = v121;
        v127.resolvedFocusNavigationRef = v124;
        v118 = l_join_0(l_v117_0, v127);
    else
        local l_join_1 = v9.Dictionary.join;
        local l_v117_1 = v117;
        local v131 = {};
        local v132 = false;
        if l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot then
            v132 = not l_FFlagEnableLeftNavOnConsole_0;
        end;
        v131.is10ftUI = v132;
        v118 = l_join_1(l_v117_1, v131);
    end;
    return v5.createElement(v57, v118);
end;