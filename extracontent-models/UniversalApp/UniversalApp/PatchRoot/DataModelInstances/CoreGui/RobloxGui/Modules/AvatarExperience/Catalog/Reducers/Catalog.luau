local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.BundleFavorites);
local v2 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.AssetFavorites);
local v3 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.Categories);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SearchCategories);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.MarketplaceFee);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.Sell);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.Topics);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.TopicsFetchTimes);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.UserAssets);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.ResellerCursor);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SortAndFilters);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SponsoredItems);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.Metadata);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.ResultsList);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.AvatarsTabSearchInfo);
return function(v16, v17) --[[ Line: 39 ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy), v4 (copy), v7 (copy), v8 (copy), v5 (copy), v6 (copy), v10 (copy), v9 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy)
    v16 = v16 or {};
    return {
        AssetFavorites = v2(v16.AssetFavorites, v17), 
        BundleFavorites = v1(v16.BundleFavorites, v17), 
        Categories = v3(v16.Categories, v17), 
        SearchCategories = v4(v16.SearchCategories, v17), 
        Topics = v7(v16.Topics, v17), 
        TopicsFetchTimes = v8(v16.TopicsFetchTimes, v17), 
        MarketplaceFee = v5(v16.MarketplaceFee, v17), 
        Sell = v6(v16.Sell, v17), 
        ResellerCursor = v10(v16.ResellerCursor, v17), 
        UserAssets = v9(v16.UserAssets, v17), 
        SortAndFilters = v11(v16.SortAndFilters, v17), 
        SponsoredItems = v12(v16.SponsoredItems, v17), 
        Metadata = v13(v16.Metadata, v17), 
        ResultsList = v14(v16.ResultsList, v17), 
        AvatarsTabSearchInfo = v15(v16.AvatarsTabSearchInfo, v17)
    };
end;