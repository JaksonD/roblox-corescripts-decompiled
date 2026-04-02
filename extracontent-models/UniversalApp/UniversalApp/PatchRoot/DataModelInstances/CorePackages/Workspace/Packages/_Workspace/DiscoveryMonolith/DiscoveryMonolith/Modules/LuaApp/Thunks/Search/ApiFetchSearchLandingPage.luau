local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_Parent_0.TopicInfosRodux);
local l_parseAndAddGameInfos_0 = require(l_Parent_0.GameInfosRodux).parseAndAddGameInfos;
local l_AddTopicInfos_0 = v4.AddTopicInfos;
local v7 = require(l_Parent_0.TopicContentsRodux);
local l_TopicContentsEntryModel_0 = v7.TopicContentsEntryModel;
local l_TopicContentsModel_0 = v7.TopicContentsModel;
local l_AddTopicContents_0 = v7.AddTopicContents;
local l_GameInfoModel_0 = require(l_Parent_0.GameModels).GameInfoModel;
local l_TopicInfoModel_0 = v4.TopicInfoModel;
local l_OmniRecommendationsContentType_0 = require(l_Parent_0.DiscoveryTypes).OmniRecommendationsContentType;
local v14 = require(l_Parent_0.FetchStatusRodux);
local l_FetchStatusReducer_0 = v14.FetchStatusReducer;
local l_FetchStatusNamespace_0 = v14.FetchStatusNamespace;
local l_SetFetchStatus_0 = v14.SetFetchStatus;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v21 = require(l_Modules_0.LuaApp.Http.Requests.GamesApi.GetSearchLandingPageSuggestion);
local v22 = require(l_Modules_0.LuaApp.Actions.Games.SetOmniAutocompleteSorts);
local function v25(v23, v24) --[[ Line: 30 ]]
    -- upvalues: l_SetFetchStatus_0 (copy), l_FetchStatusNamespace_0 (copy)
    return l_SetFetchStatus_0(l_FetchStatusNamespace_0.SearchLandingPage, v23, v24);
end;
ApiFetchSearchLandingPage = function(v26, v27, v28) --[[ Line: 34 ]] --[[ Name: ApiFetchSearchLandingPage ]]
    -- upvalues: l_FetchStatusReducer_0 (copy), l_FetchStatusNamespace_0 (copy), l_AppPage_0 (copy), l_RetrievalStatus_0 (copy), v3 (copy), v25 (copy), v21 (copy), l_OmniRecommendationsContentType_0 (copy), l_TopicContentsEntryModel_0 (copy), v2 (copy), l_parseAndAddGameInfos_0 (copy), l_GameInfoModel_0 (copy), l_TopicInfoModel_0 (copy), l_TopicContentsModel_0 (copy), l_AddTopicContents_0 (copy), l_AddTopicInfos_0 (copy), v22 (copy)
    return function(v29) --[[ Line: 35 ]]
        -- upvalues: l_FetchStatusReducer_0 (ref), l_FetchStatusNamespace_0 (ref), l_AppPage_0 (ref), l_RetrievalStatus_0 (ref), v3 (ref), v25 (ref), v27 (copy), v28 (copy), v21 (ref), v26 (copy), l_OmniRecommendationsContentType_0 (ref), l_TopicContentsEntryModel_0 (ref), v2 (ref), l_parseAndAddGameInfos_0 (ref), l_GameInfoModel_0 (ref), l_TopicInfoModel_0 (ref), l_TopicContentsModel_0 (ref), l_AddTopicContents_0 (ref), l_AddTopicInfos_0 (ref), v22 (ref)
        if v29:getState().Personalization[l_FetchStatusReducer_0.key][l_FetchStatusNamespace_0.OmniRecommendations][l_AppPage_0.SearchLandingPage] == l_RetrievalStatus_0.Fetching then
            return v3.resolve("Data is fetching");
        else
            v29:dispatch(v25(v27, l_RetrievalStatus_0.Fetching));
            local v30 = {
                sessionId = v27
            };
            if v28 then
                v30.surface = v28;
            end;
            return v21(v26, v30):andThen(function(v31) --[[ Line: 49 ]]
                -- upvalues: v3 (ref), l_OmniRecommendationsContentType_0 (ref), l_TopicContentsEntryModel_0 (ref), v2 (ref), l_parseAndAddGameInfos_0 (ref), v26 (ref), v29 (copy), l_GameInfoModel_0 (ref), l_TopicInfoModel_0 (ref), l_TopicContentsModel_0 (ref), l_AddTopicContents_0 (ref), l_AddTopicInfos_0 (ref), v22 (ref), v25 (ref), v27 (ref), l_RetrievalStatus_0 (ref)
                local l_responseBody_0 = v31.responseBody;
                if not l_responseBody_0.sorts then
                    return v3.reject("No sorts found");
                else
                    local v33 = {};
                    local v34 = {};
                    for _, v36 in pairs(l_responseBody_0.sorts) do
                        if v36.contentType == l_OmniRecommendationsContentType_0.Game then
                            local v37 = {};
                            if v36.games == nil then
                                warn((("Sort with %* contentType found with no games table! %*"):format(v36.contentType, v36.sortDisplayName)));
                            elseif #v36.games == 0 then
                                warn((("Found no games in this sort: %*"):format(v36.sortDisplayName)));
                            else
                                local function v43(v38, v39) --[[ Line: 74 ]] --[[ Name: forEachGameInfo ]]
                                    -- upvalues: l_TopicContentsEntryModel_0 (ref), v2 (ref), v37 (copy)
                                    l_TopicContentsEntryModel_0.fromOmniAutocompleteApi(v38):match(function(v40) --[[ Line: 78 ]]
                                        -- upvalues: v2 (ref), v39 (copy), v37 (ref)
                                        local v41 = v2.Dictionary.join(v39, v40);
                                        table.insert(v37, v41);
                                    end):matchError(function(v42) --[[ Line: 82 ]]
                                        warn(v42);
                                    end);
                                end;
                                l_parseAndAddGameInfos_0(v26, v29, v36.games, l_GameInfoModel_0.fromOmniAutocompleteApi, v43);
                                local v44 = {
                                    entries = v37, 
                                    hasMoreRows = false, 
                                    nextPageToken = "", 
                                    nextPageExclusiveStartId = 0, 
                                    rowsRequested = 1, 
                                    updatedTimestamp = tick()
                                };
                                local v45 = l_TopicInfoModel_0.fromOmniAutocompleteApi(v36);
                                local v46 = l_TopicContentsModel_0.fromData(v44);
                                v29:dispatch(l_AddTopicContents_0(v36.sortId, v46, false));
                                table.insert(v34, v36);
                                table.insert(v33, v45);
                            end;
                        elseif v36.contentType == l_OmniRecommendationsContentType_0.TrendingSearches then
                            local v47 = l_TopicInfoModel_0.fromOmniAutocompleteApi(v36);
                            local v48 = {
                                entries = v36.queries, 
                                hasMoreRows = false, 
                                nextPageToken = "", 
                                nextPageExclusiveStartId = 0, 
                                rowsRequested = 1, 
                                updatedTimestamp = tick()
                            };
                            local v49 = l_TopicContentsModel_0.fromData(v48);
                            v29:dispatch(l_AddTopicContents_0(v36.sortId, v49, false));
                            table.insert(v34, v36);
                            table.insert(v33, v47);
                        end;
                    end;
                    v29:dispatch(l_AddTopicInfos_0(v33));
                    v29:dispatch(v22(v34));
                    v29:dispatch(v25(v27, l_RetrievalStatus_0.Done));
                    return v3.resolve(v31);
                end;
            end):catch(function(v50) --[[ Line: 133 ]]
                -- upvalues: v29 (copy), v25 (ref), v27 (ref), l_RetrievalStatus_0 (ref), v3 (ref)
                v29:dispatch(v25(v27, l_RetrievalStatus_0.Failed));
                warn(v50);
                return v3.reject(v50);
            end);
        end;
    end;
end;
return ApiFetchSearchLandingPage;