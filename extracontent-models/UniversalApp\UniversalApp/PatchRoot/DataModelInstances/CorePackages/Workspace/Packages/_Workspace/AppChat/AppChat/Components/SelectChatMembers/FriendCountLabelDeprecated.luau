local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_AppFonts_0 = require(l_Parent_0.Style).AppFonts;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.UIBlox);
local l_Icon_0 = require(l_Parent_0.Foundation).Icon;
local v5 = require(l_Parent_0.BuilderIcons);
local v6 = v2.PureComponent:extend("FriendCountLabel");
v6.defaultProps = {
    currentSize = 0, 
    maxSize = 0, 
    LayoutOrder = nil
};
v6.render = function(v7) --[[ Line: 26 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v2 (copy), l_Icon_0 (copy), v5 (copy), l_AppFonts_0 (copy)
    return v3.Style.withStyle(function(v8) --[[ Line: 27 ]]
        -- upvalues: v2 (ref), v7 (copy), l_Icon_0 (ref), v5 (ref), l_AppFonts_0 (ref)
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(0, 60, 1, 0), 
            Position = UDim2.new(0, 0, 0, 10), 
            LayoutOrder = v7.props.LayoutOrder
        }, {
            layout = v2.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            iconImage = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1
            }, {
                Icon = v2.createElement(l_Icon_0, {
                    name = v5.Icon.PersonPlus, 
                    style = v8.Theme.IconEmphasis, 
                    size = 24
                }), 
                Padding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 6), 
                    PaddingBottom = UDim.new(0, 6), 
                    PaddingLeft = UDim.new(0, 6), 
                    PaddingRight = UDim.new(0, 6)
                })
            }), 
            friendCount = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                TextSize = 16, 
                TextColor3 = v8.Theme.TextEmphasis.Color, 
                TextTransparency = v8.Theme.TextEmphasis.Transparency, 
                Size = UDim2.new(1, 0, 0, 20), 
                Text = v7.props.currentSize .. "/" .. v7.props.maxSize, 
                Font = l_AppFonts_0.default:getDefault(), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Bottom, 
                LayoutOrder = 2
            })
        });
    end);
end;
return v6;