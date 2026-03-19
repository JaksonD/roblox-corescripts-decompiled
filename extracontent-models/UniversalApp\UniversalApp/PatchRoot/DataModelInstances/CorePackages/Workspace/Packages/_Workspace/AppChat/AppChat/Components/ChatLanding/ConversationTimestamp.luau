local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = v1.PureComponent:extend("ConversationTimestamp");
v2.defaultProps = {
    text = "TEST", 
    textSize = 24, 
    textWidth = 32, 
    paddingX = 0, 
    paddingY = 0, 
    currentStyle = nil
};
v2.render = function(v3) --[[ Line: 17 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_textSize_0 = v3.props.textSize;
    local l_textWidth_0 = v3.props.textWidth;
    local l_currentStyle_0 = v3.props.currentStyle;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = 1
    }, {
        layout = v1.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        padding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v3.props.paddingY), 
            PaddingRight = UDim.new(0, v3.props.paddingX)
        }), 
        timestamp = v1.createElement("TextLabel", {
            TextXAlignment = Enum.TextXAlignment.Right, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, l_textWidth_0, 0, l_textSize_0), 
            Text = v3.props.text, 
            TextSize = l_textSize_0, 
            Font = l_currentStyle_0.Font.Body.Font, 
            TextColor3 = l_currentStyle_0.Theme.TextDefault.Color, 
            TextTransparency = l_currentStyle_0.Theme.TextDefault.Transparency
        })
    });
end;
return v2;