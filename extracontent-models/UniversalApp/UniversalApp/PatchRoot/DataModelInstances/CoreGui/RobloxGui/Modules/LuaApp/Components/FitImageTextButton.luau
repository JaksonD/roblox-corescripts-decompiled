local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.Common.Text);
local v5 = require(l_Modules_0.LuaApp.Constants);
local v6 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v7 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local l_FFlagPeopleListContextualMenuFixFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagPeopleListContextualMenuFixFocusNavigation;
local l_WHITE_0 = v5.Color.WHITE;
local l_SourceSans_0 = Enum.Font.SourceSans;
local l_GREEN_PRIMARY_0 = v5.Color.GREEN_PRIMARY;
local l_Center_0 = Enum.HorizontalAlignment.Center;
local v13 = Rect.new(3, 3, 4, 4);
local l_Slice_0 = Enum.ScaleType.Slice;
local v15 = v3.PureComponent:extend("FitImageTextButton");
v15.defaultProps = {
    backgroundColor = l_GREEN_PRIMARY_0, 
    height = 32, 
    iconRightPadding = 3, 
    iconSize = 16, 
    layoutOrder = 0, 
    text = "", 
    textColor = l_WHITE_0, 
    textFont = l_SourceSans_0, 
    textSize = 20, 
    horizontalPadding = 7, 
    verticalPadding = 0, 
    maxWidth = 0, 
    minWidth = 1000, 
    scaleType = l_Slice_0, 
    sliceCenter = v13, 
    anchorPoint = Vector2.new(0, 0), 
    position = UDim2.new(0, 0, 0, 0)
};
v15.getImageButtonAndTextWidth = function(v16) --[[ Line: 62 ]] --[[ Name: getImageButtonAndTextWidth ]]
    -- upvalues: v4 (copy), l_Center_0 (copy)
    local l_maxWidth_0 = v16.props.maxWidth;
    local l_minWidth_0 = v16.props.minWidth;
    local l_text_0 = v16.props.text;
    local l_textFont_0 = v16.props.textFont;
    local l_textSize_0 = v16.props.textSize;
    local l_horizontalPadding_0 = v16.props.horizontalPadding;
    local v23 = v16.props.leftIcon and true;
    local v24 = v4.GetTextWidth(l_text_0, l_textFont_0, l_textSize_0);
    local l_l_Center_0_0 = l_Center_0;
    v24 = v24 - 2;
    local v26 = v24 + 2 * l_horizontalPadding_0;
    if v23 then
        v26 = v26 + v16.props.iconRightPadding + v16.props.iconSize;
    end;
    if l_maxWidth_0 < v26 then
        l_l_Center_0_0 = Enum.HorizontalAlignment.Left;
    end;
    return math.max(l_minWidth_0, (math.min(v26, l_maxWidth_0))), v24, l_l_Center_0_0;
end;
v15.render = function(v27) --[[ Line: 91 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagPeopleListContextualMenuFixFocusNavigation_0 (copy), v3 (copy), v6 (copy), v7 (copy)
    local l_backgroundImage_0 = v27.props.backgroundImage;
    local l_backgroundColor_0 = v27.props.backgroundColor;
    local l_backgroundTransparency_0 = v27.props.backgroundTransparency;
    local l_height_0 = v27.props.height;
    local l_horizontalPadding_1 = v27.props.horizontalPadding;
    local l_verticalPadding_0 = v27.props.verticalPadding;
    local l_iconRightPadding_0 = v27.props.iconRightPadding;
    local l_iconSize_0 = v27.props.iconSize;
    local l_iconColor_0 = v27.props.iconColor;
    local l_layoutOrder_0 = v27.props.layoutOrder;
    local l_leftIcon_0 = v27.props.leftIcon;
    local l_onActivated_0 = v27.props.onActivated;
    local l_text_1 = v27.props.text;
    local l_textColor_0 = v27.props.textColor;
    local l_textTransparency_0 = v27.props.textTransparency;
    local l_textFont_1 = v27.props.textFont;
    local l_textSize_1 = v27.props.textSize;
    local l_sliceCenter_0 = v27.props.sliceCenter;
    local l_scaleType_0 = v27.props.scaleType;
    local v47 = l_leftIcon_0 and true;
    local l_anchorPoint_0 = v27.props.anchorPoint;
    local l_position_0 = v27.props.position;
    local v50 = if l_FFlagPeopleListContextualMenuFixFocusNavigation_0 then v27.props.selectionOrder else nil;
    local v51, v52, v53 = v27:getImageButtonAndTextWidth();
    local l_forwardRef_0 = v27.props.forwardRef;
    return v3.createElement(v6, {
        AutoButtonColor = false, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Image = l_backgroundImage_0, 
        ImageColor3 = l_backgroundColor_0, 
        ImageTransparency = l_backgroundTransparency_0, 
        LayoutOrder = l_layoutOrder_0, 
        ScaleType = l_scaleType_0, 
        SliceCenter = l_sliceCenter_0, 
        Size = UDim2.new(0, v51, 0, l_height_0), 
        AnchorPoint = l_anchorPoint_0, 
        Position = l_position_0, 
        SelectionOrder = if l_FFlagPeopleListContextualMenuFixFocusNavigation_0 then v50 else nil, 
        [v3.Event.Activated] = l_onActivated_0, 
        [v3.Ref] = l_forwardRef_0
    }, {
        Padding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_horizontalPadding_1), 
            PaddingRight = UDim.new(0, l_horizontalPadding_1), 
            PaddingTop = UDim.new(0, l_verticalPadding_0), 
            PaddingBottom = UDim.new(0, l_verticalPadding_0)
        }), 
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = v53, 
            Padding = UDim.new(0, v47 and l_iconRightPadding_0 or 0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        LeftIcon = v47 and v3.createElement(v7, {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = l_leftIcon_0, 
            LayoutOrder = 1, 
            ScaleType = Enum.ScaleType.Fit, 
            Size = UDim2.new(0, l_iconSize_0, 0, l_iconSize_0), 
            ImageColor3 = l_iconColor_0
        }), 
        Text = v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = l_textFont_1, 
            LayoutOrder = 2, 
            Size = UDim2.new(0, v52, 1, 0), 
            Text = l_text_1, 
            TextColor3 = l_textColor_0, 
            TextTransparency = l_textTransparency_0, 
            TextSize = l_textSize_1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    });
end;
return v3.forwardRef(function(v55, v56) --[[ Line: 177 ]]
    -- upvalues: v3 (copy), v15 (copy), v2 (copy)
    return v3.createElement(v15, v2.Dictionary.join(v55, {
        forwardRef = v56
    }));
end);