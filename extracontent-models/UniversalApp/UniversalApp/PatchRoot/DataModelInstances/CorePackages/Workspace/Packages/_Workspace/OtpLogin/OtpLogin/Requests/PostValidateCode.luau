local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_HttpService_0 = game:GetService("HttpService");
local l_UrlBuilder_0 = v1.UrlBuilder.UrlBuilder;
local l_UrlBase_0 = v1.UrlBuilder.UrlBase;
local _ = require(l_Parent_0.Common.otpLoginTypes);
local v6 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "otp-service/v1/validateCode"
});
return function(v7, v8) --[[ Line: 17 ]]
    -- upvalues: v6 (copy), l_HttpService_0 (copy)
    local l_v6_0 = v6;
    local v10 = l_HttpService_0:JSONEncode({
        origin = v8.origin, 
        contactType = v8.contactType, 
        passCode = v8.passCode, 
        otpSessionToken = v8.otpSessionToken
    });
    return v7(l_v6_0(), "POST", {
        postBody = v10
    });
end;