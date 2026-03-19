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
local v21 = l_memoize_0(function(v17) --[[ Line: 37 ]]
    local v18 = {};
    if v17 and v17.sorts then
        for v19, v20 in ipairs(v17.sorts) do
            if v20.topicId then
                v18[tostring(v20.topicId)] = v19;
            end;
        end;
    end;
    return v18;
end);
return function(v22, v23, v24) --[[ Line: 52 ]] --[[ Name: useGameSortData ]]
    -- upvalues: l_useSelector_0 (copy), l_TopicInfosReducer_0 (copy), l_AppPage_0 (copy), v21 (copy), l_GameSortGroups_0 (copy), l_TopicContentsReducer_0 (copy), l_TopicInfoModel_0 (copy), l_RetrievalStatus_0 (copy), l_getTopSearchResultsFetchName_0 (copy), l_reportWarning_0 (copy), v14 (copy), l_FetchStatusNamespace_0 (copy), l_FetchStatusReducer_0 (copy), v2 (copy)
    return l_useSelector_0(function(v25) --[[ Line: 53 ]]
        -- upvalues: l_TopicInfosReducer_0 (ref), v22 (copy), v23 (copy), l_AppPage_0 (ref), v21 (ref), l_GameSortGroups_0 (ref), v24 (copy), l_TopicContentsReducer_0 (ref), l_TopicInfoModel_0 (ref), l_RetrievalStatus_0 (ref), l_getTopSearchResultsFetchName_0 (ref), l_reportWarning_0 (ref), v14 (ref), l_FetchStatusNamespace_0 (ref), l_FetchStatusReducer_0 (ref)
        local v26 = false;
        local v27 = false;
        local v28 = nil;
        local v29 = nil;
        local v30 = v25.Personalization[l_TopicInfosReducer_0.key][v22];
        if v30 ~= nil then
            if v30:isOmni() then
                if v23 == l_AppPage_0.Home then
                    local v31 = v25.OmniRecommendations[v23];
                    local v32 = v21(v31)[v22];
                    if v32 then
                        v26 = true;
                        v27 = true;
                        v28 = v32;
                    end;
                end;
            else
                v26 = true;
                local v33 = nil;
                if v23 == l_AppPage_0.Games then
                    v33 = l_GameSortGroups_0.Games;
                elseif v23 == l_AppPage_0.Home then
                    v33 = l_GameSortGroups_0.HomeGames;
                end;
                v29 = if v33 then v25.GameSortGroups[v33].pageId else nil;
            end;
        end;
        local v34 = nil;
        local v35 = nil;
        local v36 = nil;
        if v23 == l_AppPage_0.SearchPage then
            if v24 then
                v34 = v25.Personalization[l_TopicContentsReducer_0.key][v24];
                local v37 = l_TopicInfoModel_0.makeSearchTopicKey(v24, v22);
                v35 = v25.Personalization[l_TopicInfosReducer_0.key][v37];
                v26 = true;
                local v38 = v25.RequestsStatus.SearchesInGamesStatus[v24];
                if v38 == "Removed" then
                    v38 = l_RetrievalStatus_0.NotStarted;
                end;
                local v39 = v25.FetchingStatus[l_getTopSearchResultsFetchName_0("blended", v24)];
                v36 = v38 or v39;
            else
                l_reportWarning_0(v14.default, "useGameSortData_MissingSearchUuid", "searchUuid is nil when pageContext is SearchPage");
                v26 = false;
            end;
        else
            v34 = v25.Personalization[l_TopicContentsReducer_0.key][v22];
            v35 = v25.Personalization[l_TopicInfosReducer_0.key][v22];
            local v40 = nil;
            local v41 = nil;
            if v27 then
                v40 = l_FetchStatusNamespace_0.OmniRecommendations;
                v41 = v23;
            else
                v40 = l_FetchStatusNamespace_0.GameSorts;
                v41 = v22;
            end;
            v36 = v25.Personalization[l_FetchStatusReducer_0.key][v40][v41];
        end;
        return {
            sortIndex = v28, 
            isOmni = v27, 
            gameSortDataFound = v26, 
            gamesApiSortPageId = v29, 
            sort = v35, 
            gameSortContents = v34, 
            gameSortFetchingStatus = v36 or l_RetrievalStatus_0.NotStarted
        };
    end, v2.shallowEqual);
end;