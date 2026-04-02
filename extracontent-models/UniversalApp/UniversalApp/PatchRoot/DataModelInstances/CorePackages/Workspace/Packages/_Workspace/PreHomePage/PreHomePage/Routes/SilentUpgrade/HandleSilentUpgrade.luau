local l_script_FirstAncestor_0 = script:FindFirstAncestor("PreHomePage");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_PasskeyCheck_0 = require(l_Parent_0.PasskeyUpsell).Utils.PasskeyCheck;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v5 = require(l_Parent_0.SharedFlags);
local l_LinkingProtocol_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol;
local v7 = require(l_script_FirstAncestor_0.Common);
local v8 = require(l_Parent_0.CredentialsProtocol);
local v9 = require(l_Parent_0.Promise);
local v10 = require(l_Parent_0.AuthCommon);
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local l_TelemetryConfigs_0 = require(l_Parent_0.AuthAnalytics).TelemetryConfigs;
local v13 = require(l_Parent_0.AuthAnalytics);
local l_IXPServiceWrapper_0 = require(l_Parent_0.IXPServiceWrapper).IXPServiceWrapper;
local l_AppBtidLayers_0 = require(l_Parent_0.ExperimentLayers).AppBtidLayers;
local l_authClientError_0 = v13.Events.authClientError;
local l_authMsgShown_0 = v13.Events.authMsgShown;
local l_authPageload_0 = v13.Events.authPageload;
local l_EventStreamConstants_0 = v13.EventStreamConstants;
local l_userJustLoggedIn_0 = v7.Checks.userJustLoggedIn;
local l_FFlagPasskeySilentUpgradeEnabled_0 = v5.FFlagPasskeySilentUpgradeEnabled;
local l_default_1 = v8.CredentialsProtocol.default;
local l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 = v8.Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout;
local l_RegisterPasskey_0 = v10.Thunks.RegisterPasskey;
local v25 = game:DefineFastInt("SilentUpgradeReauthDelaySeconds", 4);
local v26 = game:DefineFastFlag("SilentPasskeyUpgradeErrorLogging", false);
local l_FFlagEmitPasskeyRegistrationSourceOnFinish_0 = v5.FFlagEmitPasskeyRegistrationSourceOnFinish;
local function _() --[[ Line: 35 ]] --[[ Name: getShouldUseSilentPasskeyUpgrade ]]
    -- upvalues: l_IXPServiceWrapper_0 (copy), l_AppBtidLayers_0 (copy)
    return l_IXPServiceWrapper_0:GetBTIDLayerData(l_AppBtidLayers_0.LoginLayer).shouldUseSilentPasskeyUpgrade;
end;
local function v32() --[[ Line: 45 ]] --[[ Name: checkDeviceSupportsSilentPasskeyUpgrade ]]
    -- upvalues: l_default_1 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), l_authPageload_0 (copy), l_EventStreamConstants_0 (copy), l_default_0 (copy), l_TelemetryConfigs_0 (copy), v9 (copy), l_Logger_0 (copy)
    return l_default_1:isAvailable(l_default_1.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v29) --[[ Line: 48 ]]
        -- upvalues: l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), l_default_0 (ref), l_TelemetryConfigs_0 (ref), v9 (ref)
        if v29 and not v29.FIDO2 then
            l_authPageload_0(l_EventStreamConstants_0.Context.HandleSilentPasskeyUpgrade, l_EventStreamConstants_0.State.FilteredByNoPasskeySupport);
        end;
        if v29 and v29.FIDO2 and not v29.FIDO2.supportsSilentPasskeyUpgrade then
            l_authPageload_0(l_EventStreamConstants_0.Context.HandleSilentPasskeyUpgrade, l_EventStreamConstants_0.State.FilteredByNoSilentUpgradeSupport);
        end;
        local v30 = v29 and v29.FIDO2 and v29.FIDO2.supportsSilentPasskeyUpgrade;
        if v30 then
            l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.SilentPasskeyUpgradeAvailableConfig, 1);
        end;
        return v9.resolve(v30);
    end):catch(function(v31) --[[ Line: 80 ]]
        -- upvalues: l_Logger_0 (ref), v9 (ref)
        l_Logger_0:warning("Failed to check device availability for silent upgrade: " .. tostring(v31));
        return v9.resolve(false);
    end);
end;
local function v37(v33) --[[ Line: 92 ]] --[[ Name: performSilentPasskeyUpgrade ]]
    -- upvalues: l_RegisterPasskey_0 (copy), l_default_0 (copy), l_TelemetryConfigs_0 (copy), l_authPageload_0 (copy), l_EventStreamConstants_0 (copy), l_FFlagEmitPasskeyRegistrationSourceOnFinish_0 (copy), l_authMsgShown_0 (copy), v9 (copy), l_HttpService_0 (copy), l_Logger_0 (copy), v26 (copy), l_authClientError_0 (copy)
    return l_RegisterPasskey_0(v33, "passkeySilentUpgrade", true):andThen(function() --[[ Line: 94 ]]
        -- upvalues: l_default_0 (ref), l_TelemetryConfigs_0 (ref), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), l_FFlagEmitPasskeyRegistrationSourceOnFinish_0 (ref), l_authMsgShown_0 (ref)
        l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.SilentPasskeyUpgradeSuccessConfig, 1);
        l_authPageload_0(l_EventStreamConstants_0.Context.HandleSilentPasskeyUpgrade, l_EventStreamConstants_0.State.UpgradeSuccess);
        if l_FFlagEmitPasskeyRegistrationSourceOnFinish_0 then
            l_authMsgShown_0(l_EventStreamConstants_0.Context.PasskeyCreationSource, l_EventStreamConstants_0.State.FinishRegistration, "passkeySilentUpgrade");
        end;
    end, function(v34) --[[ Line: 107 ]]
        -- upvalues: v9 (ref)
        return v9.reject(v34);
    end):catch(function(v35) --[[ Line: 110 ]]
        -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), v26 (ref), l_authClientError_0 (ref), l_EventStreamConstants_0 (ref), l_default_0 (ref), l_TelemetryConfigs_0 (ref), l_authPageload_0 (ref), v9 (ref)
        local v36 = l_HttpService_0:JSONEncode(v35);
        l_Logger_0:warning("Silent passkey upgrade failed: " .. v36);
        if v26 then
            l_authClientError_0(l_EventStreamConstants_0.Context.HandleSilentPasskeyUpgrade, v36);
        end;
        l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.SilentPasskeyUpgradeFailureConfig, 1);
        l_authPageload_0(l_EventStreamConstants_0.Context.HandleSilentPasskeyUpgrade, l_EventStreamConstants_0.State.UpgradeFailure);
        return v9.resolve();
    end);
end;
local function v45(v38, v39) --[[ Line: 131 ]] --[[ Name: attemptSilentPasskeyUpgrade ]]
    -- upvalues: l_FFlagPasskeySilentUpgradeEnabled_0 (copy), l_IXPServiceWrapper_0 (copy), l_AppBtidLayers_0 (copy), l_authPageload_0 (copy), l_EventStreamConstants_0 (copy), l_LinkingProtocol_0 (copy), l_Logger_0 (copy), l_userJustLoggedIn_0 (copy), l_default_0 (copy), l_TelemetryConfigs_0 (copy), v32 (copy), l_PasskeyCheck_0 (copy), v9 (copy), v25 (copy), v37 (copy), l_HttpService_0 (copy), v26 (copy), l_authClientError_0 (copy)
    if not l_FFlagPasskeySilentUpgradeEnabled_0 then
        return;
    elseif not l_IXPServiceWrapper_0:GetBTIDLayerData(l_AppBtidLayers_0.LoginLayer).shouldUseSilentPasskeyUpgrade then
        l_authPageload_0(l_EventStreamConstants_0.Context.HandleSilentPasskeyUpgrade, l_EventStreamConstants_0.State.FilteredByIXP);
        return;
    else
        local v40 = false;
        if l_LinkingProtocol_0:getLastLuaURL() ~= nil then
            v40 = l_LinkingProtocol_0:getLastLuaURL() ~= "";
        end;
        if v40 then
            l_Logger_0:info("Skipping passkey silent upgrade due to deep link");
            l_authPageload_0(l_EventStreamConstants_0.Context.HandleSilentPasskeyUpgrade, l_EventStreamConstants_0.State.FilteredByDeepLink);
            return;
        elseif not l_userJustLoggedIn_0(v39) then
            l_Logger_0:info("Skipping passkey silent upgrade due to cached login");
            l_authPageload_0(l_EventStreamConstants_0.Context.HandleSilentPasskeyUpgrade, l_EventStreamConstants_0.State.FilteredByCachedLogin);
            return;
        else
            l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.SilentPasskeyUpgradeAttemptedConfig, 1);
            l_authPageload_0(l_EventStreamConstants_0.Context.HandleSilentPasskeyUpgrade, l_EventStreamConstants_0.State.UpgradeAttempted);
            v32():andThen(function(v41) --[[ Line: 173 ]]
                -- upvalues: l_Logger_0 (ref), l_PasskeyCheck_0 (ref), v38 (copy), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), l_default_0 (ref), l_TelemetryConfigs_0 (ref), v9 (ref), v25 (ref), v37 (ref)
                if not v41 then
                    l_Logger_0:info("Device does not support silent upgrade, skipping");
                    return;
                else
                    return l_PasskeyCheck_0(v38):andThen(function(v42) --[[ Line: 180 ]]
                        -- upvalues: l_Logger_0 (ref), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), l_default_0 (ref), l_TelemetryConfigs_0 (ref), v9 (ref), v25 (ref), v37 (ref), v38 (ref)
                        if v42 then
                            l_Logger_0:info("User already has a passkey, skipping silent upgrade");
                            l_authPageload_0(l_EventStreamConstants_0.Context.HandleSilentPasskeyUpgrade, l_EventStreamConstants_0.State.FilteredByExistingPasskey);
                            return;
                        else
                            l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.SilentPasskeyUpgradeNoPasskeyConfig, 1);
                            return v9.delay(v25):andThen(function() --[[ Line: 193 ]]
                                -- upvalues: v37 (ref), v38 (ref)
                                return v37(v38);
                            end);
                        end;
                    end);
                end;
            end):catch(function(v43) --[[ Line: 198 ]]
                -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), v26 (ref), l_authClientError_0 (ref), l_EventStreamConstants_0 (ref), v9 (ref)
                local v44 = l_HttpService_0:JSONEncode(v43);
                l_Logger_0:warning("Silent passkey upgrade failed: " .. v44);
                if v26 then
                    l_authClientError_0(l_EventStreamConstants_0.Context.HandleSilentPasskeyUpgrade, v44);
                end;
                return v9.resolve();
            end);
            return;
        end;
    end;
end;
return function(v46, v47) --[[ Line: 216 ]] --[[ Name: HandleSilentUpgrade ]]
    -- upvalues: v45 (copy)
    v45(v46, v47);
end;