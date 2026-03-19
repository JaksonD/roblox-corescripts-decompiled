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
local l_authPageload_0 = v13.Events.authPageload;
local l_EventStreamConstants_0 = v13.EventStreamConstants;
local l_userJustLoggedIn_0 = v7.Checks.userJustLoggedIn;
local l_FFlagPasskeySilentUpgradeEnabled_0 = v5.FFlagPasskeySilentUpgradeEnabled;
local l_default_1 = v8.CredentialsProtocol.default;
local l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 = v8.Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout;
local l_RegisterPasskey_0 = v10.Thunks.RegisterPasskey;
local v24 = game:DefineFastInt("SilentUpgradeReauthDelaySeconds", 4);
local v25 = game:DefineFastFlag("SilentPasskeyUpgradeErrorLogging", false);
local function _() --[[ Line: 33 ]] --[[ Name: getShouldUseSilentPasskeyUpgrade ]]
    -- upvalues: l_IXPServiceWrapper_0 (copy), l_AppBtidLayers_0 (copy)
    return l_IXPServiceWrapper_0:GetBTIDLayerData(l_AppBtidLayers_0.LoginLayer).shouldUseSilentPasskeyUpgrade;
end;
local function v30() --[[ Line: 43 ]] --[[ Name: checkDeviceSupportsSilentPasskeyUpgrade ]]
    -- upvalues: l_default_1 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), l_authPageload_0 (copy), l_EventStreamConstants_0 (copy), l_default_0 (copy), l_TelemetryConfigs_0 (copy), v9 (copy), l_Logger_0 (copy)
    return l_default_1:isAvailable(l_default_1.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v27) --[[ Line: 46 ]]
        -- upvalues: l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), l_default_0 (ref), l_TelemetryConfigs_0 (ref), v9 (ref)
        if v27 and not v27.FIDO2 then
            l_authPageload_0(l_EventStreamConstants_0.Context.HandleSilentPasskeyUpgrade, l_EventStreamConstants_0.State.FilteredByNoPasskeySupport);
        end;
        if v27 and v27.FIDO2 and not v27.FIDO2.supportsSilentPasskeyUpgrade then
            l_authPageload_0(l_EventStreamConstants_0.Context.HandleSilentPasskeyUpgrade, l_EventStreamConstants_0.State.FilteredByNoSilentUpgradeSupport);
        end;
        local v28 = v27 and v27.FIDO2 and v27.FIDO2.supportsSilentPasskeyUpgrade;
        if v28 then
            l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.SilentPasskeyUpgradeAvailableConfig, 1);
        end;
        return v9.resolve(v28);
    end):catch(function(v29) --[[ Line: 78 ]]
        -- upvalues: l_Logger_0 (ref), v9 (ref)
        l_Logger_0:warning("Failed to check device availability for silent upgrade: " .. tostring(v29));
        return v9.resolve(false);
    end);
end;
local function v35(v31) --[[ Line: 90 ]] --[[ Name: performSilentPasskeyUpgrade ]]
    -- upvalues: l_RegisterPasskey_0 (copy), l_default_0 (copy), l_TelemetryConfigs_0 (copy), l_authPageload_0 (copy), l_EventStreamConstants_0 (copy), v9 (copy), l_HttpService_0 (copy), l_Logger_0 (copy), v25 (copy), l_authClientError_0 (copy)
    return l_RegisterPasskey_0(v31, "passkeySilentUpgrade", true):andThen(function() --[[ Line: 92 ]]
        -- upvalues: l_default_0 (ref), l_TelemetryConfigs_0 (ref), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref)
        l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.SilentPasskeyUpgradeSuccessConfig, 1);
        l_authPageload_0(l_EventStreamConstants_0.Context.HandleSilentPasskeyUpgrade, l_EventStreamConstants_0.State.UpgradeSuccess);
    end, function(v32) --[[ Line: 98 ]]
        -- upvalues: v9 (ref)
        return v9.reject(v32);
    end):catch(function(v33) --[[ Line: 101 ]]
        -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), v25 (ref), l_authClientError_0 (ref), l_EventStreamConstants_0 (ref), l_default_0 (ref), l_TelemetryConfigs_0 (ref), l_authPageload_0 (ref), v9 (ref)
        local v34 = l_HttpService_0:JSONEncode(v33);
        l_Logger_0:warning("Silent passkey upgrade failed: " .. v34);
        if v25 then
            l_authClientError_0(l_EventStreamConstants_0.Context.HandleSilentPasskeyUpgrade, v34);
        end;
        l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.SilentPasskeyUpgradeFailureConfig, 1);
        l_authPageload_0(l_EventStreamConstants_0.Context.HandleSilentPasskeyUpgrade, l_EventStreamConstants_0.State.UpgradeFailure);
        return v9.resolve();
    end);
end;
local function v43(v36, v37) --[[ Line: 122 ]] --[[ Name: attemptSilentPasskeyUpgrade ]]
    -- upvalues: l_FFlagPasskeySilentUpgradeEnabled_0 (copy), l_IXPServiceWrapper_0 (copy), l_AppBtidLayers_0 (copy), l_authPageload_0 (copy), l_EventStreamConstants_0 (copy), l_LinkingProtocol_0 (copy), l_Logger_0 (copy), l_userJustLoggedIn_0 (copy), l_default_0 (copy), l_TelemetryConfigs_0 (copy), v30 (copy), l_PasskeyCheck_0 (copy), v9 (copy), v24 (copy), v35 (copy), l_HttpService_0 (copy), v25 (copy), l_authClientError_0 (copy)
    if not l_FFlagPasskeySilentUpgradeEnabled_0 then
        return;
    elseif not l_IXPServiceWrapper_0:GetBTIDLayerData(l_AppBtidLayers_0.LoginLayer).shouldUseSilentPasskeyUpgrade then
        l_authPageload_0(l_EventStreamConstants_0.Context.HandleSilentPasskeyUpgrade, l_EventStreamConstants_0.State.FilteredByIXP);
        return;
    else
        local v38 = false;
        if l_LinkingProtocol_0:getLastLuaURL() ~= nil then
            v38 = l_LinkingProtocol_0:getLastLuaURL() ~= "";
        end;
        if v38 then
            l_Logger_0:info("Skipping passkey silent upgrade due to deep link");
            l_authPageload_0(l_EventStreamConstants_0.Context.HandleSilentPasskeyUpgrade, l_EventStreamConstants_0.State.FilteredByDeepLink);
            return;
        elseif not l_userJustLoggedIn_0(v37) then
            l_Logger_0:info("Skipping passkey silent upgrade due to cached login");
            l_authPageload_0(l_EventStreamConstants_0.Context.HandleSilentPasskeyUpgrade, l_EventStreamConstants_0.State.FilteredByCachedLogin);
            return;
        else
            l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.SilentPasskeyUpgradeAttemptedConfig, 1);
            l_authPageload_0(l_EventStreamConstants_0.Context.HandleSilentPasskeyUpgrade, l_EventStreamConstants_0.State.UpgradeAttempted);
            v30():andThen(function(v39) --[[ Line: 164 ]]
                -- upvalues: l_Logger_0 (ref), l_PasskeyCheck_0 (ref), v36 (copy), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), l_default_0 (ref), l_TelemetryConfigs_0 (ref), v9 (ref), v24 (ref), v35 (ref)
                if not v39 then
                    l_Logger_0:info("Device does not support silent upgrade, skipping");
                    return;
                else
                    return l_PasskeyCheck_0(v36):andThen(function(v40) --[[ Line: 171 ]]
                        -- upvalues: l_Logger_0 (ref), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), l_default_0 (ref), l_TelemetryConfigs_0 (ref), v9 (ref), v24 (ref), v35 (ref), v36 (ref)
                        if v40 then
                            l_Logger_0:info("User already has a passkey, skipping silent upgrade");
                            l_authPageload_0(l_EventStreamConstants_0.Context.HandleSilentPasskeyUpgrade, l_EventStreamConstants_0.State.FilteredByExistingPasskey);
                            return;
                        else
                            l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.SilentPasskeyUpgradeNoPasskeyConfig, 1);
                            return v9.delay(v24):andThen(function() --[[ Line: 184 ]]
                                -- upvalues: v35 (ref), v36 (ref)
                                return v35(v36);
                            end);
                        end;
                    end);
                end;
            end):catch(function(v41) --[[ Line: 189 ]]
                -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), v25 (ref), l_authClientError_0 (ref), l_EventStreamConstants_0 (ref), v9 (ref)
                local v42 = l_HttpService_0:JSONEncode(v41);
                l_Logger_0:warning("Silent passkey upgrade failed: " .. v42);
                if v25 then
                    l_authClientError_0(l_EventStreamConstants_0.Context.HandleSilentPasskeyUpgrade, v42);
                end;
                return v9.resolve();
            end);
            return;
        end;
    end;
end;
return function(v44, v45) --[[ Line: 207 ]] --[[ Name: HandleSilentUpgrade ]]
    -- upvalues: v43 (copy)
    v43(v44, v45);
end;