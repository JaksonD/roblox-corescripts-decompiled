local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_InventorySorts_0 = v3.Enums.InventorySorts;
local l_InventoryFilters_0 = v3.Enums.InventoryFilters;
local l_useAvatarEditorStores_0 = v3.Context.useAvatarEditorStores;
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useCloseFiltersSignal);
local _ = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.InventorySortAndFilters.InventorySortAndFilters);
local l_FFlagAXAvatarEditorStoresContext_0 = v4.FFlagAXAvatarEditorStoresContext;
local l_FFlagAXInventoryDurablesExpiredFilter_0 = v4.FFlagAXInventoryDurablesExpiredFilter;
return function(v13) --[[ Line: 27 ]] --[[ Name: useInventorySortsAndFiltersProps ]]
    -- upvalues: l_FFlagAXAvatarEditorStoresContext_0 (copy), l_useAvatarEditorStores_0 (copy), l_useSignalState_0 (copy), v9 (copy), v2 (copy), l_FFlagAXInventoryDurablesExpiredFilter_0 (copy), l_InventorySorts_0 (copy), l_InventoryFilters_0 (copy)
    local v14 = nil;
    local v15 = nil;
    if l_FFlagAXAvatarEditorStoresContext_0 then
        local v16 = l_useAvatarEditorStores_0();
        v14 = v16.sortAndFiltersStore;
        v15 = v16.categoryInventoryStores;
    else
        local l_slotBasedEditorContext_0 = v13.slotBasedEditorContext;
        v14 = l_slotBasedEditorContext_0.sortAndFiltersStore;
        v15 = l_slotBasedEditorContext_0.categoryInventoryStores;
    end;
    local v18 = l_useSignalState_0(v14.getSortAndFilters);
    local v19 = v9();
    local v20, v21 = v2.useState(v18.sort);
    local v22 = nil;
    local v23 = nil;
    if l_FFlagAXInventoryDurablesExpiredFilter_0 then
        local v24, v25 = v2.useState(v18.filter);
        v22 = v24;
        v23 = v25;
    end;
    local v26 = if l_FFlagAXInventoryDurablesExpiredFilter_0 then v18.sort ~= v20 or v18.filter ~= v22 else v18.sort ~= v20;
    local v27 = if l_FFlagAXInventoryDurablesExpiredFilter_0 then v20 ~= l_InventorySorts_0.Newest or v22 ~= l_InventoryFilters_0.Active else v20 ~= l_InventorySorts_0.Newest;
    local v30 = v2.useCallback(function() --[[ Line: 57 ]]
        -- upvalues: v15 (ref), v14 (ref), v20 (copy), l_FFlagAXInventoryDurablesExpiredFilter_0 (ref), v22 (ref), v19 (copy)
        for _, v29 in v15 do
            v29.startNewSearch();
        end;
        v14.applySortAndFilters({
            sort = v20, 
            filter = if l_FFlagAXInventoryDurablesExpiredFilter_0 then v22 else nil
        });
        v19:fire();
    end, {
        v15, 
        v14.applySortAndFilters, 
        v20, 
        if l_FFlagAXInventoryDurablesExpiredFilter_0 then v22 else nil, 
        v19
    });
    local v31 = v2.useCallback(function() --[[ Line: 79 ]]
        -- upvalues: v21 (copy), l_InventorySorts_0 (ref), l_FFlagAXInventoryDurablesExpiredFilter_0 (ref), v23 (ref), l_InventoryFilters_0 (ref)
        v21(l_InventorySorts_0.Newest);
        if l_FFlagAXInventoryDurablesExpiredFilter_0 then
            v23(l_InventoryFilters_0.Active);
        end;
    end, {});
    return {
        canApply = v26, 
        canReset = v27, 
        onApply = v30, 
        onReset = v31, 
        currentSort = v20, 
        setCurrentSort = v21, 
        currentFilter = if l_FFlagAXInventoryDurablesExpiredFilter_0 then v22 else nil, 
        setCurrentFilter = if l_FFlagAXInventoryDurablesExpiredFilter_0 then v23 else nil, 
        closePeekViewSignal = v19
    };
end;