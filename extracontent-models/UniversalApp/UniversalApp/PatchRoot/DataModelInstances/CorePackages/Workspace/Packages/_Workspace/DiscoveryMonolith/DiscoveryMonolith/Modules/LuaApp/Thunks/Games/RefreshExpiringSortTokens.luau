local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local v4 = require(l_Parent_0.FetchStatusRodux);
local l_FetchStatusReducer_0 = v4.FetchStatusReducer;
local l_FetchStatusNamespace_0 = v4.FetchStatusNamespace;
local v7 = require(l_Parent_0.NextDataExpirationTimeRodux);
local l_NextDataExpirationTimeReducer_0 = v7.NextDataExpirationTimeReducer;
local l_ExpirationTimeNamespace_0 = v7.ExpirationTimeNamespace;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v11 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchSortTokens);
local l_FFlagLuaAppFixGamesListSortTokenExpiringTime_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixGamesListSortTokenExpiringTime;
local v13 = if l_FFlagLuaAppFixGamesListSortTokenExpiringTime_0 then nil else 600;
local function _(v14, v15, v16) --[[ Line: 25 ]] --[[ Name: shouldRefreshSortGroup ]]
    -- upvalues: l_FFlagLuaAppFixGamesListSortTokenExpiringTime_0 (copy), l_RetrievalStatus_0 (copy), v13 (copy)
    if l_FFlagLuaAppFixGamesListSortTokenExpiringTime_0 then
        local v17 = false;
        if v14 ~= l_RetrievalStatus_0.Fetching then
            v17 = v15 <= v16;
        end;
        return v17;
    else
        local v18 = false;
        if v14 ~= l_RetrievalStatus_0.Fetching then
            v18 = v15 - v13 <= v16;
        end;
        return v18;
    end;
end;
return function(v20, v21) --[[ Line: 36 ]]
    -- upvalues: l_FetchStatusReducer_0 (copy), l_FetchStatusNamespace_0 (copy), l_NextDataExpirationTimeReducer_0 (copy), l_ExpirationTimeNamespace_0 (copy), l_FFlagLuaAppFixGamesListSortTokenExpiringTime_0 (copy), l_RetrievalStatus_0 (copy), v13 (copy), v11 (copy), v2 (copy)
    return function(v22) --[[ Line: 37 ]]
        -- upvalues: v21 (copy), l_FetchStatusReducer_0 (ref), l_FetchStatusNamespace_0 (ref), l_NextDataExpirationTimeReducer_0 (ref), l_ExpirationTimeNamespace_0 (ref), l_FFlagLuaAppFixGamesListSortTokenExpiringTime_0 (ref), l_RetrievalStatus_0 (ref), v13 (ref), v11 (ref), v20 (copy), v2 (ref)
        local v23 = {};
        local v24 = tick();
        local v25 = v22:getState();
        for _, v27 in ipairs(v21) do
            local v28 = v25.Personalization[l_FetchStatusReducer_0.key][l_FetchStatusNamespace_0.GameSortToken][v27];
            local v29 = nil;
            local v30 = v25.Personalization[l_NextDataExpirationTimeReducer_0.key][l_ExpirationTimeNamespace_0.GameSortGroup];
            if v30 then
                v29 = v30[v27];
            end;
            local v31 = v29 or 0;
            if if l_FFlagLuaAppFixGamesListSortTokenExpiringTime_0 then v28 ~= l_RetrievalStatus_0.Fetching and v31 <= v24 else v28 ~= l_RetrievalStatus_0.Fetching and v31 - v13 <= v24 then
                table.insert(v23, v22:dispatch(v11(v20, v27, nil)));
            end;
        end;
        return v2.all(v23);
    end;
end;