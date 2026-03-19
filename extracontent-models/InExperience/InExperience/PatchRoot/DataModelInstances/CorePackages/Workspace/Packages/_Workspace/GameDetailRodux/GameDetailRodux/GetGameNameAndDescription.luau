local l_Parent_0 = script:FindFirstAncestor("GameDetailRodux").Parent;
local v1 = require(l_Parent_0.Promise);
local l_Url_0 = require(l_Parent_0.Http).Url;
local v3 = {};
return function(v4, v5) --[[ Line: 10 ]]
    -- upvalues: v3 (copy), l_Url_0 (copy), v1 (copy)
    if v3[v5] then
        return v3[v5];
    else
        v3[v5] = v4(string.format("%sv1/games?universeIds=%s", l_Url_0.GAME_URL, (tostring(v5))), "GET"):andThen(function(v6) --[[ Line: 16 ]]
            -- upvalues: v1 (ref)
            if not v6.responseBody or not v6.responseBody.data then
                v1.reject("Unexpected response when fetching game name");
            end;
            local v7 = v6.responseBody.data[1];
            if not v7 or not v7.name then
                v1.reject("Unexpected response when fetching game name, no game info");
            end;
            return v1.resolve({
                Name = v7.name, 
                Description = v7.description or "", 
                Created = v7.created
            });
        end, function(v8) --[[ Line: 32 ]]
            -- upvalues: v1 (ref)
            return v1.reject(v8);
        end);
        return v3[v5];
    end;
end;