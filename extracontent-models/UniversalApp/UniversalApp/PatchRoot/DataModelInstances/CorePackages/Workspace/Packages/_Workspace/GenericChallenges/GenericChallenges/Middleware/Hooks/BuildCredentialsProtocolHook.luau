local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_default_0 = require(l_Parent_0.CredentialsProtocol).CredentialsProtocol.default;
local v4 = require(l_script_FirstAncestor_0.Types.JavascriptHybrid);
local _ = require(l_script_FirstAncestor_0.Middleware.BuildHybridCallback);
local l_GetFFlagLuaAppEnableCredentialsProtocol_0 = require(l_Parent_0.CredentialsProtocol).Flags.GetFFlagLuaAppEnableCredentialsProtocol;
local l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 = require(l_Parent_0.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout;
local l_GetFIntLuaAppCredentialsProtocolTimeout_0 = require(l_Parent_0.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolTimeout;
local v9 = game:DefineFastFlag("EnableGetCredentialsInCredentialsProtocolHook", false);
local v10 = require(l_script_FirstAncestor_0.Utils.ExecuteJavaScriptInWebView);
return function(v11) --[[ Line: 19 ]]
    -- upvalues: l_default_0 (copy), v10 (copy), l_GetFFlagLuaAppEnableCredentialsProtocol_0 (copy), v4 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), v9 (copy), l_GetFIntLuaAppCredentialsProtocolTimeout_0 (copy), l_HttpService_0 (copy)
    local l_l_default_0_0 = l_default_0;
    local l_v10_0 = v10;
    local v14 = l_GetFFlagLuaAppEnableCredentialsProtocol_0();
    if v11 ~= nil and v11.defaultExecuteJavaScriptInWebView ~= nil then
        l_v10_0 = v11.defaultExecuteJavaScriptInWebView;
    end;
    if v11 ~= nil and v11.defaultCredentialsProtocol ~= nil then
        l_l_default_0_0 = v11.defaultCredentialsProtocol;
    end;
    if v11 ~= nil and v11.defaultCredentialsProtocolEnabled ~= nil then
        v14 = v11.defaultCredentialsProtocolEnabled;
    end;
    return function(v15) --[[ Line: 36 ]]
        -- upvalues: v14 (ref), v4 (ref), l_l_default_0_0 (ref), l_default_0 (ref), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (ref), l_v10_0 (ref), v9 (ref), l_GetFIntLuaAppCredentialsProtocolTimeout_0 (ref), l_HttpService_0 (ref)
        if v14 then
            if v15.feature == v4.Feature.CredentialsProtocolAvailable then
                l_l_default_0_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v16) --[[ Line: 44 ]]
                    -- upvalues: l_v10_0 (ref), v15 (copy)
                    local v17 = v16.isAvailable or false;
                    l_v10_0.Execute(v15.data.callId, (tostring(v17)));
                end):catch(function() --[[ Line: 48 ]]
                    -- upvalues: l_v10_0 (ref), v15 (copy)
                    l_v10_0.Execute(v15.data.callId, "false");
                end);
            elseif v9 and v15.feature == v4.Feature.GetCredentials then
                l_l_default_0_0:getCredentials(l_default_0.CredentialsTypes.FIDO2, v15.data.authenticationOptionsJSON, l_GetFIntLuaAppCredentialsProtocolTimeout_0()):andThen(function(v18) --[[ Line: 61 ]]
                    -- upvalues: l_v10_0 (ref), v15 (copy), l_HttpService_0 (ref)
                    l_v10_0.Execute(v15.data.callId, if v18 then l_HttpService_0:JSONEncode(v18) else "");
                end):catch(function() --[[ Line: 67 ]]
                    -- upvalues: l_v10_0 (ref), v15 (copy)
                    l_v10_0.Execute(v15.data.callId, "");
                end);
            end;
        end;
        return false;
    end;
end;