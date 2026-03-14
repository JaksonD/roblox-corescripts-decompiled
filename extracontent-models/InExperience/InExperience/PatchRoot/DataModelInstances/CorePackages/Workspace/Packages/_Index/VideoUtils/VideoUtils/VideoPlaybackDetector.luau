local l_ExperienceService_0 = game:GetService("ExperienceService");
local l_AppLifecycleObserverService_0 = game:GetService("AppLifecycleObserverService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("VideoUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.AppCommonLib);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.Responsive);
local l_useLastInput_0 = v7.useLastInput;
local l_useNavigationFocus_0 = require(l_Parent_0.Navigation).useNavigationFocus;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local _ = require(l_script_FirstAncestor_0.Analytics.VideoAnalyticsTypes);
local l_VideoEndReason_0 = require(l_script_FirstAncestor_0.Analytics.Enums).VideoEndReason;
local v13 = require(l_script_FirstAncestor_0.Analytics.VideoLogger);
local l_VideoActions_0 = require(l_script_FirstAncestor_0.Analytics.Enums).VideoActions;
local v15 = require(l_script_FirstAncestor_0.VideoPlaybackCoordinator);
local l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview;
local l_FFlagLuaAppEdpMediaGalleryFullScreen_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen;
local v18 = game:DefineFastFlag("VideoPlaybackDetectorCancelPendingScanTask", false);
local v19 = game:DefineFastInt("VideoPlaybackDetectorScanDebounceInMilliseconds", 1000);
local l_FFlagBrandVideosEnableActionAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagBrandVideosEnableActionAnalytics;
local v21 = if v18 then v19 / 1000 else 0.5;
return function(v22) --[[ Line: 73 ]] --[[ Name: VideoPlaybackDetector ]]
    -- upvalues: v15 (copy), v6 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (copy), l_useLastInput_0 (copy), l_useNavigationFocus_0 (copy), l_useSelector_0 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (copy), v13 (copy), l_VideoActions_0 (copy), v4 (copy), l_VideoEndReason_0 (copy), v7 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (copy), v21 (copy), v18 (copy), l_AppLifecycleObserverService_0 (copy), l_ExperienceService_0 (copy)
    local v23 = v22.videoPlaybackCoordinator or v15.default;
    local v24, v25 = v6.useState(false);
    local v26 = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then nil else l_useLastInput_0();
    local v27 = l_useNavigationFocus_0();
    local v29 = l_useSelector_0(function(v28) --[[ Line: 82 ]]
        return v28.ScreenSize;
    end);
    local v31 = l_useSelector_0(function(v30) --[[ Line: 86 ]]
        return v30.TopBar.topBarHeight;
    end);
    local v33 = l_useSelector_0(function(v32) --[[ Line: 90 ]]
        return v32.GlobalGuiInset;
    end);
    local v34 = v6.useMemo(function() --[[ Line: 94 ]]
        -- upvalues: v31 (copy), v29 (copy), v33 (copy)
        return {
            min = Vector2.new(0, v31), 
            max = Vector2.new(v29.X, v29.Y - v33.bottom)
        };
    end, {
        v31, 
        v29, 
        v33
    });
    local v36 = v6.useCallback(function(v35) --[[ Line: 102 ]]
        -- upvalues: v22 (copy), v23 (copy)
        if v22.onPlaybackCandidate then
            v22.onPlaybackCandidate();
        end;
        if v22.isVideoEligible then
            v23:requestPlayback(v22.videoKey, v35, v22.videoDwellTimeInSec, v22.itemIndex, v22.videoAnalytics);
            return;
        else
            if v22.onVideoIneligible then
                v22.onVideoIneligible(v23.currentPlaybackSessionId);
            end;
            return;
        end;
    end, {
        v22.videoKey, 
        v22.itemIndex, 
        v22.videoAnalytics, 
        v22.isVideoEligible, 
        v22.onVideoIneligible, 
        v22.onPlaybackCandidate, 
        v22.videoDwellTimeInSec, 
        v23
    });
    local v39 = v6.useCallback(function(v37, v38) --[[ Line: 132 ]]
        -- upvalues: v23 (copy), v22 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (ref)
        v23:cancelPlayback(v22.videoKey, v37, v22.itemIndex, v22.videoAnalytics, if l_FFlagBrandVideosEnableActionAnalytics_0 then v38 else nil);
    end, {
        v22.videoKey, 
        v22.itemIndex, 
        v22.videoAnalytics, 
        v23
    });
    v6.useEffect(function() --[[ Line: 150 ]]
        -- upvalues: v22 (copy), v24 (copy), v25 (copy), v23 (copy)
        local function _(v40) --[[ Line: 151 ]] --[[ Name: checkAndUpdateState ]]
            -- upvalues: v22 (ref), v24 (ref), v25 (ref)
            local v41 = v40 == v22.videoKey;
            if v41 ~= v24 then
                v22.onPlaybackChange(v41);
                v25(v41);
            end;
        end;
        local v43 = v23.playingVideoKey == v22.videoKey;
        if v43 ~= v24 then
            v22.onPlaybackChange(v43);
            v25(v43);
        end;
        local v46 = v23.changed:connect(function(v44) --[[ Line: 162 ]]
            -- upvalues: v22 (ref), v24 (ref), v25 (ref)
            local v45 = v44 == v22.videoKey;
            if v45 ~= v24 then
                v22.onPlaybackChange(v45);
                v25(v45);
            end;
        end);
        return function() --[[ Line: 166 ]]
            -- upvalues: v46 (ref)
            if v46 ~= nil then
                v46:disconnect();
                v46 = nil;
            end;
        end;
    end, {
        v22.videoKey, 
        v22.onPlaybackChange, 
        v23, 
        v24
    });
    v6.useEffect(function() --[[ Line: 176 ]]
        -- upvalues: v22 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (ref), v27 (copy), v36 (copy), v23 (copy), v13 (ref), l_VideoActions_0 (ref), v4 (ref), v39 (copy), l_VideoEndReason_0 (ref)
        if not v22.isHoverSupported or l_FFlagBrandVideosEnableActionAnalytics_0 and not v27 then
            return;
        else
            if v22.isHovered then
                v36(false);
                if l_FFlagBrandVideosEnableActionAnalytics_0 and v22.videoAnalyticsFields then
                    local v47 = v23:getVideoMetadata(v22.videoKey);
                    v13.reportVideoAction(l_VideoActions_0.hover, nil, v4.Dictionary.join(v22.videoAnalyticsFields or {}, {
                        playbackSessionId = v47 and v47.playbackSessionId
                    }));
                    return;
                end;
            else
                v39(l_VideoEndReason_0.Unhovered, if l_FFlagBrandVideosEnableActionAnalytics_0 then v22.videoAnalyticsFields else nil);
            end;
            return;
        end;
    end, {
        v22.isHoverSupported, 
        v22.isHovered, 
        v36, 
        v39, 
        if l_FFlagBrandVideosEnableActionAnalytics_0 then v23 else nil, 
        if l_FFlagBrandVideosEnableActionAnalytics_0 then v27 else nil
    });
    v6.useEffect(function() --[[ Line: 212 ]]
        -- upvalues: l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (ref), v22 (copy), v26 (copy), v7 (ref), v23 (copy), v27 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), v34 (copy), v36 (copy), v39 (copy), l_VideoEndReason_0 (ref), l_FFlagBrandVideosEnableActionAnalytics_0 (ref), v21 (ref), v18 (ref), l_AppLifecycleObserverService_0 (ref), l_ExperienceService_0 (ref)
        if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then
            if not v22.autoplay then
                return nil;
            end;
        elseif v26 ~= v7.Input.Touch then
            return nil;
        end;
        local v48 = {};
        local v49 = nil;
        if v22.itemFrameRef.current ~= nil then
            local l_current_0 = v22.itemFrameRef.current;
            local v51 = nil;
            local v52 = nil;
            do
                local l_v51_0, l_v52_0 = v51, v52;
                local function v55() --[[ Line: 231 ]] --[[ Name: requestPlaybackIfEligible ]]
                    -- upvalues: l_v51_0 (ref), v23 (ref), v27 (ref), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), v22 (ref), v34 (ref), v36 (ref), v39 (ref), l_VideoEndReason_0 (ref), l_FFlagBrandVideosEnableActionAnalytics_0 (ref)
                    l_v51_0 = tick();
                    if v23:isPlaybackCandidate(v27, if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v22.isItemOccluded else nil, v22.itemFrameRef, v34, v22.videoVisiblePercent) then
                        v36(true);
                        return;
                    else
                        v39(l_VideoEndReason_0.ExitViewport, if l_FFlagBrandVideosEnableActionAnalytics_0 then v22.videoAnalyticsFields else nil);
                        return;
                    end;
                end;
                local function v58() --[[ Line: 252 ]] --[[ Name: onItemFrameLayoutChange ]]
                    -- upvalues: l_v52_0 (ref), l_v51_0 (ref), v21 (ref), v55 (copy), v18 (ref), v49 (ref)
                    if l_v52_0 ~= nil then
                        return;
                    else
                        local v56 = 0;
                        if l_v51_0 ~= nil then
                            l_v52_0 = l_v51_0 + v21;
                            v56 = l_v52_0 - tick();
                        end;
                        if v56 > 0 then
                            local v57 = task.delay(v56, function() --[[ Line: 265 ]]
                                -- upvalues: l_v52_0 (ref), v55 (ref)
                                l_v52_0 = nil;
                                v55();
                            end);
                            if v18 then
                                v49 = v57;
                                return;
                            end;
                        else
                            l_v52_0 = nil;
                            v55();
                        end;
                        return;
                    end;
                end;
                v55();
                local v59 = l_AppLifecycleObserverService_0.OnUnhide:Connect(function() --[[ Line: 282 ]]
                    -- upvalues: v55 (copy)
                    v55();
                end);
                local v60 = l_ExperienceService_0:RegisterForExperienceLeave(function() --[[ Line: 288 ]]
                    -- upvalues: v55 (copy)
                    v55();
                end);
                v48 = {
                    l_current_0:GetPropertyChangedSignal("AbsolutePosition"):Connect(v58), 
                    l_current_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(v58)
                };
                table.insert(v48, v59);
                table.insert(v48, v60);
            end;
        end;
        return function() --[[ Line: 301 ]]
            -- upvalues: v18 (ref), v49 (ref), v48 (ref)
            if v18 and v49 then
                task.cancel(v49);
                v49 = nil;
            end;
            for _, v62 in v48 do
                v62:Disconnect();
            end;
        end;
    end, {
        if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v22.isItemOccluded else nil, 
        if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then v22.autoplay else nil, 
        v22.itemFrameRef, 
        v22.videoVisiblePercent, 
        if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then nil else v26, 
        v27, 
        v34, 
        v23, 
        v36, 
        v39
    });
    v6.useEffect(function() --[[ Line: 327 ]]
        -- upvalues: l_AppLifecycleObserverService_0 (ref), v39 (copy), l_VideoEndReason_0 (ref), l_FFlagBrandVideosEnableActionAnalytics_0 (ref), v22 (copy), l_ExperienceService_0 (ref)
        local v63 = l_AppLifecycleObserverService_0.OnHide:Connect(function() --[[ Line: 328 ]]
            -- upvalues: v39 (ref), l_VideoEndReason_0 (ref), l_FFlagBrandVideosEnableActionAnalytics_0 (ref), v22 (ref)
            v39(l_VideoEndReason_0.AppBackgrounded, if l_FFlagBrandVideosEnableActionAnalytics_0 then v22.videoAnalyticsFields else nil);
        end);
        local v64 = l_ExperienceService_0:RegisterForExperienceJoin(function() --[[ Line: 335 ]]
            -- upvalues: v39 (ref), l_VideoEndReason_0 (ref), l_FFlagBrandVideosEnableActionAnalytics_0 (ref), v22 (ref)
            v39(l_VideoEndReason_0.ExperienceLaunched, if l_FFlagBrandVideosEnableActionAnalytics_0 then v22.videoAnalyticsFields else nil);
        end);
        return function() --[[ Line: 342 ]]
            -- upvalues: v39 (ref), l_VideoEndReason_0 (ref), l_FFlagBrandVideosEnableActionAnalytics_0 (ref), v22 (ref), v64 (ref), v63 (ref)
            v39(l_VideoEndReason_0.Unmounted, if l_FFlagBrandVideosEnableActionAnalytics_0 then v22.videoAnalyticsFields else nil);
            if v64 then
                v64:Disconnect();
                v64 = nil;
            end;
            if v63 then
                v63:Disconnect();
                v63 = nil;
            end;
        end;
    end, {
        v39
    });
end;