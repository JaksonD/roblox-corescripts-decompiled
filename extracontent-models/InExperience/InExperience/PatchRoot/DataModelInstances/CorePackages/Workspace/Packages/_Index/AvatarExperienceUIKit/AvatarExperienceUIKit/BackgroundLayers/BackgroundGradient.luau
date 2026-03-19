local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceUIKit").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Dash);
local v3 = {
    offset = Vector2.new(), 
    rotation = 90, 
    transparency = NumberSequence.new(0)
};
return function(v4) --[[ Line: 22 ]] --[[ Name: BackgroundGradient ]]
    -- upvalues: v2 (copy), v3 (copy), v1 (copy)
    v4 = v2.join(v3, v4);
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
        BorderSizePixel = 0, 
        ZIndex = v4.ZIndex, 
        [v1.Tag] = v4.tag
    }, {
        CornerRadius = v1.createElement("UICorner", {
            CornerRadius = v4.cornerRadius
        }), 
        UIGradient = v1.createElement("UIGradient", {
            Color = v4.colorSequence, 
            Offset = v4.offset, 
            Rotation = v4.rotation, 
            Transparency = v4.transparency
        })
    });
end;