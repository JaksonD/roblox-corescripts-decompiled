local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local l_LoadableImage_0 = require(l_Parent_0.UIBlox).App.Loading.LoadableImage;
return function(v3) --[[ Line: 13 ]] --[[ Name: AvatarThumbnail ]]
    -- upvalues: v1 (copy), l_LoadableImage_0 (copy)
    return v1.createElement(l_LoadableImage_0, {
        Size = UDim2.fromScale(1, 1), 
        Image = v3.thumbnail, 
        useShimmerAnimationWhileLoading = true, 
        showFailedStateWhenLoadingFailed = true, 
        cornerRadius = v3.cornerRadius
    });
end;