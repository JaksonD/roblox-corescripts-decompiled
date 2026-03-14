local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Constants);
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsUtil);
local v5 = {};
local v11 = {
    __newindex = function(_, v7) --[[ Line: 18 ]] --[[ Name: __newindex ]]
        error("Attempt to insert into impressions schemas: " .. v7);
    end, 
    __index = function(v8, v9) --[[ Line: 22 ]] --[[ Name: __index ]]
        if not v9 then
            warn("Nil ImpressionsSchema lookup");
            return;
        else
            local v10 = rawget(v8, v9);
            if not v10 then
                warn("No such impressions schema: " .. v9);
            end;
            return v10;
        end;
    end
};
v5.defaultItem = v4.buildSchema(v2.ImpressionsEvents.AvatarItems, {
    enumMap = {
        contentType = {
            Asset = l_ImpressionEnums_0.MarketplaceItemType.ASSET, 
            Bundle = l_ImpressionEnums_0.MarketplaceItemType.BUNDLE, 
            Look = l_ImpressionEnums_0.MarketplaceItemType.LOOK
        }
    }, 
    surfaceSpecificAnalyticsMetadata = {
        [l_ImpressionEnums_0.MarketplaceSurfaceType.HOMEPAGE] = {
            {
                prop = "sortEnumValue", 
                out = "sort"
            }, 
            {
                prop = "filterSalesTypeEnumValue", 
                out = "filterSalesType"
            }, 
            {
                prop = "filterCreatorsTypeEnumValue", 
                out = "filterCreators"
            }, 
            {
                prop = "filterPriceEnumValue", 
                out = "filterPrice"
            }, 
            {
                prop = "filterUnavailableItemsEnumValue", 
                out = "filterUnavailableItems"
            }, 
            {
                prop = "filterCreatorsName", 
                out = "filterCreatorsName"
            }, 
            {
                prop = "filterPriceMin", 
                out = "filterPriceMin"
            }, 
            {
                prop = "filterPriceMax", 
                out = "filterPriceMax"
            }
        }, 
        [l_ImpressionEnums_0.MarketplaceSurfaceType.SEARCH] = {}, 
        [l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY] = {}
    }, 
    mapping = {
        {
            prop = "index", 
            out = "absPositions"
        }, 
        {
            prop = "itemId", 
            out = "itemId"
        }, 
        {
            prop = "itemType", 
            out = "contentType"
        }, 
        {
            prop = "impressionsGroup", 
            out = "group"
        }, 
        {
            prop = "impressionsSearch", 
            out = "keyword"
        }, 
        {
            prop = "impressionsCategory", 
            out = "category"
        }, 
        {
            prop = "impressionsSubcategory", 
            out = "subcategory"
        }, 
        {
            prop = "surface", 
            out = "surface"
        }, 
        {
            prop = "sort", 
            out = "sort"
        }
    }, 
    groupBy = {
        "itemId"
    }
});
setmetatable(v5, v11);
return v5;