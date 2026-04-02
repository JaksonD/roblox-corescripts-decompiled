local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UnifiedLogging);
local v3 = require(l_script_FirstAncestor_0.Analytics.SduiCollectionAnalyticsBuilder);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.SduiConfigTypes);
local v6 = require(l_script_FirstAncestor_0.SduiErrors);
local v7 = require(l_script_FirstAncestor_0.getSduiImpressionHandlerRegistry);
local _ = require(l_script_FirstAncestor_0.SduiImpressionEventType);
local l_FFlagSduiImpressionHandlerRegistry_0 = require(l_Parent_0.SharedFlags).FFlagSduiImpressionHandlerRegistry;
return function(v10, v11, v12, v13, v14, v15, v16) --[[ Line: 28 ]] --[[ Name: reportUnifiedLoggingImpressions ]]
    -- upvalues: v6 (copy), v3 (copy), l_FFlagSduiImpressionHandlerRegistry_0 (copy), v7 (copy), v2 (copy)
    if not v13 then
        v10.dependencies.logger.reportError(v6.SduiErrorType.LogImpressionsMissingCollectionData, {}, v10.appPage);
    end;
    v13 = v13 or v3.DUMMY_COLLECTION_DATA;
    assert(v13, "collectionAnalyticsData must exist");
    local v17 = nil;
    if l_FFlagSduiImpressionHandlerRegistry_0 then
        if v15 then
            v17 = v7().getImpressionHandlerConfig(v15);
            if v17 then
                if v17.handler then
                    v17.handler(v10, v11, v12, v13, v14);
                end;
            else
                v2.SendItemImpressions.sendFromServerDrivenUi(v10.dependencies.eventIngest, v11, v12, v13, v10.appPage, v13.collectionId, v13.contentType, v13.itemsPerRow, v13.collectionPosition, v14, v15);
            end;
        end;
        if v16 ~= nil then
            if v16 then
                return;
            end;
        elseif v17 and v17.skipItemImpressionsLog then
            return;
        end;
    end;
    v2.SendItemImpressions.sendFromServerDrivenUi(v10.dependencies.eventIngest, v11, v12, v13, v10.appPage, v13.collectionId, v13.contentType, v13.itemsPerRow, v13.collectionPosition, v14);
end;