local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Rodux);
local l_FetchingStatus_0 = require(l_Parent_0.Http).Reducers.FetchingStatus;
local l_GameInfosReducer_0 = require(l_Parent_0.GameInfosRodux).GameInfosReducer;
local l_FetchStatusReducer_0 = require(l_Parent_0.FetchStatusRodux).FetchStatusReducer;
local l_GameIconReducer_0 = require(l_Parent_0.GameIconRodux).GameIcons.GameIconReducer;
local l_TopicContentsReducer_0 = require(l_Parent_0.TopicContentsRodux).TopicContentsReducer;
local l_GameFiltersReducer_0 = require(l_Parent_0.GameFilters).DataStore.GameFiltersReducer;
local l_TopicInfosReducer_0 = require(l_Parent_0.TopicInfosRodux).TopicInfosReducer;
local l_NextDataExpirationTimeReducer_0 = require(l_Parent_0.NextDataExpirationTimeRodux).NextDataExpirationTimeReducer;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v13 = require(l_Modules_0.Personalization.OmniFeed.DataStore.GameGridFlexFeedItemBounds);
local l_FFlagLuaAppChartsStickyHeader_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppChartsStickyHeader;
local v19 = v3.combineReducers({
    FetchingStatus = l_FetchingStatus_0, 
    GameDetails = require(l_Parent_0.GameDetailRodux).GameDetails.GameDetailReducer, 
    [l_GameIconReducer_0.key] = l_GameIconReducer_0.reducer, 
    GameVotes = require(l_Parent_0.GameVotesRodux).GameVotes.GameVotes, 
    InGameUsersByGame = function(v15, _) --[[ Line: 27 ]] --[[ Name: InGameUsersByGame ]]
        return v15 or {};
    end, 
    OmniRecommendations = require(l_Modules_0.LuaApp.Reducers.Games.OmniRecommendations), 
    OmniRecommendationsRefreshTime = require(l_Modules_0.LuaApp.Reducers.Games.OmniRecommendationsRefreshTime), 
    Personalization = v3.combineReducers({
        [l_FetchStatusReducer_0.key] = l_FetchStatusReducer_0.reducer, 
        [l_GameFiltersReducer_0.key] = l_GameFiltersReducer_0.reducer, 
        GameGridFlexFeedItemBounds = v13, 
        [l_GameInfosReducer_0.key] = l_GameInfosReducer_0.reducer, 
        [l_NextDataExpirationTimeReducer_0.key] = l_NextDataExpirationTimeReducer_0.reducer, 
        OrderedOmniItems = l_FFlagLuaAppChartsStickyHeader_0 and function(v17, _) --[[ Line: 40 ]]
            return v17 or {};
        end or nil, 
        [l_TopicContentsReducer_0.key] = l_TopicContentsReducer_0.reducer, 
        [l_TopicInfosReducer_0.key] = l_TopicInfosReducer_0.reducer
    }), 
    RequestsStatus = require(l_Modules_0.LuaApp.Reducers.RequestsStatus), 
    UserGameVotes = require(l_Parent_0.GameVotesRodux).UserGameVotes.UserGameVotes
});
local function v22(v20, v21) --[[ Line: 51 ]]
    -- upvalues: v19 (copy)
    return v19(v20, v21);
end;
return {
    new = function(v23, v24) --[[ Line: 57 ]] --[[ Name: new ]]
        -- upvalues: v2 (copy), v3 (copy), v22 (copy)
        if v24 == nil then
            v24 = {};
        end;
        local v25 = v2.List.join(v24, {
            v3.thunkMiddleware
        });
        return v3.Store.new(v22, v23 or {}, v25);
    end
};