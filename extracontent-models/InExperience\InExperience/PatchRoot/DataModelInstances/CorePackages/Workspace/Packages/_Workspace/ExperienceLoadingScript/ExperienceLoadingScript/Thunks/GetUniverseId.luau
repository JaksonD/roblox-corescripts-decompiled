local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExperienceLoadingScript");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Actions.SetUniverseId);
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v4, v5) --[[ Line: 6 ]]
    -- upvalues: v2 (copy), l_Url_0 (copy)
    local function v9(v6) --[[ Line: 7 ]]
        -- upvalues: v2 (ref)
        local l_PlaceId_0 = game.PlaceId;
        local l_GameId_0 = game.GameId;
        while l_PlaceId_0 <= 0 or l_GameId_0 <= 0 do
            wait();
            l_PlaceId_0 = game.PlaceId;
            l_GameId_0 = game.GameId;
        end;
        v6:dispatch(v2({
            universeId = l_GameId_0, 
            placeId = l_PlaceId_0
        }));
    end;
    return function(v10) --[[ Line: 23 ]]
        -- upvalues: v5 (copy), l_Url_0 (ref), v4 (copy), v2 (ref), v9 (copy)
        coroutine.wrap(function() --[[ Line: 24 ]]
            -- upvalues: v5 (ref), l_Url_0 (ref), v4 (ref), v10 (copy), v2 (ref), v9 (ref)
            local l_v5_0 = v5;
            local l_GameId_1 = game.GameId;
            if l_v5_0 > 0 and l_GameId_1 <= 0 then
                local v13 = string.format("%suniverses/v1/places/%d/universe", l_Url_0.APIS_URL, l_v5_0);
                v4(v13, "GET"):andThen(function(v14) --[[ Line: 31 ]]
                    -- upvalues: l_GameId_1 (ref), v10 (ref), v2 (ref), l_v5_0 (copy), v9 (ref)
                    if v14 and v14.responseBody then
                        l_GameId_1 = v14.responseBody.universeId;
                        if l_GameId_1 and l_GameId_1 >= 0 then
                            v10:dispatch(v2({
                                universeId = l_GameId_1, 
                                placeId = l_v5_0
                            }));
                            return;
                        end;
                    end;
                    v9(v10);
                end, function(_) --[[ Line: 44 ]]
                    -- upvalues: v9 (ref), v10 (ref)
                    v9(v10);
                end);
            else
                v9(v10);
            end;
        end)();
    end;
end;