local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("ToastNotification").Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.AppShortcutBar);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_IconWithHoldAnimation_0 = v3.IconWithHoldAnimation;
return function(v6) --[[ Line: 21 ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), l_IconWithHoldAnimation_0 (copy), l_UserInputService_0 (copy)
    local v7 = l_useTokens_0();
    local v8 = v6.iconSize or v7.Size.Size_350;
    return v2.createElement("CanvasGroup", {
        Size = UDim2.fromOffset(v8, v8), 
        BackgroundTransparency = 1, 
        LayoutOrder = v6.layoutOrder, 
        Visible = v6.visible, 
        GroupTransparency = v6.iconTransparency
    }, {
        HoldIcon = v2.createElement(l_IconWithHoldAnimation_0, {
            size = UDim2.fromScale(1, 1), 
            icon = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonSelect), 
            iconSize = v8, 
            progress = v6.progress
        })
    });
end;