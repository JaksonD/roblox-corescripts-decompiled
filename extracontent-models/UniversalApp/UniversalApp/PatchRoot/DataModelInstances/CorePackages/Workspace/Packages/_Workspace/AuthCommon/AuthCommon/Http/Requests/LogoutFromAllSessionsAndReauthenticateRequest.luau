local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
return function(v3) --[[ Line: 8 ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_HttpService_0 (copy)
    local v4 = l_UrlBuilder_0.fromString("auth:/v1/logoutfromallsessionsandreauthenticate");
    local v5 = l_HttpService_0:JSONEncode({
        SecureAuthenticationIntent = {
            clientPublicKey = "", 
            clientEpochTimestamp = "", 
            saiSignature = "", 
            serverNonce = ""
        }
    });
    return v3(v4(), "POST", {
        postBody = v5
    });
end;