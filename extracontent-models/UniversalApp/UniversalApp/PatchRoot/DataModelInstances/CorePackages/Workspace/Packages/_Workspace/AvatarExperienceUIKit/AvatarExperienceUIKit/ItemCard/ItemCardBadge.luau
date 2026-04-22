local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceUIKit").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Text_0 = v2.Text;
local l_useTokens_0 = v2.Hooks.useTokens;
local v5 = require(script.Parent.ItemCardIcon);
local v6 = game:DefineFastFlag("AXItemCardBadgeCheckText", false);
return function(v7) --[[ Line: 24 ]] --[[ Name: ItemCardBadge ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), v6 (copy), l_Text_0 (copy), v5 (copy)
    local v8 = l_useTokens_0();
    local v9 = {
        ItemCardBadgeCornerRadius = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }), 
        Border = if v7.displayBorder then v1.createElement("UIStroke", {
            Color = v8.Color.Stroke.Default.Color3, 
            Transparency = v8.Color.Stroke.Default.Transparency, 
            Thickness = v8.Stroke.Thick
        }) else nil, 
        ItemCardBadgeLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v8.Gap.XSmall)
        }), 
        ItemCardBadgePadding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v8.Padding.Small), 
            PaddingRight = UDim.new(0, v8.Padding.Small), 
            PaddingTop = UDim.new(0, v8.Padding.Small), 
            PaddingBottom = UDim.new(0, v8.Padding.Small)
        })
    };
    for v10, v11 in v7.content do
        if v11.type == "text" then
            if v6 then
                if v11.text ~= "" then
                    v9[v11.text .. tostring(v10)] = v1.createElement(l_Text_0, {
                        textStyle = v8.Color.Content.Emphasis, 
                        fontStyle = v8.Typography.TitleSmall, 
                        LayoutOrder = v10, 
                        Text = v11.text, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Size = UDim2.fromScale(0, 0), 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        TextTruncate = Enum.TextTruncate.AtEnd
                    });
                end;
            else
                v9[v11.text .. tostring(v10)] = v1.createElement(l_Text_0, {
                    textStyle = v8.Color.Content.Emphasis, 
                    fontStyle = v8.Typography.TitleSmall, 
                    LayoutOrder = v10, 
                    Text = v11.text, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Size = UDim2.fromScale(0, 0), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                });
            end;
        else
            v9[v11.icon .. tostring(v10)] = v1.createElement(v5, {
                icon = v11.icon, 
                LayoutOrder = v10
            });
        end;
    end;
    return v1.createElement("Frame", {
        BackgroundColor3 = v8.Color.OverMedia.OverMedia_100.Color3, 
        BackgroundTransparency = v8.Color.OverMedia.OverMedia_100.Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v7.LayoutOrder, 
        Size = UDim2.fromScale(0, 0), 
        AutomaticSize = Enum.AutomaticSize.XY
    }, v9);
end;