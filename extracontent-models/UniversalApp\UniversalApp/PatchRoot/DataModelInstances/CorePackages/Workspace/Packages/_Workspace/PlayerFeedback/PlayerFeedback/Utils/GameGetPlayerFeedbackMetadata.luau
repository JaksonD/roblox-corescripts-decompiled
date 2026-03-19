local l_Parent_0 = script:FindFirstAncestor("PlayerFeedback").Parent;
local l_GetFStringEdpPlayerFeedbackServiceRoute_0 = require(l_Parent_0.SharedFlags).GetFStringEdpPlayerFeedbackServiceRoute;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v3, v4, v5) --[[ Line: 10 ]]
    -- upvalues: l_Url_0 (copy), l_GetFStringEdpPlayerFeedbackServiceRoute_0 (copy)
    assert(type(v4) == "string", "GamesGetPlayerFeedbackMetadata request expects channelId to be a string");
    assert(type(v5) == "string", "GamesGetPlayerFeedbackMetadata request expects assetId to be a string");
    return v3(string.format("%s%s/v1/channels/%s/assets/%s", l_Url_0.APIS_URL, l_GetFStringEdpPlayerFeedbackServiceRoute_0(), v4, v5), "GET");
end;