local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.App.Style.StyleTypes);
return {
    getBaseMenuDefaultTokens = function(v2) --[[ Line: 27 ]]
        assert(v2.Tokens ~= nil, "Design token support is not enabled!");
        return {
            elementHeight = v2.Tokens.Component.MenuCell.Base.Container.Height, 
            borderCornerRadius = v2.Tokens.Component.BaseMenu.BorderRadius, 
            background = {
                Color = v2.Tokens.Component.BaseMenu.BackgroundColor.Color3, 
                Transparency = v2.Tokens.Component.BaseMenu.BackgroundColor.Transparency
            }
        };
    end, 
    getCellDefaultTokens = function(v3) --[[ Line: 7 ]]
        assert(v3.Tokens ~= nil, "Design token support is not enabled!");
        return {
            iconSize = v3.Tokens.Component.MenuCell.Base.IconFrame.Size, 
            selectedIconSize = v3.Tokens.Component.MenuCell.Base.CheckFrame.Size, 
            iconPaddingLeft = v3.Tokens.Component.MenuCell.Base.Container.Spacing.Leading, 
            textPadding = {
                left = v3.Tokens.Component.MenuCell.Base.TextFrame.Spacing.Leading, 
                right = v3.Tokens.Component.MenuCell.Base.TextFrame.Spacing.Trailing
            }, 
            fontStyle = {
                Font = v3.Tokens.Component.MenuCell.Base.Text.Typography.Font, 
                RelativeSize = v3.Tokens.Component.MenuCell.Base.Text.Typography.FontSize / v3.Font.BaseSize, 
                RelativeMinSize = v3.Tokens.Component.MenuCell.Base.Text.Typography.FontSize / v3.Font.BaseSize
            }, 
            dividerSize = v3.Tokens.Component.MenuCell.Divider.Container.BorderWidth, 
            selectedIconPaddingRight = v3.Tokens.Component.MenuCell.Base.Container.Spacing.Trailing
        };
    end, 
    getDropdownMenuCellDefaultTokens = function(v4) --[[ Line: 39 ]]
        return {
            iconSize = v4.Tokens.Global.Size_450, 
            containerPadding = {
                left = v4.Tokens.Global.Space_200, 
                right = v4.Tokens.Global.Space_300
            }, 
            textFont = v4.Tokens.Semantic.Typography.Subheader, 
            iconTextSpacing = v4.Tokens.Global.Space_200, 
            border = {
                cornerRadius = v4.Tokens.Semantic.Radius.Medium, 
                size = v4.Tokens.Global.Stroke_100
            }
        };
    end, 
    getDropdownMenuDefaultTokens = function(v5) --[[ Line: 55 ]]
        return {
            height = UDim.new(0, v5.Tokens.Global.Size_600), 
            menuStateColors = {
                buttonDefault = {
                    Color = v5.Tokens.Semantic.Color.Action.Secondary.Border.Color3, 
                    Transparency = v5.Tokens.Semantic.Color.Action.Secondary.Border.Transparency
                }, 
                contentDefault = {
                    Color = v5.Tokens.Semantic.Color.Text.Default.Color3, 
                    Transparency = v5.Tokens.Semantic.Color.Text.Default.Transparency
                }, 
                alert = {
                    Color = v5.Tokens.Semantic.Color.Action.Alert.Border.Color3, 
                    Transparency = v5.Tokens.Semantic.Color.Action.Alert.Border.Transparency
                }
            }
        };
    end
};