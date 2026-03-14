local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_Modules_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_AddOmniRecommendations_0 = l_Modules_0.LuaApp.Actions.Games.AddOmniRecommendations;
local l_AddSearchResultsOmniFeed_0 = l_Modules_0.Personalization.OmniFeed.DataStore.AddSearchResultsOmniFeed;
local l_FeedItemModel_0 = l_Modules_0.Personalization.OmniFeed.DataStore.FeedItemModel;
local l_AddExploreOmniItems_0 = l_Modules_0.Personalization.OmniFeed.DataStore.AddExploreOmniItems;
local l_SetOmniAutocompleteSorts_0 = l_Modules_0.LuaApp.Actions.Games.SetOmniAutocompleteSorts;
local l_SetFeedItemRenderedRows_0 = l_Modules_0.Personalization.OmniFeed.DataStore.SetFeedItemRenderedRows;
local l_ClearFeedItemRenderedRows_0 = l_Modules_0.Personalization.OmniFeed.DataStore.ClearFeedItemRenderedRows;
local l_Modules_1 = game:GetService("CoreGui").RobloxGui.Modules;
local v13 = require(l_Modules_1.Personalization.OmniFeed.DataStore.AddLocalOmniItems);
local v14 = require(l_Modules_1.Personalization.OmniFeed.DataStore.AddSearchResultsOmniFeedSorts);
local v15 = require(l_Modules_1.Personalization.OmniFeed.DataStore.OrderedOmniItemsUtility);
local l_FFlagSearchOmniAutocompletePage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSearchOmniAutocompletePage;
local l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddRequestIdToRfySignalApportioning;
local l_FFlagLuaAppChartsStickyHeader_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppChartsStickyHeader;
return function(v19, v20) --[[ Line: 31 ]]
    -- upvalues: l_AddOmniRecommendations_0 (copy), l_AppPage_0 (copy), l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (copy), l_FeedItemModel_0 (copy), v1 (copy), v15 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), l_SetOmniAutocompleteSorts_0 (copy), l_AddExploreOmniItems_0 (copy), l_FFlagLuaAppChartsStickyHeader_0 (copy), v13 (copy), l_AddSearchResultsOmniFeed_0 (copy), v14 (copy), l_SetFeedItemRenderedRows_0 (copy), l_ClearFeedItemRenderedRows_0 (copy)
    v19 = v19 or {};
    if v20.type == l_AddOmniRecommendations_0.name then
        local l_recommendations_0 = v20.recommendations;
        for v22, v23 in pairs(l_recommendations_0) do
            if v22 == l_AppPage_0.Home then
                assert(v22 == v23.pageType);
                local l_Home_0 = l_AppPage_0.Home;
                local v25 = v19[l_Home_0] or {};
                local l_sorts_0 = v23.sorts;
                local v27 = if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v23.recommendationsId else nil;
                local v28 = {};
                local v29 = nil;
                local v30 = nil;
                v29 = #l_sorts_0;
                v30 = v25.omniRecommendationsSortsCount or 0;
                for v31, v32 in ipairs(l_sorts_0) do
                    if v20.isAppend then
                        v31 = v31 + v30;
                    end;
                    table.insert(v28, (l_FeedItemModel_0.fromDiscoveryApi(v31, v32, if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v27 else nil)));
                end;
                local v33 = nil;
                if v20.isAppend then
                    v28 = v1.List.join(v25.allItems or {}, v28);
                    v33 = v30 + v29;
                else
                    v33 = v29;
                end;
                v25 = v1.Dictionary.join(v25, {
                    allItems = v15.combineOmniFeedItems(v25.localItems or {}, v28), 
                    omniRecommendationsSortsCount = v33
                });
                v19 = v1.Dictionary.join(v19, {
                    [l_Home_0] = v25
                });
            end;
        end;
        return v19;
    elseif l_FFlagSearchOmniAutocompletePage_0 and v20.type == l_SetOmniAutocompleteSorts_0.name then
        local l_SearchLandingPage_0 = l_AppPage_0.SearchLandingPage;
        local v35 = {};
        for v36, v37 in ipairs(v20.sortsTable) do
            table.insert(v35, (l_FeedItemModel_0.fromOmniAutocompleteApi(v36, v37)));
        end;
        local v38 = v19[l_SearchLandingPage_0] or {};
        v38 = v1.Dictionary.join(v38, {
            allItems = v15.combineOmniFeedItems(v38.localItems or {}, v35)
        });
        return (v1.Dictionary.join(v19, {
            [l_SearchLandingPage_0] = v38
        }));
    elseif v20.type == l_AddExploreOmniItems_0.name then
        local v39 = v19[v20.appPage] or {};
        local v40 = v39.allItems or {};
        local v41 = {};
        local v42 = if v20.isAppend then #v40 else 0;
        for v43, v44 in v20.topicInfos do
            table.insert(v41, (l_FeedItemModel_0.fromExploreTopicInfo(v42 + v43, v44, if l_FFlagLuaAppChartsStickyHeader_0 then v20.omniFeedPageSection else nil)));
        end;
        if v20.isAppend then
            v41 = v1.List.join(v40, v41);
        end;
        return (v1.Dictionary.join(v19, {
            [v20.appPage] = v1.Dictionary.join(v39, {
                allItems = v15.combineOmniFeedItems(v39.localItems or {}, v41)
            })
        }));
    elseif v20.type == v13.name then
        local v45 = {};
        if v20.localItems then
            for _, v47 in ipairs(v20.localItems) do
                table.insert(v45, (l_FeedItemModel_0.fromLocalData(v47.orderIndex, v47.treatmentType, v47.treatmentProps, v47.numberOfRows)));
            end;
        end;
        table.sort(v45, function(v48, v49) --[[ Line: 143 ]]
            if v48.orderHint ~= nil and v49.orderHint ~= nil then
                return v48.orderHint < v49.orderHint;
            elseif v48.orderHint ~= nil then
                return true;
            else
                return false;
            end;
        end);
        local v50 = v19[v20.appPage] or {};
        v50 = v1.Dictionary.join(v50, {
            hasLocalItems = true, 
            localItems = v45, 
            allItems = v15.combineOmniFeedItems(v45, v50.allItems)
        });
        return (v1.Dictionary.join(v19, {
            [v20.appPage] = v50
        }));
    elseif v20.type == l_AddSearchResultsOmniFeed_0.name then
        local v51 = {
            allItems = {}, 
            localItems = {}
        };
        if v19[l_AppPage_0.SearchPage] then
            if v19[l_AppPage_0.SearchPage][v20.searchUuid] then
                for _, v53 in ipairs(v19[l_AppPage_0.SearchPage][v20.searchUuid].allItems) do
                    if v20.topicId == v53.treatmentProps.topicId then
                        return v19;
                    end;
                end;
            else
                v19[l_AppPage_0.SearchPage][v20.searchUuid] = v51;
            end;
        else
            v19 = v1.Dictionary.join(v19, {
                [l_AppPage_0.SearchPage] = {
                    [v20.searchUuid] = v51
                }
            });
        end;
        local v54 = l_FeedItemModel_0.fromSearchApi(v20.searchUuid, v20.topicId, v20.treatmentType, v20.sortIndex, v20.topicLayoutData);
        local v55 = {
            allItems = v1.List.join(v19[l_AppPage_0.SearchPage][v20.searchUuid].allItems, {
                v54
            }), 
            localItems = {}
        };
        local v56 = v1.Dictionary.join(v19[l_AppPage_0.SearchPage], {
            [v20.searchUuid] = v55
        });
        return (v1.Dictionary.join(v19, {
            [l_AppPage_0.SearchPage] = v56
        }));
    elseif v20.type == v14.name then
        local l_searchUuid_0 = v20.searchUuid;
        local l_SearchPage_0 = l_AppPage_0.SearchPage;
        local v59 = {};
        for v60, v61 in ipairs(v20.sorts) do
            local l_topicId_0 = v61.topicId;
            local l_treatmentType_0 = v61.treatmentType;
            local l_topicLayoutData_0 = v61.topicLayoutData;
            table.insert(v59, (l_FeedItemModel_0.fromSearchApi(l_searchUuid_0, l_topicId_0, l_treatmentType_0, v60, l_topicLayoutData_0)));
        end;
        local v65 = {
            [l_SearchPage_0] = v1.Dictionary.join(v19[l_SearchPage_0] or {}, {
                [l_searchUuid_0] = {
                    allItems = v59, 
                    localItems = {}
                }
            })
        };
        return (v1.Dictionary.join(v19, v65));
    else
        if v20.type == l_SetFeedItemRenderedRows_0.name then
            local v66 = v19[v20.appPage];
            if v20.secondaryKey and v66 then
                v66 = v66[v20.secondaryKey];
            end;
            if v66 then
                local v67 = v15.setFeedItemRenderedRows(v66.allItems, v20.feedItemPosition, v20.feedItem, v20.actualNumberOfRows);
                if v67 then
                    local v68 = v1.Dictionary.join(v66, {
                        allItems = v67
                    });
                    if v20.secondaryKey then
                        v68 = v1.Dictionary.join(v19[v20.appPage], {
                            [v20.secondaryKey] = v68
                        });
                    end;
                    return (v1.Dictionary.join(v19, {
                        [v20.appPage] = v68
                    }));
                end;
            end;
        elseif v20.type == l_ClearFeedItemRenderedRows_0.name then
            local v69 = v19[v20.appPage];
            if v20.secondaryKey and v69 then
                v69 = v69[v20.secondaryKey];
            end;
            if v69 then
                local v70 = v15.setFeedItemRenderedRows(v69.allItems, v20.feedItemPosition, v20.feedItem, nil);
                if v70 then
                    local v71 = v1.Dictionary.join(v69, {
                        allItems = v70
                    });
                    if v20.secondaryKey then
                        v71 = v1.Dictionary.join(v19[v20.appPage], {
                            [v20.secondaryKey] = v71
                        });
                    end;
                    v19 = v1.Dictionary.join(v19, {
                        [v20.appPage] = v71
                    });
                end;
            end;
        end;
        return v19;
    end;
end;