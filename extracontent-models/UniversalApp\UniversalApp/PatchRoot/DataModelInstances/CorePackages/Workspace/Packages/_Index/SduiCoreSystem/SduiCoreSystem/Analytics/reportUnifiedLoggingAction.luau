local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UnifiedLogging);
local v3 = require(l_script_FirstAncestor_0.Analytics.SduiCollectionAnalyticsBuilder);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.SduiConfigTypes);
local v6 = require(l_script_FirstAncestor_0.SduiErrors);
return function(v7, v8, v9) --[[ Line: 16 ]] --[[ Name: reportUnifiedLoggingAction ]]
    -- upvalues: v3 (copy), v6 (copy), v2 (copy)
    local v11 = v3.buildAndValidateItemAnalyticsData(v7, v9.analyticsData, v9.ancestorAnalyticsData, nil, v8.actionType, function(_) --[[ Line: 27 ]]
        -- upvalues: v7 (copy), v6 (ref), v8 (copy)
        v7.dependencies.logger.reportCounter(v6.SduiCounterName.LogActionInvalidItemData, {
            name = v8.actionType
        });
    end);
    assert(v11, "itemAnalyticsData must exist");
    local v12 = v9.getCollectionData and v9.getCollectionData() or nil;
    if not v12 then
        v7.dependencies.logger.reportCounter(v6.SduiCounterName.LogActionMissingCollectionData, {
            name = v8.actionType
        });
        v12 = v3.DUMMY_COLLECTION_DATA;
    end;
    assert(v12, "collectionAnalyticsData must exist");
    v2.SendItemActionEvent.sendFromServerDrivenUi(v7.dependencies.eventIngest, v11, v11.itemPosition, v12, v7.appPage, v12.collectionId, v12.contentType, v12.itemsPerRow, v12.collectionPosition, v12.totalNumberOfItems, nil, v8.actionType, v8.actionParams, v12.startRowNumber);
end;