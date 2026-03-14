local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local v3 = v1.PureComponent:extend("FitFrameVertical");
v3.defaultProps = {
    AnchorPoint = Vector2.new(0, 0), 
    Position = UDim2.new(0, 0, 0, 0), 
    width = UDim.new(0, 0), 
    contentPadding = UDim.new(0, 0), 
    FillDirection = Enum.FillDirection.Vertical, 
    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
    VerticalAlignment = Enum.VerticalAlignment.Top, 
    marginTop = 0, 
    marginBottom = 0, 
    marginLeft = 0, 
    marginRight = 0
};
v3.init = function(v4) --[[ Line: 22 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v4.layoutRef = v1.createRef();
    v4.frameRef = v1.createRef();
    v4.onResize = function() --[[ Line: 26 ]]
        -- upvalues: v4 (copy)
        local l_current_0 = v4.layoutRef.current;
        local l_current_1 = v4.frameRef.current;
        if not l_current_1 or not l_current_0 then
            return;
        else
            local l_width_0 = v4.props.width;
            local l_Y_0 = l_current_0.AbsoluteContentSize.Y;
            l_current_1.Size = UDim2.new(l_width_0, UDim.new(0, l_Y_0 + v4.props.marginTop + v4.props.marginBottom));
            return;
        end;
    end;
end;
v3.render = function(v9) --[[ Line: 41 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Immutable_0 (copy)
    local l_BackgroundColor3_0 = v9.props.BackgroundColor3;
    local v11 = v9.props[v1.Children] or {};
    local l_width_1 = v9.props.width;
    local l_HorizontalAlignment_0 = v9.props.HorizontalAlignment;
    local l_BackgroundTransparency_0 = v9.props.BackgroundTransparency;
    local l_contentPadding_0 = v9.props.contentPadding;
    local l_LayoutOrder_0 = v9.props.LayoutOrder;
    local l_FillDirection_0 = v9.props.FillDirection;
    local l_VerticalAlignment_0 = v9.props.VerticalAlignment;
    local v19 = 0;
    if v9.layoutRef.current then
        v19 = v9.layoutRef.current.AbsoluteContentSize.Y;
    end;
    return v1.createElement("Frame", {
        AnchorPoint = v9.props.AnchorPoint, 
        Position = v9.props.Position, 
        BackgroundColor3 = l_BackgroundColor3_0, 
        BackgroundTransparency = l_BackgroundTransparency_0, 
        Size = UDim2.new(l_width_1.Scale, l_width_1.Offset, 0, v19), 
        LayoutOrder = l_LayoutOrder_0, 
        [v1.Ref] = v9.frameRef, 
        Visible = v9.props.Visible, 
        BorderSizePixel = 0
    }, l_Immutable_0.JoinDictionaries(v11, {
        layout = v1.createElement("UIListLayout", {
            Padding = l_contentPadding_0, 
            FillDirection = l_FillDirection_0, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = l_HorizontalAlignment_0, 
            VerticalAlignment = l_VerticalAlignment_0, 
            [v1.Ref] = v9.layoutRef, 
            [v1.Change.AbsoluteContentSize] = v9.onResize
        }), 
        padding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v9.props.marginLeft), 
            PaddingRight = UDim.new(0, v9.props.marginRight), 
            PaddingTop = UDim.new(0, v9.props.marginTop), 
            PaddingBottom = UDim.new(0, v9.props.marginBottom)
        })
    }));
end;
v3.didMount = function(v20) --[[ Line: 90 ]] --[[ Name: didMount ]]
    v20.onResize();
end;
v3.didUpdate = function(v21) --[[ Line: 94 ]] --[[ Name: didUpdate ]]
    v21.onResize();
end;
return v3;