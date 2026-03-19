local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceControlBar");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_script_FirstAncestor_0.Components.IconOnlyMenu);
local v6 = require(l_script_FirstAncestor_0.Components.IconTextMenu);
local l_ExternalEventConnection_0 = require(l_Parent_0.RoactUtils).ExternalEventConnection;
local _ = require(l_script_FirstAncestor_0.ControlBarTypes);
return v3.memo(function(v9) --[[ Line: 14 ]] --[[ Name: BaseControlBar ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy), v6 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy)
    local v10, v11 = v3.useBinding(UDim2.new(0, 0, 0, 0));
    return v3.createElement(v4.View, {
        tag = "no-clip", 
        Size = v10, 
        ref = v9.containerRef, 
        LayoutOrder = v9.LayoutOrder
    }, {
        MainMenu = v3.createElement(v5, {
            items = v9.menus, 
            activeItemId = v9.activeMenuItemId, 
            onItemActivated = v9.onMenuItemActivated, 
            ref = v9.iconMenuRef, 
            onAbsoluteSizeChanged = function(v12) --[[ Line: 27 ]] --[[ Name: onAbsoluteSizeChanged ]]
                -- upvalues: v11 (copy)
                v11(UDim2.fromOffset(v12.AbsoluteSize.X, v12.AbsoluteSize.Y));
            end
        }), 
        Submenu = if v9.submenuItems then v3.createElement(v6, {
            key = v9.activeMenuItemId, 
            items = v9.submenuItems, 
            onItemActivated = v9.onSubmenuItemActivated, 
            Position = v9.submenuPosition
        }) else nil, 
        OnInputEnded = v3.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.InputEnded, 
            callback = v9.onInputEnded
        })
    });
end);