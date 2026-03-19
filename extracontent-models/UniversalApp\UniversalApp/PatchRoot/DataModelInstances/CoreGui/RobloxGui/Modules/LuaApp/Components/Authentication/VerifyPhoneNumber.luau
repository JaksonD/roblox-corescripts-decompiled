local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_Common_0 = l_Modules_0.Common;
local v5 = require(l_Common_0.Roact);
local v6 = require(l_Common_0.RoactRodux);
local v7 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v9 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v10 = require(l_Modules_0.LuaApp.Components.AdjacentTextAndLink);
local v11 = require(l_Modules_0.LuaApp.Components.Authentication.FloodcheckTextAndLink);
local v12 = require(l_Modules_0.LuaApp.Components.Authentication.CodeBox);
local v13 = require(l_Modules_0.LuaApp.Actions.SetBackNavigationDisabled);
local v14 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v16 = require(l_Modules_0.LuaApp.FitChildren);
local v17 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v17.Style.withStyle;
local v19 = require(l_Modules_0.LuaApp.withLocalization);
local l_LinkButton_0 = v17.App.Button.LinkButton;
local v21 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v22 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v23 = require(l_Modules_0.LuaApp.Thunks.Authentication.GetVerifiedSignupChallenge);
local v24 = require(l_Modules_0.LuaApp.Thunks.Authentication.VerifyPhoneNumberCode);
local v25 = v5.PureComponent:extend("VerifyPhoneNumber");
local v26 = require(l_Modules_0.LuaApp.Components.OnScreenKeyboardWindow);
local v27 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v28 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v29 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local l_Images_0 = v17.App.ImageSet.Images;
local l_ImageSetButton_0 = v17.Core.ImageSet.ImageSetButton;
local v32 = UDim2.new(0, 36, 0, 36);
local v33 = l_Images_0["icons/navigation/close"];
local v34 = require(l_CorePackages_0.Packages.Foundation);
local l_Button_0 = v34.Button;
local l_ButtonVariant_0 = v34.Enums.ButtonVariant;
local l_ButtonSize_0 = v34.Enums.ButtonSize;
v25.defaultProps = {
    phoneNumber = ""
};
v25.init = function(v38) --[[ Line: 65 ]] --[[ Name: init ]]
    -- upvalues: v23 (copy), v21 (copy), l_UserInputService_0 (copy)
    v38:setState({
        errorText = "", 
        hasMadeTooManyResendCodeAttempts = false, 
        codeBoxesValue = "", 
        isContinuingInProgress = false, 
        challenge = v38.props.challenge
    });
    v38.updateIsContinuingInProgress = function(v39) --[[ Line: 74 ]]
        -- upvalues: v38 (copy)
        spawn(function() --[[ Line: 75 ]]
            -- upvalues: v38 (ref), v39 (copy)
            local l_isContinuingInProgress_0 = v38.state.isContinuingInProgress;
            if v38.isMounted and l_isContinuingInProgress_0 ~= v39 then
                v38:setState({
                    isContinuingInProgress = v39
                });
            end;
        end);
    end;
    v38.onResendButtonActivated = function() --[[ Line: 85 ]]
        -- upvalues: v38 (copy), v23 (ref), v21 (ref)
        if v38.state.isContinuingInProgress then
            return;
        else
            local l_networking_0 = v38.props.networking;
            local l_deliveryTarget_0 = v38.props.deliveryTarget;
            v23(l_networking_0, l_deliveryTarget_0):andThen(function(v43) --[[ Line: 92 ]]
                -- upvalues: v38 (ref)
                v38:setState({
                    challenge = v43.challenge
                });
            end, function(v44) --[[ Line: 96 ]]
                -- upvalues: v38 (ref)
                if v44 == "Authentication.TwoStepVerification.Response.TooManyAttempts" then
                    v38.props.showTooManyAttemptsErrorToast(v44);
                    v38:setState({
                        hasMadeTooManyResendCodeAttempts = true
                    });
                    return;
                else
                    v38.props.showErrorToast();
                    return;
                end;
            end);
            v38.props.authAnalytics.reportInteractWithAction(v21.Context.PhoneVerification, v21.Field.ResendCode, v21.ActionType.Click, "", "");
            return;
        end;
    end;
    v38.handlePhoneNumberVerificationSequence = function(v45) --[[ Line: 116 ]]
        -- upvalues: v38 (copy), l_UserInputService_0 (ref), v21 (ref)
        local l_networking_1 = v38.props.networking;
        local l_verifyCode_0 = v38.props.verifyCode;
        local l_setBackNavigationDisabled_0 = v38.props.setBackNavigationDisabled;
        local l_l_UserInputService_0_FocusedTextBox_0 = l_UserInputService_0:GetFocusedTextBox();
        if l_l_UserInputService_0_FocusedTextBox_0 ~= nil then
            l_l_UserInputService_0_FocusedTextBox_0:ReleaseFocus();
        end;
        l_setBackNavigationDisabled_0(true);
        l_verifyCode_0(l_networking_1, v45, v38.state.challenge):andThen(function(v50) --[[ Line: 127 ]]
            -- upvalues: l_setBackNavigationDisabled_0 (copy), v38 (ref)
            l_setBackNavigationDisabled_0(false);
            v38.props.verifyPhoneNumberCallback(v50.voucher);
            v38.props.closeAlert();
        end, function(v51) --[[ Line: 131 ]]
            -- upvalues: l_setBackNavigationDisabled_0 (copy), v38 (ref), v21 (ref)
            l_setBackNavigationDisabled_0(false);
            if v38.isMounted then
                v38:setState({
                    errorText = v51, 
                    codeBoxesValue = ""
                });
            end;
            if v51 == "Authentication.TwoStepVerification.Label.InvalidCode" then
                v38.props.authAnalytics.reportInteractWithAction(v21.Context.PhoneVerification, v21.Field.InvalidCode, v21.ActionType.Shown, "", "");
            end;
            v38.updateIsContinuingInProgress(false);
        end);
    end;
    v38.onContinueButtonActivated = function() --[[ Line: 155 ]]
        -- upvalues: v38 (copy), v21 (ref)
        if #v38.state.codeBoxesValue < 6 then
            return;
        elseif v38.state.isContinuingInProgress then
            return;
        else
            v38.updateIsContinuingInProgress(true);
            v38.handlePhoneNumberVerificationSequence(v38.state.codeBoxesValue);
            v38.props.authAnalytics.reportButtonClicked(v21.Context.PhoneVerification, v21.Button.Continue);
            return;
        end;
    end;
    v38.onUseEmailClicked = function() --[[ Line: 174 ]]
        -- upvalues: v38 (copy), v21 (ref)
        v38.props.closeAlert();
        v38.props.useEmailOptionClickedCallback();
        v38.props.authAnalytics.reportInteractWithAction(v21.Context.PhoneVerification, v21.Field.UseEmail, v21.ActionType.Click, "", "");
    end;
    v38.onFocusLost = function(_, v53, v54) --[[ Line: 186 ]]
        -- upvalues: v38 (copy)
        if v53 or v54 and v54.KeyCode == Enum.KeyCode.Return then
            v38.onContinueButtonActivated();
        end;
    end;
    v38.onValueChanged = function(v55) --[[ Line: 192 ]]
        -- upvalues: v38 (copy)
        if v38.state.codeBoxesValue == v55 or not v38.isMounted then
            return;
        else
            v38:setState({
                codeBoxesValue = v55, 
                errorText = ""
            });
            return;
        end;
    end;
    v38.invisibleTextBoxDidGainFocus = false;
    v38.onInvisibleTextBoxFocused = function(v56) --[[ Line: 203 ]]
        -- upvalues: v38 (copy), v21 (ref)
        if v38.state.isContinuingInProgress then
            v56:ReleaseFocus();
        end;
        if not v38.invisibleTextBoxDidGainFocus then
            v38.invisibleTextBoxDidGainFocus = true;
        end;
        v38.props.authAnalytics.reportInteractWithAction(v21.Context.PhoneVerification, v21.Field.VerificationCode, v21.ActionType.Focus, "", "");
    end;
end;
v25.didMount = function(v57) --[[ Line: 221 ]] --[[ Name: didMount ]]
    v57.isMounted = true;
end;
v25.willUnmount = function(v58) --[[ Line: 225 ]] --[[ Name: willUnmount ]]
    v58.isMounted = false;
    if v58.keyboardVisibleChanged then
        v58.keyboardVisibleChanged:disconnect();
        v58.keyboardVisibleChanged = nil;
    end;
end;
v25.render = function(v59) --[[ Line: 234 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v19 (copy), l_FormFactor_0 (copy), v5 (copy), v26 (copy), v16 (copy), l_ImageSetButton_0 (copy), v32 (copy), v33 (copy), l_AppFonts_0 (copy), l_LinkButton_0 (copy), v10 (copy), v11 (copy), v12 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy)
    local v60 = v59.state.errorText ~= "" and v59.state.errorText or nil;
    local l_hasMadeTooManyResendCodeAttempts_0 = v59.state.hasMadeTooManyResendCodeAttempts;
    local l_Number_0 = Enum.TextInputType.Number;
    pcall(function() --[[ Line: 239 ]]
        -- upvalues: l_Number_0 (ref)
        l_Number_0 = Enum.TextInputType.OneTimePassword;
    end);
    return l_withStyle_0(function(v63) --[[ Line: 246 ]]
        -- upvalues: v19 (ref), v60 (copy), v59 (copy), l_FormFactor_0 (ref), v5 (ref), v26 (ref), v16 (ref), l_ImageSetButton_0 (ref), v32 (ref), v33 (ref), l_AppFonts_0 (ref), l_LinkButton_0 (ref), v10 (ref), l_hasMadeTooManyResendCodeAttempts_0 (copy), v11 (ref), v12 (ref), l_Number_0 (ref), l_Button_0 (ref), l_ButtonVariant_0 (ref), l_ButtonSize_0 (ref)
        return v19({
            localizedError = v60, 
            verifyPhoneNumber = "Feature.VerificationUpsell.Label.VerifyPhoneNumber", 
            enterCode = "Feature.VerificationUpsell.Label.EnterCode", 
            changePhoneNumber = "Feature.VerificationUpsell.Action.ChangeNumber", 
            didNotReceive = "Authentication.TwoStepVerification.Label.DidNotReceive", 
            resend = "Authentication.TwoStepVerification.Label.Resend", 
            continueText = "Authentication.SignUp.Label.Continue", 
            codeBoxPlaceholder = "Authentication.TwoStepVerification.Label.CodeInputPlaceholderText", 
            useEmail = "Feature.VerificationUpsell.Action.UserEmail"
        })(function(v64) --[[ Line: 257 ]]
            -- upvalues: v59 (ref), l_FormFactor_0 (ref), v63 (copy), v5 (ref), v26 (ref), v16 (ref), l_ImageSetButton_0 (ref), v32 (ref), v33 (ref), l_AppFonts_0 (ref), l_LinkButton_0 (ref), v10 (ref), l_hasMadeTooManyResendCodeAttempts_0 (ref), v11 (ref), v12 (ref), l_Number_0 (ref), v60 (ref), l_Button_0 (ref), l_ButtonVariant_0 (ref), l_ButtonSize_0 (ref)
            local v65 = v59.props.formFactor == l_FormFactor_0.WIDE;
            local v66 = #v59.state.codeBoxesValue == 6;
            local v67 = 1;
            local v68 = UDim2.new(0, 0, 0.5, 0);
            local v69 = Vector2.new(0, 0.5);
            if not v65 then
                v67 = v63.Theme.BackgroundDefault.Transparency;
                v68 = UDim2.new(0, 0, 1, 0);
                v69 = Vector2.new(0, 1);
            end;
            return v5.createElement(v26, {
                Contents = {
                    UISizeConstraint = v65 and v5.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(400, 1e999)
                    }) or nil, 
                    VerifyPhoneNumberContents = v5.createElement(v16.FitImageLabel, {
                        Size = UDim2.new(1, 0, 0, 0), 
                        fitAxis = v16.FitAxis.Height, 
                        Position = v68, 
                        BackgroundColor3 = v63.Theme.BackgroundDefault.Color, 
                        BackgroundTransparency = v67, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(9, 9, 9, 9), 
                        Image = "LuaApp/buttons/buttonFill", 
                        ImageColor3 = v63.Theme.BackgroundDefault.Color, 
                        ImageTransparency = v63.Theme.BackgroundDefault.Transparency, 
                        BorderSizePixel = 0, 
                        AnchorPoint = v69, 
                        Visible = true
                    }, {
                        UIListLayout = v5.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center
                        }), 
                        HeaderFrame = v5.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, 0), 
                            BackgroundTransparency = 1
                        }, {
                            BackButton = v5.createElement(l_ImageSetButton_0, {
                                Size = v32, 
                                AutoButtonColor = false, 
                                BorderSizePixel = 0, 
                                BackgroundTransparency = 1, 
                                Position = UDim2.new(0, 10, 0, -35), 
                                AnchorPoint = Vector2.new(0, 0), 
                                ScaleType = Enum.ScaleType.Fit, 
                                Image = v33, 
                                ImageColor3 = v63.Theme.UIEmphasis.Color, 
                                [v5.Event.Activated] = v59.props.closeAlert
                            })
                        }), 
                        Header = v5.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, 48), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            LayoutOrder = 1
                        }, {
                            TextLabel = v5.createElement("TextLabel", {
                                Size = UDim2.new(1, -40, 0, 28), 
                                Position = UDim2.new(0, 20, 0.5, 0), 
                                AnchorPoint = Vector2.new(0, 0.5), 
                                TextSize = 20, 
                                BackgroundTransparency = 1, 
                                TextColor3 = Color3.new(1, 1, 1), 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                Font = l_AppFonts_0.default:getBold(), 
                                Text = v64.verifyPhoneNumber
                            }), 
                            LinkButton = v5.createElement(l_LinkButton_0, {
                                fontStyle = "Footer", 
                                size = UDim2.fromScale(0, 1), 
                                text = v64.useEmail, 
                                colorStyleDefault = "TextEmphasis", 
                                colorStyleHover = "TextEmphasis", 
                                onActivated = v59.onUseEmailClicked, 
                                position = UDim2.new(0.7, 0, 0.05, 0)
                            })
                        }), 
                        Messages = v5.createElement(v16.FitFrame, {
                            Size = UDim2.new(1, 0, 0, 81), 
                            fitAxis = v16.FitAxis.Height, 
                            AnchorPoint = Vector2.new(0.5, 0), 
                            BackgroundColor3 = v63.Theme.BackgroundMuted.Color or Color3.new(0.09411764705882353, 0.09803921568627451, 0.10588235294117647), 
                            BorderSizePixel = 0, 
                            LayoutOrder = 2
                        }, {
                            UIListLayout = v5.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                Padding = UDim.new(0, 10)
                            }), 
                            UIPadding = v5.createElement("UIPadding", {
                                PaddingTop = UDim.new(0, 10), 
                                PaddingBottom = UDim.new(0, 10), 
                                PaddingLeft = UDim.new(0, 20), 
                                PaddingRight = UDim.new(0, 20)
                            }), 
                            Help = v5.createElement(v10, {
                                LayoutOrder = 2, 
                                fontStyle = "Footer", 
                                Width = UDim.new(1, 0), 
                                AnchorPoint = Vector2.new(0, 0.5), 
                                textLabelColor = v63.Theme.TextDefault.Color, 
                                textLabelText = string.gsub(v64.enterCode, "{phoneNumber}", v59.props.phoneNumber), 
                                linkColorStyle = "TextEmphasis", 
                                linkText = v64.changePhoneNumber, 
                                onActivated = v59.props.closeAlert
                            }), 
                            Resend = not l_hasMadeTooManyResendCodeAttempts_0 and v5.createElement(v11, {
                                LayoutOrder = 3, 
                                fontStyle = "Footer", 
                                Width = UDim.new(1, 0), 
                                textLabelColor = v63.Theme.TextDefault.Color, 
                                textLabelText = v64.didNotReceive, 
                                linkColorStyle = "TextEmphasis", 
                                linkText = v64.resend, 
                                textButtonEnabled = not v59.state.isContinuingInProgress, 
                                onActivated = v59.onResendButtonActivated
                            }), 
                            TryEmail = l_hasMadeTooManyResendCodeAttempts_0 and v5.createElement(v11, {
                                LayoutOrder = 3, 
                                fontStyle = "Footer", 
                                Width = UDim.new(1, 0), 
                                textLabelColor = v63.Theme.TextDefault.Color, 
                                textLabelText = v64.didNotReceive, 
                                linkColorStyle = "TextEmphasis", 
                                linkText = v64.useEmail, 
                                textButtonEnabled = not v59.state.isContinuingInProgress, 
                                onActivated = v59.onUseEmailClicked
                            })
                        }), 
                        Form = v5.createElement(v16.FitFrame, {
                            Size = UDim2.new(1, 0, 0, 0), 
                            fitAxis = v16.FitAxis.Height, 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 3
                        }, {
                            UIListLayout = v5.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                Padding = UDim.new(0, 10)
                            }), 
                            UIPadding = v5.createElement("UIPadding", {
                                PaddingTop = UDim.new(0, 15), 
                                PaddingBottom = UDim.new(0, 15), 
                                PaddingLeft = UDim.new(0, 20), 
                                PaddingRight = UDim.new(0, 20)
                            }), 
                            CodeBoxesAndErrorContainer = v5.createElement(v16.FitFrame, {
                                Size = UDim2.new(1, 0, 0, 0), 
                                fitAxis = v16.FitAxis.Height, 
                                BackgroundTransparency = 1, 
                                LayoutOrder = 1
                            }, {
                                UIListLayout = v5.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Vertical, 
                                    SortOrder = Enum.SortOrder.LayoutOrder, 
                                    Padding = UDim.new(0, 5)
                                }), 
                                CodeBoxes = v5.createElement(v12, {
                                    characterCount = 6, 
                                    PlaceholderText = string.gsub(v64.codeBoxPlaceholder, "{.-}", 6), 
                                    LayoutOrder = 1, 
                                    TextInputType = l_Number_0, 
                                    textFilter = "%D", 
                                    errorState = v60 ~= nil, 
                                    shouldFocus = not v59.state.isContinuingInProgress, 
                                    onFocused = v59.onInvisibleTextBoxFocused, 
                                    onFocusLost = v59.onFocusLost, 
                                    onValueChanged = v59.onValueChanged, 
                                    ManualFocusRelease = true
                                }), 
                                ErrorText = v60 and v5.createElement("TextLabel", {
                                    Size = UDim2.new(1, 0, 0, 17), 
                                    Text = v64.localizedError or "", 
                                    Font = l_AppFonts_0.default:getDefault(), 
                                    TextSize = 12, 
                                    TextXAlignment = Enum.TextXAlignment.Left, 
                                    TextYAlignment = Enum.TextYAlignment.Center, 
                                    TextColor3 = Color3.new(0.9686274509803922, 0.29411764705882354, 0.3215686274509804), 
                                    BackgroundTransparency = 1, 
                                    LayoutOrder = 2
                                })
                            }), 
                            ContinueButton = v5.createElement(l_Button_0, {
                                variant = l_ButtonVariant_0.SubEmphasis, 
                                size = l_ButtonSize_0.Large, 
                                text = v64.continueText, 
                                isDisabled = not v66, 
                                isLoading = v59.state.isContinuingInProgress, 
                                onActivated = v59.onContinueButtonActivated, 
                                width = UDim.new(1, 0), 
                                LayoutOrder = 3
                            })
                        })
                    })
                }
            });
        end);
    end);
end;
v25 = l_RoactServices_0.connect({
    networking = v7, 
    authAnalytics = v9
})(v25);
return (v6.connect(function(v70, _) --[[ Line: 481 ]]
    return {
        formFactor = v70.FormFactor
    };
end, function(v72) --[[ Line: 485 ]]
    -- upvalues: v13 (copy), v24 (copy), v14 (copy), v22 (copy), v28 (copy), v27 (copy), v29 (copy)
    return {
        setBackNavigationDisabled = function(v73) --[[ Line: 487 ]] --[[ Name: setBackNavigationDisabled ]]
            -- upvalues: v72 (copy), v13 (ref)
            return v72(v13(v73));
        end, 
        verifyCode = function(v74, v75, v76) --[[ Line: 490 ]] --[[ Name: verifyCode ]]
            -- upvalues: v72 (copy), v24 (ref)
            return v72(v24(v74, v75, v76));
        end, 
        navigateToPage = function(v77) --[[ Line: 493 ]] --[[ Name: navigateToPage ]]
            -- upvalues: v72 (copy), v14 (ref)
            return v72(v14(v77));
        end, 
        closeAlert = function() --[[ Line: 496 ]] --[[ Name: closeAlert ]]
            -- upvalues: v72 (copy), v22 (ref)
            return v72(v22());
        end, 
        showTooManyAttemptsErrorToast = function(v78) --[[ Line: 499 ]] --[[ Name: showTooManyAttemptsErrorToast ]]
            -- upvalues: v72 (copy), v28 (ref), v27 (ref)
            return v72(v28({
                toastType = v27.NetworkingError, 
                toastMessage = v78
            }));
        end, 
        showErrorToast = function() --[[ Line: 505 ]] --[[ Name: showErrorToast ]]
            -- upvalues: v72 (copy), v29 (ref)
            return v72(v29({
                HttpError = Enum.HttpError.OK
            }));
        end
    };
end)(v25));