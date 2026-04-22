local l_ExperienceService_0 = game:GetService("ExperienceService");
local l_AppLifecycleObserverService_0 = game:GetService("AppLifecycleObserverService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("VideoUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigationFocus_0 = require(l_Parent_0.Navigation).useNavigationFocus;
local l_VideoEndReason_0 = require(l_script_FirstAncestor_0.Analytics.Enums).VideoEndReason;
local _ = require(l_script_FirstAncestor_0.VideoPlaybackCoordinator);
local l_FFlagLuaAppEdpMediaGalleryFullScreen_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen;
local l_FFlagVideoPlaybackDetectorCancelPendingScanTask_0 = require(l_Parent_0.SharedFlags).FFlagVideoPlaybackDetectorCancelPendingScanTask;
local l_FIntVideoPlaybackDetectorScanDebounceInMilliseconds_0 = require(l_Parent_0.SharedFlags).FIntVideoPlaybackDetectorScanDebounceInMilliseconds;
local v12 = if l_FFlagVideoPlaybackDetectorCancelPendingScanTask_0 then l_FIntVideoPlaybackDetectorScanDebounceInMilliseconds_0 / 1000 else 0.5;
return function(v13) --[[ Line: 47 ]] --[[ Name: VideoViewportPlaybackDetector ]]
    -- upvalues: l_useNavigationFocus_0 (copy), l_useSelector_0 (copy), v4 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (copy), l_VideoEndReason_0 (copy), v12 (copy), l_FFlagVideoPlaybackDetectorCancelPendingScanTask_0 (copy), l_AppLifecycleObserverService_0 (copy), l_ExperienceService_0 (copy)
    local v14 = l_useNavigationFocus_0();
    local v16 = l_useSelector_0(function(v15) --[[ Line: 50 ]]
        return v15.ScreenSize;
    end);
    local v18 = l_useSelector_0(function(v17) --[[ Line: 54 ]]
        return v17.TopBar.topBarHeight;
    end);
    local v20 = l_useSelector_0(function(v19) --[[ Line: 58 ]]
        return v19.GlobalGuiInset;
    end);
    local v21 = v4.useMemo(function() --[[ Line: 62 ]]
        -- upvalues: v18 (copy), v16 (copy), v20 (copy)
        return {
            min = Vector2.new(0, v18), 
            max = Vector2.new(v16.X, v16.Y - v20.bottom)
        };
    end, {
        v18, 
        v16, 
        v20
    });
    v4.useEffect(function() --[[ Line: 71 ]]
        -- upvalues: v13 (copy), v14 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), v21 (copy), l_VideoEndReason_0 (ref), v12 (ref), l_FFlagVideoPlaybackDetectorCancelPendingScanTask_0 (ref), l_AppLifecycleObserverService_0 (ref), l_ExperienceService_0 (ref)
        local v22 = {};
        local v23 = nil;
        if v13.itemFrameRef.current ~= nil then
            local l_current_0 = v13.itemFrameRef.current;
            local v25 = nil;
            local v26 = nil;
            do
                local l_v25_0, l_v26_0 = v25, v26;
                local function v29() --[[ Line: 80 ]] --[[ Name: requestPlaybackIfEligible ]]
                    -- upvalues: l_v25_0 (ref), v13 (ref), v14 (ref), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), v21 (ref), l_VideoEndReason_0 (ref)
                    l_v25_0 = tick();
                    if v13.videoPlaybackCoordinator:isPlaybackCandidate(v14, if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v13.isItemOccluded else nil, v13.itemFrameRef, v21, v13.videoVisiblePercent) then
                        v13.requestVideoPlayback(true);
                        return;
                    else
                        v13.cancelVideoPlayback(l_VideoEndReason_0.ExitViewport);
                        return;
                    end;
                end;
                local function v32() --[[ Line: 98 ]] --[[ Name: onItemFrameLayoutChange ]]
                    -- upvalues: l_v26_0 (ref), l_v25_0 (ref), v12 (ref), v29 (copy), l_FFlagVideoPlaybackDetectorCancelPendingScanTask_0 (ref), v23 (ref)
                    if l_v26_0 ~= nil then
                        return;
                    else
                        local v30 = 0;
                        if l_v25_0 ~= nil then
                            l_v26_0 = l_v25_0 + v12;
                            v30 = l_v26_0 - tick();
                        end;
                        if v30 > 0 then
                            local v31 = task.delay(v30, function() --[[ Line: 111 ]]
                                -- upvalues: l_v26_0 (ref), v29 (ref)
                                l_v26_0 = nil;
                                v29();
                            end);
                            if l_FFlagVideoPlaybackDetectorCancelPendingScanTask_0 then
                                v23 = v31;
                                return;
                            end;
                        else
                            l_v26_0 = nil;
                            v29();
                        end;
                        return;
                    end;
                end;
                v29();
                local v33 = l_AppLifecycleObserverService_0.OnUnhide:Connect(function() --[[ Line: 128 ]]
                    -- upvalues: v29 (copy)
                    v29();
                end);
                local v34 = l_ExperienceService_0:RegisterForExperienceLeave(function() --[[ Line: 134 ]]
                    -- upvalues: v29 (copy)
                    v29();
                end);
                v22 = {
                    l_current_0:GetPropertyChangedSignal("AbsolutePosition"):Connect(v32), 
                    l_current_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(v32)
                };
                table.insert(v22, v33);
                table.insert(v22, v34);
            end;
        end;
        return function() --[[ Line: 147 ]]
            -- upvalues: l_FFlagVideoPlaybackDetectorCancelPendingScanTask_0 (ref), v23 (ref), v22 (ref)
            if l_FFlagVideoPlaybackDetectorCancelPendingScanTask_0 and v23 then
                task.cancel(v23);
                v23 = nil;
            end;
            for _, v36 in v22 do
                v36:Disconnect();
            end;
        end;
    end, {
        if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v13.isItemOccluded else nil, 
        v13.itemFrameRef, 
        v13.videoVisiblePercent, 
        v14, 
        v21, 
        v13.videoPlaybackCoordinator, 
        v13.requestVideoPlayback, 
        v13.cancelVideoPlayback
    });
    return nil;
end;