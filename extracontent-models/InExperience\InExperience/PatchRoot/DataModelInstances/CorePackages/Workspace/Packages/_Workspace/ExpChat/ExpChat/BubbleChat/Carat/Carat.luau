local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.React);
return function(v2) --[[ Line: 10 ]] --[[ Name: Carat ]]
    -- upvalues: v1 (copy)
    local l_chatSettings_0 = v2.chatSettings;
    return v1.createElement("ImageLabel", {
        LayoutOrder = v2.layoutOrder, 
        AnchorPoint = Vector2.new(0.5, 0), 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0.5, 0, 1, -1), 
        Size = UDim2.fromOffset(12, 8), 
        Image = "rbxasset://textures/ui/InGameChat/Caret.png", 
        ImageColor3 = l_chatSettings_0.BackgroundColor3, 
        ImageTransparency = l_chatSettings_0.BackgroundTransparency
    }, {
        CaratGradient = l_chatSettings_0.UIGradient and v1.createElement("UIGradient", l_chatSettings_0.UIGradient)
    });
end;