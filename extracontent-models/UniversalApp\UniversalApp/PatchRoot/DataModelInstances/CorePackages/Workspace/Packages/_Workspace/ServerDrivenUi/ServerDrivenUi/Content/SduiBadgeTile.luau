local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v4 = require(l_Parent_0.Cryo);
local l_LoadableImage_0 = require(l_Parent_0.UIBlox).App.Loading.LoadableImage;
local v6 = require(l_script_FirstAncestor_0.Content.SduiTile);
local v7 = game:DefineFastFlag("SduiBadgeTileContained", false);
return v2.memo(function(v8) --[[ Line: 20 ]] --[[ Name: SduiBadgeTile ]]
    -- upvalues: l_useTokens_0 (copy), v7 (copy), v2 (copy), l_LoadableImage_0 (copy), v4 (copy), v6 (copy)
    local v9 = l_useTokens_0();
    local v10 = v8.cornerRadius or v9.Radius.Medium;
    local v11 = v8.imageCornerRadius or 1000;
    local v12 = v8.imagePadding or v9.Padding.Medium;
    local v13 = nil;
    local v14 = nil;
    if v7 then
        v13 = v8.isContained == nil or v8.isContained;
        v14 = if v13 then v10 else 0;
    end;
    local v15 = v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, if v7 then v14 else 0), 
        BorderSizePixel = v7 and 0 or nil, 
        ClipsDescendants = v7 and true or nil, 
        BackgroundColor3 = v8.thumbnailBackgroundStyle and v8.thumbnailBackgroundStyle.Color3 or nil, 
        BackgroundTransparency = v8.thumbnailBackgroundStyle and v8.thumbnailBackgroundStyle.Transparency or 1, 
        ZIndex = -3
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, v10)
        }), 
        ThumbnailFrame = v2.createElement("Frame", {
            Size = UDim2.new(1, -2 * v12, 1, if v7 then -2 * v12 - v14 else -2 * v12), 
            BackgroundTransparency = 1, 
            Position = if v12 then UDim2.fromOffset(v12, v12) else nil
        }, {
            Thumbnail = if v8.imageComponent then v8.imageComponent else if v8.image then v2.createElement(l_LoadableImage_0, {
                BackgroundTransparency = 1, 
                Image = v8.image, 
                Size = UDim2.new(1, 0, 1, 0), 
                cornerRadius = UDim.new(0, v11), 
                showFailedStateWhenLoadingFailed = true, 
                useShimmerAnimationWhileLoading = true
            }) else nil
        })
    });
    local v16 = v4.Dictionary.join(v8, {
        testId = "--sdui-badge-tile", 
        imageComponent = v15, 
        isContained = if v7 then v13 else nil
    });
    return v2.createElement(v6, v16);
end);