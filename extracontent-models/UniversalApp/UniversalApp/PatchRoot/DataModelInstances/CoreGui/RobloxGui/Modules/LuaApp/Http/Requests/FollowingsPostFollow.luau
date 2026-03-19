local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
local l_HttpService_0 = game:GetService("HttpService");
return function(v3, v4, v5) --[[ Line: 14 ]]
    -- upvalues: v1 (copy), l_HttpService_0 (copy)
    assert(type(v4) == "string", "FollowingsPostFollow request expects userId to be a string");
    assert(type(v5) == "string", "FollowingsPostFollow request expects universeId to be a string");
    return v3(string.format("%s/v1/users/%s/universes/%s", v1.FOLLOWINGS_URL, v4, v5), "POST", {
        postBody = l_HttpService_0:JSONEncode({})
    });
end;