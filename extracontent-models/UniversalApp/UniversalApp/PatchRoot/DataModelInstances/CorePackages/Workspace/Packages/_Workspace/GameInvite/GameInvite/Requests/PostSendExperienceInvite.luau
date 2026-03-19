local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("GameInvite").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
game:DefineFastFlag("LuaAppExperienceJoinIdempotencyKey", false);
return function(v3, v4, v5, v6, v7, v8) --[[ Line: 9 ]]
    -- upvalues: l_HttpService_0 (copy), l_Url_0 (copy)
    local v9 = l_HttpService_0:JSONEncode({
        recipientUserId = v4, 
        inviteMessageId = v7, 
        placeId = v5, 
        launchData = v8, 
        trigger = v6, 
        idempotencyKey = if game:GetFastFlag("LuaAppExperienceJoinIdempotencyKey") then l_HttpService_0:GenerateGUID(false) else nil
    });
    return v3(string.format("%snotifications/v1/send-experience-invite", l_Url_0.APIS_URL), "POST", {
        postBody = v9
    });
end;