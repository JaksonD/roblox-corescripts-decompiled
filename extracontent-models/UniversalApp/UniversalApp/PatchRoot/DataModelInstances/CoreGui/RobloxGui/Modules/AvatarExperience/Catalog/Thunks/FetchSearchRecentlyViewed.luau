local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_CorePackages_0.Packages.Dash);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSearch);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v8 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v9 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v10 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local l_sendAXStat_0 = v6.sendAXStat;
local l_SearchLandingPageRecentlyViewedWidget_0 = v10.ContextWidgets.SearchLandingPageRecentlyViewedWidget;
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ReceivedRecentlyViewedItemsData);
local l_AXRecentlyViewedSearchItemsIXPTest_0 = v7.Experiments.AXRecentlyViewedSearchItemsIXPTest;
local v17 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXRemoveAwaitUsageInThunks);
local l_GetFFlagAXRecentlyViewedCounters_0 = v5.Flags.GetFFlagAXRecentlyViewedCounters;
local function _(v19) --[[ Line: 33 ]]
    return v19.AvatarExperience.Common;
end;
local function _(v21) --[[ Line: 37 ]] --[[ Name: mapItemsToWidgetContent ]]
    -- upvalues: v4 (copy), v11 (copy), v10 (copy)
    return v4.map(v21, function(v22) --[[ Line: 38 ]]
        -- upvalues: v11 (ref), v10 (ref)
        return {
            id = v22.id, 
            type = if v22.itemType == v11.ItemType.Asset then v10.ContentType.Asset else v10.ContentType.Bundle
        };
    end);
end;
local function v27(v24) --[[ Line: 48 ]] --[[ Name: createWidgetInfo ]]
    -- upvalues: v8 (copy), l_AXRecentlyViewedSearchItemsIXPTest_0 (copy), l_SearchLandingPageRecentlyViewedWidget_0 (copy), v4 (copy), v11 (copy), v10 (copy)
    local v25 = "Feature.Avatar.Label.SearchLandingPage.Title.RecentlyViewedSearchItems";
    if v8.readTestVariable(l_AXRecentlyViewedSearchItemsIXPTest_0.EnabledSaveInCatalog) then
        v25 = "Feature.Avatar.Label.SearchLandingPage.Title.RecentlyViewedItems";
    end;
    return {
        [l_SearchLandingPageRecentlyViewedWidget_0.Context] = {
            content = v4.map(v24, function(v26) --[[ Line: 38 ]]
                -- upvalues: v11 (ref), v10 (ref)
                return {
                    id = v26.id, 
                    type = if v26.itemType == v11.ItemType.Asset then v10.ContentType.Asset else v10.ContentType.Bundle
                };
            end), 
            template = {
                title = v25, 
                type = v10.Templates.ItemGroup
            }, 
            id = l_SearchLandingPageRecentlyViewedWidget_0.WidgetId, 
            requestId = l_SearchLandingPageRecentlyViewedWidget_0.RequestId, 
            type = v10.Types.SearchLandingPageRecentlyViewedWidget
        }
    };
end;
local function v38(v28) --[[ Line: 70 ]] --[[ Name: getValidItems ]]
    -- upvalues: v4 (copy)
    if #v28.items == #v28.existingItems + #v28.fetchedItems then
        return v28.items;
    else
        local v29 = {};
        for _, v31 in v28.items do
            local v34 = v4.find(v28.fetchedItems, function(v32) --[[ Line: 78 ]]
                -- upvalues: v31 (copy)
                local v33 = false;
                if tostring(v32.id) == tostring(v31.id) then
                    v33 = v32.itemType == v31.itemType;
                end;
                return v33;
            end);
            local v37 = v4.find(v28.existingItems, function(v35) --[[ Line: 81 ]]
                -- upvalues: v31 (copy)
                local v36 = false;
                if tostring(v35.id) == tostring(v31.id) then
                    v36 = v35.itemType == v31.itemType;
                end;
                return v36;
            end);
            if v34 or v37 then
                table.insert(v29, v31);
            end;
        end;
        return v29;
    end;
end;
return function(v39, v40, v41) --[[ Line: 91 ]]
    -- upvalues: l_PerformFetch_0 (copy), v9 (copy), v17 (copy), v4 (copy), l_GetFFlagAXRecentlyViewedCounters_0 (copy), v12 (copy), v11 (copy), l_sendAXStat_0 (copy), v5 (copy), v15 (copy), v27 (copy), v38 (copy), l_SearchLandingPageRecentlyViewedWidget_0 (copy), v2 (copy)
    return l_PerformFetch_0.Single(v40, function(v42) --[[ Line: 92 ]]
        -- upvalues: v41 (copy), v9 (ref), v17 (ref), v4 (ref), l_GetFFlagAXRecentlyViewedCounters_0 (ref), v12 (ref), v39 (copy), v11 (ref), l_sendAXStat_0 (ref), v5 (ref), v15 (ref), v27 (ref), v38 (ref), l_SearchLandingPageRecentlyViewedWidget_0 (ref), v2 (ref)
        local v43 = {};
        local v44 = {};
        local l_Common_0 = v42:getState().AvatarExperience.Common;
        for _, v47 in v41 do
            if v9(l_Common_0, v47.id, v47.itemType) then
                table.insert(v43, v47);
            else
                table.insert(v44, v47);
            end;
        end;
        if v17() then
            local v48 = {};
            local v49 = {};
            local v50 = {};
            if #v44 > 0 then
                local v52 = v4.map(v44, function(v51) --[[ Line: 116 ]]
                    return {
                        id = tonumber(v51.id), 
                        itemType = v51.itemType
                    };
                end);
                local v53 = if l_GetFFlagAXRecentlyViewedCounters_0() then os.clock() else nil;
                return v12.FetchItemDetails(v39, v52):andThen(function(v54) --[[ Line: 120 ]]
                    -- upvalues: v48 (ref), v11 (ref), v49 (copy), v50 (copy), l_GetFFlagAXRecentlyViewedCounters_0 (ref), v53 (copy), l_sendAXStat_0 (ref), v5 (ref), v44 (copy), v42 (copy), v15 (ref), v27 (ref), v38 (ref), v41 (ref), v43 (copy), l_SearchLandingPageRecentlyViewedWidget_0 (ref)
                    v48 = if v54.responseBody and v54.responseBody.data then v54.responseBody.data else {};
                    for _, v56 in v48 do
                        if v56.itemType == v11.ItemType.Asset then
                            table.insert(v49, v56);
                        elseif v56.itemType == v11.ItemType.Bundle then
                            table.insert(v50, v56);
                        end;
                    end;
                    if l_GetFFlagAXRecentlyViewedCounters_0() and typeof(v53) == "number" then
                        local v57 = (os.clock() - v53) * 1000;
                        l_sendAXStat_0({
                            statName = v5.Enums.Stat.FetchRecentlyViewedItemsMs, 
                            metaData = {
                                count = tostring(#v44)
                            }, 
                            deltaMs = v57, 
                            excludeTelemetry = true
                        });
                    end;
                    v42:dispatch(v15({
                        assetData = v49, 
                        bundleData = v50, 
                        widget = {
                            widgetInfo = v27((v38({
                                items = v41, 
                                existingItems = v43, 
                                itemsToFetch = v44, 
                                fetchedItems = v48
                            }))), 
                            requestId = l_SearchLandingPageRecentlyViewedWidget_0.RequestId, 
                            context = l_SearchLandingPageRecentlyViewedWidget_0.Context
                        }
                    }));
                end);
            else
                v42:dispatch(v15({
                    assetData = v49, 
                    bundleData = v50, 
                    widget = {
                        widgetInfo = v27((v38({
                            items = v41, 
                            existingItems = v43, 
                            itemsToFetch = v44, 
                            fetchedItems = v48
                        }))), 
                        requestId = l_SearchLandingPageRecentlyViewedWidget_0.RequestId, 
                        context = l_SearchLandingPageRecentlyViewedWidget_0.Context
                    }
                }));
                return v2.resolve();
            end;
        else
            local v58 = {};
            local v59 = {};
            local v60 = {};
            if #v44 > 0 then
                local v62 = v4.map(v44, function(v61) --[[ Line: 179 ]]
                    return {
                        id = tonumber(v61.id), 
                        itemType = v61.itemType
                    };
                end);
                local v63 = v12.FetchItemDetails(v39, v62);
                local v64 = if l_GetFFlagAXRecentlyViewedCounters_0() then os.clock() else nil;
                local v65, v66 = v63:await();
                if l_GetFFlagAXRecentlyViewedCounters_0() and typeof(v64) == "number" then
                    local v67 = (os.clock() - v64) * 1000;
                    l_sendAXStat_0({
                        statName = v5.Enums.Stat.FetchRecentlyViewedItemsMs, 
                        metaData = {
                            count = tostring(#v44)
                        }, 
                        deltaMs = v67, 
                        excludeTelemetry = true
                    });
                end;
                if not v65 then
                    return v2.reject(v66);
                else
                    v58 = if v66.responseBody and v66.responseBody.data then v66.responseBody.data else {};
                    for _, v69 in v58 do
                        if v69.itemType == v11.ItemType.Asset then
                            table.insert(v59, v69);
                        elseif v69.itemType == v11.ItemType.Bundle then
                            table.insert(v60, v69);
                        end;
                    end;
                end;
            end;
            v42:dispatch(v15({
                assetData = v59, 
                bundleData = v60, 
                widget = {
                    widgetInfo = v27((v38({
                        items = v41, 
                        existingItems = v43, 
                        itemsToFetch = v44, 
                        fetchedItems = v58
                    }))), 
                    requestId = l_SearchLandingPageRecentlyViewedWidget_0.RequestId, 
                    context = l_SearchLandingPageRecentlyViewedWidget_0.Context
                }
            }));
            return v2.resolve();
        end;
    end);
end;