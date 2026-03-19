local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.Foundation);
local l_Radius_0 = v3.Enums.Radius;
local l_Skeleton_0 = v3.Skeleton;
local v6 = v1.PureComponent:extend("AssetCard_Header");
v6.defaultProps = {
    cardTitle = nil
};
v6.render = function(v7) --[[ Line: 19 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v1 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy)
    return v2.Style.withStyle(function(v8) --[[ Line: 20 ]]
        -- upvalues: v1 (ref), v7 (copy), l_Skeleton_0 (ref), l_Radius_0 (ref)
        return v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 20), 
            BackgroundTransparency = 1
        }, {
            padding = v1.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 2)
            }), 
            title = v1.createElement("Frame", {
                Size = UDim2.new(1, -6, 1, 0), 
                BackgroundTransparency = 1
            }, {
                layout = v1.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                label = not v7.props.isLoading and v1.createElement("TextLabel", {
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    BackgroundTransparency = 1, 
                    TextSize = 23, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = v7.props.cardTitle, 
                    TextColor3 = v8.Theme.TextEmphasis.Color, 
                    Font = v8.Font.CaptionHeader.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center
                }) or v1.createElement(l_Skeleton_0, {
                    Size = UDim2.fromScale(0.5, 1), 
                    radius = l_Radius_0.Small
                })
            })
        });
    end);
end;
return v6;