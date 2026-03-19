local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.Dash);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_ImageSetButton_0 = v2.Core.ImageSet.ImageSetButton;
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local l_IconSize_0 = v2.App.Constant.IconSize;
local l_Badge_0 = v2.App.Indicator.Badge;
local l_Colors_0 = v2.App.Style.Colors;
local l_useImpressionsTagger_0 = require(l_Parent_0.Impressions).useImpressionsTagger;
local v13 = {
    badgeValue = nil, 
    icon = "", 
    labelText = "", 
    onActivated = function() --[[ Line: 62 ]] --[[ Name: onActivated ]]

    end, 
    tileSize = 100, 
    iconSize = l_IconSize_0.Large, 
    borderThickness = 0, 
    cornerRadius = UDim.new(0, 8), 
    styleProps = {
        textXAlignment = Enum.TextXAlignment.Center, 
        containFooterInTileSize = false
    }
};
return function(v14) --[[ Line: 73 ]]
    -- upvalues: v3 (copy), v13 (copy), l_useStyle_0 (copy), l_Text_0 (copy), v1 (copy), l_useImpressionsTagger_0 (copy), l_ImageSetButton_0 (copy), l_ImageSetLabel_0 (copy), l_Colors_0 (copy), l_Badge_0 (copy), l_StyledTextLabel_0 (copy)
    local v15 = v3.join(v13, v14 or {});
    local v16 = l_useStyle_0();
    local l_Font_0 = v16.Font;
    local l_styleProps_0 = v15.styleProps;
    local v19 = if l_styleProps_0.font then l_styleProps_0.font else l_Font_0.CaptionHeader;
    local v20 = l_Font_0.BaseSize * v19.RelativeSize;
    local v21 = l_Text_0.GetTextHeight(v15.labelText, v19.Font, v20);
    local v22 = v15.tileSize - v15.borderThickness;
    local l_v22_0 = v22;
    if v15.styleProps.containFooterInTileSize then
        l_v22_0 = v22 - v21 * 2 - 8;
    end;
    local v24 = nil;
    if v15.impressionsTag then
        v24 = v1.useRef(nil);
        l_useImpressionsTagger_0(v24, v15.impressionsTag, v15.LayoutOrder);
    end;
    return v1.createElement("Frame", {
        LayoutOrder = v15.LayoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromOffset(l_v22_0, 0), 
        BackgroundTransparency = 1, 
        ref = v24
    }, {
        UIPadding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v15.borderThickness)
        }), 
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 8)
        }), 
        Tile = v1.createElement(l_ImageSetButton_0, {
            Size = UDim2.fromOffset(l_v22_0, l_v22_0), 
            BackgroundColor3 = v16.Theme.BackgroundUIDefault.Color, 
            BackgroundTransparency = v16.Theme.BackgroundUIDefault.Transparency, 
            [v1.Event.Activated] = v15.onActivated, 
            LayoutOrder = 1
        }, {
            UICorner = v1.createElement("UICorner", {
                CornerRadius = v15.cornerRadius
            }), 
            UIStroke = v1.createElement("UIStroke", {
                Color = v16.Theme.Divider.Color, 
                Transparency = v16.Theme.Divider.Transparency, 
                Thickness = v15.borderThickness
            }), 
            Icon = v1.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                ImageTransparency = v16.Theme.IconEmphasis.Transparency, 
                ImageColor3 = l_Colors_0.White, 
                Image = v15.icon, 
                Size = UDim2.fromOffset(v15.iconSize, v15.iconSize), 
                Position = UDim2.fromScale(0.5, 0.5)
            }), 
            Badge = v15.badgeValue and v1.createElement(l_Badge_0, {
                anchorPoint = Vector2.new(1, 0), 
                position = UDim2.fromOffset(v15.tileSize - 8, 8), 
                value = v15.badgeValue
            })
        }), 
        Label = v1.createElement(l_ImageSetButton_0, {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            [v1.Event.Activated] = v15.onActivated, 
            LayoutOrder = 2
        }, {
            Text = v1.createElement(l_StyledTextLabel_0, {
                text = v15.labelText, 
                fontStyle = v19, 
                colorStyle = v16.Theme.TextEmphasis, 
                size = UDim2.fromOffset(l_v22_0, v21 * 2), 
                textTruncate = Enum.TextTruncate.AtEnd, 
                textXAlignment = l_styleProps_0.textXAlignment, 
                textYAlignment = Enum.TextYAlignment.Top, 
                fluidSizing = false, 
                richText = false, 
                lineHeight = 1
            })
        })
    });
end;