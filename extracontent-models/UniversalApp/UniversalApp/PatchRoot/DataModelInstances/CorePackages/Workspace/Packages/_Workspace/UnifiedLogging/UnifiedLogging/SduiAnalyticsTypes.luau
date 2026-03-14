local l_Parent_0 = script:FindFirstAncestor("UnifiedLogging").Parent;
local v1 = require(l_Parent_0.t);
local v2 = {
    collectionId = v1.union(v1.number, v1.string), 
    contentType = v1.string, 
    itemsPerRow = v1.number, 
    collectionPosition = v1.number, 
    startRowNumber = v1.optional(v1.number), 
    totalNumberOfItems = v1.number
};
local v3 = {
    id = v1.union(v1.number, v1.string), 
    itemPosition = v1.optional(v1.number)
};
return {
    CollectionAnalyticsDataInterface = v2, 
    ItemAnalyticsDataInterface = v3
};