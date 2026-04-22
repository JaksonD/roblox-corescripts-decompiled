local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.UnavailableItemFilter);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SalesTypeFilter);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SortType);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SortAggregation);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.WearTimeFilter);
local l_FFlagAXHandleTaxonomyIdsDeepLinks_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXHandleTaxonomyIdsDeepLinks;
return v2.makeActionCreator(script.Name, function(v10) --[[ Line: 28 ]]
    -- upvalues: l_FFlagAXHandleTaxonomyIdsDeepLinks_0 (copy)
    return {
        creatorFilter = v10.creatorFilter, 
        priceRange = v10.priceRange, 
        salesTypeFilter = v10.salesTypeFilter, 
        unavailableItemFilter = v10.unavailableItemFilter, 
        sortType = v10.sortType, 
        sortAggregation = v10.sortAggregation, 
        category = v10.category, 
        subcategory = v10.subcategory, 
        topics = v10.topics, 
        wearTimeFilter = v10.wearTimeFilter, 
        taxonomy = if l_FFlagAXHandleTaxonomyIdsDeepLinks_0 then v10.taxonomy else nil
    };
end);