local l_CorePackages_0 = game:GetService("CorePackages");
local l_Color_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Color;
local v2 = {
    Obsidian = l_Color_0.Color3FromHex(1579291), 
    Carbon = l_Color_0.Color3FromHex(2040099), 
    Slate = l_Color_0.Color3FromHex(2303271), 
    Flint = l_Color_0.Color3FromHex(3750717), 
    Graphite = l_Color_0.Color3FromHex(6645352), 
    Pumice = l_Color_0.Color3FromHex(12435134), 
    Black = Color3.fromRGB(0, 0, 0), 
    White = Color3.fromRGB(255, 255, 255), 
    Gray1 = l_Color_0.Color3FromHex(1644825), 
    Gray2 = l_Color_0.Color3FromHex(7697781), 
    Gray4 = l_Color_0.Color3FromHex(14935011), 
    GrayBackground = l_Color_0.Color3FromHex(14211288), 
    Green = l_Color_0.Color3FromHex(45167), 
    DisabledGreen = l_Color_0.Color3FromHex(10273956)
};
setmetatable(v2, {
    __newindex = function(_, _, _) --[[ Line: 25 ]] --[[ Name: __newindex ]]

    end, 
    __index = function(_, v7) --[[ Line: 26 ]] --[[ Name: __index ]]
        error("Colors table has no value: " .. tostring(v7));
    end
});
return v2;