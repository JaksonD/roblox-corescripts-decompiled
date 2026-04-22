local l_ExperienceService_0 = game:GetService("ExperienceService");
local l_AppLifecycleObserverService_0 = game:GetService("AppLifecycleObserverService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("VideoUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.AppCommonLib);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.Responsive);
local l_useLastInput_0 = v6.useLastInput;
local l_useNavigationFocus_0 = require(l_Parent_0.Navigation).useNavigationFocus;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local _ = require(l_script_FirstAncestor_0.Analytics.VideoAnalyticsTypes);
local l_VideoEndReason_0 = require(l_script_FirstAncestor_0.Analytics.Enums).VideoEndReason;
local v12 = require(l_script_FirstAncestor_0.VideoPlaybackCoordinator);
local v13 = require(l_script_FirstAncestor_0.VideoHoverPlaybackDetector);
local v14 = require(l_script_FirstAncestor_0.VideoViewportPlaybackDetector);
local l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview;
local l_FFlagLuaAppEdpMediaGalleryFullScreen_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen;
local l_FFlagVideoPlaybackDetectorCancelPendingScanTask_0 = require(l_Parent_0.SharedFlags).FFlagVideoPlaybackDetectorCancelPendingScanTask;
local l_FIntVideoPlaybackDetectorScanDebounceInMilliseconds_0 = require(l_Parent_0.SharedFlags).FIntVideoPlaybackDetectorScanDebounceInMilliseconds;
local l_FFlagLuaAppRefactorVideoPlaybackDetector_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppRefactorVideoPlaybackDetector;
local v20 = nil;
if not l_FFlagLuaAppRefactorVideoPlaybackDetector_0 then
    v20 = if l_FFlagVideoPlaybackDetectorCancelPendingScanTask_0 then l_FIntVideoPlaybackDetectorScanDebounceInMilliseconds_0 / 1000 else 0.5;
end;
return function(v21) --[[ Line: 71 ]] --[[ Name: VideoPlaybackDetector ]]
    -- upvalues: v12 (copy), v5 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (copy), l_useLastInput_0 (copy), l_FFlagLuaAppRefactorVideoPlaybackDetector_0 (copy), l_useNavigationFocus_0 (copy), l_useSelector_0 (copy), l_VideoEndReason_0 (copy), v6 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (copy), v20 (ref), l_FFlagVideoPlaybackDetectorCancelPendingScanTask_0 (copy), l_AppLifecycleObserverService_0 (copy), l_ExperienceService_0 (copy), v13 (copy), v14 (copy)
    local v22 = v21.videoPlaybackCoordinator or v12.default;
    local v23, v24 = v5.useState(false);
    local v25 = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then nil else l_useLastInput_0();
    local v26 = nil;
    local v27 = nil;
    local v28 = nil;
    local v29 = nil;
    if not l_FFlagLuaAppRefactorVideoPlaybackDetector_0 then
        v26 = l_useNavigationFocus_0();
        local v31 = l_useSelector_0(function(v30) --[[ Line: 86 ]]
            return v30.ScreenSize;
        end);
        v27 = l_useSelector_0(function(v32) --[[ Line: 90 ]]
            return v32.TopBar.topBarHeight;
        end);
        v28 = l_useSelector_0(function(v33) --[[ Line: 94 ]]
            return v33.GlobalGuiInset;
        end);
        local l_v31_0 = v31 --[[ copy: 9 -> 11 ]];
        v29 = v5.useMemo(function() --[[ Line: 98 ]]
            -- upvalues: v27 (ref), l_v31_0 (copy), v28 (ref)
            return {
                min = Vector2.new(0, v27), 
                max = Vector2.new(l_v31_0.X, l_v31_0.Y - v28.bottom)
            };
        end, {
            v27, 
            v31, 
            v28
        });
    end;
    local v36 = v5.useCallback(function(v35) --[[ Line: 107 ]]
        -- upvalues: v21 (copy), v22 (copy)
        if v21.onPlaybackCandidate then
            v21.onPlaybackCandidate();
        end;
        if v21.isVideoEligible then
            v22:requestPlayback(v21.videoKey, v35, v21.videoDwellTimeInSec, v21.itemIndex, v21.videoAnalytics);
            return;
        else
            if v21.onVideoIneligible then
                v21.onVideoIneligible(v22.currentPlaybackSessionId);
            end;
            return;
        end;
    end, {
        v21.videoKey, 
        v21.itemIndex, 
        v21.videoAnalytics, 
        v21.isVideoEligible, 
        v21.onVideoIneligible, 
        v21.onPlaybackCandidate, 
        v21.videoDwellTimeInSec, 
        v22
    });
    local v38 = v5.useCallback(function(v37) --[[ Line: 137 ]]
        -- upvalues: v22 (copy), v21 (copy)
        v22:cancelPlayback(v21.videoKey, v37, v21.itemIndex, v21.videoAnalytics);
    end, {
        v21.videoKey, 
        v21.itemIndex, 
        v21.videoAnalytics, 
        v22
    });
    v5.useEffect(function() --[[ Line: 149 ]]
        -- upvalues: v21 (copy), v23 (copy), v24 (copy), v22 (copy)
        local function _(v39) --[[ Line: 150 ]] --[[ Name: checkAndUpdateState ]]
            -- upvalues: v21 (ref), v23 (ref), v24 (ref)
            local v40 = v39 == v21.videoKey;
            if v40 ~= v23 then
                v21.onPlaybackChange(v40);
                v24(v40);
            end;
        end;
        local v42 = v22.playingVideoKey == v21.videoKey;
        if v42 ~= v23 then
            v21.onPlaybackChange(v42);
            v24(v42);
        end;
        local v45 = v22.changed:connect(function(v43) --[[ Line: 161 ]]
            -- upvalues: v21 (ref), v23 (ref), v24 (ref)
            local v44 = v43 == v21.videoKey;
            if v44 ~= v23 then
                v21.onPlaybackChange(v44);
                v24(v44);
            end;
        end);
        return function() --[[ Line: 165 ]]
            -- upvalues: v45 (ref)
            if v45 ~= nil then
                v45:disconnect();
                v45 = nil;
            end;
        end;
    end, {
        v21.videoKey, 
        v21.onPlaybackChange, 
        v22, 
        v23
    });
    if not l_FFlagLuaAppRefactorVideoPlaybackDetector_0 then
        v5.useEffect(function() --[[ Line: 176 ]]
            -- upvalues: v21 (copy), v36 (copy), v38 (copy), l_VideoEndReason_0 (ref)
            if not v21.isHoverSupported then
                return;
            elseif v21.isHovered then
                v36(false);
                return;
            else
                v38(l_VideoEndReason_0.Unhovered);
                return;
            end;
        end, {
            v21.isHoverSupported, 
            v21.isHovered, 
            v36, 
            v38
        });
        v5.useEffect(function() --[[ Line: 197 ]]
            -- upvalues: l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (ref), v21 (copy), v25 (copy), v6 (ref), v22 (copy), v26 (ref), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), v29 (ref), v36 (copy), v38 (copy), l_VideoEndReason_0 (ref), v20 (ref), l_FFlagVideoPlaybackDetectorCancelPendingScanTask_0 (ref), l_AppLifecycleObserverService_0 (ref), l_ExperienceService_0 (ref)
            if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then
                if not v21.autoplay then
                    return nil;
                end;
            elseif v25 ~= v6.Input.Touch then
                return nil;
            end;
            local v46 = {};
            local v47 = nil;
            if v21.itemFrameRef.current ~= nil then
                local l_current_0 = v21.itemFrameRef.current;
                local v49 = nil;
                local v50 = nil;
                do
                    local l_v49_0, l_v50_0 = v49, v50;
                    local function _() --[[ Line: 216 ]] --[[ Name: requestPlaybackIfEligible ]]
                        -- upvalues: l_v49_0 (ref), v22 (ref), v26 (ref), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), v21 (ref), v29 (ref), v36 (ref), v38 (ref), l_VideoEndReason_0 (ref)
                        l_v49_0 = tick();
                        if v22:isPlaybackCandidate(v26, if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v21.isItemOccluded else nil, v21.itemFrameRef, v29, v21.videoVisiblePercent) then
                            v36(true);
                            return;
                        else
                            v38(l_VideoEndReason_0.ExitViewport);
                            return;
                        end;
                    end;
                    local function v56() --[[ Line: 234 ]] --[[ Name: onItemFrameLayoutChange ]]
                        -- upvalues: l_v50_0 (ref), l_v49_0 (ref), v20 (ref), v22 (ref), v26 (ref), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), v21 (ref), v29 (ref), v36 (ref), v38 (ref), l_VideoEndReason_0 (ref), l_FFlagVideoPlaybackDetectorCancelPendingScanTask_0 (ref), v47 (ref)
                        if l_v50_0 ~= nil then
                            return;
                        else
                            local v54 = 0;
                            if l_v49_0 ~= nil then
                                l_v50_0 = l_v49_0 + v20;
                                v54 = l_v50_0 - tick();
                            end;
                            if v54 > 0 then
                                local v55 = task.delay(v54, function() --[[ Line: 247 ]]
                                    -- upvalues: l_v50_0 (ref), l_v49_0 (ref), v22 (ref), v26 (ref), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), v21 (ref), v29 (ref), v36 (ref), v38 (ref), l_VideoEndReason_0 (ref)
                                    l_v50_0 = nil;
                                    l_v49_0 = tick();
                                    if v22:isPlaybackCandidate(v26, if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v21.isItemOccluded else nil, v21.itemFrameRef, v29, v21.videoVisiblePercent) then
                                        v36(true);
                                        return;
                                    else
                                        v38(l_VideoEndReason_0.ExitViewport);
                                        return;
                                    end;
                                end);
                                if l_FFlagVideoPlaybackDetectorCancelPendingScanTask_0 then
                                    v47 = v55;
                                    return;
                                end;
                            else
                                l_v50_0 = nil;
                                l_v49_0 = tick();
                                if v22:isPlaybackCandidate(v26, if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v21.isItemOccluded else nil, v21.itemFrameRef, v29, v21.videoVisiblePercent) then
                                    v36(true);
                                    return;
                                else
                                    v38(l_VideoEndReason_0.ExitViewport);
                                end;
                            end;
                            return;
                        end;
                    end;
                    l_v49_0 = tick();
                    if v22:isPlaybackCandidate(v26, if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v21.isItemOccluded else nil, v21.itemFrameRef, v29, v21.videoVisiblePercent) then
                        v36(true);
                    else
                        v38(l_VideoEndReason_0.ExitViewport);
                    end;
                    local v57 = l_AppLifecycleObserverService_0.OnUnhide:Connect(function() --[[ Line: 264 ]]
                        -- upvalues: l_v49_0 (ref), v22 (ref), v26 (ref), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), v21 (ref), v29 (ref), v36 (ref), v38 (ref), l_VideoEndReason_0 (ref)
                        l_v49_0 = tick();
                        if v22:isPlaybackCandidate(v26, if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v21.isItemOccluded else nil, v21.itemFrameRef, v29, v21.videoVisiblePercent) then
                            v36(true);
                            return;
                        else
                            v38(l_VideoEndReason_0.ExitViewport);
                            return;
                        end;
                    end);
                    local v58 = l_ExperienceService_0:RegisterForExperienceLeave(function() --[[ Line: 270 ]]
                        -- upvalues: l_v49_0 (ref), v22 (ref), v26 (ref), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), v21 (ref), v29 (ref), v36 (ref), v38 (ref), l_VideoEndReason_0 (ref)
                        l_v49_0 = tick();
                        if v22:isPlaybackCandidate(v26, if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v21.isItemOccluded else nil, v21.itemFrameRef, v29, v21.videoVisiblePercent) then
                            v36(true);
                            return;
                        else
                            v38(l_VideoEndReason_0.ExitViewport);
                            return;
                        end;
                    end);
                    v46 = {
                        l_current_0:GetPropertyChangedSignal("AbsolutePosition"):Connect(v56), 
                        l_current_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(v56)
                    };
                    table.insert(v46, v57);
                    table.insert(v46, v58);
                end;
            end;
            return function() --[[ Line: 283 ]]
                -- upvalues: l_FFlagVideoPlaybackDetectorCancelPendingScanTask_0 (ref), v47 (ref), v46 (ref)
                if l_FFlagVideoPlaybackDetectorCancelPendingScanTask_0 and v47 then
                    task.cancel(v47);
                    v47 = nil;
                end;
                for _, v60 in v46 do
                    v60:Disconnect();
                end;
            end;
        end, {
            if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v21.isItemOccluded else nil, 
            if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then v21.autoplay else nil, 
            v21.itemFrameRef, 
            v21.videoVisiblePercent, 
            if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then nil else v25, 
            v26, 
            v29, 
            v22, 
            v36, 
            v38
        });
    end;
    v5.useEffect(function() --[[ Line: 310 ]]
        -- upvalues: l_AppLifecycleObserverService_0 (ref), v38 (copy), l_VideoEndReason_0 (ref), l_ExperienceService_0 (ref)
        local v61 = l_AppLifecycleObserverService_0.OnHide:Connect(function() --[[ Line: 311 ]]
            -- upvalues: v38 (ref), l_VideoEndReason_0 (ref)
            v38(l_VideoEndReason_0.AppBackgrounded);
        end);
        local v62 = l_ExperienceService_0:RegisterForExperienceJoin(function() --[[ Line: 315 ]]
            -- upvalues: v38 (ref), l_VideoEndReason_0 (ref)
            v38(l_VideoEndReason_0.ExperienceLaunched);
        end);
        return function() --[[ Line: 319 ]]
            -- upvalues: v38 (ref), l_VideoEndReason_0 (ref), v62 (ref), v61 (ref)
            v38(l_VideoEndReason_0.Unmounted);
            if v62 then
                v62:Disconnect();
                v62 = nil;
            end;
            if v61 then
                v61:Disconnect();
                v61 = nil;
            end;
        end;
    end, {
        v38
    });
    if l_FFlagLuaAppRefactorVideoPlaybackDetector_0 then
        if v21.isHoverSupported then
            return v5.createElement(v13, {
                videoPlaybackCoordinator = v22, 
                requestVideoPlayback = v36, 
                cancelVideoPlayback = v38, 
                isHovered = v21.isHovered
            });
        elseif l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 and v21.autoplay or v25 == v6.Input.Touch then
            return v5.createElement(v14, {
                videoPlaybackCoordinator = v22, 
                requestVideoPlayback = v36, 
                cancelVideoPlayback = v38, 
                itemFrameRef = v21.itemFrameRef, 
                isItemOccluded = v21.isItemOccluded, 
                videoVisiblePercent = v21.videoVisiblePercent
            });
        else
            return nil;
        end;
    else
        return nil;
    end;
end;