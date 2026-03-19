local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v3 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v4 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v2.FocusNavigationEventNameEnum;
return function(v6, v7, v8) --[[ Line: 19 ]] --[[ Name: useItemDetailsFocusNavigationBindings ]]
    -- upvalues: v3 (copy), v1 (copy), l_FocusNavigationEventNameEnum_0 (copy), v4 (copy)
    local v9 = v3.useEventMap(v7, v6);
    local v16 = v1.useMemo(function() --[[ Line: 22 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v4 (ref), v8 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v4.onRelease(function(v10) --[[ Line: 25 ]]
                    -- upvalues: v8 (ref)
                    v10.cancelled = true;
                    v8.onGoBack();
                end)
            }, 
            [l_FocusNavigationEventNameEnum_0.OpenItemDetailsPrompt] = {
                handler = v4.onRelease(function(_) --[[ Line: 31 ]]
                    -- upvalues: v8 (ref)
                    v8.onOpenItemPrompt();
                end)
            }, 
            [l_FocusNavigationEventNameEnum_0.OpenItemDetailsPeekView] = if v8.onOpenPeekView then {
                handler = v4.onRelease(function(_) --[[ Line: 37 ]]
                    -- upvalues: v8 (ref)
                    v8.onOpenPeekView();
                end)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.CloseItemDetailsPeekView] = if v8.onClosePeekView then {
                handler = v4.onRelease(function(_) --[[ Line: 44 ]]
                    -- upvalues: v8 (ref)
                    v8.onClosePeekView();
                end)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.OpenCatalogContextMenu] = if v8.onOpenCatalogContextMenu then {
                handler = v4.onRelease(function(_) --[[ Line: 51 ]]
                    -- upvalues: v8 (ref)
                    v8.onOpenCatalogContextMenu();
                end)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.MoveToItemDetails] = if v8.onMoveToItemDetails then {
                handler = v4.onRelease(function(_) --[[ Line: 58 ]]
                    -- upvalues: v8 (ref)
                    v8.onMoveToItemDetails();
                end)
            } else nil
        };
    end, {
        v8.onGoBack, 
        v8.onOpenItemPrompt, 
        v8.onOpenPeekView, 
        v8.onClosePeekView, 
        v8.onOpenCatalogContextMenu, 
        v8.onMoveToItemDetails
    });
    return v3.useEventHandlerMap(v16, v9);
end;