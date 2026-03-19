local l_CorePackages_0 = game:GetService("CorePackages");
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local v8 = l_Images_0["icons/status/alert"];
local function v10(v9) --[[ Line: 15 ]] --[[ Name: mapTokens ]]
    return {
        alertHeight = v9.Global.Size_1300, 
        alertPadding = v9.Global.Size_150, 
        alertImageSize = v9.Global.Size_450, 
        cornerRadius = v9.Semantic.Radius.Medium, 
        backgroundColor = v9.Semantic.Color.BackgroundUi.Default, 
        alertTitleColor = v9.Semantic.Color.Text.Muted, 
        alertMessageColor = v9.Semantic.Color.Text.Default, 
        alertTitleFont = v9.Semantic.Typography.Subheader, 
        alertMessageFont = v9.Semantic.Typography.Body
    };
end;
return function(_) --[[ Line: 29 ]] --[[ Name: WidgetListModerationAlert ]]
    -- upvalues: l_useDesignTokens_0 (copy), v10 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v3 (copy), l_ImageSetLabel_0 (copy), v8 (copy)
    local v12 = l_useDesignTokens_0(v10);
    local v13 = l_useStyle_0();
    local v14 = l_useLocalization_0({
        alertTitle = "Feature.Avatar.Label.ModerationFailed", 
        alertMessage = "Feature.Avatar.Message.ModerationFailed"
    });
    local l_Theme_0 = v13.Theme;
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = v12.backgroundColor.Transparency, 
        BackgroundColor3 = v12.backgroundColor.Color3, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        UICornoer = v3.createElement("UICorner", {
            CornerRadius = UDim.new(0, v12.cornerRadius)
        }), 
        UIPadding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v12.alertPadding), 
            PaddingBottom = UDim.new(0, v12.alertPadding), 
            PaddingLeft = UDim.new(0, v12.alertPadding), 
            PaddingRight = UDim.new(0, v12.alertPadding)
        }), 
        UIListLayout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 8)
        }), 
        LeftContent = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v12.alertImageSize, 1, 0), 
            LayoutOrder = 1
        }, {
            AlertImage = v3.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v8, 
                Size = UDim2.new(0, v12.alertImageSize, 0, v12.alertImageSize), 
                ImageColor3 = l_Theme_0.IconDefault.Color, 
                ImageTransparency = l_Theme_0.IconDefault.Transparency, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0)
            })
        }), 
        RightContent = v3.createElement("Frame", {
            Size = UDim2.new(1, -1 * v12.alertImageSize, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            UIPadding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v12.alertPadding), 
                PaddingBottom = UDim.new(0, v12.alertPadding), 
                PaddingLeft = UDim.new(0, v12.alertPadding), 
                PaddingRight = UDim.new(0, v12.alertPadding)
            }), 
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, v12.alertPadding)
            }), 
            AlertTitle = v3.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0), 
                Text = v14.alertTitle, 
                TextSize = v12.alertTitleFont.FontSize, 
                Font = v12.alertTitleFont.Font, 
                TextColor3 = v12.alertTitleColor.Color3, 
                TextWrapped = true, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }), 
            AlertMessage = v3.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0), 
                Text = v14.alertMessage, 
                TextSize = v12.alertMessageFont.FontSize, 
                Font = v12.alertMessageFont.Font, 
                TextColor3 = v12.alertMessageColor.Color3, 
                TextWrapped = true, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            })
        })
    });
end;