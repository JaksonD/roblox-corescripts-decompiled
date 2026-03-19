local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v4 = require(l_CorePackages_0.Packages.InputHandlers);
local v5 = {
    [Enum.KeyCode.ButtonA] = l_FocusNavigationEventNameEnum_0.SelectItem, 
    [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.OpenItemDetailsPage
};
return function(v6, v7) --[[ Line: 18 ]] --[[ Name: usePPEEmoteItemTileBindings ]]
    -- upvalues: v1 (copy), l_FocusNavigationEventNameEnum_0 (copy), v4 (copy), v2 (copy), v5 (copy)
    local v8 = v1.useMemo(function() --[[ Line: 20 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v4 (ref), v6 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.SelectItem] = {
                handler = v4.onRelease(v6.onSelectItem)
            }, 
            [l_FocusNavigationEventNameEnum_0.OpenItemDetailsPage] = if v6.onOpenItemDetailsPage then {
                handler = v4.onRelease(v6.onOpenItemDetailsPage)
            } else nil
        };
    end, {
        v6.onSelectItem, 
        v6.onOpenItemDetailsPage
    });
    local v9 = v2.useEventMap(v5, v7);
    return v2.useEventHandlerMap(v8, v9);
end;