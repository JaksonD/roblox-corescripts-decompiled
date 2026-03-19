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
local v31 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local l_FFlagLuaEnableLandingPageTTIMeasurements_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaEnableLandingPageTTIMeasurements;
local v33 = game:DefineFastInt("LogoAndBodyYPositionOffsetPercentage", 85);
local v34 = v5.PureComponent:extend("LogoWithContentsLayout");
v34.defaultProps = {
    ContentAlign = v19.Top, 
    topButtonEnabled = true, 
    LuobuLogoEnabled = false, 
    VNAgeBadgeEnabled = false, 
    FooterElement = nil, 
    FooterHeight = 0
};
local v35 = nil;
local v36 = v33 / 100;
v35 = v31 and 16 or 0;
local v37 = game:DefineFastFlag("EnableHistoryBasedTopButtonHidingV2", false);
local function v45(v38) --[[ Line: 95 ]] --[[ Name: renderTopButton ]]
    -- upvalues: l_withStyle_0 (copy), v5 (copy), v12 (copy), v35 (ref)
    local v39 = v38.layoutOrder or 0;
    local l_showCloseIcon_0 = v38.showCloseIcon;
    local l_onActivated_0 = v38.onActivated;
    local l_ZIndex_0 = v38.ZIndex;
    local v43 = "LuaApp/icons/navigation/pushBack";
    if l_showCloseIcon_0 then
        v43 = "LuaApp/icons/navigation/close";
    end;
    return l_withStyle_0(function(v44) --[[ Line: 106 ]]
        -- upvalues: v5 (ref), v12 (ref), v39 (copy), v35 (ref), v43 (ref), l_ZIndex_0 (copy), l_onActivated_0 (copy)
        return v5.createElement(v12, {
            LayoutOrder = v39, 
            Size = UDim2.new(0, 27, 0, 27), 
            Position = UDim2.new(0, v35, 0, 0), 
            Image = v43, 
            ImageColor3 = v44.Theme.TextEmphasis.Color, 
            ImageTransparency = v44.Theme.TextEmphasis.Transparency, 
            BackgroundTransparency = 1, 
            ZIndex = l_ZIndex_0, 
            [v5.Event.Activated] = l_onActivated_0
        });
    end);
end;
v34.init = function(v46) --[[ Line: 121 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v46.state = {
        onScreenKeyboardHeight = 0, 
        childrenContainerPosition = Vector2.new(), 
        childrenContainerSize = Vector2.new()
    };
    v46.isMounted = false;
    v46.prevFocusedTextBox = nil;
    local v47, v48 = v5.createBinding(Vector2.new());
    v46.canvasPosition = v47;
    v46.updateCanvasPosition = v48;
    v46.onScrollingFrameSizeChanged = function(v49) --[[ Line: 132 ]]
        -- upvalues: v46 (copy)
        local l_onScreenKeyboardHeight_0 = v46.state.onScreenKeyboardHeight;
        local l_focusedTextBox_0 = v46.props.focusedTextBox;
        if l_focusedTextBox_0 then
            l_onScreenKeyboardHeight_0 = math.min(l_focusedTextBox_0.AbsolutePosition.Y + v49.CanvasPosition.Y - 20, l_onScreenKeyboardHeight_0);
        end;
        v46.updateCanvasPosition(Vector2.new(0, l_onScreenKeyboardHeight_0));
    end;
    v46.onTopButtonActivated = function() --[[ Line: 143 ]]
        -- upvalues: v46 (copy)
        local l_topButtonEnabled_0 = v46.props.topButtonEnabled;
        local l_navigateBack_0 = v46.props.navigateBack;
        local l_topButtonActivatedTracking_0 = v46.props.topButtonActivatedTracking;
        if l_topButtonActivatedTracking_0 then
            l_topButtonActivatedTracking_0();
        end;
        if l_topButtonEnabled_0 then
            l_navigateBack_0();
        end;
    end;
end;
v34.didMount = function(v55) --[[ Line: 158 ]] --[[ Name: didMount ]]
    -- upvalues: l_UserInputService_0 (copy)
    v55.isMounted = true;
    v55.keyboardVisibleChanged = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):connect(function() --[[ Line: 162 ]]
        -- upvalues: l_UserInputService_0 (ref), v55 (copy)
        local l_OnScreenKeyboardVisible_0 = l_UserInputService_0.OnScreenKeyboardVisible;
        local v57 = l_OnScreenKeyboardVisible_0 and l_UserInputService_0.OnScreenKeyboardSize.Y or 0;
        local v58 = false;
        local l_focusedTextBox_1 = v55.props.focusedTextBox;
        local l_prevFocusedTextBox_0 = v55.prevFocusedTextBox;
        local v61 = not l_OnScreenKeyboardVisible_0 and l_prevFocusedTextBox_0 ~= nil and l_focusedTextBox_1 ~= nil and l_prevFocusedTextBox_0 ~= l_focusedTextBox_1;
        if l_OnScreenKeyboardVisible_0 then
            v58 = true;
        elseif v61 then
            v55._prevFocusedTextBox = l_focusedTextBox_1;
            v58 = false;
        else
            v58 = true;
            v57 = 0;
        end;
        if v58 then
            v55:setState({
                onScreenKeyboardHeight = v57
            });
        end;
    end);
end;
v34.didUpdate = function(v62, v63, _) --[[ Line: 196 ]] --[[ Name: didUpdate ]]
    if v63.focusedTextBox ~= v62.props.focusedTextBox then
        v62.prevFocusedTextBox = v63.focusedTextBox;
    end;
end;
v34.willUnmount = function(v65) --[[ Line: 202 ]] --[[ Name: willUnmount ]]
    v65.isMounted = false;
    if v65.keyboardVisibleChanged then
        v65.keyboardVisibleChanged:disconnect();
        v65.keyboardVisibleChanged = nil;
    end;
end;
v34.render = function(v66) --[[ Line: 211 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v5 (copy), v15 (copy), v16 (copy), v37 (copy), l_getSafeAreaSize_0 (copy), l_FormFactor_0 (copy), v36 (copy), v19 (copy), l_UserInputService_0 (copy), v13 (copy), l_FFlagLuaEnableLandingPageTTIMeasurements_0 (copy), l_authTimingUtil_0 (copy), l_EventStreamConstants_0 (copy), l_authPageload_0 (copy), l_HttpService_0 (copy), v10 (copy), l_BackgroundFill_0 (copy), l_SpringAnimatedItem_0 (copy), v30 (copy), v45 (copy)
    return l_withStyle_0(function(_) --[[ Line: 212 ]]
        -- upvalues: v66 (copy), v5 (ref), v15 (ref), v16 (ref), v37 (ref), l_getSafeAreaSize_0 (ref), l_FormFactor_0 (ref), v36 (ref), v19 (ref), l_UserInputService_0 (ref), v13 (ref), l_FFlagLuaEnableLandingPageTTIMeasurements_0 (ref), l_authTimingUtil_0 (ref), l_EventStreamConstants_0 (ref), l_authPageload_0 (ref), l_HttpService_0 (ref), v10 (ref), l_BackgroundFill_0 (ref), l_SpringAnimatedItem_0 (ref), v30 (ref), v45 (ref)
        local v68 = v66.props[v5.Children];
        local l_ContentAlign_0 = v66.props.ContentAlign;
        local l_statusBarHeight_0 = v66.props.statusBarHeight;
        local l_screenSize_0 = v66.props.screenSize;
        local l_globalGuiInset_0 = v66.props.globalGuiInset;
        local l_navigation_0 = v66.props.navigation;
        local v74 = l_navigation_0.history[#l_navigation_0.history];
        local l_name_0 = v74[#v74].name;
        local l_Landing_0 = v15.Landing;
        local v77 = #l_navigation_0.history[#l_navigation_0.history];
        local v78 = v77 - (v16(l_Landing_0, l_navigation_0.history) or 0) <= 1;
        local v79 = nil;
        v79 = if v37 then v77 > 1 else l_name_0 ~= l_Landing_0;
        local l_LuobuLogoEnabled_0 = v66.props.LuobuLogoEnabled;
        local l_VNAgeBadgeEnabled_0 = v66.props.VNAgeBadgeEnabled;
        local v82 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0).Y.Offset - l_statusBarHeight_0;
        local v83 = nil;
        local v84 = nil;
        if l_LuobuLogoEnabled_0 or l_VNAgeBadgeEnabled_0 then
            if v66.props.formFactor == l_FormFactor_0.COMPACT then
                v83 = 0.3;
                v84 = 0.35;
            else
                v83 = 0.3;
                v84 = 0.4;
            end;
        elseif v66.props.formFactor == l_FormFactor_0.COMPACT then
            v83 = 0.15;
            v84 = 0.3;
        else
            v83 = 0.25;
            v84 = 0.45;
        end;
        local v85 = nil;
        local v86 = nil;
        if l_LuobuLogoEnabled_0 then
            v85 = "rbxasset://textures/ui/LuaApp/graphic/Auth/logo_white_luobu.png";
            v86 = 4.0546875;
        else
            v85 = "rbxasset://textures/ui/LuaApp/graphic/Auth/logo_white_1x.png";
            v86 = 5.409090909090909;
        end;
        local v87 = v82 * v83;
        local v88 = v82 * v84;
        if v66.props.isShortScreen and not v66.props.isCompactScreen then
            v87 = v87 * v36;
            v88 = v88 * v36;
        end;
        local v89 = v82 * 0.05;
        local v90 = UDim2.new(1, 0, v84, v66.state.childrenContainerSize.Y);
        local v91 = {
            [v19.Top] = {
                Position = UDim2.new(0.5, 0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0)
            }, 
            [v19.Bottom] = {
                Position = UDim2.new(0.5, 0, 1, 0), 
                AnchorPoint = Vector2.new(0.5, 1)
            }
        };
        local _ = UDim2.new(0, v66.state.childrenContainerPosition.X + v66.state.childrenContainerSize.X / 2, 0, v66.state.childrenContainerPosition.Y + v66.state.childrenContainerSize.Y / 2);
        local l_OnScreenKeyboardAnimationDuration_0 = l_UserInputService_0.OnScreenKeyboardAnimationDuration;
        local v94 = {
            dampingRatio = 1, 
            frequency = 1 / math.max(l_OnScreenKeyboardAnimationDuration_0, 0.1)
        };
        local l_isDualLayout_0 = v66.props.isDualLayout;
        local l_xOffset_0 = v66.props.tokens.LuaApps.LoginView.xOffset;
        local l_FooterElement_0 = v66.props.FooterElement;
        local l_FooterHeight_0 = v66.props.FooterHeight;
        local l_isCompactScreen_0 = v66.props.isCompactScreen;
        local v100 = l_isCompactScreen_0 and 15 or 40;
        local v101 = if l_FooterElement_0 and l_isCompactScreen_0 then l_FooterHeight_0 else 0;
        local v104 = {
            VNAgeBadge = l_VNAgeBadgeEnabled_0 and v5.createElement("ImageLabel", {
                Position = UDim2.new(0.05, 0, 0, v89), 
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
                Position = UDim2.new(0.5, 0, 0, v87), 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.new(0.7, 0, 0.7, 0), 
                Image = v85, 
                ZIndex = 1, 
                [v5.Children] = {
                    UISizeConstraint = v5.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(460, 460 / v86)
                    }), 
                    UIAspectRatioConstraint = v5.createElement("UIAspectRatioConstraint", {
                        AspectRatio = v86, 
                        AspectType = Enum.AspectType.FitWithinMaxSize
                    })
                }
            }), 
            AlignmentContainer = v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = if l_isDualLayout_0 then UDim2.new(0, l_xOffset_0, 0, v88) else UDim2.new(0.5, 0, 0, v88), 
                Size = if l_isDualLayout_0 then UDim2.new(1, -(2 * l_xOffset_0), 1, -v88 - v101) else UDim2.new(1, 0, 1, -v88 - v101), 
                AnchorPoint = if l_isDualLayout_0 then Vector2.new(0, 0) else Vector2.new(0.5, 0), 
                ZIndex = 2
            }, {
                Content = v5.createElement(v13.FitFrame, {
                    Position = v91[l_ContentAlign_0].Position, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = v13.FitAxis.Height, 
                    AnchorPoint = v91[l_ContentAlign_0].AnchorPoint, 
                    BackgroundTransparency = 1, 
                    [v5.Change.AbsoluteSize] = function(v102) --[[ Line: 376 ]]
                        -- upvalues: v66 (ref)
                        spawn(function() --[[ Line: 377 ]]
                            -- upvalues: v66 (ref), v102 (copy)
                            if not v66.isMounted then
                                return;
                            else
                                v66:setState({
                                    childrenContainerSize = v102.AbsoluteSize
                                });
                                return;
                            end;
                        end);
                    end, 
                    [v5.Change.AbsolutePosition] = function(v103) --[[ Line: 386 ]]
                        -- upvalues: v66 (ref)
                        spawn(function() --[[ Line: 387 ]]
                            -- upvalues: v66 (ref), v103 (copy)
                            if not v66.isMounted then
                                return;
                            else
                                v66:setState({
                                    childrenContainerPosition = v103.AbsolutePosition
                                });
                                return;
                            end;
                        end);
                    end, 
                    [v5.Children] = v68
                })
            })
        };
        if l_FFlagLuaEnableLandingPageTTIMeasurements_0 and l_name_0 == v15.Landing then
            local v105 = l_authTimingUtil_0.landingPageLoadFinish();
            if v105 then
                local v106 = {
                    variant = l_EventStreamConstants_0.Context.LandingScreen, 
                    timing = v105
                };
                l_authPageload_0(l_EventStreamConstants_0.Context.LandingPageRender, l_HttpService_0:JSONEncode(v106));
            end;
        end;
        return v5.createElement(v10, {
            includeStatusBar = true, 
            buttonRef = v66.props.buttonRef, 
            renderFullscreenBackground = function(_) --[[ Line: 414 ]] --[[ Name: renderFullscreenBackground ]]
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
                    [v5.Children] = v104, 
                    CanvasSize = v90, 
                    CanvasPosition = v66.canvasPosition, 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    ScrollBarThickness = 0, 
                    ZIndex = 2, 
                    [v5.Change.AbsoluteSize] = v66.onScrollingFrameSizeChanged
                }, 
                animatedValues = {
                    onScreenKeyboardHeight = v66.state.onScreenKeyboardHeight
                }, 
                mapValuesToProps = function(v108) --[[ Line: 452 ]] --[[ Name: mapValuesToProps ]]
                    return {
                        Size = UDim2.new(1, 0, 1, -v108.onScreenKeyboardHeight)
                    };
                end, 
                springOptions = v94
            }), 
            Footer = l_FooterElement_0 and v5.createElement(v30.View, {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Position = UDim2.new(0.5, 0, 1, -v100), 
                AnchorPoint = Vector2.new(0.5, 1), 
                ZIndex = 3, 
                tag = "col align-x-center"
            }, {
                Content = l_FooterElement_0
            }), 
            TopButton = v79 and v5.createElement(v45, {
                showCloseIcon = v78, 
                onActivated = v66.onTopButtonActivated, 
                ZIndex = 3
            }) or nil
        });
    end);
end;
local v112 = v6.connect(function(v109, _) --[[ Line: 478 ]]
    return {
        formFactor = v109.FormFactor, 
        statusBarHeight = v109.TopBar.statusBarHeight, 
        globalGuiInset = v109.GlobalGuiInset, 
        screenSize = v109.ScreenSize, 
        navigation = v109.Navigation
    };
end, function(v111) --[[ Line: 486 ]]
    -- upvalues: v14 (copy)
    return {
        navigateBack = function() --[[ Line: 488 ]] --[[ Name: navigateBack ]]
            -- upvalues: v111 (copy), v14 (ref)
            return v111(v14());
        end
    };
end)(v34);
return function(v113) --[[ Line: 495 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useFocusedTextBox_0 (copy), v5 (copy), v112 (copy), v20 (copy), l_useBreakpointYOrSmaller_0 (copy), v7 (copy), l_useBreakpointXOrSmaller_0 (copy)
    local v114 = l_useDesignTokens_0();
    local v115 = l_useFocusedTextBox_0();
    return v5.createElement(v112, v20.Dictionary.join({
        tokens = v114, 
        isShortScreen = l_useBreakpointYOrSmaller_0(v7.Keys.Medium), 
        isCompactScreen = l_useBreakpointXOrSmaller_0(v7.Keys.Medium), 
        focusedTextBox = v115
    }, v113));
end;