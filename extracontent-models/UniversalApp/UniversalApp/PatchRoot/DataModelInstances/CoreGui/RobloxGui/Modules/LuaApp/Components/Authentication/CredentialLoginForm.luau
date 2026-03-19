local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local l_Button_0 = v3.Button;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_ButtonSize_0 = v3.Enums.ButtonSize;
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v8.Core.Style.useStyle;
local v10 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v11 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v12 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local v13 = require(l_Modules_0.LuaApp.FitChildren);
local l_TextBoxStateWrapper_0 = v12.Components.TextBoxStateWrapper;
local l_GenericTextBox_0 = v12.Components.GenericTextBox;
local v16 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v17 = require(l_Modules_0.LuaApp.Themes.Colors);
local l_PasswordBox_0 = v12.Components.PasswordBox;
local v19 = require(l_Modules_0.LuaApp.Components.GenericTextButton);
local v20 = require(l_Modules_0.LuaApp.Components.Authentication.DisclaimerLinks);
local l_LinkButton_0 = v8.App.Button.LinkButton;
local l_OpenTypeSupport_0 = v8.Utility.OpenTypeSupport;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
local v27 = require(l_Modules_0.LuaApp.Flags.FFlagUseStandardFoundationButtonVariant);
return function(v28) --[[ Line: 39 ]]
    -- upvalues: l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), v11 (copy), v10 (copy), v2 (copy), v16 (copy), v13 (copy), v17 (copy), l_TextBoxStateWrapper_0 (copy), l_GenericTextBox_0 (copy), l_AppFonts_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy), l_PasswordBox_0 (copy), l_UiMode_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy), v27 (copy), v19 (copy), l_LinkButton_0 (copy), v20 (copy)
    local v29 = l_useStyle_0();
    local v30 = l_useDesignTokens_0();
    local v31 = l_useUiModeInfo_0();
    local l_LoginView_0 = v30.LuaApps.LoginView;
    local l_Color_0 = v29.Theme.TextDefault.Color;
    local l_Transparency_0 = v29.Theme.TextDefault.Transparency;
    local l_Color_1 = v29.Theme.BackgroundUIContrast.Color;
    local l_Transparency_1 = v29.Theme.BackgroundUIContrast.Transparency;
    local l_Color_2 = v29.Theme.TextDefault.Color;
    local v39 = v11(function(v38) --[[ Line: 51 ]]
        return v38.getPlatformAccountName();
    end);
    local v40 = v10({
        logInText = "Authentication.Login.Action.SignIn", 
        cvaluePlaceholder = v28.forceLoginByUsername and "Authentication.Login.Label.Username" or "Authentication.Login.Label.UsernameEmailPhone", 
        passwordPlaceholder = "CommonUI.Messages.Label.Password", 
        linkAccountText = {
            "Authentication.Login.Label.LinkAccountWarning"; 
            platform = v39 or "Console"
        }, 
        forgotText = "Authentication.Login.Action.ForgotPasswordOrUsernameQuestionCapitalized", 
        emailOtpButtonText = "Authentication.Login.Action.LogInEmailOneTimeCode"
    });
    local l_showLinkAccountText_0 = v28.showLinkAccountText;
    local v42 = v28.showDisclaimerLinks or v28.showDisclaimerButtons;
    local v43 = v28.isDualLayout and not v28.showCredentialHeader;
    local v44 = nil;
    local v45 = l_LoginView_0.textboxHeight * 2 + l_LoginView_0.loginContentsPadding;
    if v28.isDualLayout then
        v44 = l_LoginView_0.textboxLabelHeight;
        v45 = if v43 then (l_LoginView_0.textboxHeight + v44 + l_LoginView_0.textboxLabelPadding) * 2 + l_LoginView_0.loginContentsPadding else (l_LoginView_0.textboxHeight + v44) * 2 + l_LoginView_0.textboxLabelPadding + l_LoginView_0.loginContentsPadding;
    end;
    local v46 = if v28.isDualLayout then l_LoginView_0.textboxLabelPadding else nil;
    local l_textboxTextSize_0 = l_LoginView_0.textboxTextSize;
    local v48 = nil;
    if v28.isDualLayout and v28.isTenFootUiMode then
        local v49 = v28.localizedError or v28.localizedErrorMessage or "";
        v48 = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            ErrorText = if not v28.disableRegularLogin then v2.createElement(v16, {
                Size = UDim2.new(1, 0, 0, 0), 
                fitAxis = v13.FitAxis.Height, 
                AnchorPoint = Vector2.new(0, 0), 
                Text = v49, 
                Font = v29.Font.Footer.Font, 
                TextSize = if v28.isDualLayout then l_LoginView_0.errorTextSize else v29.Font.BaseSize * v29.Font.Footer.RelativeSize, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextColor3 = v17.Red, 
                TextWrapped = true, 
                BackgroundTransparency = 1
            }, {
                UISizeConstraint = v2.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(0, l_LoginView_0.loginContentsPadding)
                })
            }) else nil, 
            ErrorPadding = if v49 ~= "" then v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_LoginView_0.errorTextPadding), 
                PaddingBottom = UDim.new(0, l_LoginView_0.errorTextPadding)
            }) else nil
        });
    else
        v48 = if not v28.disableRegularLogin then v2.createElement(v16, {
            Size = UDim2.new(1, 0, 0, 0), 
            fitAxis = v13.FitAxis.Height, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Text = v28.localizedError or v28.localizedErrorMessage or "", 
            Font = v29.Font.Footer.Font, 
            TextSize = if v28.isDualLayout then v30.Global.FontSize_25 else v29.Font.BaseSize * v29.Font.Footer.RelativeSize, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextColor3 = v17.Red, 
            TextWrapped = true, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            UISizeConstraint = v2.createElement("UISizeConstraint", {
                MinSize = Vector2.new(0, l_LoginView_0.loginContentsPadding)
            })
        }) else nil;
    end;
    return v2.createElement(v13.FitFrame, {
        Size = UDim2.new(1, -l_LoginView_0.marginY, 0, 0), 
        fitAxis = v13.FitAxis.Height, 
        Position = UDim2.new(0.5, 0, 0, 0), 
        AnchorPoint = Vector2.new(0.5, 0), 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = if v28.showDisclaimerLinks then Enum.HorizontalAlignment.Center else nil
        }), 
        UISizeConstraint = if not v28.isDualLayout then v2.createElement("UISizeConstraint", {
            MinSize = Vector2.new(0, 0), 
            MaxSize = Vector2.new(v28.maxSizeX, 1e999)
        }) else nil, 
        UIPadding = if v28.isDualLayout then v2.createElement("UIPadding", {
            PaddingLeft = nil, 
            PaddingRight = if v28.isDualLayout then UDim.new(0, l_LoginView_0.credentialPaddingRight) else nil
        }) else nil, 
        TextBoxes = if not v28.disableRegularLogin then v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v45), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, l_LoginView_0.loginContentsPadding)
            }), 
            CredentialHeader = if v28.showCredentialHeader then v2.createElement("TextLabel", {
                Text = "<b>" .. v40.cvaluePlaceholder .. "</b>", 
                RichText = true, 
                Font = v29.Font.Body.Font, 
                TextSize = v29.Font.BaseSize * v29.Font.Body.RelativeSize, 
                TextColor3 = v29.Theme.TextEmphasis.Color, 
                TextTransparency = l_Transparency_0, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }) else nil, 
            CValue = v2.createElement(l_TextBoxStateWrapper_0, {
                LabelText = if v43 then v40.cvaluePlaceholder else nil, 
                TextBoxLabelPadding = v46, 
                TextBoxLabelTextSize = if v43 then v44 else nil, 
                ChildClass = l_GenericTextBox_0, 
                Size = UDim2.new(1, 0, 0, l_LoginView_0.textboxHeight), 
                LayoutOrder = 2, 
                buttonRef = v28.buttonRef, 
                ChildProps = {
                    Text = v28.cvalueText, 
                    PlaceholderText = v40.cvaluePlaceholder, 
                    Font = l_AppFonts_0.default:getDefault(), 
                    TextSize = l_textboxTextSize_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Color = l_Color_1, 
                    Transparency = l_Transparency_1, 
                    TextColor = l_Color_0, 
                    PlaceholderColor = l_Color_2, 
                    TextTransparency = l_Transparency_0, 
                    PaddingX = l_LoginView_0.textboxPaddingX, 
                    PaddingY = l_LoginView_0.textboxPaddingY, 
                    ClearTextOnFocus = false, 
                    TextBoxRef = v28.cvalueRef, 
                    LayoutOrder = 1, 
                    TextInputType = v28.usernameTextInputType, 
                    openTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil, 
                    ReturnKeyType = Enum.ReturnKeyType.Next, 
                    ManualFocusRelease = true, 
                    onChangeText = v28.onTextBoxesChanged, 
                    onReturnPressedFromOnScreenKeyboard = v28.onReturnPressedFromOnScreenKeyboardWhenFocusedOnCValue, 
                    onFocused = v28.cvalueTextBoxOnFocus, 
                    NextSelectionUp = v28.forgotLinkRef, 
                    NextSelectionDown = v28.passwordRef
                }
            }), 
            PasswordTextBox = v2.createElement(l_TextBoxStateWrapper_0, {
                LabelText = if v43 then v40.passwordPlaceholder else nil, 
                TextBoxLabelPadding = v46, 
                TextBoxLabelTextSize = if v43 then v44 else nil, 
                ChildClass = l_PasswordBox_0, 
                Size = UDim2.new(1, 0, 0, l_LoginView_0.textboxHeight), 
                LayoutOrder = 3, 
                ChildProps = {
                    Text = v28.passwordText, 
                    PlaceholderText = v40.passwordPlaceholder, 
                    TextSize = l_textboxTextSize_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Color = l_Color_1, 
                    Transparency = l_Transparency_1, 
                    TextColor = l_Color_0, 
                    PlaceholderColor = l_Color_2, 
                    TextTransparency = l_Transparency_0, 
                    PaddingX = l_LoginView_0.textboxPaddingX, 
                    PaddingY = l_LoginView_0.textboxPaddingY, 
                    ClearTextOnFocus = false, 
                    ManualFocusRelease = true, 
                    IsKeyboardOverlayUsed = v31.uiMode ~= l_UiMode_0.VR, 
                    ReturnKeyType = Enum.ReturnKeyType.Done, 
                    TextBoxRef = v28.passwordRef, 
                    onChangeText = v28.onTextBoxesChanged, 
                    onReturnPressedFromOnScreenKeyboard = v28.onReturnPressedFromOnScreenKeyboardWhenFocusedOnPassword, 
                    onFocused = v28.passwordTextBoxOnFocus, 
                    onToggleCallback = v28.passwordVisibilityToggleCallback, 
                    NextSelectionUp = v28.cvalueRef, 
                    NextSelectionDown = v28.loginButtonRef
                }
            })
        }) else nil, 
        ErrorText = v48, 
        ErrorPadding = if not v28.isDualLayout or l_showLinkAccountText_0 or v28.disableRegularLogin then nil else v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, l_LoginView_0.linkAccountPadding), 
            LayoutOrder = 10
        }), 
        LoginButton = if not v28.disableRegularLogin then v2.createElement(l_Button_0, {
            variant = l_ButtonVariant_0.SubEmphasis, 
            size = l_ButtonSize_0.Large, 
            text = v40.logInText, 
            isDisabled = v28.loginButtonDisabled, 
            isLoading = v28.isLoginInProgress, 
            onActivated = v28.onLoginButtonActivated, 
            NextSelectionUp = v28.passwordRef, 
            NextSelectionDown = v28.emailOtpEnabled and v28.emailOtpRef or v28.crossDeviceLoginEnabled and v28.crossDeviceButtonRef or v28.forgotLinkRef, 
            width = UDim.new(1, 0), 
            LayoutOrder = 20, 
            ref = v28.loginButtonRef
        }) else nil, 
        ForgotPasswordPadding = if v28.isDualLayout then v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, l_LoginView_0.loginContentsPadding), 
            LayoutOrder = 22
        }) else nil, 
        ForgotPasswordButton = if v28.isDualLayout then v2.createElement(l_Button_0, {
            variant = if v27 then l_ButtonVariant_0.Standard else l_ButtonVariant_0.Subtle, 
            size = l_ButtonSize_0.Large, 
            text = v40.forgotText, 
            onActivated = v28.onForgetButtonActivated, 
            width = UDim.new(1, 0), 
            LayoutOrder = 24
        }) else nil, 
        EmailOtpPadding = v28.emailOtpEnabled and v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, l_LoginView_0.loginContentsPadding), 
            LayoutOrder = 25
        }), 
        EmailOtpButton = v28.emailOtpEnabled and v2.createElement(l_Button_0, {
            variant = if v27 then l_ButtonVariant_0.Standard else l_ButtonVariant_0.Subtle, 
            size = l_ButtonSize_0.Large, 
            text = v40.emailOtpButtonText, 
            onActivated = v28.onEmailOtpActivated, 
            width = UDim.new(1, 0), 
            LayoutOrder = 26, 
            NextSelectionUp = v28.loginButtonRef or v28.crossDeviceButtonRef, 
            NextSelectionDown = v28.crossDeviceLoginEnabled and v28.crossDeviceButtonRef or v28.forgotLinkRef, 
            ref = v28.emailOtpRef
        }), 
        Padding = if not v28.crossDeviceLoginEnabled or v28.disableRegularLogin then nil else v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, l_LoginView_0.loginContentsPadding), 
            LayoutOrder = 30
        }), 
        CrossDeviceLoginButton = v28.crossDeviceLoginEnabled and if v28.loginWithExistingAccountVariantEnabled then v2.createElement(v19, {
            Text = v28.quickLoginButtonText, 
            Size = UDim2.new(1, 0, 0, l_LoginView_0.crossdeviceButtonHeight), 
            onActivated = v28.onCrossDeviceLoginActivated, 
            LayoutOrder = 40, 
            Font = v29.Font.Header2.Font, 
            NextSelectionUp = v28.emailOtpEnabled and v28.emailOtpRef or v28.loginButtonRef, 
            NextSelectionDown = v28.forgotLinkRef, 
            TextSize = l_LoginView_0.loginTextSize, 
            themeSettings = {
                Color = v30.Semantic.Color.Action.PrimaryBrand.Background.Color3, 
                Transparency = 0, 
                OnPressColor = v30.Semantic.Color.Action.PrimaryBrand.Background.Color3, 
                OnPressTransparency = 0.3, 
                Text = {
                    Color = v17.White, 
                    Transparency = 0
                }, 
                Border = {
                    Hidden = true, 
                    Transparency = 1
                }
            }, 
            [v2.Ref] = v28.crossDeviceButtonRef
        }) else v2.createElement(l_Button_0, {
            variant = if v27 then l_ButtonVariant_0.Standard else l_ButtonVariant_0.Subtle, 
            size = l_ButtonSize_0.Large, 
            text = v28.quickLoginButtonText, 
            onActivated = v28.onCrossDeviceLoginActivated, 
            width = UDim.new(1, 0), 
            LayoutOrder = 40, 
            NextSelectionUp = v28.emailOtpEnabled and v28.emailOtpRef or v28.loginButtonRef, 
            NextSelectionDown = v28.forgotLinkRef, 
            ref = v28.crossDeviceButtonRef
        }), 
        LinkAccountPadding = if l_showLinkAccountText_0 then v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, l_LoginView_0.linkAccountPadding), 
            LayoutOrder = 43
        }) else nil, 
        LinkAccountLabel = if l_showLinkAccountText_0 then v2.createElement("TextLabel", {
            Text = v40.linkAccountText, 
            TextSize = v30.Global.FontSize_25, 
            Font = v29.Font.Footer.Font, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextTransparency = v29.Theme.TextMuted.Transparency, 
            TextColor3 = v29.Theme.TextMuted.Color, 
            TextWrapped = true, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            LayoutOrder = 45
        }, {
            UISizeConstraint = v2.createElement("UISizeConstraint", {
                MinSize = Vector2.new(0, l_LoginView_0.loginContentsPadding)
            })
        }) else nil, 
        Forgot = if v28.showForgotButton then v2.createElement(l_LinkButton_0, {
            text = v40.forgotText, 
            size = UDim2.new(0, 0, 0, l_LoginView_0.forgotLinkHeight), 
            fontStyle = "CaptionSubHeader", 
            onActivated = v28.onForgetButtonActivated, 
            colorStyleDefault = "TextDefault", 
            colorStyleHover = "TextDefault", 
            layoutOrder = 48
        }) else nil, 
        DisclaimerPadding = if v42 then v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, l_LoginView_0.disclaimerPadding), 
            LayoutOrder = 50
        }) else nil, 
        DisclaimerLinks = if v42 then v2.createElement(v20, {
            isDualLayout = v28.showDisclaimerButtons, 
            LayoutOrder = 60
        }) else nil
    });
end;