local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_NotificationService_0 = game:GetService("NotificationService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v7 = require(l_CorePackages_0.Packages.RoactNavigation);
local v8 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_CorePackages_0.Packages.UIBlox);
local v11 = require(l_Modules_0.LuaApp.Components.BrowserServiceWrapper);
local v12 = require(l_Modules_0.LuaApp.Enum.Challenge.Captcha.ActionType);
local v13 = require(l_Modules_0.LuaApp.Enum.Challenge.Type);
local v14 = require(l_Modules_0.LuaApp.Util.ExecuteJavaScriptInWebView);
local v15 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppCanNativeWrapperParentHandleBackNavigationChallenge);
local v16 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseStaticCdnUrlForChallengeHybridWebView);
local v17 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppChallengeForceInvisibleCaptchaDev);
local v18 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppChallengeForceVisibleCaptchaDev);
local v19 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppChallengeShouldIgnoreBackNavigationDisabled);
local l_GetFFlagLuaAppEnableCredentialsProtocol_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).Flags.GetFFlagLuaAppEnableCredentialsProtocol;
local l_GetFIntLuaAppCredentialsProtocolTimeout_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolTimeout;
local l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout;
local v23 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppChallengeHybridWebViewTimeoutSeconds);
local v24 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppReportChallengeHybridWebViewResult);
local v25 = require(l_Modules_0.LuaApp.Flags.GetFFlagReplaceBrowserServiceWrapper);
local v26 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppForceWebViewVisibleAfterTimeoutEnabled);
local v27 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppChallengeForceWebViewVisibleTimeoutSeconds);
local v28 = game:DefineFastFlag("EnableGCSWebViewLaunchFlowLogging", false);
local v29 = require(l_Modules_0.LuaApp.Enum.JavascriptHybrid);
local v30 = require(l_Modules_0.Common.Roact);
local v31 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v32 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v34 = require(l_Modules_0.LuaApp.Actions.SetBackNavigationDisabled);
local v35 = require(l_Modules_0.LuaApp.Enum.Challenge.TwoStepVerification.ActionType);
local v36 = require(l_Modules_0.LuaApp.Http.Url);
local v37 = require(l_Modules_0.LuaApp.withLocalization);
local l_Constants_0 = v10.App.Style.Constants;
local l_default_1 = v8.default;
local v40 = v30.PureComponent:extend(script.Name);
local v41 = nil;
pcall(function() --[[ Line: 64 ]]
    -- upvalues: v41 (ref)
    v41 = game:GetService("AccountService");
end);
v40.validateProps = v9.intersection(v9.interface({
    appContainerNavigation = v9.interface({
        isVisible = v9.boolean, 
        displayOrder = v9.integer
    }), 
    onChallengeAbandoned = v9.callback, 
    onChallengeLoadFailed = v9.callback, 
    forceWebViewVisible = v9.optional(v9.boolean), 
    onChallengeDisplayed = v9.optional(v9.callback), 
    onChallengeUnmounted = v9.optional(v9.callback)
}), v9.union(v9.interface({
    challengeType = v9.literal(v13.Captcha), 
    challengeParameters = v9.strictInterface({
        actionType = v12.isEnumValue, 
        dataExchangeBlob = v9.string, 
        captchaId = v9.string, 
        onChallengeCompleted = v9.callback, 
        onChallengeInvalidated = v9.callback
    })
}), v9.interface({
    challengeType = v9.literal(v13.SecurityQuestions), 
    challengeParameters = v9.strictInterface({
        userId = v9.string, 
        sessionId = v9.string, 
        onChallengeCompleted = v9.callback, 
        onChallengeInvalidated = v9.callback
    })
}), v9.interface({
    challengeType = v9.literal(v13.TwoStepVerification), 
    challengeParameters = v9.strictInterface({
        challengeId = v9.string, 
        userId = v9.string, 
        actionType = v35.isEnumValue, 
        allowRememberDevice = v9.boolean, 
        onChallengeCompleted = v9.callback, 
        onChallengeInvalidated = v9.callback, 
        clientSupports2svRecovery = v9.optional(v9.boolean), 
        recoverySessionId = v9.optional(v9.string)
    })
}), v9.interface({
    challengeType = v9.literal(v13.Reauthentication), 
    challengeParameters = v9.strictInterface({
        onChallengeCompleted = v9.callback, 
        onChallengeInvalidated = v9.callback
    })
}), v9.interface({
    challengeType = v9.literal(v13.Generic), 
    challengeParameters = v9.strictInterface({
        genericChallengeId = v9.string, 
        genericChallengeType = v9.string, 
        genericChallengeMetadata = v9.string, 
        onChallengeCompleted = v9.callback, 
        onChallengeInvalidated = v9.callback
    })
})));
v40.init = function(v42) --[[ Line: 178 ]] --[[ Name: init ]]
    -- upvalues: l_UserInputService_0 (copy)
    v42:setState({
        challengeDisplayed = false, 
        forceWebViewVisibleOnLoadFailure = false
    });
    v42.webViewLoaded = false;
    v42.challengeInitializationFailed = false;
    v42.completionData = nil;
    v42.invalidationData = nil;
    v42.appType = (function() --[[ Line: 191 ]]
        -- upvalues: l_UserInputService_0 (ref)
        local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
        local v44 = "unknown";
        if l_l_UserInputService_0_Platform_0 == Enum.Platform.Android then
            return "android";
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
            return "ios";
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows then
            return "windows";
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX then
            return "osx";
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP then
            return "uwp";
        else
            if l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne then
                v44 = "xbox";
            end;
            return v44;
        end;
    end)();
end;
v40.didMount = function(v45) --[[ Line: 213 ]] --[[ Name: didMount ]]
    -- upvalues: v23 (copy), v26 (copy), v27 (copy), v28 (copy), l_default_1 (copy)
    v45.isMounted = true;
    local l_analytics_0 = v45.props.analytics;
    local l_UnixTimestampMillis_0 = DateTime.now().UnixTimestampMillis;
    spawn(function() --[[ Line: 221 ]]
        -- upvalues: l_UnixTimestampMillis_0 (copy), v23 (ref), v45 (copy), v26 (ref), v27 (ref), l_analytics_0 (copy), v28 (ref), l_default_1 (ref)
        local l_UnixTimestampMillis_1 = DateTime.now().UnixTimestampMillis;
        while true do
            if l_UnixTimestampMillis_1 - l_UnixTimestampMillis_0 < v23() * 1000 then
                wait(1);
                if v45.webViewLoaded then
                    return;
                else
                    if v26() and l_UnixTimestampMillis_1 - l_UnixTimestampMillis_0 >= v27() * 1000 and not v45.state.forceWebViewVisibleOnLoadFailure then
                        v45:setState({
                            forceWebViewVisibleOnLoadFailure = true
                        });
                    end;
                    l_UnixTimestampMillis_1 = DateTime.now().UnixTimestampMillis;
                end;
            else
                if l_analytics_0 ~= nil and l_analytics_0.Diag ~= nil then
                    l_analytics_0.Diag:reportCounter("ChallengeHybridWebView_Timeout", 1);
                end;
                if v45.isMounted then
                    if v28 then
                        l_default_1:logEventOnce("challenge_launch_fail");
                    end;
                    v45:navigateBack();
                end;
                return;
            end;
        end;
    end);
end;
v40.willUnmount = function(v49) --[[ Line: 265 ]] --[[ Name: willUnmount ]]
    -- upvalues: v24 (copy), v13 (copy)
    v49.isMounted = false;
    if v49.props.onChallengeUnmounted ~= nil then
        v49.props.onChallengeUnmounted();
    end;
    local v50 = "Unknown";
    if v49.completionData ~= nil then
        v50 = "Completed";
        v49.props.challengeParameters.onChallengeCompleted(v49.completionData);
    elseif v49.invalidationData ~= nil then
        v50 = "Invalidated";
        v49.props.challengeParameters.onChallengeInvalidated(v49.invalidationData);
    elseif not v49.webViewLoaded or v49.challengeInitializationFailed then
        v50 = not v49.webViewLoaded and "LoadFailed" or "InitializationFailed";
        v49.props.onChallengeLoadFailed();
    else
        v50 = "Abandoned";
        v49.props.onChallengeAbandoned();
    end;
    if v24() and v49.props.analytics ~= nil then
        local v51 = v13.toRawValue(v49.props.challengeType):gsub("%-", "");
        if v49.props.analytics.Diag ~= nil then
            local v52 = string.format("ChallengeHybridWebView_Result_%s_%s_%s", v50, v49.appType, v51);
            v49.props.analytics.Diag:reportCounter(v52, 1);
        end;
        if v49.props.analytics.EventStream ~= nil then
            v49.props.analytics.EventStream:setRBXEventStream(v50, "challengeHybridWebViewResult", {
                appType = v49.appType, 
                challengeType = v51, 
                queryParameters = v49:getBaseQueryParameters() .. v49:getChallengeTypeQueryParameters()
            });
        end;
    end;
end;
local function v57(v53) --[[ Line: 315 ]] --[[ Name: buildQueryParametersFromTable ]]
    local v54 = "";
    for v55, v56 in pairs(v53) do
        v54 = v54 .. string.format("%s=%s&", v55, v56);
    end;
    return v54;
end;
v40.getChallengeTypeQueryParameters = function(v58) --[[ Line: 323 ]] --[[ Name: getChallengeTypeQueryParameters ]]
    -- upvalues: v13 (copy), v57 (copy), v12 (copy), v35 (copy)
    return ({
        [v13.Captcha] = function() --[[ Line: 325 ]]
            -- upvalues: v57 (ref), v12 (ref), v58 (copy)
            return (v57({
                ["action-type"] = v12.toRawValue(v58.props.challengeParameters.actionType), 
                ["data-exchange-blob"] = v58.props.challengeParameters.dataExchangeBlob, 
                ["captcha-id"] = v58.props.challengeParameters.captchaId
            }));
        end, 
        [v13.TwoStepVerification] = function() --[[ Line: 332 ]]
            -- upvalues: v58 (copy), v35 (ref), v57 (ref)
            local v59 = {
                ["challenge-id"] = v58.props.challengeParameters.challengeId, 
                ["user-id"] = v58.props.challengeParameters.userId, 
                ["action-type"] = v35.toRawValue(v58.props.challengeParameters.actionType), 
                ["allow-remember-device"] = v58.props.challengeParameters.allowRememberDevice and "true" or "false", 
                ["client-supports-2sv-recovery"] = v58.props.challengeParameters.clientSupports2svRecovery and "true" or "false"
            };
            local l_recoverySessionId_0 = v58.props.challengeParameters.recoverySessionId;
            if l_recoverySessionId_0 ~= nil and string.len(l_recoverySessionId_0) > 0 then
                v59["recovery-session-id"] = l_recoverySessionId_0;
            end;
            return (v57(v59));
        end, 
        [v13.SecurityQuestions] = function() --[[ Line: 347 ]]
            -- upvalues: v57 (ref), v58 (copy)
            return (v57({
                ["user-id"] = v58.props.challengeParameters.userId, 
                ["session-id"] = v58.props.challengeParameters.sessionId
            }));
        end, 
        [v13.Reauthentication] = function() --[[ Line: 353 ]]
            -- upvalues: v57 (ref)
            return (v57({}));
        end, 
        [v13.Generic] = function() --[[ Line: 356 ]]
            -- upvalues: v57 (ref), v58 (copy)
            return (v57({
                ["generic-challenge-id"] = v58.props.challengeParameters.genericChallengeId, 
                ["generic-challenge-type"] = v58.props.challengeParameters.genericChallengeType, 
                ["challenge-metadata-json"] = v58.props.challengeParameters.genericChallengeMetadata
            }));
        end
    })[v58.props.challengeType]();
end;
v40.getBaseQueryParameters = function(v61) --[[ Line: 366 ]] --[[ Name: getBaseQueryParameters ]]
    -- upvalues: l_NotificationService_0 (copy), l_Constants_0 (copy), v13 (copy), v18 (copy), v17 (copy), v57 (copy)
    local v62 = l_NotificationService_0.SelectedTheme == l_Constants_0.ThemeName.Dark;
    local v63 = {
        ["challenge-type"] = v13.toRawValue(v61.props.challengeType), 
        ["app-type"] = v61.appType, 
        ["dark-mode"] = v62 and "true" or "false"
    };
    if v18() then
        v63.fc_nosuppress = "1";
    end;
    if v17() then
        v63.fc_suppress = "1";
    end;
    return (v57(v63));
end;
v40.navigateBack = function(v64) --[[ Line: 382 ]] --[[ Name: navigateBack ]]
    v64.props.navigation.goBack();
end;
v40.render = function(v65) --[[ Line: 386 ]] --[[ Name: render ]]
    -- upvalues: v16 (copy), v36 (copy), v28 (copy), l_default_1 (copy), v37 (copy), v30 (copy), v11 (copy), v19 (copy), v15 (copy), v25 (copy), l_HttpService_0 (copy), v29 (copy), l_GetFFlagLuaAppEnableCredentialsProtocol_0 (copy), l_default_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), v14 (copy), l_GetFIntLuaAppCredentialsProtocolTimeout_0 (copy), l_Logging_0 (copy), v41 (ref)
    local l_isVisible_0 = v65.props.appContainerNavigation.isVisible;
    local l_displayOrder_0 = v65.props.appContainerNavigation.displayOrder;
    local v68 = v65.props.forceWebViewVisible and true;
    local l_challengeDisplayed_0 = v65.state.challengeDisplayed;
    local l_forceWebViewVisibleOnLoadFailure_0 = v65.state.forceWebViewVisibleOnLoadFailure;
    local v71 = v16(v65.props.challengeParameters.userId) and v36.STATIC_CDN_URL or v36.WWW_URL;
    local v72 = string.format("%schallenge/cdn/hybrid?%s%s", v71, v65:getBaseQueryParameters(), v65:getChallengeTypeQueryParameters());
    if v28 then
        l_default_1:logEventOnce("challenge_launch_begin");
    end;
    return v37({
        title = "Feature.AccountSettings.Heading.Tab.Security"
    })(function(v73) --[[ Line: 408 ]]
        -- upvalues: v30 (ref), v11 (ref), l_isVisible_0 (copy), l_displayOrder_0 (copy), v19 (ref), v15 (ref), v68 (copy), l_challengeDisplayed_0 (copy), l_forceWebViewVisibleOnLoadFailure_0 (copy), v25 (ref), v65 (copy), v72 (copy), l_HttpService_0 (ref), v29 (ref), v28 (ref), l_default_1 (ref), l_GetFFlagLuaAppEnableCredentialsProtocol_0 (ref), l_default_0 (ref), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (ref), v14 (ref), l_GetFIntLuaAppCredentialsProtocolTimeout_0 (ref), l_Logging_0 (ref), v41 (ref)
        return v30.createElement(v11, {
            isVisible = l_isVisible_0, 
            displayOrder = l_displayOrder_0, 
            ignoreBackNavigationDisabled = v19(), 
            backNavigationHandledByParent = v15(), 
            webViewVisible = v68 or l_isVisible_0 and l_challengeDisplayed_0 or l_forceWebViewVisibleOnLoadFailure_0, 
            windowClosedCallback = function() --[[ Line: 419 ]] --[[ Name: windowClosedCallback ]]
                -- upvalues: v25 (ref), v65 (ref)
                if not v25() then
                    v65:navigateBack();
                end;
            end, 
            modal = false, 
            isGenericWebview = true, 
            enableOverlayReplacement = true, 
            title = v73.title, 
            url = v72, 
            javaScriptCallback = function(v74) --[[ Line: 431 ]] --[[ Name: javaScriptCallback ]]
                -- upvalues: v65 (ref), l_HttpService_0 (ref), v29 (ref), v28 (ref), l_default_1 (ref), l_GetFFlagLuaAppEnableCredentialsProtocol_0 (ref), l_default_0 (ref), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (ref), v14 (ref), l_GetFIntLuaAppCredentialsProtocolTimeout_0 (ref), l_Logging_0 (ref), v41 (ref)
                if not v65.isMounted then
                    return;
                else
                    local v75 = l_HttpService_0:JSONDecode(v74);
                    if v75.moduleID ~= v29.Module.Navigation or v75.functionName ~= v29.Function.navigateToFeature or not v75.params or not v75.params.params then
                        return;
                    else
                        if not v65.webViewLoaded then
                            if v28 then
                                l_default_1:logEventOnce("challenge_launch_end");
                            end;
                            v65.webViewLoaded = true;
                            if v65.props.analytics ~= nil and v65.props.analytics.Diag ~= nil then
                                v65.props.analytics.Diag:reportCounter("ChallengeHybridWebView_NotTimeout", 1);
                            end;
                        end;
                        local l_params_0 = v75.params.params;
                        if l_params_0.feature == v29.Feature.ChallengeParsed and l_params_0.data.parsed == false then
                            v65.challengeInitializationFailed = true;
                            v65:navigateBack();
                            return;
                        elseif l_params_0.feature == v29.Feature.ChallengeInitialized and l_params_0.data.initialized == false then
                            v65.challengeInitializationFailed = true;
                            v65:navigateBack();
                            return;
                        elseif l_GetFFlagLuaAppEnableCredentialsProtocol_0() and l_params_0.feature == v29.Feature.CredentialsProtocolAvailable then
                            l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v77) --[[ Line: 486 ]]
                                -- upvalues: v14 (ref), l_params_0 (copy)
                                local v78 = v77.isAvailable or false;
                                v14.Execute(l_params_0.data.callId, (tostring(v78)));
                            end):catch(function() --[[ Line: 490 ]]
                                -- upvalues: v14 (ref), l_params_0 (copy)
                                v14.Execute(l_params_0.data.callId, "false");
                            end);
                            return;
                        elseif l_GetFFlagLuaAppEnableCredentialsProtocol_0() and l_params_0.feature == v29.Feature.GetCredentials then
                            l_default_0:getCredentials(l_default_0.CredentialsTypes.FIDO2, l_params_0.data.authenticationOptionsJSON, l_GetFIntLuaAppCredentialsProtocolTimeout_0()):andThen(function(v79) --[[ Line: 506 ]]
                                -- upvalues: l_Logging_0 (ref), l_HttpService_0 (ref), v14 (ref), l_params_0 (copy)
                                if v79 ~= nil then
                                    l_Logging_0.warn("Executing javascript on webview to return GetCredentialsResponse");
                                    local v80 = l_HttpService_0:JSONEncode(v79);
                                    v14.Execute(l_params_0.data.callId, v80);
                                end;
                            end):catch(function() --[[ Line: 513 ]]
                                -- upvalues: v14 (ref), l_params_0 (copy)
                                v14.Execute(l_params_0.data.callId, "");
                            end);
                            return;
                        elseif l_params_0.feature == v29.Feature.GetIntegrityToken then
                            if game:GetEngineFeature("AccountService") and v41 and v41:DeviceIntegrityAvailable() then
                                local l_v41_DeviceIntegrityTokenYield_0 = v41:GetDeviceIntegrityTokenYield(l_params_0.data.deviceIntegrityParams);
                                if l_v41_DeviceIntegrityTokenYield_0 ~= nil then
                                    local v82 = l_HttpService_0:JSONEncode(l_v41_DeviceIntegrityTokenYield_0);
                                    v14.Execute(l_params_0.data.callId, v82);
                                    return;
                                end;
                            end;
                            v14.Execute(l_params_0.data.callId, "");
                            return;
                        elseif l_params_0.feature == v29.Feature.ChallengeCompleted then
                            v65.completionData = l_params_0.data;
                            v65:navigateBack();
                            return;
                        elseif l_params_0.feature == v29.Feature.ChallengeInvalidated then
                            v65.invalidationData = l_params_0.data;
                            v65:navigateBack();
                            return;
                        else
                            if v75.params.params.feature == v29.Feature.ChallengeDisplayed then
                                v65:setState({
                                    challengeDisplayed = true
                                });
                                if v65.props.onChallengeDisplayed ~= nil then
                                    v65.props.onChallengeDisplayed();
                                end;
                            end;
                            return;
                        end;
                    end;
                end;
            end
        });
    end);
end;
v40 = v7.withNavigation(v40);
v40 = v32.connect(nil, function(v83) --[[ Line: 565 ]]
    -- upvalues: v34 (copy)
    return {
        setBackNavigationDisabled = function(v84) --[[ Line: 568 ]] --[[ Name: setBackNavigationDisabled ]]
            -- upvalues: v83 (copy), v34 (ref)
            return v83(v34(v84));
        end
    };
end)(v40);
return (l_RoactServices_0.connect({
    analytics = v31
})(v40));