local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local _ = require(l_Parent_0.FocusNavigation);
local v3 = require(script.Parent.FocusNavigationContext);
return function() --[[ Line: 16 ]] --[[ Name: useDispatchSyntheticEvent ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v4 = v1.useContext(v3);
    return (v1.useCallback(function(v5, v6, v7) --[[ Line: 20 ]]
        -- upvalues: v4 (copy)
        if not v4 then
            if _G.__DEV__ then
                warn("useDispatchSyntheticEvent: No FocusNavigationService available in context");
            end;
            return false;
        else
            assert(v6:IsA("GuiObject"), "Synthetic events must be dispatched on GuiObjects");
            return v4:dispatchSyntheticEvent(v5, v6, v7);
        end;
    end, {
        v4
    }));
end;