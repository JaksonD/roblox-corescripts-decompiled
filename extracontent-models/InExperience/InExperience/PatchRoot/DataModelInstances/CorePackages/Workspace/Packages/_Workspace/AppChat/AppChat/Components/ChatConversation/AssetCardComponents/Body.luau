local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.Foundation);
local l_Radius_0 = v3.Enums.Radius;
local l_Skeleton_0 = v3.Skeleton;
local v6 = v1.PureComponent:extend("AssetCard_Co\207\128tent");
v6.defaultProps = {
    cardIcon = nil, 
    cardBodyText = nil, 
    bodyActivated = nil, 
    contentLoadedCallback = nil
};
v6.init = function(v7) --[[ Line: 21 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v7.iconRef = v1.createRef();
end;
v6.render = function(v8) --[[ Line: 25 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v1 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy)
    return v2.Style.withStyle(function(v9) --[[ Line: 26 ]]
        -- upvalues: v1 (ref), v8 (copy), v2 (ref), l_Skeleton_0 (ref), l_Radius_0 (ref)
        return v1.createElement("ImageButton", {
            Size = UDim2.new(1, 0, 0, 64), 
            BackgroundTransparency = 1, 
            [v1.Event.Activated] = v8.props.bodyActivated
        }, {
            layout = v1.createElement("UIListLayout", {
                Padding = UDim.new(0, 12), 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Icon = v1.createElement(v2.App.Loading.LoadableImage, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 64, 0, 64), 
                LayoutOrder = 1, 
                Image = v8.props.cardIcon, 
                useShimmerAnimationWhileLoading = true, 
                cornerRadius = UDim.new(0, 4)
            }), 
            Details = not v8.props.isLoading and v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, -76, 0, 64), 
                Text = v8.props.cardBodyText, 
                TextColor3 = v9.Theme.TextEmphasis.Color, 
                Font = v9.Font.Body.Font, 
                TextSize = 17, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextWrapped = true, 
                LayoutOrder = 2
            }, v8.props[v1.Children]) or v1.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, -76, 0, 64), 
                radius = l_Radius_0.Small, 
                LayoutOrder = 2
            })
        });
    end);
end;
return v6;