local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_InventorySorts_0 = v3.Enums.InventorySorts;
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_InventoryFilters_0 = v3.Enums.InventoryFilters;
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterSection);
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.RadioButtonGroup);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.FormPeekview);
local l_FFlagAXInventoryDurablesExpiredFilter_0 = v4.FFlagAXInventoryDurablesExpiredFilter;
return function(v14) --[[ Line: 41 ]] --[[ Name: InventorySortAndFilters ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagAXInventoryDurablesExpiredFilter_0 (copy), l_InventorySorts_0 (copy), l_InventoryFilters_0 (copy), v2 (copy), v12 (copy), v9 (copy), v11 (copy), v10 (copy)
    local v15 = l_useLocalization_0({
        sortBy = l_FFlagAXInventoryDurablesExpiredFilter_0 and "Feature.Avatar.Heading.SortBy" or nil, 
        filter = l_FFlagAXInventoryDurablesExpiredFilter_0 and "Feature.Avatar.Heading.Filter" or nil, 
        newest = "Feature.Avatar.Label.Newest", 
        recentlyWorn = "Feature.Avatar.Label.RecentlyWorn", 
        activeItems = l_FFlagAXInventoryDurablesExpiredFilter_0 and "Feature.Avatar.Heading.Active" or nil, 
        expiredItems = l_FFlagAXInventoryDurablesExpiredFilter_0 and "Feature.Avatar.Heading.Expired" or nil
    });
    local v16 = {
        {
            text = v15.newest, 
            id = l_InventorySorts_0.Newest
        }, 
        {
            text = v15.recentlyWorn, 
            id = l_InventorySorts_0.RecentlyWorn
        }
    };
    local v17 = if l_FFlagAXInventoryDurablesExpiredFilter_0 then {
        {
            text = v15.activeItems, 
            id = l_InventoryFilters_0.Active
        }, 
        {
            text = v15.expiredItems, 
            id = l_InventoryFilters_0.Expired
        }
    } else nil;
    return v2.createElement(v12, {
        canApply = v14.canApply, 
        canReset = v14.canReset, 
        onApply = v14.onApply, 
        onReset = v14.onReset, 
        closePeekViewSignal = v14.closePeekViewSignal, 
        totalSize = UDim2.fromScale(1, 0), 
        useAutomaticSize = true
    }, {
        SortsSection = v2.createElement(v9, {
            title = if l_FFlagAXInventoryDurablesExpiredFilter_0 then v15.sortBy else "Sort by", 
            Size = UDim2.fromScale(1, 0), 
            contentSize = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            RadioButtons = v2.createElement(v11, {
                items = v16, 
                itemHeight = v10.SortAndFiltersRowHeight, 
                selectedValue = v14.currentSort, 
                onActivated = v14.setCurrentSort
            })
        }), 
        FiltersSection = if l_FFlagAXInventoryDurablesExpiredFilter_0 then v2.createElement(v9, {
            title = v15.filter, 
            Size = UDim2.fromScale(1, 0), 
            contentSize = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            RadioButtons = v2.createElement(v11, {
                items = v17, 
                itemHeight = v10.SortAndFiltersRowHeight, 
                selectedValue = v14.currentFilter, 
                onActivated = v14.setCurrentFilter
            })
        }) else nil
    });
end;