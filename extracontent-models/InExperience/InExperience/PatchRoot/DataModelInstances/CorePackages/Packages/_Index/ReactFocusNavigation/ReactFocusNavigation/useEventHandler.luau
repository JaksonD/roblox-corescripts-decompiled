local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local _ = require(l_Parent_0.FocusNavigation);
local v3 = require(script.Parent.FocusNavigationContext);
local v4 = require(script.Parent.useComposedRef);
local v5 = require(script.Parent.useEventLifecycleRef);
return function(v6, v7, v8, v9) --[[ Line: 14 ]] --[[ Name: useEventHandler ]]
    -- upvalues: v1 (copy), v3 (copy), v5 (copy), v4 (copy)
    local v10 = v1.useContext(v3);
    local v12 = v1.useCallback(function(v11) --[[ Line: 17 ]]
        -- upvalues: v10 (copy), v6 (copy), v7 (copy), v8 (copy)
        if v10 then
            assert(v11:IsA("GuiObject"), "Event handlers can only be applied to GuiObjects");
            v10:registerEventHandler(v11, v6, v7, v8);
        end;
    end, {
        v10, 
        v6, 
        v7, 
        v8
    });
    local v14 = v1.useCallback(function(v13) --[[ Line: 24 ]]
        -- upvalues: v10 (copy), v6 (copy), v7 (copy), v8 (copy)
        if v10 then
            assert(v13:IsA("GuiObject"), "Event handlers can only be applied to GuiObjects");
            v10:deregisterEventHandler(v13, v6, v7, v8);
        end;
    end, {
        v10, 
        v6, 
        v7, 
        v8
    });
    local v15 = v5(v12, v14);
    return v4(v15, v9);
end;