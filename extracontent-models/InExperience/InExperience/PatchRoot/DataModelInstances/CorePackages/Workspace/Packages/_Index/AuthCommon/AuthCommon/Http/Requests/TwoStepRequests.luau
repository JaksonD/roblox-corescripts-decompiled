local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_ConsoleAuthRequestWrapper_0 = require(l_Parent_0.Http).Utils.ConsoleAuthRequestWrapper;
local v5 = require(l_script_FirstAncestor_0.Utils.AppStorageUtilities);
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local l_FFlagEnableLuaAccountSwitch_0 = require(l_Parent_0.SharedFlags).FFlagEnableLuaAccountSwitch;
return {
    configuration = function(v8, v9) --[[ Line: 24 ]]
        -- upvalues: l_Url_0 (copy)
        return v8(string.format("%sv1/users/%d/configuration", l_Url_0.TWOSTEPVERIFICATION_URL, v9), "GET");
    end, 
    resend = function(v10, v11, v12) --[[ Line: 30 ]]
        -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy)
        return v10(string.format("%sv1/twostepverification/resend", l_Url_0.AUTH_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                username = v11, 
                ticket = v12, 
                actionType = "Login"
            }), 
            maxRetryCount = 0
        });
    end, 
    verify = function(v13, v14, v15, v16, v17) --[[ Line: 41 ]]
        -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy)
        return v13(string.format("%sv1/twostepverification/verify", l_Url_0.AUTH_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                username = v14, 
                ticket = v15, 
                code = v16, 
                rememberDevice = v17, 
                actionType = "Login"
            }), 
            maxRetryCount = 0
        });
    end, 
    login = function(v18, v19, v20, v21, v22) --[[ Line: 54 ]]
        -- upvalues: l_Url_0 (copy), l_getAppFeaturePolicies_0 (copy), l_HttpService_0 (copy), l_FFlagEnableLuaAccountSwitch_0 (copy), v5 (copy), l_ConsoleAuthRequestWrapper_0 (copy)
        local v23 = string.format("%sv3/users/%s/two-step-verification/login", l_Url_0.AUTH_URL, v19);
        local v24 = l_getAppFeaturePolicies_0();
        local v25 = l_HttpService_0:JSONEncode({
            challengeId = v20, 
            verificationToken = v21, 
            rememberDevice = v22, 
            accountBlob = l_FFlagEnableLuaAccountSwitch_0 and v5.getAccountBlob() or nil, 
            accountLinkParameters = if v24.getLinkingPlatform() then {
                LinkingPlatform = v24.getLinkingPlatform()
            } else nil
        });
        if v24.getUseSingleSignOn() and v24.getLinkedAuthEndpointsEnabled() then
            return l_ConsoleAuthRequestWrapper_0(v18, v23, "POST", {
                postBody = v25, 
                maxRetryCount = 0
            });
        else
            return v18(v23, "POST", {
                postBody = v25, 
                maxRetryCount = 0
            });
        end;
    end
};