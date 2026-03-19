local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
return function(v2, v3, v4) --[[ Line: 22 ]]
    -- upvalues: v1 (copy)
    assert(type(v3) == "string", "FollowingsGetStatus request expects userId to be a string");
    assert(type(v4) == "string", "FollowingsGetStatus request expects universeId to be a string");
    return v2(string.format("%s/v1/users/%s/universes/%s/status", v1.FOLLOWINGS_URL, v3, v4), "GET");
end;