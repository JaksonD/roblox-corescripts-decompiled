local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_Modules_0.Shell.GlobalSettings);
local v4 = require(l_Modules_0.Shell.LocalizedStrings);
return function(_) --[[ Line: 10 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    return v2.createElement("ImageLabel", {
        Size = UDim2.new(0, 599, 0, 404), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/ScreenAdjustment/Controller@1080.png"
    }, {
        Line = v2.createElement("Frame", {
            Size = UDim2.new(0, 240, 0, 1), 
            Position = UDim2.new(0, 437, 0, 220), 
            BackgroundTransparency = 0, 
            BackgroundColor3 = Color3.new(1, 1, 1), 
            BorderSizePixel = 0
        }, {
            InputHint = v2.createElement("TextLabel", {
                Size = UDim2.new(0, 0, 0, 0), 
                Position = UDim2.new(1, 3, 0, -1), 
                BackgroundTransparency = 1, 
                Font = v3.RegularFont, 
                FontSize = v3.ButtonSize, 
                TextColor3 = v3.WhiteTextColor, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = v4:LocalizedString("ResizeScreenInputHint")
            })
        })
    });
end;