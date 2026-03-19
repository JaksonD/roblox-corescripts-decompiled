local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_Colors_0 = v3.App.Style.Colors;
local l_withStyle_0 = v3.Style.withStyle;
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v8 = require(l_Parent_1.Constants);
local v9 = require(l_Parent_0.SelectionGradient);
local v10 = require(l_Parent_0.SelectionEffect);
local v11 = require(l_Parent_0.WheelText);
local v12 = v1.PureComponent:extend("WheelBackground");
v12.renderContent = function(v13, v14) --[[ Line: 20 ]] --[[ Name: renderContent ]]
    -- upvalues: v8 (copy), v1 (copy), l_Colors_0 (copy), v9 (copy), v10 (copy), v11 (copy)
    local v15 = v8.Layouts[v13.props.layout];
    return v1.createElement("Folder", {}, {
        BackgroundCircleOverlay = if v14 then v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = l_Colors_0.Flint:Lerp(Color3.new(0, 0, 0), v14), 
            BackgroundTransparency = v8.WheelBackgroundTransparency * v14
        }, {
            v1.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            })
        }) else v1.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundTransparency = 1, 
            Image = v15.CircleBackground, 
            ZIndex = 1
        }), 
        BackgroundGradient = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            ZIndex = 2
        }, {
            SelectionGradient = v1.createElement(v9)
        }), 
        BackgroundImage = v1.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundTransparency = 1, 
            Image = v15.SegmentedCircle, 
            ZIndex = 3
        }), 
        Selection = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            ZIndex = 4
        }, {
            SelectionEffect = v1.createElement(v10)
        }), 
        BackgroundText = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            ZIndex = 5
        }, {
            MiddleText = v1.createElement(v11)
        })
    });
end;
v12.render = function(v16) --[[ Line: 78 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v17) --[[ Line: 79 ]]
        -- upvalues: v16 (copy)
        return v16:renderContent(v17.Settings.PreferredTransparency);
    end);
end;
return v2.connect(function(v18) --[[ Line: 84 ]] --[[ Name: mapStateToProps ]]
    return {
        layout = v18.layout
    };
end, nil)(v12);