local l_Parent_0 = script:FindFirstAncestor("PhoneUpsell").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
return function(v3, v4, v5, v6, v7) --[[ Line: 7 ]]
    -- upvalues: l_HttpService_0 (copy), l_UrlBuilder_0 (copy)
    local v8 = l_HttpService_0:JSONEncode({
        layerName = v4, 
        displayTime = v5, 
        userIgnored = v6
    });
    return v3(l_UrlBuilder_0.fromString("apis:upsellcard/v1/phone-verification/display-time")(), "POST", if v7 then {
        postBody = v8
    } else v8);
end;