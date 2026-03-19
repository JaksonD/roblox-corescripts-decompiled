local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_AppLogging_0 = require(l_Parent_0.RoactServiceTags).AppLogging;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v8 = require(l_Parent_0.DiscoveryTypes);
local l_DEFAULT_GAME_FETCH_COUNT_0 = v8.Constants.DEFAULT_GAME_FETCH_COUNT;
local l_reportWarning_0 = require(l_Parent_0.DiscoveryAnalytics).Points.reportWarning;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v12 = require(l_Modules_0.LuaApp.Thunks.FetchDataWithErrorToasts);
local v13 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamesInSort);
local v14 = require(l_Modules_0.LuaApp.Thunks.Omni.ApiFetchOmniRecommendationsMetadata);
local l_FFlagLuaAppLogOmniRecommendationsMetadata_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLogOmniRecommendationsMetadata;
return function(v16, v17, v18, v19, v20) --[[ Line: 30 ]] --[[ Name: useLoadMoreGames ]]
    -- upvalues: l_RetrievalStatus_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_AppLogging_0 (copy), l_useDispatch_0 (copy), v2 (copy), v12 (copy), v14 (copy), l_DEFAULT_GAME_FETCH_COUNT_0 (copy), l_FFlagLuaAppLogOmniRecommendationsMetadata_0 (copy), v8 (copy), v13 (copy), l_reportWarning_0 (copy)
    local v21 = v16 and v16.hasMoreRows or false;
    local v22 = v18 == l_RetrievalStatus_0.Fetching;
    local v23 = v21 and not v22;
    local v24 = l_useRoactService_0(l_RoactNetworking_0);
    local v25 = l_useRoactService_0(l_AppLogging_0);
    local v26 = l_useDispatch_0();
    return (v2.useCallback(function() --[[ Line: 47 ]]
        -- upvalues: v23 (copy), v16 (copy), v17 (copy), v26 (copy), v12 (ref), v14 (ref), v24 (copy), v19 (copy), v20 (copy), l_DEFAULT_GAME_FETCH_COUNT_0 (ref), v25 (copy), l_FFlagLuaAppLogOmniRecommendationsMetadata_0 (ref), v8 (ref), v13 (ref), l_reportWarning_0 (ref)
        if not v23 then
            return;
        elseif v16 == nil or v17 == nil then
            return;
        elseif v17:isOmni() then
            return v26((v12((v14(v24, v19, v20, l_DEFAULT_GAME_FETCH_COUNT_0, v25, l_FFlagLuaAppLogOmniRecommendationsMetadata_0 and "useLoadMoreGames" or nil)))));
        elseif v17.dataSource == v8.DataSourceType.ExploreApi then
            return v26((v12((v13(v24, v17, true, {
                startRows = v16.rowsRequested, 
                maxRows = l_DEFAULT_GAME_FETCH_COUNT_0, 
                exclusiveStartId = v16.nextPageExclusiveStartId, 
                pageToken = v16.nextPageToken
            })))));
        else
            l_reportWarning_0(v25, "DataFetch", (("Tried to fetch more games for unsupported API. sort: %*, API: %*"):format(v17.name, v17.dataSource)));
            return;
        end;
    end, {
        v23, 
        v24, 
        v26, 
        v19, 
        v17, 
        v16, 
        v20, 
        v25
    }));
end;