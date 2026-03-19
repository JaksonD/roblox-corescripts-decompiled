local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_Modules_0.LuaApp.Promise);
local v7 = require(l_Modules_0.LuaApp.AppPage);
local v8 = require(script.Parent.User);
local v9 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v10 = require(l_Modules_0.LuaApp.Thunks.Authentication.LaunchApp);
local v11 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v12 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v13 = require(l_Modules_0.LuaApp.Http.Requests.SignUpRequests);
local v14 = require(l_Modules_0.LuaApp.Enum.SignUpV2ErrorCodes);
local v15 = require(l_Modules_0.LuaApp.Enum.VerifiedSignupErrorCodes);
local v16 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v17 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local l_StatusCodes_0 = require(l_CorePackages_0.Workspace.Packages.Http).StatusCodes;
local v19 = require(l_Modules_0.LuaApp.Analytics.Events.reportEphemeralCounter);
local v20 = require(l_Modules_0.LuaApp.Analytics.Events.AppSignupCounterNames);
local v21 = require(l_Modules_0.LuaApp.Enum.LaunchContext);
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local v24 = require(l_Modules_0.LuaApp.Thunks.Captcha.GetDxBlob);
local v25 = require(l_Modules_0.LuaApp.Thunks.Captcha.GetCaptchaData);
local v26 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v27 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v28 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local v29 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol);
local l_Constants_0 = v29.Constants;
local l_default_0 = v29.CredentialsProtocol.default;
local v32 = game:DefineFastFlag("DispatchSignupV2ResetAppState", false);
local v33 = game:DefineFastFlag("EmitSinglePageSignupSuccessEvent", false);
local v34 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local v35 = require(l_Modules_0.LuaApp.Flags.FFlagLuaEnableDidSwitchAccount);
local v36 = require(l_Modules_0.LuaApp.Flags.GetFFlagConditionallyFireAuthenticatedCredentials);
local v37 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableSignupUnavailableInRegionError_0 = v37.FFlagEnableSignupUnavailableInRegionError;
local l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 = v37.FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues;
local l_FFlagDisableMemStorageServicePasswordEvent_0 = v37.FFlagDisableMemStorageServicePasswordEvent;
local l_GetFFlagEnableSavePasswordAfterRecovery_0 = v37.GetFFlagEnableSavePasswordAfterRecovery;
local v42 = require(l_Modules_0.LuaApp.Thunks.Authentication.RegisterPasskey);
local v43 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v44 = require(l_Modules_0.LuaApp.Thunks.Authentication.ResetAppState);
local v45 = require(l_Modules_0.LuaApp.Constants);
local l_EventStreamConstants_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).EventStreamConstants;
local l_AccountSwitcherConstants_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Common.AccountSwitcherConstants;
local v48 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.iosAuthServiceSignupPasswordSave);
local v49 = v5.interface({
    birthday = v5.string, 
    username = v5.string, 
    password = v5.string, 
    gender = v5.string, 
    locale = v5.optional(v5.string), 
    email = v5.optional(v5.string), 
    verifiedSignupVoucher = v5.optional(v5.string)
});
local function v54(v50, v51, v52, v53) --[[ Line: 82 ]] --[[ Name: signUpRequest ]]
    -- upvalues: l_getAppFeaturePolicies_0 (copy), v13 (copy)
    if l_getAppFeaturePolicies_0().getUseSingleSignOn() then
        return v13.singleSignOnSignup(v50, v51);
    elseif v53 then
        return v13.verifiedSignup(v50, v51, v52);
    else
        return v13.signUpV2(v50, v51, v52);
    end;
end;
return function(v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68) --[[ Line: 94 ]]
    -- upvalues: v49 (copy), v34 (copy), v8 (copy), v32 (copy), v44 (copy), v28 (copy), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (copy), l_AccountSwitcherConstants_0 (copy), v45 (copy), v35 (copy), l_GuiService_0 (copy), v16 (copy), v12 (copy), v7 (copy), v10 (copy), v21 (copy), v54 (copy), v19 (copy), v20 (copy), v33 (copy), v43 (copy), l_EventStreamConstants_0 (copy), v36 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (copy), l_MemStorageService_0 (copy), v17 (copy), l_HttpService_0 (copy), v42 (copy), v6 (copy), v48 (copy), l_default_0 (copy), l_Constants_0 (copy), l_Logger_0 (copy), l_GetFFlagEnableSavePasswordAfterRecovery_0 (copy), v15 (copy), v14 (copy), l_FFlagEnableSignupUnavailableInRegionError_0 (copy), l_StatusCodes_0 (copy), v24 (copy), v25 (copy), v9 (copy), v26 (copy), v27 (copy), v11 (copy)
    return function(v69) --[[ Line: 110 ]]
        -- upvalues: v49 (ref), v62 (copy), v34 (ref), v8 (ref), v32 (ref), v44 (ref), v28 (ref), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (ref), l_AccountSwitcherConstants_0 (ref), v45 (ref), v35 (ref), l_GuiService_0 (ref), v16 (ref), v12 (ref), v7 (ref), v10 (ref), v55 (copy), v56 (copy), v60 (copy), v61 (copy), v21 (ref), v54 (ref), v59 (copy), v63 (copy), v57 (copy), v19 (ref), v20 (ref), v33 (ref), v67 (copy), v43 (ref), l_EventStreamConstants_0 (ref), v66 (copy), v68 (copy), v36 (ref), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v17 (ref), l_HttpService_0 (ref), v64 (copy), v65 (copy), v42 (ref), v6 (ref), v48 (ref), l_default_0 (ref), l_Constants_0 (ref), l_Logger_0 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v15 (ref), v14 (ref), l_FFlagEnableSignupUnavailableInRegionError_0 (ref), l_StatusCodes_0 (ref), v24 (ref), v25 (ref), v58 (copy), v9 (ref), v26 (ref), v27 (ref), v11 (ref)
        assert(v49(v62));
        local function v73(v70, v71) --[[ Line: 113 ]] --[[ Name: proceedPostSignup ]]
            -- upvalues: v34 (ref), v8 (ref), v32 (ref), v69 (copy), v44 (ref), v28 (ref), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (ref), l_AccountSwitcherConstants_0 (ref), v45 (ref), v35 (ref), l_GuiService_0 (ref), v16 (ref), v12 (ref), v7 (ref), v10 (ref), v55 (ref), v56 (ref), v60 (ref), v61 (ref), v21 (ref)
            if v34 == true then
                local v72 = v8.fromLocalStorage();
                if v72 and v72.userId ~= -1 then
                    if v32 then
                        v69:dispatch(v44());
                    else
                        v44();
                    end;
                    v28.setAccountSwitchStatus(if l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 then l_AccountSwitcherConstants_0.AccountSwitcherSwitchedFromSignupStatus else v45.Auth.AccountSwitcherSwitchedStatus);
                    v28.setAccountBlob(v70.responseBody.accountBlob);
                    v28.flush();
                    if v35 then
                        l_GuiService_0:BroadcastNotification("", v16.DID_SWITCH_ACCOUNT);
                        return;
                    else
                        l_GuiService_0:BroadcastNotification("", v16.DID_LOG_OUT);
                        return;
                    end;
                else
                    v28.setAccountBlob(v70.responseBody.accountBlob);
                    v28.flush();
                    if v71 then
                        v69:dispatch(v12({
                            {
                                name = v7.AddAuthMethodPage
                            }
                        }));
                        return;
                    else
                        v69:dispatch(v10(v55, v56, v60, v61, v21.SignUp));
                        return;
                    end;
                end;
            elseif v71 then
                v69:dispatch(v12({
                    {
                        name = v7.AddAuthMethodPage
                    }
                }));
                return;
            else
                v69:dispatch(v10(v55, v56, v60, v61, v21.SignUp));
                return;
            end;
        end;
        return v54(v55, v62, v59, v63):andThen(function(v74) --[[ Line: 164 ]]
            -- upvalues: v57 (ref), v16 (ref), v19 (ref), v20 (ref), v33 (ref), v67 (ref), v43 (ref), l_EventStreamConstants_0 (ref), v62 (ref), v66 (ref), v68 (ref), v36 (ref), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v17 (ref), l_HttpService_0 (ref), v64 (ref), v28 (ref), v65 (ref), v42 (ref), v55 (ref), v73 (copy), v6 (ref), v48 (ref), l_default_0 (ref), l_Constants_0 (ref), l_Logger_0 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref)
            v57:BroadcastNotification("", v16.DID_SIGN_UP);
            v19(v20.Success, 1);
            if v33 then
                v67.reportAuthFormInteraction(v43.Context.SinglePageSignUpScreen, l_EventStreamConstants_0.Field.SignupSuccess);
            end;
            local v75 = v62.username and v62.password and string.len(v62.password) > 0;
            local v76 = v66 and v62.password and v68;
            if (not v36() or v75) and not l_FFlagDisableMemStorageServicePasswordEvent_0 and not v76 then
                l_MemStorageService_0:Fire(v17.AuthenticatedCredentials, l_HttpService_0:JSONEncode({
                    cvalue = v62.username, 
                    password = v62.password, 
                    authType = "signup"
                }));
            end;
            local function v79() --[[ Line: 199 ]] --[[ Name: continuePostSignup ]]
                -- upvalues: v64 (ref), v28 (ref), v62 (ref), v65 (ref), v42 (ref), v55 (ref), v67 (ref), v43 (ref), v73 (ref), v74 (copy), v6 (ref)
                if v64 then
                    v28.setSignupActionRequired("auth");
                    v28.setPasskeySignupUsername(v62.username);
                    if v65 then
                        return v42(v55):andThen(function(_) --[[ Line: 206 ]]
                            -- upvalues: v28 (ref), v67 (ref), v43 (ref), v73 (ref), v74 (ref), v6 (ref)
                            v28.setSignupActionRequired("");
                            v67.reportAuthModalShown(v43.Context.SignupPasskeyCreated, "success");
                            v28.flush();
                            v73(v74, false);
                            return v6.resolve();
                        end, function(v78) --[[ Line: 216 ]]
                            -- upvalues: v67 (ref), v43 (ref), v28 (ref), v73 (ref), v74 (ref), v6 (ref)
                            if v78.name then
                                v67.reportAuthModalShown(v43.Context.SignupPasskeyCreated, v78.name);
                                if type(v78.body) == "string" then
                                    v67.reportAuthClientError(v43.Context.SignupPasskeyCreated, v78.body, v78.source);
                                end;
                            else
                                v67.reportAuthModalShown(v43.Context.SignupPasskeyCreated, "unknown");
                            end;
                            v28.flush();
                            v73(v74, true);
                            return v6.resolve();
                        end);
                    end;
                end;
                v28.flush();
                v73(v74, v64);
                return v6.resolve();
            end;
            if v66 and v62.password then
                local v80 = {
                    username = v62.username, 
                    password = v62.password
                };
                local v81 = l_HttpService_0:JSONEncode(v80);
                local function v85() --[[ Line: 261 ]]
                    -- upvalues: v67 (ref), v43 (ref), v48 (ref), v62 (ref), l_default_0 (ref), v81 (copy), l_Constants_0 (ref), l_HttpService_0 (ref), l_Logger_0 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v68 (ref), v79 (copy)
                    v67.reportAuthButtonClick(v43.Context.IosAuthServiceSignup, v43.Button.IosAuthServiceSavePasswordAttempted);
                    v48.reportAttempted(v62.username);
                    return l_default_0:registerCredentials(l_default_0.CredentialsTypes.password, v81, l_Constants_0.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(v82) --[[ Line: 273 ]]
                        -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), v67 (ref), v43 (ref), v48 (ref), v62 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v68 (ref), v79 (ref)
                        local v83 = if v82 then l_HttpService_0:JSONDecode(v82) else {};
                        if v83 and v83.errorCode == nil then
                            l_Logger_0:info("Successfully registered password.");
                            v67.reportAuthButtonClick(v43.Context.CMPasswordSignup, v43.Button.SavePassword);
                            v67.reportAuthButtonClick(v43.Context.IosAuthServiceSignup, v43.Button.IosAuthServiceSavePasswordSuccess);
                            v48.reportSuccess(v62.username);
                        else
                            l_Logger_0:warning("Error registering password: ", v83.errorMsg);
                            v67.reportAuthButtonClick(v43.Context.IosAuthServiceSignup, v43.Button.IosAuthServiceSavePasswordFailure, v83.errorMsg or "unknown");
                            v48.reportFailure(v62.username, v83.errorMsg or "unknown");
                        end;
                        if l_GetFFlagEnableSavePasswordAfterRecovery_0() and v68 then
                            return v79();
                        else
                            return nil;
                        end;
                    end, function(v84) --[[ Line: 309 ]]
                        -- upvalues: l_Logger_0 (ref), v67 (ref), v43 (ref), v48 (ref), v62 (ref), l_GetFFlagEnableSavePasswordAfterRecovery_0 (ref), v68 (ref), v79 (ref)
                        l_Logger_0:warning("Error registering password: ", v84);
                        v67.reportAuthButtonClick(v43.Context.IosAuthServiceSignup, v43.Button.IosAuthServiceSavePasswordFailure, (tostring(v84)));
                        v48.reportFailure(v62.username, (tostring(v84)));
                        if l_GetFFlagEnableSavePasswordAfterRecovery_0() and v68 then
                            return v79();
                        else
                            return nil;
                        end;
                    end);
                end;
                if l_GetFFlagEnableSavePasswordAfterRecovery_0() and v68 then
                    return v85();
                else
                    v85();
                end;
            elseif not v66 then
                v67.reportAuthButtonClick(v43.Context.IosAuthServiceSignup, v43.Button.IosAuthServiceSavePasswordSkipped, v43.State.IosAuthServiceProtocolNotAvailable);
                v48.reportSkipped(v43.State.IosAuthServiceProtocolNotAvailable);
            elseif not v62.password then
                v67.reportAuthButtonClick(v43.Context.IosAuthServiceSignup, v43.Button.IosAuthServiceSavePasswordSkipped, v43.State.IosAuthServiceMissingCredentials);
                v48.reportSkipped(v43.State.IosAuthServiceMissingCredentials);
            end;
            return v79();
        end, function(v86) --[[ Line: 359 ]]
            -- upvalues: l_HttpService_0 (ref), v19 (ref), v20 (ref), v63 (ref), v15 (ref), v14 (ref), l_FFlagEnableSignupUnavailableInRegionError_0 (ref), l_StatusCodes_0 (ref), v24 (ref), v25 (ref), v7 (ref), v58 (ref), v69 (copy), v9 (ref), v26 (ref), v27 (ref), v34 (ref), v11 (ref), v6 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 360 ]]
                -- upvalues: l_HttpService_0 (ref), v86 (copy)
                return l_HttpService_0:JSONDecode(v86.Body);
            end);
            if l_status_0 then
                local v89 = l_result_0.errors and l_result_0.errors[1] and l_result_0.errors[1].code;
                v19(v20.Failure, 1);
                local v90 = v63 and v15 or v14;
                if v89 and v89 == v90.Captcha then
                    v19(v20.FailureCaptcha, 1);
                elseif v89 and v89 == v90.TooManyAttempts then
                    v19(v20.FailureThrottled, 1);
                elseif v89 and v89 == v90.InvalidBirthdate then
                    v19(v20.FailureBirthdayInvalid, 1);
                elseif v89 and v89 == v90.InvalidUsername then
                    v19(v20.FailureUsernameInvalid, 1);
                elseif v89 and v89 == v90.UsernameAlreadyTaken then
                    v19(v20.FailureUsernameTaken, 1);
                elseif v89 and v89 == v90.InvalidPassword then
                    v19(v20.FailurePasswordInvalid, 1);
                elseif v89 and v89 == v90.UsernameAndPasswordTheSame then
                    v19(v20.FailurePasswordMatchesUsername, 1);
                elseif v89 and v89 == v90.PasswordTooSimple then
                    v19(v20.FailurePasswordTooSimple, 1);
                elseif l_FFlagEnableSignupUnavailableInRegionError_0 and v89 == v90.UnavailableInRegion then
                    v19(v20.FailureUnavailableInRegion, 1);
                elseif v86.HttpError == Enum.HttpError.OK and v86.StatusCode == l_StatusCodes_0.TOO_MANY_REQUESTS then
                    v19(v20.FailureThrottled, 1);
                elseif v86.HttpError == Enum.HttpError.OK and v86.StatusCode == l_StatusCodes_0.INTERNAL_SERVER_ERROR then
                    v19(v20.FailureInternalServerError, 1);
                elseif v86.HttpError == Enum.HttpError.OK and v86.StatusCode == l_StatusCodes_0.BAD_REQUEST then
                    v19(v20.FailureBadRequest, 1);
                elseif v86.HttpError == Enum.HttpError.OK and v86.StatusCode == l_StatusCodes_0.NOT_FOUND then
                    v19(v20.FailureNotFound, 1);
                else
                    v19(v20.FailureUnknownError, 1);
                end;
                if v89 == v90.Captcha then
                    local _ = v24(l_result_0);
                    local _ = "";
                    local v93, v94 = v25(l_result_0);
                    v93 = {
                        name = v7.CaptchaNative, 
                        detail = "", 
                        extraProps = {
                            captchaCallback = v58, 
                            captchaType = "signup", 
                            captchaId = v93, 
                            dxBlob = v94, 
                            backNavigationDisabledWhileLoading = true
                        }
                    };
                    v69:dispatch(v9(v93));
                elseif v89 == v90.InvalidEmail then
                    v69:dispatch(v26({
                        toastType = v27.NetworkingError, 
                        toastMessage = "Authentication.SignUp.Response.InvalidEmail"
                    }));
                elseif v89 == v90.InvalidPassword then
                    v69:dispatch(v26({
                        toastType = v27.NetworkingError, 
                        toastMessage = "Authentication.SignUp.Response.PasswordComplexity"
                    }));
                elseif l_FFlagEnableSignupUnavailableInRegionError_0 and v89 == v90.UnavailableInRegion then
                    v69:dispatch(v26({
                        toastType = v27.NetworkingError, 
                        toastMessage = "Authentication.SignUp.Description.RobloxNotAvailableInRegion"
                    }));
                elseif (v34 ~= true or v89 ~= v90.EmptyAccountSwitchBlobRequired) and v89 ~= v90.ParentEmptyAccountSwitchBlobRequired then
                    v69:dispatch(v11({
                        HttpError = Enum.HttpError.OK
                    }));
                end;
                return v6.reject(v89);
            else
                v69:dispatch(v11({
                    HttpError = Enum.HttpError.OK
                }));
                return v6.reject();
            end;
        end);
    end;
end;