local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Workspace.Packages.Style);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_mapTypographyVariantToFontEnum_0 = v2.mapTypographyVariantToFontEnum;
return function(v6) --[[ Line: 17 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_withLocalization_0 (copy), v1 (copy), l_mapTypographyVariantToFontEnum_0 (copy)
    local v7 = l_useDesignTokens_0();
    return l_withLocalization_0({
        statusPrimaryText = v6.statusPrimaryText, 
        statusSecondaryText = v6.statusSecondaryText
    })(function(v8) --[[ Line: 23 ]]
        -- upvalues: v1 (ref), v7 (copy), v6 (copy), l_mapTypographyVariantToFontEnum_0 (ref)
        return v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = v7.Global.Opacity_0
        }, {
            FetchStatus = if v6.submitError then v1.createElement("TextLabel", {
                Position = UDim2.new(0, 0, 1, -v7.Semantic.Typography.Subheader.FontSize - v7.Global.Size_150), 
                Text = v8.statusPrimaryText, 
                Font = l_mapTypographyVariantToFontEnum_0(v7.Semantic.Typography.Body), 
                TextColor3 = v6.color, 
                TextSize = v7.Semantic.Typography.Body.FontSize, 
                Size = UDim2.new(1, 0, 0, v7.Semantic.Typography.Subheader.FontSize), 
                BackgroundTransparency = v7.Global.Opacity_0, 
                TextXAlignment = Enum.TextXAlignment.Left
            }) else if v6.BEDUIError then v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0.9, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = v7.Global.Opacity_0
            }, {
                Layout = v1.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                PrimaryText = v1.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = v6.statusPrimaryText, 
                    Font = l_mapTypographyVariantToFontEnum_0(v7.Semantic.Typography.Title), 
                    LayoutOrder = 1, 
                    TextColor3 = v7.Semantic.Color.Text.Emphasis.Color3, 
                    TextTransparency = v7.Semantic.Color.Text.Emphasis.Transparency, 
                    TextSize = v7.Semantic.Typography.Title.FontSize, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    Size = UDim2.new(1, 0, 0, v7.Semantic.Typography.Title.FontSize), 
                    BackgroundTransparency = v7.Global.Opacity_0
                }, {
                    Padding = v1.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, v7.Global.Space_200)
                    })
                }), 
                SecondaryText = v1.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = v6.statusSecondaryText, 
                    Font = l_mapTypographyVariantToFontEnum_0(v7.Semantic.Typography.Header), 
                    LayoutOrder = 2, 
                    TextColor3 = v7.Semantic.Color.Text.Default.Color3, 
                    TextTransparency = v7.Semantic.Color.Text.Emphasis.Transparency, 
                    TextSize = v7.Semantic.Typography.Header.FontSize, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    Size = UDim2.new(1, 0, 0, v7.Semantic.Typography.Header.FontSize), 
                    BackgroundTransparency = v7.Global.Opacity_0
                })
            }) else nil
        });
    end);
end;