local l_Parent_0 = script:FindFirstAncestor("DataHydration").Parent;
local v1 = require(l_Parent_0.HttpRequest);
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(script.Parent.FavoritesUrlBuilder);
return function(v4, v5) --[[ Line: 10 ]] --[[ Name: requestUpdateFavorite ]]
    -- upvalues: v3 (copy), l_HttpService_0 (copy), v1 (copy)
    local v6 = v3.buildFavoriteUpdateUrl(v4);
    local v7 = l_HttpService_0:JSONEncode({
        isFavorited = v5
    });
    return v1.config({
        requestFunction = function(v8, v9, v10) --[[ Line: 18 ]] --[[ Name: requestFunction ]]
            -- upvalues: v1 (ref)
            return v1.requestFunctions.HttpRbxApi(v8, v9, v10);
        end
    })(v6, "POST", {
        postBody = v7
    });
end;