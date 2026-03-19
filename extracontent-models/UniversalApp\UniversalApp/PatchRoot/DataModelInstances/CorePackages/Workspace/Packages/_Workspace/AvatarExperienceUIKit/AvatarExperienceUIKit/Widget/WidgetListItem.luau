local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceUIKit").Parent;
local v1 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v3 = require(l_Parent_0.RoactGamepad);
return (v1.forwardRef(function(v4, v5) --[[ Line: 27 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v1 (copy), v3 (copy)
    local v6 = v4.horizontalMargin or 0;
    local v7 = l_useDesignTokens_0();
    return v1.createElement(v3.Focusable.Frame, {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        ref = v5, 
        NextSelectionUp = v4.NextSelectionUp, 
        NextSelectionDown = v4.NextSelectionDown, 
        NextSelectionRight = v4.NextSelectionRight, 
        NextSelectionLeft = v4.NextSelectionLeft, 
        onFocusGained = v4.onFocusGained
    }, {
        GradientBackground = if v4.hasBackground then v1.createElement("Frame", {
            Size = UDim2.new(1, v6 * 2, 1, 0), 
            Position = UDim2.new(0, -v6, 0, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = Color3.new(1, 1, 1), 
            ZIndex = -1
        }, {
            Gradient = v1.createElement("UIGradient", {
                Rotation = 90, 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, v7.Semantic.Color.Background.Muted.Color3), 
                    ColorSequenceKeypoint.new(1, v7.Semantic.Color.Background.Default.Color3)
                })
            })
        }) else nil, 
        WidgetListItemPadding = if v4.padding then v1.createElement("UIPadding", {
            PaddingBottom = v4.padding.bottom, 
            PaddingTop = v4.padding.top, 
            PaddingRight = v4.padding.right, 
            PaddingLeft = v4.padding.left
        }) else nil, 
        Widget = v1.createElement(v1.Fragment, nil, v4.children)
    });
end));