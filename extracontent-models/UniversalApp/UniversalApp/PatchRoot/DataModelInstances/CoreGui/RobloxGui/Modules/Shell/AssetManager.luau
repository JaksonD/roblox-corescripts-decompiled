local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = l_CoreGui_0:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
return {
    CreateShadow = function(v4) --[[ Line: 14 ]] --[[ Name: CreateShadow ]]
        -- upvalues: l_Create_0 (copy)
        return l_Create_0("ImageLabel")({
            Name = "Shadow", 
            Image = "rbxasset://textures/ui/Shell/Buttons/Generic9ScaleShadow.png", 
            Size = UDim2.new(1, 3, 1, 3), 
            Position = UDim2.new(0, 0, 0, 0), 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(10, 10, 28, 28), 
            BackgroundTransparency = 1, 
            ZIndex = v4 or 1
        });
    end
};