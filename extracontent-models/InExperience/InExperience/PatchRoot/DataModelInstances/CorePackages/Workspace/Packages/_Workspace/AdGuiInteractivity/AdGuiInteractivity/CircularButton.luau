local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local l_ImageSetLabel_0 = require(l_Parent_0.UIBlox).Core.ImageSet.ImageSetLabel;
local v3 = v1.Component:extend("CircularButton");
v3.render = function(v4) --[[ Line: 10 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_ImageSetLabel_0 (copy)
    local v5 = nil;
    v5 = if typeof(v4.props.Transparency) == "table" then v4.props.Transparency:map(function(v6) --[[ Line: 13 ]]
        -- upvalues: v4 (copy)
        local v7 = false;
        if v6 < 1 then
            v7 = v4.props.Visible;
        end;
        return v7;
    end) else v4.props.Visible and v4.props.Transparency < 1;
    return v1.createElement("TextButton", {
        Size = UDim2.fromScale(v4.props.HorizontalScale, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = v4.props.Position, 
        AnchorPoint = v4.props.AnchorPoint, 
        BackgroundColor3 = Color3.fromRGB(17, 18, 19), 
        Transparency = v4.props.Transparency, 
        Text = "", 
        Visible = v5, 
        AutoButtonColor = v4.props.AutoButtonColor, 
        [v1.Event.Activated] = v4.props.onActivated
    }, {
        UIAspectRatioConstraint = v1.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1, 
            AspectType = Enum.AspectType.ScaleWithParentSize
        }), 
        UICorner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }), 
        ImageLabel = v1.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Size = v4.props.ImageSize, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Image = v4.props.Image, 
            ImageTransparency = v4.props.Transparency
        })
    });
end;
return v3;