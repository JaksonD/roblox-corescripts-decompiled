local l_Parent_0 = script:FindFirstAncestor("PhoneUpsell").Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
return function(v2) --[[ Line: 18 ]]
    -- upvalues: l_UrlBuilder_0 (copy)
    return v2(l_UrlBuilder_0.fromString("accountinformation:phone/resend")(), "POST", {
        postBody = ""
    });
end;