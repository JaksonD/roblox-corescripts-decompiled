local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = v2.PureComponent:extend("NoticeText");
v3.defaultProps = {
    AnchorPoint = Vector2.new(0, 0), 
    Font = Enum.Font.Gotham, 
    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
    LayoutOrder = 1, 
    Position = UDim2.new(0, 0, 0, 0), 
    Text = "PLACEHOLDER Not everyone in this chat can see your message.", 
    TextColor3 = nil, 
    TextSize = 17, 
    TextTransparency = nil, 
    TextWrapped = true, 
    TextXAlignment = Enum.TextXAlignment.Left, 
    TextYAlignment = Enum.TextYAlignment.Top, 
    [v2.Change.AbsoluteSize] = function() --[[ Line: 22 ]]

    end, 
    margin = {
        top = 0, 
        left = 0, 
        right = 0, 
        bottom = 0
    }, 
    maxWidth = 0, 
    width = UDim.new(1, 0)
};
v3.render = function(v4) --[[ Line: 34 ]] --[[ Name: render ]]
    -- upvalues: l_TextService_0 (copy), v2 (copy)
    local v5 = math.max(0, v4.props.maxWidth - (v4.props.margin.left + v4.props.margin.right));
    local v6 = Vector2.new(v5, 1e999);
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v4.props.Text, v4.props.TextSize, v4.props.Font, v6);
    return v2.createElement("Frame", {
        AnchorPoint = v4.props.AnchorPoint, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v4.props.LayoutOrder, 
        Position = v4.props.Position, 
        [v2.Change.AbsoluteSize] = v4.props[v2.Change.AbsoluteSize], 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(v4.props.width, UDim.new(0, 0))
    }, {
        Layout = v2.createElement("UIListLayout", {
            HorizontalAlignment = v4.props.HorizontalAlignment
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, v4.props.margin.bottom), 
            PaddingRight = UDim.new(0, v4.props.margin.right), 
            PaddingLeft = UDim.new(0, v4.props.margin.left), 
            PaddingTop = UDim.new(0, v4.props.margin.top)
        }), 
        NoticeText = v2.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Font = v4.props.Font, 
            Text = v4.props.Text, 
            TextColor3 = v4.props.TextColor3, 
            TextSize = v4.props.TextSize, 
            TextTransparency = v4.props.TextTransparency, 
            TextWrapped = v4.props.TextWrapped, 
            TextXAlignment = v4.props.TextXAlignment, 
            TextYAlignment = v4.props.TextYAlignment, 
            Size = UDim2.fromOffset(math.ceil(l_l_TextService_0_TextSize_0.X), (math.ceil(l_l_TextService_0_TextSize_0.Y)))
        }, {
            SizeConstraint = v2.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v5, 1e999)
            })
        })
    });
end;
return v3;