local l_Parent_0 = script:FindFirstAncestor("GameInvite").Parent;
local v1 = require(l_Parent_0.HttpRequest);
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_FFlagLuaAppDefaultHttpRetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDefaultHttpRetry;
local v4 = v1.config({
    requestFunction = v1.requestFunctions.RequestInternal, 
    maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("GetRewardMetadataHttpRetryCount", 4) else nil
});
local v5 = require(l_Parent_0.Promise);
return function() --[[ Line: 14 ]]
    -- upvalues: v5 (copy), l_Url_0 (copy), v4 (copy)
    if game.GameId == nil or game.GameId == 0 then
        return v5.reject("GameId is nil or 0");
    else
        local v6 = l_Url_0:makeQueryString({
            UniverseId = game.GameId
        });
        local v7 = string.format("%sreferral-reward-metadata/v1/get-reward-metadata?%s", l_Url_0.APIS_URL, v6);
        return v4(v7, "GET");
    end;
end;