local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v4 = require(l_CorePackages_0.Packages.InputHandlers);
local v5 = {
    [Enum.KeyCode.ButtonL2] = l_FocusNavigationEventNameEnum_0.ItemDetailsMoveToTop, 
    [Enum.KeyCode.ButtonR2] = l_FocusNavigationEventNameEnum_0.ItemDetailsMoveToRecItems
};
return function(v6, v7) --[[ Line: 18 ]] --[[ Name: useItemDetailsContainerFocusNavigationBindings ]]
    -- upvalues: v2 (copy), v5 (copy), v1 (copy), l_FocusNavigationEventNameEnum_0 (copy), v4 (copy)
    local v8 = v2.useEventMap(v5, v6);
    local v9 = v1.useMemo(function() --[[ Line: 20 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v4 (ref), v7 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.ItemDetailsMoveToTop] = {
                handler = v4.onRelease(v7.onMoveToTop)
            }, 
            [l_FocusNavigationEventNameEnum_0.ItemDetailsMoveToRecItems] = {
                handler = v4.onRelease(v7.onMoveToRecItems)
            }
        };
    end, {
        v7.onMoveToTop, 
        v7.onMoveToRecItems
    });
    return v2.useEventHandlerMap(v9, v8);
end;