local l_Parent_0 = script:FindFirstAncestor("MultiPageSignup").Parent;
local v1 = require(l_Parent_0.UserActivationFramework);
local l_PayloadKey_0 = v1.Enums.PayloadKey;
local l_ActivationFrameworkContextAction_0 = v1.Enums.ActivationFrameworkContextAction;
local v4 = require(l_Parent_0.CredentialsProtocol);
local l_default_0 = v4.CredentialsProtocol.default;
local l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 = v4.Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v8 = require(l_Parent_0.AuthAnalytics);
local l_authPageload_0 = v8.Events.authPageload;
local l_authClientError_0 = v8.Events.authClientError;
local l_EventStreamConstants_0 = v8.EventStreamConstants;
return function(v12, v13, v14) --[[ Line: 19 ]] --[[ Name: getCredentialsProtocolAvailability ]]
    -- upvalues: l_PayloadKey_0 (copy), l_default_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), l_authPageload_0 (copy), l_EventStreamConstants_0 (copy), l_ActivationFrameworkContextAction_0 (copy), l_authClientError_0 (copy), l_Logger_0 (copy)
    local v15 = false;
    local v16 = false;
    local v17 = false;
    if v12[l_PayloadKey_0.CredentialsProtocolPasskeyRegistrationAvailable] == nil then
        local v18 = os.clock();
        l_default_0:isAvailable(l_default_0.CredentialsTypes.all, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v19) --[[ Line: 36 ]]
            -- upvalues: l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), v18 (copy), v15 (ref), v17 (ref), v16 (ref), l_PayloadKey_0 (ref), v14 (copy), l_ActivationFrameworkContextAction_0 (ref)
            l_authPageload_0(l_EventStreamConstants_0.Context.MultiPageSignupIsAvailableFetch, (tostring(os.clock() - v18)));
            if v19.FIDO2 ~= nil then
                v15 = v19.FIDO2.isAvailable and v19.FIDO2.supportsDeviceBoundOnly;
                v17 = true;
            else
                v15 = v19.isAvailable and v19.supportsDeviceBoundOnly or false;
            end;
            if v19.password ~= nil then
                v16 = v19.password.isAvailable;
            end;
            local v20 = {
                [l_PayloadKey_0.CredentialsProtocolPasskeyRegistrationAvailable] = tostring(v15), 
                [l_PayloadKey_0.CredentialsProtocolPasswordRegistrationAvailable] = tostring(v16), 
                [l_PayloadKey_0.CredentialsProtocolV2InterfaceAvailable] = tostring(v17)
            };
            v14({
                type = l_ActivationFrameworkContextAction_0.SetMergePayload, 
                data = {
                    payloadTable = v20
                }
            });
        end):catch(function(v21) --[[ Line: 69 ]]
            -- upvalues: l_authClientError_0 (ref), v13 (copy), l_EventStreamConstants_0 (ref), l_Logger_0 (ref)
            l_authClientError_0(v13, l_EventStreamConstants_0.State.CredentialsProtocolNotAvailable);
            l_Logger_0:warning("Error checking for credential availability. Error: {}", v21);
        end);
    else
        l_authPageload_0(l_EventStreamConstants_0.Context.MultiPageSignupIsAvailableFetch, "0");
        v15 = v12[l_PayloadKey_0.CredentialsProtocolPasskeyRegistrationAvailable] == "true";
        v16 = v12[l_PayloadKey_0.CredentialsProtocolPasswordRegistrationAvailable] == "true";
        v17 = v12[l_PayloadKey_0.CredentialsProtocolV2InterfaceAvailable] == "true";
    end;
    return v15, v16, v17;
end;