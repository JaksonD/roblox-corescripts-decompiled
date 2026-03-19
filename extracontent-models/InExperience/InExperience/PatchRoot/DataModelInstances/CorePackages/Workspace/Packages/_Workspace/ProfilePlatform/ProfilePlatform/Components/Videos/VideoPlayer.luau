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
local l_useLastInput_0 = v11.useLastInput;
return (v4.forwardRef(function(v15, v16) --[[ Line: 45 ]]
    -- upvalues: v4 (copy), l_useLastInput_0 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (copy), l_useNavigationFocus_0 (copy), v3 (copy), l_dependencyArray_0 (copy), l_VideoLogger_0 (copy), l_VideoActions_0 (copy), l_RunService_0 (copy), l_VideoPlaybackDetector_0 (copy), v11 (copy), v6 (copy)
    local l_videoId_0 = v15.videoId;
    local v18 = v4.useRef(nil);
    local v19 = v15.isFullscreen or false;
    local v20, v21 = v4.useState(v15.isMuted == nil or v15.isMuted);
    local v22 = v4.useRef(nil);
    local v23, v24 = v4.useState(false);
    local v25 = l_useLastInput_0();
    local v26, v27 = v4.useState(false);
    local v28, v29 = v4.useState(0);
    local v30 = if l_FFlagBrandVideosEnableActionAnalytics_0 then v4.useRef(nil) else nil;
    local v31 = if l_FFlagBrandVideosEnableActionAnalytics_0 then l_useNavigationFocus_0() else nil;
    local v32 = if l_FFlagBrandVideosEnableActionAnalytics_0 and v15.videoKey then v15.videoKey or l_videoId_0 else nil;
    local v33 = nil;
    local v34 = nil;
    if l_FFlagBrandVideosEnableActionAnalytics_0 then
        local v35, v36 = v4.useState(false);
        v33 = v35;
        v34 = v36;
    end;
    local v38 = if l_FFlagBrandVideosEnableActionAnalytics_0 then v4.useCallback(function() --[[ Line: 74 ]]
        -- upvalues: v15 (copy), v32 (copy), v3 (ref), v20 (copy), v19 (copy), v31 (copy), v18 (copy), v28 (copy)
        local v37 = nil;
        if v15.videoPlaybackCoordinator then
            v37 = v15.videoPlaybackCoordinator:getVideoMetadata(v32);
        end;
        return v3.Dictionary.join(v15.videoAnalyticsMetadata or {}, {
            isAudible = not v20, 
            isFullscreen = v19, 
            isVisible = v31, 
            videoAssetDuration = v18.current and v18.current.TimeLength or v28 or 0, 
            volumeLevel = v20 and 0 or 1, 
            playbackSessionId = v37 and v37.playbackSessionId, 
            impressionId = v37 and v37.impressionId
        });
    end, l_dependencyArray_0(v20, v19, v31, v28, v15.videoAnalyticsMetadata, v15.videoPlaybackCoordinator)) else nil;
    v4.useImperativeHandle(v16, function() --[[ Line: 100 ]]
        -- upvalues: v18 (copy), v21 (copy), v20 (copy), v23 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (ref), l_VideoLogger_0 (ref), l_VideoActions_0 (ref), v38 (copy), v28 (copy)
        return {
            setTimePosition = function(v39) --[[ Line: 102 ]] --[[ Name: setTimePosition ]]
                -- upvalues: v18 (ref)
                local l_current_0 = v18.current;
                if l_current_0 then
                    l_current_0.TimePosition = v39;
                end;
            end, 
            toggleMute = function() --[[ Line: 108 ]] --[[ Name: toggleMute ]]
                -- upvalues: v21 (ref), v20 (ref)
                v21(not v20);
            end, 
            togglePlayPause = function() --[[ Line: 111 ]] --[[ Name: togglePlayPause ]]
                -- upvalues: v18 (ref), v23 (ref), l_FFlagBrandVideosEnableActionAnalytics_0 (ref), l_VideoLogger_0 (ref), l_VideoActions_0 (ref), v38 (ref), v28 (ref)
                local l_current_1 = v18.current;
                if not l_current_1 then
                    return;
                else
                    if v23 then
                        l_current_1:Pause();
                        if l_FFlagBrandVideosEnableActionAnalytics_0 then
                            l_VideoLogger_0.reportVideoAction(l_VideoActions_0.pause, nil, v38());
                            return;
                        end;
                    else
                        if l_current_1.TimePosition >= v28 - 0.2 then
                            l_current_1.TimePosition = 0;
                        end;
                        l_current_1:Play();
                        if l_FFlagBrandVideosEnableActionAnalytics_0 then
                            l_VideoLogger_0.reportVideoAction(l_VideoActions_0.play, nil, v38());
                        end;
                    end;
                    return;
                end;
            end
        };
    end, {
        v20, 
        v23, 
        v28
    });
    local v43 = v4.useCallback(function() --[[ Line: 134 ]]
        -- upvalues: v18 (copy), v20 (copy)
        local l_current_2 = v18.current;
        if l_current_2 then
            l_current_2.Volume = v20 and 0 or 1;
        end;
    end, {
        v20
    });
    local v44 = v4.useCallback(function() --[[ Line: 141 ]]
        -- upvalues: v4 (ref)
        return (v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        }));
    end, {});
    if l_FFlagBrandVideosEnableActionAnalytics_0 then
        v4.useEffect(function() --[[ Line: 149 ]]
            -- upvalues: v30 (copy)
            if v30.current == nil then
                v30.current = tick();
            end;
        end, {});
    end;
    local v48 = v4.useCallback(function(_) --[[ Line: 156 ]]
        -- upvalues: v18 (copy), v43 (copy), v29 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (ref), v30 (copy), l_VideoLogger_0 (ref), l_VideoActions_0 (ref), v38 (copy)
        local l_current_3 = v18.current;
        if not l_current_3 then
            return;
        else
            v43();
            v29(l_current_3.TimeLength);
            if l_FFlagBrandVideosEnableActionAnalytics_0 then
                local v47 = tick();
                if v30.current and v30.current < v47 then
                    l_VideoLogger_0.reportVideoAction(l_VideoActions_0.load, nil, v38(), {
                        loadTime = v47 - v30.current
                    });
                end;
            end;
            return;
        end;
    end, {
        if l_FFlagBrandVideosEnableActionAnalytics_0 then v30 else nil
    });
    local v49 = v4.useCallback(function() --[[ Line: 177 ]]
        -- upvalues: v27 (copy)
        v27(true);
    end, {});
    local v50 = v4.useCallback(function() --[[ Line: 181 ]]
        -- upvalues: v27 (copy)
        v27(false);
    end, {});
    v4.useEffect(function() --[[ Line: 185 ]]
        -- upvalues: v43 (copy)
        v43();
    end, {
        v20
    });
    v4.useEffect(function() --[[ Line: 190 ]]
        -- upvalues: v18 (copy), v28 (copy), v23 (copy)
        local l_current_4 = v18.current;
        if not l_current_4 or v28 == 0 then
            return;
        else
            if v23 and l_current_4.TimePosition >= v28 - 0.2 then
                l_current_4.TimePosition = 0;
            end;
            return;
        end;
    end, {
        v23, 
        v28
    });
    v4.useEffect(function() --[[ Line: 201 ]]
        -- upvalues: v18 (copy), v28 (copy), v15 (copy)
        local l_current_5 = v18.current;
        if not l_current_5 or v28 == 0 then
            return;
        else
            if v15.initialTimePosition then
                if v15.initialTimePosition >= v28 - 0.2 then
                    l_current_5.TimePosition = 0;
                    return;
                else
                    l_current_5.TimePosition = v15.initialTimePosition;
                end;
            end;
            return;
        end;
    end, {
        v15.initialTimePosition, 
        v28
    });
    v4.useEffect(function() --[[ Line: 216 ]]
        -- upvalues: v18 (copy), v19 (copy), v24 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (ref), v15 (copy), v32 (copy)
        local l_current_6 = v18.current;
        if l_current_6 and v19 then
            l_current_6:Play();
            v24(true);
            if l_FFlagBrandVideosEnableActionAnalytics_0 and v15.videoPlaybackCoordinator then
                v15.videoPlaybackCoordinator:requestPlayback(v32, false, 0);
            end;
        end;
    end, {
        v19
    });
    v4.useEffect(function() --[[ Line: 227 ]]
        -- upvalues: v18 (copy), l_RunService_0 (ref), v29 (copy), v15 (copy), v23 (copy), v20 (copy), v24 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (ref), l_VideoLogger_0 (ref), l_VideoActions_0 (ref), v38 (copy)
        local l_current_7 = v18.current;
        if not l_current_7 then
            return;
        else
            local v57 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 233 ]]
                -- upvalues: l_current_7 (copy), v29 (ref), v15 (ref), v23 (ref), v20 (ref)
                local l_TimePosition_0 = l_current_7.TimePosition;
                local l_TimeLength_0 = l_current_7.TimeLength;
                v29(l_TimeLength_0);
                if v15.onTimeUpdate then
                    v15.onTimeUpdate(l_TimePosition_0);
                end;
                if v15.onProgressUpdate then
                    v15.onProgressUpdate(l_TimePosition_0, l_TimeLength_0, v23, v20);
                end;
            end);
            local v58 = l_current_7.Played:Connect(function() --[[ Line: 245 ]]
                -- upvalues: v24 (ref)
                v24(true);
            end);
            local v59 = l_current_7.Paused:Connect(function() --[[ Line: 249 ]]
                -- upvalues: v24 (ref)
                v24(false);
            end);
            local v60 = l_current_7.Ended:Connect(function() --[[ Line: 253 ]]
                -- upvalues: l_FFlagBrandVideosEnableActionAnalytics_0 (ref), l_VideoLogger_0 (ref), l_VideoActions_0 (ref), v38 (ref), v24 (ref)
                if l_FFlagBrandVideosEnableActionAnalytics_0 then
                    l_VideoLogger_0.reportVideoAction(l_VideoActions_0.complete, nil, v38());
                end;
                v24(false);
            end);
            return function() --[[ Line: 260 ]]
                -- upvalues: v57 (copy), v58 (copy), v59 (copy), v60 (copy)
                v57:Disconnect();
                v58:Disconnect();
                v59:Disconnect();
                v60:Disconnect();
            end;
        end;
    end, {
        v20, 
        v23, 
        v15.onProgressUpdate, 
        v15.onTimeUpdate
    });
    local function v61() --[[ Line: 268 ]] --[[ Name: handleExpand ]]
        -- upvalues: v15 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (ref), l_VideoLogger_0 (ref), l_VideoActions_0 (ref), v38 (copy), v32 (copy), v34 (ref), v18 (copy)
        if v15.onExpandCallback then
            if l_FFlagBrandVideosEnableActionAnalytics_0 then
                l_VideoLogger_0.reportVideoAction(l_VideoActions_0.fullscreen, nil, v38());
            end;
            if l_FFlagBrandVideosEnableActionAnalytics_0 and v15.videoPlaybackCoordinator then
                v15.videoPlaybackCoordinator:setVideoKeepSessionOnPlaybackCancel(v32, true);
                v34(true);
                v15.onExpandCallback(v18.current and v18.current.TimePosition or 0, function() --[[ Line: 276 ]]
                    -- upvalues: v15 (ref), v32 (ref), v34 (ref)
                    v15.videoPlaybackCoordinator:setVideoKeepSessionOnPlaybackCancel(v32, false);
                    v15.videoPlaybackCoordinator:clearPlaybackSession(v32);
                    v34(false);
                end);
                return;
            else
                v15.onExpandCallback(v18.current and v18.current.TimePosition or 0);
            end;
        end;
    end;
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        ClipsDescendants = not v19, 
        LayoutOrder = v15.layoutOrder, 
        Size = UDim2.fromScale(1, 1), 
        ZIndex = v19 and 1000 or 1, 
        ref = v22, 
        [v4.Event.MouseEnter] = v49, 
        [v4.Event.MouseLeave] = v50
    }, {
        VideoPlaybackDetector = if not v19 then v4.createElement(l_VideoPlaybackDetector_0, {
            isHovered = v26, 
            isHoverSupported = v25 ~= v11.Input.Touch, 
            isVideoEligible = true, 
            itemIndex = nil, 
            onPlaybackChange = function(v62) --[[ Line: 303 ]] --[[ Name: onPlaybackChange ]]
                -- upvalues: l_FFlagBrandVideosEnableActionAnalytics_0 (ref), v33 (ref), v24 (copy), l_VideoLogger_0 (ref), l_VideoActions_0 (ref), v38 (copy)
                if l_FFlagBrandVideosEnableActionAnalytics_0 and v33 then
                    return;
                else
                    v24(v62);
                    if l_FFlagBrandVideosEnableActionAnalytics_0 and v62 then
                        l_VideoLogger_0.reportVideoAction(l_VideoActions_0.play, nil, v38());
                    end;
                    return;
                end;
            end, 
            itemFrameRef = v22, 
            videoDwellTimeInSec = 1, 
            videoKey = if l_FFlagBrandVideosEnableActionAnalytics_0 then v32 else l_videoId_0, 
            videoPlaybackCoordinator = v15.videoPlaybackCoordinator, 
            videoVisiblePercent = 80, 
            videoAnalyticsFields = if l_FFlagBrandVideosEnableActionAnalytics_0 then v38() else nil
        }) else nil, 
        VideoContainer = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ClipsDescendants = true, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = v19 and 1001 or 1
        }, {
            VideoContent = v4.createElement(v6, {
                cornerRadius = v15.cornerRadius, 
                isFullScreen = v19, 
                Looped = v15.looped, 
                onExpandCallback = v61, 
                onVideoLoaded = v48, 
                Playing = v23, 
                Position = UDim2.fromScale(0.5, 0.5), 
                renderOnFailed = v44, 
                Size = UDim2.fromScale(1, 1), 
                thumbnailImage = v15.thumbnailImage, 
                timeLength = v28, 
                Video = l_videoId_0, 
                videoRef = v18, 
                ZIndex = v19 and 1001 or 1
            })
        })
    });
end));