local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Constants);
local v5 = v1.PureComponent:extend("SelectionGradient");
v5.render = function(v6) --[[ Line: 13 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v1 (copy)
    local v7 = v4.Layouts[v6.props.layout];
    local l_focusedSegmentIndex_0 = v6.props.emotesWheel.focusedSegmentIndex;
    local v9 = 360 / v4.EmotesPerPage * (l_focusedSegmentIndex_0 - 1) + v4.SegmentsStartRotation;
    return v1.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Rotation = v9, 
        Visible = l_focusedSegmentIndex_0 ~= 0
    }, {
        SelectedGradient = v1.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0.5, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ImageTransparency = v4.GradientTransparency, 
            Image = v7.SelectedGradient, 
            ZIndex = 2
        }, {
            AsspectRatioConstraint = v1.createElement("UIAspectRatioConstraint", {
                AspectRatio = v7.SelectedGradientImageSize.X / v7.SelectedGradientImageSize.Y
            }), 
            SizeConstraint = v1.createElement("UISizeConstraint", {
                MaxSize = v7.SelectedGradientImageSize
            })
        })
    });
end;
return v2.connect(function(v10) --[[ Line: 47 ]] --[[ Name: mapStateToProps ]]
    return {
        emotesWheel = v10.emotesWheel, 
        layout = v10.layout
    };
end, nil)(v5);