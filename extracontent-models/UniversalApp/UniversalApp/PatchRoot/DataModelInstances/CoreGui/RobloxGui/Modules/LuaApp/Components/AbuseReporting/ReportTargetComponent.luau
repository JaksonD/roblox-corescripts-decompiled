local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Workspace.Packages.Style);
local v4 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportTargetThumbnail);
local l_useDesignTokens_0 = v3.useDesignTokens;
local l_mapTypographyVariantToFontEnum_0 = v3.mapTypographyVariantToFontEnum;
return function(v7) --[[ Line: 18 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v1 (copy), v4 (copy), l_mapTypographyVariantToFontEnum_0 (copy)
    local v8 = l_useDesignTokens_0();
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v8.Global.Size_1400), 
        BackgroundTransparency = v8.Global.Opacity_0, 
        LayoutOrder = 2
    }, {
        Padding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v8.Global.Space_300), 
            PaddingBottom = UDim.new(0, v8.Global.Space_700)
        }), 
        TargetInner = v1.createElement("Frame", {
            Size = UDim2.new(0, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.X, 
            BackgroundTransparency = v8.Global.Opacity_0, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Thumbnail = v1.createElement(v4, {
                thumbnailUrl = v7.thumbnailUrl
            }), 
            Texts = v1.createElement("Frame", {
                Size = UDim2.new(0, 0, 1, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = v8.Global.Opacity_0
            }, {
                Layout = v1.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Padding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v8.Global.Space_150)
                }), 
                PrimaryText = v1.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = v7.primaryText, 
                    Font = l_mapTypographyVariantToFontEnum_0(v8.Semantic.Typography.Subheader), 
                    LayoutOrder = 1, 
                    TextColor3 = v8.Semantic.Color.Text.Emphasis.Color3, 
                    TextTransparency = v8.Semantic.Color.Text.Emphasis.Transparency, 
                    TextSize = v8.Semantic.Typography.Subheader.FontSize, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Size = UDim2.new(0, 0, 0, v8.Semantic.Typography.Subheader.FontSize), 
                    BackgroundTransparency = v8.Global.Opacity_0
                }), 
                SecondaryText = v1.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = v7.secondaryText, 
                    Font = l_mapTypographyVariantToFontEnum_0(v8.Semantic.Typography.Body), 
                    LayoutOrder = 2, 
                    TextColor3 = v8.Semantic.Color.Text.Default.Color3, 
                    TextTransparency = v8.Semantic.Color.Text.Emphasis.Transparency, 
                    TextSize = v8.Semantic.Typography.Body.FontSize, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Size = UDim2.new(0, 0, 0, v8.Semantic.Typography.Subheader.FontSize), 
                    BackgroundTransparency = v8.Global.Opacity_0
                })
            })
        })
    });
end;