local l_Parent_0 = script:FindFirstAncestor("FlyoutSidePanel").Parent;
local v1 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useSetDrawerVisible_0 = require(l_Parent_0.Drawer).Hooks.useSetDrawerVisible;
local l_GetDrawerVisibleStore_0 = require(l_Parent_0.Drawer).Stores.GetDrawerVisibleStore;
return function() --[[ Line: 9 ]] --[[ Name: useDismissFlyoutOnPartyTopBanner ]]
    -- upvalues: l_useSetDrawerVisible_0 (copy), l_useSelector_0 (copy), v1 (copy), l_GetDrawerVisibleStore_0 (copy)
    local v5 = l_useSetDrawerVisible_0();
    local v7 = l_useSelector_0(function(v6) --[[ Line: 12 ]]
        if v6.AppTopBanner then
            return v6.AppTopBanner.expanded;
        else
            return false;
        end;
    end);
    local v8 = v1.useRef(v7);
    v1.useEffect(function() --[[ Line: 18 ]]
        -- upvalues: l_GetDrawerVisibleStore_0 (ref), v8 (copy), v7 (copy), v5 (copy)
        if l_GetDrawerVisibleStore_0(false).getDrawerVisible() and v8.current and not v7 then
            v5(false);
        end;
        v8.current = v7;
    end, {
        v7, 
        v5
    });
end;