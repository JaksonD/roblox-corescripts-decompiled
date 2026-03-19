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
local v25 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableCrossDeviceLoginUsingQRCodes);
local v26 = v11.PureComponent:extend("CrossDeviceLoginPage");
v26.init = function(v27) --[[ Line: 32 ]] --[[ Name: init ]]
    -- upvalues: v24 (copy), v11 (copy)
    v27:setState({
        View = v24.InputCode, 
        DeviceCode = "", 
        HighKeyboardMode = false, 
        DeviceName = ""
    });
    v27.confirmDeviceCode = function(v28, v29) --[[ Line: 40 ]]
        -- upvalues: v27 (copy), v24 (ref)
        v27:setState({
            View = v24.Confirm, 
            DeviceCode = v28, 
            DeviceName = v29
        });
    end;
    v27.retryCrossDeviceLogin = function() --[[ Line: 48 ]]
        -- upvalues: v27 (copy), v24 (ref)
        v27:setState({
            DeviceCode = "", 
            DeviceName = "", 
            View = v24.InputCode
        });
    end;
    v27.closeCrossDeviceLogin = function() --[[ Line: 56 ]]
        -- upvalues: v27 (copy)
        v27.props.navigateBack();
    end;
    v27.continueButtonRef = v11.createRef();
end;
v26.didMount = function(v30) --[[ Line: 63 ]] --[[ Name: didMount ]]
    -- upvalues: l_UserInputService_0 (copy)
    v30.keyboardVisibleChanged = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):connect(function() --[[ Line: 65 ]]
        -- upvalues: l_UserInputService_0 (ref), v30 (copy)
        local l_OnScreenKeyboardVisible_0 = l_UserInputService_0.OnScreenKeyboardVisible;
        local v32 = l_OnScreenKeyboardVisible_0 and l_UserInputService_0.OnScreenKeyboardSize.Y or 0;
        if l_OnScreenKeyboardVisible_0 then
            local l_current_0 = v30.continueButtonRef.current;
            if l_current_0 and v32 + l_current_0.AbsolutePosition.Y + l_current_0.AbsoluteSize.Y + 25 > v30.props.screenSize.Y then
                v30:setState({
                    HighKeyboardMode = true
                });
                return;
            end;
        elseif v30.state.HighKeyboardMode then
            v30:setState({
                HighKeyboardMode = false
            });
        end;
    end);
end;
v26.willUnmount = function(v34) --[[ Line: 90 ]] --[[ Name: willUnmount ]]
    if v34.keyboardVisibleChanged then
        v34.keyboardVisibleChanged:disconnect();
        v34.keyboardVisibleChanged = nil;
    end;
end;
v26.render = function(v35) --[[ Line: 97 ]] --[[ Name: render ]]
    -- upvalues: l_FormFactor_0 (copy), v12 (copy), v24 (copy), v11 (copy), v16 (copy), v25 (copy), v17 (copy), l_withStyle_0 (copy), v18 (copy)
    local l_designTokens_0 = v35.props.designTokens;
    local v37 = true;
    if v35.props.formFactor ~= l_FormFactor_0.WIDE then
        v37 = v35.props.isTenFootUiMode;
    end;
    local v38 = nil;
    if v35.props.isTenFootUiMode then
        local l_BackgroundGradientOffset_0 = l_designTokens_0.LuaApps.More.BackgroundGradientOffset;
        local l_SafeAreaMargin_0 = l_designTokens_0.LuaApps.More.SafeAreaMargin;
        v38 = v12.createElement("Frame", {
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
    local v41 = {};
    local v42 = false;
    if v35.state.View == v24.InputCode then
        v42 = v11.createElement(v16, {
            isWideView = v37, 
            code = v25() and v35.props.code, 
            continueButtonRef = v35.continueButtonRef, 
            highKeyboardMode = v35.state.HighKeyboardMode, 
            confirmDeviceCode = v35.confirmDeviceCode
        });
    end;
    local v43 = false;
    if v35.state.View == v24.Confirm then
        v43 = v11.createElement(v17, {
            isWideView = v37, 
            continueButtonRef = v35.continueButtonRef, 
            highKeyboardMode = v35.state.HighKeyboardMode, 
            deviceString = v35.state.DeviceName, 
            deviceCode = v35.state.DeviceCode, 
            closeCallback = v35.closeCrossDeviceLogin, 
            retryCallback = v35.retryCrossDeviceLogin, 
            source = v35.props.source
        });
    end;
    v6(v41, 1, v42, v43);
    return l_withStyle_0(function(_) --[[ Line: 139 ]]
        -- upvalues: l_designTokens_0 (copy), v37 (copy), v11 (ref), v35 (copy), v38 (ref), v18 (ref), v41 (copy)
        local l_BackgroundColor_0 = l_designTokens_0.LuaApps.App.Page.BackgroundColor;
        local l_BackgroundTransparency_0 = l_designTokens_0.LuaApps.App.Page.BackgroundTransparency;
        local v47 = l_designTokens_0.LuaApps.CrossDeviceLogin.getDevicePadding(v37);
        local l_verticalPadding_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.verticalPadding;
        return v11.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_BackgroundColor_0, 
            BackgroundTransparency = l_BackgroundTransparency_0
        }, {
            BackgroundFrame = if v35.props.isTenFootUiMode then v38 else nil, 
            TopBar = if v35.props.isTenFootUiMode then nil else v11.createElement(v18.Container, {
                leftItem = v18.BackButton, 
                rightItems = {
                    v18.BuyRobuxButton, 
                    v18.NotificationsButton
                }
            }), 
            PageContent = v11.createElement("Frame", {
                Size = UDim2.new(1, -2 * v47, 1, -2 * l_verticalPadding_0 - v35.props.topBarSize), 
                Position = UDim2.new(0, v47, 0, v35.state.HighKeyboardMode and v35.props.topBarSize or l_verticalPadding_0 + v35.props.topBarSize), 
                BackgroundTransparency = 1
            }, v41)
        });
    end);
end;
local v52 = v13.connect(function(v49, v50) --[[ Line: 175 ]]
    return {
        formFactor = v49.FormFactor, 
        topBarSize = v50.isTenFootUiMode and 0 or v49.TopBar.topBarHeight, 
        screenSize = v49.ScreenSize
    };
end, function(v51) --[[ Line: 181 ]]
    -- upvalues: v19 (copy)
    return {
        navigateBack = function() --[[ Line: 183 ]] --[[ Name: navigateBack ]]
            -- upvalues: v51 (copy), v19 (ref)
            return v51(v19());
        end
    };
end)(v26);
return (v15.withNavigation(function(v53) --[[ Line: 190 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), v12 (copy), v52 (copy), v10 (copy), l_UiMode_0 (copy)
    local v54 = l_useDesignTokens_0();
    local v55 = l_useUiModeInfo_0();
    return v12.createElement(v52, v10.Dictionary.join(v53, {
        designTokens = v54, 
        isTenFootUiMode = v55.uiMode == l_UiMode_0.TenFoot, 
        code = v53.navigation.getParam("extraProps", {}).code, 
        source = v53.navigation.getParam("extraProps", {}).source
    }));
end));