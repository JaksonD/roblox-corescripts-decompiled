local l_Parent_0 = script.Parent.Parent.Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_HttpService_0 = game:GetService("HttpService");
return function(v3, v4, v5) --[[ Line: 14 ]]
    -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy)
    assert(type(v4) == "string", "FollowingsPostFollow request expects userId to be a string");
    assert(type(v5) == "string", "FollowingsPostFollow request expects universeId to be a string");
    return v3(string.format("%s/v1/users/%s/universes/%s", l_Url_0.FOLLOWINGS_URL, v4, v5), "POST", {
        postBody = l_HttpService_0:JSONEncode({})
    });
end;