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
local v13 = require(l_Parent_0.DiscoveryTypes);
local l_FFlagLuaAppEnablePartySurfaceForFetchSearchLandingPage_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnablePartySurfaceForFetchSearchLandingPage;
local l_OmniRecommendationsContentType_0 = v13.OmniRecommendationsContentType;
local v16 = require(l_Parent_0.FetchStatusRodux);
local l_FetchStatusReducer_0 = v16.FetchStatusReducer;
local l_FetchStatusNamespace_0 = v16.FetchStatusNamespace;
local l_SetFetchStatus_0 = v16.SetFetchStatus;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v23 = require(l_Modules_0.LuaApp.Http.Requests.GamesApi.GetSearchLandingPageSuggestion);
local v24 = require(l_Modules_0.LuaApp.Actions.Games.SetOmniAutocompleteSorts);
local function v27(v25, v26) --[[ Line: 32 ]]
    -- upvalues: l_SetFetchStatus_0 (copy), l_FetchStatusNamespace_0 (copy)
    return l_SetFetchStatus_0(l_FetchStatusNamespace_0.SearchLandingPage, v25, v26);
end;
ApiFetchSearchLandingPage = function(v28, v29, v30) --[[ Line: 36 ]] --[[ Name: ApiFetchSearchLandingPage ]]
    -- upvalues: l_FetchStatusReducer_0 (copy), l_FetchStatusNamespace_0 (copy), l_AppPage_0 (copy), l_RetrievalStatus_0 (copy), v3 (copy), v27 (copy), l_FFlagLuaAppEnablePartySurfaceForFetchSearchLandingPage_0 (copy), v23 (copy), l_OmniRecommendationsContentType_0 (copy), l_TopicContentsEntryModel_0 (copy), v2 (copy), l_parseAndAddGameInfos_0 (copy), l_GameInfoModel_0 (copy), l_TopicInfoModel_0 (copy), l_TopicContentsModel_0 (copy), l_AddTopicContents_0 (copy), l_AddTopicInfos_0 (copy), v24 (copy)
    return function(v31) --[[ Line: 37 ]]
        -- upvalues: l_FetchStatusReducer_0 (ref), l_FetchStatusNamespace_0 (ref), l_AppPage_0 (ref), l_RetrievalStatus_0 (ref), v3 (ref), v27 (ref), v29 (copy), l_FFlagLuaAppEnablePartySurfaceForFetchSearchLandingPage_0 (ref), v30 (copy), v23 (ref), v28 (copy), l_OmniRecommendationsContentType_0 (ref), l_TopicContentsEntryModel_0 (ref), v2 (ref), l_parseAndAddGameInfos_0 (ref), l_GameInfoModel_0 (ref), l_TopicInfoModel_0 (ref), l_TopicContentsModel_0 (ref), l_AddTopicContents_0 (ref), l_AddTopicInfos_0 (ref), v24 (ref)
        if v31:getState().Personalization[l_FetchStatusReducer_0.key][l_FetchStatusNamespace_0.OmniRecommendations][l_AppPage_0.SearchLandingPage] == l_RetrievalStatus_0.Fetching then
            return v3.resolve("Data is fetching");
        else
            v31:dispatch(v27(v29, l_RetrievalStatus_0.Fetching));
            local v32 = {
                sessionId = v29
            };
            if l_FFlagLuaAppEnablePartySurfaceForFetchSearchLandingPage_0 and v30 then
                v32.surface = v30;
            end;
            return v23(v28, v32):andThen(function(v33) --[[ Line: 51 ]]
                -- upvalues: v3 (ref), l_OmniRecommendationsContentType_0 (ref), l_TopicContentsEntryModel_0 (ref), v2 (ref), l_parseAndAddGameInfos_0 (ref), v28 (ref), v31 (copy), l_GameInfoModel_0 (ref), l_TopicInfoModel_0 (ref), l_TopicContentsModel_0 (ref), l_AddTopicContents_0 (ref), l_AddTopicInfos_0 (ref), v24 (ref), v27 (ref), v29 (ref), l_RetrievalStatus_0 (ref)
                local l_responseBody_0 = v33.responseBody;
                if not l_responseBody_0.sorts then
                    return v3.reject("No sorts found");
                else
                    local v35 = {};
                    local v36 = {};
                    for _, v38 in pairs(l_responseBody_0.sorts) do
                        if v38.contentType == l_OmniRecommendationsContentType_0.Game then
                            local v39 = {};
                            if v38.games == nil then
                                warn((("Sort with %* contentType found with no games table! %*"):format(v38.contentType, v38.sortDisplayName)));
                            elseif #v38.games == 0 then
                                warn((("Found no games in this sort: %*"):format(v38.sortDisplayName)));
                            else
                                local function v45(v40, v41) --[[ Line: 76 ]] --[[ Name: forEachGameInfo ]]
                                    -- upvalues: l_TopicContentsEntryModel_0 (ref), v2 (ref), v39 (copy)
                                    l_TopicContentsEntryModel_0.fromOmniAutocompleteApi(v40):match(function(v42) --[[ Line: 80 ]]
                                        -- upvalues: v2 (ref), v41 (copy), v39 (ref)
                                        local v43 = v2.Dictionary.join(v41, v42);
                                        table.insert(v39, v43);
                                    end):matchError(function(v44) --[[ Line: 84 ]]
                                        warn(v44);
                                    end);
                                end;
                                l_parseAndAddGameInfos_0(v28, v31, v38.games, l_GameInfoModel_0.fromOmniAutocompleteApi, v45);
                                local v46 = {
                                    entries = v39, 
                                    hasMoreRows = false, 
                                    nextPageToken = "", 
                                    nextPageExclusiveStartId = 0, 
                                    rowsRequested = 1, 
                                    updatedTimestamp = tick()
                                };
                                local v47 = l_TopicInfoModel_0.fromOmniAutocompleteApi(v38);
                                local v48 = l_TopicContentsModel_0.fromData(v46);
                                v31:dispatch(l_AddTopicContents_0(v38.sortId, v48, false));
                                table.insert(v36, v38);
                                table.insert(v35, v47);
                            end;
                        elseif v38.contentType == l_OmniRecommendationsContentType_0.TrendingSearches then
                            local v49 = l_TopicInfoModel_0.fromOmniAutocompleteApi(v38);
                            local v50 = {
                                entries = v38.queries, 
                                hasMoreRows = false, 
                                nextPageToken = "", 
                                nextPageExclusiveStartId = 0, 
                                rowsRequested = 1, 
                                updatedTimestamp = tick()
                            };
                            local v51 = l_TopicContentsModel_0.fromData(v50);
                            v31:dispatch(l_AddTopicContents_0(v38.sortId, v51, false));
                            table.insert(v36, v38);
                            table.insert(v35, v49);
                        end;
                    end;
                    v31:dispatch(l_AddTopicInfos_0(v35));
                    v31:dispatch(v24(v36));
                    v31:dispatch(v27(v29, l_RetrievalStatus_0.Done));
                    return v3.resolve(v33);
                end;
            end):catch(function(v52) --[[ Line: 135 ]]
                -- upvalues: v31 (copy), v27 (ref), v29 (ref), l_RetrievalStatus_0 (ref), v3 (ref)
                v31:dispatch(v27(v29, l_RetrievalStatus_0.Failed));
                warn(v52);
                return v3.reject(v52);
            end);
        end;
    end;
end;
return ApiFetchSearchLandingPage;