local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactFocusNavigation);
local v3 = require(l_Parent_0.FocusNavigationUtils);
local v4 = require(l_Parent_0.InputHandlers);
local l_useFocusNavigableSurfaceRegistryConnection_0 = v3.useFocusNavigableSurfaceRegistryConnection;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v3.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigationEventNameEnum_0 = v3.FocusNavigationEventNameEnum;
local v8 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
return function(v9, v10) --[[ Line: 17 ]] --[[ Name: useWearTimePopoverFocusNavigationBindings ]]
    -- upvalues: v1 (copy), l_useFocusNavigableSurfaceRegistryConnection_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v2 (copy), v8 (copy), l_FocusNavigationEventNameEnum_0 (copy), v4 (copy)
    local v11 = v1.useRef(nil);
    local v12, v13 = v1.useState(false);
    v1.useEffect(function() --[[ Line: 21 ]]
        -- upvalues: v13 (copy), v10 (copy)
        v13(v10);
    end, {
        v10
    });
    l_useFocusNavigableSurfaceRegistryConnection_0(v11 and v11.current, l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, v12);
    local v14 = v2.useEventMap(v8, v11);
    local v16 = v1.useMemo(function() --[[ Line: 33 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v4 (ref), v9 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v4.onRelease(function(v15) --[[ Line: 36 ]]
                    -- upvalues: v9 (ref)
                    v15.cancelled = true;
                    v9();
                end)
            }
        };
    end, {
        v9
    });
    return v2.useEventHandlerMap(v16, v14);
end;