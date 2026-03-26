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
local l_Divider_0 = v15.Divider;
local l_DividerVariant_0 = v15.Enums.DividerVariant;
local l_Orientation_0 = v15.Enums.Orientation;
local l_useTokens_0 = v15.Hooks.useTokens;
local l_Loading_0 = v15.Loading;
local l_IconSize_0 = v15.Enums.IconSize;
local l_ScrollView_0 = v15.ScrollView;
local l_Visibility_0 = v15.Enums.Visibility;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_useClearFocusOnUnmount_0 = require(l_script_FirstAncestor_0.Hooks).useClearFocusOnUnmount;
local l_GetUserByUsername_0 = require(l_Parent_0.AuthCommon).Thunks.GetUserByUsername;
local v32 = require(l_script_FirstAncestor_0.Store.AccountRecoveryContext);
local v33 = require(l_script_FirstAncestor_0.Thunks.RequestRecovery);
local v34 = require(l_script_FirstAncestor_0.Thunks.SendCode);
local _ = require(l_script_FirstAncestor_0.Common.AccountRecoveryRequestTypes);
local v36 = require(l_script_FirstAncestor_0.Enums.AccountRecoveryActionType);
local v37 = require(l_script_FirstAncestor_0.Enums.AccountRecoveryPageState);
local v38 = require(l_script_FirstAncestor_0.Components.Constants);
local v39 = require(l_script_FirstAncestor_0.Components.PhoneDropdown);
local v40 = require(l_script_FirstAncestor_0.Components.RecoveryHeader);
local v41 = require(l_script_FirstAncestor_0.Enums.RecoveryState);
local _ = require(l_script_FirstAncestor_0.Enums.ContactMethodType);
local v43 = require(l_script_FirstAncestor_0.Utils.IdentifierUtils);
local v44 = require(l_script_FirstAncestor_0.Enums.IdentifierType);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v46 = require(l_script_FirstAncestor_0.Analytics.EventService);
local v47 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnable2SVRecovery);
local v48 = game:DefineFastFlag("DisableRecoveryForConsole", false);
return function(v49) --[[ Line: 72 ]]
    -- upvalues: v4 (copy), v32 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), l_useDesignTokens_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useClearFocusOnUnmount_0 (copy), v43 (copy), v33 (copy), v34 (copy), l_Logger_0 (copy), l_HttpService_0 (copy), v38 (copy), v36 (copy), v41 (copy), v44 (copy), v46 (copy), v47 (copy), v37 (copy), v48 (copy), l_UserInputService_0 (copy), l_GetUserByUsername_0 (copy), l_useLocalization_0 (copy), l_FullscreenPageWithSafeArea_0 (copy), v40 (copy), l_Loading_0 (copy), l_IconSize_0 (copy), l_ScrollView_0 (copy), l_Visibility_0 (copy), v39 (copy), l_StyledTextLabel_0 (copy), l_TextInput_0 (copy), l_InputSize_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_Divider_0 (copy), l_DividerVariant_0 (copy), l_Orientation_0 (copy)
    local v50 = v4.useContext(v32);
    local v51 = l_useStyle_0();
    local v52 = l_useTokens_0();
    local v53 = l_useDesignTokens_0();
    local v54 = l_useDispatch_0();
    local v55 = l_useRoactService_0(l_RoactNetworking_0);
    local v56, v57 = v4.useState(false);
    local v58, v59 = v4.useState("");
    local v60, v61 = v4.useState(1);
    local v62, v63 = v4.useState(false);
    local v64, v65 = v4.useState("");
    local v66, v67 = v4.useState(true);
    local v68, v69 = v4.useState(Vector2.new(0, 0));
    l_useClearFocusOnUnmount_0();
    local function v74(v70, v71) --[[ Line: 94 ]]
        -- upvalues: v43 (ref), v56 (copy), v50 (copy), v54 (copy), v33 (ref), v55 (copy), v60 (copy)
        local v72 = v43.getIdentifierType(v71, v56);
        local v73 = {};
        if v50.state.recover2sv then
            table.insert(v73, "twostepverification");
        end;
        if v50.state.recoverPassword then
            table.insert(v73, "password");
        end;
        return v54(v33(v55, {
            identifier = v43.formatIdentifier(v71, v72, v50.state.phonePrefixList[v60]), 
            identifierType = v72, 
            recoverySessionId = v70, 
            requestedRecoveryTypes = v73
        }));
    end;
    local function _(v75, v76, v77, v78) --[[ Line: 114 ]]
        -- upvalues: v54 (copy), v34 (ref), v55 (copy)
        return v54(v34(v55, {
            recoverySessionId = v75, 
            contactMethod = v76, 
            contactMethodType = v77, 
            contactMethodNumber = v78 or 0
        }));
    end;
    local function v85(v80, v81, v82, v83) --[[ Line: 127 ]]
        -- upvalues: v63 (copy), v65 (copy), v74 (copy), v50 (copy), l_Logger_0 (ref), l_HttpService_0 (ref), v38 (ref)
        v63(true);
        v65("");
        v74(v50.state.recoverySessionId, v80):andThen(function(v84) --[[ Line: 141 ]]
            -- upvalues: l_Logger_0 (ref), l_HttpService_0 (ref), v82 (copy), v38 (ref), v63 (ref), v81 (copy), v83 (copy)
            if v84.isError then
                l_Logger_0:warning("Error initializing recovery: {}", l_HttpService_0:JSONEncode(v84));
                v82(v84.errorKey or v38.UnknownErrorKey);
                v63(false);
                return;
            else
                v81(v84.data, v82, v83);
                return;
            end;
        end):await();
    end;
    local function v95(v86, v87, v88) --[[ Line: 153 ]]
        -- upvalues: v38 (ref), v63 (copy), v50 (copy), v36 (ref), v41 (ref), v43 (ref), v58 (copy), v56 (copy), v44 (ref), v46 (ref), v47 (ref), v49 (copy), v37 (ref), v60 (copy), v54 (copy), v34 (ref), v55 (copy), l_Logger_0 (ref), l_HttpService_0 (ref)
        if v86 == nil then
            v87(v38.UnknownErrorKey);
            v63(false);
            return;
        else
            v50.dispatch({
                type = v36.SET_RECOVERY_SESSION_ID, 
                data = {
                    recoverySessionId = v86.recoverySessionId
                }
            });
            local v89 = v86.requestRecoveryMetadata and v86.requestRecoveryMetadata.userID or 0;
            if v86.recoveryState == v41.RECOVERY_STATE_CONTACT_METHOD_VERIFICATION_REQUIRED then
                local v90 = v43.getIdentifierType(v58, v56);
                if v90 == v44.Username then
                    if v88 then
                        v46.sendRecoveryInitializedFromAutofillEvent(v86.recoverySessionId, v90, "sendCode");
                    else
                        v46.sendIdentifierSentEvent(v86.recoverySessionId, v90, "sendCode");
                    end;
                    if v47() and v50.state.recover2sv and not v50.state.recoverPassword then
                        v49.navigation.replace(v37.SendCodeScreen, {
                            userID = v89, 
                            closeRecoveryOnBack = true
                        });
                    else
                        v49.navigation.navigate(v37.SendCodeScreen, {
                            userID = v89
                        });
                    end;
                    v63(false);
                    return;
                else
                    local v91 = v43.identifierTypeToContactMethodType(v90);
                    local v92 = v43.formatIdentifier(v58, v90, v50.state.phonePrefixList[v60]);
                    local l_recoverySessionId_0 = v86.recoverySessionId;
                    v54(v34(v55, {
                        recoverySessionId = l_recoverySessionId_0, 
                        contactMethod = v92, 
                        contactMethodType = v91, 
                        contactMethodNumber = 0
                    })):andThen(function(v94) --[[ Line: 207 ]]
                        -- upvalues: l_Logger_0 (ref), l_HttpService_0 (ref), v87 (copy), v38 (ref), v63 (ref), v46 (ref), v86 (copy), v90 (copy), v49 (ref), v37 (ref), v91 (copy), v92 (copy)
                        if v94.isError then
                            l_Logger_0:warning("Error sending code: {}", l_HttpService_0:JSONEncode(v94));
                            v87(v94.errorKey or v38.UnknownErrorKey);
                            v63(false);
                            return;
                        else
                            v46.sendIdentifierSentEvent(v86.recoverySessionId, v90, "resendOrVerifyCode");
                            v49.navigation.navigate(v37.VerifyCodeScreen, {
                                identifierInfo = {
                                    identifierType = v90, 
                                    contactMethodType = v91, 
                                    contactMethod = v92
                                }, 
                                contactMethodNumber = 0
                            });
                            v63(false);
                            return;
                        end;
                    end);
                    return;
                end;
            elseif v86.recoveryState == v41.RECOVERY_STATE_ACCOUNT_VERIFIED then
                v49.navigation.navigate(v37.AccountVerifiedConfirmationScreen, {
                    userID = v89
                });
                if v88 then
                    v46.sendRecoveryInitializedFromAutofillEvent(v86.recoverySessionId, "username", "accountVerifiedConfirmation");
                else
                    v46.sendIdentifierSentEvent(v86.recoverySessionId, "username", "accountVerifiedConfirmation");
                end;
                v63(false);
                return;
            else
                v87(v38.UnknownErrorKey);
                v63(false);
                return;
            end;
        end;
    end;
    local function v99(v96, v97, v98) --[[ Line: 255 ]]
        -- upvalues: v38 (ref), v41 (ref), v49 (copy), v37 (ref)
        if v97 == nil then
            v98(v38.UnknownErrorKey);
            return;
        elseif v97.recoveryState == v41.RECOVERY_STATE_CONTACT_METHOD_VERIFICATION_REQUIRED then
            v49.navigation.replace(v37.SendCodeScreen, {
                userID = v96, 
                isSecondContactMethodVerification = true, 
                previousRecoveryMethod = v97.previousRecoveryMethod, 
                previousRecoveryMethodTypes = v97.previousRecoveryMethodTypes, 
                closeRecoveryOnBack = true
            });
            return;
        elseif v97.recoveryState == v41.RECOVERY_STATE_ACCOUNT_VERIFIED then
            v49.navigation.replace(v37.AccountVerifiedConfirmationScreen, {
                userID = v96, 
                closeRecoveryOnBack = true
            });
            return;
        elseif v97.recoveryState == v41.RECOVERY_STATE_AWAITING_REEVALUATION then
            v49.navigation.navigate(v37.CannotRecoverAccountScreen, {
                userID = v96
            });
            return;
        else
            v98(v38.UnknownErrorKey);
            return;
        end;
    end;
    local v100 = v47() and {
        v50.state.deeplinkUuid
    } or {};
    v4.useEffect(function() --[[ Line: 289 ]]
        -- upvalues: v67 (copy), v46 (ref), v48 (ref), l_UserInputService_0 (ref), v49 (copy), v37 (ref), v47 (ref), v50 (copy), v36 (ref), v65 (copy), v38 (ref), l_GetUserByUsername_0 (ref), v55 (copy), v99 (copy), l_Logger_0 (ref), v43 (ref), v44 (ref), v59 (copy), v57 (copy), v85 (copy), v95 (copy)
        v67(true);
        v46.sendPageLoadEvent();
        if v48 then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 294 ]]
                -- upvalues: l_UserInputService_0 (ref)
                return l_UserInputService_0:GetPlatform();
            end);
            if l_status_0 then
                local v103 = true;
                if l_result_0 ~= Enum.Platform.PS3 then
                    v103 = true;
                    if l_result_0 ~= Enum.Platform.PS4 then
                        v103 = game:GetEngineFeature("PlatformEnumPS5") and l_result_0 == Enum.Platform.PS5;
                    end;
                end;
                local v104 = true;
                if l_result_0 ~= Enum.Platform.XBoxOne then
                    v104 = l_result_0 == Enum.Platform.XBox360;
                end;
                if v103 or v104 then
                    v67(false);
                    v49.navigation.replace(v37.CannotRecoverAccountScreen, {
                        isConsole = true
                    });
                    return;
                end;
            end;
        end;
        if v47() and v50.state.continuingRecovery then
            local function v106(v105) --[[ Line: 313 ]]
                -- upvalues: v50 (ref), v36 (ref), v65 (ref), v38 (ref), v67 (ref)
                v50.dispatch({
                    type = v36.RESET_RECOVERY_FLOW, 
                    data = {
                        continuingRecovery = false, 
                        recover2sv = false, 
                        recoverPassword = true, 
                        recoverySessionId = "", 
                        autofillIdentifier = "", 
                        deeplinkUuid = ""
                    }
                });
                v65(v105 or v38.UnknownErrorKey);
                v67(false);
            end;
            local l_autofillIdentifier_0 = v50.state.autofillIdentifier;
            if l_autofillIdentifier_0 == nil or l_autofillIdentifier_0 == "" then
                v106(v38.UnknownErrorKey);
                return;
            else
                l_GetUserByUsername_0(v55, v50.state.autofillIdentifier)():andThen(function(v108) --[[ Line: 335 ]]
                    -- upvalues: v50 (ref), v99 (ref), v106 (copy), v67 (ref), l_Logger_0 (ref), v38 (ref)
                    local l_id_0 = v108.id;
                    v50.utils.handleContinueRecovery(v50.state.recoverySessionId, l_id_0, function(v110) --[[ Line: 340 ]]
                        -- upvalues: v99 (ref), l_id_0 (copy), v106 (ref), v67 (ref)
                        v99(l_id_0, v110, v106);
                        v67(false);
                    end, function(v111) --[[ Line: 344 ]]
                        -- upvalues: v106 (ref)
                        v106(v111);
                    end, function() --[[ Line: 347 ]]
                        -- upvalues: l_Logger_0 (ref), v106 (ref), v38 (ref)
                        l_Logger_0:warning("2SV recovery abandoned when continuing 2SV recovery");
                        v106(v38.UnknownErrorKey);
                    end, v50.state.recover2sv);
                end):catch(function(v112) --[[ Line: 356 ]]
                    -- upvalues: l_Logger_0 (ref), v106 (copy), v38 (ref)
                    l_Logger_0:warning("Error getting user info: {}", v112);
                    v106(v38.UnknownErrorKey);
                end);
                return;
            end;
        else
            local l_autofillIdentifier_1 = v50.state.autofillIdentifier;
            if l_autofillIdentifier_1 == nil or l_autofillIdentifier_1 == "" then
                v67(false);
                return;
            else
                local v114 = v43.getIdentifierType(l_autofillIdentifier_1, false);
                if v114 == v44.Phone then
                    v59(l_autofillIdentifier_1);
                    v57(true);
                    v46.sendRecoveryInitializedFromAutofillEvent("", v114, "identifierInput");
                elseif v114 == v44.Email then
                    v59(l_autofillIdentifier_1);
                    v46.sendRecoveryInitializedFromAutofillEvent("", v114, "identifierInput");
                elseif v114 == v44.Username then
                    v85(l_autofillIdentifier_1, v95, function(_) --[[ Line: 379 ]]
                        -- upvalues: v50 (ref), v36 (ref), v46 (ref), v114 (copy)
                        v50.dispatch({
                            type = v36.RESET_RECOVERY_FLOW, 
                            data = {
                                continuingRecovery = false, 
                                recover2sv = false, 
                                recoverPassword = true, 
                                recoverySessionId = "", 
                                autofillIdentifier = "", 
                                deeplinkUuid = ""
                            }
                        });
                        v46.sendRecoveryInitializedFromAutofillEvent("", v114, "identifierInput");
                    end, true);
                end;
                v67(false);
                return;
            end;
        end;
    end, v100);
    local function v117(v116) --[[ Line: 397 ]]
        -- upvalues: v68 (copy), v69 (copy)
        if v68 ~= v116.AbsoluteSize then
            v69(v116.AbsoluteSize);
        end;
    end;
    local v118 = l_useLocalization_0({
        recoveryHeadingText = "Authentication.AccountRecovery.Heading.RobloxAccountRecovery", 
        usernameEmailText = "Authentication.AccountRecovery.Label.UsernameEmail", 
        phoneText = "Authentication.AccountRecovery.LabelPhone", 
        usePhoneInsteadText = "Authentication.AccountRecovery.Action.UsePhoneInstead", 
        useUsernameEmailInsteadText = "Authentication.AccountRecovery.Action.UseUsernameEmailInstead", 
        nextButtonText = "Authentication.AccountRecovery.Action.Next", 
        orText = "Authentication.AccountRecovery.Label.Or", 
        errorText = if v64 ~= "" then v64 else nil
    });
    return v4.createElement(l_FullscreenPageWithSafeArea_0, {
        includeStatusBar = true, 
        BackgroundColor3 = v51.Theme.BackgroundDefault.Color
    }, {
        UIPadding = v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v53.Global.Space_100), 
            PaddingLeft = UDim.new(0, v53.Global.Space_150), 
            PaddingRight = UDim.new(0, v53.Global.Space_150), 
            PaddingBottom = UDim.new(0, v53.Global.Space_100)
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
            Header = v4.createElement(v40, {
                LayoutOrder = 1, 
                onBackActivated = function() --[[ Line: 435 ]] --[[ Name: onBackActivated ]]
                    -- upvalues: v50 (copy)
                    v50.parentNavigation.goBack();
                end, 
                backButtonDisabled = v62, 
                recoveryHeadingText = v118.recoveryHeadingText, 
                currentComponent = "identifierInput", 
                recoverySessionId = v50.state.recoverySessionId
            }), 
            Loading = v66 and v4.createElement("Frame", {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                UIListLayout = v4.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, v53.Global.Space_20), 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                LoadingIcon = v4.createElement(l_Loading_0, {
                    size = l_IconSize_0.Medium
                })
            }), 
            Content = not v66 and v4.createElement("Frame", {
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
                    [v4.Change.AbsoluteSize] = v117
                }, {
                    UIPadding = v4.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v53.Global.Space_100), 
                        PaddingRight = UDim.new(0, v53.Global.Space_100)
                    }), 
                    UIListLayout = v4.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        Padding = UDim.new(0, v53.Global.Space_20)
                    }), 
                    RecoveryHeadingSpacing = v4.createElement("Frame", {
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, v53.Global.Space_250), 
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
                    Size = UDim2.new(1, 0, 1, -v68.Y)
                }, {
                    UIPadding = v4.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v53.Global.Space_100), 
                        PaddingRight = UDim.new(0, v53.Global.Space_100)
                    }), 
                    UIListLayout = v4.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        Padding = UDim.new(0, v53.Global.Space_20)
                    }), 
                    PhoneDropdown = v56 and v4.createElement(v39, {
                        LayoutOrder = 2, 
                        value = v60, 
                        onChange = function(v119) --[[ Line: 515 ]] --[[ Name: onChange ]]
                            -- upvalues: v61 (copy)
                            v61(v119);
                        end, 
                        phonePrefixList = v50.state.phonePrefixList, 
                        topOffset = v53.Global.Space_800 * 3
                    }), 
                    PhoneDropdownSpacing = v56 and v4.createElement("Frame", {
                        LayoutOrder = 3, 
                        Size = UDim2.new(1, 0, 0, v53.Global.Space_250), 
                        BackgroundTransparency = 1
                    }), 
                    IdentifierLabel = v4.createElement(l_StyledTextLabel_0, {
                        layoutOrder = 4, 
                        text = v56 and v118.phoneText or v118.usernameEmailText, 
                        fontStyle = v52.Typography.TitleMedium, 
                        colorStyle = v51.Theme.TextEmphasis, 
                        automaticSize = Enum.AutomaticSize.XY
                    }), 
                    IdentifierLabelSpacing = v4.createElement("Frame", {
                        LayoutOrder = 5, 
                        Size = UDim2.new(1, 0, 0, v53.Global.Space_50), 
                        BackgroundTransparency = 1
                    }), 
                    UserIdentifierTextField = v4.createElement(l_TextInput_0, {
                        LayoutOrder = 6, 
                        text = v58, 
                        label = "", 
                        width = UDim.new(1, 0), 
                        textInputType = v56 and Enum.TextInputType.Phone or Enum.TextInputType.Username, 
                        onChanged = function(v120) --[[ Line: 544 ]] --[[ Name: onChanged ]]
                            -- upvalues: v64 (copy), v65 (copy), v59 (copy)
                            if v64 ~= "" then
                                v65("");
                            end;
                            v59(v120);
                        end, 
                        isDisabled = v62, 
                        size = l_InputSize_0.Medium
                    }), 
                    ErrorTextSpacing = v4.createElement("Frame", {
                        LayoutOrder = 7, 
                        Size = UDim2.new(1, 0, 0, v52.Size.Size_200), 
                        BackgroundTransparency = 1
                    }), 
                    ErrorTextLabel = v4.createElement(l_Text_0, {
                        Text = v118.errorText or "", 
                        fontStyle = v52.Typography.CaptionSmall, 
                        textStyle = v52.Color.System.Alert, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        LayoutOrder = 8
                    }), 
                    NextButtonSpacing = v4.createElement("Frame", {
                        LayoutOrder = 9, 
                        Size = UDim2.new(1, 0, 0, v52.Size.Size_300), 
                        BackgroundTransparency = 1
                    }), 
                    NextButton = v4.createElement(l_Button_0, {
                        LayoutOrder = 10, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        size = l_InputSize_0.Medium, 
                        text = v118.nextButtonText, 
                        width = UDim.new(1, 0), 
                        onActivated = function() --[[ Line: 580 ]] --[[ Name: onActivated ]]
                            -- upvalues: v85 (copy), v58 (copy), v95 (copy), v65 (copy)
                            v85(v58, v95, function(v121) --[[ Line: 584 ]]
                                -- upvalues: v65 (ref)
                                v65(v121);
                            end, false);
                        end, 
                        isDisabled = #v58 < 3, 
                        isLoading = v62
                    }), 
                    DividerSpacing = v4.createElement("Frame", {
                        LayoutOrder = 11, 
                        Size = UDim2.new(1, 0, 0, v52.Size.Size_900), 
                        BackgroundTransparency = 1
                    }), 
                    SwitchInputDivider = v4.createElement("Frame", {
                        LayoutOrder = 12, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        LabelContainer = v4.createElement("Frame", {
                            BackgroundColor3 = v51.Theme.BackgroundDefault.Color, 
                            BackgroundTransparency = 0, 
                            BorderSizePixel = 0, 
                            Position = UDim2.new(0.5, 0, 0, 0), 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            ZIndex = 2
                        }, {
                            UIPadding = v4.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, v53.Global.Space_100), 
                                PaddingRight = UDim.new(0, v53.Global.Space_100), 
                                PaddingTop = UDim.new(0, v53.Global.Space_25), 
                                PaddingBottom = UDim.new(0, v53.Global.Space_25)
                            }), 
                            Label = v4.createElement(l_Text_0, {
                                Text = v118.orText, 
                                fontStyle = v52.Typography.LabelMedium, 
                                textStyle = v52.Color.ActionStandard.Foreground, 
                                Size = UDim2.new(1, 0, 0, 0), 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                TextXAlignment = Enum.TextXAlignment.Center, 
                                TextYAlignment = Enum.TextYAlignment.Center
                            })
                        }), 
                        Divider = v4.createElement(l_Divider_0, {
                            variant = l_DividerVariant_0.Default, 
                            orientation = l_Orientation_0.Horizontal, 
                            ZIndex = 1
                        })
                    }), 
                    SwitchInputButtonSpacing = v4.createElement("Frame", {
                        LayoutOrder = 13, 
                        Size = UDim2.new(1, 0, 0, v52.Size.Size_700), 
                        BackgroundTransparency = 1
                    }), 
                    SwitchInputButton = v4.createElement(l_Button_0, {
                        LayoutOrder = 14, 
                        variant = l_ButtonVariant_0.Standard, 
                        size = l_InputSize_0.Medium, 
                        text = v56 and v118.useUsernameEmailInsteadText or v118.usePhoneInsteadText, 
                        width = UDim.new(1, 0), 
                        onActivated = function() --[[ Line: 647 ]] --[[ Name: onActivated ]]
                            -- upvalues: v46 (ref), v56 (copy), v57 (copy), v59 (copy)
                            v46.sendSwitchedInputEvent("", not v56, "identifierInput");
                            v57(not v56);
                            v59("");
                        end, 
                        isDisabled = v62
                    })
                })
            })
        })
    });
end;