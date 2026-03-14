local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GameSortGroups_0 = require(l_Parent_0.DiscoveryTypes).GameSortGroups;
local v3 = require(l_Parent_0.Promise);
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v6 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchSortTokens);
local v7 = require(l_Modules_0.LuaApp.Actions.SetGamesPageDataStatus);
local l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppChartsResetFetchingStatusOnFilterChange;
local l_FVariable_0 = settings():GetFVariable("LuaAppsDiagPageLoadTimeGames");
return function(v10, v11, v12, v13, v14) --[[ Line: 17 ]]
    -- upvalues: l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 (copy), l_RetrievalStatus_0 (copy), v3 (copy), v7 (copy), v6 (copy), l_GameSortGroups_0 (copy), l_FVariable_0 (copy)
    return function(v15) --[[ Line: 18 ]]
        -- upvalues: l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 (ref), l_RetrievalStatus_0 (ref), v3 (ref), v7 (ref), v14 (copy), v6 (ref), v10 (copy), l_GameSortGroups_0 (ref), v12 (copy), v13 (copy), v11 (copy), l_FVariable_0 (ref)
        if (if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then v15:getState().Startup.GamesPageDataStatus.status else v15:getState().Startup.GamesPageDataStatus) == l_RetrievalStatus_0.Fetching then
            return v3.resolve("games page data is already fetching");
        else
            local v16 = tick();
            v15:dispatch(v7(l_RetrievalStatus_0.Fetching, if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then v14 else nil));
            return v15:dispatch(v6(v10, l_GameSortGroups_0.Games, v12, v13)):andThen(function() --[[ Line: 41 ]]
                -- upvalues: v15 (copy), v7 (ref), l_RetrievalStatus_0 (ref), l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 (ref), v14 (ref), v12 (ref), v16 (copy), v11 (ref), l_FVariable_0 (ref), v3 (ref)
                v15:dispatch(v7(l_RetrievalStatus_0.Done, if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then v14 else nil));
                if not v12 or v12 == "" then
                    local v17 = (tick() - v16) * 1000;
                    v11.Diag:reportStats(l_FVariable_0, v17);
                end;
                return v3.resolve();
            end, function(v18) --[[ Line: 57 ]]
                -- upvalues: v15 (copy), v7 (ref), l_RetrievalStatus_0 (ref), l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 (ref), v14 (ref), v3 (ref)
                v15:dispatch(v7(l_RetrievalStatus_0.Failed, if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then v14 else nil));
                return v3.reject(v18);
            end);
        end;
    end;
end;