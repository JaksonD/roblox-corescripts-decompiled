local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v4 = require(l_CorePackages_0.Packages.InputHandlers);
return function(v5, v6) --[[ Line: 15 ]] --[[ Name: useItemCardFocusNavigationBindings ]]
    -- upvalues: v1 (copy), l_FocusNavigationEventNameEnum_0 (copy), v4 (copy), v2 (copy)
    local v7 = v1.useMemo(function() --[[ Line: 16 ]]
        -- upvalues: v5 (copy), l_FocusNavigationEventNameEnum_0 (ref)
        return {
            [Enum.KeyCode.ButtonA] = if v5.onSlotEmote then l_FocusNavigationEventNameEnum_0.SlotEmote else if v5.onUnslotEmote then l_FocusNavigationEventNameEnum_0.UnslotEmote else l_FocusNavigationEventNameEnum_0.SelectItem, 
            [Enum.KeyCode.ButtonL3] = l_FocusNavigationEventNameEnum_0.OpenEditorDetailsPage
        };
    end, {
        v5.onSelectItem, 
        v5.onSlotEmote, 
        v5.onUnslotEmote
    });
    local v8 = v1.useMemo(function() --[[ Line: 27 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v5 (copy), v4 (ref)
        return {
            [l_FocusNavigationEventNameEnum_0.OpenEditorDetailsPage] = if v5.onOpenEditorDetailsPage then {
                handler = v4.onRelease(v5.onOpenEditorDetailsPage)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.SelectItem] = if v5.onSelectItem then {
                handler = v4.onRelease(v5.onSelectItem)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.SlotEmote] = if v5.onSlotEmote then {
                handler = v4.onRelease(v5.onSlotEmote)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.UnslotEmote] = if v5.onUnslotEmote then {
                handler = v4.onRelease(v5.onUnslotEmote)
            } else nil
        };
    end, {
        v5.onOpenEditorDetailsPage, 
        v5.onSelectItem, 
        v5.onSlotEmote, 
        v5.onUnslotEmote
    });
    local v9 = v2.useEventMap(v7, v6);
    return v2.useEventHandlerMap(v8, v9);
end;