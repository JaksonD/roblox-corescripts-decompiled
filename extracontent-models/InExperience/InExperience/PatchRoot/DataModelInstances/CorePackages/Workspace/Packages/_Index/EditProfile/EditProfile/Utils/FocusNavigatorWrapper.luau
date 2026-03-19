local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.InputHandlers);
local v3 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceWrapper_0 = v3.FocusNavigableSurfaceWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v3.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigationEventNameEnum_0 = v3.FocusNavigationEventNameEnum;
return function(v7, v8) --[[ Line: 14 ]] --[[ Name: FocusNavigatorWrapper ]]
    -- upvalues: v1 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v2 (copy)
    return v1.createElement(l_FocusNavigableSurfaceWrapper_0, {
        surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
        isIsolated = true, 
        customEventHandlers = {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v2.onRelease(function(v9) --[[ Line: 20 ]]
                    -- upvalues: v7 (copy)
                    v7.onClose();
                    v9:cancel();
                end)
            }
        }
    }, v8);
end;