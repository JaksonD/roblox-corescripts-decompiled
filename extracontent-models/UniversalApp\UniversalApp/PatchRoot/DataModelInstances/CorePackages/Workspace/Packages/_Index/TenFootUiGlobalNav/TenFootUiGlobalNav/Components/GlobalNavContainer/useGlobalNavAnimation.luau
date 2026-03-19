local l_Parent_0 = script:FindFirstAncestor("TenFootUiGlobalNav").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactOtter);
local l_FocusNavigationContext_0 = require(l_Parent_0.ReactFocusNavigation).FocusNavigationContext;
local l_useDescendantHasFocus_0 = require(l_Parent_0.FocusNavigationUtils).useDescendantHasFocus;
local v5 = {
    stiffness = 711.1, 
    damping = 40, 
    mass = 1
};
return function(v6) --[[ Line: 15 ]] --[[ Name: useGlobalNavAnimation ]]
    -- upvalues: v1 (copy), l_FocusNavigationContext_0 (copy), l_useDescendantHasFocus_0 (copy), v2 (copy), v5 (copy)
    local v7, v8 = v1.useState(v6);
    local v9 = v1.useContext(l_FocusNavigationContext_0);
    local v10 = v1.useRef(nil);
    local v11 = l_useDescendantHasFocus_0(v10.current);
    local v13, v14 = v2.useAnimatedBinding(v7 and 0 or 1, function(v12) --[[ Line: 22 ]]
        -- upvalues: v8 (copy)
        if v12 == 1 then
            v8(false);
        end;
    end);
    v1.useEffect(function() --[[ Line: 29 ]]
        -- upvalues: v6 (copy), v8 (copy), v14 (copy), v2 (ref), v5 (ref)
        if v6 then
            v8(true);
            v14(v2.spring(0, v5));
            return;
        else
            v14(v2.spring(1, v5));
            return;
        end;
    end, {
        v6
    });
    v1.useEffect(function() --[[ Line: 38 ]]
        -- upvalues: v9 (copy), v6 (copy), v11 (copy)
        if v9 and not v6 and v11 then
            v9:focusGuiObject(nil, true);
        end;
    end, {
        v6, 
        v11
    });
    return {
        isVisible = v7, 
        transparency = v13, 
        ref = v10
    };
end;