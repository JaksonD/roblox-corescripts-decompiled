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
local function v42(v36) --[[ Line: 44 ]]
    -- upvalues: l_OmniFeedTypes_0 (copy), l_SduiLogger_0 (copy), l_SduiErrors_0 (copy), l_AppPage_0 (copy)
    local v37 = {};
    if v36 and v36.sorts then
        for v38, v39 in v36.sorts do
            local v40 = v39.treatmentType == l_OmniFeedTypes_0.ServerDrivenUi;
            local v41 = false;
            if v39.feedItemKey ~= nil then
                v41 = v39.feedItemKey ~= "";
            end;
            if v40 and v41 then
                table.insert(v37, {
                    feedItemKey = v39.feedItemKey, 
                    topicId = v39.topicId, 
                    sortIndex = v38
                });
            elseif v40 then
                l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.NilFeedItemKeyForSduiSort, {
                    name = ("%*"):format(v39.topicId), 
                    message = ("Sdui treatmentType but no feedItemKey for topicId %* at index %*"):format(v39.topicId, v38)
                }, l_AppPage_0.SearchPage);
            elseif v41 then
                l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.InvalidTreatmentTypeWithFeedItemKey, {
                    name = ("%*"):format(v39.topicId), 
                    message = ("Has sdui feedItemKey %* but treatmentType %* for topicId %* at index %*"):format(v39.feedItemKey, v39.treatmentType, v39.topicId, v38)
                }, l_AppPage_0.SearchPage);
            end;
        end;
    end;
    return v37;
end;
return function(v43, v44) --[[ Line: 88 ]] --[[ Name: ApiFetchTopSearchResults ]]
    -- upvalues: l_PerformFetch_0 (copy), l_getTopSearchResultsFetchName_0 (copy), l_SearchGetOmniSearch_0 (copy), v1 (copy), l_mutedError_0 (copy), v10 (copy), l_OmniFeedConstants_0 (copy), v28 (copy), v29 (copy), l_GameSearchEntry_0 (copy), l_parseAndAddGameInfos_0 (copy), l_GameInfoModel_0 (copy), l_SearchInGames_0 (copy), l_SetSearchInGames_0 (copy), l_AddTopicContents_0 (copy), l_TopicContentsModel_0 (copy), l_BigGameIconReducer_0 (copy), l_ApiFetchBigGameIcons_0 (copy), l_getFormattedTextSearchEntry_0 (copy), l_AddTextSearchResults_0 (copy), l_mapContentTypeToTreatmentType_0 (copy), l_TopicInfoModel_0 (copy), v3 (copy), l_AddTopicInfos_0 (copy), v30 (copy), v42 (copy), l_AddSduiRootConfig_0 (copy), l_AppPage_0 (copy), l_SduiLogger_0 (copy), l_SduiErrors_0 (copy)
    local l_searchUuid_0 = v44.searchUuid;
    return l_PerformFetch_0.Single(l_getTopSearchResultsFetchName_0(v44.searchVertical, l_searchUuid_0), function(v46) --[[ Line: 90 ]]
        -- upvalues: l_SearchGetOmniSearch_0 (ref), v43 (copy), v44 (copy), l_searchUuid_0 (copy), v1 (ref), l_mutedError_0 (ref), v10 (ref), l_OmniFeedConstants_0 (ref), v28 (ref), v29 (ref), l_GameSearchEntry_0 (ref), l_parseAndAddGameInfos_0 (ref), l_GameInfoModel_0 (ref), l_SearchInGames_0 (ref), l_SetSearchInGames_0 (ref), l_AddTopicContents_0 (ref), l_TopicContentsModel_0 (ref), l_BigGameIconReducer_0 (ref), l_ApiFetchBigGameIcons_0 (ref), l_getFormattedTextSearchEntry_0 (ref), l_AddTextSearchResults_0 (ref), l_mapContentTypeToTreatmentType_0 (ref), l_TopicInfoModel_0 (ref), v3 (ref), l_AddTopicInfos_0 (ref), v30 (ref), v42 (ref), l_AddSduiRootConfig_0 (ref), l_AppPage_0 (ref), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref)
        return l_SearchGetOmniSearch_0(v43, {
            searchQuery = v44.keyword, 
            sessionId = l_searchUuid_0, 
            globalSessionId = v44.omniSearchUuid, 
            verticalType = v44.searchVertical
        }):andThen(function(v47) --[[ Line: 98 ]]
            -- upvalues: v1 (ref), l_mutedError_0 (ref), v10 (ref), l_OmniFeedConstants_0 (ref), v28 (ref), v46 (copy), v29 (ref), l_searchUuid_0 (ref), v44 (ref), l_GameSearchEntry_0 (ref), l_parseAndAddGameInfos_0 (ref), v43 (ref), l_GameInfoModel_0 (ref), l_SearchInGames_0 (ref), l_SetSearchInGames_0 (ref), l_AddTopicContents_0 (ref), l_TopicContentsModel_0 (ref), l_BigGameIconReducer_0 (ref), l_ApiFetchBigGameIcons_0 (ref), l_getFormattedTextSearchEntry_0 (ref), l_AddTextSearchResults_0 (ref), l_mapContentTypeToTreatmentType_0 (ref), l_TopicInfoModel_0 (ref), v3 (ref), l_AddTopicInfos_0 (ref), v30 (ref), v42 (ref), l_AddSduiRootConfig_0 (ref), l_AppPage_0 (ref), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref)
            if not v47 or not v47.responseBody then
                return v1.reject("No response body");
            else
                local l_responseBody_0 = v47.responseBody;
                local v49 = {};
                local v50 = {};
                local v51 = l_responseBody_0.searchResults or {};
                for _, v53 in v51 do
                    local l_contentGroupType_0 = v53.contentGroupType;
                    local l_topicId_0 = v53.topicId;
                    if l_contentGroupType_0 == nil or v49[l_contentGroupType_0] then
                        l_mutedError_0((("Duplicate content group type received in ApiFetchTopSearchResults: %*. Search results may be wonky."):format(l_contentGroupType_0)));
                    end;
                    v49[l_contentGroupType_0] = true;
                    v10.assert(not v50[l_topicId_0], (("Already have contentGroupType for topicId %*! Overwriting existing \"%*\" with \"%*\""):format(l_topicId_0, v50[l_topicId_0], l_contentGroupType_0)));
                    v50[l_topicId_0] = l_contentGroupType_0;
                    if l_contentGroupType_0 == l_OmniFeedConstants_0.ContentGroupType.User then
                        local v56 = v28(v53.contents);
                        v46:dispatch(v29({
                            searchUuid = l_searchUuid_0, 
                            keyword = v44.keyword, 
                            entries = v56
                        }));
                    elseif l_contentGroupType_0 == l_OmniFeedConstants_0.ContentGroupType.Game then
                        local v57 = {};
                        local v58 = nil;
                        do
                            local l_v58_0 = v58;
                            local function v64(v60, v61) --[[ Line: 141 ]]
                                -- upvalues: l_topicId_0 (copy), v57 (copy), l_v58_0 (ref), l_GameSearchEntry_0 (ref)
                                if not v60.placeId then
                                    v60.placeId = v60.rootPlaceId;
                                end;
                                if not v60.topicId then
                                    v60.topicId = l_topicId_0;
                                end;
                                if v60.emphasis and #v57 == 0 then
                                    l_v58_0 = v61.universeId;
                                end;
                                l_GameSearchEntry_0.fromJsonData(v60, true):match(function(v62) --[[ Line: 153 ]]
                                    -- upvalues: v57 (ref)
                                    table.insert(v57, v62);
                                end):matchError(function(v63) --[[ Line: 156 ]]
                                    warn(v63);
                                end);
                            end;
                            l_parseAndAddGameInfos_0(v43, v46, v53.contents, l_GameInfoModel_0.fromSearchApi, v64);
                            local v65 = l_SearchInGames_0.fromOmniSearch(v44.keyword, v57, l_v58_0 ~= nil, nil);
                            v46:dispatch(l_SetSearchInGames_0(l_searchUuid_0, v65));
                            v46:dispatch(l_AddTopicContents_0(v44.searchUuid, l_TopicContentsModel_0.fromData(v65), false));
                            local v66 = v46:getState()[l_BigGameIconReducer_0.key];
                            if l_v58_0 and v66[l_v58_0] == nil then
                                v46:dispatch(l_ApiFetchBigGameIcons_0(v43, {
                                    l_v58_0
                                }));
                            end;
                        end;
                    elseif l_contentGroupType_0 == l_OmniFeedConstants_0.ContentGroupType.Text then
                        local v67 = l_getFormattedTextSearchEntry_0(v53.contents);
                        if v67 then
                            v46:dispatch(l_AddTextSearchResults_0({
                                searchUuid = v44.searchUuid, 
                                topicId = l_topicId_0, 
                                entry = v67
                            }));
                        end;
                    end;
                end;
                local v68 = l_responseBody_0.sorts or {};
                local v69 = {};
                for _, v71 in v68 do
                    if not v71.treatmentType then
                        local v72 = v50[v71.topicId];
                        v71.treatmentType = l_mapContentTypeToTreatmentType_0(v72);
                    end;
                    local v73 = l_TopicInfoModel_0.fromTopSearchApi(v71, l_searchUuid_0);
                    v73.topicLayoutData = v3.Dictionary.join(v73.topicLayoutData, {
                        showHeader = v73.topicLayoutData.showHeader == nil or v73.topicLayoutData.showHeader
                    });
                    table.insert(v69, v73);
                end;
                v46:dispatch(l_AddTopicInfos_0(v69));
                v46:dispatch(v30(l_searchUuid_0, v69));
                if l_responseBody_0.sdui then
                    v68 = nil;
                    v68 = v42(l_responseBody_0);
                    do
                        local l_v68_0 = v68;
                        local v75;
                        v69, v75 = pcall(function() --[[ Line: 225 ]]
                            -- upvalues: v46 (ref), l_AddSduiRootConfig_0 (ref), l_AppPage_0 (ref), l_responseBody_0 (copy), l_v68_0 (ref), l_searchUuid_0 (ref)
                            v46:dispatch(l_AddSduiRootConfig_0(l_AppPage_0.SearchPage, l_responseBody_0.sdui, tick(), l_v68_0, (("%*_%*"):format(l_AppPage_0.SearchPage, l_searchUuid_0))));
                        end);
                        if not v69 then
                            local v76 = "";
                            if l_v68_0 and #l_v68_0 > 0 then
                                for _, v78 in l_v68_0 do
                                    v76 = ("%* %*"):format(v76, v78.topicId);
                                end;
                            end;
                            l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.ErrorStoringTopSearchData, {
                                name = "search-api/omni-search", 
                                message = ("Error storing top search response: %* topicIds: %*"):format(v75, v76)
                            }, l_AppPage_0.SearchPage);
                        end;
                    end;
                end;
                return v1.resolve();
            end;
        end, function(v79) --[[ Line: 251 ]]
            -- upvalues: v1 (ref)
            warn((("Promise rejection for ApiFetchTopSearchResults: %*"):format(v79)));
            return v1.reject();
        end);
    end);
end;