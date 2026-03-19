local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.Text);
local v4 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v6 = v2.PureComponent:extend("PrimaryStatWidget");
v6.defaultProps = {
    AnchorPoint = Vector2.new(0, 0), 
    Position = UDim2.new(0, 0, 0, 0)
};
v6.GetMinimumWidth = function(v7, v8, v9) --[[ Line: 29 ]] --[[ Name: GetMinimumWidth ]]
    -- upvalues: v3 (copy)
    return math.max(v3.GetTextWidth(v7, v9, 42), (v3.GetTextWidth(v8, v9, 12))) + 74;
end;
v6.GetMinimumWidthRethemed = function(v10, v11, v12) --[[ Line: 38 ]] --[[ Name: GetMinimumWidthRethemed ]]
    -- upvalues: v3 (copy)
    return math.max(v3.GetTextWidth(v10, v12.Font.Title.Font, v12.Font.BaseSize * v12.Font.Title.RelativeSize), (v3.GetTextWidth(v11, v12.Font.CaptionHeader.Font, v12.Font.BaseSize * v12.Font.CaptionHeader.RelativeSize))) + 74;
end;
v6.render = function(v13) --[[ Line: 52 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v2 (copy), v4 (copy)
    local l_icon_0 = v13.props.icon;
    local l_number_0 = v13.props.number;
    local l_label_0 = v13.props.label;
    local l_width_0 = v13.props.width;
    local l_LayoutOrder_0 = v13.props.LayoutOrder;
    local l_AnchorPoint_0 = v13.props.AnchorPoint;
    local l_Position_0 = v13.props.Position;
    local v21 = l_width_0 - 74;
    return l_withStyle_0(function(v22) --[[ Line: 63 ]]
        -- upvalues: v2 (ref), l_AnchorPoint_0 (copy), l_Position_0 (copy), l_width_0 (copy), l_LayoutOrder_0 (copy), v4 (ref), l_icon_0 (copy), v21 (copy), l_number_0 (copy), l_label_0 (copy)
        return v2.createElement("Frame", {
            AnchorPoint = l_AnchorPoint_0, 
            Position = l_Position_0, 
            Size = UDim2.new(0, l_width_0, 0, 44), 
            BackgroundTransparency = 1, 
            LayoutOrder = l_LayoutOrder_0
        }, {
            ListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 10)
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 10), 
                PaddingRight = UDim.new(0, 10)
            }), 
            Icon = v2.createElement(v4, {
                Size = UDim2.new(0, 44, 0, 44), 
                Image = l_icon_0, 
                ImageColor3 = v22.Theme.IconEmphasis.Color, 
                ImageTransparency = v22.Theme.IconEmphasis.Transparency, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }), 
            TextSection = v2.createElement("Frame", {
                Size = UDim2.new(0, v21, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                Number = v2.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 42), 
                    Position = UDim2.new(0, 0, 0, -7), 
                    Text = l_number_0, 
                    Font = v22.Font.Title.Font, 
                    TextSize = v22.Font.BaseSize * v22.Font.Title.RelativeSize, 
                    TextColor3 = v22.Theme.TextEmphasis.Color, 
                    TextTransparency = v22.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextScaled = true, 
                    BackgroundTransparency = 1
                }), 
                Label = v2.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 12), 
                    Position = UDim2.new(0, 0, 0, 28), 
                    Text = l_label_0, 
                    Font = v22.Font.CaptionHeader.Font, 
                    TextSize = v22.Font.BaseSize * v22.Font.CaptionHeader.RelativeSize, 
                    TextColor3 = v22.Theme.TextEmphasis.Color, 
                    TextTransparency = v22.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextScaled = true, 
                    BackgroundTransparency = 1
                })
            })
        });
    end);
end;
return v6;