local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v6.Style.withStyle;
local v8 = require(l_Modules_0.LuaApp.withLocalization);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v10 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v11 = require(l_CorePackages_0.Packages.Foundation);
local l_Image_0 = v11.Image;
local l_useTokens_0 = v11.Hooks.useTokens;
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v16 = require(l_Modules_0.LuaApp.Thunks.Authentication.CrossDeviceLogin);
local v17 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v18 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v19 = require(l_Modules_0.LuaApp.Http.Requests.GetIXPLayerParameters);
local v20 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableCrossDeviceLoginUsingQRCodes);
local v21 = require(l_Modules_0.LuaApp.FitChildren);
local v22 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v23 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_TextInputBoxWithBorder_0 = v23.Components.TextInputBoxWithBorder;
local l_AuthStatefulRoundCornerBorder_0 = v23.Components.AuthStatefulRoundCornerBorder;
local l_Button_0 = v6.App.Button.Button;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local v28 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDevicePhoneLayout);
local v29 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDeviceTabletLayout);
local v30 = require(l_Modules_0.LuaApp.Components.Authentication.Logger);
local l_GetFFlagEnableAuthsecImageUpdate_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAuthsecImageUpdate;
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local v34 = l_Images_0["icons/graphic/lock_xxlarge"];
game:DefineFastFlag("EnablePlayerAppCrossDeviceEnterCodeExperiments", false);
game:DefineFastFlag("EnableXDLCodeValidationExperiment", false);
local v35 = v3.PureComponent:extend("CrossDeviceEnterCodePage");
v35.init = function(v36) --[[ Line: 73 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy), v30 (copy), v20 (copy), v18 (copy), v3 (copy)
    v36:setState({
        inputCode = "", 
        inputErrorKey = "", 
        placeholderTextOverride = "", 
        disableSubmissionForBadCode = false, 
        isConfirming = false, 
        isFocused = false
    });
    v36.onFocus = function() --[[ Line: 83 ]]
        -- upvalues: v36 (copy)
        v36:setState({
            inputErrorKey = "", 
            isFocused = true
        });
    end;
    v36.onFocusLost = function(_, v38) --[[ Line: 90 ]]
        -- upvalues: v36 (copy)
        if v38 and #v36.state.inputCode == 6 then
            v36.confirmButtonPressed();
            return;
        else
            v36:setState({
                isFocused = false
            });
            return;
        end;
    end;
    v36.getVerifyCodeImage = function(v39) --[[ Line: 100 ]]
        -- upvalues: v11 (ref)
        if v39 == v11.Enums.Theme.Dark then
            return "icons/graphic/verifyCode_dark";
        else
            return "icons/graphic/verifyCode_light";
        end;
    end;
    v36.onTextChanged = function(v40) --[[ Line: 108 ]]
        -- upvalues: v36 (copy), v30 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 115 ]]
            -- upvalues: v40 (copy), v36 (ref)
            local v41 = v40.Text:gsub("[^%w]", ""):upper():sub(1, 6);
            if v41 ~= v40.Text then
                v40.Text = v41;
                return;
            else
                v36:setState({
                    inputCode = v40.Text
                });
                return;
            end;
        end);
        if not l_status_0 then
            v30:warning(string.format("Text validation error in CrossDeviceEnderCodeView: %s", (tostring(l_result_0))));
        end;
    end;
    v36.attemptDeeplinkCode = true;
    v36.confirmingCode = false;
    v36.confirmButtonPressed = function() --[[ Line: 132 ]]
        -- upvalues: v36 (copy), v20 (ref), v18 (ref)
        if not v36.confirmingCode then
            v36.confirmingCode = true;
            v36:setState({
                isConfirming = true, 
                isFocused = false
            });
            local v44 = nil;
            local v45 = nil;
            if v20() and v36.attemptDeeplinkCode and v36.props.code then
                v44 = v36.props.code;
                v45 = "qrCode";
            else
                v44 = v36.state.inputCode;
                v45 = "alphaNumericCode";
            end;
            v36.attemptDeeplinkCode = false;
            if v20() then
                v36.props.authAnalytics.reportButtonClickedWithCType(v18.Context.QuickLogin, v18.Button.EnterDeviceCode, v45);
            else
                v36.props.authAnalytics.reportButtonClicked(v18.Context.QuickLogin, v18.Button.EnterDeviceCode);
            end;
            do
                local l_v44_0 = v44;
                v36.props.validateCode(v36.props.networking, l_v44_0):andThen(function(v47) --[[ Line: 165 ]]
                    -- upvalues: v36 (ref), l_v44_0 (ref)
                    v36.acceptInputCode(l_v44_0, v47.DeviceInfo);
                end, v36.clearInputCode);
            end;
        end;
    end;
    local v48, v49 = v3.createBinding("");
    v36.inputText = v48;
    v36.setInputText = v49;
    v36.clearInputCode = function(v50) --[[ Line: 172 ]]
        -- upvalues: v36 (copy)
        v36.confirmingCode = false;
        v36.setInputText("");
        local v51 = "Authentication.Login.Response.SomethingWentWrong";
        if v50.Body == "\"CodeInvalid\"" then
            v51 = "Authentication.CrossDevice.Response.InvalidCode";
        elseif v50.Body == "\"InvalidLocation\"" then
            v51 = "Authentication.CrossDevice.Label.InvalidLocationError";
        end;
        v36:setState({
            inputCode = "", 
            inputErrorKey = v51, 
            isConfirming = false
        });
    end;
    v36.acceptInputCode = function(v52, v53) --[[ Line: 188 ]]
        -- upvalues: v36 (copy)
        if v36.props.confirmDeviceCode then
            v36.props.confirmDeviceCode(v52, v53);
        end;
    end;
end;
v35.didMount = function(v54) --[[ Line: 195 ]] --[[ Name: didMount ]]
    -- upvalues: v18 (copy), v19 (copy)
    if v54.props.code then
        v54.setInputText(v54.props.code);
        v54.confirmButtonPressed();
    end;
    v54.isMounted = true;
    v54.props.authAnalytics.reportScreenLoaded(v18.Context.QuickLogin);
    if game:GetFastFlag("EnablePlayerAppCrossDeviceEnterCodeExperiments") then
        v19(v54.props.networking, "PlayerApp.CrossDeviceLogin.ConfirmCode", {
            "HintTextOverride"
        }):andThen(function(v55) --[[ Line: 209 ]]
            -- upvalues: v54 (copy)
            local v56 = v55 and v55.responseBody;
            if v56 and v54.isMounted then
                local l_HintTextOverride_0 = v56.HintTextOverride;
                local l_ShouldDisableSubmissionForBadCode_0 = v56.ShouldDisableSubmissionForBadCode;
                v54:setState({
                    placeholderTextOverride = l_HintTextOverride_0 or "", 
                    disableSubmissionForBadCode = l_ShouldDisableSubmissionForBadCode_0 or false
                });
            end;
        end, function() --[[ Line: 219 ]]

        end);
    end;
end;
v35.willUnmount = function(v59) --[[ Line: 225 ]] --[[ Name: willUnmount ]]
    v59.isMounted = false;
end;
v35.render = function(v60) --[[ Line: 229 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v8 (copy), v3 (copy), v29 (copy), v28 (copy), l_GetFFlagEnableAuthsecImageUpdate_0 (copy), l_Image_0 (copy), l_ImageSetLabel_0 (copy), v34 (copy), v21 (copy), v22 (copy), l_TextInputBoxWithBorder_0 (copy), l_AuthStatefulRoundCornerBorder_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_Text_0 (copy)
    local l_isWideView_0 = v60.props.isWideView;
    local l_inputCode_0 = v60.state.inputCode;
    local v63 = v60.state.inputErrorKey == "";
    local l_isConfirming_0 = v60.state.isConfirming;
    local l_isFocused_0 = v60.state.isFocused;
    return l_withStyle_0(function(v66) --[[ Line: 237 ]]
        -- upvalues: v8 (ref), v63 (copy), v60 (copy), l_isWideView_0 (copy), v3 (ref), v29 (ref), v28 (ref), l_GetFFlagEnableAuthsecImageUpdate_0 (ref), l_Image_0 (ref), l_ImageSetLabel_0 (ref), v34 (ref), v21 (ref), v22 (ref), l_TextInputBoxWithBorder_0 (ref), l_AuthStatefulRoundCornerBorder_0 (ref), l_isFocused_0 (copy), l_Button_0 (ref), l_ButtonType_0 (ref), l_isConfirming_0 (copy), l_inputCode_0 (copy), l_Text_0 (ref)
        return v8({
            tabletHeader = "Authentication.CrossDevice.Heading.LoginAnotherDevice", 
            warningHeader = "Authentication.CrossDevice.Heading.LoginWarning", 
            warning1 = "Authentication.CrossDevice.Label.Warning1", 
            warning2 = "Authentication.CrossDevice.Label.Warning2", 
            placeholderText = "Authentication.CrossDevice.Label.EnterOtherDeviceCode", 
            enter = "Authentication.CrossDevice.Action.Enter", 
            inputError = not v63 and v60.state.inputErrorKey or nil
        })(function(v67) --[[ Line: 246 ]]
            -- upvalues: v60 (ref), l_isWideView_0 (ref), v66 (copy), v3 (ref), v29 (ref), v28 (ref), l_GetFFlagEnableAuthsecImageUpdate_0 (ref), l_Image_0 (ref), l_ImageSetLabel_0 (ref), v34 (ref), v21 (ref), v22 (ref), l_TextInputBoxWithBorder_0 (ref), v63 (ref), l_AuthStatefulRoundCornerBorder_0 (ref), l_isFocused_0 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), l_isConfirming_0 (ref), l_inputCode_0 (ref), l_Text_0 (ref)
            local l_designTokens_0 = v60.props.designTokens;
            local v69 = l_isWideView_0 and v60.props.tokens.Size.Size_2000 * 2 or v60.props.tokens.Size.Size_2000 * 4;
            local v70 = l_isWideView_0 and v60.props.tokens.Size.Size_2200 or v60.props.tokens.Size.Size_2200 * 2;
            local v71 = not l_isWideView_0 and v60.props.tokens.Size.Size_350 or 0;
            local v72 = UDim2.fromOffset(l_designTokens_0.LuaApps.CrossDeviceLogin.iconSize, l_designTokens_0.LuaApps.CrossDeviceLogin.iconSize);
            local l_Font_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.headerFont.Font;
            local l_FontSize_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.headerFont.FontSize;
            local l_Color3_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.headerTextColor.Color3;
            local l_headerPadding_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.headerPadding;
            local l_Font_1 = l_designTokens_0.LuaApps.CrossDeviceLogin.bodyFont.Font;
            local l_FontSize_1 = l_designTokens_0.LuaApps.CrossDeviceLogin.bodyFont.FontSize;
            local l_Color3_1 = l_designTokens_0.LuaApps.CrossDeviceLogin.bodyTextColor.Color3;
            local l_Transparency_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.headerTextColor.Transparency;
            local l_Font_2 = l_designTokens_0.LuaApps.CrossDeviceLogin.textAlertFont.Font;
            local l_FontSize_2 = l_designTokens_0.LuaApps.CrossDeviceLogin.textAlertFont.FontSize;
            local l_Color3_2 = l_designTokens_0.LuaApps.CrossDeviceLogin.textAlertColor.Color3;
            local l_BaseSize_0 = v66.Font.BaseSize;
            local v85 = v60.state.placeholderTextOverride ~= "" and v60.state.placeholderTextOverride or v67.placeholderText;
            return v3.createElement(l_isWideView_0 and v29 or v28, {
                TabletHeaderText = v67.tabletHeader, 
                Style = v66, 
                HighKeyboardMode = v60.props.highKeyboardMode, 
                Icon = l_GetFFlagEnableAuthsecImageUpdate_0() and v3.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = l_isWideView_0 and v72 or UDim2.new(0, v69, 0, v70 - v71), 
                    BackgroundTransparency = 1
                }, {
                    Image = v3.createElement(l_Image_0, {
                        Image = v60.getVerifyCodeImage(v60.props.tokens.Config.ColorMode.Name), 
                        ScaleType = Enum.ScaleType.Fit, 
                        Size = UDim2.new(0, v69, 0, v70), 
                        Position = UDim2.new(0.5, 0, 0.5, -v71 / 2), 
                        AnchorPoint = Vector2.new(0.5, 0.5)
                    })
                }) or v3.createElement(l_ImageSetLabel_0, {
                    Size = v72, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    ScaleType = Enum.ScaleType.Fit, 
                    Image = v34, 
                    ImageColor3 = v66.Theme.UIEmphasis.Color, 
                    ImageTransparency = 0
                }), 
                WarningText = v3.createElement(v21.FitFrame, {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, -20, 0, 0), 
                    fitAxis = v21.FitAxis.Height, 
                    BackgroundTransparency = 1
                }, {
                    Align = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        Padding = UDim.new(0, 6), 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    TopWarning = v3.createElement(v22, {
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = v67.warningHeader, 
                        TextWrapped = true, 
                        Font = l_Font_0, 
                        TextSize = l_FontSize_0, 
                        TextColor3 = l_Color3_0, 
                        TextTransparency = l_Transparency_0, 
                        TextXAlignment = l_isWideView_0 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
                        fitAxis = v21.FitAxis.Height, 
                        BackgroundTransparency = 1
                    }), 
                    Padding = v3.createElement("Frame", {
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, 0, 0, l_headerPadding_0), 
                        BackgroundTransparency = 1
                    }), 
                    BulletPoint1 = v3.createElement(v22, {
                        LayoutOrder = 3, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = v67.warning1, 
                        TextWrapped = true, 
                        Font = l_Font_1, 
                        TextSize = l_FontSize_1, 
                        TextColor3 = l_Color3_1, 
                        TextTransparency = l_Transparency_0, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        fitAxis = v21.FitAxis.Height, 
                        BackgroundTransparency = 1
                    }), 
                    BulletPoint2 = v3.createElement(v22, {
                        LayoutOrder = 4, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = v67.warning2, 
                        TextWrapped = true, 
                        Font = l_Font_1, 
                        TextSize = l_FontSize_1, 
                        TextColor3 = l_Color3_1, 
                        TextTransparency = l_Transparency_0, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        fitAxis = v21.FitAxis.Height, 
                        BackgroundTransparency = 1
                    })
                }), 
                InputBox = v3.createElement(l_TextInputBoxWithBorder_0, {
                    layoutOrder = 3, 
                    placeholderText = v85, 
                    borderState = not v63 and l_AuthStatefulRoundCornerBorder_0.BorderState.Error or l_isFocused_0 and l_AuthStatefulRoundCornerBorder_0.BorderState.Focused or l_AuthStatefulRoundCornerBorder_0.BorderState.Default, 
                    text = v60.inputText, 
                    onFocused = v60.onFocus, 
                    onFocusLost = v60.onFocusLost, 
                    onChangeTextCallback = v60.onTextChanged
                }), 
                InputWarning = not v63 and v3.createElement(v22, {
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, -6, 0, l_FontSize_2), 
                    Position = UDim2.new(0, 3, 1, 3), 
                    BackgroundTransparency = 1, 
                    Font = l_Font_2, 
                    TextSize = l_FontSize_2, 
                    TextColor3 = l_Color3_2, 
                    TextTransparency = l_Transparency_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Text = v67.inputError, 
                    TextWrapped = true, 
                    fitAxis = v21.FitAxis.Height
                }), 
                ConfirmCodeButton = v3.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    size = UDim2.new(1, 0, 1, 0), 
                    text = v67.enter, 
                    [v3.Ref] = v60.props.continueButtonRef, 
                    onActivated = v60.confirmButtonPressed, 
                    isLoading = l_isConfirming_0, 
                    isDisabled = game:GetFastFlag("EnableXDLCodeValidationExperiment") and v60.state.disableSubmissionForBadCode and #l_inputCode_0 < 6 or l_inputCode_0 == ""
                }), 
                ConfirmCodeButtonWidth = l_Text_0.GetTextWidth(v67.enter, l_Font_1, l_BaseSize_0) + 40
            });
        end);
    end);
end;
local v86 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
v35 = v86.connectUserLayer({
    l_AppUserLayers_0.ExposureLayer, 
    l_AppUserLayers_0.AccessLayer
}, function(_, _) --[[ Line: 408 ]]
    return {};
end)(v35);
v35 = l_RoactServices_0.connect({
    networking = v10, 
    authAnalytics = v17
})(v35);
local v95 = v5.connect(function(v90, _) --[[ Line: 417 ]]
    return {
        screenSize = v90.ScreenSize
    };
end, function(v92) --[[ Line: 421 ]]
    -- upvalues: v16 (copy)
    return {
        validateCode = function(v93, v94) --[[ Line: 423 ]] --[[ Name: validateCode ]]
            -- upvalues: v92 (copy), v16 (ref)
            return v92(v16.EnterCode(v93, v94));
        end
    };
end)(v35);
return function(v96) --[[ Line: 430 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useTokens_0 (copy), v4 (copy), v95 (copy), v2 (copy)
    local v97 = l_useDesignTokens_0();
    local v98 = l_useTokens_0();
    return v4.createElement(v95, v2.Dictionary.join(v96, {
        designTokens = v97, 
        tokens = v98
    }));
end;