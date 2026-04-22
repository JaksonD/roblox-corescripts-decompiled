local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v10 = require(l_CorePackages_0.Packages.Cryo);
local v11 = require(l_CorePackages_0.Packages.Roact);
local v12 = require(l_CorePackages_0.Packages.React);
local v13 = require(l_CorePackages_0.Packages.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v15 = require(l_CorePackages_0.Packages.RoactNavigation);
local v16 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDeviceEnterCodeView);
local v17 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDeviceConfirmLoginView);
local v18 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v19 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v24 = require(l_Modules_0.LuaApp.Enum.CrossDeviceLoginView);
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local l_FullscreenFrame_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).FullscreenFrame;
local v27 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableCrossDeviceLoginUsingQRCodes);
local v28 = v11.PureComponent:extend("CrossDeviceLoginPage");
v28.init = function(v29) --[[ Line: 34 ]] --[[ Name: init ]]
    -- upvalues: v24 (copy), v11 (copy)
    v29:setState({
        View = v24.InputCode, 
        DeviceCode = "", 
        HighKeyboardMode = false, 
        DeviceName = ""
    });
    v29.confirmDeviceCode = function(v30, v31) --[[ Line: 42 ]]
        -- upvalues: v29 (copy), v24 (ref)
        v29:setState({
            View = v24.Confirm, 
            DeviceCode = v30, 
            DeviceName = v31
        });
    end;
    v29.retryCrossDeviceLogin = function() --[[ Line: 50 ]]
        -- upvalues: v29 (copy), v24 (ref)
        v29:setState({
            DeviceCode = "", 
            DeviceName = "", 
            View = v24.InputCode
        });
    end;
    v29.closeCrossDeviceLogin = function() --[[ Line: 58 ]]
        -- upvalues: v29 (copy)
        v29.props.navigateBack();
    end;
    v29.continueButtonRef = v11.createRef();
end;
v28.didMount = function(v32) --[[ Line: 65 ]] --[[ Name: didMount ]]
    -- upvalues: l_UserInputService_0 (copy)
    v32.keyboardVisibleChanged = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):connect(function() --[[ Line: 67 ]]
        -- upvalues: l_UserInputService_0 (ref), v32 (copy)
        local l_OnScreenKeyboardVisible_0 = l_UserInputService_0.OnScreenKeyboardVisible;
        local v34 = l_OnScreenKeyboardVisible_0 and l_UserInputService_0.OnScreenKeyboardSize.Y or 0;
        if l_OnScreenKeyboardVisible_0 then
            local l_current_0 = v32.continueButtonRef.current;
            if l_current_0 and v34 + l_current_0.AbsolutePosition.Y + l_current_0.AbsoluteSize.Y + 25 > v32.props.screenSize.Y then
                v32:setState({
                    HighKeyboardMode = true
                });
                return;
            end;
        elseif v32.state.HighKeyboardMode then
            v32:setState({
                HighKeyboardMode = false
            });
        end;
    end);
end;
v28.willUnmount = function(v36) --[[ Line: 92 ]] --[[ Name: willUnmount ]]
    if v36.keyboardVisibleChanged then
        v36.keyboardVisibleChanged:disconnect();
        v36.keyboardVisibleChanged = nil;
    end;
end;
v28.render = function(v37) --[[ Line: 99 ]] --[[ Name: render ]]
    -- upvalues: l_FormFactor_0 (copy), v12 (copy), v24 (copy), v11 (copy), v16 (copy), v27 (copy), v17 (copy), l_withStyle_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_FullscreenFrame_0 (copy), v18 (copy)
    local l_designTokens_0 = v37.props.designTokens;
    local v39 = true;
    if v37.props.formFactor ~= l_FormFactor_0.WIDE then
        v39 = v37.props.isTenFootUiMode;
    end;
    local v40 = nil;
    if v37.props.isTenFootUiMode then
        local l_BackgroundGradientOffset_0 = l_designTokens_0.LuaApps.More.BackgroundGradientOffset;
        local l_SafeAreaMargin_0 = l_designTokens_0.LuaApps.More.SafeAreaMargin;
        v40 = v12.createElement("Frame", {
            Position = UDim2.new(0, -l_SafeAreaMargin_0.X, 0, -l_BackgroundGradientOffset_0), 
            Size = UDim2.new(1, l_SafeAreaMargin_0.X + l_SafeAreaMargin_0.X, 1, l_BackgroundGradientOffset_0 + l_SafeAreaMargin_0.Y), 
            ZIndex = -1
        }, {
            UIGradient = v12.createElement("UIGradient", {
                Color = ColorSequence.new(Color3.new(0, 0, 0)), 
                Transparency = NumberSequence.new(1, 0.4), 
                Rotation = 90
            })
        });
    end;
    local v43 = {};
    local v44 = false;
    if v37.state.View == v24.InputCode then
        v44 = v11.createElement(v16, {
            isWideView = v39, 
            code = v27() and v37.props.code, 
            continueButtonRef = v37.continueButtonRef, 
            highKeyboardMode = v37.state.HighKeyboardMode, 
            confirmDeviceCode = v37.confirmDeviceCode
        });
    end;
    local v45 = false;
    if v37.state.View == v24.Confirm then
        v45 = v11.createElement(v17, {
            isWideView = v39, 
            continueButtonRef = v37.continueButtonRef, 
            highKeyboardMode = v37.state.HighKeyboardMode, 
            deviceString = v37.state.DeviceName, 
            deviceCode = v37.state.DeviceCode, 
            closeCallback = v37.closeCrossDeviceLogin, 
            retryCallback = v37.retryCrossDeviceLogin, 
            source = v37.props.source
        });
    end;
    v6(v43, 1, v44, v45);
    return l_withStyle_0(function(_) --[[ Line: 141 ]]
        -- upvalues: l_designTokens_0 (copy), v37 (copy), l_FormFactor_0 (ref), v39 (copy), v11 (ref), l_FFlagEnableLeftNavOnConsole_0 (ref), l_FullscreenFrame_0 (ref), v40 (ref), v18 (ref), v43 (copy)
        local l_BackgroundColor_0 = l_designTokens_0.LuaApps.App.Page.BackgroundColor;
        local l_BackgroundTransparency_0 = l_designTokens_0.LuaApps.App.Page.BackgroundTransparency;
        local v49 = math.min(v37.props.screenSize.X, v37.props.screenSize.Y);
        local v50 = false;
        if v37.props.formFactor == l_FormFactor_0.WIDE then
            v50 = false;
            if v49 > 0 then
                v50 = v49 < 700;
            end;
        end;
        local v51 = l_designTokens_0.LuaApps.CrossDeviceLogin.getDevicePadding(v39 and not v50);
        local l_verticalPadding_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.verticalPadding;
        return v11.createElement(if l_FFlagEnableLeftNavOnConsole_0 then l_FullscreenFrame_0 else "Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_BackgroundColor_0, 
            BackgroundTransparency = l_BackgroundTransparency_0
        }, {
            BackgroundFrame = if v37.props.isTenFootUiMode then v40 else nil, 
            TopBar = if v37.props.isTenFootUiMode then nil else v11.createElement(v18.Container, {
                leftItem = v18.BackButton, 
                rightItems = {
                    v18.BuyRobuxButton, 
                    v18.NotificationsButton
                }
            }), 
            PageContent = v11.createElement("Frame", {
                Size = UDim2.new(1, -2 * v51, 1, -2 * l_verticalPadding_0 - v37.props.topBarSize), 
                Position = UDim2.new(0, v51, 0, v37.state.HighKeyboardMode and v37.props.topBarSize or l_verticalPadding_0 + v37.props.topBarSize), 
                BackgroundTransparency = 1
            }, v43)
        });
    end);
end;
local v56 = v13.connect(function(v53, v54) --[[ Line: 182 ]]
    return {
        formFactor = v53.FormFactor, 
        topBarSize = v54.isTenFootUiMode and 0 or v53.TopBar.topBarHeight, 
        screenSize = v53.ScreenSize
    };
end, function(v55) --[[ Line: 188 ]]
    -- upvalues: v19 (copy)
    return {
        navigateBack = function() --[[ Line: 190 ]] --[[ Name: navigateBack ]]
            -- upvalues: v55 (copy), v19 (ref)
            return v55(v19());
        end
    };
end)(v28);
return (v15.withNavigation(function(v57) --[[ Line: 197 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), v12 (copy), v56 (copy), v10 (copy), l_UiMode_0 (copy)
    local v58 = l_useDesignTokens_0();
    local v59 = l_useUiModeInfo_0();
    return v12.createElement(v56, v10.Dictionary.join(v57, {
        designTokens = v58, 
        isTenFootUiMode = v59.uiMode == l_UiMode_0.TenFoot, 
        code = v57.navigation.getParam("extraProps", {}).code, 
        source = v57.navigation.getParam("extraProps", {}).source
    }));
end));