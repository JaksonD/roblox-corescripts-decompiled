local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactFocusNavigation);
local v3 = require(l_Parent_0.FocusNavigationUtils);
local v4 = require(l_Parent_0.InputHandlers);
local l_FFlagEnableConfirmSignifierOnSignUpPage_0 = require(l_Parent_0.SharedFlags).FFlagEnableConfirmSignifierOnSignUpPage;
local l_FocusNavigationEventNameEnum_0 = v3.FocusNavigationEventNameEnum;
local v7 = {
    [Enum.KeyCode.ButtonA] = l_FocusNavigationEventNameEnum_0.Confirm, 
    [Enum.KeyCode.Return] = l_FocusNavigationEventNameEnum_0.Confirm, 
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
return function(v8) --[[ Line: 20 ]] --[[ Name: useSignUpPageNavigationBindings ]]
    -- upvalues: v1 (copy), l_FFlagEnableConfirmSignifierOnSignUpPage_0 (copy), v2 (copy), v7 (copy), l_FocusNavigationEventNameEnum_0 (copy), v4 (copy)
    local v10 = v1.useCallback(function(v9) --[[ Line: 22 ]]
        -- upvalues: v8 (copy)
        v9:cancel();
        if v9.eventData and v9.eventData.KeyCode == Enum.KeyCode.Unknown then
            return;
        else
            if v8 then
                v8();
            end;
            return;
        end;
    end, if v8 then {
        v8
    } else {});
    if l_FFlagEnableConfirmSignifierOnSignUpPage_0 then
        local v11 = v2.useEventMap(v7);
        local v12 = v1.useMemo(function() --[[ Line: 35 ]]
            -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v10 (copy), v4 (ref)
            return {
                [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                    handler = v10
                }, 
                [l_FocusNavigationEventNameEnum_0.Confirm] = {
                    handler = v4.onRelease(function() --[[ Line: 41 ]]

                    end)
                }
            };
        end, {});
        return v2.useEventHandlerMap(v12, v11);
    else
        return (v2.useEventHandler(l_FocusNavigationEventNameEnum_0.NavigateBack, v10));
    end;
end;