local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v2.Style.withStyle;
local v4 = require(l_Modules_0.Common.Roact);
local v5 = require(l_Modules_0.Common.Text);
local v6 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local l_ColorSystem_0 = v2.Common.Style.ColorSystem;
local v8 = Rect.new(12, 12, 13, 13);
local v9 = v4.PureComponent:extend("NumericalBadge");
v9.defaultProps = {
    AnchorPoint = Vector2.new(0.5, 0.5), 
    Position = UDim2.new(1, 0, 0, 0), 
    badgeCount = 0, 
    inAppChrome = false, 
    redBadgeVariant = false
};
v9.render = function(v10) --[[ Line: 34 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), l_ColorSystem_0 (copy), v4 (copy), v6 (copy), v8 (copy), l_withStyle_0 (copy)
    local l_AnchorPoint_0 = v10.props.AnchorPoint;
    local l_Position_0 = v10.props.Position;
    local l_LayoutOrder_0 = v10.props.LayoutOrder;
    local l_badgeCount_0 = v10.props.badgeCount;
    if type(l_badgeCount_0) ~= "number" or l_badgeCount_0 <= 0 then
        return nil;
    else
        local function v23(v15, v16, v17) --[[ Line: 45 ]] --[[ Name: renderBadge ]]
            -- upvalues: l_badgeCount_0 (copy), v5 (ref), v10 (copy), l_ColorSystem_0 (ref), v4 (ref), v6 (ref), l_AnchorPoint_0 (copy), l_Position_0 (copy), v8 (ref), l_LayoutOrder_0 (copy)
            local v18 = l_badgeCount_0 > 99 and "99+" or tostring(l_badgeCount_0);
            local v19 = v5.GetTextWidth(v18, v17.Font, v17.TextSize);
            local v20 = math.max(24, v19 + 6 + 4);
            local l_Color_0 = v16.Color;
            local l_TextColor3_0 = v17.TextColor3;
            if v10.props.redBadgeVariant then
                l_Color_0 = l_ColorSystem_0.Red[60];
                l_TextColor3_0 = l_ColorSystem_0.White;
            end;
            return v4.createElement(v6, {
                AnchorPoint = l_AnchorPoint_0, 
                Position = l_Position_0, 
                Size = UDim2.new(0, v20, 0, 24), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Image = "LuaApp/9-slice/notification_badge", 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v8, 
                ImageColor3 = v15.Color, 
                ImageTransparency = v15.Transparency, 
                LayoutOrder = l_LayoutOrder_0
            }, {
                InnerBadge = v4.createElement(v6, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.new(1, -4, 1, -4), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Image = "LuaApp/9-slice/notification_badge", 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = v8, 
                    ImageColor3 = l_Color_0, 
                    ImageTransparency = v16.Transparency
                }, {
                    Count = v4.createElement("TextLabel", {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        Size = UDim2.new(0, v19, 1, 0), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Font = v17.Font, 
                        Text = v18, 
                        TextSize = v17.TextSize, 
                        TextColor3 = l_TextColor3_0, 
                        TextTransparency = v17.TextTransparency
                    })
                })
            });
        end;
        return l_withStyle_0(function(v24) --[[ Line: 100 ]]
            -- upvalues: v23 (copy)
            local v25 = {
                Font = v24.Font.CaptionHeader.Font, 
                TextSize = v24.Font.CaptionHeader.RelativeSize * v24.Font.BaseSize, 
                TextColor3 = v24.Theme.BadgeContent.Color, 
                TextTransparency = v24.Theme.BadgeContent.Transparency
            };
            return v23(v24.Theme.BackgroundDefault, v24.Theme.Badge, v25);
        end);
    end;
end;
return v9;