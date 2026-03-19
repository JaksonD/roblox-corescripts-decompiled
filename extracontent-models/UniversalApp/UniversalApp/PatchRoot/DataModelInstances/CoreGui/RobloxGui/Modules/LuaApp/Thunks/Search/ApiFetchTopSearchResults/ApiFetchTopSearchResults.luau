local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Workspace.Packages.TopicInfosRodux);
local l_TopicInfoModel_0 = v4.TopicInfoModel;
local l_AddTopicInfos_0 = v4.AddTopicInfos;
local l_OmniFeedConstants_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).OmniFeedConstants;
local l_parseAndAddGameInfos_0 = require(l_CorePackages_0.Workspace.Packages.GameInfosRodux).parseAndAddGameInfos;
local l_GameInfoModel_0 = require(l_CorePackages_0.Workspace.Packages.GameModels).GameInfoModel;
local v10 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local v12 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux);
local l_BigGameIconReducer_0 = v12.BigGameIcons.BigGameIconReducer;
local l_ApiFetchBigGameIcons_0 = v12.BigGameIcons.ApiFetchBigGameIcons;
local l_getTopSearchResultsFetchName_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryUtils).getTopSearchResultsFetchName;
local v16 = require(l_CorePackages_0.Workspace.Packages.TopicContentsRodux);
local l_AddTopicContents_0 = v16.AddTopicContents;
local l_TopicContentsModel_0 = v16.TopicContentsModel;
local l_Modules_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_SearchGetOmniSearch_0 = l_Modules_0.LuaApp.Http.Requests.SearchGetOmniSearch;
local l_SetSearchInGames_0 = l_Modules_0.LuaApp.Actions.SetSearchInGames;
local l_GameSearchEntry_0 = l_Modules_0.LuaApp.Models.GamesApi.GameSearchEntry;
local l_SearchInGames_0 = l_Modules_0.LuaApp.Models.SearchInGames;
local l_mapContentTypeToTreatmentType_0 = l_Modules_0.Personalization.Search.mapContentTypeToTreatmentType;
local l_AddTextSearchResults_0 = l_Modules_0.LuaApp.Actions.AddTextSearchResults;
local l_getFormattedTextSearchEntry_0 = l_Modules_0.LuaApp.Models.DiscoveryApi.getFormattedTextSearchEntry;
local l_Modules_1 = game:GetService("CoreGui").RobloxGui.Modules;
local v28 = require(l_Modules_1.LuaApp.Components.UserSearch.Models.getFormattedUserSearchEntries);
local v29 = require(l_Modules_1.LuaApp.Components.UserSearch.Actions.AddUsersSearchResults);
local v30 = require(l_Modules_1.Personalization.OmniFeed.DataStore.AddSearchResultsOmniFeedSorts);
local l_AddSduiRootConfig_0 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi).AddSduiRootConfig;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_OmniFeedTypes_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).OmniFeedTypes;
local l_SduiErrors_0 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi).SduiErrors;
local l_SduiLogger_0 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi).SduiLogger;
local l_FFlagLuaAppSearchGridTiles_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppSearchGridTiles;
local function v43(v37) --[[ Line: 47 ]]
    -- upvalues: l_OmniFeedTypes_0 (copy), l_SduiLogger_0 (copy), l_SduiErrors_0 (copy), l_AppPage_0 (copy)
    local v38 = {};
    if v37 and v37.sorts then
        for v39, v40 in v37.sorts do
            local v41 = v40.treatmentType == l_OmniFeedTypes_0.ServerDrivenUi;
            local v42 = false;
            if v40.feedItemKey ~= nil then
                v42 = v40.feedItemKey ~= "";
            end;
            if v41 and v42 then
                table.insert(v38, {
                    feedItemKey = v40.feedItemKey, 
                    topicId = v40.topicId, 
                    sortIndex = v39
                });
            elseif v41 then
                l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.NilFeedItemKeyForSduiSort, {
                    name = ("%*"):format(v40.topicId), 
                    message = ("Sdui treatmentType but no feedItemKey for topicId %* at index %*"):format(v40.topicId, v39)
                }, l_AppPage_0.SearchPage);
            elseif v42 then
                l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.InvalidTreatmentTypeWithFeedItemKey, {
                    name = ("%*"):format(v40.topicId), 
                    message = ("Has sdui feedItemKey %* but treatmentType %* for topicId %* at index %*"):format(v40.feedItemKey, v40.treatmentType, v40.topicId, v39)
                }, l_AppPage_0.SearchPage);
            end;
        end;
    end;
    return v38;
end;
return function(v44, v45) --[[ Line: 91 ]] --[[ Name: ApiFetchTopSearchResults ]]
    -- upvalues: l_PerformFetch_0 (copy), l_getTopSearchResultsFetchName_0 (copy), l_SearchGetOmniSearch_0 (copy), v1 (copy), l_mutedError_0 (copy), v10 (copy), l_OmniFeedConstants_0 (copy), v28 (copy), v29 (copy), l_GameSearchEntry_0 (copy), l_parseAndAddGameInfos_0 (copy), l_GameInfoModel_0 (copy), l_SearchInGames_0 (copy), l_SetSearchInGames_0 (copy), l_FFlagLuaAppSearchGridTiles_0 (copy), l_AddTopicContents_0 (copy), l_TopicContentsModel_0 (copy), l_BigGameIconReducer_0 (copy), l_ApiFetchBigGameIcons_0 (copy), l_getFormattedTextSearchEntry_0 (copy), l_AddTextSearchResults_0 (copy), l_mapContentTypeToTreatmentType_0 (copy), l_TopicInfoModel_0 (copy), v3 (copy), l_AddTopicInfos_0 (copy), v30 (copy), v43 (copy), l_AddSduiRootConfig_0 (copy), l_AppPage_0 (copy), l_SduiLogger_0 (copy), l_SduiErrors_0 (copy)
    local l_searchUuid_0 = v45.searchUuid;
    return l_PerformFetch_0.Single(l_getTopSearchResultsFetchName_0(v45.searchVertical, l_searchUuid_0), function(v47) --[[ Line: 93 ]]
        -- upvalues: l_SearchGetOmniSearch_0 (ref), v44 (copy), v45 (copy), l_searchUuid_0 (copy), v1 (ref), l_mutedError_0 (ref), v10 (ref), l_OmniFeedConstants_0 (ref), v28 (ref), v29 (ref), l_GameSearchEntry_0 (ref), l_parseAndAddGameInfos_0 (ref), l_GameInfoModel_0 (ref), l_SearchInGames_0 (ref), l_SetSearchInGames_0 (ref), l_FFlagLuaAppSearchGridTiles_0 (ref), l_AddTopicContents_0 (ref), l_TopicContentsModel_0 (ref), l_BigGameIconReducer_0 (ref), l_ApiFetchBigGameIcons_0 (ref), l_getFormattedTextSearchEntry_0 (ref), l_AddTextSearchResults_0 (ref), l_mapContentTypeToTreatmentType_0 (ref), l_TopicInfoModel_0 (ref), v3 (ref), l_AddTopicInfos_0 (ref), v30 (ref), v43 (ref), l_AddSduiRootConfig_0 (ref), l_AppPage_0 (ref), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref)
        return l_SearchGetOmniSearch_0(v44, {
            searchQuery = v45.keyword, 
            sessionId = l_searchUuid_0, 
            globalSessionId = v45.omniSearchUuid, 
            verticalType = v45.searchVertical
        }):andThen(function(v48) --[[ Line: 101 ]]
            -- upvalues: v1 (ref), l_mutedError_0 (ref), v10 (ref), l_OmniFeedConstants_0 (ref), v28 (ref), v47 (copy), v29 (ref), l_searchUuid_0 (ref), v45 (ref), l_GameSearchEntry_0 (ref), l_parseAndAddGameInfos_0 (ref), v44 (ref), l_GameInfoModel_0 (ref), l_SearchInGames_0 (ref), l_SetSearchInGames_0 (ref), l_FFlagLuaAppSearchGridTiles_0 (ref), l_AddTopicContents_0 (ref), l_TopicContentsModel_0 (ref), l_BigGameIconReducer_0 (ref), l_ApiFetchBigGameIcons_0 (ref), l_getFormattedTextSearchEntry_0 (ref), l_AddTextSearchResults_0 (ref), l_mapContentTypeToTreatmentType_0 (ref), l_TopicInfoModel_0 (ref), v3 (ref), l_AddTopicInfos_0 (ref), v30 (ref), v43 (ref), l_AddSduiRootConfig_0 (ref), l_AppPage_0 (ref), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref)
            if not v48 or not v48.responseBody then
                return v1.reject("No response body");
            else
                local l_responseBody_0 = v48.responseBody;
                local v50 = {};
                local v51 = {};
                local v52 = l_responseBody_0.searchResults or {};
                for _, v54 in v52 do
                    local l_contentGroupType_0 = v54.contentGroupType;
                    local l_topicId_0 = v54.topicId;
                    if l_contentGroupType_0 == nil or v50[l_contentGroupType_0] then
                        l_mutedError_0((("Duplicate content group type received in ApiFetchTopSearchResults: %*. Search results may be wonky."):format(l_contentGroupType_0)));
                    end;
                    v50[l_contentGroupType_0] = true;
                    v10.assert(not v51[l_topicId_0], (("Already have contentGroupType for topicId %*! Overwriting existing \"%*\" with \"%*\""):format(l_topicId_0, v51[l_topicId_0], l_contentGroupType_0)));
                    v51[l_topicId_0] = l_contentGroupType_0;
                    if l_contentGroupType_0 == l_OmniFeedConstants_0.ContentGroupType.User then
                        local v57 = v28(v54.contents);
                        v47:dispatch(v29({
                            searchUuid = l_searchUuid_0, 
                            keyword = v45.keyword, 
                            entries = v57
                        }));
                    elseif l_contentGroupType_0 == l_OmniFeedConstants_0.ContentGroupType.Game then
                        local v58 = {};
                        local v59 = nil;
                        do
                            local l_v59_0 = v59;
                            local function v65(v61, v62) --[[ Line: 144 ]]
                                -- upvalues: l_topicId_0 (copy), v58 (copy), l_v59_0 (ref), l_GameSearchEntry_0 (ref)
                                if not v61.placeId then
                                    v61.placeId = v61.rootPlaceId;
                                end;
                                if not v61.topicId then
                                    v61.topicId = l_topicId_0;
                                end;
                                if v61.emphasis and #v58 == 0 then
                                    l_v59_0 = v62.universeId;
                                end;
                                l_GameSearchEntry_0.fromJsonData(v61, true):match(function(v63) --[[ Line: 156 ]]
                                    -- upvalues: v58 (ref)
                                    table.insert(v58, v63);
                                end):matchError(function(v64) --[[ Line: 159 ]]
                                    warn(v64);
                                end);
                            end;
                            l_parseAndAddGameInfos_0(v44, v47, v54.contents, l_GameInfoModel_0.fromSearchApi, v65);
                            local v66 = l_SearchInGames_0.fromOmniSearch(v45.keyword, v58, l_v59_0 ~= nil, nil);
                            v47:dispatch(l_SetSearchInGames_0(l_searchUuid_0, v66));
                            if l_FFlagLuaAppSearchGridTiles_0 then
                                v47:dispatch(l_AddTopicContents_0(v45.searchUuid, l_TopicContentsModel_0.fromData(v66), false));
                            end;
                            local v67 = v47:getState()[l_BigGameIconReducer_0.key];
                            if l_v59_0 and v67[l_v59_0] == nil then
                                v47:dispatch(l_ApiFetchBigGameIcons_0(v44, {
                                    l_v59_0
                                }));
                            end;
                        end;
                    elseif l_contentGroupType_0 == l_OmniFeedConstants_0.ContentGroupType.Text then
                        local v68 = l_getFormattedTextSearchEntry_0(v54.contents);
                        if v68 then
                            v47:dispatch(l_AddTextSearchResults_0({
                                searchUuid = v45.searchUuid, 
                                topicId = l_topicId_0, 
                                entry = v68
                            }));
                        end;
                    end;
                end;
                local v69 = l_responseBody_0.sorts or {};
                local v70 = {};
                for _, v72 in v69 do
                    if not v72.treatmentType then
                        local v73 = v51[v72.topicId];
                        v72.treatmentType = l_mapContentTypeToTreatmentType_0(v73);
                    end;
                    local v74 = l_TopicInfoModel_0.fromTopSearchApi(v72, l_searchUuid_0);
                    v74.topicLayoutData = v3.Dictionary.join(v74.topicLayoutData, {
                        showHeader = v74.topicLayoutData.showHeader == nil or v74.topicLayoutData.showHeader
                    });
                    table.insert(v70, v74);
                end;
                if l_FFlagLuaAppSearchGridTiles_0 then
                    v47:dispatch(l_AddTopicInfos_0(v70));
                end;
                v47:dispatch(v30(l_searchUuid_0, v70));
                if l_responseBody_0.sdui then
                    v69 = nil;
                    v69 = v43(l_responseBody_0);
                    do
                        local l_v69_0 = v69;
                        local v76;
                        v70, v76 = pcall(function() --[[ Line: 232 ]]
                            -- upvalues: v47 (ref), l_AddSduiRootConfig_0 (ref), l_AppPage_0 (ref), l_responseBody_0 (copy), l_v69_0 (ref), l_searchUuid_0 (ref)
                            v47:dispatch(l_AddSduiRootConfig_0(l_AppPage_0.SearchPage, l_responseBody_0.sdui, tick(), l_v69_0, (("%*_%*"):format(l_AppPage_0.SearchPage, l_searchUuid_0))));
                        end);
                        if not v70 then
                            local v77 = "";
                            if l_v69_0 and #l_v69_0 > 0 then
                                for _, v79 in l_v69_0 do
                                    v77 = ("%* %*"):format(v77, v79.topicId);
                                end;
                            end;
                            l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.ErrorStoringTopSearchData, {
                                name = "search-api/omni-search", 
                                message = ("Error storing top search response: %* topicIds: %*"):format(v76, v77)
                            }, l_AppPage_0.SearchPage);
                        end;
                    end;
                end;
                return v1.resolve();
            end;
        end, function(v80) --[[ Line: 258 ]]
            -- upvalues: v1 (ref)
            warn((("Promise rejection for ApiFetchTopSearchResults: %*"):format(v80)));
            return v1.reject();
        end);
    end);
end;