local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountRecovery");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UIBlox);
local v6 = require(l_Parent_0.AppBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_FullscreenPageWithSafeArea_0 = v6.FullscreenPageWithSafeArea;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_StyledTextLabel_0 = v5.App.Text.StyledTextLabel;
local v15 = require(l_Parent_0.Foundation);
local l_Text_0 = v15.Text;
local l_TextInput_0 = v15.TextInput;
local l_Button_0 = v15.Button;
local l_ButtonVariant_0 = v15.Enums.ButtonVariant;
local l_InputSize_0 = v15.Enums.InputSize;
local l_useTokens_0 = v15.Hooks.useTokens;
local l_ScrollView_0 = v15.ScrollView;
local l_Visibility_0 = v15.Enums.Visibility;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_GetFFlagEnableContinueRecovery_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableContinueRecovery;
local l_useClearFocusOnUnmount_0 = require(l_script_FirstAncestor_0.Hooks).useClearFocusOnUnmount;
local v27 = require(l_script_FirstAncestor_0.Store.AccountRecoveryContext);
local v28 = require(l_script_FirstAncestor_0.Thunks.VerifyCode);
local v29 = require(l_script_FirstAncestor_0.Thunks.ResendCode);
local _ = require(l_script_FirstAncestor_0.Common.AccountRecoveryRequestTypes);
local v31 = require(l_script_FirstAncestor_0.Components.Constants);
local v32 = require(l_script_FirstAncestor_0.Components.RecoveryHeader);
local v33 = require(l_script_FirstAncestor_0.Enums.ContactMethodType);
local v34 = require(l_script_FirstAncestor_0.Components.UserHeader);
local v35 = require(l_script_FirstAncestor_0.Enums.IdentifierType);
local v36 = require(l_script_FirstAncestor_0.Enums.AccountRecoveryPageState);
local v37 = require(l_script_FirstAncestor_0.Enums.RecoveryState);
local v38 = require(l_script_FirstAncestor_0.Components.getModal);
local v39 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableSkipPasswordReset);
return function(v40) --[[ Line: 60 ]]
    -- upvalues: v4 (copy), v27 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), l_useDesignTokens_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v31 (copy), l_useClearFocusOnUnmount_0 (copy), v35 (copy), v28 (copy), l_UserInputService_0 (copy), v37 (copy), v36 (copy), v39 (copy), l_Logger_0 (copy), l_HttpService_0 (copy), l_GetFFlagEnableContinueRecovery_0 (copy), v29 (copy), l_useLocalization_0 (copy), v33 (copy), l_FullscreenPageWithSafeArea_0 (copy), v32 (copy), l_ScrollView_0 (copy), l_Visibility_0 (copy), v34 (copy), l_Text_0 (copy), l_StyledTextLabel_0 (copy), l_TextInput_0 (copy), l_InputSize_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), v38 (copy)
    local v41 = v4.useContext(v27);
    local v42 = l_useStyle_0();
    local v43 = l_useTokens_0();
    local v44 = l_useDesignTokens_0();
    local v45 = l_useDispatch_0();
    local v46 = l_useRoactService_0(l_RoactNetworking_0);
    local v47, v48 = v4.useState("");
    local v49, v50 = v4.useState("");
    local v51, v52 = v4.useState(true);
    local v53, v54 = v4.useState(false);
    local v55, v56 = v4.useState(v31.SecondsBetweenResends);
    local v57, v58 = v4.useState(nil);
    local v59, v60 = v4.useState("");
    local v61, v62 = v4.useState("");
    local v63, v64 = v4.useState(false);
    local v65, v66 = v4.useState(Vector2.new(0, 0));
    l_useClearFocusOnUnmount_0();
    local v67 = false;
    local v68 = 0;
    local v69 = "";
    local v70 = "";
    local v71 = "";
    local v72 = v40.navigation.getParam("identifierInfo");
    if v72.identifierType == v35.Username then
        v67 = true;
        v68 = v72.userId;
        v69 = v72.username;
        v70 = v72.displayName;
    else
        v67 = false;
        v71 = v72.contactMethod;
    end;
    local v73 = v40.navigation.getParam("contactMethodNumber") or 0;
    v4.useEffect(function() --[[ Line: 102 ]]
        -- upvalues: v51 (copy), v56 (copy), v54 (copy), v52 (copy), v58 (copy), v57 (copy)
        local function v76() --[[ Line: 103 ]] --[[ Name: updateTimer ]]
            -- upvalues: v51 (ref), v56 (ref), v54 (ref), v52 (ref)
            while v51 do
                task.wait(1);
                v56(function(v74) --[[ Line: 106 ]]
                    -- upvalues: v54 (ref), v52 (ref)
                    local v75 = v74 - 1;
                    if v75 <= 0 then
                        v54(true);
                        v52(false);
                        return 0;
                    else
                        return v75;
                    end;
                end);
            end;
        end;
        if v51 then
            local v77 = task.spawn(v76);
            v58(v77);
        end;
        return function() --[[ Line: 124 ]]
            -- upvalues: v52 (ref), v57 (ref)
            v52(false);
            if v57 then
                task.cancel(v57);
            end;
        end;
    end, {
        v51
    });
    local function _() --[[ Line: 132 ]] --[[ Name: resetTimer ]]
        -- upvalues: v54 (copy), v56 (copy), v31 (ref), v51 (copy), v52 (copy), v57 (copy)
        v54(false);
        v56(v31.SecondsBetweenResends);
        if v51 then
            v52(false);
            if v57 then
                task.cancel(v57);
            end;
        end;
        v52(true);
    end;
    local function _(v79, v80) --[[ Line: 144 ]]
        -- upvalues: v45 (copy), v28 (ref), v46 (copy), v73 (copy)
        return v45(v28(v46, {
            recoverySessionId = v79, 
            code = v80, 
            contactMethodNumber = v73
        }));
    end;
    local function _() --[[ Line: 152 ]]
        -- upvalues: l_UserInputService_0 (ref)
        local l_l_UserInputService_0_FocusedTextBox_0 = l_UserInputService_0:GetFocusedTextBox();
        if l_l_UserInputService_0_FocusedTextBox_0 then
            l_l_UserInputService_0_FocusedTextBox_0:ReleaseFocus();
        end;
    end;
    local function v87(v84, v85, v86) --[[ Line: 159 ]]
        -- upvalues: v31 (ref), v37 (ref), v40 (copy), v36 (ref), v73 (copy), v41 (copy), v39 (ref), v69 (ref)
        if v85 == nil then
            v86(v31.UnknownErrorKey);
            return;
        elseif v85.recoveryState == v37.RECOVERY_STATE_CONTACT_METHOD_VERIFICATION_REQUIRED then
            v40.navigation.navigate(v36.SendCodeScreen, {
                userID = v84, 
                isSecondContactMethodVerification = true, 
                previousRecoveryMethod = v85.previousRecoveryMethod, 
                previousRecoveryMethodTypes = v85.previousRecoveryMethodTypes
            });
            return;
        elseif v85.recoveryState == v37.RECOVERY_STATE_ACCOUNT_VERIFIED then
            if v73 == 0 and v41.state.recover2sv then
                v40.navigation.replace(v36.AccountVerifiedConfirmationScreen, {
                    userID = v84
                });
                return;
            elseif v39() and v41.state.recover2sv and not v41.state.recoverPassword then
                v41.utils.handleUpdatePassword(v41.state.recoverySessionId, v84, v69, "", "", v86, v41.utils.launchAppOrGoBack);
                return;
            else
                v40.navigation.replace(v36.ChooseAccountScreen, {
                    userID = v84
                });
                return;
            end;
        elseif v85.recoveryState == v37.RECOVERY_STATE_AWAITING_REEVALUATION then
            v40.navigation.navigate(v36.CannotRecoverAccountScreen, {
                userID = v84
            });
            return;
        else
            v86(v31.UnknownErrorKey);
            return;
        end;
    end;
    v4.useEffect(function() --[[ Line: 215 ]]
        -- upvalues: v47 (copy), v31 (ref), v64 (copy), l_UserInputService_0 (ref), v50 (copy), v41 (copy), v45 (copy), v28 (ref), v46 (copy), v73 (copy), l_Logger_0 (ref), l_HttpService_0 (ref), v62 (copy), l_GetFFlagEnableContinueRecovery_0 (ref), v67 (ref), v40 (copy), v36 (ref), v68 (ref), v70 (ref), v69 (ref), v87 (copy)
        if #v47 == v31.VerificationCodeLength then
            v64(true);
            local l_l_UserInputService_0_FocusedTextBox_1 = l_UserInputService_0:GetFocusedTextBox();
            if l_l_UserInputService_0_FocusedTextBox_1 then
                l_l_UserInputService_0_FocusedTextBox_1:ReleaseFocus();
            end;
            v50(v47);
            local l_recoverySessionId_0 = v41.state.recoverySessionId;
            local l_v47_0 = v47;
            v45(v28(v46, {
                recoverySessionId = l_recoverySessionId_0, 
                code = l_v47_0, 
                contactMethodNumber = v73
            })):andThen(function(v91) --[[ Line: 222 ]]
                -- upvalues: l_Logger_0 (ref), l_HttpService_0 (ref), v62 (ref), v31 (ref), v64 (ref), l_GetFFlagEnableContinueRecovery_0 (ref), v67 (ref), v40 (ref), v36 (ref), v68 (ref), v70 (ref), v69 (ref), v73 (ref), v41 (ref), v87 (ref)
                if v91.isError then
                    l_Logger_0:warning("Error verifying code: {}", l_HttpService_0:JSONEncode(v91));
                    v62(v91.errorKey or v31.UnknownErrorKey);
                    v64(false);
                    return;
                elseif l_GetFFlagEnableContinueRecovery_0() and v67 then
                    local function v93(_) --[[ Line: 230 ]]
                        -- upvalues: v40 (ref), v36 (ref), v68 (ref), v70 (ref), v69 (ref), v73 (ref)
                        v40.navigation.replace(v36.ContinueFallbackScreen, {
                            userID = v68, 
                            displayName = v70, 
                            username = v69, 
                            didAbandon2SV = false, 
                            contactMethodNumber = v73
                        });
                    end;
                    v41.utils.handleContinueRecovery(v41.state.recoverySessionId, v68, function(v94) --[[ Line: 242 ]]
                        -- upvalues: v87 (ref), v68 (ref), v93 (copy)
                        v87(v68, v94, v93);
                    end, v93, function() --[[ Line: 246 ]]
                        -- upvalues: v40 (ref), v36 (ref), v68 (ref), v70 (ref), v69 (ref), v73 (ref)
                        v40.navigation.replace(v36.ContinueFallbackScreen, {
                            userID = v68, 
                            displayName = v70, 
                            username = v69, 
                            didAbandon2SV = true, 
                            contactMethodNumber = v73
                        });
                    end);
                    return;
                else
                    v40.navigation.replace(v36.ChooseAccountScreen, {
                        userID = v68
                    });
                    v64(false);
                    return;
                end;
            end):finally(function() --[[ Line: 263 ]]
                -- upvalues: v50 (ref)
                v50("");
            end);
        end;
    end, {
        v47
    });
    local function _() --[[ Line: 269 ]]
        -- upvalues: v45 (copy), v29 (ref), v46 (copy), v41 (copy), v73 (copy)
        return v45(v29(v46, {
            recoverySessionId = v41.state.recoverySessionId, 
            contactMethodNumber = v73
        }));
    end;
    local function _() --[[ Line: 275 ]]
        -- upvalues: v45 (copy), v29 (ref), v46 (copy), v41 (copy), v73 (copy), l_Logger_0 (ref), l_HttpService_0 (ref), v60 (copy), v31 (ref)
        return v45(v29(v46, {
            recoverySessionId = v41.state.recoverySessionId, 
            contactMethodNumber = v73
        })):andThen(function(v96) --[[ Line: 276 ]]
            -- upvalues: l_Logger_0 (ref), l_HttpService_0 (ref), v60 (ref), v31 (ref)
            if v96.isError then
                l_Logger_0:warning("Error resending code: {}", l_HttpService_0:JSONEncode(v96));
                v60(v96.errorKey or v31.UnknownErrorKey);
                return;
            else
                return;
            end;
        end);
    end;
    local function v99(v98) --[[ Line: 285 ]]
        -- upvalues: v65 (copy), v66 (copy)
        if v65 ~= v98.AbsoluteSize then
            v66(v98.AbsoluteSize);
        end;
    end;
    local v100 = l_useLocalization_0({
        recoveryHeadingText = "Authentication.AccountRecovery.Heading.RobloxAccountRecovery", 
        emailCodeSentText = "Authentication.AccountRecovery.Description.EmailCodeSent", 
        emailCodeSentForUserText = "Authentication.AccountRecovery.Description.EmailCodeSentForUser", 
        phoneCodeSentText = "Authentication.AccountRecovery.Description.PhoneCodeSent", 
        phoneCodeSentForUserText = "Authentication.AccountRecovery.Description.PhoneCodeSentForUser", 
        enterCodeText = "Authentication.AccountRecovery.Label.EnterCode", 
        resendCodeTimerText = {
            "Authentication.AccountRecovery.Label.ResendCodeTimer"; 
            timeLeft = ("%*"):format(v55)
        }, 
        resendCodeText = "Authentication.AccountRecovery.Label.ResendCode", 
        codeErrorText = if v61 ~= "" then v61 else nil, 
        resendErrorText = if v59 ~= "" then v59 else nil
    });
    local v101 = "";
    if v72.contactMethodType == v33.Email then
        v101 = v67 and v100.emailCodeSentForUserText or v100.emailCodeSentText;
    elseif v72.contactMethodType == v33.Phone then
        v101 = v67 and v100.phoneCodeSentForUserText or v100.phoneCodeSentText;
    end;
    return v4.createElement(l_FullscreenPageWithSafeArea_0, {
        includeStatusBar = true, 
        BackgroundColor3 = v42.Theme.BackgroundDefault.Color
    }, {
        UIPadding = v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v44.Global.Space_100), 
            PaddingLeft = UDim.new(0, v44.Global.Space_150), 
            PaddingRight = UDim.new(0, v44.Global.Space_150), 
            PaddingBottom = UDim.new(0, v44.Global.Space_100)
        }), 
        Wrapper = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            Header = v4.createElement(v32, {
                LayoutOrder = 1, 
                onBackActivated = function() --[[ Line: 337 ]] --[[ Name: onBackActivated ]]
                    -- upvalues: v40 (copy)
                    v40.navigation.goBack();
                end, 
                backButtonDisabled = v63, 
                recoveryHeadingText = v100.recoveryHeadingText, 
                currentComponent = "resendOrVerifyCode", 
                recoverySessionId = v41.state.recoverySessionId
            }), 
            Content = v4.createElement("Frame", {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                UIListLayout = v4.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                PreScrollContent = v4.createElement("Frame", {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    [v4.Change.AbsoluteSize] = v99
                }, {
                    UIPadding = v4.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v44.Global.Space_100), 
                        PaddingRight = UDim.new(0, v44.Global.Space_100)
                    }), 
                    UIListLayout = v4.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        Padding = UDim.new(0, v44.Global.Space_20)
                    }), 
                    RecoveryHeadingSpacing = v4.createElement("Frame", {
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, v44.Global.Space_250), 
                        BackgroundTransparency = 1
                    })
                }), 
                InputsOverflowScrollView = v4.createElement(l_ScrollView_0, {
                    LayoutOrder = 2, 
                    scroll = {
                        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                        CanvasSize = UDim2.new(1, 0, 0, 0), 
                        ScrollingDirection = Enum.ScrollingDirection.Y, 
                        scrollBarVisibility = l_Visibility_0.Always
                    }, 
                    Size = UDim2.new(1, 0, 1, -v65.Y)
                }, {
                    UIPadding = v4.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v44.Global.Space_100), 
                        PaddingRight = UDim.new(0, v44.Global.Space_100)
                    }), 
                    UIListLayout = v4.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        Padding = UDim.new(0, v44.Global.Space_20)
                    }), 
                    UserHeader = v67 and v4.createElement(v34, {
                        LayoutOrder = 2, 
                        userId = ("%*"):format(v68), 
                        displayName = v70, 
                        username = v69
                    }), 
                    ContactMethodHeader = not v67 and v4.createElement(l_Text_0, {
                        Text = v71, 
                        LayoutOrder = 3, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        fontStyle = v43.Typography.HeadingSmall, 
                        textStyle = v43.Color.Content.Emphasis, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center
                    }), 
                    HeaderSpacing = v4.createElement("Frame", {
                        LayoutOrder = 4, 
                        Size = UDim2.new(1, 0, 0, v43.Size.Size_400), 
                        BackgroundTransparency = 1
                    }), 
                    BodyText = v4.createElement(l_Text_0, {
                        LayoutOrder = 5, 
                        Text = v101, 
                        TextWrapped = true, 
                        fontStyle = v43.Typography.BodyMedium, 
                        textStyle = v43.Color.Content.Default, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center
                    }), 
                    BodyTextSpacing = v4.createElement("Frame", {
                        LayoutOrder = 6, 
                        Size = UDim2.new(1, 0, 0, v44.Global.Space_150), 
                        BackgroundTransparency = 1
                    }), 
                    EnterCodeLabel = v4.createElement(l_StyledTextLabel_0, {
                        layoutOrder = 7, 
                        text = v100.enterCodeText, 
                        fontStyle = v43.Typography.TitleMedium, 
                        colorStyle = v42.Theme.TextEmphasis, 
                        automaticSize = Enum.AutomaticSize.XY
                    }), 
                    EnterCodeLabelSpacing = v4.createElement("Frame", {
                        LayoutOrder = 8, 
                        Size = UDim2.new(1, 0, 0, v44.Global.Space_50), 
                        BackgroundTransparency = 1
                    }), 
                    EnterCodeField = v4.createElement(l_TextInput_0, {
                        LayoutOrder = 9, 
                        text = v49, 
                        label = "", 
                        width = UDim.new(1, 0), 
                        textInputType = Enum.TextInputType.OneTimePassword, 
                        onChanged = function(v102) --[[ Line: 453 ]] --[[ Name: onChanged ]]
                            -- upvalues: v61 (copy), v62 (copy), v48 (copy)
                            if v61 ~= "" then
                                v62("");
                            end;
                            v48(v102);
                        end, 
                        isDisabled = v63, 
                        size = l_InputSize_0.Medium
                    }), 
                    ErrorTextSpacing = v4.createElement("Frame", {
                        LayoutOrder = 10, 
                        Size = UDim2.new(1, 0, 0, v43.Size.Size_200), 
                        BackgroundTransparency = 1
                    }), 
                    ErrorTextLabel = v4.createElement(l_Text_0, {
                        Text = v100.codeErrorText or "", 
                        fontStyle = v43.Typography.CaptionSmall, 
                        textStyle = v43.Color.System.Alert, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        LayoutOrder = 11
                    }), 
                    ResendCodeButtonSpacing = v4.createElement("Frame", {
                        LayoutOrder = 12, 
                        Size = UDim2.new(1, 0, 0, v43.Size.Size_300), 
                        BackgroundTransparency = 1
                    }), 
                    ResendCodeButton = v4.createElement(l_Button_0, {
                        LayoutOrder = 13, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        size = l_InputSize_0.Medium, 
                        text = v53 and v100.resendCodeText or v100.resendCodeTimerText, 
                        width = UDim.new(1, 0), 
                        onActivated = function() --[[ Line: 489 ]] --[[ Name: onActivated ]]
                            -- upvalues: v45 (copy), v29 (ref), v46 (copy), v41 (copy), v73 (copy), l_Logger_0 (ref), l_HttpService_0 (ref), v60 (copy), v31 (ref), v54 (copy), v56 (copy), v51 (copy), v52 (copy), v57 (copy)
                            local _ = v45(v29(v46, {
                                recoverySessionId = v41.state.recoverySessionId, 
                                contactMethodNumber = v73
                            })):andThen(function(v103) --[[ Line: 276 ]]
                                -- upvalues: l_Logger_0 (ref), l_HttpService_0 (ref), v60 (ref), v31 (ref)
                                if v103.isError then
                                    l_Logger_0:warning("Error resending code: {}", l_HttpService_0:JSONEncode(v103));
                                    v60(v103.errorKey or v31.UnknownErrorKey);
                                    return;
                                else
                                    return;
                                end;
                            end);
                            v54(false);
                            v56(v31.SecondsBetweenResends);
                            if v51 then
                                v52(false);
                                if v57 then
                                    task.cancel(v57);
                                end;
                            end;
                            v52(true);
                        end, 
                        isDisabled = not v53 or v63
                    }), 
                    ResendErrorTextSpacing = v4.createElement("Frame", {
                        LayoutOrder = 14, 
                        Size = UDim2.new(1, 0, 0, v43.Size.Size_200), 
                        BackgroundTransparency = 1
                    }), 
                    ResendErrorTextLabel = v4.createElement(l_Text_0, {
                        Text = v100.resendErrorText or "", 
                        fontStyle = v43.Typography.CaptionSmall, 
                        textStyle = v43.Color.System.Alert, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        LayoutOrder = 15
                    }), 
                    Modal = v39() and v38(v41.state.modalStateAndProps)
                })
            })
        })
    });
end;