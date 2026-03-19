local v0 = require(script.Parent.Colors);
local v1 = require(script.Parent.Parent.TopBar.Constants);
local v4 = {
    ContainerBackgroundTransparency = 0, 
    ContainerBackgroundColor = v0.Carbon, 
    UseContainerAspectRatio = false, 
    ContainerAspectRatio = nil, 
    MaxAssetCardsPerRow = 3, 
    ContainerSize = function(v2) --[[ Line: 10 ]] --[[ Name: ContainerSize ]]
        -- upvalues: v1 (copy)
        return UDim2.new(1, 0, 1, -v1.TopBarHeight * v2);
    end, 
    ContainerAnchorPoint = Vector2.new(0.5, 0), 
    ContainerPosition = function(v3) --[[ Line: 15 ]] --[[ Name: ContainerPosition ]]
        -- upvalues: v1 (copy)
        return UDim2.new(0.5, 0, 0, v1.TopBarHeight * v3);
    end, 
    AvatarHeadShotSize = 48, 
    TopSizeY = 90, 
    ClipsDescendants = false, 
    PlayerViewportSize = UDim2.new(1, 0, 0.41, 0), 
    AssetListSize = UDim2.new(1, 0, 0.59, -42), 
    AssetListPosition = UDim2.new(0, 0, 0.41, 42), 
    CloseButtonPosition = UDim2.new(0, 6, 0, -20), 
    DetailsThumbnailFrameSize = UDim2.new(1, 0, 0.4, 0), 
    DetailsThumbnailFramePosition = UDim2.new(0, 0, 0, 15), 
    DetailsThumbnailAnchorPoint = Vector2.new(0.5, 0.5), 
    DetailsThumbnailPosition = UDim2.new(0.5, 0, 0.5, 0), 
    DetailsThumbnailARDominantAxis = Enum.DominantAxis.Height, 
    DetailsFramePosition = UDim2.new(0, 15, 0.4, 15), 
    DetailsFrameSize = UDim2.new(1, -30, 0.6, -30), 
    AssetCardMaxSizeX = 108, 
    AssetCardMaxSizeY = 157, 
    DefaultCameraOffset = CFrame.new(0, 2, -5), 
    ToolOffset = CFrame.new(0, 2, -8), 
    TryOnPosition = UDim2.new(0, 0, 0, 15), 
    TryOnSize = UDim2.new(1, 0, 0.4, 0), 
    BorderPaddingSize = 20, 
    AssetTextMaxSize = 14
};
setmetatable(v4, {
    __newindex = function(_, _, _) --[[ Line: 44 ]] --[[ Name: __newindex ]]

    end, 
    __index = function(_, v9) --[[ Line: 45 ]] --[[ Name: __index ]]
        error("CompactView table has no value: " .. tostring(v9));
    end
});
return v4;