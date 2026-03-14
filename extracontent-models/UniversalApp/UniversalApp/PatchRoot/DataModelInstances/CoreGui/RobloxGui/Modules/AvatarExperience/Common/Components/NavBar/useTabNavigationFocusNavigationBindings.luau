local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v4 = require(l_CorePackages_0.Packages.InputHandlers);
local v5 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.ButtonR1] = l_FocusNavigationEventNameEnum_0.TabForward, 
    [Enum.KeyCode.ButtonL1] = l_FocusNavigationEventNameEnum_0.TabBackward
};
return function(v6, v7) --[[ Line: 21 ]] --[[ Name: useTabNavigationFocusNavigationBindings ]]
    -- upvalues: v1 (copy), l_FocusNavigationEventNameEnum_0 (copy), v4 (copy), v2 (copy), v5 (copy)
    local v8 = v1.useMemo(function() --[[ Line: 23 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v4 (ref), v6 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v4.onRelease(v6.onNavigateBack)
            }, 
            [l_FocusNavigationEventNameEnum_0.TabForward] = {
                handler = v4.onRelease(v6.onTabForward)
            }, 
            [l_FocusNavigationEventNameEnum_0.TabBackward] = {
                handler = v4.onRelease(v6.onTabBackward)
            }
        };
    end, {
        v6.onNavigateBack, 
        v6.onTabForward, 
        v6.onTabBackward
    });
    local v9 = v2.useEventMap(v5, v7);
    return v2.useEventHandlerMap(v8, v9);
end;