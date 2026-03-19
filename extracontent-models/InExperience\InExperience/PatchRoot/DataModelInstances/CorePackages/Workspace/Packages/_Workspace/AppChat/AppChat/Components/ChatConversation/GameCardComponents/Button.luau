local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = v1.PureComponent:extend("Button");
v2.defaultProps = {
    color = Color3.new(0.9, 0.9, 0.9), 
    transparency = 0, 
    textSize = 12, 
    textColor = Color3.new(0.1, 0.1, 0.1), 
    font = Enum.Font.Gotham, 
    text = "", 
    LayoutOrder = 0, 
    onActivated = function() --[[ Line: 17 ]] --[[ Name: onActivated ]]
        print("Game card button activated!");
    end
};
v2.render = function(v3) --[[ Line: 22 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local v4 = v1.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        Image = "rbxasset://textures/ui/LuaChat/9-slice/input-default.png", 
        ImageColor3 = v3.props.color, 
        ImageTransparency = v3.props.transparency, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(3, 3, 4, 4), 
        [v1.Event.Activated] = v3.props.onActivated
    }, {
        layout = v1.createElement("UIListLayout", {
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        actionLabel = v1.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0.8, 0, 0.8, 0), 
            TextSize = v3.props.textSize, 
            TextColor3 = v3.props.textColor, 
            Font = v3.props.font, 
            Text = v3.props.text or ""
        })
    });
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 32), 
        LayoutOrder = v3.props.LayoutOrder or 0
    }, {
        layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        actionButton = v4
    });
end;
return v2;