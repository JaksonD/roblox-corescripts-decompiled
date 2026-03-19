local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInfosRodux");
local v1 = require(l_script_FirstAncestor_0.GameInfosReducer);
local v2 = require(l_script_FirstAncestor_0.AddGames);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.tutils);
local l_ApiFetchGameIcons_0 = require(l_Parent_0.GameIconRodux).GameIcons.ApiFetchGameIcons;
local _ = require(l_Parent_0.DiscoveryTypes);
local l_FFlagLuaAppReduceGameIconFetches_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppReduceGameIconFetches;
return function(v8, v9, v10, v11, v12, v13) --[[ Line: 11 ]] --[[ Name: parseAndAddGameInfos ]]
    -- upvalues: v1 (copy), v4 (copy), l_FFlagLuaAppReduceGameIconFetches_0 (copy), v2 (copy), l_ApiFetchGameIcons_0 (copy)
    local v14 = v9:getState().Personalization[v1.key];
    local v15 = {};
    local v16 = {};
    for _, v18 in v10 do
        v11(v18):match(function(v19) --[[ Line: 27 ]]
            -- upvalues: v4 (ref), v14 (copy), v15 (copy), l_FFlagLuaAppReduceGameIconFetches_0 (ref), v13 (copy), v16 (copy), v12 (copy), v18 (copy)
            local l_universeId_0 = v19.universeId;
            if not v4.shallowEqual(v19, v14[l_universeId_0]) then
                v15[l_universeId_0] = v19;
                if not l_FFlagLuaAppReduceGameIconFetches_0 or not v13 or v13(l_universeId_0) then
                    table.insert(v16, l_universeId_0);
                end;
            end;
            if v12 then
                v12(v18, v19);
            end;
        end):matchError(function(v21) --[[ Line: 46 ]]
            warn((("parseAndAddGameInfos could not parse gameInfo: %*"):format(v21)));
        end);
    end;
    if next(v15) then
        v9:dispatch(v2(v15));
    end;
    if #v16 > 0 then
        v9:dispatch(l_ApiFetchGameIcons_0(v8, v16));
    end;
end;