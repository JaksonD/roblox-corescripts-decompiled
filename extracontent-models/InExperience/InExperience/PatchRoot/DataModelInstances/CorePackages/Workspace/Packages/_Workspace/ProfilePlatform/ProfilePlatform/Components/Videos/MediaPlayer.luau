local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local l_StateLayerAffordance_0 = v2.Enums.StateLayerAffordance;
local l_Image_0 = v2.Image;
local l_View_0 = v2.View;
local v7 = require(l_script_FirstAncestor_0.Components.Videos.LoadableVideo);
local v8 = require(l_script_FirstAncestor_0.Components.Videos.TimeDurationOverlay);
return function(v9) --[[ Line: 33 ]] --[[ Name: MediaPlayer ]]
    -- upvalues: v3 (copy), l_View_0 (copy), l_StateLayerAffordance_0 (copy), v7 (copy), l_Image_0 (copy), v8 (copy)
    local v10 = v3.useCallback(function() --[[ Line: 34 ]]
        -- upvalues: v9 (copy)
        if v9.onExpandCallback then
            v9.onExpandCallback();
        end;
    end, {
        v9.onExpandCallback
    });
    local v11 = v3.useMemo(function() --[[ Line: 40 ]]
        -- upvalues: v9 (copy)
        return v9.Video or not v9.thumbnailImage;
    end, {
        v9.Video, 
        v9.thumbnailImage
    });
    return v3.createElement(l_View_0, {
        onActivated = v10, 
        stateLayer = {
            affordance = l_StateLayerAffordance_0.None
        }, 
        tag = "shrink size-full", 
        ZIndex = v9.ZIndex
    }, {
        VideoPreview = if v11 then v3.createElement(v7, {
            cornerRadius = v9.cornerRadius, 
            Looped = v9.Looped, 
            onLoaded = v9.onVideoLoaded, 
            Playing = v9.Playing, 
            Position = v9.Position, 
            renderOnFailed = v9.renderOnFailed, 
            scaleType = v9.scaleType, 
            Size = v9.Size, 
            Video = v9.Video, 
            videoRef = v9.videoRef
        }) else nil, 
        ThumbnailImage = if not v9.thumbnailImage or v9.Playing then nil else v3.createElement(l_Image_0, {
            cornerRadius = if v9.cornerRadius then UDim.new(0, v9.cornerRadius) else nil, 
            Image = v9.thumbnailImage, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 2
        }), 
        TimeDurationOverlay = if not (not not v9.Playing or v9.isFullScreen) and v9.timeLength and v9.timeLength > 0 then v3.createElement(v8, {
            timeLength = v9.timeLength
        }) else nil
    });
end;