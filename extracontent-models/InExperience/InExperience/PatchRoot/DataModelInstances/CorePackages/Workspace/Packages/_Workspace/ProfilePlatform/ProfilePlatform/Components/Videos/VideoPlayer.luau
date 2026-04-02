local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v6 = require(l_script_FirstAncestor_0.Components.Videos.MediaPlayer);
local v7 = require(l_Parent_0.VideoUtils);
local l_VideoActions_0 = v7.AnalyticsEnums.VideoActions;
local l_VideoPlaybackDetector_0 = v7.VideoPlaybackDetector;
local l_VideoLogger_0 = v7.VideoLogger;
local v11 = require(l_Parent_0.Responsive);
local l_useNavigationFocus_0 = require(l_Parent_0.Navigation).useNavigationFocus;
local l_FFlagBrandVideosEnableActionAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagBrandVideosEnableActionAnalytics;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_useLastInput_0 = v11.useLastInput;
return (v4.forwardRef(function(v16, v17) --[[ Line: 47 ]]
    -- upvalues: v4 (copy), l_useLastInput_0 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (copy), l_useNavigationFocus_0 (copy), v3 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_VideoLogger_0 (copy), l_VideoActions_0 (copy), l_RunService_0 (copy), l_VideoPlaybackDetector_0 (copy), v11 (copy), v6 (copy)
    local l_videoId_0 = v16.videoId;
    local v19 = v4.useRef(nil);
    local v20 = v16.isFullscreen or false;
    local v21, v22 = v4.useState(v16.isMuted == nil or v16.isMuted);
    local v23 = v4.useRef(nil);
    local v24, v25 = v4.useState(false);
    local v26 = l_useLastInput_0();
    local v27, v28 = v4.useState(false);
    local v29, v30 = v4.useState(0);
    local v31 = if l_FFlagBrandVideosEnableActionAnalytics_0 then v4.useRef(nil) else nil;
    local v32 = if l_FFlagBrandVideosEnableActionAnalytics_0 then l_useNavigationFocus_0() else nil;
    local v33 = if l_FFlagBrandVideosEnableActionAnalytics_0 and v16.videoKey then v16.videoKey or l_videoId_0 else nil;
    local v34 = nil;
    local v35 = nil;
    if l_FFlagBrandVideosEnableActionAnalytics_0 then
        local v36, v37 = v4.useState(false);
        v34 = v36;
        v35 = v37;
    end;
    local v39 = if l_FFlagBrandVideosEnableActionAnalytics_0 then v4.useCallback(function() --[[ Line: 76 ]]
        -- upvalues: v16 (copy), v33 (copy), v3 (ref), v21 (copy), v20 (copy), v32 (copy), v19 (copy), v29 (copy)
        local v38 = nil;
        if v16.videoPlaybackCoordinator then
            v38 = v16.videoPlaybackCoordinator:getVideoMetadata(v33);
        end;
        return v3.Dictionary.join(v16.videoAnalyticsMetadata or {}, {
            isAudible = not v21, 
            isFullscreen = v20, 
            isVisible = v32, 
            videoAssetDuration = v19.current and v19.current.TimeLength or v29 or 0, 
            volumeLevel = v21 and 0 or 1, 
            playbackSessionId = v38 and v38.playbackSessionId, 
            impressionId = v38 and v38.impressionId
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v21, 
        v20, 
        v32, 
        v29, 
        v16.videoAnalyticsMetadata, 
        v16.videoPlaybackCoordinator
    } else l_dependencyArray_0(v21, v20, v32, v29, v16.videoAnalyticsMetadata, v16.videoPlaybackCoordinator)) else nil;
    v4.useImperativeHandle(v17, function() --[[ Line: 111 ]]
        -- upvalues: v19 (copy), v22 (copy), v21 (copy), v24 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (ref), l_VideoLogger_0 (ref), l_VideoActions_0 (ref), v39 (copy), v29 (copy)
        return {
            setTimePosition = function(v40) --[[ Line: 113 ]] --[[ Name: setTimePosition ]]
                -- upvalues: v19 (ref)
                local l_current_0 = v19.current;
                if l_current_0 then
                    l_current_0.TimePosition = v40;
                end;
            end, 
            toggleMute = function() --[[ Line: 119 ]] --[[ Name: toggleMute ]]
                -- upvalues: v22 (ref), v21 (ref)
                v22(not v21);
            end, 
            togglePlayPause = function() --[[ Line: 122 ]] --[[ Name: togglePlayPause ]]
                -- upvalues: v19 (ref), v24 (ref), l_FFlagBrandVideosEnableActionAnalytics_0 (ref), l_VideoLogger_0 (ref), l_VideoActions_0 (ref), v39 (ref), v29 (ref)
                local l_current_1 = v19.current;
                if not l_current_1 then
                    return;
                else
                    if v24 then
                        l_current_1:Pause();
                        if l_FFlagBrandVideosEnableActionAnalytics_0 then
                            l_VideoLogger_0.reportVideoAction(l_VideoActions_0.pause, nil, v39());
                            return;
                        end;
                    else
                        if l_current_1.TimePosition >= v29 - 0.2 then
                            l_current_1.TimePosition = 0;
                        end;
                        l_current_1:Play();
                        if l_FFlagBrandVideosEnableActionAnalytics_0 then
                            l_VideoLogger_0.reportVideoAction(l_VideoActions_0.play, nil, v39());
                        end;
                    end;
                    return;
                end;
            end
        };
    end, {
        v21, 
        v24, 
        v29
    });
    local v44 = v4.useCallback(function() --[[ Line: 145 ]]
        -- upvalues: v19 (copy), v21 (copy)
        local l_current_2 = v19.current;
        if l_current_2 then
            l_current_2.Volume = v21 and 0 or 1;
        end;
    end, {
        v21
    });
    local v45 = v4.useCallback(function() --[[ Line: 152 ]]
        -- upvalues: v4 (ref)
        return (v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        }));
    end, {});
    if l_FFlagBrandVideosEnableActionAnalytics_0 then
        v4.useEffect(function() --[[ Line: 160 ]]
            -- upvalues: v31 (copy)
            if v31.current == nil then
                v31.current = tick();
            end;
        end, {});
    end;
    local v49 = v4.useCallback(function(_) --[[ Line: 167 ]]
        -- upvalues: v19 (copy), v44 (copy), v30 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (ref), v31 (copy), l_VideoLogger_0 (ref), l_VideoActions_0 (ref), v39 (copy)
        local l_current_3 = v19.current;
        if not l_current_3 then
            return;
        else
            v44();
            v30(l_current_3.TimeLength);
            if l_FFlagBrandVideosEnableActionAnalytics_0 then
                local v48 = tick();
                if v31.current and v31.current < v48 then
                    l_VideoLogger_0.reportVideoAction(l_VideoActions_0.load, nil, v39(), {
                        loadTime = v48 - v31.current
                    });
                end;
            end;
            return;
        end;
    end, {
        if l_FFlagBrandVideosEnableActionAnalytics_0 then v31 else nil
    });
    local v50 = v4.useCallback(function() --[[ Line: 188 ]]
        -- upvalues: v28 (copy)
        v28(true);
    end, {});
    local v51 = v4.useCallback(function() --[[ Line: 192 ]]
        -- upvalues: v28 (copy)
        v28(false);
    end, {});
    v4.useEffect(function() --[[ Line: 196 ]]
        -- upvalues: v44 (copy)
        v44();
    end, {
        v21
    });
    v4.useEffect(function() --[[ Line: 201 ]]
        -- upvalues: v19 (copy), v29 (copy), v24 (copy)
        local l_current_4 = v19.current;
        if not l_current_4 or v29 == 0 then
            return;
        else
            if v24 and l_current_4.TimePosition >= v29 - 0.2 then
                l_current_4.TimePosition = 0;
            end;
            return;
        end;
    end, {
        v24, 
        v29
    });
    v4.useEffect(function() --[[ Line: 212 ]]
        -- upvalues: v19 (copy), v29 (copy), v16 (copy)
        local l_current_5 = v19.current;
        if not l_current_5 or v29 == 0 then
            return;
        else
            if v16.initialTimePosition then
                if v16.initialTimePosition >= v29 - 0.2 then
                    l_current_5.TimePosition = 0;
                    return;
                else
                    l_current_5.TimePosition = v16.initialTimePosition;
                end;
            end;
            return;
        end;
    end, {
        v16.initialTimePosition, 
        v29
    });
    v4.useEffect(function() --[[ Line: 227 ]]
        -- upvalues: v19 (copy), v20 (copy), v25 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (ref), v16 (copy), v33 (copy)
        local l_current_6 = v19.current;
        if l_current_6 and v20 then
            l_current_6:Play();
            v25(true);
            if l_FFlagBrandVideosEnableActionAnalytics_0 and v16.videoPlaybackCoordinator then
                v16.videoPlaybackCoordinator:requestPlayback(v33, false, 0);
            end;
        end;
    end, {
        v20
    });
    v4.useEffect(function() --[[ Line: 238 ]]
        -- upvalues: v19 (copy), l_RunService_0 (ref), v30 (copy), v16 (copy), v24 (copy), v21 (copy), v25 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (ref), l_VideoLogger_0 (ref), l_VideoActions_0 (ref), v39 (copy)
        local l_current_7 = v19.current;
        if not l_current_7 then
            return;
        else
            local v58 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 244 ]]
                -- upvalues: l_current_7 (copy), v30 (ref), v16 (ref), v24 (ref), v21 (ref)
                local l_TimePosition_0 = l_current_7.TimePosition;
                local l_TimeLength_0 = l_current_7.TimeLength;
                v30(l_TimeLength_0);
                if v16.onTimeUpdate then
                    v16.onTimeUpdate(l_TimePosition_0);
                end;
                if v16.onProgressUpdate then
                    v16.onProgressUpdate(l_TimePosition_0, l_TimeLength_0, v24, v21);
                end;
            end);
            local v59 = l_current_7.Played:Connect(function() --[[ Line: 256 ]]
                -- upvalues: v25 (ref)
                v25(true);
            end);
            local v60 = l_current_7.Paused:Connect(function() --[[ Line: 260 ]]
                -- upvalues: v25 (ref)
                v25(false);
            end);
            local v61 = l_current_7.Ended:Connect(function() --[[ Line: 264 ]]
                -- upvalues: l_FFlagBrandVideosEnableActionAnalytics_0 (ref), l_VideoLogger_0 (ref), l_VideoActions_0 (ref), v39 (ref), v25 (ref)
                if l_FFlagBrandVideosEnableActionAnalytics_0 then
                    l_VideoLogger_0.reportVideoAction(l_VideoActions_0.complete, nil, v39());
                end;
                v25(false);
            end);
            return function() --[[ Line: 271 ]]
                -- upvalues: v58 (copy), v59 (copy), v60 (copy), v61 (copy)
                v58:Disconnect();
                v59:Disconnect();
                v60:Disconnect();
                v61:Disconnect();
            end;
        end;
    end, {
        v21, 
        v24, 
        v16.onProgressUpdate, 
        v16.onTimeUpdate
    });
    local function v62() --[[ Line: 279 ]] --[[ Name: handleExpand ]]
        -- upvalues: v16 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (ref), l_VideoLogger_0 (ref), l_VideoActions_0 (ref), v39 (copy), v33 (copy), v35 (ref), v19 (copy)
        if v16.onExpandCallback then
            if l_FFlagBrandVideosEnableActionAnalytics_0 then
                l_VideoLogger_0.reportVideoAction(l_VideoActions_0.fullscreen, nil, v39());
            end;
            if l_FFlagBrandVideosEnableActionAnalytics_0 and v16.videoPlaybackCoordinator then
                v16.videoPlaybackCoordinator:setVideoKeepSessionOnPlaybackCancel(v33, true);
                v35(true);
                v16.onExpandCallback(v19.current and v19.current.TimePosition or 0, function() --[[ Line: 287 ]]
                    -- upvalues: v16 (ref), v33 (ref), v35 (ref)
                    v16.videoPlaybackCoordinator:setVideoKeepSessionOnPlaybackCancel(v33, false);
                    v16.videoPlaybackCoordinator:clearPlaybackSession(v33);
                    v35(false);
                end);
                return;
            else
                v16.onExpandCallback(v19.current and v19.current.TimePosition or 0);
            end;
        end;
    end;
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        ClipsDescendants = not v20, 
        LayoutOrder = v16.layoutOrder, 
        Size = UDim2.fromScale(1, 1), 
        ZIndex = v20 and 1000 or 1, 
        ref = v23, 
        [v4.Event.MouseEnter] = v50, 
        [v4.Event.MouseLeave] = v51
    }, {
        VideoPlaybackDetector = if not v20 then v4.createElement(l_VideoPlaybackDetector_0, {
            isHovered = v27, 
            isHoverSupported = v26 ~= v11.Input.Touch, 
            isVideoEligible = true, 
            itemIndex = nil, 
            onPlaybackChange = function(v63) --[[ Line: 314 ]] --[[ Name: onPlaybackChange ]]
                -- upvalues: l_FFlagBrandVideosEnableActionAnalytics_0 (ref), v34 (ref), v25 (copy), l_VideoLogger_0 (ref), l_VideoActions_0 (ref), v39 (copy)
                if l_FFlagBrandVideosEnableActionAnalytics_0 and v34 then
                    return;
                else
                    v25(v63);
                    if l_FFlagBrandVideosEnableActionAnalytics_0 and v63 then
                        l_VideoLogger_0.reportVideoAction(l_VideoActions_0.play, nil, v39());
                    end;
                    return;
                end;
            end, 
            itemFrameRef = v23, 
            videoDwellTimeInSec = 1, 
            videoKey = if l_FFlagBrandVideosEnableActionAnalytics_0 then v33 else l_videoId_0, 
            videoPlaybackCoordinator = v16.videoPlaybackCoordinator, 
            videoVisiblePercent = 80, 
            videoAnalyticsFields = if l_FFlagBrandVideosEnableActionAnalytics_0 then v39() else nil
        }) else nil, 
        VideoContainer = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ClipsDescendants = true, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = v20 and 1001 or 1
        }, {
            VideoContent = v4.createElement(v6, {
                cornerRadius = v16.cornerRadius, 
                isFullScreen = v20, 
                Looped = v16.looped, 
                onExpandCallback = v62, 
                onVideoLoaded = v49, 
                Playing = v24, 
                Position = UDim2.fromScale(0.5, 0.5), 
                renderOnFailed = v45, 
                Size = UDim2.fromScale(1, 1), 
                thumbnailImage = v16.thumbnailImage, 
                timeLength = v29, 
                Video = l_videoId_0, 
                videoRef = v19, 
                ZIndex = v20 and 1001 or 1
            })
        })
    });
end));