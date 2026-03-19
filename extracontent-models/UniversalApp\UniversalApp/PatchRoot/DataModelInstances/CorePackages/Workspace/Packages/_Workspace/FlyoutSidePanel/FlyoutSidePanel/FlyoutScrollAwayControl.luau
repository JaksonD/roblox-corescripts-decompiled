local l_Parent_0 = script:FindFirstAncestor("FlyoutSidePanel").Parent;
local v1 = require(l_Parent_0.Signals);
local l_VisibilityControl_0 = require(l_Parent_0.AppNavBar).VisibilityControl;
local l_GetDrawerVisibleStore_0 = require(l_Parent_0.Drawer).Stores.GetDrawerVisibleStore;
local v4 = {
    scrollAwayEnabled = false, 
    flyoutVisible = false, 
    contextualMenuVisible = false, 
    flyoutVisibleStore = nil, 
    disposeFlyoutVisibleEffect = nil
};
v4.__index = v4;
local v5 = nil;
v4.getInstance = function() --[[ Line: 40 ]] --[[ Name: getInstance ]]
    -- upvalues: v5 (ref), v4 (copy)
    if not v5 then
        v5 = {};
        setmetatable(v5, v4);
        v5:initialize();
    end;
    return v5;
end;
v4.initialize = function(v6) --[[ Line: 49 ]] --[[ Name: initialize ]]
    -- upvalues: l_GetDrawerVisibleStore_0 (copy), v1 (copy)
    v6.flyoutVisibleStore = l_GetDrawerVisibleStore_0(false);
    v6.disposeFlyoutVisibleEffect = v1.createEffect(function(v7) --[[ Line: 51 ]]
        -- upvalues: v6 (copy)
        v6.flyoutVisible = v6.flyoutVisibleStore.getDrawerVisible(v7);
        v6:updateScrollAwayState();
    end);
end;
v4.updateScrollAwayState = function(v8) --[[ Line: 58 ]] --[[ Name: updateScrollAwayState ]]
    -- upvalues: l_VisibilityControl_0 (copy)
    local v9 = v8.scrollAwayEnabled and not v8.flyoutVisible and not v8.contextualMenuVisible;
    l_VisibilityControl_0.setEnabled(v9);
end;
v4.setScrollAwayEnabled = function(v10, v11) --[[ Line: 63 ]] --[[ Name: setScrollAwayEnabled ]]
    v10.scrollAwayEnabled = v11;
    v10:updateScrollAwayState();
end;
v4.setContextualMenuVisible = function(v12, v13) --[[ Line: 68 ]] --[[ Name: setContextualMenuVisible ]]
    v12.contextualMenuVisible = v13;
    v12:updateScrollAwayState();
end;
return {
    setScrollAwayEnabled = function(v14) --[[ Line: 74 ]] --[[ Name: setScrollAwayEnabled ]]
        -- upvalues: v4 (copy)
        return v4.getInstance():setScrollAwayEnabled(v14);
    end, 
    setContextualMenuVisible = function(v15) --[[ Line: 77 ]] --[[ Name: setContextualMenuVisible ]]
        -- upvalues: v4 (copy)
        return v4.getInstance():setContextualMenuVisible(v15);
    end
};