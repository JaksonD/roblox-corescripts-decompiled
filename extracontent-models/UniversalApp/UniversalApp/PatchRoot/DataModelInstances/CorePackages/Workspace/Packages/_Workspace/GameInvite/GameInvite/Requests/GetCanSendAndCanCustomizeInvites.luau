local l_Parent_0 = script:FindFirstAncestor("GameInvite").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2, v3, v4) --[[ Line: 6 ]]
    -- upvalues: l_Url_0 (copy)
    local v5 = l_Url_0:makeQueryString({
        RecipientUserId = v4, 
        Trigger = v3, 
        PlaceId = game.PlaceId
    });
    return v2(string.format("%snotifications/v1/can-prompt-experience-invite?%s", l_Url_0.APIS_URL, v5), "GET");
end;