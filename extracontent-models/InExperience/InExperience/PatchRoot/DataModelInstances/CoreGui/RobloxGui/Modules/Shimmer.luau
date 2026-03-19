local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local l_TweenService_0 = game:GetService("TweenService");
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).Constants;
local v6 = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, false, 0);
local v7 = {};
v7.__index = v7;
local v9 = {
    PrimaryButton = function(v8) --[[ Line: 16 ]]
        -- upvalues: l_Create_0 (copy), l_Constants_0 (copy)
        return l_Create_0("ImageLabel")({
            Name = "ShimmerFrame", 
            BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
            BackgroundTransparency = 0.7, 
            ClipsDescendants = true, 
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            Visible = false, 
            Parent = v8, 
            ZIndex = 8; 
            l_Create_0("ImageLabel")({
                Name = "Shimmer", 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 2, 0), 
                Position = UDim2.new(-1, 0, 0, 0), 
                Image = l_Constants_0.SHIMMER_TEXTURE, 
                BorderSizePixel = 0, 
                ZIndex = 8
            }), 
            l_Create_0("ImageLabel")({
                Name = "ShimmerOverlay", 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 9, 9), 
                ImageColor3 = l_Constants_0.COLORS.FLINT, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Image = l_Constants_0.OVERLAY_TEXTURE, 
                Size = UDim2.new(1, 0, 1, 0), 
                ZIndex = 9
            })
        });
    end
};
v7.new = function(v10, v11) --[[ Line: 51 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy), v7 (copy), l_TweenService_0 (copy), v6 (copy)
    if not v11 or not v9[v11] then
        return;
    else
        local v12 = setmetatable({}, v7);
        v12._shimmer = v9[v11](v10);
        v12._shimmerAnimation = l_TweenService_0:Create(v12._shimmer.Shimmer, v6, {
            Position = UDim2.new(1, 0, 0, 0)
        });
        return v12;
    end;
end;
v7.play = function(v13) --[[ Line: 61 ]] --[[ Name: play ]]
    v13._shimmer.Visible = true;
    v13._shimmerAnimation:Play();
end;
v7.stop = function(v14) --[[ Line: 66 ]] --[[ Name: stop ]]
    v14._shimmerAnimation:Cancel();
    v14._shimmer.Visible = false;
end;
return v7;