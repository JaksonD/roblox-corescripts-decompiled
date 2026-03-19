local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v4 = require(l_CorePackages_0.Packages.InputHandlers);
local v5 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.ButtonStart] = l_FocusNavigationEventNameEnum_0.OpenQuickMenu, 
    [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.OpenBuyCatalogItemPrompt, 
    [Enum.KeyCode.ButtonL3] = l_FocusNavigationEventNameEnum_0.OpenCatalogContextMenu
};
return function(v6, v7) --[[ Line: 23 ]] --[[ Name: useAvatarEditorPageFocusNavigationBindings ]]
    -- upvalues: v1 (copy), l_FocusNavigationEventNameEnum_0 (copy), v4 (copy), v2 (copy), v5 (copy)
    local v8 = v1.useMemo(function() --[[ Line: 25 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v4 (ref), v6 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v4.onRelease(v6.onNavigateBack)
            }, 
            [l_FocusNavigationEventNameEnum_0.OpenBuyCatalogItemPrompt] = if v6.onOpenBuyItemPrompt then {
                handler = v4.onRelease(v6.onOpenBuyItemPrompt)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.OpenQuickMenu] = if v6.onOpenQuickMenu then {
                handler = v4.onRelease(v6.onOpenQuickMenu)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.OpenCatalogContextMenu] = if v6.onOpenContextMenu then {
                handler = v4.onRelease(v6.onOpenContextMenu)
            } else nil
        };
    end, {
        v6.onNavigateBack, 
        v6.onOpenBuyItemPrompt, 
        v6.onOpenQuickMenu, 
        v6.onOpenContextMenu
    });
    local v9 = v2.useEventMap(v5, v7);
    return v2.useEventHandlerMap(v8, v9);
end;