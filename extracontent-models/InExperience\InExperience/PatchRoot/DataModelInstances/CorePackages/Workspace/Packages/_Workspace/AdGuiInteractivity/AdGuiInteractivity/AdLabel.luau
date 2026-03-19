local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.RobloxTranslator):FormatByKey("Feature.NativeAds.Label.Ad");
local v3 = require(l_Parent_0.UIBlox);
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local l_Images_0 = v3.App.ImageSet.Images;
local v6 = l_Images_0["icons/menu/more_on"];
local v7 = l_Images_0["icons/menu/more_off"];
local v8 = v1.Component:extend("AdLabel");
v8.render = function(v9) --[[ Line: 19 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy), l_ImageSetButton_0 (copy), v6 (copy), v7 (copy)
    return v1.createElement("Frame", {
        Position = UDim2.fromScale(0.995, 0.995), 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        BorderSizePixel = 0, 
        AnchorPoint = Vector2.new(1, 1), 
        Size = UDim2.fromScale(0.11447368421, 0.10108771929), 
        Visible = v9.props.Visible
    }, {
        Label = v1.createElement("TextLabel", {
            LayoutOrder = 1, 
            Text = v2, 
            TextColor3 = Color3.new(1, 1, 1), 
            BackgroundTransparency = 1, 
            Font = Enum.Font.Gotham, 
            TextSize = 100, 
            TextScaled = true, 
            TextWrapped = false, 
            Position = UDim2.fromScale(0.134084726, 0.5), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Size = UDim2.fromScale(0.40808394869, 0.77610536218)
        }), 
        MenuButton = v1.createElement(l_ImageSetButton_0, {
            LayoutOrder = 2, 
            Image = v9.props.isMenuOpen and v6 or v7, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(0.4, 0), 
            Position = UDim2.fromScale(0.76, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            [v1.Event.Activated] = v9.props.onActivated
        }, {
            UIAspectRatioConstraint = v1.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1, 
                AspectType = Enum.AspectType.ScaleWithParentSize
            })
        })
    });
end;
return v8;