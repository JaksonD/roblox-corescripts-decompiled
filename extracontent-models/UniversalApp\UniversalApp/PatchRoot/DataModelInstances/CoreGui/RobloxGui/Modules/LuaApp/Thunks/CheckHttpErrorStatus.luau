local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_Modules_0.LuaApp.Promise);
local l_StatusCodes_0 = require(l_CorePackages_0.Workspace.Packages.Http).StatusCodes;
local v8 = require(l_Modules_0.LuaApp.Thunks.LogoutUserOnUnauthorized);
local v9 = require(l_Modules_0.LuaApp.Thunks.Moderation.UserModerationCheck);
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local l_TelemetryConfigs_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).TelemetryConfigs;
local v12 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics);
local l_authClientError_0 = v12.Events.authClientError;
local l_authOperationTiming_0 = v12.Events.authOperationTiming;
local l_authPageload_0 = v12.Events.authPageload;
local v16 = require(l_Modules_0.LuaApp.EventStreamConstants);
local l_WebViewStateTracker_0 = require(l_CorePackages_0.Workspace.Packages.WebViewUtils).WebViewStateTracker;
local v18 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_GetFFlagEnableUnauthorizedErrorDetailLogging_0 = v18.GetFFlagEnableUnauthorizedErrorDetailLogging;
local l_GetFFlagTriggerLogoutOnAuthErrorCode_0 = v18.GetFFlagTriggerLogoutOnAuthErrorCode;
local l_GetFStringAuthenticationErrorCode_0 = v18.GetFStringAuthenticationErrorCode;
local l_GetFStringAuthenticationErrorCodeAlternative_0 = v18.GetFStringAuthenticationErrorCodeAlternative;
local l_FFlagEnableWebViewStateTracker_0 = v18.FFlagEnableWebViewStateTracker;
local v24 = game:DefineFastFlag("RemoveHttpErrorLog2", false);
local v25 = game:DefineFastFlag("Enable401LogoutGracePeriod", false);
local v26 = game:DefineFastFlag("EnableWebViewOpenDurationCap", false);
local v27 = game:DefineFastInt("WebViewOpenDurationCapSeconds", 0);
local v28 = game:DefineFastInt("WebViewLastClosedDurationSeconds", 1);
return function(v29, v30, v31, v32) --[[ Line: 34 ]]
    -- upvalues: v6 (copy), v24 (copy), l_Logger_0 (copy), l_Logging_0 (copy), l_StatusCodes_0 (copy), v9 (copy), l_GetFFlagEnableUnauthorizedErrorDetailLogging_0 (copy), l_HttpService_0 (copy), l_TelemetryService_0 (copy), l_TelemetryConfigs_0 (copy), l_authClientError_0 (copy), v16 (copy), l_FFlagEnableWebViewStateTracker_0 (copy), l_WebViewStateTracker_0 (copy), v26 (copy), v27 (copy), v28 (copy), v25 (copy), l_authPageload_0 (copy), l_authOperationTiming_0 (copy), l_GetFFlagTriggerLogoutOnAuthErrorCode_0 (copy), l_GetFStringAuthenticationErrorCode_0 (copy), l_GetFStringAuthenticationErrorCodeAlternative_0 (copy), v8 (copy)
    return function(v33) --[[ Line: 35 ]]
        -- upvalues: v31 (copy), v6 (ref), v24 (ref), l_Logger_0 (ref), v30 (copy), l_Logging_0 (ref), l_StatusCodes_0 (ref), v9 (ref), v29 (copy), l_GetFFlagEnableUnauthorizedErrorDetailLogging_0 (ref), l_HttpService_0 (ref), l_TelemetryService_0 (ref), l_TelemetryConfigs_0 (ref), l_authClientError_0 (ref), v16 (ref), l_FFlagEnableWebViewStateTracker_0 (ref), l_WebViewStateTracker_0 (ref), v26 (ref), v27 (ref), v28 (ref), v25 (ref), l_authPageload_0 (ref), l_authOperationTiming_0 (ref), l_GetFFlagTriggerLogoutOnAuthErrorCode_0 (ref), l_GetFStringAuthenticationErrorCode_0 (ref), l_GetFStringAuthenticationErrorCodeAlternative_0 (ref), v8 (ref), v32 (copy)
        if v31 == nil then
            return v6.resolve();
        else
            if v24 then
                l_Logger_0:debug("HTTP error url:`" .. tostring(v30) .. "`");
                l_Logger_0:debug("HTTP error code:`" .. tostring(v31.StatusCode) .. "`");
                l_Logger_0:debug("HTTP error body:`" .. tostring(v31.Body) .. "`");
            else
                l_Logging_0.warn("HTTP error url:`" .. tostring(v30) .. "`");
                l_Logging_0.warn("HTTP error code:`" .. tostring(v31.StatusCode) .. "`");
                l_Logging_0.warn("HTTP error body:`" .. tostring(v31.Body) .. "`");
            end;
            if v31.StatusCode == l_StatusCodes_0.FORBIDDEN then
                v33:dispatch(v9(v29, v31));
            elseif v31.StatusCode == l_StatusCodes_0.UNAUTHORIZED then
                if l_GetFFlagEnableUnauthorizedErrorDetailLogging_0() then
                    local v34 = "empty";
                    local v35 = "empty";
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 58 ]]
                        -- upvalues: l_HttpService_0 (ref), v31 (ref)
                        return l_HttpService_0:JSONDecode(v31.Body);
                    end);
                    if l_status_0 and l_result_0.errors and l_result_0.errors[1] then
                        local v38 = l_result_0.errors[1];
                        if v38.code ~= nil then
                            v34 = tostring(v38.code);
                        end;
                        if v38.subcode ~= nil then
                            v35 = tostring(v38.subcode);
                        end;
                    end;
                    l_TelemetryService_0:LogCounter(l_TelemetryConfigs_0.UnauthorizedErrorTelemetryConfig, {
                        customFields = {
                            code = v34, 
                            subcode = v35
                        }
                    }, 1);
                    l_authClientError_0(v16.Context.UnauthorizedError, v35, v30, v34);
                    if l_FFlagEnableWebViewStateTracker_0 then
                        local v39 = l_WebViewStateTracker_0.isOpenNoLongerThan(v26, v27);
                        local v40 = l_WebViewStateTracker_0.wasClosedWithin(v28);
                        if v25 and (v39 or v40) then
                            l_authPageload_0(v16.Context.InvoluntaryLogoutGracePeriod, v16.State.GracePeriodApplied);
                            return v6.reject(v31);
                        elseif v39 and v26 and l_WebViewStateTracker_0.getOpenDuration() > v27 then
                            l_authOperationTiming_0(v16.Context.InvoluntaryLogoutGracePeriod, l_WebViewStateTracker_0.getOpenDuration(), v16.State.GracePeriodExceeded);
                        elseif not v40 then
                            l_authOperationTiming_0(v16.Context.InvoluntaryLogoutGracePeriod, l_WebViewStateTracker_0.wasLastClosed(), v16.State.WebViewLastClosed);
                        end;
                    end;
                    if l_GetFFlagTriggerLogoutOnAuthErrorCode_0() and (v34 == l_GetFStringAuthenticationErrorCode_0() or v34 == l_GetFStringAuthenticationErrorCodeAlternative_0()) then
                        v33:dispatch(v8(v29, v32, v30));
                    elseif not l_GetFFlagTriggerLogoutOnAuthErrorCode_0() then
                        v33:dispatch(v8(v29, v32, v30));
                    end;
                else
                    v33:dispatch(v8(v29, v32, v30));
                end;
            end;
            return v6.reject(v31);
        end;
    end;
end;