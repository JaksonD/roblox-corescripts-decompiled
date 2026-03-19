local l_Parent_0 = script:FindFirstAncestor("DataHydration").Parent;
local v1 = require(l_Parent_0.HttpRequest);
local v2 = require(script.Parent.FavoritesUrlBuilder);
return function(v3) --[[ Line: 10 ]] --[[ Name: fetchFavorite ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v4 = v2.buildFavoriteUrl(v3);
    return v1.config({
        requestFunction = function(v5, v6, v7) --[[ Line: 14 ]] --[[ Name: requestFunction ]]
            -- upvalues: v1 (ref)
            return v1.requestFunctions.HttpRbxApi(v5, v6, v7);
        end
    })(v4, "GET");
end;