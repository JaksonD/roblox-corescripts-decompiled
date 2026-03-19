local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_LoadableImage_0 = require(l_CorePackages_0.Packages.UIBlox).App.Loading.LoadableImage;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
return function(v4) --[[ Line: 13 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v1 (copy), l_LoadableImage_0 (copy)
    local v5 = l_useDesignTokens_0();
    return v1.createElement("Frame", {
        Size = UDim2.fromOffset(v5.Global.Size_1200, v5.Global.Size_1200), 
        BackgroundTransparency = 0
    }, {
        AvatarThumbnail = v1.createElement(l_LoadableImage_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, v5.Global.Size_1200, 0, v5.Global.Size_1200), 
            ScaleType = Enum.ScaleType.Fit, 
            BackgroundTransparency = 1, 
            Image = v4.thumbnailUrl, 
            useShimmerAnimationWhileLoading = true, 
            ZIndex = 2
        })
    });
end;