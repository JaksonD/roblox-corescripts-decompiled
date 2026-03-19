local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GameSortGroups_0 = require(l_Parent_0.DiscoveryTypes).GameSortGroups;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.Promise);
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local v7 = require(l_Parent_0.TopicInfosRodux);
local l_TopicInfoModel_0 = v7.TopicInfoModel;
local l_AddTopicInfos_0 = v7.AddTopicInfos;
local v10 = require(l_Parent_0.FetchStatusRodux);
local l_SetFetchStatus_0 = v10.SetFetchStatus;
local l_FetchStatusNamespace_0 = v10.FetchStatusNamespace;
local l_FetchStatusReducer_0 = v10.FetchStatusReducer;
local l_ExploreContentType_0 = require(l_Parent_0.DiscoveryTypes).ExploreContentType;
local l_updateGameFiltersData_0 = require(l_Parent_0.GameFilters).DataStore.updateGameFiltersData;
local l_GameFiltersReducer_0 = require(l_Parent_0.GameFilters).DataStore.GameFiltersReducer;
local l_getSelectedGameFilterOptions_0 = require(l_Parent_0.GameFilters).DataStore.getSelectedGameFilterOptions;
local l_flaggedMutedError_0 = require(l_Parent_0.Loggers).flaggedMutedError;
local l_OmniFeedPageSection_0 = require(l_Parent_0.DiscoveryTypes).OmniFeedConstants.OmniFeedPageSection;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v21 = require(l_Modules_0.Personalization.Sessions.DiscoverPageSession);
local v22 = require(l_Modules_0.LuaApp.Thunks.Games.updateGamesSortData);
local v23 = require(l_Modules_0.LuaApp.Thunks.Songs.updateSongsSortData);
local v24 = require(l_Modules_0.Personalization.Sessions.DataStore.SetPageSessionTimestamp);
local v25 = require(l_Modules_0.LuaApp.Http.Requests.ExploreApi.ExploreGetSorts);
local v26 = require(l_Modules_0.LuaApp.Http.Requests.ExploreApi.ExploreGetSortsMetadata);
local v27 = require(l_Modules_0.LuaApp.Actions.Games.AppendGameSortsInGroup);
local v28 = require(l_Modules_0.LuaApp.Actions.Games.SetGameSortsInGroup);
local v29 = require(l_Modules_0.Personalization.Games.Discovery.SetDiscoveryNextPageId);
local v30 = require(l_Modules_0.Personalization.OmniFeed.DataStore.AddExploreOmniItems);
local v31 = require(l_Parent_0.NextDataExpirationTimeRodux);
local l_SetNextDataExpirationTime_0 = v31.SetNextDataExpirationTime;
local l_ExpirationTimeNamespace_0 = v31.ExpirationTimeNamespace;
local l_FFlagEnableTopSongsSort_0 = require(l_Parent_0.SharedFlags).FFlagEnableTopSongsSort;
local l_FFlagLuaAppFixGamesListSortTokenExpiringTime_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixGamesListSortTokenExpiringTime;
local l_FFlagLuaAppChartsStickyHeader_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppChartsStickyHeader;
local l_FFlagLuaAppFixChartsRenderOnFail_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixChartsRenderOnFail;
local v38 = game:DefineFastFlag("LuaAppErrorOnBadSortGroup", false);
local v39 = game:DefineFastInt("LuaAppGamesListSortTokenExpiryInSec", 600);
local function v42(v40, v41) --[[ Line: 49 ]]
    -- upvalues: l_SetFetchStatus_0 (copy), l_FetchStatusNamespace_0 (copy)
    return l_SetFetchStatus_0(l_FetchStatusNamespace_0.GameSortToken, v40, v41);
end;
local function v58(v43, v44, v45, v46, v47, v48) --[[ Line: 53 ]] --[[ Name: parseExploreSortDataIntoStore ]]
    -- upvalues: l_FFlagLuaAppFixChartsRenderOnFail_0 (copy), v5 (copy), l_FFlagLuaAppChartsStickyHeader_0 (copy), l_AppPage_0 (copy), l_OmniFeedPageSection_0 (copy), l_TopicInfoModel_0 (copy), l_ExploreContentType_0 (copy), l_updateGameFiltersData_0 (copy), v22 (copy), l_SetFetchStatus_0 (copy), l_FetchStatusNamespace_0 (copy), l_RetrievalStatus_0 (copy), l_FFlagEnableTopSongsSort_0 (copy), v23 (copy), l_AddTopicInfos_0 (copy), v27 (copy), v28 (copy), l_GameSortGroups_0 (copy), v30 (copy)
    if l_FFlagLuaAppFixChartsRenderOnFail_0 then
        if not v46 then
            return v5.reject("No sort list found in response.");
        elseif #v46 == 0 then
            return v5.resolve();
        end;
    elseif not v46 or #v46 == 0 then
        return v5.reject("No sort data found in response.");
    end;
    local v49 = nil;
    if l_FFlagLuaAppChartsStickyHeader_0 then
        local v50 = v44:getState();
        local v51 = v50.Personalization.OrderedOmniItems and v50.Personalization.OrderedOmniItems[l_AppPage_0.Games];
        v49 = if v51 then v51.allItems or {} else {};
        if v48 == l_OmniFeedPageSection_0.Header and #v49 > 0 and v49[#v49].pageSection ~= l_OmniFeedPageSection_0.Header and v47 then
            return v5.reject("Header sorts should not be added when there is already body content, to avoid adding header items in the middle of the feed.");
        end;
    end;
    local v52 = {};
    local v53 = {};
    local v54 = {};
    for v55, v56 in ipairs(v46) do
        local v57 = l_TopicInfoModel_0.fromExploreJsonData(v56);
        v52[v55] = v57;
        v53[v55] = v57.name;
        v54[v55] = v57.topicLayoutData;
        if v56.contentType == l_ExploreContentType_0.Filters then
            l_updateGameFiltersData_0(v44, v45, v56.filters);
        elseif v56.contentType == l_ExploreContentType_0.Games then
            if v56.games then
                v22(v43, v44, v56);
                v44:dispatch(l_SetFetchStatus_0(l_FetchStatusNamespace_0.GameSorts, v57.name, l_RetrievalStatus_0.Done));
            end;
        elseif l_FFlagEnableTopSongsSort_0 and v56.contentType == l_ExploreContentType_0.Songs then
            if v56.songs then
                v23(v44, v56, false, v43);
                v44:dispatch(l_SetFetchStatus_0(l_FetchStatusNamespace_0.GameSorts, v57.name, l_RetrievalStatus_0.Done));
            end;
        else
            warn((("unsupported explore content type: %*"):format(v56.contentType)));
        end;
    end;
    v44:dispatch(l_AddTopicInfos_0(v52));
    if v47 then
        v44:dispatch(v27(v45, v53, v54));
    else
        v44:dispatch(v28(v45, v53, "", v54));
    end;
    if v45 == l_GameSortGroups_0.Games then
        v44:dispatch(v30(l_AppPage_0.Games, v52, v47, if l_FFlagLuaAppChartsStickyHeader_0 then v48 else nil));
    end;
    return v5.resolve();
end;
local function v77(v59, v60, v61, v62, v63) --[[ Line: 149 ]] --[[ Name: fetchToken ]]
    -- upvalues: l_GameSortGroups_0 (copy), v26 (copy), v21 (copy), v58 (copy), l_FFlagLuaAppFixGamesListSortTokenExpiringTime_0 (copy), v39 (copy), l_SetNextDataExpirationTime_0 (copy), l_ExpirationTimeNamespace_0 (copy), v42 (copy), l_RetrievalStatus_0 (copy), l_GameFiltersReducer_0 (copy), l_getSelectedGameFilterOptions_0 (copy), v4 (copy), v25 (copy), v5 (copy), l_FFlagLuaAppChartsStickyHeader_0 (copy), v29 (copy), v24 (copy), l_AppPage_0 (copy), l_OmniFeedPageSection_0 (copy), v38 (copy), l_flaggedMutedError_0 (copy)
    local v64 = v62 and v62 ~= "";
    if v61 == l_GameSortGroups_0.GamesList then
        return v26(v59, v21:Get()):andThen(function(v65) --[[ Line: 152 ]]
            -- upvalues: v58 (ref), v59 (copy), v60 (copy), v61 (copy), l_FFlagLuaAppFixGamesListSortTokenExpiringTime_0 (ref), v39 (ref), l_SetNextDataExpirationTime_0 (ref), l_GameSortGroups_0 (ref), l_ExpirationTimeNamespace_0 (ref), v42 (ref), l_RetrievalStatus_0 (ref)
            local v66 = v65 and v65.responseBody and v65.responseBody.sortMetadata;
            return v58(v59, v60, v61, v66):andThen(function() --[[ Line: 154 ]]
                -- upvalues: l_FFlagLuaAppFixGamesListSortTokenExpiringTime_0 (ref), v39 (ref), v60 (ref), l_SetNextDataExpirationTime_0 (ref), l_GameSortGroups_0 (ref), l_ExpirationTimeNamespace_0 (ref), v42 (ref), v61 (ref), l_RetrievalStatus_0 (ref)
                if l_FFlagLuaAppFixGamesListSortTokenExpiringTime_0 then
                    local v67 = math.floor(tick() + v39);
                    v60:dispatch(l_SetNextDataExpirationTime_0(l_GameSortGroups_0.GamesList, v67, l_ExpirationTimeNamespace_0.GameSortGroup));
                end;
                v60:dispatch(v42(v61, l_RetrievalStatus_0.Done));
            end);
        end):catch(function() --[[ Line: 168 ]]
            -- upvalues: v60 (copy), v42 (ref), v61 (copy), l_RetrievalStatus_0 (ref)
            v60:dispatch(v42(v61, l_RetrievalStatus_0.Failed));
        end);
    elseif v61 == l_GameSortGroups_0.Games then
        if not v64 then
            v21:Refresh();
        end;
        local v68 = v60:getState().Personalization[l_GameFiltersReducer_0.key][v61];
        local v69 = l_getSelectedGameFilterOptions_0(if v68 then v68.allFilters else {});
        local v70 = v4.Dictionary.join(v69, v63 or {});
        return v25(v59, v62, v70, v21:Get()):andThen(function(v71) --[[ Line: 183 ]]
            -- upvalues: v5 (ref), l_FFlagLuaAppChartsStickyHeader_0 (ref), v60 (copy), v29 (ref), v24 (ref), l_AppPage_0 (ref), v58 (ref), v59 (copy), v61 (copy), v64 (copy), l_OmniFeedPageSection_0 (ref), v42 (ref), l_RetrievalStatus_0 (ref)
            if not v71 or not v71.responseBody or not v71.responseBody.sorts then
                return v5.reject("Invalid response");
            else
                local v72 = if l_FFlagLuaAppChartsStickyHeader_0 and v71.responseBody.header then v71.responseBody.header.sorts else nil;
                local l_sorts_0 = v71.responseBody.sorts;
                local v74 = v71.responseBody.nextSortsPageToken or "";
                v60:dispatch(v29(v74));
                v60:dispatch(v24(l_AppPage_0.Games));
                if l_FFlagLuaAppChartsStickyHeader_0 and v72 and #v72 > 0 then
                    return v58(v59, v60, v61, v72, v64, l_OmniFeedPageSection_0.Header):andThen(function() --[[ Line: 197 ]]
                        -- upvalues: l_sorts_0 (copy), v58 (ref), v59 (ref), v60 (ref), v61 (ref), v5 (ref)
                        if l_sorts_0 and #l_sorts_0 > 0 then
                            return v58(v59, v60, v61, l_sorts_0, true);
                        else
                            return v5.resolve();
                        end;
                    end):andThen(function() --[[ Line: 211 ]]
                        -- upvalues: v60 (ref), v42 (ref), v61 (ref), l_RetrievalStatus_0 (ref)
                        return v60:dispatch(v42(v61, l_RetrievalStatus_0.Done));
                    end);
                else
                    return v58(v59, v60, v61, l_sorts_0, v64):andThen(function() --[[ Line: 217 ]]
                        -- upvalues: v60 (ref), v42 (ref), v61 (ref), l_RetrievalStatus_0 (ref)
                        return v60:dispatch(v42(v61, l_RetrievalStatus_0.Done));
                    end);
                end;
            end;
        end):catch(function(v75) --[[ Line: 222 ]]
            -- upvalues: v60 (copy), v42 (ref), v61 (copy), l_RetrievalStatus_0 (ref), v5 (ref), l_FFlagLuaAppChartsStickyHeader_0 (ref)
            v60:dispatch(v42(v61, l_RetrievalStatus_0.Failed));
            return v5.reject(if l_FFlagLuaAppChartsStickyHeader_0 then v75 or "Update failed" else "Update failed");
        end);
    else
        local v76 = ("Unsupported GameSortGroups %* called."):format(v61);
        v60:dispatch(v42(v61, l_RetrievalStatus_0.Failed));
        if v38 then
            l_flaggedMutedError_0("BadGameSortGroups", v76);
        end;
        return v5.reject(v76);
    end;
end;
return function(v78, v79, v80, v81) --[[ Line: 241 ]]
    -- upvalues: l_FetchStatusReducer_0 (copy), l_FetchStatusNamespace_0 (copy), l_RetrievalStatus_0 (copy), v5 (copy), v42 (copy), v77 (copy)
    return function(v82) --[[ Line: 242 ]]
        -- upvalues: l_FetchStatusReducer_0 (ref), l_FetchStatusNamespace_0 (ref), v79 (copy), l_RetrievalStatus_0 (ref), v5 (ref), v42 (ref), v77 (ref), v78 (copy), v80 (copy), v81 (copy)
        if v82:getState().Personalization[l_FetchStatusReducer_0.key][l_FetchStatusNamespace_0.GameSortToken][v79] == l_RetrievalStatus_0.Fetching then
            return v5.resolve("Data is fetching.");
        else
            v82:dispatch(v42(v79, l_RetrievalStatus_0.Fetching));
            return v77(v78, v82, v79, v80, v81);
        end;
    end;
end;