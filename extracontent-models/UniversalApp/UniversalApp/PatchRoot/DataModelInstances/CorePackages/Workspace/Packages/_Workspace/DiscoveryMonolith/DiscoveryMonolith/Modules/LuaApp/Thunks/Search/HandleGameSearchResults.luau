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
local l_FFlagLuaAppSearchGridTiles_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSearchGridTiles;
return function(v30, v31, v32) --[[ Line: 42 ]]
    -- upvalues: l_BigGameIconReducer_0 (copy), v20 (copy), v3 (copy), l_FFlagLuaAppSearchGridTiles_0 (copy), v25 (copy), l_OmniFeedConstants_0 (copy), v2 (copy), v23 (copy), v26 (copy), l_reportWarning_0 (copy), v11 (copy), v27 (copy), v28 (copy), l_TopicInfoModel_0 (copy), l_AddTopicInfos_0 (copy), l_parseAndAddGameInfos_0 (copy), l_GameInfoModel_0 (copy), v24 (copy), v22 (copy), v21 (copy), l_AddTopicContents_0 (copy), l_TopicContentsModel_0 (copy), v19 (copy), l_ApiFetchBigGameIcons_0 (copy)
    return function(v33) --[[ Line: 43 ]]
        -- upvalues: l_BigGameIconReducer_0 (ref), v32 (copy), v31 (copy), v20 (ref), v3 (ref), l_FFlagLuaAppSearchGridTiles_0 (ref), v25 (ref), l_OmniFeedConstants_0 (ref), v2 (ref), v23 (ref), v26 (ref), l_reportWarning_0 (ref), v11 (ref), v27 (ref), v28 (ref), l_TopicInfoModel_0 (ref), l_AddTopicInfos_0 (ref), l_parseAndAddGameInfos_0 (ref), v30 (copy), l_GameInfoModel_0 (ref), v24 (ref), v22 (ref), v21 (ref), l_AddTopicContents_0 (ref), l_TopicContentsModel_0 (ref), v19 (ref), l_ApiFetchBigGameIcons_0 (ref)
        local v34 = {};
        local v35 = v33:getState()[l_BigGameIconReducer_0.key];
        local l_responseBody_0 = v32.responseBody;
        if v33:getState().RequestsStatus.SearchesInGamesStatus[v31.searchUuid] == v20.Removed then
            return v3.resolve("Search with Uuid " .. v31.searchUuid .. " has been terminated");
        else
            local v37 = nil;
            local v38 = false;
            local v39 = {};
            local v40 = 1;
            local v41 = {};
            if l_responseBody_0.sorts then
                for _, v43 in l_responseBody_0.sorts do
                    if v43.topicId and v43.topicLayoutData then
                        v41[v43.topicId] = v43.topicLayoutData;
                    end;
                end;
            end;
            local v44 = if l_FFlagLuaAppSearchGridTiles_0 then {} else nil;
            local v45 = if l_FFlagLuaAppSearchGridTiles_0 then {} else nil;
            for v46, v47 in pairs(l_responseBody_0.searchResults) do
                local v48 = v47.contents[1];
                local l_topicId_0 = v47.topicId;
                local v50 = v41[l_topicId_0] or {};
                local l_contentGroupType_0 = v47.contentGroupType;
                local v52 = v25(v47.contentGroupType);
                if l_contentGroupType_0 == l_OmniFeedConstants_0.ContentGroupType.Game then
                    local v53 = tostring(v48.rootPlaceId);
                    table.insert(v39, v48);
                    local v54 = v2.Dictionary.join(v48, {
                        topicId = l_topicId_0, 
                        placeId = v53
                    });
                    v23.fromJsonData(v54, true):match(function(v55) --[[ Line: 92 ]]
                        -- upvalues: v34 (copy), v40 (ref), v33 (copy), v26 (ref), v31 (ref), l_topicId_0 (copy), v52 (copy), v50 (copy), v48 (copy), v37 (ref), v38 (ref)
                        v34[v40] = v55;
                        v33:dispatch(v26(v31.searchUuid, l_topicId_0, v52, v40, v50));
                        if v40 == 1 and v48.emphasis then
                            v37 = v48.universeId;
                            v38 = true;
                        end;
                        v40 = v40 + 1;
                    end):matchError(function(v56) --[[ Line: 112 ]]
                        -- upvalues: l_reportWarning_0 (ref), v11 (ref)
                        l_reportWarning_0(v11.default, "GameSearchEntryParseError", v56);
                    end);
                elseif l_contentGroupType_0 == l_OmniFeedConstants_0.ContentGroupType.Text then
                    local v57 = v27(v47.contents);
                    if v57 then
                        v33:dispatch(v26(v31.searchUuid, l_topicId_0, v52, v46, v50));
                        v33:dispatch(v28({
                            searchUuid = v31.searchUuid, 
                            topicId = l_topicId_0, 
                            entry = v57
                        }));
                    end;
                end;
                if l_FFlagLuaAppSearchGridTiles_0 and not v45[l_topicId_0] then
                    v45[l_topicId_0] = true;
                    table.insert(v44, (l_TopicInfoModel_0.fromSearchApi({
                        topicId = l_topicId_0, 
                        treatmentType = v25(v47.contentGroupType), 
                        topicLayoutData = v50
                    }, v31.searchUuid)));
                end;
            end;
            if l_FFlagLuaAppSearchGridTiles_0 then
                v33:dispatch(l_AddTopicInfos_0(v44));
            end;
            l_parseAndAddGameInfos_0(v30, v33, v39, l_GameInfoModel_0.fromSearchApi, nil);
            local v58 = v24.fromOmniSearch(v31.searchKeyword, v34, v38, l_responseBody_0.nextPageToken, l_responseBody_0.paginationMethod);
            if v31.isAppend then
                v33:dispatch(v22(v31.searchUuid, v58));
            else
                v33:dispatch(v21(v31.searchUuid, v58));
            end;
            if l_FFlagLuaAppSearchGridTiles_0 then
                v33:dispatch(l_AddTopicContents_0(v31.searchUuid, l_TopicContentsModel_0.fromData(v58), v31.isAppend));
            end;
            v33:dispatch(v19(v31.searchUuid, v20.Done));
            if v37 and v35[v37] == nil then
                v33:dispatch(l_ApiFetchBigGameIcons_0(v30, {
                    v37
                }));
            end;
            return v3.resolve();
        end;
    end;
end;