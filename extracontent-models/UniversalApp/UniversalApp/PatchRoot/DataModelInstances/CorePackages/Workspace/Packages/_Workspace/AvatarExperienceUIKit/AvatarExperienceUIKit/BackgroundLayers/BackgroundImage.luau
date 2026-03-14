local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceUIKit").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Dash);
local v3 = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    color = Color3.fromRGB(255, 255, 255), 
    position = UDim2.fromScale(0.5, 0.5), 
    resourceIdentifier = ""
};
return function(v4) --[[ Line: 24 ]] --[[ Name: BackgroundImage ]]
    -- upvalues: v2 (copy), v3 (copy), v1 (copy)
    v4 = v2.join(v3, v4);
    return v1.createElement("ImageLabel", {
        AnchorPoint = v4.anchorPoint, 
        Position = v4.position, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Image = v4.resourceIdentifier, 
        ImageColor3 = v4.color, 
        ImageTransparency = v4.transparency, 
        ScaleType = Enum.ScaleType.Fit, 
        Size = UDim2.fromScale(1, 1), 
        ZIndex = v4.ZIndex, 
        [v1.Tag] = v4.tag
    }, {
        CornerRadius = v1.createElement("UICorner", {
            CornerRadius = v4.cornerRadius
        })
    });
end;