local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_useFocusGuiObject_0 = v8.useFocusGuiObject;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v11 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v12 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Components.PeekabooWidget);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v16 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v16.Focusable;
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v21 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v22 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v21.FocusNavigationEventNameEnum;
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.SliderWithLabelAndIcons);
local v27 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Components.ProfilePictureEditorBottomBar);
local v28 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetCameraSliderZoom);
local v29 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetCameraSliderRotate);
local v30 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetFinalPageViewMode);
local v31 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Constants);
local v32 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v34 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Services.Analytics);
local v35 = require(l_Modules_0.AvatarExperience.Common.Components.BottomInsetBackground);
local v36 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXF10ftFixPeekabooWidget);
local v37 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXFocusBehaviorRoot and game:DefineFastFlag("AXMigrateProfilePictureEditorCameraPageToFocusNavigation", false);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v39 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v39.Style.withStyle;
local l_ButtonStack_0 = v39.App.Button.ButtonStack;
local l_ButtonType_0 = v39.App.Button.Enum.ButtonType;
local l_Images_0 = v39.App.ImageSet.Images;
local l_ImageSetLabel_0 = v39.Core.ImageSet.ImageSetLabel;
local v45 = v5.PureComponent:extend("ProfilePictureEditorCameraPage");
local v46 = l_Images_0["icons/actions/zoomIn"];
local v47 = l_Images_0["icons/actions/zoomOut"];
local v48 = l_Images_0["icons/actions/cycleLeft"];
local v49 = l_Images_0["icons/actions/cycleRight"];
local v50 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
local function v56(v51, v52) --[[ Line: 98 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v8 (copy), v50 (copy), v4 (copy), l_FocusNavigationEventNameEnum_0 (copy), v22 (copy)
    local v53 = v8.useEventMap(v50, v51);
    local v55 = v4.useMemo(function() --[[ Line: 100 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v22 (ref), v52 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v22.onRelease(function(v54) --[[ Line: 103 ]]
                    -- upvalues: v52 (ref)
                    v54.cancelled = true;
                    v52();
                end)
            }
        };
    end, {
        v52
    });
    return v8.useEventHandlerMap(v55, v53);
end;
v45.validateProps = v7.strictInterface({
    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v7.optional(v7.table), 
    avatarRoute = v7.table, 
    resolvedFocusNavigationRef = if v37 then v7.table else nil, 
    topBarRef = if v37 then v7.table else nil, 
    navigation = v7.table, 
    profilePictureEditorAnalytics = v7.table, 
    zoomSliderValue = v7.number, 
    rotateSliderValue = v7.number, 
    globalGuiInset = v7.strictInterface({
        left = v7.integer, 
        top = v7.integer, 
        right = v7.integer, 
        bottom = v7.integer
    }), 
    screenSize = if v36 then nil else v7.Vector2, 
    isPortrait = v7.boolean, 
    setCameraSliderZoom = v7.callback, 
    setCameraSliderRotate = v7.callback, 
    setFinalPageViewMode = v7.callback
});
v45.init = function(v57) --[[ Line: 141 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v16 (copy), v37 (copy), v5 (copy), l_AvatarScreen_0 (copy), v31 (copy)
    v57.focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v57.props.focusController or v16.createFocusController();
    if not v37 then
        v57.topBarRef = v5.createRef();
    end;
    v57.bottomBarRef = v5.createRef();
    v57.defaultPositionRef = v5.createRef();
    v57.zoomSliderRef = v5.createRef();
    v57.rotateSliderRef = v5.createRef();
    v57.goBack = function() --[[ Line: 154 ]]
        -- upvalues: v57 (copy)
        v57.props.navigation.goBack();
    end;
    v57.onNext = function() --[[ Line: 158 ]]
        -- upvalues: v57 (copy), l_AvatarScreen_0 (ref)
        v57.props.profilePictureEditorAnalytics.clickNextFromCameraPage(v57.props.zoomSliderValue ~= 0, v57.props.rotateSliderValue ~= 0);
        v57.props.setFinalPageViewMode();
        v57.props.navigation.navigate(l_AvatarScreen_0.ProfilePictureEditorFinal, {});
    end;
    v57.onDefaultPosition = function() --[[ Line: 171 ]]
        -- upvalues: v57 (copy)
        v57.props.profilePictureEditorAnalytics.clickDefaultPositionsFromCameraPage();
        v57.props.setCameraSliderZoom(0);
        v57.props.setCameraSliderRotate(0);
    end;
    v57.onZoomChanged = function(v58) --[[ Line: 177 ]]
        -- upvalues: v57 (copy)
        v57.props.setCameraSliderZoom(v58);
    end;
    v57.onRotateChanged = function(v59) --[[ Line: 181 ]]
        -- upvalues: v57 (copy)
        v57.props.setCameraSliderRotate(v59);
    end;
    v57.zoomToPoint = function(v60, _) --[[ Line: 185 ]]
        -- upvalues: v57 (copy), v31 (ref)
        local v62 = math.clamp(v57.props.zoomSliderValue + v60 * 2, -v31.SliderMax, v31.SliderMax);
        v57.props.setCameraSliderZoom(v62);
    end;
    v57.rotateByPixels = function(v63) --[[ Line: 191 ]]
        -- upvalues: v57 (copy), v31 (ref)
        local v64 = math.clamp(v57.props.rotateSliderValue + v63 * 1, -v31.SliderMax, v31.SliderMax);
        v57.props.setCameraSliderRotate(v64);
    end;
end;
v45.renderMiddleContents = function(_, v66) --[[ Line: 198 ]] --[[ Name: renderMiddleContents ]]
    -- upvalues: v5 (copy), l_ImageSetLabel_0 (copy), v31 (copy)
    local l_Theme_0 = v66.Theme;
    return v5.createElement(l_ImageSetLabel_0, {
        Size = UDim2.fromScale(1, 1), 
        Position = UDim2.fromOffset(0, 0), 
        Image = v31.CircleCutoutAsset, 
        ImageColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = 1, 
        ZIndex = 4
    });
end;
v45.renderBottomContents = function(v68, v69, v70) --[[ Line: 210 ]] --[[ Name: renderBottomContents ]]
    -- upvalues: l_TextService_0 (copy), v5 (copy), l_Focusable_0 (copy), v37 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy), v26 (copy), v47 (copy), v46 (copy), v31 (copy), v48 (copy), v49 (copy)
    local l_Font_0 = v70.Font;
    local l_BaseSize_0 = l_Font_0.BaseSize;
    local v73 = l_Font_0.Header2.RelativeSize * l_BaseSize_0;
    local l_Font_1 = l_Font_0.Header2.Font;
    local l_zoomSliderValue_0 = v68.props.zoomSliderValue;
    local l_rotateSliderValue_0 = v68.props.rotateSliderValue;
    local v77 = false;
    if l_zoomSliderValue_0 == 0 then
        v77 = l_rotateSliderValue_0 == 0;
    end;
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v69.defaultPosition, v73, l_Font_1, Vector2.new(10000, 10000));
    return v5.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        NextSelectionUp = if v37 then v68.props.topBarRef else v68.topBarRef, 
        NextSelectionDown = v68.bottomBarRef
    }, {
        ListLayout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        ButtonTopPadding = v5.createElement("Frame", {
            Size = UDim2.fromScale(1, 0.05), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            uiSizeConstraint = v5.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(1e999, 50)
            })
        }), 
        ButtonFrame = v5.createElement(l_Focusable_0.Frame, {
            Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X + 20, 0, 36), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            [v5.Ref] = v68.defaultPositionRef, 
            NextSelectionUp = if v37 then v68.props.topBarRef else v68.topBarRef, 
            NextSelectionDown = v68.zoomSliderRef
        }, {
            ButtonStack = v5.createElement(l_ButtonStack_0, {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v68.onDefaultPosition, 
                            text = v69.defaultPosition, 
                            isDisabled = v77
                        }
                    }
                }
            })
        }), 
        AboveSliderPadding = v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 10), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }), 
        ZoomSlider = v5.createElement(v26, {
            text = v69.zoom, 
            onSliderChanged = v68.onZoomChanged, 
            layoutOrder = 4, 
            value = l_zoomSliderValue_0, 
            leftIcon = v47, 
            rightIcon = v46, 
            min = -v31.SliderMax, 
            max = v31.SliderMax, 
            baseRef = v68.zoomSliderRef, 
            NextSelectionUp = v68.defaultPositionRef, 
            NextSelectionDown = v68.rotateSliderRef
        }), 
        BetweenSliderPadding = v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 10), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 5
        }), 
        RotateSlider = v5.createElement(v26, {
            text = v69.rotate, 
            onSliderChanged = v68.onRotateChanged, 
            layoutOrder = 6, 
            value = l_rotateSliderValue_0, 
            leftIcon = v48, 
            rightIcon = v49, 
            min = -v31.SliderMax, 
            max = v31.SliderMax, 
            baseRef = v68.rotateSliderRef, 
            NextSelectionUp = v68.zoomSliderRef, 
            NextSelectionDown = v68.bottomBarRef
        })
    });
end;
v45.renderWithProviders = function(v79, v80, v81) --[[ Line: 312 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v5 (copy), l_Focusable_0 (copy), v36 (copy), l_getSafeAreaSize_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v37 (copy), v16 (copy), v19 (copy), v11 (copy), v12 (copy), v27 (copy), v35 (copy)
    local l_screenSize_0 = v79.props.screenSize;
    local l_globalGuiInset_0 = v79.props.globalGuiInset;
    local l_isPortrait_0 = v79.props.isPortrait;
    local v85 = l_globalGuiInset_0.bottom > 0;
    return v5.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = if v36 then UDim2.fromScale(1, 1) else l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0), 
        Position = UDim2.new(0, 0, 0, 0), 
        Active = true, 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v79.focusController, 
        defaultChild = v79.zoomSliderRef, 
        [v5.Ref] = if v37 then v79.props.resolvedFocusNavigationRef else v79.props[v5.Ref], 
        inputBindings = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or v37 then nil else {
            NavUp = v16.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 336 ]]
                -- upvalues: v79 (copy)
                v79.focusController.moveFocusTo(v79.topBarRef);
            end)
        }
    }, {
        GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.createElement(v19, {
            focusController = v79.focusController, 
            captureFocusOnMount = true
        }), 
        SimpleTopBar = v5.createElement(v11.Container, {
            titleText = v80.title, 
            [v5.Ref] = if v37 then v79.props.topBarRef else v79.topBarRef, 
            NextSelectionDown = v79.defaultPositionRef, 
            transparentBackground = true, 
            hideSiteMessageBanner = l_isPortrait_0, 
            leftItem = v11.BackButton
        }), 
        PeekabooWidget = v5.createElement(v12, {
            viewportYScale = 0.375, 
            viewportXScale = 0.6666666666666666, 
            topMarginYScale = 0.125, 
            renderBottomContents = function() --[[ Line: 361 ]] --[[ Name: renderBottomContents ]]
                -- upvalues: v79 (copy), v80 (copy), v81 (copy)
                return v79:renderBottomContents(v80, v81);
            end, 
            renderMiddleContents = function() --[[ Line: 364 ]] --[[ Name: renderMiddleContents ]]
                -- upvalues: v79 (copy), v81 (copy)
                return v79:renderMiddleContents(v81);
            end, 
            zoomToPoint = v79.zoomToPoint, 
            rotateByPixels = v79.rotateByPixels
        }), 
        BottomBar = v5.createElement(v27, {
            baseRef = v79.bottomBarRef, 
            NextSelectionUp = v79.rotateSliderRef, 
            button1 = {
                textKey = "Authentication.CrossDevice.Action.GoBack", 
                onActivated = v79.goBack
            }, 
            button2 = {
                textKey = "Authentication.CrossDevice.Action.Next", 
                onActivated = v79.onNext
            }
        }), 
        BottomInsetBackground = if v85 then v5.createElement(v35, {
            globalGuiInset = l_globalGuiInset_0
        }) else nil
    });
end;
v45.render = function(v86) --[[ Line: 393 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_withStyle_0 (copy)
    return l_withLocalization_0({
        title = "Feature.Avatar.Label.PPEPositionCameraHeader", 
        defaultPosition = "Feature.Avatar.Action.Reset", 
        zoom = "Feature.Avatar.Action.Zoom", 
        rotate = "Feature.Avatar.Action.Rotate"
    })(function(v87) --[[ Line: 399 ]]
        -- upvalues: l_withStyle_0 (ref), v86 (copy)
        return l_withStyle_0(function(v88) --[[ Line: 400 ]]
            -- upvalues: v86 (ref), v87 (copy)
            return v86:renderWithProviders(v87, v88);
        end);
    end);
end;
v45 = v18((v25((v6.connect(function(v89, _) --[[ Line: 406 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v36 (copy)
    return {
        isPortrait = v89.DeviceOrientation == l_DeviceOrientationMode_0.Portrait, 
        globalGuiInset = v89.GlobalGuiInset, 
        screenSize = if v36 then nil else v89.ScreenSize, 
        zoomSliderValue = v89.AvatarExperience.ProfilePictureEditor.CameraSliders.zoomSliderValue, 
        rotateSliderValue = v89.AvatarExperience.ProfilePictureEditor.CameraSliders.rotateSliderValue
    };
end, function(v91) --[[ Line: 418 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v28 (copy), v29 (copy), v30 (copy), v32 (copy)
    return {
        setCameraSliderZoom = function(v92) --[[ Line: 420 ]] --[[ Name: setCameraSliderZoom ]]
            -- upvalues: v91 (copy), v28 (ref)
            return v91(v28(v92));
        end, 
        setCameraSliderRotate = function(v93) --[[ Line: 423 ]] --[[ Name: setCameraSliderRotate ]]
            -- upvalues: v91 (copy), v29 (ref)
            return v91(v29(v93));
        end, 
        setFinalPageViewMode = function() --[[ Line: 426 ]] --[[ Name: setFinalPageViewMode ]]
            -- upvalues: v91 (copy), v30 (ref), v32 (ref)
            return v91(v30(v32.Closeup));
        end
    };
end)(v45)))));
v45 = l_RoactServices_0.connect({
    profilePictureEditorAnalytics = v34
})(v45);
if v37 then
    return function(v94) --[[ Line: 442 ]]
        -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v4 (copy), v16 (copy), l_useFocusGuiObject_0 (copy), v56 (copy), l_useTableWrappedCallbackRef_0 (copy), v45 (ref), v3 (copy)
        local v95 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.useRef(v16.createFocusController()).current;
        local v96 = v4.useRef(nil);
        local v97 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useFocusGuiObject_0() else nil;
        local v98 = v4.useCallback(function() --[[ Line: 450 ]]
            -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v97 (copy), v96 (copy), v95 (copy)
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                if v97 and v96 and v96.current then
                    v97(v96.current);
                    return;
                end;
            else
                v95.moveFocusTo(v96);
            end;
        end, {
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v97 else v95
        });
        local v99 = v56(nil, v98);
        local v100 = l_useTableWrappedCallbackRef_0(v99);
        return v4.createElement(v45, v3.Dictionary.join(v94, {
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v95, 
            topBarRef = v96, 
            resolvedFocusNavigationRef = v100
        }));
    end;
else
    return v45;
end;