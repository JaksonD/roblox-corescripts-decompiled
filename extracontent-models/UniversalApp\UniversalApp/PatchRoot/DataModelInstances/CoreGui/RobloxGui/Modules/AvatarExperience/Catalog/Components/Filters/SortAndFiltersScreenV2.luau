local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.CatalogSortAndFilters);
local v7 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.InventorySortAndFilters.InventorySortsAndFiltersContainer);
return function() --[[ Line: 28 ]] --[[ Name: SortAndFiltersScreen ]]
    -- upvalues: l_useNavigation_0 (copy), v3 (copy), v7 (copy), v6 (copy)
    local l_params_0 = l_useNavigation_0().state.params;
    if l_params_0.slotBasedEditorContext then
        return (v3.createElement(v7, {
            slotBasedEditorContext = l_params_0.slotBasedEditorContext
        }));
    else
        return (v3.createElement(v6));
    end;
end;