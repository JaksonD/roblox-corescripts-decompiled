local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = v1.PureComponent:extend("IconButton");
v2.render = function(v3) --[[ Line: 6 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_visible_0 = v3.props.visible;
    local l_anchorPoint_0 = v3.props.anchorPoint;
    local l_position_0 = v3.props.position;
    local l_size_0 = v3.props.size;
    local l_zIndex_0 = v3.props.zIndex;
    local l_onClick_0 = v3.props.onClick;
    local v10 = v3.props.iconHorizontalAlignment or Enum.HorizontalAlignment.Center;
    local v11 = v3.props.iconVerticalAlignment or Enum.VerticalAlignment.Center;
    local l_iconSpritePath_0 = v3.props.iconSpritePath;
    local l_iconSpriteFrame_0 = v3.props.iconSpriteFrame;
    local v14 = v3.props.horizontalInset or 12;
    local v15 = 0;
    local v16 = 1;
    if v10 == Enum.HorizontalAlignment.Center then
        v14 = 0;
    elseif v10 == Enum.HorizontalAlignment.Left then
        l_position_0 = UDim2.new(l_position_0.X.Scale, l_position_0.X.Offset - v14, l_position_0.Y.Scale, l_position_0.Y.Offset);
    elseif v10 == Enum.HorizontalAlignment.Right then
        l_position_0 = UDim2.new(l_position_0.X.Scale, l_position_0.X.Offset + v14, l_position_0.Y.Scale, l_position_0.Y.Offset);
        v15 = 1;
        v16 = 0;
    end;
    l_size_0 = UDim2.new(l_size_0.X.Scale, l_size_0.X.Offset + v14, l_size_0.Y.Scale, l_size_0.Y.Offset);
    return v1.createElement("ImageButton", {
        Visible = l_visible_0, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AnchorPoint = l_anchorPoint_0, 
        Position = l_position_0, 
        Size = l_size_0, 
        ZIndex = l_zIndex_0, 
        [v1.Event.Activated] = l_onClick_0
    }, {
        IconLayout = v1.createElement("UIListLayout", {
            HorizontalAlignment = v10, 
            VerticalAlignment = v11, 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Offset = v1.createElement("Frame", {
            BorderSizePixel = 0, 
            LayoutOrder = v15, 
            Size = UDim2.new(0, v14, 0, 0)
        }), 
        BackIcon = v1.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(0, l_iconSpriteFrame_0.size.X, 0, l_iconSpriteFrame_0.size.Y), 
            Image = l_iconSpritePath_0, 
            ImageRectOffset = l_iconSpriteFrame_0.offset, 
            ImageRectSize = l_iconSpriteFrame_0.size, 
            ZIndex = l_zIndex_0, 
            LayoutOrder = v16
        })
    });
end;
return v2;