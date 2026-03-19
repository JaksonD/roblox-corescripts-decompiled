local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Promise);
local l_GameInfoModel_0 = require(l_Parent_0.GameModels).GameInfoModel;
local v5 = require(l_Parent_0.GameIconRodux);
local l_ApiFetchBigGameIcons_0 = v5.BigGameIcons.ApiFetchBigGameIcons;
local l_BigGameIconReducer_0 = v5.BigGameIcons.BigGameIconReducer;
local l_parseAndAddGameInfos_0 = require(l_Parent_0.GameInfosRodux).parseAndAddGameInfos;
local l_OmniFeedConstants_0 = require(l_Parent_0.DiscoveryTypes).OmniFeedConstants;
local l_reportWarning_0 = require(l_Parent_0.DiscoveryAnalytics).Points.reportWarning;
local v11 = require(l_Parent_0.LoggingProtocol);
local v12 = require(l_Parent_0.TopicInfosRodux);
local l_AddTopicInfos_0 = v12.AddTopicInfos;
local l_TopicInfoModel_0 = v12.TopicInfoModel;
local v15 = require(l_Parent_0.TopicContentsRodux);
local l_AddTopicContents_0 = v15.AddTopicContents;
local l_TopicContentsModel_0 = v15.TopicContentsModel;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v19 = require(l_Modules_0.LuaApp.Actions.SetSearchInGamesStatus);
local v20 = require(l_Modules_0.LuaApp.Enum.SearchRetrievalStatus);
local v21 = require(l_Modules_0.LuaApp.Actions.SetSearchInGames);
local v22 = require(l_Modules_0.LuaApp.Actions.AppendSearchInGames);
local v23 = require(l_Modules_0.LuaApp.Models.GamesApi.GameSearchEntry);
local v24 = require(l_Modules_0.LuaApp.Models.SearchInGames);
local v25 = require(l_Modules_0.Personalization.Search.mapContentTypeToTreatmentType);
local v26 = require(l_Modules_0.Personalization.OmniFeed.DataStore.AddSearchResultsOmniFeed);
local v27 = require(l_Modules_0.LuaApp.Models.DiscoveryApi.getFormattedTextSearchEntry);
local v28 = require(l_Modules_0.LuaApp.Actions.AddTextSearchResults);
return function(v29, v30, v31) --[[ Line: 41 ]]
    -- upvalues: l_BigGameIconReducer_0 (copy), v20 (copy), v3 (copy), v25 (copy), l_OmniFeedConstants_0 (copy), v2 (copy), v23 (copy), v26 (copy), l_reportWarning_0 (copy), v11 (copy), v27 (copy), v28 (copy), l_TopicInfoModel_0 (copy), l_AddTopicInfos_0 (copy), l_parseAndAddGameInfos_0 (copy), l_GameInfoModel_0 (copy), v24 (copy), v22 (copy), v21 (copy), l_AddTopicContents_0 (copy), l_TopicContentsModel_0 (copy), v19 (copy), l_ApiFetchBigGameIcons_0 (copy)
    return function(v32) --[[ Line: 42 ]]
        -- upvalues: l_BigGameIconReducer_0 (ref), v31 (copy), v30 (copy), v20 (ref), v3 (ref), v25 (ref), l_OmniFeedConstants_0 (ref), v2 (ref), v23 (ref), v26 (ref), l_reportWarning_0 (ref), v11 (ref), v27 (ref), v28 (ref), l_TopicInfoModel_0 (ref), l_AddTopicInfos_0 (ref), l_parseAndAddGameInfos_0 (ref), v29 (copy), l_GameInfoModel_0 (ref), v24 (ref), v22 (ref), v21 (ref), l_AddTopicContents_0 (ref), l_TopicContentsModel_0 (ref), v19 (ref), l_ApiFetchBigGameIcons_0 (ref)
        local v33 = {};
        local v34 = v32:getState()[l_BigGameIconReducer_0.key];
        local l_responseBody_0 = v31.responseBody;
        if v32:getState().RequestsStatus.SearchesInGamesStatus[v30.searchUuid] == v20.Removed then
            return v3.resolve("Search with Uuid " .. v30.searchUuid .. " has been terminated");
        else
            local v36 = nil;
            local v37 = false;
            local v38 = {};
            local v39 = 1;
            local v40 = {};
            if l_responseBody_0.sorts then
                for _, v42 in l_responseBody_0.sorts do
                    if v42.topicId and v42.topicLayoutData then
                        v40[v42.topicId] = v42.topicLayoutData;
                    end;
                end;
            end;
            local v43 = {};
            local v44 = {};
            for v45, v46 in pairs(l_responseBody_0.searchResults) do
                local v47 = v46.contents[1];
                local l_topicId_0 = v46.topicId;
                local v49 = v40[l_topicId_0] or {};
                local l_contentGroupType_0 = v46.contentGroupType;
                local v51 = v25(v46.contentGroupType);
                if l_contentGroupType_0 == l_OmniFeedConstants_0.ContentGroupType.Game then
                    local v52 = tostring(v47.rootPlaceId);
                    table.insert(v38, v47);
                    local v53 = v2.Dictionary.join(v47, {
                        topicId = l_topicId_0, 
                        placeId = v52
                    });
                    v23.fromJsonData(v53, true):match(function(v54) --[[ Line: 91 ]]
                        -- upvalues: v33 (copy), v39 (ref), v32 (copy), v26 (ref), v30 (ref), l_topicId_0 (copy), v51 (copy), v49 (copy), v47 (copy), v36 (ref), v37 (ref)
                        v33[v39] = v54;
                        v32:dispatch(v26(v30.searchUuid, l_topicId_0, v51, v39, v49));
                        if v39 == 1 and v47.emphasis then
                            v36 = v47.universeId;
                            v37 = true;
                        end;
                        v39 = v39 + 1;
                    end):matchError(function(v55) --[[ Line: 111 ]]
                        -- upvalues: l_reportWarning_0 (ref), v11 (ref)
                        l_reportWarning_0(v11.default, "GameSearchEntryParseError", v55);
                    end);
                elseif l_contentGroupType_0 == l_OmniFeedConstants_0.ContentGroupType.Text then
                    local v56 = v27(v46.contents);
                    if v56 then
                        v32:dispatch(v26(v30.searchUuid, l_topicId_0, v51, v45, v49));
                        v32:dispatch(v28({
                            searchUuid = v30.searchUuid, 
                            topicId = l_topicId_0, 
                            entry = v56
                        }));
                    end;
                end;
                if not v44[l_topicId_0] then
                    v44[l_topicId_0] = true;
                    table.insert(v43, (l_TopicInfoModel_0.fromSearchApi({
                        topicId = l_topicId_0, 
                        treatmentType = v25(v46.contentGroupType), 
                        topicLayoutData = v49
                    }, v30.searchUuid)));
                end;
            end;
            v32:dispatch(l_AddTopicInfos_0(v43));
            l_parseAndAddGameInfos_0(v29, v32, v38, l_GameInfoModel_0.fromSearchApi, nil);
            local v57 = v24.fromOmniSearch(v30.searchKeyword, v33, v37, l_responseBody_0.nextPageToken, l_responseBody_0.paginationMethod);
            if v30.isAppend then
                v32:dispatch(v22(v30.searchUuid, v57));
            else
                v32:dispatch(v21(v30.searchUuid, v57));
            end;
            v32:dispatch(l_AddTopicContents_0(v30.searchUuid, l_TopicContentsModel_0.fromData(v57), v30.isAppend));
            v32:dispatch(v19(v30.searchUuid, v20.Done));
            if v36 and v34[v36] == nil then
                v32:dispatch(l_ApiFetchBigGameIcons_0(v29, {
                    v36
                }));
            end;
            return v3.resolve();
        end;
    end;
end;