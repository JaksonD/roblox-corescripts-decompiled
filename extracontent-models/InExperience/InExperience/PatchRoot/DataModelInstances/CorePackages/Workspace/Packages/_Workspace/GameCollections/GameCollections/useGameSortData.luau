local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local v2 = require(l_Parent_0.tutils);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local v6 = require(l_Parent_0.TopicInfosRodux);
local l_TopicInfosReducer_0 = v6.TopicInfosReducer;
local l_TopicInfoModel_0 = v6.TopicInfoModel;
local l_GameSortGroups_0 = require(l_Parent_0.DiscoveryTypes).GameSortGroups;
local v10 = require(l_Parent_0.FetchStatusRodux);
local l_FetchStatusReducer_0 = v10.FetchStatusReducer;
local l_FetchStatusNamespace_0 = v10.FetchStatusNamespace;
local l_TopicContentsReducer_0 = require(l_Parent_0.TopicContentsRodux).TopicContentsReducer;
local v14 = require(l_Parent_0.LoggingProtocol);
local l_reportWarning_0 = require(l_Parent_0.DiscoveryAnalytics).Points.reportWarning;
local l_getTopSearchResultsFetchName_0 = require(l_Parent_0.DiscoveryUtils).getTopSearchResultsFetchName;
local l_FFlagLuaAppSearchGridTiles_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSearchGridTiles;
local v22 = l_memoize_0(function(v18) --[[ Line: 39 ]]
    local v19 = {};
    if v18 and v18.sorts then
        for v20, v21 in ipairs(v18.sorts) do
            if v21.topicId then
                v19[tostring(v21.topicId)] = v20;
            end;
        end;
    end;
    return v19;
end);
return function(v23, v24, v25) --[[ Line: 54 ]] --[[ Name: useGameSortData ]]
    -- upvalues: l_useSelector_0 (copy), l_TopicInfosReducer_0 (copy), l_AppPage_0 (copy), v22 (copy), l_GameSortGroups_0 (copy), l_FFlagLuaAppSearchGridTiles_0 (copy), l_TopicContentsReducer_0 (copy), l_TopicInfoModel_0 (copy), l_RetrievalStatus_0 (copy), l_getTopSearchResultsFetchName_0 (copy), l_reportWarning_0 (copy), v14 (copy), l_FetchStatusNamespace_0 (copy), l_FetchStatusReducer_0 (copy), v2 (copy)
    return l_useSelector_0(function(v26) --[[ Line: 55 ]]
        -- upvalues: l_TopicInfosReducer_0 (ref), v23 (copy), v24 (copy), l_AppPage_0 (ref), v22 (ref), l_GameSortGroups_0 (ref), l_FFlagLuaAppSearchGridTiles_0 (ref), v25 (copy), l_TopicContentsReducer_0 (ref), l_TopicInfoModel_0 (ref), l_RetrievalStatus_0 (ref), l_getTopSearchResultsFetchName_0 (ref), l_reportWarning_0 (ref), v14 (ref), l_FetchStatusNamespace_0 (ref), l_FetchStatusReducer_0 (ref)
        local v27 = false;
        local v28 = false;
        local v29 = nil;
        local v30 = nil;
        local v31 = v26.Personalization[l_TopicInfosReducer_0.key][v23];
        if v31 ~= nil then
            if v31:isOmni() then
                if v24 == l_AppPage_0.Home then
                    local v32 = v26.OmniRecommendations[v24];
                    local v33 = v22(v32)[v23];
                    if v33 then
                        v27 = true;
                        v28 = true;
                        v29 = v33;
                    end;
                end;
            else
                v27 = true;
                local v34 = nil;
                if v24 == l_AppPage_0.Games then
                    v34 = l_GameSortGroups_0.Games;
                elseif v24 == l_AppPage_0.Home then
                    v34 = l_GameSortGroups_0.HomeGames;
                end;
                v30 = if v34 then v26.GameSortGroups[v34].pageId else nil;
            end;
        end;
        local v35 = nil;
        local v36 = nil;
        local v37 = nil;
        if l_FFlagLuaAppSearchGridTiles_0 and v24 == l_AppPage_0.SearchPage then
            if v25 then
                v35 = v26.Personalization[l_TopicContentsReducer_0.key][v25];
                local v38 = l_TopicInfoModel_0.makeSearchTopicKey(v25, v23);
                v36 = v26.Personalization[l_TopicInfosReducer_0.key][v38];
                v27 = true;
                local v39 = v26.RequestsStatus.SearchesInGamesStatus[v25];
                if v39 == "Removed" then
                    v39 = l_RetrievalStatus_0.NotStarted;
                end;
                local v40 = v26.FetchingStatus[l_getTopSearchResultsFetchName_0("blended", v25)];
                v37 = v39 or v40;
            else
                l_reportWarning_0(v14.default, "useGameSortData_MissingSearchUuid", "searchUuid is nil when pageContext is SearchPage");
                v27 = false;
            end;
        else
            v35 = v26.Personalization[l_TopicContentsReducer_0.key][v23];
            v36 = v26.Personalization[l_TopicInfosReducer_0.key][v23];
            local v41 = nil;
            local v42 = nil;
            if v28 then
                v41 = l_FetchStatusNamespace_0.OmniRecommendations;
                v42 = v24;
            else
                v41 = l_FetchStatusNamespace_0.GameSorts;
                v42 = v23;
            end;
            v37 = v26.Personalization[l_FetchStatusReducer_0.key][v41][v42];
        end;
        return {
            sortIndex = v29, 
            isOmni = v28, 
            gameSortDataFound = v27, 
            gamesApiSortPageId = v30, 
            sort = v36, 
            gameSortContents = v35, 
            gameSortFetchingStatus = v37 or l_RetrievalStatus_0.NotStarted
        };
    end, v2.shallowEqual);
end;