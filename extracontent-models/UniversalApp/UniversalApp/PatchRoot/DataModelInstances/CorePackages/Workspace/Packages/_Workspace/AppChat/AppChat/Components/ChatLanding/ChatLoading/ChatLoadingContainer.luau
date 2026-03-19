local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v3 = require(script.Parent.ChatLoadingIndicator);
local l_FFlagAppIaScrollAway_0 = require(l_Parent_0.SharedFlags).FFlagAppIaScrollAway;
local v5 = v1.PureComponent:extend("ChatLoadingContainer");
v5.defaultProps = {
    topBarHeight = 0, 
    cellHeight = 64, 
    cellWidth = 375, 
    topPadding = l_FFlagAppIaScrollAway_0 and 0 or nil
};
v5.render = function(v6) --[[ Line: 21 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v1 (copy), l_FFlagAppIaScrollAway_0 (copy), v3 (copy)
    return l_withStyle_0(function(v7) --[[ Line: 22 ]]
        -- upvalues: v1 (ref), l_FFlagAppIaScrollAway_0 (ref), v6 (copy), v3 (ref)
        return v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v7.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = v7.Tokens.Global.Color.None.Transparency, 
            BorderSizePixel = 0, 
            ClipsDescendants = true
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            UIPadding = if l_FFlagAppIaScrollAway_0 and v6.props.topPadding > 0 then v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v6.props.topPadding)
            }) else nil, 
            ChatLoadingFrame = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                ChatLoadingIndicator = v1.createElement(v3, {
                    cellHeight = v6.props.cellHeight, 
                    cellWidth = v6.props.cellWidth
                })
            })
        });
    end);
end;
return v5;