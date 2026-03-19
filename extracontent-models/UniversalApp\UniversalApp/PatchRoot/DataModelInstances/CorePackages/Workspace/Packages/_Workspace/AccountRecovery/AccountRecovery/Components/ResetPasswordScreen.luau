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
local l_useTokens_0 = v14.Hooks.useTokens;
local l_ScrollView_0 = v14.ScrollView;
local l_Visibility_0 = v14.Enums.Visibility;
local l_InputSize_0 = v14.Enums.InputSize;
local l_Button_0 = v14.Button;
local l_ButtonVariant_0 = v14.Enums.ButtonVariant;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v23 = require(l_Parent_0.AuthCommon);
local v24 = require(l_Parent_0.AuthSignup);
local l_GetUserById_0 = v23.Thunks.GetUserById;
local l_AuthTextInputValidator_0 = v24.Components.AuthTextInputValidator;
local l_InputValidity_0 = v23.Enums.InputValidity;
local l_PasswordValidator_0 = v24.Thunks.PasswordValidator;
local l_PasswordIssue_0 = v23.Enums.PasswordIssue;
local l_AppStorageUtilities_0 = v23.Utils.AppStorageUtilities;
local l_useClearFocusOnUnmount_0 = require(l_script_FirstAncestor_0.Hooks).useClearFocusOnUnmount;
local l_ChallengeType_0 = require(l_Parent_0.GenericChallenges).Types.ChallengeType;
local l_TwoStepVerificationActionType_0 = require(l_Parent_0.GenericChallenges).Types.TwoStepVerificationActionType;
local v34 = require(l_script_FirstAncestor_0.Store.AccountRecoveryContext);
local v35 = require(l_script_FirstAncestor_0.Components.RecoveryHeader);
local v36 = require(l_script_FirstAncestor_0.Components.UserHeader);
local v37 = require(l_script_FirstAncestor_0.Thunks.ConfirmPasswordValidator);
local v38 = require(l_script_FirstAncestor_0.Enums.ConfirmPasswordIssue);
local v39 = require(l_script_FirstAncestor_0.Thunks.EmailValidator);
local v40 = require(l_script_FirstAncestor_0.Enums.EmailIssue);
local v41 = require(l_script_FirstAncestor_0.Enums.ModalState);
local v42 = require(l_script_FirstAncestor_0.Components.getModal);
local v43 = require(l_script_FirstAncestor_0.Enums.AccountRecoveryActionType);
local v44 = require(l_script_FirstAncestor_0.Thunks.ResetPassword);
local v45 = require(l_script_FirstAncestor_0.Thunks.SetEmail);
local _ = require(l_script_FirstAncestor_0.Common.AccountRecoveryRequestTypes);
local v47 = require(l_script_FirstAncestor_0.Enums.ResetPasswordErrorCodes);
local v48 = require(l_script_FirstAncestor_0.Components.Constants);
local v49 = require(l_script_FirstAncestor_0.Analytics.EventService);
local v50 = require(l_script_FirstAncestor_0.Analytics.EventConstants);
local v51 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnable2SVRecovery);
local v52 = require(l_Parent_0.SharedFlags);
local l_GetFFlagEnableAutoLoginAfterRecovery_0 = v52.GetFFlagEnableAutoLoginAfterRecovery;
local l_GetFFlagEnableSavePasswordAfterRecovery_0 = v52.GetFFlagEnableSavePasswordAfterRecovery;
local l_GetFFlagPasswordErrorLength_0 = require(l_Parent_0.SharedFlags).GetFFlagPasswordErrorLength;
local v56 = require(l_Parent_0.RoactAppExperiment);
local l_AppBtidLayers_0 = require(l_Parent_0.ExperimentLayers).AppBtidLayers;
local v58 = require(l_Parent_0.CredentialsProtocol);
local l_Constants_0 = v58.Constants;
local l_default_0 = v58.CredentialsProtocol.default;
local l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 = v58.Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout;
local function _(v62) --[[ Line: 103 ]]
    -- upvalues: l_HttpService_0 (copy)
    local v63 = v62 and v62.errors and v62.errors[1] and v62.errors[1].fieldData or nil;
    if type(v63) ~= "string" then
        return nil;
    else
        local v64 = l_HttpService_0:JSONDecode(v63);
        return v64 and v64.challengeId or nil;
    end;
end;
local v66 = {
    l_PasswordIssue_0.Length, 
    l_PasswordIssue_0.UsernameMatch, 
    l_PasswordIssue_0.Simple
};
local l_GetFFlagPasswordErrorSimple_0 = require(l_Parent_0.SharedFlags).GetFFlagPasswordErrorSimple;
local v68 = {
    [l_PasswordIssue_0.Length] = l_GetFFlagPasswordErrorLength_0() and "Authentication.SignUp.Label.PasswordErrorLengthNew" or "Authentication.SignUp.Label.NewPasswordError1", 
    [l_PasswordIssue_0.UsernameMatch] = "Authentication.SignUp.Label.NewPasswordError2", 
    [l_PasswordIssue_0.Simple] = l_GetFFlagPasswordErrorSimple_0() and "Authentication.SignUp.Label.PasswordErrorSimple" or "Authentication.SignUp.Label.NewPasswordError3"
};
local v69 = {
    [v38.PasswordsNotMatch] = "Authentication.AccountRecovery.MessagePasswordsDoNotMatch"
};
local v70 = {
    [v40.InvalidEmail] = "Authentication.AccountRecovery.Message.Error.InvalidEmail"
};
return function(v71) --[[ Line: 137 ]]
    -- upvalues: v3 (copy), v34 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), l_useDesignTokens_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v56 (copy), l_AppBtidLayers_0 (copy), l_InputValidity_0 (copy), l_useClearFocusOnUnmount_0 (copy), l_GetUserById_0 (copy), l_Logger_0 (copy), l_GetFFlagEnableAutoLoginAfterRecovery_0 (copy), v49 (copy), l_GetFFlagEnableSavePasswordAfterRecovery_0 (copy), v50 (copy), l_default_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), l_HttpService_0 (copy), l_Constants_0 (copy), v45 (copy), v44 (copy), l_ChallengeType_0 (copy), l_TwoStepVerificationActionType_0 (copy), v48 (copy), l_AppStorageUtilities_0 (copy), v47 (copy), v51 (copy), v43 (copy), v41 (copy), l_useLocalization_0 (copy), l_FullscreenPageWithSafeArea_0 (copy), v35 (copy), l_ScrollView_0 (copy), l_Visibility_0 (copy), v36 (copy), l_Text_0 (copy), l_StyledTextLabel_0 (copy), l_AuthTextInputValidator_0 (copy), l_PasswordValidator_0 (copy), v66 (copy), v68 (copy), l_InputSize_0 (copy), v37 (copy), v69 (copy), v39 (copy), v70 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), v42 (copy)
    local v72 = v3.useContext(v34);
    local v73 = l_useStyle_0();
    local v74 = l_useTokens_0();
    local v75 = l_useDesignTokens_0();
    local v76 = l_useDispatch_0();
    local v77 = l_useRoactService_0(l_RoactNetworking_0);
    local v79 = v56.useBrowserTrackerExperiment({
        l_AppBtidLayers_0.IosPasswordSavingLayer
    }, function(v78) --[[ Line: 148 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        return (v78[l_AppBtidLayers_0.IosPasswordSavingLayer] or {}).enableNewIosPasswordSaving or false;
    end);
    local v80, v81 = v3.useState("");
    local v82, v83 = v3.useState("");
    local v84, v85 = v3.useState("");
    local v86, v87 = v3.useState(l_InputValidity_0.Unvalidated);
    local v88, v89 = v3.useState("");
    local v90, v91 = v3.useState(l_InputValidity_0.Unvalidated);
    local v92, v93 = v3.useState("");
    local v94, v95 = v3.useState(l_InputValidity_0.Unvalidated);
    local v96, v97 = v3.useState(false);
    local v98, v99 = v3.useState(false);
    local v100, v101 = v3.useState("");
    local v102, v103 = v3.useState(Vector2.new(0, 0));
    local v104 = v71.navigation.getParam("userID");
    local v105 = v71.navigation.getParam("shouldAddContactMethod");
    l_useClearFocusOnUnmount_0();
    v3.useEffect(function() --[[ Line: 176 ]]
        -- upvalues: l_GetUserById_0 (ref), v77 (copy), v104 (copy), v83 (copy), v81 (copy), l_Logger_0 (ref)
        l_GetUserById_0(v77, (("%*"):format(v104))):andThen(function(v106) --[[ Line: 177 ]]
            -- upvalues: v83 (ref), v81 (ref)
            v83(v106.name);
            v81(v106.displayName);
        end):catch(function(v107) --[[ Line: 180 ]]
            -- upvalues: l_Logger_0 (ref)
            l_Logger_0:warning("Error getting user info: {}", v107);
        end);
    end, {});
    v3.useEffect(function() --[[ Line: 187 ]]
        -- upvalues: v97 (copy), v98 (copy), v86 (copy), l_InputValidity_0 (ref), v90 (copy), v105 (copy), v94 (copy)
        v97(not v98 and v86 == l_InputValidity_0.Valid and v90 == l_InputValidity_0.Valid and (not v105 or v94 == l_InputValidity_0.Valid));
    end, {
        v98, 
        v86, 
        v90, 
        v94
    });
    local function v110(v108, v109) --[[ Line: 198 ]]
        -- upvalues: v85 (copy), v87 (copy)
        v85(v108);
        v87(v109);
    end;
    local function v113(v111, v112) --[[ Line: 203 ]]
        -- upvalues: v89 (copy), v91 (copy)
        v89(v111);
        v91(v112);
    end;
    local function v116(v114, v115) --[[ Line: 208 ]]
        -- upvalues: v93 (copy), v95 (copy)
        v93(v114);
        v95(v115);
    end;
    local function v118(v117) --[[ Line: 216 ]]
        -- upvalues: l_GetFFlagEnableAutoLoginAfterRecovery_0 (ref), v49 (ref), v72 (copy)
        if v117 and l_GetFFlagEnableAutoLoginAfterRecovery_0() then
            v49.sendPasswordResetEvent(v72.state.recoverySessionId, "launchApp");
            v72.utils.launchApp();
            return;
        else
            v49.sendPasswordResetEvent(v72.state.recoverySessionId, "closeRecoveryFlow");
            v72.parentNavigation.goBack();
            return;
        end;
    end;
    local function v128(v119) --[[ Line: 226 ]]
        -- upvalues: v72 (copy), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v79 (copy), v49 (ref), v50 (ref), v118 (copy), v82 (copy), v84 (copy), l_default_0 (ref), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (ref), l_HttpService_0 (ref), l_Logger_0 (ref), l_Constants_0 (ref)
        local l_recoverySessionId_0 = v72.state.recoverySessionId;
        if not l_GetFFlagEnableSavePasswordAfterRecovery_0() and not v79 then
            if v49 and v49.sendPasswordUpdateSkippedEvent ~= nil then
                v49.sendPasswordUpdateSkippedEvent(l_recoverySessionId_0, v50.passwordUpdateSkipReason.featureDisabled);
            end;
            v118(v119);
            return;
        elseif not v82 then
            if v49 and v49.sendPasswordUpdateSkippedEvent ~= nil then
                v49.sendPasswordUpdateSkippedEvent(l_recoverySessionId_0, v50.passwordUpdateSkipReason.missingUsername);
            end;
            v118(v119);
            return;
        elseif not v84 then
            if v49 and v49.sendPasswordUpdateSkippedEvent ~= nil then
                v49.sendPasswordUpdateSkippedEvent(l_recoverySessionId_0, v50.passwordUpdateSkipReason.missingPassword);
            end;
            v118(v119);
            return;
        else
            l_default_0:isAvailable(l_default_0.CredentialsTypes.all, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v121) --[[ Line: 269 ]]
                -- upvalues: v49 (ref), l_recoverySessionId_0 (copy), v50 (ref), v118 (ref), v119 (copy), v82 (ref), v84 (ref), l_HttpService_0 (ref), l_Logger_0 (ref), l_default_0 (ref), l_Constants_0 (ref)
                if not v121.password or not v121.password.isAvailable then
                    if v49 and v49.sendPasswordUpdateSkippedEvent ~= nil then
                        v49.sendPasswordUpdateSkippedEvent(l_recoverySessionId_0, v50.passwordUpdateSkipReason.protocolNotAvailable);
                    end;
                    v118(v119);
                    return;
                else
                    local v122 = {
                        username = v82, 
                        password = v84
                    };
                    local v123 = l_HttpService_0:JSONEncode(v122);
                    l_Logger_0:info("[ResetPasswordScreen] Calling registerCredentials for user: {}", v82);
                    if v49 and v49.sendPasswordUpdateAttemptedEvent ~= nil then
                        v49.sendPasswordUpdateAttemptedEvent(l_recoverySessionId_0, v82);
                    end;
                    l_default_0:registerCredentials(l_default_0.CredentialsTypes.password, v123, l_Constants_0.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(v124) --[[ Line: 302 ]]
                        -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), v49 (ref), l_recoverySessionId_0 (ref), v82 (ref), v118 (ref), v119 (ref)
                        local v125 = if v124 then l_HttpService_0:JSONDecode(v124) else {};
                        if v125 and v125.errorCode == nil then
                            l_Logger_0:info("Successfully registered password after recovery");
                            if v49 and v49.sendPasswordUpdateSuccessEvent ~= nil then
                                v49.sendPasswordUpdateSuccessEvent(l_recoverySessionId_0, v82);
                            end;
                        else
                            l_Logger_0:warning("Error registering password after recovery: {}", v125.errorMsg or "unknown");
                            if v49 and v49.sendPasswordUpdateFailureEvent ~= nil then
                                v49.sendPasswordUpdateFailureEvent(l_recoverySessionId_0, v82, v125.errorMsg);
                            end;
                        end;
                        v118(v119);
                    end, function(v126) --[[ Line: 326 ]]
                        -- upvalues: l_Logger_0 (ref), v49 (ref), l_recoverySessionId_0 (ref), v82 (ref), v118 (ref), v119 (ref)
                        l_Logger_0:warning("Error registering password after recovery: {}", v126);
                        if v49 and v49.sendPasswordUpdateFailureEvent ~= nil then
                            v49.sendPasswordUpdateFailureEvent(l_recoverySessionId_0, v82, (tostring(v126)));
                        end;
                        v118(v119);
                    end);
                    return;
                end;
            end):catch(function(v127) --[[ Line: 336 ]]
                -- upvalues: l_Logger_0 (ref), v49 (ref), l_recoverySessionId_0 (copy), v50 (ref), v118 (ref), v119 (copy)
                l_Logger_0:warning("[ResetPasswordScreen] Error checking CredentialsProtocol availability: {}", v127);
                if v49 and v49.sendPasswordUpdateSkippedEvent ~= nil then
                    v49.sendPasswordUpdateSkippedEvent(l_recoverySessionId_0, v50.passwordUpdateSkipReason.availabilityCheckFailed);
                end;
                v118(v119);
            end);
            return;
        end;
    end;
    local function _(v129) --[[ Line: 349 ]]
        -- upvalues: v76 (copy), v45 (ref), v77 (copy)
        return v76(v45(v77, {
            recoverySessionId = v129
        }));
    end;
    local function _(v131, v132, v133, v134) --[[ Line: 355 ]]
        -- upvalues: v76 (copy), v44 (ref), v77 (copy), v104 (copy), v84 (copy), v88 (copy), v92 (copy)
        return v76(v44(v77, {
            targetType = "RecoverySessionID", 
            ticket = v131, 
            userId = v104, 
            password = v84, 
            passwordRepeated = v88, 
            twoStepVerificationChallengeId = v132, 
            twoStepVerificationToken = v133, 
            accountBlob = v134, 
            newEmail = v92
        }));
    end;
    local function v145(v136, v137) --[[ Line: 374 ]]
        -- upvalues: l_HttpService_0 (ref), v72 (copy), l_ChallengeType_0 (ref), l_TwoStepVerificationActionType_0 (ref), v104 (copy), v99 (copy), v101 (copy), v48 (ref)
        local v138 = v136 and v136.errors and v136.errors[1] and v136.errors[1].fieldData or nil;
        local v139;
        if type(v138) ~= "string" then
            v139 = nil;
        else
            local v140 = l_HttpService_0:JSONDecode(v138);
            v139 = v140 and v140.challengeId or nil;
        end;
        if v139 == nil then
            return;
        else
            v72.utils.renderChallenge({
                title = "Authentication.AccountRecovery.LabelTwoStepVerification", 
                challengeType = l_ChallengeType_0.TwoStepVerification, 
                challengeParameters = {
                    actionType = l_TwoStepVerificationActionType_0.PasswordReset, 
                    challengeId = v139, 
                    userId = v104, 
                    allowRememberDevice = false
                }, 
                callbacks = {
                    OnChallengeCompleted = function(v141) --[[ Line: 395 ]] --[[ Name: OnChallengeCompleted ]]
                        -- upvalues: v137 (copy), v139 (copy)
                        v137(v139, v141.data.verificationToken);
                    end, 
                    OnChallengeInvalidated = function(_) --[[ Line: 398 ]] --[[ Name: OnChallengeInvalidated ]]
                        -- upvalues: v99 (ref), v101 (ref), v48 (ref)
                        v99(false);
                        v101(v48.UnknownErrorKey);
                    end, 
                    OnChallengeAbandoned = function(_) --[[ Line: 402 ]] --[[ Name: OnChallengeAbandoned ]]
                        -- upvalues: v99 (ref)
                        v99(false);
                    end, 
                    OnChallengeLoadFailed = function(_) --[[ Line: 405 ]] --[[ Name: OnChallengeLoadFailed ]]
                        -- upvalues: v99 (ref), v101 (ref), v48 (ref)
                        v99(false);
                        v101(v48.UnknownErrorKey);
                    end
                }
            });
            return;
        end;
    end;
    local function v146(v147, v148) --[[ Line: 413 ]] --[[ Name: handleUpdatePassword ]]
        -- upvalues: v99 (copy), l_AppStorageUtilities_0 (ref), v72 (copy), v76 (copy), v44 (ref), v77 (copy), v104 (copy), v84 (copy), v88 (copy), v92 (copy), v47 (ref), v145 (copy), v146 (copy), l_Logger_0 (ref), l_HttpService_0 (ref), v101 (copy), v48 (ref), v51 (ref), v43 (ref), v41 (ref), v128 (copy), v82 (copy), v45 (ref)
        v99(true);
        local v149 = l_AppStorageUtilities_0.getAccountBlob() or "";
        local l_recoverySessionId_1 = v72.state.recoverySessionId;
        v76(v44(v77, {
            targetType = "RecoverySessionID", 
            ticket = l_recoverySessionId_1, 
            userId = v104, 
            password = v84, 
            passwordRepeated = v88, 
            twoStepVerificationChallengeId = v147, 
            twoStepVerificationToken = v148, 
            accountBlob = v149, 
            newEmail = v92
        })):andThen(function(v151) --[[ Line: 422 ]]
            -- upvalues: v47 (ref), v145 (ref), v146 (ref), l_Logger_0 (ref), l_HttpService_0 (ref), v101 (ref), v48 (ref), v99 (ref), v51 (ref), v72 (ref), v43 (ref), v41 (ref), v128 (ref), v104 (ref), v82 (ref), v76 (ref), v45 (ref), v77 (ref)
            if v151.isError then
                if v151.errorCode == v47.TwoStepVerificationRequired and v151.errorRaw ~= nil then
                    v145(v151.errorRaw, v146);
                    return;
                else
                    l_Logger_0:warning("Error sending code: {}", l_HttpService_0:JSONEncode(v151));
                    v101(v151.errorKey or v48.UnknownErrorKey);
                    v99(false);
                    return;
                end;
            elseif v51() and v151.data.shouldPromptPasskeyAddition then
                v72.dispatch({
                    type = v43.SET_MODAL_STATE_AND_PROPS, 
                    data = {
                        modalStateAndProps = {
                            modalState = v41.ADD_NEW_PASSKEY, 
                            props = {
                                onPasswordResetSuccess = function() --[[ Line: 446 ]] --[[ Name: onPasswordResetSuccess ]]
                                    -- upvalues: v128 (ref), v151 (copy)
                                    v128(v151.data.shouldAutoLoginFromRecovery);
                                end, 
                                shouldUpdateEmail = v151.data.shouldUpdateEmail, 
                                email = v151.data.shouldUpdateEmail and v151.data.recoveryEmail or "", 
                                userId = v104, 
                                username = v82
                            }
                        }
                    }
                });
                return;
            elseif v51() and v151.data.shouldPrompt2svRemoval then
                v72.dispatch({
                    type = v43.SET_MODAL_STATE_AND_PROPS, 
                    data = {
                        modalStateAndProps = {
                            modalState = v41.SAVE_OR_DELETE_TWO_STEP_METHOD, 
                            props = {
                                onPasswordResetSuccess = function() --[[ Line: 464 ]] --[[ Name: onPasswordResetSuccess ]]
                                    -- upvalues: v128 (ref), v151 (copy)
                                    v128(v151.data.shouldAutoLoginFromRecovery);
                                end, 
                                shouldUpdateEmail = v151.data.shouldUpdateEmail, 
                                email = v151.data.shouldUpdateEmail and v151.data.recoveryEmail or ""
                            }
                        }
                    }
                });
                return;
            elseif v151.data.shouldUpdateEmail then
                v72.dispatch({
                    type = v43.SET_MODAL_STATE_AND_PROPS, 
                    data = {
                        modalStateAndProps = {
                            modalState = v41.UPDATE_EMAIL, 
                            props = {
                                email = v151.data.recoveryEmail, 
                                onPasswordResetSuccess = function() --[[ Line: 481 ]] --[[ Name: onPasswordResetSuccess ]]
                                    -- upvalues: v128 (ref), v151 (copy)
                                    v128(v151.data.shouldAutoLoginFromRecovery);
                                end
                            }
                        }
                    }
                });
                return;
            else
                local l_recoverySessionId_2 = v72.state.recoverySessionId;
                v76(v45(v77, {
                    recoverySessionId = l_recoverySessionId_2
                })):andThen(function() --[[ Line: 490 ]]
                    -- upvalues: v128 (ref), v151 (copy)
                    v128(v151.data.shouldAutoLoginFromRecovery);
                end);
                return;
            end;
        end):await();
    end;
    local function v154(v153) --[[ Line: 500 ]]
        -- upvalues: v102 (copy), v103 (copy)
        if v102 ~= v153.AbsoluteSize then
            v103(v153.AbsoluteSize);
        end;
    end;
    local v155 = l_useLocalization_0({
        resetPasswordHeadingText = "Authentication.AccountRecovery.Heading.ResetPassword", 
        createNewPasswordText = "Authentication.AccountRecovery.Description.CreateNewPassword", 
        createNewPasswordAddEmailText = "Authentication.AccountRecovery.Description.CreateNewPasswordAddEmail", 
        newPasswordLabelText = "Authentication.AccountRecovery.Label.NewPasswordV2", 
        confirmPasswordLabelText = "Authentication.AccountRecovery.Label.ConfirmNewPasswordV2", 
        updatePasswordButtonText = "Authentication.AccountRecovery.Action.UpdatePassword", 
        addEmailLabelText = "Authentication.AccountRecovery.Label.AddEmail", 
        requestErrorText = if v100 ~= "" then v100 else nil
    });
    return v3.createElement(l_FullscreenPageWithSafeArea_0, {
        includeStatusBar = true, 
        BackgroundColor3 = v73.Theme.BackgroundDefault.Color
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v75.Global.Space_100), 
            PaddingLeft = UDim.new(0, v75.Global.Space_150), 
            PaddingRight = UDim.new(0, v75.Global.Space_150), 
            PaddingBottom = UDim.new(0, v75.Global.Space_100)
        }), 
        Wrapper = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v75.Global.Space_250)
            }), 
            PreScrollContent = v3.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                [v3.Change.AbsoluteSize] = v154
            }, {
                Header = v3.createElement(v35, {
                    LayoutOrder = 1, 
                    onBackActivated = function() --[[ Line: 546 ]] --[[ Name: onBackActivated ]]
                        -- upvalues: v71 (copy)
                        v71.navigation.goBack();
                    end, 
                    backButtonDisabled = v98, 
                    recoveryHeadingText = v155.resetPasswordHeadingText, 
                    currentComponent = "resetPassword", 
                    recoverySessionId = v72.state.recoverySessionId
                })
            }), 
            ContentScrollView = v3.createElement(l_ScrollView_0, {
                LayoutOrder = 2, 
                scroll = {
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    CanvasSize = UDim2.new(1, 0, 0, 0), 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    scrollBarVisibility = l_Visibility_0.Auto
                }, 
                Size = UDim2.new(1, 0, 1, -v102.Y)
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v75.Global.Space_100), 
                    PaddingRight = UDim.new(0, v75.Global.Space_100)
                }), 
                UIListLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, v75.Global.Space_20)
                }), 
                UserHeader = v3.createElement(v36, {
                    LayoutOrder = 1, 
                    userId = v104, 
                    displayName = v80, 
                    username = v82
                }), 
                BodyText = v3.createElement(l_Text_0, {
                    LayoutOrder = 2, 
                    Text = v105 and v155.createNewPasswordAddEmailText or v155.createNewPasswordText, 
                    TextWrapped = true, 
                    fontStyle = v74.Typography.BodyMedium, 
                    textStyle = v74.Color.Content.Default, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    padding = {
                        top = UDim.new(0, v74.Size.Size_300), 
                        bottom = UDim.new(0, v74.Size.Size_300)
                    }
                }), 
                NewPasswordLabel = v3.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 3, 
                    text = v155.newPasswordLabelText, 
                    fontStyle = v74.Typography.TitleMedium, 
                    colorStyle = v73.Theme.TextEmphasis, 
                    automaticSize = Enum.AutomaticSize.XY
                }), 
                NewPasswordFrame = v3.createElement("Frame", {
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1
                }, {
                    NewPasswordPadding = v3.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, v74.Size.Size_50), 
                        PaddingBottom = UDim.new(0, v74.Size.Size_300)
                    }), 
                    NewPasswordField = v3.createElement(l_AuthTextInputValidator_0, {
                        layoutOrder = 1, 
                        textInputType = Enum.TextInputType.Password, 
                        disabled = v98, 
                        validator = l_PasswordValidator_0, 
                        validatorAdditionalProps = {
                            username = v82
                        }, 
                        validatorIssuePriorityList = v66, 
                        validatorIssueMessageList = v68, 
                        onTextChanged = v110, 
                        customPadding = 0, 
                        issueHeight = v74.Size.Size_500, 
                        hideIconButton = true, 
                        useFoundationTextForIssue = true, 
                        foundationIssueTextPadding = v74.Size.Size_200, 
                        size = l_InputSize_0.Medium
                    })
                }), 
                ConfirmPasswordLabel = v3.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 5, 
                    text = v155.confirmPasswordLabelText, 
                    fontStyle = v74.Typography.TitleMedium, 
                    colorStyle = v73.Theme.TextEmphasis, 
                    automaticSize = Enum.AutomaticSize.XY
                }), 
                ConfirmPasswordFrame = v3.createElement("Frame", {
                    LayoutOrder = 6, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1
                }, {
                    ConfirmPasswordPadding = v3.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, v74.Size.Size_50), 
                        PaddingBottom = UDim.new(0, v74.Size.Size_300)
                    }), 
                    ConfirmPasswordField = v3.createElement(l_AuthTextInputValidator_0, {
                        layoutOrder = 2, 
                        textInputType = Enum.TextInputType.Password, 
                        disabled = v98, 
                        validator = v37, 
                        validatorAdditionalProps = {
                            password = v84
                        }, 
                        validationDependencies = {
                            v84
                        }, 
                        validatorIssueMessageList = v69, 
                        onTextChanged = v113, 
                        customPadding = 0, 
                        issueHeight = v74.Size.Size_500, 
                        hideIconButton = true, 
                        useFoundationTextForIssue = true, 
                        foundationIssueTextPadding = v74.Size.Size_200, 
                        size = l_InputSize_0.Medium
                    })
                }), 
                AddEmailLabel = v105 and v3.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 7, 
                    text = v155.addEmailLabelText, 
                    fontStyle = v74.Typography.TitleMedium, 
                    colorStyle = v73.Theme.TextEmphasis, 
                    automaticSize = Enum.AutomaticSize.XY
                }), 
                AddEmailFrame = v105 and v3.createElement("Frame", {
                    LayoutOrder = 8, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1
                }, {
                    AddEmailPadding = v3.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, v74.Size.Size_50), 
                        PaddingBottom = UDim.new(0, v74.Size.Size_300)
                    }), 
                    AddEmailField = v105 and v3.createElement(l_AuthTextInputValidator_0, {
                        layoutOrder = 3, 
                        textInputType = Enum.TextInputType.Email, 
                        disabled = v98, 
                        validator = v39, 
                        validatorIssueMessageList = v70, 
                        onTextChanged = v116, 
                        customPadding = 0, 
                        issueHeight = v74.Size.Size_500, 
                        hideIconButton = true, 
                        useFoundationTextForIssue = true, 
                        foundationIssueTextPadding = v74.Size.Size_200, 
                        size = l_InputSize_0.Medium
                    })
                }), 
                UpdatePasswordButton = v3.createElement(l_Button_0, {
                    LayoutOrder = 9, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    size = l_InputSize_0.Medium, 
                    text = v155.updatePasswordButtonText, 
                    width = UDim.new(1, 0), 
                    onActivated = function() --[[ Line: 708 ]] --[[ Name: onActivated ]]
                        -- upvalues: v146 (copy)
                        v146();
                    end, 
                    isDisabled = not v96
                }), 
                RequestErrorTextLabel = v3.createElement(l_Text_0, {
                    LayoutOrder = 11, 
                    Text = v155.requestErrorText or "", 
                    fontStyle = v74.Typography.CaptionSmall, 
                    textStyle = v74.Color.System.Alert, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    padding = {
                        top = UDim.new(0, v74.Size.Size_200)
                    }
                }), 
                Modal = v42(v72.state.modalStateAndProps)
            })
        })
    });
end;