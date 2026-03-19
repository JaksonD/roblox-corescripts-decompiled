local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Constants);
local v5 = v1.PureComponent:extend("SlotNumbers");
v5.render = function(v6) --[[ Line: 13 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v1 (copy)
    local v7 = v4.Layouts[v6.props.layout];
    local v8 = {};
    for v9 = 1, v4.EmotesPerPage do
        local v10 = 360 / v4.EmotesPerPage * (v9 - 1) + v4.SegmentsStartRotation;
        local v11 = v4.InnerCircleSizeRatio / 2;
        local l_SlotNumberSize_0 = v4.SlotNumberSize;
        local v13 = l_SlotNumberSize_0 / 2;
        local v14 = math.cos((math.rad(v10)));
        local v15 = v11 * v14;
        local v16 = v13 * v14;
        local v17 = 0.5 + v15 + v16;
        local v18 = math.sin((math.rad(v10)));
        local v19 = v11 * v18;
        local v20 = v13 * v18;
        local v21 = 0.5 + v19 + v20;
        v8[v9] = v1.createElement("TextLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(v17, 0, v21, 0), 
            Size = UDim2.new(l_SlotNumberSize_0, 0, l_SlotNumberSize_0, 0), 
            BackgroundTransparency = 1, 
            TextScaled = true, 
            TextSize = v7.SlotNumberTextSize, 
            TextColor3 = v4.Colors.White, 
            Text = v9, 
            Font = v7.SlotNumberFont, 
            ZIndex = 2
        }, {
            TextSizeConstraint = v1.createElement("UITextSizeConstraint", {
                MaxTextSize = v7.SlotNumberTextSize
            })
        });
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, v8);
end;
return v2.connect(function(v22) --[[ Line: 61 ]] --[[ Name: mapStateToProps ]]
    return {
        layout = v22.layout
    };
end, nil)(v5);