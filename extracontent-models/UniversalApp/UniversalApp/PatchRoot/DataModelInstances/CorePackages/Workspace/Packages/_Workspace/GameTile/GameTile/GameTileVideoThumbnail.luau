local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_VideoPlayer_0 = require(l_Parent_0.VideoUtils).VideoPlayer;
local _ = require(l_script_FirstAncestor_0.GameTileTypes);
local l_FFlagLuaAppEdpMediaGalleryFullScreen_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen;
local l_VideoPlaybackCoordinator_0 = require(l_Parent_0.VideoUtils).VideoPlaybackCoordinator;
return function(v7) --[[ Line: 31 ]] --[[ Name: GameTileVideoThumbnail ]]
    -- upvalues: v2 (copy), l_VideoPlaybackCoordinator_0 (copy), l_VideoPlayer_0 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (copy)
    local v10 = v2.useCallback(function(v8, v9) --[[ Line: 32 ]]
        -- upvalues: v7 (copy), l_VideoPlaybackCoordinator_0 (ref)
        if v7.videoAnalytics then
            v7.videoAnalytics.reportVideoLoad(v7.itemIndex, l_VideoPlaybackCoordinator_0.default.currentPlaybackSessionId, v8, v9);
        end;
    end, {
        v7.itemIndex, 
        v7.videoAnalytics
    });
    local v11 = v2.useCallback(function() --[[ Line: 43 ]]
        -- upvalues: v7 (copy), l_VideoPlaybackCoordinator_0 (ref)
        if v7.videoAnalytics then
            v7.videoAnalytics.reportVideoLoop(v7.itemIndex, l_VideoPlaybackCoordinator_0.default.currentPlaybackSessionId);
        end;
    end, {
        v7.itemIndex, 
        v7.videoAnalytics
    });
    return v2.createElement(l_VideoPlayer_0, {
        video = v7.video, 
        thumbnail = v7.image, 
        shouldStartPlayback = v7.playing, 
        muted = true, 
        looped = v7.looped, 
        Size = v7.Size, 
        ScaleType = if v7.isTileContained then Enum.ScaleType.Tile else nil, 
        ZIndex = v7.ZIndex, 
        cornerRadius = v7.cornerRadius, 
        onVideoLoaded = v10, 
        onVideoLooped = v11, 
        onVideoPlayerActivated = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v7.onActivated else nil
    });
end;