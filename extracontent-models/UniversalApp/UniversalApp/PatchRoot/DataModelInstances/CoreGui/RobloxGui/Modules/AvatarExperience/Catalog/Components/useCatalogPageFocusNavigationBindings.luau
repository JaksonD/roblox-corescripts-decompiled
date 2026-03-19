local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v4 = require(l_CorePackages_0.Packages.InputHandlers);
return function(v5, v6, v7) --[[ Line: 17 ]] --[[ Name: useCatalogPageFocusNavigationBindings ]]
    -- upvalues: v1 (copy), l_FocusNavigationEventNameEnum_0 (copy), v4 (copy), v2 (copy)
    local v8 = v1.useMemo(function() --[[ Line: 19 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v6 (copy), v4 (ref)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = if v6.onNavigateBack then {
                handler = v4.onRelease(v6.onNavigateBack)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.OpenBuyCatalogItemPrompt] = if v6.onOpenBuyItemPrompt then {
                handler = v4.onRelease(v6.onOpenBuyItemPrompt)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.OpenQuickMenu] = if v6.onOpenQuickMenu then {
                handler = v4.onRelease(v6.onOpenQuickMenu)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.OpenCatalogContextMenu] = if v6.onOpenContextMenu then {
                handler = v4.onRelease(v6.onOpenContextMenu)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.ToggleTryOnManager] = if v6.onToggleTryOnManager then {
                handler = v4.onRelease(v6.onToggleTryOnManager)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.Search] = if v6.onToggleSearch then {
                handler = v4.onRelease(v6.onToggleSearch)
            } else nil
        };
    end, {
        v6.onNavigateBack, 
        v6.onOpenBuyItemPrompt, 
        v6.onOpenQuickMenu, 
        v6.onOpenContextMenu, 
        v6.onToggleTryOnManager, 
        v6.onToggleSearch
    });
    local v9 = v2.useEventMap(v5, v7);
    return v2.useEventHandlerMap(v8, v9);
end;