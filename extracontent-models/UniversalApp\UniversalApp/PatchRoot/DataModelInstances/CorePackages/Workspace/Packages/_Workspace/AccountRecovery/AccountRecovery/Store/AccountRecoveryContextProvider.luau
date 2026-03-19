local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountRecovery");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.React);
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_LaunchContext_0 = require(l_Parent_0.AppStartup).Enums.LaunchContext;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v9 = require(l_Parent_0.RoactServiceTags);
local l_RoactNetworking_0 = v9.RoactNetworking;
local l_RoactAnalytics_0 = v9.RoactAnalytics;
local l_useNavigationProps_0 = require(l_Parent_0.RobloxAppNavigation).useNavigationProps;
local l_RenderChallenge_0 = require(l_Parent_0.GenericChallenges).Middleware.RenderChallenge;
local l_ChallengeType_0 = require(l_Parent_0.GenericChallenges).Types.ChallengeType;
local l_TwoStepVerificationActionType_0 = require(l_Parent_0.GenericChallenges).Types.TwoStepVerificationActionType;
local l_AppStorageUtilities_0 = require(l_Parent_0.AuthCommon).Utils.AppStorageUtilities;
local _ = require(l_script_FirstAncestor_0.Store.State);
local v18 = require(l_script_FirstAncestor_0.Store.AccountRecoveryContext);
local v19 = require(l_script_FirstAncestor_0.Store.AccountRecoveryStateReducer);
local v20 = require(l_script_FirstAncestor_0.Thunks.PhonePrefixList);
local _ = require(l_script_FirstAncestor_0.Common.AccountRecoveryRequestTypes);
local v22 = require(l_script_FirstAncestor_0.Enums.AccountRecoveryActionType);
local v23 = require(l_script_FirstAncestor_0.Enums.ModalState);
local v24 = require(l_script_FirstAncestor_0.Thunks.ContinueRecovery);
local v25 = require(l_script_FirstAncestor_0.Thunks.ResetPassword);
local v26 = require(l_script_FirstAncestor_0.Enums.AccountRecoveryErrorCodes);
local v27 = require(l_script_FirstAncestor_0.Components.Constants);
local v28 = require(l_script_FirstAncestor_0.Analytics.MetricsService);
local v29 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnable2SVRecovery);
local v30 = require(l_script_FirstAncestor_0.Analytics.EventService);
local l_GetFFlagEnableAutoLoginAfterRecovery_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAutoLoginAfterRecovery;
local function _(v32) --[[ Line: 65 ]]
    -- upvalues: l_HttpService_0 (copy)
    local v33 = v32 and v32.errors and v32.errors[1] and v32.errors[1].fieldData or nil;
    if type(v33) ~= "string" then
        return nil;
    else
        local v34 = l_HttpService_0:JSONDecode(v33);
        return v34 and v34.challengeId or nil;
    end;
end;
return function(v36) --[[ Line: 75 ]]
    -- upvalues: l_useNavigationProps_0 (copy), v23 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_RoactAnalytics_0 (copy), l_useAppPolicy_0 (copy), v3 (copy), v19 (copy), l_LaunchContext_0 (copy), l_RenderChallenge_0 (copy), v20 (copy), l_HttpService_0 (copy), l_Logger_0 (copy), v28 (copy), l_ChallengeType_0 (copy), l_TwoStepVerificationActionType_0 (copy), v29 (copy), v24 (copy), v26 (copy), v27 (copy), v25 (copy), l_GetFFlagEnableAutoLoginAfterRecovery_0 (copy), v30 (copy), l_AppStorageUtilities_0 (copy), v22 (copy), v18 (copy)
    local v39 = l_useNavigationProps_0(function(v37, v38) --[[ Line: 77 ]]
        return {
            continuingRecovery = v38.continuingRecovery, 
            recover2sv = v38.recover2sv, 
            recoverPassword = v38.recoverPassword == nil or v38.recoverPassword, 
            recoverySessionID = v38.continuingRecovery and v38.recoverySessionID or nil, 
            identifier = v38.identifier, 
            deeplinkUuid = v37
        };
    end);
    local v40 = {
        monoDeps = v36.monoDeps, 
        continuingRecovery = v39.continuingRecovery or false, 
        recoverySessionId = v39.recoverySessionID or "", 
        phonePrefixList = {}, 
        autofillIdentifier = v39.identifier or "", 
        recover2sv = v39.recover2sv or false, 
        recoverPassword = v39.recoverPassword or false, 
        deeplinkUuid = v39.deeplinkUuid or "", 
        modalStateAndProps = {
            modalState = v23.NONE, 
            props = nil
        }
    };
    local v41 = l_useDispatch_0();
    local v42 = l_useRoactService_0(l_RoactNetworking_0);
    local v43 = l_useRoactService_0(l_RoactAnalytics_0);
    local v45 = l_useAppPolicy_0(function(v44) --[[ Line: 112 ]]
        return v44;
    end);
    local v46, v47 = v3.useReducer(v19, v40);
    local l_LaunchApp_0 = v46.monoDeps.LaunchApp;
    local function v49() --[[ Line: 120 ]]
        -- upvalues: v41 (copy), l_LaunchApp_0 (copy), v42 (copy), v43 (copy), v45 (copy), l_LaunchContext_0 (ref)
        return v41(l_LaunchApp_0(v42, nil, v43, v45, l_LaunchContext_0.Login));
    end;
    local function v51(v50) --[[ Line: 124 ]]
        -- upvalues: l_RenderChallenge_0 (ref)
        return l_RenderChallenge_0(v50);
    end;
    local function _() --[[ Line: 128 ]]
        -- upvalues: v41 (copy), v20 (ref), v42 (copy)
        return v41(v20(v42));
    end;
    local function v67(v53, v54, v55, v56, v57) --[[ Line: 133 ]]
        -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), v28 (ref), v51 (copy), l_ChallengeType_0 (ref), l_TwoStepVerificationActionType_0 (ref), v29 (ref)
        local v58 = v54 and v54.errors and v54.errors[1] and v54.errors[1].fieldData or nil;
        local v59;
        if type(v58) ~= "string" then
            v59 = nil;
        else
            local v60 = l_HttpService_0:JSONDecode(v58);
            v59 = v60 and v60.challengeId or nil;
        end;
        if v59 == nil then
            l_Logger_0:error("Two step verification challenge ID is nil");
            v28.reportTwoStepVerificationChallengeIDIsNil();
            return;
        else
            v58 = nil;
            v58 = {
                OnChallengeCompleted = function(v61) --[[ Line: 155 ]] --[[ Name: OnChallengeCompleted ]]
                    -- upvalues: v55 (copy), v59 (copy)
                    v55(v59, v61.data.verificationToken);
                end, 
                OnChallengeInvalidated = function(v62) --[[ Line: 163 ]] --[[ Name: OnChallengeInvalidated ]]
                    -- upvalues: v58 (ref), v56 (copy)
                    v58.OnChallengeCompleted = function(_) --[[ Line: 164 ]]

                    end;
                    v56.OnChallengeInvalidated(v62);
                end, 
                OnChallengeAbandoned = function() --[[ Line: 167 ]] --[[ Name: OnChallengeAbandoned ]]
                    -- upvalues: v58 (ref), v56 (copy)
                    v58.OnChallengeCompleted = function(_) --[[ Line: 168 ]]

                    end;
                    v56.OnChallengeAbandoned();
                end, 
                OnChallengeLoadFailed = function(v65) --[[ Line: 171 ]] --[[ Name: OnChallengeLoadFailed ]]
                    -- upvalues: v58 (ref), v56 (copy)
                    v58.OnChallengeCompleted = function(_) --[[ Line: 172 ]]

                    end;
                    v56.OnChallengeLoadFailed(v65);
                end
            };
            return v51({
                title = "Authentication.AccountRecovery.LabelTwoStepVerification", 
                challengeType = l_ChallengeType_0.TwoStepVerification, 
                challengeParameters = {
                    actionType = l_TwoStepVerificationActionType_0.PasswordReset, 
                    challengeId = v59, 
                    userId = tostring(v53), 
                    allowRememberDevice = false, 
                    clientSupports2svRecovery = v29() and true or false, 
                    recoverySessionId = v57
                }, 
                callbacks = v58
            });
        end;
    end;
    local function _(v68, v69, v70, v71, v72) --[[ Line: 191 ]]
        -- upvalues: v41 (copy), v24 (ref), v42 (copy)
        return v41(v24(v42, {
            recoverySessionId = v68, 
            userId = v69, 
            recover2sv = v70, 
            twoStepVerificationChallengeId = v71, 
            twoStepVerificationToken = v72
        }));
    end;
    local function v74(v75, v76, v77, v78, v79, v80, v81, v82) --[[ Line: 207 ]] --[[ Name: handleContinueRecovery ]]
        -- upvalues: v41 (copy), v24 (ref), v42 (copy), v26 (ref), v67 (copy), v74 (copy), v27 (ref), l_Logger_0 (ref), l_HttpService_0 (ref)
        v41(v24(v42, {
            recoverySessionId = v75, 
            userId = v76, 
            recover2sv = v80, 
            twoStepVerificationChallengeId = v81, 
            twoStepVerificationToken = v82
        })):andThen(function(v83) --[[ Line: 218 ]]
            -- upvalues: v26 (ref), v67 (ref), v76 (copy), v74 (ref), v75 (copy), v77 (copy), v78 (copy), v79 (copy), v80 (copy), v27 (ref), l_Logger_0 (ref), l_HttpService_0 (ref)
            if v83.isError then
                if v83.errorCode == v26.TwoStepVerificationRequired and v83.errorRaw ~= nil then
                    v67(v76, v83.errorRaw, function(v84, v85) --[[ Line: 227 ]]
                        -- upvalues: v74 (ref), v75 (ref), v76 (ref), v77 (ref), v78 (ref), v79 (ref), v80 (ref)
                        v74(v75, v76, v77, v78, v79, v80, v84, v85);
                    end, {
                        OnChallengeInvalidated = function(_) --[[ Line: 240 ]] --[[ Name: OnChallengeInvalidated ]]
                            -- upvalues: v78 (ref), v27 (ref)
                            v78(v27.UnknownErrorKey);
                        end, 
                        OnChallengeAbandoned = function() --[[ Line: 243 ]] --[[ Name: OnChallengeAbandoned ]]
                            -- upvalues: v79 (ref)
                            v79();
                        end, 
                        OnChallengeLoadFailed = function(_) --[[ Line: 246 ]] --[[ Name: OnChallengeLoadFailed ]]
                            -- upvalues: v78 (ref), v27 (ref)
                            v78(v27.UnknownErrorKey);
                        end
                    }, v75);
                    return;
                else
                    l_Logger_0:warning("Error continuing recovery: {}", l_HttpService_0:JSONEncode(v83));
                    v78(v83.errorKey or v27.UnknownErrorKey);
                    return;
                end;
            else
                v77(v83.data);
                return;
            end;
        end):await();
    end;
    local function _(v88, v89, v90, v91, v92, v93, v94, v95) --[[ Line: 263 ]]
        -- upvalues: v41 (copy), v25 (ref), v42 (copy)
        return v41(v25(v42, {
            targetType = "RecoverySessionID", 
            ticket = v88, 
            userId = v89, 
            password = v90, 
            passwordRepeated = v91, 
            accountBlob = v92, 
            twoStepVerificationChallengeId = v93, 
            twoStepVerificationToken = v94, 
            newEmail = v95
        }));
    end;
    local function v99(v97) --[[ Line: 286 ]] --[[ Name: launchAppOrGoBack ]]
        -- upvalues: l_GetFFlagEnableAutoLoginAfterRecovery_0 (ref), v30 (ref), v46 (copy), v41 (copy), l_LaunchApp_0 (copy), v42 (copy), v43 (copy), v45 (copy), l_LaunchContext_0 (ref), v36 (copy)
        if v97 and l_GetFFlagEnableAutoLoginAfterRecovery_0() then
            v30.sendPasswordResetEvent(v46.recoverySessionId, "launchApp");
            local _ = v41(l_LaunchApp_0(v42, nil, v43, v45, l_LaunchContext_0.Login));
            return;
        else
            v30.sendPasswordResetEvent(v46.recoverySessionId, "closeRecoveryFlow");
            v36.parentNavigation.goBack();
            return;
        end;
    end;
    local function v112(v100, v101, v102, v103, v104, v105, v106, v107, v108, v109) --[[ Line: 296 ]] --[[ Name: handleUpdatePassword ]]
        -- upvalues: l_AppStorageUtilities_0 (ref), v41 (copy), v25 (ref), v42 (copy), l_Logger_0 (ref), l_HttpService_0 (ref), v27 (ref), v29 (ref), v47 (copy), v22 (ref), v23 (ref)
        local v110 = l_AppStorageUtilities_0.getAccountBlob() or "";
        v41(v25(v42, {
            targetType = "RecoverySessionID", 
            ticket = v100, 
            userId = v101, 
            password = v103, 
            passwordRepeated = v104, 
            accountBlob = v110, 
            twoStepVerificationChallengeId = v107, 
            twoStepVerificationToken = v108, 
            newEmail = v109
        })):andThen(function(v111) --[[ Line: 319 ]]
            -- upvalues: l_Logger_0 (ref), l_HttpService_0 (ref), v105 (copy), v27 (ref), v29 (ref), v47 (ref), v22 (ref), v23 (ref), v106 (copy), v101 (copy), v102 (copy)
            if v111.isError then
                l_Logger_0:warning("Error resetting password: {}", l_HttpService_0:JSONEncode(v111));
                v105(v111.errorKey or v27.UnknownErrorKey);
                return;
            elseif v29() and v111.data.shouldPromptPasskeyAddition then
                v47({
                    type = v22.SET_MODAL_STATE_AND_PROPS, 
                    data = {
                        modalStateAndProps = {
                            modalState = v23.ADD_NEW_PASSKEY, 
                            props = {
                                onPasswordResetSuccess = function() --[[ Line: 334 ]] --[[ Name: onPasswordResetSuccess ]]
                                    -- upvalues: v106 (ref), v111 (copy)
                                    v106(v111.data.shouldAutoLoginFromRecovery);
                                end, 
                                shouldUpdateEmail = v111.data.shouldUpdateEmail, 
                                email = v111.data.shouldUpdateEmail and v111.data.recoveryEmail or "", 
                                userId = v101, 
                                username = v102
                            }
                        }
                    }
                });
                return;
            elseif v29() and v111.data.shouldPrompt2svRemoval then
                v47({
                    type = v22.SET_MODAL_STATE_AND_PROPS, 
                    data = {
                        modalStateAndProps = {
                            modalState = v23.SAVE_OR_DELETE_TWO_STEP_METHOD, 
                            props = {
                                onPasswordResetSuccess = function() --[[ Line: 352 ]] --[[ Name: onPasswordResetSuccess ]]
                                    -- upvalues: v106 (ref), v111 (copy)
                                    v106(v111.data.shouldAutoLoginFromRecovery);
                                end, 
                                shouldUpdateEmail = v111.data.shouldUpdateEmail, 
                                email = v111.data.shouldUpdateEmail and v111.data.recoveryEmail or ""
                            }
                        }
                    }
                });
                return;
            elseif v111.data.shouldUpdateEmail then
                v47({
                    type = v22.SET_MODAL_STATE_AND_PROPS, 
                    data = {
                        modalStateAndProps = {
                            modalState = v23.UPDATE_EMAIL, 
                            props = {
                                email = v111.data.recoveryEmail, 
                                onPasswordResetSuccess = function() --[[ Line: 369 ]] --[[ Name: onPasswordResetSuccess ]]
                                    -- upvalues: v106 (ref), v111 (copy)
                                    v106(v111.data.shouldAutoLoginFromRecovery);
                                end
                            }
                        }
                    }
                });
                return;
            else
                v106(v111.data.shouldAutoLoginFromRecovery);
                return;
            end;
        end):await();
    end;
    v3.useEffect(function() --[[ Line: 383 ]]
        -- upvalues: v29 (ref), v36 (copy), v39 (copy), v47 (copy), v22 (ref)
        if v29() and v36.resetChildNavigationToFirstScreen and v39.continuingRecovery then
            v47({
                type = v22.RESET_RECOVERY_FLOW, 
                data = {
                    continuingRecovery = v39.continuingRecovery, 
                    recover2sv = v39.recover2sv or false, 
                    recoverPassword = v39.recoverPassword or false, 
                    recoverySessionId = v39.recoverySessionID or "", 
                    autofillIdentifier = v39.identifier or "", 
                    deeplinkUuid = v39.deeplinkUuid or ""
                }
            });
            v36.resetChildNavigationToFirstScreen();
        end;
    end, {
        v39.deeplinkUuid
    });
    v3.useEffect(function() --[[ Line: 404 ]]
        -- upvalues: v41 (copy), v20 (ref), v42 (copy), l_Logger_0 (ref), l_HttpService_0 (ref), v47 (copy), v22 (ref)
        v41(v20(v42)):andThen(function(v113) --[[ Line: 405 ]]
            -- upvalues: l_Logger_0 (ref), l_HttpService_0 (ref), v47 (ref), v22 (ref)
            if v113.isError then
                l_Logger_0:warning("Error getting phone prefix list: {}", l_HttpService_0:JSONEncode(v113));
                return;
            else
                v47({
                    type = v22.SET_PHONE_PREFIX_LIST, 
                    data = {
                        phonePrefixList = v113.data
                    }
                });
                return;
            end;
        end);
    end, {});
    return v3.createElement(v18.Provider, {
        value = {
            state = v46, 
            dispatch = v47, 
            parentNavigation = v36.parentNavigation, 
            utils = {
                launchApp = v49, 
                renderChallenge = v51, 
                handleTwoStepVerificationError = v67, 
                handleContinueRecovery = v74, 
                handleUpdatePassword = v112, 
                launchAppOrGoBack = v99
            }
        }
    }, v36.children);
end;