local l_script_FirstAncestor_0 = script:FindFirstAncestor("App");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Core_0 = l_Parent_0.Core;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_1.Roact);
local v6 = require(l_Core_0.Control.Enum.ControlState);
local v7 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v8 = require(l_Core_0.Style.withStyle);
local v9 = require(l_Core_0.Button.getContentStyle);
local v10 = require(l_script_FirstAncestor_0.ImageSet.getIconSize);
local v11 = require(l_Parent_0.Core.ImageSet.ImageSetComponent);
local v12 = require(l_script_FirstAncestor_0.ImageSet.Enum.IconSize);
local v13 = require(l_Parent_0.Core.Style.Validator.validateFontInfo);
local v14 = require(l_Parent_0.Core.Style.Validator.validateTypographyInfo);
local v15 = require(l_Parent_0.Core.Style.Validator.validateColorInfo);
local v16 = v5.PureComponent:extend("PlayerContext");
local v17 = {
    [v6.Default] = "TextDefault"
};
local v18 = {
    [v6.Default] = "IconOnHover", 
    [v6.Hover] = "IconDefault"
};
v16.validateProps = v4.strictInterface({
    text = v4.optional(v4.string), 
    icon = v4.optional(v4.union(v4.string, v4.table)), 
    iconSize = v4.optional(v4.intersection(v4.UDim2, function(v19) --[[ Line: 33 ]] --[[ Name: doesNotUseScale ]]
        if v19.X.Scale ~= 0 or v19.Y.Scale ~= 0 then
            return false, "Only Offset values are allowed";
        else
            return true;
        end;
    end)), 
    iconColor = v4.optional(v4.Color3), 
    iconTransparency = v4.optional(v4.number), 
    onActivated = v4.optional(v4.callback), 
    Selectable = v4.optional(v4.boolean), 
    fontStyle = v4.optional(v4.union(v13, v14)), 
    textHeight = v4.optional(v4.number), 
    textColorStyle = v4.optional(v15), 
    iconPadding = v4.optional(v4.number), 
    iconTextSpacing = v4.optional(v4.number), 
    layoutOrder = v4.optional(v4.number), 
    horizontalAlignment = v4.optional(v4.EnumItem), 
    textXAlignment = v4.optional(v4.EnumItem)
});
v16.defaultProps = {
    text = "", 
    icon = nil, 
    Selectable = true, 
    iconSize = UDim2.fromOffset(v10(v12.Small), v10(v12.Small)), 
    textHeight = 28, 
    iconPadding = 4, 
    iconTextSpacing = 4, 
    layoutOrder = 1, 
    horizontalAlignment = Enum.HorizontalAlignment.Left, 
    textXAlignment = Enum.TextXAlignment.Left
};
v16.init = function(v20) --[[ Line: 87 ]] --[[ Name: init ]]
    v20.state = {};
end;
v16.render = function(v21) --[[ Line: 91 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v9 (copy), v18 (copy), v17 (copy), v5 (copy), v11 (copy), v7 (copy)
    local l_controlState_0 = v21.state.controlState;
    local l_text_0 = v21.props.text;
    local l_icon_0 = v21.props.icon;
    local l_iconSize_0 = v21.props.iconSize;
    local l_horizontalAlignment_0 = v21.props.horizontalAlignment;
    local l_onActivated_0 = v21.props.onActivated;
    return v8(function(v28) --[[ Line: 101 ]]
        -- upvalues: v9 (ref), v18 (ref), l_controlState_0 (copy), v17 (ref), l_onActivated_0 (copy), v21 (copy), l_iconSize_0 (copy), v5 (ref), l_horizontalAlignment_0 (copy), l_icon_0 (copy), v11 (ref), l_text_0 (copy), v7 (ref)
        local v29 = v9(v18, l_controlState_0, v28);
        local v30 = v9(v17, l_controlState_0, v28);
        local v31 = l_onActivated_0 and v29 or v30;
        local l_iconTransparency_0 = v21.props.iconTransparency;
        if not v21.props.iconTransparency then
            l_iconTransparency_0 = v21.props.iconColor and 0 or v31.Transparency;
        end;
        local l_iconColor_0 = v21.props.iconColor;
        if not v21.props.iconColor then
            l_iconColor_0 = v31.Color;
        end;
        local l_textHeight_0 = v21.props.textHeight;
        local v35 = v21.props.textColorStyle or if l_onActivated_0 then v29 else v30;
        local l_iconPadding_0 = v21.props.iconPadding;
        local l_iconTextSpacing_0 = v21.props.iconTextSpacing;
        local v38 = l_iconSize_0.X.Offset + l_iconPadding_0 * 2;
        local v39 = l_iconSize_0.Y.Offset + l_iconPadding_0 * 2;
        local v40 = v21.props.fontStyle or v28.Font.CaptionHeader;
        return v5.createElement("ImageButton", {
            Size = UDim2.new(1, 0, 0, l_textHeight_0), 
            BackgroundTransparency = 1, 
            Selectable = v21.props.Selectable, 
            Active = l_onActivated_0 and true or false, 
            LayoutOrder = v21.props.layoutOrder, 
            [v5.Event.Activated] = l_onActivated_0
        }, {
            UIListLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = l_horizontalAlignment_0, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, l_iconTextSpacing_0)
            }), 
            IconFrame = l_icon_0 and v5.createElement("Frame", {
                Size = UDim2.fromOffset(v38, v39), 
                BackgroundTransparency = 1
            }, {
                layout = v5.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                icon = v5.createElement(v11.Label, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Size = l_iconSize_0, 
                    BackgroundTransparency = 1, 
                    Image = l_icon_0, 
                    ImageColor3 = l_iconColor_0, 
                    ImageTransparency = l_iconTransparency_0
                })
            }), 
            Text = l_text_0 and v5.createElement(v7, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, if l_icon_0 then -(v38 + l_iconTextSpacing_0) else 0, 0, 0), 
                Text = l_text_0, 
                TextWrapped = true, 
                TextXAlignment = v21.props.textXAlignment, 
                fontStyle = v40, 
                colorStyle = v35, 
                LayoutOrder = 2, 
                TextTruncate = Enum.TextTruncate.AtEnd
            })
        });
    end);
end;
return v16;