local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(script.Parent.Parent.Immutable);
local v3 = require(script.Parent.Parent.Constants);
local l_LineWidth_0 = v3.GeneralFormatting.LineWidth;
local l_LineColor_0 = v3.GeneralFormatting.LineColor;
local l_ArrowWidth_0 = v3.GeneralFormatting.ArrowWidth;
local l_RightArrow_0 = v3.Image.RightArrow;
local l_DownArrow_0 = v3.Image.DownArrow;
local v9 = v1.Component:extend("BannerButton");
v9.render = function(v10) --[[ Line: 14 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_DownArrow_0 (copy), l_RightArrow_0 (copy), l_ArrowWidth_0 (copy), l_LineWidth_0 (copy), l_LineColor_0 (copy), v2 (copy)
    local v11 = v10.props[v1.Children] or {};
    local l_size_0 = v10.props.size;
    local l_pos_0 = v10.props.pos;
    local l_isExpandable_0 = v10.props.isExpandable;
    local l_isExpanded_0 = v10.props.isExpanded;
    local l_layoutOrder_0 = v10.props.layoutOrder;
    local v17 = v10.props.inset or 0;
    local l_onButtonPress_0 = v10.props.onButtonPress;
    local l_onMouseEnter_0 = v10.props.onMouseEnter;
    local l_onMouseLeave_0 = v10.props.onMouseLeave;
    local l_onMouseMove_0 = v10.props.onMouseMove;
    local l_onMouse2Click_0 = v10.props.onMouse2Click;
    local v23 = {
        BannerButtonArrow = l_onButtonPress_0 and v1.createElement("ImageLabel", {
            Visible = l_isExpandable_0, 
            Image = l_isExpanded_0 and l_DownArrow_0 or l_RightArrow_0, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, l_ArrowWidth_0, 0, l_ArrowWidth_0), 
            Position = UDim2.new(0, v17, 0.5, -l_ArrowWidth_0 / 2)
        }), 
        HorizontalLineTop = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        }), 
        HorizontalLineBottom = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
            Position = UDim2.new(0, 0, 1, -l_LineWidth_0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        })
    };
    return v1.createElement("ImageButton", {
        Size = l_size_0, 
        Position = l_pos_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0, 
        [v1.Event.Activated] = l_onButtonPress_0, 
        [v1.Event.MouseEnter] = l_onMouseEnter_0, 
        [v1.Event.MouseLeave] = l_onMouseLeave_0, 
        [v1.Event.MouseMoved] = l_onMouseMove_0, 
        [v1.Event.MouseButton2Click] = l_onMouse2Click_0
    }, v2.JoinDictionaries(v23, v11));
end;
return v9;