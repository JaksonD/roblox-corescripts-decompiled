local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_ItemTile_0 = v3.Tile.ItemTile;
local v6 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v7 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v8 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v6.FocusNavigationEventNameEnum;
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local function v20(v12, v13, v14, v15) --[[ Line: 23 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v7 (copy), v2 (copy), l_FocusNavigationEventNameEnum_0 (copy), v8 (copy)
    local v16 = v7.useEventMap(v12, v13);
    local v19 = v2.useMemo(function() --[[ Line: 25 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v8 (ref), v14 (copy), v15 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.SelectOutfit] = {
                handler = v8.onRelease(function(_) --[[ Line: 28 ]]
                    -- upvalues: v14 (ref)
                    v14();
                end)
            }, 
            [l_FocusNavigationEventNameEnum_0.UnselectOutfit] = {
                handler = v8.onRelease(function(_) --[[ Line: 33 ]]
                    -- upvalues: v15 (ref)
                    v15();
                end)
            }
        };
    end, {
        v14, 
        v15
    });
    return v7.useEventHandlerMap(v19, v16);
end;
return function(v21) --[[ Line: 42 ]]
    -- upvalues: v2 (copy), l_FocusNavigationEventNameEnum_0 (copy), v1 (copy), v20 (copy), l_useTableWrappedCallbackRef_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_ItemTile_0 (copy), l_Focusable_0 (copy)
    local v22 = v2.useMemo(function() --[[ Line: 43 ]]
        -- upvalues: v21 (copy), l_FocusNavigationEventNameEnum_0 (ref)
        return {
            [Enum.KeyCode.ButtonA] = if v21.isSelected then l_FocusNavigationEventNameEnum_0.UnselectOutfit else l_FocusNavigationEventNameEnum_0.SelectOutfit
        };
    end, {
        v21.isSelected
    });
    local v24 = v2.useCallback(function() --[[ Line: 52 ]]
        -- upvalues: v21 (copy), v1 (ref)
        if v21.multiSelect then
            local v23 = v1.List.join(v21.selectedOutfits, {
                v21.itemId
            });
            v21.selectionUpdated(v23);
            return;
        else
            v21.selectionUpdated({
                v21.itemId
            });
            if v21.onToggleOutfitCard then
                v21.onToggleOutfitCard(true, v21.itemId);
            end;
            return;
        end;
    end, {
        v21.multiSelect, 
        v21.selectedOutfits, 
        v21.itemId, 
        v21.selectionUpdated, 
        v21.onToggleOutfitCard
    });
    local v26 = v2.useCallback(function() --[[ Line: 67 ]]
        -- upvalues: v21 (copy), v1 (ref)
        if v21.multiSelect then
            local v25 = v1.List.removeValue(v21.selectedOutfits, v21.itemId);
            v21.selectionUpdated(v25);
            return;
        else
            v21.selectionUpdated({});
            if v21.onToggleOutfitCard then
                v21.onToggleOutfitCard(false);
            end;
            return;
        end;
    end, {
        v21.multiSelect, 
        v21.selectedOutfits, 
        v21.itemId, 
        v21.selectionUpdated, 
        v21.onToggleOutfitCard
    });
    local v27 = v20(v22, nil, v24, v26);
    local v28 = l_useTableWrappedCallbackRef_0(v27);
    return v2.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_ItemTile_0 else l_Focusable_0[l_ItemTile_0], {
        Selectable = l_FFlagAXMigrateAXToGlobalAutofocus_0 and true or nil, 
        isSelected = v21.isSelected, 
        multiSelect = v21.multiSelect, 
        itemIconType = v21.itemIconType, 
        onActivated = v21.toggleSelectOutfit, 
        name = v21.name, 
        titleTextLineCount = v21.titleTextLineCount, 
        thumbnail = v21.thumbnail, 
        ref = v28
    });
end;