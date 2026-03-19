local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.InputHandlers);
local v3 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigationEventNameEnum_0 = v3.FocusNavigationEventNameEnum;
local v5 = require(script.Parent.autoFocusNavigation);
return function(v6, v7, v8) --[[ Line: 13 ]] --[[ Name: isolatedAutoFocusNavigation ]]
    -- upvalues: v1 (copy), l_FocusNavigationEventNameEnum_0 (copy), v2 (copy), v3 (copy), v5 (copy)
    return function(v9) --[[ Line: 18 ]]
        -- upvalues: v1 (ref), l_FocusNavigationEventNameEnum_0 (ref), v2 (ref), v8 (copy), v3 (ref), v7 (copy), v5 (ref), v6 (copy)
        local v11 = v1.useMemo(function() --[[ Line: 19 ]]
            -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v2 (ref), v8 (ref), v9 (copy)
            return {
                [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                    handler = v2.onRelease(function(v10) --[[ Line: 22 ]]
                        -- upvalues: v8 (ref), v9 (ref)
                        if v8 then
                            v8(v9);
                            v10:cancel();
                        end;
                    end)
                }
            };
        end, {
            v8
        });
        return v1.createElement(v3.FocusNavigableSurfaceWrapper, {
            surfaceIdentifier = v7, 
            isIsolated = true, 
            shouldRestoreFocus = true, 
            isAutoFocusRoot = false, 
            isFocusable = true, 
            customEventHandlers = if v8 then v11 else nil
        }, {
            content = v1.createElement(v5(v6), v9)
        });
    end;
end;