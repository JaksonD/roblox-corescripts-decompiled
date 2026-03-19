local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_TopicInfosReducer_0 = require(l_Parent_0.TopicInfosRodux).TopicInfosReducer;
local l_GameSortGroups_0 = require(l_Parent_0.DiscoveryTypes).GameSortGroups;
local v4 = require(l_Parent_0.Promise);
local l_PromiseUtilities_0 = require(l_Parent_0.AppCommonLib).Utils.PromiseUtilities;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v7 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamesInSort);
return function(v8, v9, v10, v11, v12) --[[ Line: 12 ]]
    -- upvalues: l_GameSortGroups_0 (copy), l_TopicInfosReducer_0 (copy), v7 (copy), v4 (copy), l_PromiseUtilities_0 (copy)
    if not v9 then
        v9 = l_GameSortGroups_0.Games;
    end;
    assert(v9, "not nil");
    return function(v13) --[[ Line: 19 ]]
        -- upvalues: v10 (copy), v9 (ref), v12 (copy), l_TopicInfosReducer_0 (ref), v7 (ref), v8 (copy), v11 (copy), v4 (ref), l_PromiseUtilities_0 (ref)
        local v14 = {};
        local v15 = v13:getState();
        if not v10 then
            local v16 = #v15.GameSortGroups[v9].sorts;
            if v12 ~= nil then
                v16 = math.min(v12, v16);
            end;
            for v17 = 1, v16 do
                local v18 = v15.GameSortGroups[v9].sorts[v17];
                local v19 = v15.Personalization[l_TopicInfosReducer_0.key][v18];
                table.insert(v14, (v13:dispatch(v7(v8, v19, nil, v11))));
            end;
        elseif v15.Personalization[l_TopicInfosReducer_0.key][v10] then
            table.insert(v14, (v13:dispatch(v7(v8, v15.Personalization[l_TopicInfosReducer_0.key][v10], nil, v11))));
        else
            v4.reject();
        end;
        return l_PromiseUtilities_0.Batch(v14);
    end;
end;