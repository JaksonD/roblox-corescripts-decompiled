local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v4 = {
    TabSelectionHeight = 6
};
v4.MakeTabSelectionWidget = function(v5) --[[ Line: 24 ]] --[[ Name: MakeTabSelectionWidget ]]
    -- upvalues: l_Create_0 (copy), v4 (copy)
    return (l_Create_0("ImageLabel")({
        Name = "TabSelection", 
        Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuSelection.png", 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(3, 1, 4, 5), 
        Visible = false, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v4.TabSelectionHeight), 
        Position = UDim2.new(0, 0, 1, -v4.TabSelectionHeight), 
        Parent = v5
    }));
end;
return v4;