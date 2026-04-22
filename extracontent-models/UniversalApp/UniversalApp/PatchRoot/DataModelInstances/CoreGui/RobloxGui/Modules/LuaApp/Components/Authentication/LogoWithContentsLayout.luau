local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Common_0 = l_Modules_0.Common;
local v5 = require(l_Common_0.Roact);
local v6 = require(l_Common_0.RoactRodux);
local v7 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_useBreakpointYOrSmaller_0 = v7.useBreakpointYOrSmaller;
local l_useBreakpointXOrSmaller_0 = v7.useBreakpointXOrSmaller;
local v10 = require(l_Modules_0.LuaApp.Components.FullscreenPageWithSafeArea);
local l_BackgroundFill_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Components.BackgroundFill;
local v12 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v13 = require(l_Modules_0.LuaApp.FitChildren);
local v14 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v15 = require(l_Modules_0.LuaApp.AppPage);
local v16 = require(l_Modules_0.LuaApp.getIndexOfTopMostPage);
local l_useFocusedTextBox_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).useFocusedTextBox;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v19 = require(l_Modules_0.LuaApp.Enum.Alignment);
local v20 = require(l_CorePackages_0.Packages.Cryo);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v23 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics);
local l_EventStreamConstants_0 = v23.EventStreamConstants;
local l_authTimingUtil_0 = v23.authTimingUtil;
local l_authPageload_0 = v23.Events.authPageload;
local v27 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v27.Style.withStyle;
local l_SpringAnimatedItem_0 = v27.Utility.SpringAnimatedItem;
local v30 = require(l_CorePackages_0.Packages.Foundation);
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v32 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local l_FFlagLuaEnableLandingPageTTIMeasurements_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaEnableLandingPageTTIMeasurements;
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local v35 = game:DefineFastInt("LogoAndBodyYPositionOffsetPercentage", 85);
local v36 = v5.PureComponent:extend("LogoWithContentsLayout");
v36.defaultProps = {
    ContentAlign = v19.Top, 
    topButtonEnabled = true, 
    LuobuLogoEnabled = false, 
    VNAgeBadgeEnabled = false, 
    FooterElement = nil, 
    FooterHeight = 0
};
local v37 = nil;
local v38 = v35 / 100;
v37 = v32 and 16 or 0;
local v39 = game:DefineFastFlag("EnableHistoryBasedTopButtonHidingV2", false);
local function v47(v40) --[[ Line: 97 ]] --[[ Name: renderTopButton ]]
    -- upvalues: l_withStyle_0 (copy), v5 (copy), v12 (copy), v37 (ref)
    local v41 = v40.layoutOrder or 0;
    local l_showCloseIcon_0 = v40.showCloseIcon;
    local l_onActivated_0 = v40.onActivated;
    local l_ZIndex_0 = v40.ZIndex;
    local v45 = "LuaApp/icons/navigation/pushBack";
    if l_showCloseIcon_0 then
        v45 = "LuaApp/icons/navigation/close";
    end;
    return l_withStyle_0(function(v46) --[[ Line: 108 ]]
        -- upvalues: v5 (ref), v12 (ref), v41 (copy), v37 (ref), v45 (ref), l_ZIndex_0 (copy), l_onActivated_0 (copy)
        return v5.createElement(v12, {
            LayoutOrder = v41, 
            Size = UDim2.new(0, 27, 0, 27), 
            Position = UDim2.new(0, v37, 0, 0), 
            Image = v45, 
            ImageColor3 = v46.Theme.TextEmphasis.Color, 
            ImageTransparency = v46.Theme.TextEmphasis.Transparency, 
            BackgroundTransparency = 1, 
            ZIndex = l_ZIndex_0, 
            [v5.Event.Activated] = l_onActivated_0
        });
    end);
end;
v36.init = function(v48) --[[ Line: 123 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v48.state = {
        onScreenKeyboardHeight = 0, 
        childrenContainerPosition = Vector2.new(), 
        childrenContainerSize = Vector2.new()
    };
    v48.isMounted = false;
    v48.prevFocusedTextBox = nil;
    local v49, v50 = v5.createBinding(Vector2.new());
    v48.canvasPosition = v49;
    v48.updateCanvasPosition = v50;
    v48.onScrollingFrameSizeChanged = function(v51) --[[ Line: 134 ]]
        -- upvalues: v48 (copy)
        local l_onScreenKeyboardHeight_0 = v48.state.onScreenKeyboardHeight;
        local l_focusedTextBox_0 = v48.props.focusedTextBox;
        if l_focusedTextBox_0 then
            l_onScreenKeyboardHeight_0 = math.min(l_focusedTextBox_0.AbsolutePosition.Y + v51.CanvasPosition.Y - 20, l_onScreenKeyboardHeight_0);
        end;
        v48.updateCanvasPosition(Vector2.new(0, l_onScreenKeyboardHeight_0));
    end;
    v48.onTopButtonActivated = function() --[[ Line: 145 ]]
        -- upvalues: v48 (copy)
        local l_topButtonEnabled_0 = v48.props.topButtonEnabled;
        local l_navigateBack_0 = v48.props.navigateBack;
        local l_topButtonActivatedTracking_0 = v48.props.topButtonActivatedTracking;
        if l_topButtonActivatedTracking_0 then
            l_topButtonActivatedTracking_0();
        end;
        if l_topButtonEnabled_0 then
            l_navigateBack_0();
        end;
    end;
end;
v36.didMount = function(v57) --[[ Line: 160 ]] --[[ Name: didMount ]]
    -- upvalues: l_UserInputService_0 (copy)
    v57.isMounted = true;
    v57.keyboardVisibleChanged = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):connect(function() --[[ Line: 164 ]]
        -- upvalues: l_UserInputService_0 (ref), v57 (copy)
        local l_OnScreenKeyboardVisible_0 = l_UserInputService_0.OnScreenKeyboardVisible;
        local v59 = l_OnScreenKeyboardVisible_0 and l_UserInputService_0.OnScreenKeyboardSize.Y or 0;
        local v60 = false;
        local l_focusedTextBox_1 = v57.props.focusedTextBox;
        local l_prevFocusedTextBox_0 = v57.prevFocusedTextBox;
        local v63 = not l_OnScreenKeyboardVisible_0 and l_prevFocusedTextBox_0 ~= nil and l_focusedTextBox_1 ~= nil and l_prevFocusedTextBox_0 ~= l_focusedTextBox_1;
        if l_OnScreenKeyboardVisible_0 then
            v60 = true;
        elseif v63 then
            v57._prevFocusedTextBox = l_focusedTextBox_1;
            v60 = false;
        else
            v60 = true;
            v59 = 0;
        end;
        if v60 then
            v57:setState({
                onScreenKeyboardHeight = v59
            });
        end;
    end);
end;
v36.didUpdate = function(v64, v65, _) --[[ Line: 198 ]] --[[ Name: didUpdate ]]
    if v65.focusedTextBox ~= v64.props.focusedTextBox then
        v64.prevFocusedTextBox = v65.focusedTextBox;
    end;
end;
v36.willUnmount = function(v67) --[[ Line: 204 ]] --[[ Name: willUnmount ]]
    v67.isMounted = false;
    if v67.keyboardVisibleChanged then
        v67.keyboardVisibleChanged:disconnect();
        v67.keyboardVisibleChanged = nil;
    end;
end;
v36.render = function(v68) --[[ Line: 213 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v5 (copy), l_FFlagUseNavigationSelectors_0 (copy), v15 (copy), v16 (copy), v39 (copy), l_getSafeAreaSize_0 (copy), l_FormFactor_0 (copy), v38 (copy), v19 (copy), l_UserInputService_0 (copy), v13 (copy), l_FFlagLuaEnableLandingPageTTIMeasurements_0 (copy), l_authTimingUtil_0 (copy), l_EventStreamConstants_0 (copy), l_authPageload_0 (copy), l_HttpService_0 (copy), v10 (copy), l_BackgroundFill_0 (copy), l_SpringAnimatedItem_0 (copy), v30 (copy), v47 (copy)
    return l_withStyle_0(function(_) --[[ Line: 214 ]]
        -- upvalues: v68 (copy), v5 (ref), l_FFlagUseNavigationSelectors_0 (ref), v15 (ref), v16 (ref), v39 (ref), l_getSafeAreaSize_0 (ref), l_FormFactor_0 (ref), v38 (ref), v19 (ref), l_UserInputService_0 (ref), v13 (ref), l_FFlagLuaEnableLandingPageTTIMeasurements_0 (ref), l_authTimingUtil_0 (ref), l_EventStreamConstants_0 (ref), l_authPageload_0 (ref), l_HttpService_0 (ref), v10 (ref), l_BackgroundFill_0 (ref), l_SpringAnimatedItem_0 (ref), v30 (ref), v47 (ref)
        local v70 = v68.props[v5.Children];
        local l_ContentAlign_0 = v68.props.ContentAlign;
        local l_statusBarHeight_0 = v68.props.statusBarHeight;
        local l_screenSize_0 = v68.props.screenSize;
        local l_globalGuiInset_0 = v68.props.globalGuiInset;
        local v75 = if l_FFlagUseNavigationSelectors_0 then v68.props.history else v68.props.navigation.history;
        local v76 = v75[#v75];
        local l_name_0 = v76[#v76].name;
        local l_Landing_0 = v15.Landing;
        local v79 = #v75[#v75];
        local v80 = v79 - (v16(l_Landing_0, v75) or 0) <= 1;
        local v81 = nil;
        v81 = if v39 then v79 > 1 else l_name_0 ~= l_Landing_0;
        local l_LuobuLogoEnabled_0 = v68.props.LuobuLogoEnabled;
        local l_VNAgeBadgeEnabled_0 = v68.props.VNAgeBadgeEnabled;
        local v84 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0).Y.Offset - l_statusBarHeight_0;
        local v85 = nil;
        local v86 = nil;
        if l_LuobuLogoEnabled_0 or l_VNAgeBadgeEnabled_0 then
            if v68.props.formFactor == l_FormFactor_0.COMPACT then
                v85 = 0.3;
                v86 = 0.35;
            else
                v85 = 0.3;
                v86 = 0.4;
            end;
        elseif v68.props.formFactor == l_FormFactor_0.COMPACT then
            v85 = 0.15;
            v86 = 0.3;
        else
            v85 = 0.25;
            v86 = 0.45;
        end;
        local v87 = nil;
        local v88 = nil;
        if l_LuobuLogoEnabled_0 then
            v87 = "rbxasset://textures/ui/LuaApp/graphic/Auth/logo_white_luobu.png";
            v88 = 4.0546875;
        else
            v87 = "rbxasset://textures/ui/LuaApp/graphic/Auth/logo_white_1x.png";
            v88 = 5.409090909090909;
        end;
        local v89 = v84 * v85;
        local v90 = v84 * v86;
        if v68.props.isShortScreen and not v68.props.isCompactScreen then
            v89 = v89 * v38;
            v90 = v90 * v38;
        end;
        local v91 = v84 * 0.05;
        local v92 = UDim2.new(1, 0, v86, v68.state.childrenContainerSize.Y);
        local v93 = {
            [v19.Top] = {
                Position = UDim2.new(0.5, 0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0)
            }, 
            [v19.Bottom] = {
                Position = UDim2.new(0.5, 0, 1, 0), 
                AnchorPoint = Vector2.new(0.5, 1)
            }
        };
        local _ = UDim2.new(0, v68.state.childrenContainerPosition.X + v68.state.childrenContainerSize.X / 2, 0, v68.state.childrenContainerPosition.Y + v68.state.childrenContainerSize.Y / 2);
        local l_OnScreenKeyboardAnimationDuration_0 = l_UserInputService_0.OnScreenKeyboardAnimationDuration;
        local v96 = {
            dampingRatio = 1, 
            frequency = 1 / math.max(l_OnScreenKeyboardAnimationDuration_0, 0.1)
        };
        local l_isDualLayout_0 = v68.props.isDualLayout;
        local l_xOffset_0 = v68.props.tokens.LuaApps.LoginView.xOffset;
        local l_FooterElement_0 = v68.props.FooterElement;
        local l_FooterHeight_0 = v68.props.FooterHeight;
        local l_isCompactScreen_0 = v68.props.isCompactScreen;
        local v102 = l_isCompactScreen_0 and 15 or 40;
        local v103 = if l_FooterElement_0 and l_isCompactScreen_0 then l_FooterHeight_0 else 0;
        local v106 = {
            VNAgeBadge = l_VNAgeBadgeEnabled_0 and v5.createElement("ImageLabel", {
                Position = UDim2.new(0.05, 0, 0, v91), 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0, 0), 
                Size = UDim2.new(0.7, 0, 0.7, 0), 
                Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/vn_agebadge.png", 
                ZIndex = 1, 
                [v5.Children] = {
                    UISizeConstraint = v5.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(460, 87.78625954198473)
                    }), 
                    UIAspectRatioConstraint = v5.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 5.24, 
                        AspectType = Enum.AspectType.FitWithinMaxSize
                    })
                }
            }), 
            Logo = v5.createElement("ImageLabel", {
                Position = UDim2.new(0.5, 0, 0, v89), 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.new(0.7, 0, 0.7, 0), 
                Image = v87, 
                ZIndex = 1, 
                [v5.Children] = {
                    UISizeConstraint = v5.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(460, 460 / v88)
                    }), 
                    UIAspectRatioConstraint = v5.createElement("UIAspectRatioConstraint", {
                        AspectRatio = v88, 
                        AspectType = Enum.AspectType.FitWithinMaxSize
                    })
                }
            }), 
            AlignmentContainer = v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = if l_isDualLayout_0 then UDim2.new(0, l_xOffset_0, 0, v90) else UDim2.new(0.5, 0, 0, v90), 
                Size = if l_isDualLayout_0 then UDim2.new(1, -(2 * l_xOffset_0), 1, -v90 - v103) else UDim2.new(1, 0, 1, -v90 - v103), 
                AnchorPoint = if l_isDualLayout_0 then Vector2.new(0, 0) else Vector2.new(0.5, 0), 
                ZIndex = 2
            }, {
                Content = v5.createElement(v13.FitFrame, {
                    Position = v93[l_ContentAlign_0].Position, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = v13.FitAxis.Height, 
                    AnchorPoint = v93[l_ContentAlign_0].AnchorPoint, 
                    BackgroundTransparency = 1, 
                    [v5.Change.AbsoluteSize] = function(v104) --[[ Line: 378 ]]
                        -- upvalues: v68 (ref)
                        spawn(function() --[[ Line: 379 ]]
                            -- upvalues: v68 (ref), v104 (copy)
                            if not v68.isMounted then
                                return;
                            else
                                v68:setState({
                                    childrenContainerSize = v104.AbsoluteSize
                                });
                                return;
                            end;
                        end);
                    end, 
                    [v5.Change.AbsolutePosition] = function(v105) --[[ Line: 388 ]]
                        -- upvalues: v68 (ref)
                        spawn(function() --[[ Line: 389 ]]
                            -- upvalues: v68 (ref), v105 (copy)
                            if not v68.isMounted then
                                return;
                            else
                                v68:setState({
                                    childrenContainerPosition = v105.AbsolutePosition
                                });
                                return;
                            end;
                        end);
                    end, 
                    [v5.Children] = v70
                })
            })
        };
        if l_FFlagLuaEnableLandingPageTTIMeasurements_0 and l_name_0 == v15.Landing then
            local v107 = l_authTimingUtil_0.landingPageLoadFinish();
            if v107 then
                local v108 = {
                    variant = l_EventStreamConstants_0.Context.LandingScreen, 
                    timing = v107
                };
                l_authPageload_0(l_EventStreamConstants_0.Context.LandingPageRender, l_HttpService_0:JSONEncode(v108));
            end;
        end;
        return v5.createElement(v10, {
            includeStatusBar = true, 
            buttonRef = v68.props.buttonRef, 
            renderFullscreenBackground = function(_) --[[ Line: 416 ]] --[[ Name: renderFullscreenBackground ]]
                -- upvalues: v5 (ref), l_BackgroundFill_0 (ref)
                return v5.createElement(l_BackgroundFill_0, {
                    Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg", 
                    AspectRatio = 1
                });
            end
        }, {
            ReverseVignette = nil, 
            AuthScrollingFrame = v5.createElement(l_SpringAnimatedItem_0.AnimatedScrollingFrame, {
                regularProps = {
                    Selectable = false, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    [v5.Children] = v106, 
                    CanvasSize = v92, 
                    CanvasPosition = v68.canvasPosition, 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    ScrollBarThickness = 0, 
                    ZIndex = 2, 
                    [v5.Change.AbsoluteSize] = v68.onScrollingFrameSizeChanged
                }, 
                animatedValues = {
                    onScreenKeyboardHeight = v68.state.onScreenKeyboardHeight
                }, 
                mapValuesToProps = function(v110) --[[ Line: 454 ]] --[[ Name: mapValuesToProps ]]
                    return {
                        Size = UDim2.new(1, 0, 1, -v110.onScreenKeyboardHeight)
                    };
                end, 
                springOptions = v96
            }), 
            Footer = l_FooterElement_0 and v5.createElement(v30.View, {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Position = UDim2.new(0.5, 0, 1, -v102), 
                AnchorPoint = Vector2.new(0.5, 1), 
                ZIndex = 3, 
                tag = "col align-x-center"
            }, {
                Content = l_FooterElement_0
            }), 
            TopButton = v81 and v5.createElement(v47, {
                showCloseIcon = v80, 
                onActivated = v68.onTopButtonActivated, 
                ZIndex = 3
            }) or nil
        });
    end);
end;
local v114 = v6.connect(function(v111, _) --[[ Line: 480 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    return {
        formFactor = v111.FormFactor, 
        statusBarHeight = v111.TopBar.statusBarHeight, 
        globalGuiInset = v111.GlobalGuiInset, 
        screenSize = v111.ScreenSize, 
        navigation = if l_FFlagUseNavigationSelectors_0 then nil else v111.Navigation, 
        history = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectLegacyHistory(v111) else nil
    };
end, function(v113) --[[ Line: 489 ]]
    -- upvalues: v14 (copy)
    return {
        navigateBack = function() --[[ Line: 491 ]] --[[ Name: navigateBack ]]
            -- upvalues: v113 (copy), v14 (ref)
            return v113(v14());
        end
    };
end)(v36);
return function(v115) --[[ Line: 498 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useFocusedTextBox_0 (copy), v5 (copy), v114 (copy), v20 (copy), l_useBreakpointYOrSmaller_0 (copy), v7 (copy), l_useBreakpointXOrSmaller_0 (copy)
    local v116 = l_useDesignTokens_0();
    local v117 = l_useFocusedTextBox_0();
    return v5.createElement(v114, v20.Dictionary.join({
        tokens = v116, 
        isShortScreen = l_useBreakpointYOrSmaller_0(v7.Keys.Medium), 
        isCompactScreen = l_useBreakpointXOrSmaller_0(v7.Keys.Medium), 
        focusedTextBox = v117
    }, v115));
end;