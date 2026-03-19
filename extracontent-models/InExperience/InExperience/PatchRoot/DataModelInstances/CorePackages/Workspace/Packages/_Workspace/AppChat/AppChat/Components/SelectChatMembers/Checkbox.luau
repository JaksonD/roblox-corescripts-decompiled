local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.UIBlox);
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v2.App.ImageSet.Images;
local v5 = v1.PureComponent:extend("Checkbox");
v5.defaultProps = {
    activated = false
};
v5.render = function(v6) --[[ Line: 17 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v1 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    return v2.Style.withStyle(function(v7) --[[ Line: 18 ]]
        -- upvalues: v1 (ref), l_ImageSetLabel_0 (ref), v6 (copy), l_Images_0 (ref)
        return v1.createElement("Frame", {
            Size = UDim2.new(0, 64, 1, 0), 
            BackgroundTransparency = 1
        }, {
            layout = v1.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            image = v1.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(0, 20, 0, 20), 
                BackgroundTransparency = 1, 
                Image = if v6.props.activated then l_Images_0["squircles/fill"] else l_Images_0["squircles/hollow"], 
                ImageColor3 = if v6.props.activated then v7.Tokens.Global.Color.Blue.Color3 else v7.Theme.IconEmphasis.Color, 
                ImageTransparency = v6.props.activated and 0 or v7.Theme.IconEmphasis.Transparency
            }, {
                FillImage = if v6.props.activated then v1.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.fromOffset(16, 16), 
                    Image = l_Images_0["icons/status/success_small"]
                }) else nil
            })
        });
    end);
end;
return v5;