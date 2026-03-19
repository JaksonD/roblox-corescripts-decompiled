local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local l_Radius_0 = v3.Enums.Radius;
local l_Skeleton_0 = v3.Skeleton;
local l_LoadableImage_0 = v2.App.Loading.LoadableImage;
local v7 = v1.PureComponent:extend("GameBanner");
v7.defaultProps = {
    creator = "By (placeholder)", 
    name = "Placeholder Game", 
    thumbnail = "rbxasset://textures/grid2.png", 
    isLoading = false, 
    shouldShowCreatorName = true
};
v7.render = function(v8) --[[ Line: 24 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v1 (copy), l_LoadableImage_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy)
    return v2.Style.withStyle(function(v9) --[[ Line: 25 ]]
        -- upvalues: v1 (ref), v8 (copy), l_LoadableImage_0 (ref), l_Skeleton_0 (ref), l_Radius_0 (ref)
        return v1.createElement("Frame", {
            BackgroundColor3 = v9.Theme.BackgroundContrast.Color, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 72)
        }, {
            layout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                FillDirection = Enum.FillDirection.Horizontal
            }), 
            PlaceThumbnailFrame = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 72, 0, 72), 
                LayoutOrder = 0
            }, {
                layout = v1.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                placeThumbnail = not v8.props.isLoading and v1.createElement(l_LoadableImage_0, {
                    Image = v8.props.thumbnail, 
                    Size = UDim2.new(0, 48, 0, 48), 
                    BackgroundTransparency = 1
                }) or v1.createElement(l_Skeleton_0, {
                    Size = UDim2.new(0, 48, 0, 48), 
                    radius = l_Radius_0.Small
                })
            }), 
            ContentFrame = v1.createElement("Frame", {
                Size = UDim2.new(1, -84, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                layout = v1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 3)
                }), 
                padding = v1.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 17)
                }), 
                PlaceTitle = not v8.props.isLoading and v1.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 20), 
                    TextSize = 20, 
                    TextColor3 = v9.Theme.TextEmphasis.Color, 
                    Font = v9.Font.Header2.Font, 
                    Text = v8.props.name, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LayoutOrder = 0
                }) or v1.createElement(l_Skeleton_0, {
                    Size = UDim2.new(1, 0, 0, 20), 
                    radius = l_Radius_0.Small
                }), 
                BuilderLabel = not v8.props.isLoading and v1.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 17), 
                    TextSize = 17, 
                    TextColor3 = v9.Theme.TextDefault.Color, 
                    Font = v9.Font.Body.Font, 
                    Text = v8.props.creator, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Visible = v8.props.shouldShowCreatorName, 
                    LayoutOrder = 1
                }) or v1.createElement(l_Skeleton_0, {
                    Size = UDim2.new(0.6, 0, 0, 17), 
                    radius = l_Radius_0.Small
                })
            })
        });
    end);
end;
return v7;