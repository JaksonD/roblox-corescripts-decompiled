local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v4 = require(l_CorePackages_0.Packages.InputHandlers);
local v5 = require(script.Parent.useOpenQuickMenuCallback);
local v6 = require(script.Parent.useQuickMenuAvailable);
local v7 = {
    [Enum.KeyCode.ButtonStart] = l_FocusNavigationEventNameEnum_0.OpenQuickMenu
};
return function(v8, v9) --[[ Line: 18 ]] --[[ Name: useAvatarExperienceFocusNavigationBindings ]]
    -- upvalues: v6 (copy), v5 (copy), v1 (copy), l_FocusNavigationEventNameEnum_0 (copy), v4 (copy), v2 (copy), v7 (copy)
    local v10 = v6();
    local v11 = v5(v8.overlayClosedCallback);
    local v12 = v1.useMemo(function() --[[ Line: 21 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v10 (copy), v4 (ref), v11 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.OpenQuickMenu] = {
                handler = if v10 then v4.onRelease(v11) else nil
            }
        };
    end, {
        v8
    });
    local v13 = v2.useEventMap(v7, v9);
    return v2.useEventHandlerMap(v12, v13);
end;