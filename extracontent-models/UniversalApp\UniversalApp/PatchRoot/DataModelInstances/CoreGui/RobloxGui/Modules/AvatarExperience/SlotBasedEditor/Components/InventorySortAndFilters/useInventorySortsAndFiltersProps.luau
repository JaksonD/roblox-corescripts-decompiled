local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local l_InventorySorts_0 = v3.Enums.InventorySorts;
local l_useAvatarEditorStores_0 = v3.Context.useAvatarEditorStores;
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useCloseFiltersSignal);
local _ = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.InventorySortAndFilters.InventorySortAndFilters);
local l_FFlagAXAvatarEditorStoresContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarEditorStoresContext;
return function(v10) --[[ Line: 24 ]] --[[ Name: useInventorySortsAndFiltersProps ]]
    -- upvalues: l_FFlagAXAvatarEditorStoresContext_0 (copy), l_useAvatarEditorStores_0 (copy), l_useSignalState_0 (copy), v7 (copy), v2 (copy), l_InventorySorts_0 (copy)
    local v11 = nil;
    local v12 = nil;
    if l_FFlagAXAvatarEditorStoresContext_0 then
        local v13 = l_useAvatarEditorStores_0();
        v11 = v13.sortAndFiltersStore;
        v12 = v13.categoryInventoryStores;
    else
        local l_slotBasedEditorContext_0 = v10.slotBasedEditorContext;
        v11 = l_slotBasedEditorContext_0.sortAndFiltersStore;
        v12 = l_slotBasedEditorContext_0.categoryInventoryStores;
    end;
    local v15 = l_useSignalState_0(v11.getSortAndFilters);
    local v16 = v7();
    local v17, v18 = v2.useState(v15.sort);
    local v19 = v15.sort ~= v17;
    local v20 = v17 ~= l_InventorySorts_0.Newest;
    local v23 = v2.useCallback(function() --[[ Line: 44 ]]
        -- upvalues: v12 (ref), v11 (ref), v17 (copy), v16 (copy)
        for _, v22 in v12 do
            v22.startNewSearch();
        end;
        v11.applySortAndFilters({
            sort = v17
        });
        v16:fire();
    end, {
        v12, 
        v11.applySortAndFilters, 
        v17, 
        v16
    });
    local v24 = v2.useCallback(function() --[[ Line: 59 ]]
        -- upvalues: v18 (copy), l_InventorySorts_0 (ref)
        v18(l_InventorySorts_0.Newest);
    end, {});
    return {
        canApply = v19, 
        canReset = v20, 
        onApply = v23, 
        onReset = v24, 
        currentSort = v17, 
        setCurrentSort = v18, 
        closePeekViewSignal = v16
    };
end;