local l_Parent_0 = script:FindFirstAncestor("UserList").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RoactUtils);
local v3 = require(l_Parent_0.Foundation);
local l_useTopBarHeight_0 = require(l_Parent_0.RobloxAppHooks).useTopBarHeight;
local l_useSelector_0 = v2.Hooks.RoactRodux.useSelector;
local l_View_0 = v3.View;
local l_IconButton_0 = v3.IconButton;
return function(v8) --[[ Line: 20 ]]
    -- upvalues: l_useSelector_0 (copy), l_useTopBarHeight_0 (copy), v1 (copy), l_View_0 (copy), l_IconButton_0 (copy)
    local v10 = l_useSelector_0(function(v9) --[[ Line: 21 ]]
        return v9.TopBar.statusBarHeight;
    end);
    local v11 = l_useTopBarHeight_0();
    local v12 = v1.useCallback(function() --[[ Line: 26 ]]
        -- upvalues: v8 (copy)
        v8.navigateBack();
    end, {
        v8.navigateBack
    });
    return v1.createElement(l_View_0, {
        tag = "bg-surface-100", 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(0, 0, 0, v11), 
        Active = true, 
        BorderSizePixel = 0
    }, {
        LeftNavigationButton = v1.createElement(l_IconButton_0, {
            Position = UDim2.new(0, 15, 0, v10), 
            BackgroundTransparency = 1, 
            onActivated = v12, 
            icon = "icons/navigation/close"
        })
    });
end;