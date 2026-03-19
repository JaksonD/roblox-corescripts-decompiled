local l_Parent_0 = script:FindFirstAncestor("DataHydration").Parent;
local v1 = require(l_Parent_0.Http);
local v2 = require(l_Parent_0.HttpRequest);
local l_HttpService_0 = game:GetService("HttpService");
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_Url_0 = v1.Url;
return function(v6, v7) --[[ Line: 13 ]] --[[ Name: requestUserVoteUpdate ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_Url_0 (copy), v2 (copy), l_HttpService_0 (copy)
    local v8 = l_UrlBuilder_0.new({
        base = l_Url_0.GAME_URL, 
        path = "v1/games/{universeId}/user-votes"
    })({
        universeId = v6
    });
    return v2.config({
        requestFunction = function(v9, v10, v11) --[[ Line: 22 ]] --[[ Name: requestFunction ]]
            -- upvalues: v2 (ref)
            return v2.requestFunctions.RequestInternal(v9, v10, v11);
        end
    })(v8, "PATCH", {
        postBody = l_HttpService_0:JSONEncode({
            vote = v7 == nil and "null" or v7
        })
    });
end;