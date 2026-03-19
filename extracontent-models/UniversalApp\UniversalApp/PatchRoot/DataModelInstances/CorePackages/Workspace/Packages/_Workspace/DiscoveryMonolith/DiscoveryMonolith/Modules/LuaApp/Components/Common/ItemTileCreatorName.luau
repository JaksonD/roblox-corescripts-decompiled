local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local v1 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v5 = require(l_Parent_0.VerifiedBadges);
local v6 = v1.PureComponent:extend("ItemTileCreatorName");
v6.defaultProps = {
    textYAlignment = Enum.TextYAlignment.Top
};
v6.render = function(v7) --[[ Line: 17 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy), l_Text_0 (copy), v1 (copy), v5 (copy)
    local l_name_0 = v7.props.name;
    local l_hasVerifiedBadge_0 = v7.props.hasVerifiedBadge;
    local l_textYAlignment_0 = v7.props.textYAlignment;
    return l_withStyle_0(function(v11) --[[ Line: 22 ]]
        -- upvalues: l_withLocalization_0 (ref), l_Text_0 (ref), v1 (ref), l_hasVerifiedBadge_0 (copy), l_name_0 (copy), l_textYAlignment_0 (copy), v5 (ref)
        local l_Theme_0 = v11.Theme;
        local l_Font_0 = v11.Font;
        local v14 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
        local v15 = v14 + v11.Tokens.Global.Size_100;
        return l_withLocalization_0({
            creatorByLabel = "Feature.GameDetails.Label.By"
        })(function(v16) --[[ Line: 30 ]]
            -- upvalues: l_Text_0 (ref), l_Font_0 (copy), v14 (copy), v1 (ref), l_hasVerifiedBadge_0 (ref), l_Theme_0 (copy), l_name_0 (ref), l_textYAlignment_0 (ref), v15 (copy), v5 (ref)
            local l_creatorByLabel_0 = v16.creatorByLabel;
            local v18 = l_Text_0.GetTextWidth(l_creatorByLabel_0, l_Font_0.Body.Font, v14);
            local v19 = v1.createElement("TextLabel", {
                Size = if l_hasVerifiedBadge_0 then UDim2.new(0, 0, 1, 0) else UDim2.new(1, -v18, 1, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                TextSize = v14, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                Font = l_Font_0.Header2.Font, 
                Text = l_name_0, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = l_textYAlignment_0
            }, {
                UITextSizeConstraint = v1.createElement("UITextSizeConstraint", {
                    MaxTextSize = v15
                })
            });
            return v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                ClipsDescendants = true
            }, {
                UIListLayout = v1.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, 6)
                }), 
                Label = v1.createElement("TextLabel", {
                    Size = UDim2.new(0, 0, 0, 0), 
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    TextSize = v14, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency, 
                    Font = l_Font_0.Header2.Font, 
                    Text = l_creatorByLabel_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = l_textYAlignment_0, 
                    AutomaticSize = Enum.AutomaticSize.XY
                }, {
                    UITextSizeConstraint = v1.createElement("UITextSizeConstraint", {
                        MaxTextSize = v15
                    })
                }), 
                CreatorName = not l_hasVerifiedBadge_0 and v19, 
                VerifiedCreatorName = l_hasVerifiedBadge_0 and v1.createElement(v5.EmojiWrapper, {
                    emoji = v5.emoji.verified, 
                    font = l_Font_0.Body.Font, 
                    size = UDim2.new(1, -v18, 0, 0), 
                    automaticSize = Enum.AutomaticSize.XY, 
                    horizontalAlignment = Enum.HorizontalAlignment.Left, 
                    verticalAlignment = Enum.VerticalAlignment.Center, 
                    layoutOrder = 2
                }, {
                    CreatorName = v19
                })
            });
        end);
    end);
end;
return v6;