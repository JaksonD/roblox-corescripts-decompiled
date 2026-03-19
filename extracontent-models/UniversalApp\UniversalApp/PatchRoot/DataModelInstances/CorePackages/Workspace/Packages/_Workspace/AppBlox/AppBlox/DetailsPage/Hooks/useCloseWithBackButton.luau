local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.InputHandlers);
local v2 = require(l_Parent_0.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v4 = require(l_Parent_0.React);
local v5 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
return function(v6, v7) --[[ Line: 15 ]] --[[ Name: useCloseWithBackButton ]]
    -- upvalues: v4 (copy), v1 (copy), v2 (copy), v5 (copy), l_FocusNavigationEventNameEnum_0 (copy)
    local v9 = v4.useMemo(function() --[[ Line: 16 ]]
        -- upvalues: v1 (ref), v7 (copy)
        return v1.onRelease(function(v8) --[[ Line: 17 ]]
            -- upvalues: v7 (ref)
            if v7 then
                v7();
                v8:cancel();
            end;
        end);
    end, {
        v7
    });
    local v10 = v2.useEventMap(v5, v6);
    return (v2.useEventHandler(l_FocusNavigationEventNameEnum_0.NavigateBack, v9, nil, v10));
end;