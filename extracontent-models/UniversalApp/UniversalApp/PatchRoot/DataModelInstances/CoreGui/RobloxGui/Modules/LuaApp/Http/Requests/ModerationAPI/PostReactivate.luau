local l_Players_0 = game:GetService("Players");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Modules_0.LuaApp.ArgCheck);
local v4 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
return function(v5, v6) --[[ Line: 16 ]]
    -- upvalues: v3 (copy), l_Players_0 (copy), v4 (copy), l_HttpService_0 (copy)
    v3.isType(v6, "number", "PostReactivate expects punishmentId to be a number");
    local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
    return v5(v4.usermoderation.reactivate(), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            PunishmentId = v6, 
            PunishedUserId = l_UserId_0
        })
    });
end;