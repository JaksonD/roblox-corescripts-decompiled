local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceUIKit").Parent;
local v1 = require(l_Parent_0.React);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local function v4(v3) --[[ Line: 15 ]] --[[ Name: CornerSlot ]]
    -- upvalues: v1 (copy)
    return v1.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        AnchorPoint = v3.AnchorPoint, 
        Position = v3.Position, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        ZIndex = v3.ZIndex
    }, v3.children);
end;
return function(v5) --[[ Line: 34 ]] --[[ Name: ItemCardHeaderCornersOverlay ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), v4 (copy)
    local l_Small_0 = l_useTokens_0().Gap.Small;
    return v1.createElement(v1.Fragment, nil, {
        ItemCardHeaderTopLeftSlot = if v5.topLeftSlot then v1.createElement(v4, {
            AnchorPoint = Vector2.new(0, 0), 
            Position = UDim2.fromOffset(l_Small_0, l_Small_0), 
            ZIndex = v5.ZIndex or 2
        }, v5.topLeftSlot) else nil, 
        ItemCardHeaderTopRightSlot = if v5.topRightSlot then v1.createElement(v4, {
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.new(1, -l_Small_0, 0, l_Small_0), 
            ZIndex = v5.ZIndex or 2
        }, v5.topRightSlot) else nil, 
        ItemCardHeaderBottomLeftSlot = if v5.bottomLeftSlot then v1.createElement(v4, {
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, l_Small_0, 1, -l_Small_0), 
            ZIndex = v5.ZIndex or 2
        }, v5.bottomLeftSlot) else nil, 
        ItemCardHeaderBottomRightSlot = if v5.bottomRightSlot then v1.createElement(v4, {
            AnchorPoint = Vector2.new(1, 1), 
            Position = UDim2.new(1, -l_Small_0, 1, -l_Small_0), 
            ZIndex = v5.ZIndex or 2
        }, v5.bottomRightSlot) else nil
    });
end;