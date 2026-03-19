local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.RoactRodux);
local v3 = v1.PureComponent:extend("BackgroundFill");
v3.render = function(v4) --[[ Line: 7 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_Image_0 = v4.props.Image;
    local l_AspectRatio_0 = v4.props.AspectRatio;
    local v7 = math.max(v4.props.screenSize.X, v4.props.screenSize.Y);
    return v1.createElement("ImageLabel", {
        Image = l_Image_0, 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BorderSizePixel = 0
    }, {
        UIAspectRatioConstraint = v1.createElement("UIAspectRatioConstraint", {
            AspectRatio = l_AspectRatio_0
        }), 
        UISizeConstraint = v1.createElement("UISizeConstraint", {
            MinSize = Vector2.new(v7, v7)
        })
    });
end;
return (v2.connect(function(v8, _) --[[ Line: 29 ]]
    return {
        screenSize = v8.ScreenSize
    };
end)(v3));