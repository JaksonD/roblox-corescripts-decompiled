local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = {
    BackgroundTransparency = 1, 
    BorderSizePixel = 0, 
    heightOffset = 0
};
return function(v3) --[[ Line: 20 ]] --[[ Name: TopBarContentFrame ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v4 = v3.heightOffset or v2.heightOffset;
    return v1.createElement("Frame", {
        Position = UDim2.new(0, 0, 0, v4), 
        Size = UDim2.new(1, 0, 1, -v4), 
        ZIndex = v3.ZIndex, 
        BackgroundColor3 = v3.BackgroundColor3, 
        BackgroundTransparency = v3.BackgroundTransparency or v2.BackgroundTransparency, 
        BorderSizePixel = v3.BorderSizePixel or v2.BorderSizePixel, 
        ClipsDescendants = v3.ClipsDescendants
    }, v3.children);
end;