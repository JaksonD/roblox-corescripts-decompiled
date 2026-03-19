local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Http.Url);
return function(v3, v4) --[[ Line: 20 ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy)
    return v3(string.format("%s/user/following-exists", v2.FRIEND_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            targetUserIds = v4
        })
    });
end;