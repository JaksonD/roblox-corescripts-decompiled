local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceUIKit").Parent;
local v1 = require(l_Parent_0.React);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
return function(v3) --[[ Line: 23 ]] --[[ Name: ItemCardAnimationStateIndicator ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy)
    local v4 = l_useTokens_0();
    local v5 = {
        TabsLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalFlex = Enum.UIFlexAlignment.Fill, 
            Padding = UDim.new(0, v4.Gap.XSmall)
        })
    };
    local v6 = nil;
    for v7, v8 in v3.states do
        local v9 = if v8.isSelected then v4.Color.Stroke.Emphasis else v4.Color.Stroke.Muted;
        v5[("%*-%*"):format(v7, v8.text)] = v1.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundColor3 = v9.Color3, 
            Transparency = v9.Transparency, 
            Size = UDim2.new(1, 0, 0, v4.Size.Size_150), 
            LayoutOrder = v7
        });
        if v8.isSelected then
            v6 = v8.text;
        end;
    end;
    return v1.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        ZIndex = v3.ZIndex
    }, {
        ListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        Padding = if not not v3.paddingTop or v3.paddingBottom or v3.paddingLeft or v3.paddingRight then v1.createElement("UIPadding", {
            PaddingTop = v3.paddingTop, 
            PaddingBottom = v3.paddingBottom, 
            PaddingLeft = v3.paddingLeft, 
            PaddingRight = v3.paddingRight
        }) else nil, 
        Tabs = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            BorderSizePixel = 0, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 1
        }, v5), 
        Label = if v6 then v1.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 0), 
            Text = v6, 
            Font = v4.Typography.TitleLarge.Font, 
            TextSize = v4.Typography.TitleLarge.FontSize, 
            TextColor3 = v4.Color.Content.Emphasis.Color3, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextWrapped = true, 
            LayoutOrder = 2
        }) else nil
    });
end;