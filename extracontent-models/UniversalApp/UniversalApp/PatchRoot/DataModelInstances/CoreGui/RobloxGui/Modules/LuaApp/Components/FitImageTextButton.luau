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
local l_game_EngineFeature_0 = game:GetEngineFeature("TextBoundsRoundUp");
local v16 = v3.PureComponent:extend("FitImageTextButton");
v16.defaultProps = {
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
v16.getImageButtonAndTextWidth = function(v17) --[[ Line: 64 ]] --[[ Name: getImageButtonAndTextWidth ]]
    -- upvalues: v4 (copy), l_Center_0 (copy), l_game_EngineFeature_0 (copy)
    local l_maxWidth_0 = v17.props.maxWidth;
    local l_minWidth_0 = v17.props.minWidth;
    local l_text_0 = v17.props.text;
    local l_textFont_0 = v17.props.textFont;
    local l_textSize_0 = v17.props.textSize;
    local l_horizontalPadding_0 = v17.props.horizontalPadding;
    local v24 = v17.props.leftIcon and true;
    local v25 = v4.GetTextWidth(l_text_0, l_textFont_0, l_textSize_0);
    local l_l_Center_0_0 = l_Center_0;
    if not l_game_EngineFeature_0 then
        v25 = v25 - 2;
    end;
    local v27 = v25 + 2 * l_horizontalPadding_0;
    if v24 then
        v27 = v27 + v17.props.iconRightPadding + v17.props.iconSize;
    end;
    if l_maxWidth_0 < v27 then
        l_l_Center_0_0 = Enum.HorizontalAlignment.Left;
    end;
    return math.max(l_minWidth_0, (math.min(v27, l_maxWidth_0))), v25, l_l_Center_0_0;
end;
v16.render = function(v28) --[[ Line: 95 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagPeopleListContextualMenuFixFocusNavigation_0 (copy), v3 (copy), v6 (copy), v7 (copy)
    local l_backgroundImage_0 = v28.props.backgroundImage;
    local l_backgroundColor_0 = v28.props.backgroundColor;
    local l_backgroundTransparency_0 = v28.props.backgroundTransparency;
    local l_height_0 = v28.props.height;
    local l_horizontalPadding_1 = v28.props.horizontalPadding;
    local l_verticalPadding_0 = v28.props.verticalPadding;
    local l_iconRightPadding_0 = v28.props.iconRightPadding;
    local l_iconSize_0 = v28.props.iconSize;
    local l_iconColor_0 = v28.props.iconColor;
    local l_layoutOrder_0 = v28.props.layoutOrder;
    local l_leftIcon_0 = v28.props.leftIcon;
    local l_onActivated_0 = v28.props.onActivated;
    local l_text_1 = v28.props.text;
    local l_textColor_0 = v28.props.textColor;
    local l_textTransparency_0 = v28.props.textTransparency;
    local l_textFont_1 = v28.props.textFont;
    local l_textSize_1 = v28.props.textSize;
    local l_sliceCenter_0 = v28.props.sliceCenter;
    local l_scaleType_0 = v28.props.scaleType;
    local v48 = l_leftIcon_0 and true;
    local l_anchorPoint_0 = v28.props.anchorPoint;
    local l_position_0 = v28.props.position;
    local v51 = if l_FFlagPeopleListContextualMenuFixFocusNavigation_0 then v28.props.selectionOrder else nil;
    local v52, v53, v54 = v28:getImageButtonAndTextWidth();
    local l_forwardRef_0 = v28.props.forwardRef;
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
        Size = UDim2.new(0, v52, 0, l_height_0), 
        AnchorPoint = l_anchorPoint_0, 
        Position = l_position_0, 
        SelectionOrder = if l_FFlagPeopleListContextualMenuFixFocusNavigation_0 then v51 else nil, 
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
            HorizontalAlignment = v54, 
            Padding = UDim.new(0, v48 and l_iconRightPadding_0 or 0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        LeftIcon = v48 and v3.createElement(v7, {
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
            Size = UDim2.new(0, v53, 1, 0), 
            Text = l_text_1, 
            TextColor3 = l_textColor_0, 
            TextTransparency = l_textTransparency_0, 
            TextSize = l_textSize_1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    });
end;
return v3.forwardRef(function(v56, v57) --[[ Line: 181 ]]
    -- upvalues: v3 (copy), v16 (copy), v2 (copy)
    return v3.createElement(v16, v2.Dictionary.join(v56, {
        forwardRef = v57
    }));
end);