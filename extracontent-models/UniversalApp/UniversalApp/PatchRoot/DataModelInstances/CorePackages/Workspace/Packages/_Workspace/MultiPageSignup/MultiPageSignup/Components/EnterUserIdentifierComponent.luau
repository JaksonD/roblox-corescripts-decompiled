local l_script_FirstAncestor_0 = script:FindFirstAncestor("MultiPageSignup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v7 = require(l_script_FirstAncestor_0.Utils.debounce);
local v8 = require(l_script_FirstAncestor_0.Hooks.useShowDisclaimerLinks);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v10 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v10.Core.Style.useStyle;
local l_StyledTextLabel_0 = v10.App.Text.StyledTextLabel;
local l_PillGroup_0 = v10.App.Control.PillGroup;
local l_GetFFlagEnableSignupFoundationText_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSignupFoundationText;
local v15 = require(l_Parent_0.Foundation);
local l_Text_0 = v15.Text;
local l_TextInput_0 = v15.TextInput;
local v18 = require(l_Parent_0.UserActivationFramework);
local l_ActivationFrameworkWrapper_0 = v18.Components.ActivationFrameworkWrapper;
local l_PayloadKey_0 = v18.Enums.PayloadKey;
local l_FullPageActivationFrameworkContext_0 = v18.Context.FullPageActivationFrameworkContext;
local l_CallbackStatus_0 = v18.Enums.CallbackStatus;
local v23 = require(l_Parent_0.AuthSignup);
local l_UsernameValidator_0 = v23.Thunks.UsernameValidator;
local l_UsernameSuggestor_0 = v23.Thunks.UsernameSuggestor;
local l_UsernameSuggestionScrollView_0 = v23.Components.UsernameSuggestionScrollView;
local v27 = require(l_script_FirstAncestor_0.Utils.cleanUsernameForSuggestions);
local v28 = require(l_Parent_0.AuthCommon);
local l_UsernameValidationContext_0 = v28.Enums.UsernameValidationContext;
local l_UsernameIssue_0 = v28.Enums.UsernameIssue;
local l_IssueCondition_0 = v28.Enums.IssueCondition;
local l_DisclaimerLinks_0 = v28.Components.DisclaimerLinks;
local v33 = require(l_Parent_0.AuthAnalytics);
local l_EventStreamConstants_0 = v33.EventStreamConstants;
local l_authMsgShown_0 = v33.Events.authMsgShown;
local l_authButtonClick_0 = v33.Events.authButtonClick;
local l_authModalShown_0 = v33.Events.authModalShown;
local l_authClientError_0 = v33.Events.authClientError;
local v39 = require(l_Parent_0.SharedFlags);
local v40 = game:DefineFastFlag("UseFoundationUsernameSuggestion", false);
local l_GetFFlagEnableMultiPageSignupV2Updates_0 = v39.GetFFlagEnableMultiPageSignupV2Updates;
local l_RegisterPreauthPasskey_0 = v28.Thunks.RegisterPreauthPasskey;
local v43 = require(l_script_FirstAncestor_0.Utils.getCredentialsProtocolAvailability);
local v44 = require(l_Parent_0.Promise);
local v45 = require(l_Parent_0.RoactAppExperiment);
local l_FStringLuaMultiPageSignupIxpLayer_0 = v39.FStringLuaMultiPageSignupIxpLayer;
local v47 = game:DefineFastFlag("HideMultipageUsernameAutofillSignupExperiment2", false);
local v48 = {
    l_UsernameIssue_0.LengthTooShortOrTooLong, 
    l_UsernameIssue_0.ContainsInvalidCharacter, 
    l_UsernameIssue_0.MultipleUnderscores, 
    l_UsernameIssue_0.BoundingUnderscore, 
    l_UsernameIssue_0.Inappropriate, 
    l_UsernameIssue_0.AlreadyInUse, 
    l_UsernameIssue_0.ContainsPII
};
local v49 = {
    [l_UsernameIssue_0.LengthTooShortOrTooLong] = "Authentication.SignUp.Label.Error.UsernameLengthTooShortOrTooLong", 
    [l_UsernameIssue_0.ContainsInvalidCharacter] = "Authentication.SignUp.Label.Error.UsernameContainsInvalidCharacter", 
    [l_UsernameIssue_0.MultipleUnderscores] = "Authentication.SignUp.Label.Error.UsernameContainsMultipleUnderscores", 
    [l_UsernameIssue_0.BoundingUnderscore] = "Authentication.SignUp.Label.Error.UsernameContainsBoundingUnderscore", 
    [l_UsernameIssue_0.Inappropriate] = "Authentication.SignUp.Label.Error.UsernameInappropriate", 
    [l_UsernameIssue_0.AlreadyInUse] = "Authentication.SignUp.Label.Error.UsernameAlreadyInUse", 
    [l_UsernameIssue_0.ContainsPII] = "Authentication.SignUp.Label.Error.UsernameContainsPII"
};
game:DefineFastInt("DefaultUsernameDebounceMs", 700);
return function(v50) --[[ Line: 95 ]]
    -- upvalues: v2 (copy), l_FullPageActivationFrameworkContext_0 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v45 (copy), l_FStringLuaMultiPageSignupIxpLayer_0 (copy), l_UsernameValidator_0 (copy), v8 (copy), l_PayloadKey_0 (copy), l_GetFFlagEnableMultiPageSignupV2Updates_0 (copy), v7 (copy), v48 (copy), l_IssueCondition_0 (copy), l_UsernameValidationContext_0 (copy), v27 (copy), l_UsernameSuggestor_0 (copy), l_authMsgShown_0 (copy), l_EventStreamConstants_0 (copy), l_useLocalization_0 (copy), v49 (copy), l_GetFFlagEnableSignupFoundationText_0 (copy), l_Text_0 (copy), l_StyledTextLabel_0 (copy), v40 (copy), l_UsernameSuggestionScrollView_0 (copy), l_authButtonClick_0 (copy), l_PillGroup_0 (copy), l_RegisterPreauthPasskey_0 (copy), l_authModalShown_0 (copy), l_authClientError_0 (copy), v44 (copy), v43 (copy), v47 (copy), l_ActivationFrameworkWrapper_0 (copy), l_CallbackStatus_0 (copy), l_DisclaimerLinks_0 (copy), l_TextInput_0 (copy)
    local v51 = v2.useContext(l_FullPageActivationFrameworkContext_0);
    local l_activationFrameworkState_0 = v51.activationFrameworkState;
    local v53 = l_useStyle_0();
    local v54 = l_useDesignTokens_0();
    local v55 = l_useDispatch_0();
    local v56 = l_useRoactService_0(l_RoactNetworking_0);
    local v59 = v45.useBrowserTrackerExperiment({
        l_FStringLuaMultiPageSignupIxpLayer_0
    }, function(v57) --[[ Line: 106 ]]
        -- upvalues: l_FStringLuaMultiPageSignupIxpLayer_0 (ref)
        local v58 = v57[l_FStringLuaMultiPageSignupIxpLayer_0] or {};
        return {
            shouldMultipageDisableUsernameAutofill = v58.shouldMultipageDisableUsernameAutofill or false, 
            shouldCleanUsernameSuggestionInput = v58.shouldCleanUsernameSuggestionInput or false, 
            shouldDisableClearingUsernameSuggestions = v58.shouldDisableClearingUsernameSuggestions or false, 
            shouldPromptPasskey = v58.shouldPromptPasskey or false
        };
    end);
    local v60, v61 = v2.useState("");
    local v62, v63 = v2.useState(game:GetFastInt("DefaultUsernameDebounceMs") / 1000);
    local v64, v65 = v2.useState(l_UsernameValidator_0.getDefaultIssues());
    local v66, v67 = v2.useState({});
    local v68, v69 = v2.useState(false);
    local v70 = v8();
    local v71, v72 = v2.useState(false);
    local v73 = v2.useRef(nil);
    local v74, v75 = v2.useState(false);
    local v76, v77 = v2.useState(false);
    local v78 = l_activationFrameworkState_0.payloadTable[l_PayloadKey_0.SignupBirthdayTimestampUtc];
    v2.useEffect(function() --[[ Line: 133 ]]
        -- upvalues: v73 (copy)
        if v73.current and v73.current.focus then
            v73.current.focus();
        end;
    end, {});
    v2.useEffect(function() --[[ Line: 139 ]]
        -- upvalues: l_GetFFlagEnableMultiPageSignupV2Updates_0 (ref), v71 (copy), v73 (copy), v72 (copy)
        if l_GetFFlagEnableMultiPageSignupV2Updates_0() and v71 then
            if v73.current and v73.current.focus then
                v73.current.focus();
            end;
            v72(false);
        end;
    end, {
        v71
    });
    local v80 = v2.useCallback(v7(function(v79) --[[ Line: 152 ]]
        -- upvalues: v61 (copy)
        v61(v79);
    end, v62), {
        v61, 
        v62
    });
    local v84 = v2.useCallback(function() --[[ Line: 158 ]]
        -- upvalues: v48 (ref), v64 (copy), l_IssueCondition_0 (ref)
        local v81 = nil;
        for _, v83 in ipairs(v48) do
            if v64[v83] == l_IssueCondition_0.Problematic then
                return v83;
            end;
        end;
        return v81;
    end, {
        v64
    });
    local function _() --[[ Line: 169 ]]
        -- upvalues: v55 (copy), l_UsernameValidator_0 (ref), v56 (copy), v60 (copy), v64 (copy), v78 (copy), l_UsernameValidationContext_0 (ref)
        return v55(l_UsernameValidator_0.validateFunction(v56, v60, v64, {
            birthday = v78, 
            context = l_UsernameValidationContext_0.Signup
        }));
    end;
    local function v88() --[[ Line: 176 ]]
        -- upvalues: v59 (copy), v27 (ref), v60 (copy), l_UsernameSuggestor_0 (ref), v56 (copy), v78 (copy), l_UsernameValidationContext_0 (ref), v67 (copy)
        local v86 = if v59.shouldCleanUsernameSuggestionInput then v27(v60) else v60;
        l_UsernameSuggestor_0.suggestUsernames(v56, v86, v78, l_UsernameValidationContext_0.Signup):andThen(function(v87) --[[ Line: 186 ]]
            -- upvalues: v59 (ref), v67 (ref)
            if v59.shouldDisableClearingUsernameSuggestions then
                if #v87.suggestions > 0 then
                    v67(v87.suggestions);
                    return;
                end;
            elseif v87.shouldUpdateState then
                v67(v87.suggestions);
            end;
        end);
    end;
    v2.useEffect(v88, {
        v60
    });
    v2.useEffect(function() --[[ Line: 200 ]]
        -- upvalues: v84 (copy), v68 (copy), v60 (copy), l_authMsgShown_0 (ref), v50 (copy), l_activationFrameworkState_0 (copy), l_EventStreamConstants_0 (ref)
        local v89 = tostring(v84());
        if v89 and v68 and #v60 > 0 then
            l_authMsgShown_0(v50.namespace, l_activationFrameworkState_0.currentState, l_EventStreamConstants_0.Field.Username, v89);
        end;
    end, {
        v64
    });
    local function v91() --[[ Line: 214 ]]
        -- upvalues: v55 (copy), l_UsernameValidator_0 (ref), v56 (copy), v60 (copy), v64 (copy), v78 (copy), l_UsernameValidationContext_0 (ref), v65 (copy), v69 (copy), v63 (copy)
        v55(l_UsernameValidator_0.validateFunction(v56, v60, v64, {
            birthday = v78, 
            context = l_UsernameValidationContext_0.Signup
        })):andThen(function(v90) --[[ Line: 215 ]]
            -- upvalues: v65 (ref), v69 (ref), v60 (ref), v63 (ref)
            v65(v90.IssueCondition);
            v69(#v60 > 0);
            if v90.InputValid then
                v63(0.2);
            end;
        end);
    end;
    v2.useEffect(v91, {
        v60
    });
    local v92 = v84();
    local v93 = v92 and v68 and #v60 > 0;
    local v94 = v93 and #v66 > 0;
    local v95 = l_useLocalization_0({
        username = "Authentication.Login.Label.Username", 
        usernameSuggestionHeaderText = "Authentication.SignUp.Label.MaybeTryOneOfThese", 
        errorText = v92 and v49[v92], 
        noRealNamePlaceholderText = "Authentication.SignUp.Message.Username.NoRealNameUse", 
        usernameRule1 = "Authentication.SignUp.Description.UsernameRule1", 
        usernameRule2 = "Authentication.SignUp.Description.UsernameRule2"
    });
    local function v99(v96) --[[ Line: 241 ]]
        -- upvalues: l_GetFFlagEnableSignupFoundationText_0 (ref), v2 (ref), l_Text_0 (ref), v93 (copy), v95 (copy), v53 (copy), l_StyledTextLabel_0 (ref), v54 (copy)
        local v97 = nil;
        v97 = if l_GetFFlagEnableSignupFoundationText_0() then v2.createElement(l_Text_0, {
            Text = if v93 then v95.errorText else "", 
            TextWrapped = true, 
            textStyle = {
                Color3 = v53.Theme.Alert.Color, 
                Transparency = v53.Theme.Alert.Transparency
            }, 
            tag = "text-body-small auto-xy"
        }) else v2.createElement(l_StyledTextLabel_0, {
            text = if v93 then v95.errorText else "", 
            fontStyle = v53.Font.BodySmall, 
            colorStyle = v53.Theme.Alert, 
            automaticSize = Enum.AutomaticSize.XY, 
            textWrapped = true
        });
        local l_Size_200_0 = v54.Global.Size_200;
        return v2.createElement("Frame", {
            LayoutOrder = v96, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, l_Size_200_0)
        }, {
            v97
        });
    end;
    local function v104(v100) --[[ Line: 274 ]]
        -- upvalues: v40 (ref), v2 (ref), l_UsernameSuggestionScrollView_0 (ref), v60 (copy), v66 (copy), v51 (copy), v61 (copy), v67 (copy), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), l_PillGroup_0 (ref)
        if v40 then
            return v2.createElement(l_UsernameSuggestionScrollView_0, {
                inputUsername = v60, 
                suggestionUsernames = v66, 
                eventContext = tostring(v51.activationFrameworkState.namespace), 
                onUsernameSelected = function(v101) --[[ Line: 280 ]] --[[ Name: onUsernameSelected ]]
                    -- upvalues: v61 (ref), v67 (ref), l_authButtonClick_0 (ref), v51 (ref), l_EventStreamConstants_0 (ref)
                    v61(v101);
                    v67({});
                    l_authButtonClick_0(v51.activationFrameworkState.namespace, l_EventStreamConstants_0.Button.UsernameSuggestion, v101);
                end, 
                layoutOrder = v100
            });
        else
            return v2.createElement(l_PillGroup_0, {
                layoutOrder = 8, 
                pills = v66, 
                leftPadding = 0, 
                onSelectionChanged = function(v102) --[[ Line: 296 ]] --[[ Name: onSelectionChanged ]]
                    -- upvalues: v61 (ref), v67 (ref), l_authButtonClick_0 (ref), v51 (ref), l_EventStreamConstants_0 (ref)
                    if #v102 == 1 then
                        if #v102[1] == 0 then
                            return;
                        else
                            local v103 = v102[1];
                            v61(v103);
                            v67({});
                            l_authButtonClick_0(v51.activationFrameworkState.namespace, l_EventStreamConstants_0.Button.UsernameSuggestion, v103);
                        end;
                    end;
                end
            });
        end;
    end;
    local function v109() --[[ Line: 315 ]]
        -- upvalues: v59 (copy), v75 (copy), v76 (copy), l_RegisterPreauthPasskey_0 (ref), v56 (copy), v60 (copy), l_authModalShown_0 (ref), l_EventStreamConstants_0 (ref), l_PayloadKey_0 (ref), l_authClientError_0 (ref), v44 (ref)
        if v59.shouldPromptPasskey then
            v75(true);
            if v76 then
                local _, v108 = l_RegisterPreauthPasskey_0(v56, v60):andThen(function(v105) --[[ Line: 320 ]]
                    -- upvalues: l_authModalShown_0 (ref), l_EventStreamConstants_0 (ref), l_PayloadKey_0 (ref)
                    if v105 then
                        l_authModalShown_0(l_EventStreamConstants_0.Context.MultiPageSignupPreauthPasskeyCreatedIdentifierPage, l_EventStreamConstants_0.State.Success);
                        return {
                            [l_PayloadKey_0.SignupPasskeySessionId] = v105.sessionId, 
                            [l_PayloadKey_0.SignupPasskeyResult] = v105.result
                        };
                    else
                        l_authModalShown_0(l_EventStreamConstants_0.Context.MultiPageSignupPreauthPasskeyCreatedIdentifierPage, l_EventStreamConstants_0.State.Unknown);
                        return nil;
                    end;
                end, function(v106) --[[ Line: 337 ]]
                    -- upvalues: l_authModalShown_0 (ref), l_EventStreamConstants_0 (ref), l_authClientError_0 (ref)
                    if v106.name then
                        l_authModalShown_0(l_EventStreamConstants_0.Context.MultiPageSignupPreauthPasskeyCreatedIdentifierPage, v106.name);
                        if type(v106.body) == "string" then
                            l_authClientError_0(l_EventStreamConstants_0.Context.MultiPageSignupPreauthPasskeyCreatedIdentifierPage, v106.body, v106.source);
                            return;
                        end;
                    else
                        l_authModalShown_0(l_EventStreamConstants_0.Context.MultiPageSignupPreauthPasskeyCreatedIdentifierPage, l_EventStreamConstants_0.State.Unknown);
                    end;
                end):await();
                return v44.resolve(v108);
            else
                return v44.reject();
            end;
        else
            return v44.reject();
        end;
    end;
    v2.useEffect(function() --[[ Line: 366 ]]
        -- upvalues: l_activationFrameworkState_0 (copy), v59 (copy), v43 (ref), v50 (copy), v51 (copy), v77 (copy)
        if not l_activationFrameworkState_0.payloadTable or not v59.shouldPromptPasskey then
            return;
        else
            local v110, _, _ = v43(l_activationFrameworkState_0.payloadTable, v50.namespace, v51.dispatch);
            v77(v110);
            return;
        end;
    end, {
        l_activationFrameworkState_0.payloadTable, 
        v59.shouldPromptPasskey
    });
    local v113 = v47 and v59.shouldMultipageDisableUsernameAutofill;
    local l_createElement_0 = v2.createElement;
    local l_l_ActivationFrameworkWrapper_0_0 = l_ActivationFrameworkWrapper_0;
    local v116 = {
        namespace = v50.namespace, 
        titleTextKey = "Authentication.SignUp.Header.UsernamePage4", 
        bodyTextKey = "Authentication.SignUp.Description.UsernameHelpV2", 
        headingTextKey = "Authentication.SignUp.Action.CreateAccount"
    };
    local v117 = {
        buttonTextKey = "Authentication.SignUp.Action.NextWord", 
        shouldShowButton = true
    };
    local v118 = false;
    if #v60 > 0 then
        v118 = v68 and not v93 and not v74;
    end;
    v117.isButtonEnabled = v118;
    v117.onButtonClicked = function() --[[ Line: 392 ]] --[[ Name: onButtonClicked ]]
        -- upvalues: l_PayloadKey_0 (ref), v60 (copy), v109 (copy), v75 (copy), l_CallbackStatus_0 (ref)
        local v119 = {
            [l_PayloadKey_0.SignupUsername] = v60
        };
        local v121, v122 = v109():andThen(function(v120) --[[ Line: 395 ]]
            return v120;
        end):await();
        v75(false);
        if v121 and v122 then
            for v123, v124 in pairs(v122) do
                v119[v123] = v124;
            end;
            v119[l_PayloadKey_0.SignupPassword] = "";
        end;
        return {
            payloadAddendum = v119, 
            status = l_CallbackStatus_0.Success
        };
    end;
    v116.primaryButton = v117;
    v116.navigation = v50.navigation;
    v116.subFooterContent = v2.createElement("Frame", {
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
        DisclaimerLinks = if v70 then v2.createElement(l_DisclaimerLinks_0, {
            ctx = v50.namespace, 
            state = l_activationFrameworkState_0.currentState
        }) else nil
    });
    return l_createElement_0(l_l_ActivationFrameworkWrapper_0_0, v116, {
        Content = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v54.Global.Space_20)
            }), 
            UsernameInputLabel = if l_GetFFlagEnableSignupFoundationText_0() then v2.createElement(l_Text_0, {
                LayoutOrder = 1, 
                Text = v95.username, 
                tag = "text-body-small auto-xy"
            }) else v2.createElement(l_StyledTextLabel_0, {
                layoutOrder = 1, 
                text = v95.username, 
                fontStyle = v53.Font.Body, 
                colorStyle = v53.Theme.TextDefault, 
                automaticSize = Enum.AutomaticSize.XY
            }), 
            IdentifierLabelSpacing = v2.createElement("Frame", {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, v54.Global.Space_50), 
                BackgroundTransparency = 1
            }), 
            UsernameTextInput = v2.createElement(l_TextInput_0, {
                LayoutOrder = 3, 
                textInputType = if v113 then nil else Enum.TextInputType.Username, 
                width = UDim.new(1, 0), 
                text = v60, 
                placeholder = v95.noRealNamePlaceholderText, 
                onChanged = function(v125) --[[ Line: 468 ]] --[[ Name: onChanged ]]
                    -- upvalues: v80 (copy)
                    v80(v125);
                end, 
                label = "", 
                hasError = v93, 
                iconTrailing = if v93 then {
                    name = "icons/navigation/close", 
                    onActivated = function() --[[ Line: 476 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_authButtonClick_0 (ref), v51 (copy), l_EventStreamConstants_0 (ref), v61 (copy), v67 (copy), v63 (copy), l_GetFFlagEnableMultiPageSignupV2Updates_0 (ref), v72 (copy)
                        l_authButtonClick_0(v51.activationFrameworkState.namespace, l_EventStreamConstants_0.Button.ClearUsernameField, v51.activationFrameworkState.currentState);
                        v61("");
                        v67({});
                        v63(game:GetFastInt("DefaultUsernameDebounceMs") / 1000);
                        if l_GetFFlagEnableMultiPageSignupV2Updates_0() then
                            v72(true);
                        end;
                    end
                } else nil, 
                textBoxRef = v73
            }), 
            TextSpacing = v2.createElement("Frame", {
                LayoutOrder = 4, 
                Size = UDim2.new(1, 0, 0, v54.Global.Space_50), 
                BackgroundTransparency = 1
            }), 
            AdditionalText = v99(5), 
            SuggestionsLabelSpacing = v94 and v2.createElement("Frame", {
                LayoutOrder = 6, 
                Size = UDim2.new(1, 0, 0, v54.Global.Space_200), 
                BackgroundTransparency = 1
            }), 
            SuggestionsLabel = v94 and if l_GetFFlagEnableSignupFoundationText_0() then v2.createElement(l_Text_0, {
                LayoutOrder = 7, 
                Text = v95.usernameSuggestionHeaderText, 
                tag = "text-body-small auto-xy"
            }) else v2.createElement(l_StyledTextLabel_0, {
                layoutOrder = 7, 
                text = v95.usernameSuggestionHeaderText, 
                fontStyle = v53.Font.Body, 
                colorStyle = v53.Theme.TextDefault, 
                automaticSize = Enum.AutomaticSize.XY
            }), 
            UsernameSuggestion = v94 and v104(8)
        })
    });
end;