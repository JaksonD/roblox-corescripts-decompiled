local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.tutils);
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_TopicInfosReducer_0 = require(l_Parent_0.TopicInfosRodux).TopicInfosReducer;
local l_GameSortGroups_0 = require(l_Parent_0.DiscoveryTypes).GameSortGroups;
local v12 = require(l_Parent_0.FetchStatusRodux);
local l_FetchStatusReducer_0 = v12.FetchStatusReducer;
local l_FetchStatusNamespace_0 = v12.FetchStatusNamespace;
local l_SetFetchStatus_0 = v12.SetFetchStatus;
local v16 = require(l_Parent_0.NextDataExpirationTimeRodux);
local l_SetNextDataExpirationTime_0 = v16.SetNextDataExpirationTime;
local l_ExpirationTimeNamespace_0 = v16.ExpirationTimeNamespace;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v20 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamesInSort);
return function(v21) --[[ Line: 31 ]] --[[ Name: useLoadGamesForSortFromGamesApi ]]
    -- upvalues: v3 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), l_TopicInfosReducer_0 (copy), l_FetchStatusReducer_0 (copy), l_FetchStatusNamespace_0 (copy), l_RetrievalStatus_0 (copy), v4 (copy), v20 (copy), l_HttpService_0 (copy), l_SetFetchStatus_0 (copy), l_SetNextDataExpirationTime_0 (copy), l_GameSortGroups_0 (copy), l_ExpirationTimeNamespace_0 (copy)
    local v22, v23 = v3.useState(0);
    local v24 = l_useRoactService_0(l_RoactNetworking_0);
    local v25 = l_useDispatch_0();
    local v29 = l_useSelector_0(function(v26) --[[ Line: 35 ]]
        -- upvalues: l_TopicInfosReducer_0 (ref), v21 (copy), l_FetchStatusReducer_0 (ref), l_FetchStatusNamespace_0 (ref), l_RetrievalStatus_0 (ref)
        local v27 = nil;
        v27 = v26.Personalization[l_TopicInfosReducer_0.key][v21];
        if v27 and v27:isOmni() then
            v27 = nil;
        end;
        local v28 = v26.Personalization[l_FetchStatusReducer_0.key][l_FetchStatusNamespace_0.GameSorts][v21] or l_RetrievalStatus_0.NotStarted;
        return {
            gamesApiGameSort = v27, 
            gameSortFetchingStatus = v28
        };
    end, v4.shallowEqual);
    local l_gamesApiGameSort_0 = v29.gamesApiGameSort;
    local l_gameSortFetchingStatus_0 = v29.gameSortFetchingStatus;
    return (v3.useCallback(function() --[[ Line: 53 ]]
        -- upvalues: l_gamesApiGameSort_0 (copy), l_gameSortFetchingStatus_0 (copy), l_RetrievalStatus_0 (ref), v25 (copy), v20 (ref), v24 (copy), v22 (copy), l_HttpService_0 (ref), l_SetFetchStatus_0 (ref), l_FetchStatusNamespace_0 (ref), l_SetNextDataExpirationTime_0 (ref), l_GameSortGroups_0 (ref), l_ExpirationTimeNamespace_0 (ref), v23 (copy)
        if l_gamesApiGameSort_0 == nil or l_gameSortFetchingStatus_0 ~= l_RetrievalStatus_0.NotStarted then
            return;
        else
            assert(l_gamesApiGameSort_0, "gamesApiGameSort can never be nil");
            v25(v20(v24, l_gamesApiGameSort_0, false, nil)):catch(function(v32) --[[ Line: 58 ]]
                -- upvalues: v22 (ref), l_HttpService_0 (ref), v25 (ref), l_SetFetchStatus_0 (ref), l_FetchStatusNamespace_0 (ref), l_gamesApiGameSort_0 (ref), l_RetrievalStatus_0 (ref), l_SetNextDataExpirationTime_0 (ref), l_GameSortGroups_0 (ref), l_ExpirationTimeNamespace_0 (ref), v23 (ref)
                if v22 > 2 then
                    return;
                else
                    if v32 and v32.Body then
                        local l_status_0, l_result_0 = pcall(function() --[[ Line: 69 ]]
                            -- upvalues: l_HttpService_0 (ref), v32 (copy)
                            return l_HttpService_0:JSONDecode(v32.Body);
                        end);
                        if l_status_0 and l_result_0 and l_result_0.errors then
                            for _, v36 in ipairs(l_result_0.errors) do
                                if v36.code == 400 and v36.field == "sortToken" then
                                    v25(l_SetFetchStatus_0(l_FetchStatusNamespace_0.GameSorts, l_gamesApiGameSort_0.name, l_RetrievalStatus_0.NotStarted));
                                    v25(l_SetNextDataExpirationTime_0(l_GameSortGroups_0.Games, 0, l_ExpirationTimeNamespace_0.GameSortGroup));
                                    v23(v22 + 1);
                                end;
                            end;
                        end;
                    end;
                    return;
                end;
            end);
            return;
        end;
    end, {
        l_gamesApiGameSort_0, 
        l_gameSortFetchingStatus_0, 
        v22, 
        v24, 
        v25
    }));
end;