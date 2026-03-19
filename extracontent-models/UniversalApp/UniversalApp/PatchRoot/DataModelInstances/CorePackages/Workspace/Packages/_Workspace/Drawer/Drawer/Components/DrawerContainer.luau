local l_script_FirstAncestor_0 = script:FindFirstAncestor("Drawer");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ReactRoblox);
local v5 = require(script.Parent.Drawer);
local _ = require(script.Parent.Parent.Types);
return v3.memo(function(v7) --[[ Line: 9 ]]
    -- upvalues: v4 (copy), v3 (copy), v5 (copy), l_CoreGui_0 (copy)
    return v4.createPortal({
        Drawer = v3.createElement("ScreenGui", {
            ClipToDeviceSafeArea = false, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            DisplayOrder = v7.displayOrder, 
            IgnoreGuiInset = true, 
            ScreenInsets = Enum.ScreenInsets.None
        }, {
            DrawerContent = v3.createElement(v5, {
                menuWidth = v7.menuWidth, 
                topOffset = v7.topOffset, 
                backgroundColor = v7.backgroundColor, 
                backgroundTransparency = v7.backgroundTransparency, 
                children = v7.children, 
                onDrawerClosedAnalytics = v7.onDrawerClosedAnalytics
            })
        })
    }, l_CoreGui_0);
end);