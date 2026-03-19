local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v3 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v4 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v2.FocusNavigationEventNameEnum;
return function(v6, v7, v8) --[[ Line: 18 ]] --[[ Name: useManageOutfitPageFocusNavigationBindings ]]
    -- upvalues: v3 (copy), v1 (copy), l_FocusNavigationEventNameEnum_0 (copy), v4 (copy)
    local v9 = v3.useEventMap(v7, v6);
    local v15 = v1.useMemo(function() --[[ Line: 21 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v4 (ref), v8 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v4.onRelease(function(v10) --[[ Line: 24 ]]
                    -- upvalues: v8 (ref)
                    v10.cancelled = true;
                    v8.onGoBack();
                end)
            }, 
            [l_FocusNavigationEventNameEnum_0.ManageOutfitsToggleMultiSelect] = if v8.onToggleMultiselect then {
                handler = v4.onRelease(function(_) --[[ Line: 31 ]]
                    -- upvalues: v8 (ref)
                    v8.onToggleMultiselect();
                end)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.ManageOutfitsCancelMultiSelect] = if v8.onCancelMultiselect then {
                handler = v4.onRelease(function(_) --[[ Line: 38 ]]
                    -- upvalues: v8 (ref)
                    v8.onCancelMultiselect();
                end)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.ManageOutfitsDelete] = if v8.onDelete then {
                handler = v4.onRelease(function(_) --[[ Line: 45 ]]
                    -- upvalues: v8 (ref)
                    v8.onDelete();
                end)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.ManageOutfitsRename] = if v8.onRename then {
                handler = v4.onRelease(function(_) --[[ Line: 52 ]]
                    -- upvalues: v8 (ref)
                    v8.onRename();
                end)
            } else nil
        };
    end, {
        v8.onGoBack, 
        v8.onToggleMultiselect, 
        v8.onCancelMultiselect, 
        v8.onDelete, 
        v8.onRename
    });
    return v3.useEventHandlerMap(v15, v9);
end;