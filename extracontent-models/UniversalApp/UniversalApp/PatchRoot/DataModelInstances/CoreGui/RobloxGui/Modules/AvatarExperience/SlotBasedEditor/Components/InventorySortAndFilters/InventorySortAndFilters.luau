local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_InventorySorts_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.InventorySorts;
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterSection);
local v7 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.RadioButtonGroup);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.FormPeekview);
return function(v10) --[[ Line: 35 ]] --[[ Name: InventorySortAndFilters ]]
    -- upvalues: l_useLocalization_0 (copy), l_InventorySorts_0 (copy), v2 (copy), v9 (copy), v6 (copy), v8 (copy), v7 (copy)
    local v11 = l_useLocalization_0({
        newest = "Feature.Avatar.Label.Newest", 
        recentlyWorn = "Feature.Avatar.Label.RecentlyWorn"
    });
    local v12 = {
        {
            text = v11.newest, 
            id = l_InventorySorts_0.Newest
        }, 
        {
            text = v11.recentlyWorn, 
            id = l_InventorySorts_0.RecentlyWorn
        }
    };
    return v2.createElement(v9, {
        canApply = v10.canApply, 
        canReset = v10.canReset, 
        onApply = v10.onApply, 
        onReset = v10.onReset, 
        closePeekViewSignal = v10.closePeekViewSignal, 
        totalSize = UDim2.fromScale(1, 0), 
        useAutomaticSize = true
    }, {
        SortsSection = v2.createElement(v6, {
            title = "Sort by", 
            Size = UDim2.fromScale(1, 0), 
            contentSize = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            RadioButtons = v2.createElement(v8, {
                items = v12, 
                itemHeight = v7.SortAndFiltersRowHeight, 
                selectedValue = v10.currentSort, 
                onActivated = v10.setCurrentSort
            })
        })
    });
end;