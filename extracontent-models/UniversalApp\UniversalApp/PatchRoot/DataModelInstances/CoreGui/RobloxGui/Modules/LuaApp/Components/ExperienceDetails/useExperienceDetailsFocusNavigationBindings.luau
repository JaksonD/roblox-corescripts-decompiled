local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v3 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v5 = {
    [Enum.KeyCode.ButtonY] = l_FocusNavigationEventNameEnum_0.DisplayStatsAndInfo, 
    [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.Play
};
return function(v6, v7) --[[ Line: 16 ]] --[[ Name: useExperienceDetailsFocusNavigationBindings ]]
    -- upvalues: v1 (copy), l_FocusNavigationEventNameEnum_0 (copy), v3 (copy), v5 (copy), v2 (copy)
    local v8 = v1.useMemo(function() --[[ Line: 17 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v3 (ref), v6 (copy), v7 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.Play] = {
                handler = v3.onRelease(v6)
            }, 
            [l_FocusNavigationEventNameEnum_0.DisplayStatsAndInfo] = {
                handler = v3.onRelease(v7)
            }
        };
    end, {
        v6, 
        v7
    });
    local v9, v10 = v1.useState(true);
    local v11 = if v9 then v5 else {};
    local v12 = if v9 then v8 else {};
    local v13 = v1.useRef(nil);
    local v14 = v2.useEventMap(v11, v13);
    return v2.useEventHandlerMap(v12, v14), v10;
end;