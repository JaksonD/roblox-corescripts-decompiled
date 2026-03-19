local l_script_FirstAncestor_0 = script:FindFirstAncestor("MultiPageSignup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_StyledTextLabel_0 = v5.App.Text.StyledTextLabel;
local v8 = require(l_Parent_0.AuthCommon);
local l_AppStorageUtilities_0 = v8.Utils.AppStorageUtilities;
local l_InputValidity_0 = v8.Enums.InputValidity;
local l_DisclaimerLinks_0 = v8.Components.DisclaimerLinks;
local l_GetFFlagEnableSignupFoundationText_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSignupFoundationText;
local l_Text_0 = require(l_Parent_0.Foundation).Text;
local v14 = require(l_Parent_0.AuthAnalytics);
local l_authMsgShown_0 = v14.Events.authMsgShown;
local l_authFormInteraction_0 = v14.Events.authFormInteraction;
local l_authModalShown_0 = v14.Events.authModalShown;
local l_authClientError_0 = v14.Events.authClientError;
local l_EventStreamConstants_0 = v14.EventStreamConstants;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v22 = require(l_Parent_0.RoactAppExperiment);
local v23 = require(l_script_FirstAncestor_0.Hooks.useShowDisclaimerLinks);
local v24 = require(l_Parent_0.AuthSignup);
local l_AuthTextInputValidator_0 = v24.Components.AuthTextInputValidator;
local l_PasswordValidator_0 = v24.Thunks.PasswordValidator;
local l_PasswordIssue_0 = v8.Enums.PasswordIssue;
local v28 = require(l_Parent_0.UserActivationFramework);
local l_FullPageActivationFrameworkContext_0 = v28.Context.FullPageActivationFrameworkContext;
local l_ActivationFrameworkWrapper_0 = v28.Components.ActivationFrameworkWrapper;
local l_PayloadKey_0 = v28.Enums.PayloadKey;
local l_CallbackStatus_0 = v28.Enums.CallbackStatus;
local l_FStringLuaMultiPageSignupIxpLayer_0 = require(l_Parent_0.SharedFlags).FStringLuaMultiPageSignupIxpLayer;
local l_RegisterPreauthPasskey_0 = v8.Thunks.RegisterPreauthPasskey;
local v35 = require(l_script_FirstAncestor_0.Utils.getCredentialsProtocolAvailability);
local v36 = {
    l_PasswordIssue_0.Length, 
    l_PasswordIssue_0.UsernameMatch, 
    l_PasswordIssue_0.Simple
};
local l_GetFFlagPasswordErrorSimple_0 = require(l_Parent_0.SharedFlags).GetFFlagPasswordErrorSimple;
local l_GetFFlagPasswordErrorLength_0 = require(l_Parent_0.SharedFlags).GetFFlagPasswordErrorLength;
local v39 = {
    [l_PasswordIssue_0.Length] = l_GetFFlagPasswordErrorLength_0() and "Authentication.SignUp.Label.PasswordErrorLengthNew" or "Authentication.SignUp.Label.NewPasswordError1", 
    [l_PasswordIssue_0.UsernameMatch] = "Authentication.SignUp.Label.NewPasswordError2", 
    [l_PasswordIssue_0.Simple] = l_GetFFlagPasswordErrorSimple_0() and "Authentication.SignUp.Label.PasswordErrorSimple" or "Authentication.SignUp.Label.NewPasswordError3"
};
return function(v40) --[[ Line: 78 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v2 (copy), l_FullPageActivationFrameworkContext_0 (copy), l_InputValidity_0 (copy), l_useDesignTokens_0 (copy), l_useStyle_0 (copy), v23 (copy), v22 (copy), l_FStringLuaMultiPageSignupIxpLayer_0 (copy), l_PayloadKey_0 (copy), l_AppStorageUtilities_0 (copy), v35 (copy), l_useLocalization_0 (copy), l_ActivationFrameworkWrapper_0 (copy), l_CallbackStatus_0 (copy), l_RegisterPreauthPasskey_0 (copy), l_authModalShown_0 (copy), l_EventStreamConstants_0 (copy), l_authClientError_0 (copy), l_DisclaimerLinks_0 (copy), l_GetFFlagEnableSignupFoundationText_0 (copy), l_Text_0 (copy), l_StyledTextLabel_0 (copy), l_AuthTextInputValidator_0 (copy), l_PasswordValidator_0 (copy), v36 (copy), v39 (copy), l_authFormInteraction_0 (copy), l_authMsgShown_0 (copy)
    local v41 = l_useRoactService_0(l_RoactNetworking_0);
    local v42 = v2.useContext(l_FullPageActivationFrameworkContext_0);
    local l_activationFrameworkState_0 = v42.activationFrameworkState;
    local v44, v45 = v2.useState(false);
    local v46, v47 = v2.useState(true);
    local v48, v49 = v2.useState("");
    local v50, v51 = v2.useState(l_InputValidity_0.Unvalidated);
    local v52, v53 = v2.useState(false);
    local v54, v55 = v2.useState(false);
    local v56 = v2.useRef(nil);
    local v57 = l_useDesignTokens_0();
    local v58 = l_useStyle_0();
    local v59 = v23();
    local v60, v61 = v2.useState("");
    local v64 = v22.useBrowserTrackerExperiment({
        l_FStringLuaMultiPageSignupIxpLayer_0
    }, function(v62) --[[ Line: 104 ]]
        -- upvalues: l_FStringLuaMultiPageSignupIxpLayer_0 (ref)
        local v63 = v62[l_FStringLuaMultiPageSignupIxpLayer_0] or {};
        return {
            shouldShowPasskeyOnMultiPageSignup = v63.shouldShowPasskeyOnMultiPageSignup or false, 
            shouldAwaitPasswordRegistrationOnMultiPageSignup = v63.shouldAwaitPasswordRegistrationOnMultiPageSignup or false, 
            shouldShowCreateAccountHeaderOnMultiPageSignup = v63.shouldShowCreateAccountHeaderOnMultiPageSignup or false, 
            shouldPromptPasskey = v63.shouldPromptPasskey or false
        };
    end);
    v2.useEffect(function() --[[ Line: 118 ]]
        -- upvalues: l_activationFrameworkState_0 (copy), l_PayloadKey_0 (ref), v61 (copy), l_AppStorageUtilities_0 (ref)
        if l_activationFrameworkState_0.payloadTable and l_activationFrameworkState_0.payloadTable[l_PayloadKey_0.SignupUsername] then
            v61(l_activationFrameworkState_0.payloadTable[l_PayloadKey_0.SignupUsername]);
            return;
        else
            v61(l_AppStorageUtilities_0.getIncompleteSignupUsername());
            return;
        end;
    end, {});
    v2.useEffect(function() --[[ Line: 129 ]]
        -- upvalues: v56 (copy)
        if v56.current and v56.current.focus then
            v56.current.focus();
        end;
    end, {});
    v2.useEffect(function() --[[ Line: 136 ]]
        -- upvalues: v45 (copy), v50 (copy), l_InputValidity_0 (ref)
        v45(v50 == l_InputValidity_0.Valid);
    end, {
        v50
    });
    v2.useEffect(function() --[[ Line: 141 ]]
        -- upvalues: l_activationFrameworkState_0 (copy), v35 (ref), v40 (copy), v42 (copy), v55 (copy), v53 (copy)
        if not l_activationFrameworkState_0.payloadTable then
            return;
        else
            local v65, v66, _ = v35(l_activationFrameworkState_0.payloadTable, v40.namespace, v42.dispatch);
            v55(v65);
            v53(v66);
            return;
        end;
    end, {});
    local function v70(v68, v69) --[[ Line: 156 ]]
        -- upvalues: v49 (copy), v51 (copy)
        v49(v68);
        v51(v69);
    end;
    local v71 = l_useLocalization_0({
        passwordLabel = "Authentication.Login.Label.Password", 
        passwordPlaceholder = "Authentication.SignUp.Label.Use8CharPassword"
    });
    local v72 = v2.useCallback(function() --[[ Line: 167 ]]
        -- upvalues: v64 (copy), v54 (copy)
        return v64.shouldShowPasskeyOnMultiPageSignup and v54;
    end, {
        v64.shouldShowPasskeyOnMultiPageSignup, 
        v54
    });
    local v73 = v72() and "Authentication.SignUp.Header.CreatePasswordOrPasskey" or "Authentication.SignUp.Header.CreatePassword";
    return v2.createElement(l_ActivationFrameworkWrapper_0, {
        namespace = v40.namespace, 
        titleTextKey = {
            v73; 
            username = "@" .. v60
        }, 
        bodyTextKey = "Authentication.SignUp.Description.ThisKeepYourAccountSecure", 
        headingTextKey = "Authentication.SignUp.Action.CreateAccount", 
        primaryButton = {
            buttonTextKey = "Authentication.SignUp.Action.NextWord", 
            shouldShowButton = true, 
            isButtonEnabled = v44, 
            onButtonClicked = function() --[[ Line: 190 ]] --[[ Name: onButtonClicked ]]
                -- upvalues: l_PayloadKey_0 (ref), v48 (copy), v52 (copy), l_CallbackStatus_0 (ref)
                return {
                    payloadAddendum = {
                        [l_PayloadKey_0.SignupPassword] = v48, 
                        [l_PayloadKey_0.CredentialsProtocolPasswordRegistrationAvailable] = tostring(v52), 
                        [l_PayloadKey_0.SignupPasskeySessionId] = "", 
                        [l_PayloadKey_0.SignupPasskeyResult] = ""
                    }, 
                    status = l_CallbackStatus_0.Success
                };
            end
        }, 
        secondaryButton = {
            buttonTextKey = "Authentication.SignUp.Action.CreateAPasskey", 
            icon = "icons/menu/passkey", 
            shouldShowButton = v72(), 
            isButtonEnabled = v54 and v46, 
            onButtonClicked = function() --[[ Line: 209 ]] --[[ Name: onButtonClicked ]]
                -- upvalues: v45 (copy), v47 (copy), l_RegisterPreauthPasskey_0 (ref), v41 (copy), v60 (copy), l_authModalShown_0 (ref), l_EventStreamConstants_0 (ref), l_PayloadKey_0 (ref), l_CallbackStatus_0 (ref), l_authClientError_0 (ref), v50 (copy), l_InputValidity_0 (ref)
                v45(false);
                v47(false);
                local _, v77 = l_RegisterPreauthPasskey_0(v41, v60):andThen(function(v74) --[[ Line: 213 ]]
                    -- upvalues: l_authModalShown_0 (ref), l_EventStreamConstants_0 (ref), l_PayloadKey_0 (ref), l_CallbackStatus_0 (ref)
                    if v74 then
                        l_authModalShown_0(l_EventStreamConstants_0.Context.MultiPageSignupPreauthPasskeyCreatedAuthPage, l_EventStreamConstants_0.State.Success);
                        return {
                            payloadAddendum = {
                                [l_PayloadKey_0.SignupPasskeySessionId] = v74.sessionId, 
                                [l_PayloadKey_0.SignupPasskeyResult] = v74.result, 
                                [l_PayloadKey_0.SignupPassword] = ""
                            }, 
                            status = l_CallbackStatus_0.Success
                        };
                    else
                        l_authModalShown_0(l_EventStreamConstants_0.Context.MultiPageSignupPreauthPasskeyCreatedAuthPage, l_EventStreamConstants_0.State.Unknown);
                        return {
                            payloadAddendum = nil, 
                            status = l_CallbackStatus_0.PageError
                        };
                    end;
                end, function(v75) --[[ Line: 238 ]]
                    -- upvalues: l_authModalShown_0 (ref), l_EventStreamConstants_0 (ref), l_authClientError_0 (ref), l_CallbackStatus_0 (ref)
                    if v75.name then
                        l_authModalShown_0(l_EventStreamConstants_0.Context.MultiPageSignupPreauthPasskeyCreatedAuthPage, v75.name);
                        if type(v75.body) == "string" then
                            l_authClientError_0(l_EventStreamConstants_0.Context.MultiPageSignupPreauthPasskeyCreatedAuthPage, v75.body, v75.source);
                        end;
                    else
                        l_authModalShown_0(l_EventStreamConstants_0.Context.MultiPageSignupPreauthPasskeyCreatedAuthPage, l_EventStreamConstants_0.State.Unknown);
                    end;
                    return {
                        payloadAddendum = nil, 
                        status = l_CallbackStatus_0.PageError
                    };
                end):await();
                v45(v50 == l_InputValidity_0.Valid);
                v47(true);
                return v77;
            end
        }, 
        shouldShowButtonDivider = v72(), 
        navigation = v40.navigation, 
        subFooterContent = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            DisclaimerLinks = if v59 then v2.createElement(l_DisclaimerLinks_0, {
                ctx = v40.namespace, 
                state = l_activationFrameworkState_0.currentState
            }) else nil
        })
    }, {
        Content = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v57.Global.Space_20)
            }), 
            ContentPadding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v57.Global.Space_20)
            }), 
            PasswordInputLabel = if l_GetFFlagEnableSignupFoundationText_0() then v2.createElement(l_Text_0, {
                LayoutOrder = 1, 
                Text = v71.passwordLabel, 
                tag = "text-body-small auto-xy"
            }) else v2.createElement(l_StyledTextLabel_0, {
                layoutOrder = 1, 
                text = v71.passwordLabel, 
                fontStyle = v58.Font.Body, 
                colorStyle = v58.Theme.TextDefault, 
                automaticSize = Enum.AutomaticSize.XY
            }), 
            PasswordLabelSpacing = v2.createElement("Frame", {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, v57.Global.Space_50), 
                BackgroundTransparency = 1
            }), 
            PasswordField = v2.createElement(l_AuthTextInputValidator_0, {
                layoutOrder = 3, 
                textInputType = Enum.TextInputType.Password, 
                placeholder = v71.passwordPlaceholder, 
                validator = l_PasswordValidator_0, 
                validatorAdditionalProps = {
                    username = v60
                }, 
                validatorIssuePriorityList = v36, 
                validatorIssueMessageList = v39, 
                onTextChanged = v70, 
                onTextFocusedGained = function() --[[ Line: 333 ]] --[[ Name: onTextFocusedGained ]]
                    -- upvalues: l_authFormInteraction_0 (ref), v42 (copy), l_EventStreamConstants_0 (ref)
                    l_authFormInteraction_0(v42.activationFrameworkState.namespace, l_EventStreamConstants_0.Field.Password, v42.activationFrameworkState.currentState, nil, true);
                end, 
                onErrorShown = function(v78) --[[ Line: 342 ]] --[[ Name: onErrorShown ]]
                    -- upvalues: l_authMsgShown_0 (ref), v40 (copy), l_activationFrameworkState_0 (copy), l_EventStreamConstants_0 (ref)
                    l_authMsgShown_0(v40.namespace, l_activationFrameworkState_0.currentState, l_EventStreamConstants_0.Field.Password, v78);
                end, 
                textBoxRef = v56
            })
        })
    });
end;