local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceUIKit").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Text_0 = v2.Text;
local l_useTokens_0 = v2.Hooks.useTokens;
local v5 = require(script.Parent.ItemCardIcon);
local l_FFlagAXDurablesSupport_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXDurablesSupport;
local v7 = game:DefineFastFlag("AXItemCardBadgeCheckText", false);
return function(v8) --[[ Line: 27 ]] --[[ Name: ItemCardBadge ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_FFlagAXDurablesSupport_0 (copy), v7 (copy), l_Text_0 (copy), v5 (copy)
    local v9 = l_useTokens_0();
    local v10 = {
        ItemCardBadgeCornerRadius = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }), 
        Border = if l_FFlagAXDurablesSupport_0 and v8.displayBorder then v1.createElement("UIStroke", {
            Color = v9.Color.Stroke.Default.Color3, 
            Transparency = v9.Color.Stroke.Default.Transparency, 
            Thickness = v9.Stroke.Thick
        }) else nil, 
        ItemCardBadgeLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v9.Gap.XSmall)
        }), 
        ItemCardBadgePadding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v9.Padding.Small), 
            PaddingRight = UDim.new(0, v9.Padding.Small), 
            PaddingTop = UDim.new(0, v9.Padding.Small), 
            PaddingBottom = UDim.new(0, v9.Padding.Small)
        })
    };
    for v11, v12 in v8.content do
        if v12.type == "text" then
            if v7 then
                if v12.text ~= "" then
                    v10[v12.text .. tostring(v11)] = v1.createElement(l_Text_0, {
                        textStyle = v9.Color.Content.Emphasis, 
                        fontStyle = v9.Typography.TitleSmall, 
                        LayoutOrder = v11, 
                        Text = v12.text, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Size = UDim2.fromScale(0, 0), 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        TextTruncate = Enum.TextTruncate.AtEnd
                    });
                end;
            else
                v10[v12.text .. tostring(v11)] = v1.createElement(l_Text_0, {
                    textStyle = v9.Color.Content.Emphasis, 
                    fontStyle = v9.Typography.TitleSmall, 
                    LayoutOrder = v11, 
                    Text = v12.text, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Size = UDim2.fromScale(0, 0), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                });
            end;
        else
            v10[v12.icon .. tostring(v11)] = v1.createElement(v5, {
                icon = v12.icon, 
                LayoutOrder = v11
            });
        end;
    end;
    return v1.createElement("Frame", {
        BackgroundColor3 = v9.Color.OverMedia.OverMedia_100.Color3, 
        BackgroundTransparency = v9.Color.OverMedia.OverMedia_100.Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v8.LayoutOrder, 
        Size = UDim2.fromScale(0, 0), 
        AutomaticSize = Enum.AutomaticSize.XY
    }, v10);
end;