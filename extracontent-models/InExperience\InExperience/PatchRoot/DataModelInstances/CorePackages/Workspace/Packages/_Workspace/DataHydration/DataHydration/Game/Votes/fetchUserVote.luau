local l_Parent_0 = script:FindFirstAncestor("DataHydration").Parent;
local v1 = require(l_Parent_0.Http);
local v2 = require(l_Parent_0.HttpRequest);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_Url_0 = v1.Url;
return function(v5) --[[ Line: 12 ]] --[[ Name: requestUserVote ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_Url_0 (copy), v2 (copy)
    local v6 = l_UrlBuilder_0.new({
        base = l_Url_0.GAME_URL, 
        path = "v1/games/{universeId}/votes/user"
    })({
        universeId = v5
    });
    return v2.config({
        requestFunction = function(v7, v8, v9) --[[ Line: 21 ]] --[[ Name: requestFunction ]]
            -- upvalues: v2 (ref)
            return v2.requestFunctions.HttpRbxApi(v7, v8, v9);
        end
    })(v6, "GET");
end;