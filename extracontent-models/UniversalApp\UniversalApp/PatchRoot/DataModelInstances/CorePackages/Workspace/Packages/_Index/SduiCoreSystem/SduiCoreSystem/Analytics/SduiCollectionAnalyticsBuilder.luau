local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.UnifiedLogging);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.SduiComponentType);
local _ = require(l_script_FirstAncestor_0.SduiConfigTypes);
local v7 = require(l_script_FirstAncestor_0.SduiErrors);
local v8 = require(l_script_FirstAncestor_0.validateInterface);
local v9 = {};
local v10 = {
    index = -1, 
    id = "unknown", 
    itemComponentType = "unknown"
};
local v11 = {
    collectionId = -1, 
    contentType = "unknown", 
    itemsPerRow = -1, 
    collectionPosition = -1, 
    totalNumberOfItems = -1, 
    startRowNumber = -1, 
    collectionComponentType = "unknown"
};
return {
    buildAndValidateCollectionAnalyticsData = function(v12, v13, v14, v15, v16, v17, _, v19, v20) --[[ Line: 38 ]] --[[ Name: buildAndValidateCollectionAnalyticsData ]]
        -- upvalues: v2 (copy), v9 (copy), v3 (copy), v8 (copy), v7 (copy), v11 (copy)
        local v21 = v2.Dictionary.join(v13 or v9, v14 or v9);
        v21.collectionId = tonumber(v21.collectionId) or v21.collectionId;
        v21.collectionPosition = tonumber(v21.collectionPosition);
        v21.itemsPerRow = v16;
        v21.startRowNumber = v20;
        v21.totalNumberOfItems = v17;
        v21.collectionComponentType = v15;
        local l_CollectionAnalyticsDataInterface_0 = v3.SduiAnalyticsTypes.CollectionAnalyticsDataInterface;
        local v23, v24 = v8(v21, l_CollectionAnalyticsDataInterface_0, true);
        if not v23 then
            v12.dependencies.logger.reportError(v7.SduiErrorType.InvalidCollectionAnalyticsData, {
                componentType = v15, 
                name = v19, 
                message = v24
            }, v12.appPage);
            v21 = v2.Dictionary.join(v11, v21);
        end;
        return v21;
    end, 
    buildAndValidateItemAnalyticsData = function(v25, v26, v27, v28, v29, v30) --[[ Line: 71 ]] --[[ Name: buildAndValidateItemAnalyticsData ]]
        -- upvalues: v2 (copy), v9 (copy), v3 (copy), v8 (copy), v7 (copy), v10 (copy)
        local v31 = v2.Dictionary.join(v27 or v9, v26 or v9, v28 or v9);
        local l_ItemAnalyticsDataInterface_0 = v3.SduiAnalyticsTypes.ItemAnalyticsDataInterface;
        local v33, v34 = v8(v31, l_ItemAnalyticsDataInterface_0, true);
        if not v33 then
            if v30 then
                v30(v34);
            else
                v25.dependencies.logger.reportError(v7.SduiErrorType.InvalidItemAnalyticsData, {
                    name = v29, 
                    message = v34
                }, v25.appPage);
            end;
            v31 = v2.Dictionary.join(v10, v31);
        end;
        return v31;
    end, 
    DUMMY_COLLECTION_DATA = v11, 
    DUMMY_ITEM_DATA = v10
};