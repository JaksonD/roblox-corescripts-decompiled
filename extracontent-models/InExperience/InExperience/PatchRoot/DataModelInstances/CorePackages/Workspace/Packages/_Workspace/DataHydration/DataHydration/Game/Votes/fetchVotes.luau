local l_Parent_0 = script:FindFirstAncestor("DataHydration").Parent;
local v1 = require(l_Parent_0.Http);
local v2 = require(l_Parent_0.HttpRequest);
local l_Url_0 = v1.Url;
return function(v4) --[[ Line: 11 ]] --[[ Name: requestVotes ]]
    -- upvalues: l_Url_0 (copy), v2 (copy)
    local v5 = table.concat(v4, ",");
    local v6 = string.format("%sv1/games/votes?universeIds=%s", l_Url_0.GAME_URL, v5);
    return v2.config({
        requestFunction = function(v7, v8, v9) --[[ Line: 17 ]] --[[ Name: requestFunction ]]
            -- upvalues: v2 (ref)
            return v2.requestFunctions.HttpRbxApi(v7, v8, v9);
        end
    })(v6, "GET");
end;