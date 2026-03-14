local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_CorePackages_0.Workspace.Packages.VideoUtils);
local l_VideoActions_0 = v3.AnalyticsEnums.VideoActions;
local l_VideoLogger_0 = v3.VideoLogger;
local l_VideoPlaybackCoordinator_0 = v3.VideoPlaybackCoordinator;
local l_VideoPlaybackDetector_0 = v3.VideoPlaybackDetector;
local l_VideoPlayer_0 = v3.VideoPlayer;
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryAutoAdvance;
local l_FFlagLuaAppEdpMediaGalleryFullScreen_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen;
local l_FIntLuaAppEdpMediaGalleryItemVisiblePercent_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FIntLuaAppEdpMediaGalleryItemVisiblePercent;
local v13 = game:DefineFastInt("LuaAppEdpMediaGalleryVideoDwellTimeInHundredthsSec", 0);
return function(v14) --[[ Line: 54 ]] --[[ Name: MediaGalleryVideoItem ]]
    -- upvalues: l_VideoPlaybackCoordinator_0 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (copy), v1 (copy), v2 (copy), l_VideoLogger_0 (copy), l_VideoActions_0 (copy), l_VideoPlayer_0 (copy), l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 (copy), l_VideoPlaybackDetector_0 (copy), v13 (copy), l_FIntLuaAppEdpMediaGalleryItemVisiblePercent_0 (copy)
    local v15 = v14.videoPlaybackCoordinator or l_VideoPlaybackCoordinator_0.default;
    local v16 = nil;
    v16 = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then ("media_gallery_item_%*_video_%*%*"):format(v14.itemIndex or "0", v14.video or "0", v14.isFullscreen and "_fullscreen" or "") else ("media_gallery_item_%*_video_%*"):format(v14.itemIndex or "0", v14.video or "0");
    local v17, v18 = v1.useState(false);
    local v19 = v1.useRef(nil);
    local v22 = v1.useCallback(function(v20, v21) --[[ Line: 68 ]]
        -- upvalues: v14 (copy), v15 (copy)
        if v14.videoAnalytics then
            v14.videoAnalytics.reportVideoLoad(v14.itemIndex, v15.currentPlaybackSessionId, v20, v21);
        end;
    end, {
        v14.itemIndex, 
        v14.videoAnalytics, 
        v15.currentPlaybackSessionId
    });
    local v24 = v1.useCallback(function(v23) --[[ Line: 79 ]]
        -- upvalues: v2 (ref), v14 (copy), l_VideoLogger_0 (ref), l_VideoActions_0 (ref), v15 (copy)
        v2.assert(v14.universeId);
        l_VideoLogger_0.reportVideoAction(l_VideoActions_0.volume, "GameDetails", {
            videoAssetId = v14.video, 
            source = "MediaGallery", 
            sourceId = v14.universeId or "", 
            playbackSessionId = v15.currentPlaybackSessionId, 
            volumeLevel = v23 and 0 or 1
        });
    end, {
        v14.video, 
        v14.universeId, 
        v15.currentPlaybackSessionId
    });
    local v25 = nil;
    if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then
        v25 = v1.useMemo(function() --[[ Line: 94 ]]
            -- upvalues: v14 (copy), v15 (copy)
            return {
                videoAnalyticsData = {
                    source = "MediaGallery", 
                    sourceId = v14.universeId or nil
                }, 
                getPlaybackSessionId = function() --[[ Line: 102 ]] --[[ Name: getPlaybackSessionId ]]
                    -- upvalues: v15 (ref)
                    return v15.currentPlaybackSessionId;
                end
            };
        end, {
            v14.universeId, 
            v15
        });
    end;
    return v1.createElement("Frame", {
        Size = v14.Size, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ZIndex = v14.ZIndex, 
        ref = v19
    }, {
        VideoPlayer = v1.createElement(l_VideoPlayer_0, {
            video = v14.video, 
            thumbnail = v14.thumbnail, 
            shouldStartPlayback = v17, 
            muted = true, 
            looped = false, 
            Size = UDim2.fromScale(1, 1), 
            cornerRadius = v14.cornerRadius, 
            showMuteButton = true, 
            onMuteButtonActivated = v24, 
            showPlayButton = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v14.isFullscreen else nil, 
            showProgressBar = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v14.isFullscreen else nil, 
            videoAnalyticsContext = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v25 else nil, 
            onVideoLoaded = v22, 
            onVideoProgressChanged = if l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 then v14.onVideoProgressChanged else nil, 
            onVideoEnded = if l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 then v14.onVideoEnded else nil, 
            toggleVideoPlaybackSignal = v14.toggleVideoPlaybackSignal, 
            toggleMuteSignal = v14.toggleMuteSignal, 
            onMutedChanged = v14.onMutedChanged
        }), 
        VideoPlaybackDetector = v1.createElement(l_VideoPlaybackDetector_0, {
            videoKey = v16, 
            itemIndex = v14.itemIndex, 
            itemFrameRef = v19, 
            isItemOccluded = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v14.isMediaGalleryOccluded else nil, 
            autoplay = true, 
            videoPlaybackCoordinator = v15, 
            onPlaybackChange = v18, 
            videoDwellTimeInSec = v13 / 100, 
            videoVisiblePercent = l_FIntLuaAppEdpMediaGalleryItemVisiblePercent_0, 
            isVideoEligible = true, 
            videoAnalytics = v14.videoAnalytics
        })
    });
end;