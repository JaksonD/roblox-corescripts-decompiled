local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.React);
local l_ImageSetLabel_0 = require(l_Parent_0.UIBlox).Core.ImageSet.ImageSetLabel;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
return function(v4) --[[ Line: 23 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v1 (copy), l_ImageSetLabel_0 (copy)
    local v5 = l_useDesignTokens_0();
    local v6 = v4.padding or v5.Global.Space_50;
    local v7 = v4.iconSize or 18;
    local l_Font_0 = v5.Semantic.Typography.Body.Font;
    local l_FontSize_75_0 = v5.Global.FontSize_75;
    local l_Default_0 = v5.Semantic.Color.Text.Default;
    local l_Font_1 = v5.Semantic.Typography.Subheader.Font;
    local l_FontSize_0 = v5.Semantic.Typography.Subheader.FontSize;
    local l_Emphasis_0 = v5.Semantic.Color.Text.Emphasis;
    local v14 = v1.createElement("TextLabel", {
        LayoutOrder = 2, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Text = v4.bodyText, 
        Font = l_Font_1, 
        TextSize = l_FontSize_0, 
        TextColor3 = l_Emphasis_0.Color3, 
        TextTransparency = l_Emphasis_0.Transparency, 
        BackgroundTransparency = 1, 
        TextYAlignment = Enum.TextYAlignment.Center
    });
    return v1.createElement("TextButton", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        TextTransparency = 1, 
        Text = "", 
        BackgroundTransparency = 1, 
        LayoutOrder = v4.LayoutOrder, 
        [v1.Event.Activated] = v4.onActivated
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v6)
        }), 
        Header = v1.createElement("TextLabel", {
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = v4.headerText, 
            Font = l_Font_0, 
            TextSize = l_FontSize_75_0, 
            TextColor3 = l_Default_0.Color3, 
            TextTransparency = l_Default_0.Transparency, 
            BackgroundTransparency = 1, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        Body = if v4.icon then v1.createElement("Frame", {
            LayoutOrder = 2, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            BodyLayout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, v5.Global.Space_50)
            }), 
            Icon = v1.createElement(l_ImageSetLabel_0, {
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(v7, v7), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Image = v4.icon, 
                ImageColor3 = l_Emphasis_0.Color3, 
                ImageTransparency = l_Emphasis_0.Transparency
            }), 
            BodyText = v14
        }) else v14
    });
end;