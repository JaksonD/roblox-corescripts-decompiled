local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsSchema);
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
return function(v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20) --[[ Line: 22 ]] --[[ Name: analyticsImpl ]]
    -- upvalues: v3 (copy), l_HttpService_0 (copy), v5 (copy), v4 (copy), l_ImpressionEnums_0 (copy)
    v3.isType(v8, "string", "openItemDetailPage event expects eventContext");
    v3.isType(v9, "number", "openItemDetailPage event expects pageNumber");
    v3.isType(v10, "string", "openItemDetailPage event expects categoryName");
    v3.isType(v11, "string", "openItemDetailPage event expects subCategoryName");
    v3.isTypeOrNil(v12, "string", "openItemDetailPage event expects sortType");
    v3.isTypeOrNil(v13, "table", "openItemDetailPage event expects filters");
    v3.isType(v14, "number", "openItemDetailPage event expects rank");
    v3.isType(v15, "string", "openItemDetailPage event expects itemId");
    v3.isType(v16, "string", "openItemDetailPage event expects itemType");
    v3.isTypeOrNil(v17, "string", "openItemDetailPage event expects itemSubType");
    v3.isTypeOrNil(v18, "boolean", "openItemDetailPage event expects fromProfile");
    v3.isTypeOrNil(v19, "string", "openItemDetailPage event expects requestId");
    local v21 = v13 and l_HttpService_0:JSONEncode(v13);
    local l_enumMap_0 = v5.defaultItem.enumMap;
    local v23 = if l_enumMap_0 and l_enumMap_0.contentType then l_enumMap_0.contentType[v16] else nil;
    v7:sendTelemetryEvent(v8, "marketplaceOrganicFELog", {
        feature = v18 and v4.ProfileAnalyticsTag or v4.AnalyticsTag, 
        page = v9, 
        actionType = l_ImpressionEnums_0.ActionType.ITEM_CLICK, 
        requestId = v19, 
        nav = v10, 
        subNav = v11, 
        sort = v20.sortEnumValue, 
        absPositions = v14, 
        itemId = v15, 
        contentType = v23, 
        assetType = if v23 == l_ImpressionEnums_0.MarketplaceItemType.ASSET then v17 else nil, 
        bundleType = if v23 == l_ImpressionEnums_0.MarketplaceItemType.BUNDLE then v17 else nil, 
        keyword = v13.keyword, 
        category = v10, 
        subcategory = v11, 
        filterSalesType = v20.filterSalesTypeEnumValue, 
        filterCreators = v20.filterCreatorsTypeEnumValue, 
        filterPrice = v20.filterPriceEnumValue, 
        filterUnavailableItems = v20.filterUnavailableItemsEnumValue, 
        filterCreatorsName = v20.filterCreatorsName, 
        filterPriceMin = v20.filterPriceMin, 
        filterPriceMax = v20.filterPriceMax
    });
    v7:sendTelemetryEvent(v8, "itemDetailReferral", {
        feature = v18 and v4.ProfileAnalyticsTag or v4.AnalyticsTag, 
        page = v9, 
        nav = v10, 
        subNav = v11, 
        sort = v12, 
        filters = v21, 
        rank = v14, 
        itemID = v15, 
        itemType = v16, 
        itemSubType = v17
    });
end;