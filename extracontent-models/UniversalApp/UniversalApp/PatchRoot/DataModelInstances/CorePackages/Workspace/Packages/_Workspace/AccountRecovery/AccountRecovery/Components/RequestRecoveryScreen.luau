local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountRecovery");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.AppBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_FullscreenPageWithSafeArea_0 = v5.FullscreenPageWithSafeArea;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_StyledTextLabel_0 = v4.App.Text.StyledTextLabel;
local v14 = require(l_Parent_0.Foundation);
local l_Text_0 = v14.Text;
local l_TextInput_0 = v14.TextInput;
local l_Button_0 = v14.Button;
local l_ButtonVariant_0 = v14.Enums.ButtonVariant;
local l_InputSize_0 = v14.Enums.InputSize;
local l_Divider_0 = v14.Divider;
local l_DividerVariant_0 = v14.Enums.DividerVariant;
local l_Orientation_0 = v14.Enums.Orientation;
local l_useTokens_0 = v14.Hooks.useTokens;
local l_Loading_0 = v14.Loading;
local l_IconSize_0 = v14.Enums.IconSize;
local l_ScrollView_0 = v14.ScrollView;
local l_Visibility_0 = v14.Enums.Visibility;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_useClearFocusOnUnmount_0 = require(l_script_FirstAncestor_0.Hooks).useClearFocusOnUnmount;
local l_GetUserByUsername_0 = require(l_Parent_0.AuthCommon).Thunks.GetUserByUsername;
local v31 = require(l_script_FirstAncestor_0.Store.AccountRecoveryContext);
local v32 = require(l_script_FirstAncestor_0.Thunks.RequestRecovery);
local v33 = require(l_script_FirstAncestor_0.Thunks.SendCode);
local _ = require(l_script_FirstAncestor_0.Common.AccountRecoveryRequestTypes);
local v35 = require(l_script_FirstAncestor_0.Enums.AccountRecoveryActionType);
local v36 = require(l_script_FirstAncestor_0.Enums.AccountRecoveryPageState);
local v37 = require(l_script_FirstAncestor_0.Components.Constants);
local v38 = require(l_script_FirstAncestor_0.Components.PhoneDropdown);
local v39 = require(l_script_FirstAncestor_0.Components.RecoveryHeader);
local v40 = require(l_script_FirstAncestor_0.Enums.RecoveryState);
local _ = require(l_script_FirstAncestor_0.Enums.ContactMethodType);
local v42 = require(l_script_FirstAncestor_0.Utils.IdentifierUtils);
local v43 = require(l_script_FirstAncestor_0.Enums.IdentifierType);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v45 = require(l_script_FirstAncestor_0.Analytics.EventService);
local v46 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnable2SVRecovery);
return function(v47) --[[ Line: 69 ]]
    -- upvalues: v3 (copy), v31 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), l_useDesignTokens_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useClearFocusOnUnmount_0 (copy), v42 (copy), v32 (copy), v33 (copy), l_Logger_0 (copy), l_HttpService_0 (copy), v37 (copy), v35 (copy), v40 (copy), v43 (copy), v45 (copy), v46 (copy), v36 (copy), l_GetUserByUsername_0 (copy), l_useLocalization_0 (copy), l_FullscreenPageWithSafeArea_0 (copy), v39 (copy), l_Loading_0 (copy), l_IconSize_0 (copy), l_ScrollView_0 (copy), l_Visibility_0 (copy), v38 (copy), l_StyledTextLabel_0 (copy), l_TextInput_0 (copy), l_InputSize_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_Divider_0 (copy), l_DividerVariant_0 (copy), l_Orientation_0 (copy)
    local v48 = v3.useContext(v31);
    local v49 = l_useStyle_0();
    local v50 = l_useTokens_0();
    local v51 = l_useDesignTokens_0();
    local v52 = l_useDispatch_0();
    local v53 = l_useRoactService_0(l_RoactNetworking_0);
    local v54, v55 = v3.useState(false);
    local v56, v57 = v3.useState("");
    local v58, v59 = v3.useState(1);
    local v60, v61 = v3.useState(false);
    local v62, v63 = v3.useState("");
    local v64, v65 = v3.useState(true);
    local v66, v67 = v3.useState(Vector2.new(0, 0));
    l_useClearFocusOnUnmount_0();
    local function v72(v68, v69) --[[ Line: 91 ]]
        -- upvalues: v42 (ref), v54 (copy), v48 (copy), v52 (copy), v32 (ref), v53 (copy), v58 (copy)
        local v70 = v42.getIdentifierType(v69, v54);
        local v71 = {};
        if v48.state.recover2sv then
            table.insert(v71, "twostepverification");
        end;
        if v48.state.recoverPassword then
            table.insert(v71, "password");
        end;
        return v52(v32(v53, {
            identifier = v42.formatIdentifier(v69, v70, v48.state.phonePrefixList[v58]), 
            identifierType = v70, 
            recoverySessionId = v68, 
            requestedRecoveryTypes = v71
        }));
    end;
    local function _(v73, v74, v75, v76) --[[ Line: 111 ]]
        -- upvalues: v52 (copy), v33 (ref), v53 (copy)
        return v52(v33(v53, {
            recoverySessionId = v73, 
            contactMethod = v74, 
            contactMethodType = v75, 
            contactMethodNumber = v76 or 0
        }));
    end;
    local function v83(v78, v79, v80, v81) --[[ Line: 124 ]]
        -- upvalues: v61 (copy), v63 (copy), v72 (copy), v48 (copy), l_Logger_0 (ref), l_HttpService_0 (ref), v37 (ref)
        v61(true);
        v63("");
        v72(v48.state.recoverySessionId, v78):andThen(function(v82) --[[ Line: 138 ]]
            -- upvalues: l_Logger_0 (ref), l_HttpService_0 (ref), v80 (copy), v37 (ref), v61 (ref), v79 (copy), v81 (copy)
            if v82.isError then
                l_Logger_0:warning("Error initializing recovery: {}", l_HttpService_0:JSONEncode(v82));
                v80(v82.errorKey or v37.UnknownErrorKey);
                v61(false);
                return;
            else
                v79(v82.data, v80, v81);
                return;
            end;
        end):await();
    end;
    local function v93(v84, v85, v86) --[[ Line: 150 ]]
        -- upvalues: v37 (ref), v61 (copy), v48 (copy), v35 (ref), v40 (ref), v42 (ref), v56 (copy), v54 (copy), v43 (ref), v45 (ref), v46 (ref), v47 (copy), v36 (ref), v58 (copy), v52 (copy), v33 (ref), v53 (copy), l_Logger_0 (ref), l_HttpService_0 (ref)
        if v84 == nil then
            v85(v37.UnknownErrorKey);
            v61(false);
            return;
        else
            v48.dispatch({
                type = v35.SET_RECOVERY_SESSION_ID, 
                data = {
                    recoverySessionId = v84.recoverySessionId
                }
            });
            local v87 = v84.requestRecoveryMetadata and v84.requestRecoveryMetadata.userID or 0;
            if v84.recoveryState == v40.RECOVERY_STATE_CONTACT_METHOD_VERIFICATION_REQUIRED then
                local v88 = v42.getIdentifierType(v56, v54);
                if v88 == v43.Username then
                    if v86 then
                        v45.sendRecoveryInitializedFromAutofillEvent(v84.recoverySessionId, v88, "sendCode");
                    else
                        v45.sendIdentifierSentEvent(v84.recoverySessionId, v88, "sendCode");
                    end;
                    if v46() and v48.state.recover2sv and not v48.state.recoverPassword then
                        v47.navigation.replace(v36.SendCodeScreen, {
                            userID = v87, 
                            closeRecoveryOnBack = true
                        });
                    else
                        v47.navigation.navigate(v36.SendCodeScreen, {
                            userID = v87
                        });
                    end;
                    v61(false);
                    return;
                else
                    local v89 = v42.identifierTypeToContactMethodType(v88);
                    local v90 = v42.formatIdentifier(v56, v88, v48.state.phonePrefixList[v58]);
                    local l_recoverySessionId_0 = v84.recoverySessionId;
                    v52(v33(v53, {
                        recoverySessionId = l_recoverySessionId_0, 
                        contactMethod = v90, 
                        contactMethodType = v89, 
                        contactMethodNumber = 0
                    })):andThen(function(v92) --[[ Line: 204 ]]
                        -- upvalues: l_Logger_0 (ref), l_HttpService_0 (ref), v85 (copy), v37 (ref), v61 (ref), v45 (ref), v84 (copy), v88 (copy), v47 (ref), v36 (ref), v89 (copy), v90 (copy)
                        if v92.isError then
                            l_Logger_0:warning("Error sending code: {}", l_HttpService_0:JSONEncode(v92));
                            v85(v92.errorKey or v37.UnknownErrorKey);
                            v61(false);
                            return;
                        else
                            v45.sendIdentifierSentEvent(v84.recoverySessionId, v88, "resendOrVerifyCode");
                            v47.navigation.navigate(v36.VerifyCodeScreen, {
                                identifierInfo = {
                                    identifierType = v88, 
                                    contactMethodType = v89, 
                                    contactMethod = v90
                                }, 
                                contactMethodNumber = 0
                            });
                            v61(false);
                            return;
                        end;
                    end);
                    return;
                end;
            elseif v84.recoveryState == v40.RECOVERY_STATE_ACCOUNT_VERIFIED then
                v47.navigation.navigate(v36.AccountVerifiedConfirmationScreen, {
                    userID = v87
                });
                if v86 then
                    v45.sendRecoveryInitializedFromAutofillEvent(v84.recoverySessionId, "username", "accountVerifiedConfirmation");
                else
                    v45.sendIdentifierSentEvent(v84.recoverySessionId, "username", "accountVerifiedConfirmation");
                end;
                v61(false);
                return;
            else
                v85(v37.UnknownErrorKey);
                v61(false);
                return;
            end;
        end;
    end;
    local function v97(v94, v95, v96) --[[ Line: 252 ]]
        -- upvalues: v37 (ref), v40 (ref), v47 (copy), v36 (ref)
        if v95 == nil then
            v96(v37.UnknownErrorKey);
            return;
        elseif v95.recoveryState == v40.RECOVERY_STATE_CONTACT_METHOD_VERIFICATION_REQUIRED then
            v47.navigation.replace(v36.SendCodeScreen, {
                userID = v94, 
                isSecondContactMethodVerification = true, 
                previousRecoveryMethod = v95.previousRecoveryMethod, 
                previousRecoveryMethodTypes = v95.previousRecoveryMethodTypes, 
                closeRecoveryOnBack = true
            });
            return;
        elseif v95.recoveryState == v40.RECOVERY_STATE_ACCOUNT_VERIFIED then
            v47.navigation.replace(v36.AccountVerifiedConfirmationScreen, {
                userID = v94, 
                closeRecoveryOnBack = true
            });
            return;
        elseif v95.recoveryState == v40.RECOVERY_STATE_AWAITING_REEVALUATION then
            v47.navigation.navigate(v36.CannotRecoverAccountScreen, {
                userID = v94
            });
            return;
        else
            v96(v37.UnknownErrorKey);
            return;
        end;
    end;
    local v98 = v46() and {
        v48.state.deeplinkUuid
    } or {};
    v3.useEffect(function() --[[ Line: 286 ]]
        -- upvalues: v65 (copy), v45 (ref), v46 (ref), v48 (copy), v35 (ref), v63 (copy), v37 (ref), l_GetUserByUsername_0 (ref), v53 (copy), v97 (copy), l_Logger_0 (ref), v42 (ref), v43 (ref), v57 (copy), v55 (copy), v83 (copy), v93 (copy)
        v65(true);
        v45.sendPageLoadEvent();
        if v46() and v48.state.continuingRecovery then
            local function v100(v99) --[[ Line: 290 ]]
                -- upvalues: v48 (ref), v35 (ref), v63 (ref), v37 (ref), v65 (ref)
                v48.dispatch({
                    type = v35.RESET_RECOVERY_FLOW, 
                    data = {
                        continuingRecovery = false, 
                        recover2sv = false, 
                        recoverPassword = true, 
                        recoverySessionId = "", 
                        autofillIdentifier = "", 
                        deeplinkUuid = ""
                    }
                });
                v63(v99 or v37.UnknownErrorKey);
                v65(false);
            end;
            local l_autofillIdentifier_0 = v48.state.autofillIdentifier;
            if l_autofillIdentifier_0 == nil or l_autofillIdentifier_0 == "" then
                v100(v37.UnknownErrorKey);
                return;
            else
                l_GetUserByUsername_0(v53, v48.state.autofillIdentifier)():andThen(function(v102) --[[ Line: 312 ]]
                    -- upvalues: v48 (ref), v97 (ref), v100 (copy), v65 (ref), l_Logger_0 (ref), v37 (ref)
                    local l_id_0 = v102.id;
                    v48.utils.handleContinueRecovery(v48.state.recoverySessionId, l_id_0, function(v104) --[[ Line: 317 ]]
                        -- upvalues: v97 (ref), l_id_0 (copy), v100 (ref), v65 (ref)
                        v97(l_id_0, v104, v100);
                        v65(false);
                    end, function(v105) --[[ Line: 321 ]]
                        -- upvalues: v100 (ref)
                        v100(v105);
                    end, function() --[[ Line: 324 ]]
                        -- upvalues: l_Logger_0 (ref), v100 (ref), v37 (ref)
                        l_Logger_0:warning("2SV recovery abandoned when continuing 2SV recovery");
                        v100(v37.UnknownErrorKey);
                    end, v48.state.recover2sv);
                end):catch(function(v106) --[[ Line: 333 ]]
                    -- upvalues: l_Logger_0 (ref), v100 (copy), v37 (ref)
                    l_Logger_0:warning("Error getting user info: {}", v106);
                    v100(v37.UnknownErrorKey);
                end);
                return;
            end;
        else
            local l_autofillIdentifier_1 = v48.state.autofillIdentifier;
            if l_autofillIdentifier_1 == nil or l_autofillIdentifier_1 == "" then
                v65(false);
                return;
            else
                local v108 = v42.getIdentifierType(l_autofillIdentifier_1, false);
                if v108 == v43.Phone then
                    v57(l_autofillIdentifier_1);
                    v55(true);
                    v45.sendRecoveryInitializedFromAutofillEvent("", v108, "identifierInput");
                elseif v108 == v43.Email then
                    v57(l_autofillIdentifier_1);
                    v45.sendRecoveryInitializedFromAutofillEvent("", v108, "identifierInput");
                elseif v108 == v43.Username then
                    v83(l_autofillIdentifier_1, v93, function(_) --[[ Line: 356 ]]
                        -- upvalues: v48 (ref), v35 (ref), v45 (ref), v108 (copy)
                        v48.dispatch({
                            type = v35.RESET_RECOVERY_FLOW, 
                            data = {
                                continuingRecovery = false, 
                                recover2sv = false, 
                                recoverPassword = true, 
                                recoverySessionId = "", 
                                autofillIdentifier = "", 
                                deeplinkUuid = ""
                            }
                        });
                        v45.sendRecoveryInitializedFromAutofillEvent("", v108, "identifierInput");
                    end, true);
                end;
                v65(false);
                return;
            end;
        end;
    end, v98);
    local function v111(v110) --[[ Line: 374 ]]
        -- upvalues: v66 (copy), v67 (copy)
        if v66 ~= v110.AbsoluteSize then
            v67(v110.AbsoluteSize);
        end;
    end;
    local v112 = l_useLocalization_0({
        recoveryHeadingText = "Authentication.AccountRecovery.Heading.RobloxAccountRecovery", 
        usernameEmailText = "Authentication.AccountRecovery.Label.UsernameEmail", 
        phoneText = "Authentication.AccountRecovery.LabelPhone", 
        usePhoneInsteadText = "Authentication.AccountRecovery.Action.UsePhoneInstead", 
        useUsernameEmailInsteadText = "Authentication.AccountRecovery.Action.UseUsernameEmailInstead", 
        nextButtonText = "Authentication.AccountRecovery.Action.Next", 
        orText = "Authentication.AccountRecovery.Label.Or", 
        errorText = if v62 ~= "" then v62 else nil
    });
    return v3.createElement(l_FullscreenPageWithSafeArea_0, {
        includeStatusBar = true, 
        BackgroundColor3 = v49.Theme.BackgroundDefault.Color
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v51.Global.Space_100), 
            PaddingLeft = UDim.new(0, v51.Global.Space_150), 
            PaddingRight = UDim.new(0, v51.Global.Space_150), 
            PaddingBottom = UDim.new(0, v51.Global.Space_100)
        }), 
        Wrapper = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            Header = v3.createElement(v39, {
                LayoutOrder = 1, 
                onBackActivated = function() --[[ Line: 412 ]] --[[ Name: onBackActivated ]]
                    -- upvalues: v48 (copy)
                    v48.parentNavigation.goBack();
                end, 
                backButtonDisabled = v60, 
                recoveryHeadingText = v112.recoveryHeadingText, 
                currentComponent = "identifierInput", 
                recoverySessionId = v48.state.recoverySessionId
            }), 
            Loading = v64 and v3.createElement("Frame", {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, v51.Global.Space_20), 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                LoadingIcon = v3.createElement(l_Loading_0, {
                    size = l_IconSize_0.Medium
                })
            }), 
            Content = not v64 and v3.createElement("Frame", {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                PreScrollContent = v3.createElement("Frame", {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    [v3.Change.AbsoluteSize] = v111
                }, {
                    UIPadding = v3.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v51.Global.Space_100), 
                        PaddingRight = UDim.new(0, v51.Global.Space_100)
                    }), 
                    UIListLayout = v3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        Padding = UDim.new(0, v51.Global.Space_20)
                    }), 
                    RecoveryHeadingSpacing = v3.createElement("Frame", {
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, v51.Global.Space_250), 
                        BackgroundTransparency = 1
                    })
                }), 
                InputsOverflowScrollView = v3.createElement(l_ScrollView_0, {
                    LayoutOrder = 2, 
                    scroll = {
                        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                        CanvasSize = UDim2.new(1, 0, 0, 0), 
                        ScrollingDirection = Enum.ScrollingDirection.Y, 
                        scrollBarVisibility = l_Visibility_0.Always
                    }, 
                    Size = UDim2.new(1, 0, 1, -v66.Y)
                }, {
                    UIPadding = v3.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v51.Global.Space_100), 
                        PaddingRight = UDim.new(0, v51.Global.Space_100)
                    }), 
                    UIListLayout = v3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        Padding = UDim.new(0, v51.Global.Space_20)
                    }), 
                    PhoneDropdown = v54 and v3.createElement(v38, {
                        LayoutOrder = 2, 
                        value = v58, 
                        onChange = function(v113) --[[ Line: 492 ]] --[[ Name: onChange ]]
                            -- upvalues: v59 (copy)
                            v59(v113);
                        end, 
                        phonePrefixList = v48.state.phonePrefixList, 
                        topOffset = v51.Global.Space_800 * 3
                    }), 
                    PhoneDropdownSpacing = v54 and v3.createElement("Frame", {
                        LayoutOrder = 3, 
                        Size = UDim2.new(1, 0, 0, v51.Global.Space_250), 
                        BackgroundTransparency = 1
                    }), 
                    IdentifierLabel = v3.createElement(l_StyledTextLabel_0, {
                        layoutOrder = 4, 
                        text = v54 and v112.phoneText or v112.usernameEmailText, 
                        fontStyle = v50.Typography.TitleMedium, 
                        colorStyle = v49.Theme.TextEmphasis, 
                        automaticSize = Enum.AutomaticSize.XY
                    }), 
                    IdentifierLabelSpacing = v3.createElement("Frame", {
                        LayoutOrder = 5, 
                        Size = UDim2.new(1, 0, 0, v51.Global.Space_50), 
                        BackgroundTransparency = 1
                    }), 
                    UserIdentifierTextField = v3.createElement(l_TextInput_0, {
                        LayoutOrder = 6, 
                        text = v56, 
                        label = "", 
                        width = UDim.new(1, 0), 
                        textInputType = v54 and Enum.TextInputType.Phone or Enum.TextInputType.Username, 
                        onChanged = function(v114) --[[ Line: 521 ]] --[[ Name: onChanged ]]
                            -- upvalues: v62 (copy), v63 (copy), v57 (copy)
                            if v62 ~= "" then
                                v63("");
                            end;
                            v57(v114);
                        end, 
                        isDisabled = v60, 
                        size = l_InputSize_0.Medium
                    }), 
                    ErrorTextSpacing = v3.createElement("Frame", {
                        LayoutOrder = 7, 
                        Size = UDim2.new(1, 0, 0, v50.Size.Size_200), 
                        BackgroundTransparency = 1
                    }), 
                    ErrorTextLabel = v3.createElement(l_Text_0, {
                        Text = v112.errorText or "", 
                        fontStyle = v50.Typography.CaptionSmall, 
                        textStyle = v50.Color.System.Alert, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        LayoutOrder = 8
                    }), 
                    NextButtonSpacing = v3.createElement("Frame", {
                        LayoutOrder = 9, 
                        Size = UDim2.new(1, 0, 0, v50.Size.Size_300), 
                        BackgroundTransparency = 1
                    }), 
                    NextButton = v3.createElement(l_Button_0, {
                        LayoutOrder = 10, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        size = l_InputSize_0.Medium, 
                        text = v112.nextButtonText, 
                        width = UDim.new(1, 0), 
                        onActivated = function() --[[ Line: 557 ]] --[[ Name: onActivated ]]
                            -- upvalues: v83 (copy), v56 (copy), v93 (copy), v63 (copy)
                            v83(v56, v93, function(v115) --[[ Line: 561 ]]
                                -- upvalues: v63 (ref)
                                v63(v115);
                            end, false);
                        end, 
                        isDisabled = #v56 < 3, 
                        isLoading = v60
                    }), 
                    DividerSpacing = v3.createElement("Frame", {
                        LayoutOrder = 11, 
                        Size = UDim2.new(1, 0, 0, v50.Size.Size_900), 
                        BackgroundTransparency = 1
                    }), 
                    SwitchInputDivider = v3.createElement("Frame", {
                        LayoutOrder = 12, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        LabelContainer = v3.createElement("Frame", {
                            BackgroundColor3 = v49.Theme.BackgroundDefault.Color, 
                            BackgroundTransparency = 0, 
                            BorderSizePixel = 0, 
                            Position = UDim2.new(0.5, 0, 0, 0), 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            ZIndex = 2
                        }, {
                            UIPadding = v3.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, v51.Global.Space_100), 
                                PaddingRight = UDim.new(0, v51.Global.Space_100), 
                                PaddingTop = UDim.new(0, v51.Global.Space_25), 
                                PaddingBottom = UDim.new(0, v51.Global.Space_25)
                            }), 
                            Label = v3.createElement(l_Text_0, {
                                Text = v112.orText, 
                                fontStyle = v50.Typography.LabelMedium, 
                                textStyle = v50.Color.ActionStandard.Foreground, 
                                Size = UDim2.new(1, 0, 0, 0), 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                TextXAlignment = Enum.TextXAlignment.Center, 
                                TextYAlignment = Enum.TextYAlignment.Center
                            })
                        }), 
                        Divider = v3.createElement(l_Divider_0, {
                            variant = l_DividerVariant_0.Default, 
                            orientation = l_Orientation_0.Horizontal, 
                            ZIndex = 1
                        })
                    }), 
                    SwitchInputButtonSpacing = v3.createElement("Frame", {
                        LayoutOrder = 13, 
                        Size = UDim2.new(1, 0, 0, v50.Size.Size_700), 
                        BackgroundTransparency = 1
                    }), 
                    SwitchInputButton = v3.createElement(l_Button_0, {
                        LayoutOrder = 14, 
                        variant = l_ButtonVariant_0.Standard, 
                        size = l_InputSize_0.Medium, 
                        text = v54 and v112.useUsernameEmailInsteadText or v112.usePhoneInsteadText, 
                        width = UDim.new(1, 0), 
                        onActivated = function() --[[ Line: 624 ]] --[[ Name: onActivated ]]
                            -- upvalues: v45 (ref), v54 (copy), v55 (copy), v57 (copy)
                            v45.sendSwitchedInputEvent("", not v54, "identifierInput");
                            v55(not v54);
                            v57("");
                        end, 
                        isDisabled = v60
                    })
                })
            })
        })
    });
end;