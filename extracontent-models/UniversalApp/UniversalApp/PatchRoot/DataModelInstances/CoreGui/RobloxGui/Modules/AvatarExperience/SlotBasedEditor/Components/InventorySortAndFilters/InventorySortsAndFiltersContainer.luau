local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.InventorySortAndFilters.InventorySortAndFilters);
local v4 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.InventorySortAndFilters.useInventorySortsAndFiltersProps);
return v2.memo(function(v5) --[[ Line: 14 ]] --[[ Name: InventorySortsAndFiltersContainer ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    local v6 = v4(v5);
    return v2.createElement(v3, v6);
end);