local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Constants);
local v5 = v1.PureComponent:extend("SelectionEffect");
v5.render = function(v6) --[[ Line: 13 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v1 (copy)
    local v7 = v4.Layouts[v6.props.layout];
    local l_focusedSegmentIndex_0 = v6.props.emotesWheel.focusedSegmentIndex;
    local v9 = 360 / v4.EmotesPerPage * (l_focusedSegmentIndex_0 - 1) + v4.SegmentsStartRotation;
    local v10 = v4.InnerCircleSizeRatio / 2;
    local v11 = 360 / v4.EmotesPerPage;
    local v12 = v4.InnerCircleSizeRatio * math.sin((math.rad(v11 / 2)));
    return v1.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Rotation = v9, 
        Visible = l_focusedSegmentIndex_0 ~= 0
    }, {
        SelectedLine = v1.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(0.5 + v10, -v7.SelectedLinePadding, 0.5, 0), 
            Size = UDim2.new(1, 0, v12, -v7.SelectedLinePadding), 
            BackgroundTransparency = 1, 
            Image = v7.SelectedLine, 
            ZIndex = 4
        }, {
            AsspectRatioConstraint = v1.createElement("UIAspectRatioConstraint", {
                AspectRatio = v7.SelectedLineImageSize.X / v7.SelectedLineImageSize.Y
            })
        })
    });
end;
return v2.connect(function(v13) --[[ Line: 46 ]] --[[ Name: mapStateToProps ]]
    return {
        emotesWheel = v13.emotesWheel, 
        layout = v13.layout
    };
end, nil)(v5);