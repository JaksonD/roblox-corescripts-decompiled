local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local _ = require(l_Parent_0.FocusNavigation);
local v3 = require(script.Parent.FocusNavigationContext);
local v4 = require(script.Parent.useComposedRef);
local v5 = require(script.Parent.useEventLifecycleRef);
return function(v6, v7) --[[ Line: 12 ]] --[[ Name: useEventMap ]]
    -- upvalues: v1 (copy), v3 (copy), v5 (copy), v4 (copy)
    local v8 = v1.useContext(v3);
    local v10 = v1.useCallback(function(v9) --[[ Line: 15 ]]
        -- upvalues: v8 (copy), v6 (copy)
        if v8 then
            assert(v9:IsA("GuiObject"), "EventMaps can only be mapped to GuiObjects");
            v8:registerEventMap(v9, v6);
        end;
    end, {
        v8, 
        v6
    });
    local v12 = v1.useCallback(function(v11) --[[ Line: 22 ]]
        -- upvalues: v8 (copy), v6 (copy)
        if v8 then
            assert(v11:IsA("GuiObject"), "EventMaps can only be mapped to GuiObjects");
            v8:deregisterEventMap(v11, v6);
        end;
    end, {
        v8, 
        v6
    });
    local v13 = v5(v10, v12);
    return v4(v13, v7);
end;