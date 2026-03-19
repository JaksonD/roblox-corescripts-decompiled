local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v3.Core.Style.withStyle;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local v6 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v7 = v1.PureComponent:extend("MenuCell");
v7.validateProps = v2.strictInterface({
    layoutOrder = v2.integer, 
    icon = v2.optional(v2.union(v2.table, v2.string)), 
    iconComponent = v2.optional(v2.table), 
    localizationKey = v2.string, 
    height = v2.numberPositive, 
    hasDivider = v2.boolean, 
    isSelected = v2.boolean
});
v7.render = function(v8) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v6 (copy), v1 (copy), l_ImageSetLabel_0 (copy)
    return l_withStyle_0(function(v9) --[[ Line: 34 ]]
        -- upvalues: v6 (ref), v8 (copy), v1 (ref), l_ImageSetLabel_0 (ref)
        local l_Theme_0 = v9.Theme;
        local l_Font_0 = v9.Font;
        local v12 = v6:FormatByKey(v8.props.localizationKey);
        local l_createElement_0 = v1.createElement;
        local v14 = "Frame";
        local v15 = {
            LayoutOrder = v8.props.layoutOrder, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v8.props.height)
        };
        local v16 = {
            SelectedFrame = v8.props.isSelected and v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 4, 1, 4), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5)
            }, {
                TopBorder = v1.createElement("Frame", {
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 2), 
                    BackgroundTransparency = l_Theme_0.SystemPrimaryOnHover.Transparency, 
                    BackgroundColor3 = l_Theme_0.SystemPrimaryOnHover.Color
                }), 
                LeftBorder = v1.createElement("Frame", {
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, 2, 1, 0), 
                    BackgroundTransparency = l_Theme_0.SystemPrimaryOnHover.Transparency, 
                    BackgroundColor3 = l_Theme_0.SystemPrimaryOnHover.Color
                }), 
                RightBorder = v1.createElement("Frame", {
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, 2, 1, 0), 
                    Position = UDim2.fromScale(1, 0), 
                    AnchorPoint = Vector2.new(1, 0), 
                    BackgroundTransparency = l_Theme_0.SystemPrimaryOnHover.Transparency, 
                    BackgroundColor3 = l_Theme_0.SystemPrimaryOnHover.Color
                }), 
                BottomBorder = v1.createElement("Frame", {
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 2), 
                    Position = UDim2.fromScale(0, 1), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundTransparency = l_Theme_0.SystemPrimaryOnHover.Transparency, 
                    BackgroundColor3 = l_Theme_0.SystemPrimaryOnHover.Color
                })
            })
        };
        local l_createElement_1 = v1.createElement;
        local v18 = "Frame";
        local v19 = {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        };
        local v20 = {
            Layout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 12)
            }), 
            Padding = v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 12)
            })
        };
        local l_createElement_2 = v1.createElement;
        local v22 = "Frame";
        local v23 = {
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(36, 36)
        };
        local v24 = {};
        local v25 = false;
        if v8.props.icon ~= nil then
            v25 = v1.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v8.props.icon, 
                Size = UDim2.fromScale(1, 1), 
                ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                ImageColor3 = l_Theme_0.IconEmphasis.Color
            });
        end;
        v24.IconLabel = v25;
        v25 = false;
        if v8.props.iconComponent ~= nil then
            v25 = v1.createElement(v8.props.iconComponent);
        end;
        v24.IconComponent = v25;
        v20.IconFrame = l_createElement_2(v22, v23, v24);
        v20.Text = v1.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, -48, 1, 0), 
            Text = v12, 
            Font = l_Font_0.Header2.Font, 
            TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextTransparency = l_Theme_0.TextEmphasis.TextTransparency, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextTruncate = Enum.TextTruncate.AtEnd
        });
        v16.CellContents = l_createElement_1(v18, v19, v20);
        v16.Divider = v8.props.hasDivider and v1.createElement("Frame", {
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = l_Theme_0.Divider.Transparency, 
            BackgroundColor3 = l_Theme_0.Divider.Color
        });
        return l_createElement_0(v14, v15, v16);
    end);
end;
return v7;