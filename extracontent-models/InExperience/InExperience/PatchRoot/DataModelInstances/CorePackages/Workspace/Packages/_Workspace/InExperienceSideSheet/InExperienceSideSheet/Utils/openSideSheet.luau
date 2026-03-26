local l_Parent_0 = script:FindFirstAncestor("InExperienceSideSheet").Parent;
local l_GetDrawerVisibleStore_0 = require(l_Parent_0.Drawer).Stores.GetDrawerVisibleStore;
return function() --[[ Line: 6 ]]
    -- upvalues: l_GetDrawerVisibleStore_0 (copy)
    l_GetDrawerVisibleStore_0(false).setDrawerVisible(true);
end;