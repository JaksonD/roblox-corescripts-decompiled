local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local l_Skeleton_0 = require(l_Parent_0.Foundation).Skeleton;
local v4 = v1.PureComponent:extend("TextPlaceholders");
v4.defaultProps = {
    LayoutOrder = 0, 
    avatarSize = 60, 
    avatarCellWidth = 60
};
v4.render = function(v5) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v1 (copy), l_Skeleton_0 (copy)
    return l_withStyle_0(function(_) --[[ Line: 19 ]]
        -- upvalues: v1 (ref), v5 (copy), l_Skeleton_0 (ref)
        return v1.createElement("Frame", {
            Size = UDim2.new(1, -v5.props.avatarCellWidth, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = v5.props.LayoutOrder
        }, {
            Padding = v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12), 
                PaddingLeft = UDim.new(0, 0)
            }), 
            UIList = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            topRectangle = v1.createElement(l_Skeleton_0, {
                LayoutOrder = 1, 
                Size = UDim2.new(0, 94, 0, 12)
            }), 
            spacer = v1.createElement("Frame", {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 7), 
                BackgroundTransparency = 1
            }), 
            bottomRectangle = v1.createElement(l_Skeleton_0, {
                LayoutOrder = 3, 
                Size = UDim2.new(0, 169, 0, 12)
            })
        });
    end);
end;
return v4;