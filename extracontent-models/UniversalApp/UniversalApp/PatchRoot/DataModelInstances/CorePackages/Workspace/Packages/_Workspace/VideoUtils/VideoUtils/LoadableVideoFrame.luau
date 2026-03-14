local l_script_FirstAncestor_0 = script:FindFirstAncestor("VideoUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.VideoFrameWrapper);
local v3 = require(l_Parent_0.ArgCheck);
local l_LoadableImage_0 = require(l_Parent_0.UIBlox).App.Loading.LoadableImage;
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.Foundation);
local l_Radius_0 = v6.Enums.Radius;
local l_Skeleton_0 = v6.Skeleton;
local l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEdpMediaGalleryAutoAdvance;
local l_FFlagLuaAppEdpMediaGalleryFullScreen_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen;
local l_FFlagLuaAppVideoPreviewSmoothTransition_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppVideoPreviewSmoothTransition;
local l_FFlagLuaAppVideoFrameSingleTilePooling_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppVideoFrameSingleTilePooling;
local function v26(v13, v14) --[[ Line: 36 ]] --[[ Name: LoadableVideoFrame ]]
    -- upvalues: v5 (copy), l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (copy), v3 (copy), l_FFlagLuaAppVideoFrameSingleTilePooling_0 (copy), v2 (copy), l_FFlagLuaAppVideoPreviewSmoothTransition_0 (copy), l_LoadableImage_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy)
    local v15, v16 = v5.useState(false);
    local v17 = if not not l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 or l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then nil else v5.useRef(nil);
    local v18 = v5.useRef(nil);
    if v13.shouldStartPlayback and v18.current == nil then
        v18.current = tick();
    elseif not v13.shouldStartPlayback then
        v18.current = nil;
    end;
    local v19 = false;
    if v13.thumbnail ~= nil then
        v19 = v13.thumbnail ~= "";
    end;
    local v23 = v5.useCallback(function() --[[ Line: 54 ]]
        -- upvalues: l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 (ref), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), v14 (copy), v17 (copy), v3 (ref), v18 (copy), v13 (copy), v16 (copy)
        local v20 = nil;
        if l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 or l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then
            if typeof(v14) == "table" then
                v20 = v14.current;
            else
                warn((("unsupported ref type: %*"):format((typeof(v14)))));
            end;
        else
            v20 = v17.current;
        end;
        if v20 ~= nil then
            local v21 = tick();
            v3.assert(v18.current and v18.current <= v21);
            local v22 = if v18.current and v18.current <= v21 then v21 - v18.current else -1;
            if v13.onVideoLoaded then
                v13.onVideoLoaded(v20.TimeLength, v22);
            end;
            v16(true);
        end;
    end, {
        v13.onVideoLoaded, 
        if not not l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 or l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v14 else v17, 
        v18
    });
    local v24 = if l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 then v5.useCallback(function() --[[ Line: 91 ]]
        -- upvalues: v13 (copy)
        if v13.onVideoEnded then
            v13.onVideoEnded();
        end;
    end, {
        v13.onVideoEnded
    }) else nil;
    local v25 = v5.useCallback(function() --[[ Line: 98 ]]
        -- upvalues: v13 (copy)
        if v13.onVideoLooped then
            v13.onVideoLooped();
        end;
    end, {
        v13.onVideoLooped
    });
    return v5.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ClipsDescendants = true
    }, {
        VideoFrame = if not not l_FFlagLuaAppVideoFrameSingleTilePooling_0 or v13.shouldStartPlayback then v5.createElement(v2, {
            videoFrameRef = if not not l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 or l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v14 else v17, 
            video = v13.video, 
            isPlaying = if l_FFlagLuaAppVideoFrameSingleTilePooling_0 then v13.shouldStartPlayback else nil, 
            looped = v13.looped, 
            volume = v13.muted and 0 or nil, 
            onLoaded = v23, 
            onLooped = v25, 
            onEnded = if l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 then v24 else nil, 
            cornerRadius = v13.cornerRadius, 
            zIndex = l_FFlagLuaAppVideoPreviewSmoothTransition_0 and 4 or nil
        }) else nil, 
        VideoThumbnail = if if l_FFlagLuaAppVideoPreviewSmoothTransition_0 then v19 else (not v13.shouldStartPlayback or not v15) and v19 then v5.createElement(l_LoadableImage_0, {
            BackgroundTransparency = 1, 
            Image = v13.thumbnail, 
            Size = UDim2.new(1, 0, 1, if v13.ScaleType == Enum.ScaleType.Tile then v13.cornerRadius else 0), 
            cornerRadius = UDim.new(0, v13.cornerRadius), 
            showFailedStateWhenLoadingFailed = true, 
            useShimmerAnimationWhileLoading = true, 
            ZIndex = 2, 
            ScaleType = v13.ScaleType, 
            TileSize = if v13.ScaleType == Enum.ScaleType.Tile and v13.cornerRadius then UDim2.new(1, 0, 1, -v13.cornerRadius) else nil
        }) else nil, 
        Skeleton = if not v13.shouldStartPlayback or v15 then nil else v5.createElement(l_Skeleton_0, {
            Size = UDim2.fromScale(1, 1), 
            radius = if v13.cornerRadius then l_Radius_0.Medium else nil, 
            ZIndex = 3
        })
    });
end;
if l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 or l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then
    return v5.forwardRef(v26);
else
    return v26;
end;