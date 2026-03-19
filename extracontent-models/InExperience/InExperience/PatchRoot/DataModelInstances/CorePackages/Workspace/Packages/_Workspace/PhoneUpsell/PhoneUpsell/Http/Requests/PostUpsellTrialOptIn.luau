local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("PhoneUpsell").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v3, v4) --[[ Line: 6 ]]
    -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy)
    return v3(string.format("%supsellcard/trial-opt-in", l_Url_0.APIS_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            upsellCardType = v4
        })
    });
end;