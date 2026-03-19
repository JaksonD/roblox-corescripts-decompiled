local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.UnavailableItemFilter);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SalesTypeFilter);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SortType);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SortAggregation);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.WearTimeFilter);
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXDurablesSupport_0 = v9.FFlagAXDurablesSupport;
local l_FFlagAXHandleTaxonomyIdsDeepLinks_0 = v9.FFlagAXHandleTaxonomyIdsDeepLinks;
return v2.makeActionCreator(script.Name, function(v12) --[[ Line: 29 ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXHandleTaxonomyIdsDeepLinks_0 (copy)
    return {
        creatorFilter = v12.creatorFilter, 
        priceRange = v12.priceRange, 
        salesTypeFilter = v12.salesTypeFilter, 
        unavailableItemFilter = v12.unavailableItemFilter, 
        sortType = v12.sortType, 
        sortAggregation = v12.sortAggregation, 
        category = v12.category, 
        subcategory = v12.subcategory, 
        topics = v12.topics, 
        wearTimeFilter = if l_FFlagAXDurablesSupport_0 then v12.wearTimeFilter else nil, 
        taxonomy = if l_FFlagAXHandleTaxonomyIdsDeepLinks_0 then v12.taxonomy else nil
    };
end);