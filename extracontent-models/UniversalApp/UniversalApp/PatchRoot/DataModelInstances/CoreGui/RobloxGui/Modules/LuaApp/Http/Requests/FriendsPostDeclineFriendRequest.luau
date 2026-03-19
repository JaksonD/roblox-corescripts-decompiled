local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Http.Url);
return function(v3, v4) --[[ Line: 13 ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy)
    return v3(string.format("%s/users/%s/decline-friend-request", v2.FRIEND_URL, v4), "POST", {
        postBody = l_HttpService_0:JSONEncode({})
    });
end;