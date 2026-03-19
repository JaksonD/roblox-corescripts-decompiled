local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v5 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v9 = require(l_script_FirstAncestor_0.Video.useIsVideoEligible);
local v10 = require(l_Parent_0.VideoUtils);
local l_VideoPlaybackDetector_0 = v10.VideoPlaybackDetector;
local l_VideoEndReason_0 = v10.AnalyticsEnums.VideoEndReason;
local l_useCanDevicePlayVideoPreview_0 = v10.useCanDevicePlayVideoPreview;
local l_FetchGamePlayabilityAndProductInfo_0 = require(l_Parent_0.GameDetailRodux).FetchGamePlayabilityAndProductInfo;
local l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview;
local l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTileVideoDeviceMemoryBlocking;
local v17 = game:DefineFastFlag("LuaAppGameTileVideoManufacturerDeny", false);
local v18 = game:DefineFastFlag("LuaAppGameTileVideoDeviceDeny", false);
local v19 = game:DefineFastFlag("LuaAppGameTileVideoMaxMemoryDeny", false);
local v20 = game:DefineFastFlag("LuaAppGameTileVideoAvailableRamDeny", false);
local v21 = game:DefineFastInt("LuaAppGameTileVideoMaxMemoryThresholdMb", -1);
local v22 = game:DefineFastInt("LuaAppGameTileVideoAvailableRamThresholdMb", -1);
local v23 = game:DefineFastString("LuaAppGameTileVideoManufacturerPipeDenyList", "");
local v24 = game:DefineFastString("LuaAppGameTileVideoDevicePipeDenyList", "");
local v25 = nil;
if l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 then
    v25 = {
        enableManufacturerDeny = v17, 
        enableDeviceDeny = v18, 
        enableMaxMemoryDeny = v19, 
        enableAvailableRamDeny = v20, 
        maxMemoryThresholdMb = v21, 
        availableRamThresholdMb = v22, 
        manufacturerDenyList = v23, 
        deviceDenyList = v24
    };
end;
return function(v26) --[[ Line: 67 ]] --[[ Name: GameVideoPlaybackDetector ]]
    -- upvalues: l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useSelector_0 (copy), l_FetchGamePlayabilityAndProductInfo_0 (copy), v9 (copy), l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 (copy), v2 (copy), l_useCanDevicePlayVideoPreview_0 (copy), v25 (ref), l_RetrievalStatus_0 (copy), l_VideoEndReason_0 (copy), l_VideoPlaybackDetector_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (copy)
    local v27 = l_useDispatch_0();
    local v28 = l_useRoactService_0(l_RoactNetworking_0);
    local v30 = l_useSelector_0(function(v29) --[[ Line: 71 ]]
        -- upvalues: l_FetchGamePlayabilityAndProductInfo_0 (ref), v26 (copy)
        return l_FetchGamePlayabilityAndProductInfo_0.GetFetchingStatus(v29, v26.universeId);
    end);
    local v31 = v9(v26.universeId);
    local v32 = nil;
    local v33 = nil;
    local v34 = nil;
    local v35 = nil;
    if l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 then
        local v36, v37 = v2.useState(false);
        v32 = v36;
        v33 = v37;
        v34 = l_useCanDevicePlayVideoPreview_0(v25, v26.universeId, v26.pageContext);
        v35 = v31 and v32;
    end;
    local v39 = v2.useCallback(function(v38) --[[ Line: 89 ]]
        -- upvalues: v26 (copy), v30 (copy), l_RetrievalStatus_0 (ref), l_VideoEndReason_0 (ref)
        if v26.videoAnalytics and v30 == l_RetrievalStatus_0.Done then
            v26.videoAnalytics.reportVideoEnd(v26.itemIndex, l_VideoEndReason_0.PlayabilityCheckFailed, v38, -1);
        end;
    end, {
        v26.videoAnalytics, 
        v30
    });
    local v40 = v2.useCallback(function() --[[ Line: 96 ]]
        -- upvalues: v30 (copy), l_RetrievalStatus_0 (ref), v27 (copy), l_FetchGamePlayabilityAndProductInfo_0 (ref), v28 (copy), v26 (copy), l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 (ref), v33 (ref), v34 (ref)
        if v30 == l_RetrievalStatus_0.NotStarted or v30 == l_RetrievalStatus_0.Failed then
            v27(l_FetchGamePlayabilityAndProductInfo_0.Fetch(v28, v26.universeId));
        end;
        if l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 then
            v33(v34());
        end;
    end, {
        v26.universeId, 
        v30, 
        v27, 
        v28, 
        v34
    });
    return v2.createElement(l_VideoPlaybackDetector_0, {
        videoKey = v26.videoKey, 
        itemIndex = v26.itemIndex, 
        itemFrameRef = v26.tileRef, 
        isHoverSupported = v26.isHoverSupported, 
        isHovered = v26.isHovered, 
        autoplay = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then v26.autoplay else nil, 
        videoPlaybackCoordinator = v26.videoPlaybackCoordinator, 
        onPlaybackChange = v26.onPlaybackChange, 
        videoAnalytics = v26.videoAnalytics, 
        videoDwellTimeInSec = v26.videoDwellTimeInSec, 
        videoVisiblePercent = v26.videoVisiblePercent, 
        isVideoEligible = if l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 then v35 else v31, 
        onVideoIneligible = v39, 
        onPlaybackCandidate = v40
    });
end;