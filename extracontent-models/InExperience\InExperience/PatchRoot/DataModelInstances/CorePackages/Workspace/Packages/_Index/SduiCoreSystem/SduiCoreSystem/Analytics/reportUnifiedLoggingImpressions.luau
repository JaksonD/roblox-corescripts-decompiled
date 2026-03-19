local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UnifiedLogging);
local v3 = require(l_script_FirstAncestor_0.Analytics.SduiCollectionAnalyticsBuilder);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.SduiConfigTypes);
local v6 = require(l_script_FirstAncestor_0.SduiErrors);
return function(v7, v8, v9, v10, v11) --[[ Line: 16 ]] --[[ Name: reportUnifiedLoggingImpressions ]]
    -- upvalues: v6 (copy), v3 (copy), v2 (copy)
    if not v10 then
        v7.dependencies.logger.reportError(v6.SduiErrorType.LogImpressionsMissingCollectionData, {}, v7.appPage);
    end;
    v10 = v10 or v3.DUMMY_COLLECTION_DATA;
    assert(v10, "collectionAnalyticsData must exist");
    v2.SendItemImpressions.sendFromServerDrivenUi(v7.dependencies.eventIngest, v8, v9, v10, v7.appPage, v10.collectionId, v10.contentType, v10.itemsPerRow, v10.collectionPosition, v11);
end;