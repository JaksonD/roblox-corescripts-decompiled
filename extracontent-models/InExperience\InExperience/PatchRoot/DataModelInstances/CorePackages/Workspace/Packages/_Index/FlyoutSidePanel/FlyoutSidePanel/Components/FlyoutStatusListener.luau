local l_Parent_0 = script:FindFirstAncestor("FlyoutSidePanel").Parent;
local v1 = require(l_Parent_0.React);
local l_useDrawerVisible_0 = require(l_Parent_0.Drawer).Hooks.useDrawerVisible;
return function(v3) --[[ Line: 11 ]] --[[ Name: FlyoutStatusListener ]]
    -- upvalues: l_useDrawerVisible_0 (copy), v1 (copy)
    local v4 = l_useDrawerVisible_0();
    v1.useEffect(function() --[[ Line: 13 ]]
        -- upvalues: v3 (copy), v4 (copy)
        if v3.onVisibleChanged then
            v3.onVisibleChanged(v4);
        end;
    end, {
        v4, 
        v3.onVisibleChanged
    });
    return nil;
end;