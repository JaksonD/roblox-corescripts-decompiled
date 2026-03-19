local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script:FindFirstAncestor("VideoUtils").Parent;
local v2 = require(l_Parent_0.LoggingProtocol);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Responsive);
local _ = require(l_Parent_0.AppCommonLib);
local v6 = require(script.Parent.LoadableVideoFrame);
local v7 = require(script.Parent.RoundIconButton);
local l_VideoActions_0 = require(script.Parent.Analytics.Enums).VideoActions;
local _ = require(script.Parent.Analytics.VideoAnalyticsTypes);
local v10 = require(script.Parent.Analytics.VideoLogger);
local v11 = require(script.Parent.VideoPlayerBottomOverlay);
local l_reportWarning_0 = require(l_Parent_0.DiscoveryAnalytics).Points.reportWarning;
local l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEdpMediaGalleryAutoAdvance;
local l_FFlagLuaAppEdpMediaGalleryFullScreen_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen;
local v15 = game:DefineFastInt("VideoPlayerPlaybackEndThresholdInMs", 100) / 1000;
return function(v16) --[[ Line: 70 ]] --[[ Name: VideoPlayer ]]
    -- upvalues: l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (copy), v3 (copy), l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 (copy), l_RunService_0 (copy), l_reportWarning_0 (copy), v2 (copy), v10 (copy), v15 (copy), v4 (copy), l_VideoActions_0 (copy), v6 (copy), v7 (copy), v11 (copy)
    local v17 = v16.showMuteButton or l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and (v16.showPlayButton or v16.showProgressBar);
    local v18, v19 = v3.useState(false);
    local v20, v21 = v3.useState(v16.muted);
    local v24 = v3.useCallback(function(v22, v23) --[[ Line: 78 ]]
        -- upvalues: v19 (copy), v16 (copy)
        v19(true);
        if v16.onVideoLoaded then
            v16.onVideoLoaded(v22, v23);
        end;
    end, {
        v16.onVideoLoaded
    });
    v3.useEffect(function() --[[ Line: 86 ]]
        -- upvalues: v16 (copy), v20 (copy)
        if v16.onMutedChanged then
            v16.onMutedChanged(v20);
        end;
    end, {
        v16.onMutedChanged, 
        v20
    });
    local v26 = v3.useCallback(function() --[[ Line: 92 ]]
        -- upvalues: v21 (copy), v16 (copy)
        v21(function(v25) --[[ Line: 93 ]]
            -- upvalues: v16 (ref)
            if v16.onMuteButtonActivated then
                v16.onMuteButtonActivated(v25);
            end;
            return not v25;
        end);
    end, {
        v16.onMuteButtonActivated
    });
    local v27 = v3.useMemo(function() --[[ Line: 101 ]]
        -- upvalues: v16 (copy), v20 (copy), v26 (copy)
        if v16.showMuteButton then
            return {
                muted = v20, 
                onMuteButtonActivated = v26
            };
        else
            return nil;
        end;
    end, {
        v16.showMuteButton, 
        v20, 
        v26
    });
    local v28 = nil;
    if l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 or l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then
        v28 = v3.useRef(nil);
    end;
    local v29 = nil;
    local v30 = nil;
    if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then
        local v31, v32 = v3.useBinding(0);
        v29 = v31;
        v30 = v32;
    end;
    if l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 or l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then
        v3.useEffect(function() --[[ Line: 123 ]]
            -- upvalues: v28 (ref), v16 (copy), l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 (ref), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), l_RunService_0 (ref), v30 (ref)
            local l_current_0 = v28.current;
            if v16.shouldStartPlayback and (l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 and v16.onVideoProgressChanged or l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and v16.showProgressBar) and l_current_0 then
                local v34 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 131 ]]
                    -- upvalues: l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 (ref), v16 (ref), l_current_0 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), v30 (ref)
                    if l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 and v16.onVideoProgressChanged then
                        v16.onVideoProgressChanged(if l_current_0.TimeLength > 0 then l_current_0.TimePosition / l_current_0.TimeLength else 0);
                    end;
                    if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and v16.showProgressBar then
                        v30(if l_current_0.TimeLength > 0 then l_current_0.TimePosition / l_current_0.TimeLength else 0);
                    end;
                end);
                return function() --[[ Line: 145 ]]
                    -- upvalues: v34 (copy), l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 (ref), v16 (ref), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), v30 (ref)
                    v34:Disconnect();
                    if l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 and v16.onVideoProgressChanged then
                        v16.onVideoProgressChanged(0);
                    end;
                    if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and v16.showProgressBar then
                        v30(0);
                    end;
                end;
            else
                return nil;
            end;
        end, {
            v16.shouldStartPlayback, 
            if l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 then v16.onVideoProgressChanged else nil, 
            if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v16.showProgressBar else nil
        });
    end;
    local v35 = nil;
    local v36 = nil;
    local v37 = nil;
    local v38 = nil;
    local v39 = nil;
    local v40 = nil;
    local v41 = nil;
    if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then
        local v42, v43 = v3.useState(false);
        v35 = v42;
        v36 = v43;
        v42 = v3.useCallback(function(v44) --[[ Line: 178 ]]
            -- upvalues: v28 (ref), l_reportWarning_0 (ref), v2 (ref), v16 (copy), v10 (ref)
            local l_current_1 = v28.current;
            if not l_current_1 then
                l_reportWarning_0(v2.default, "EventLogging", "reportVideoAction requires a valid videoFrame");
                return;
            else
                local v46 = nil;
                local v47 = nil;
                local v48 = nil;
                if v16.videoAnalyticsContext then
                    v46 = v16.videoAnalyticsContext.videoAnalyticsData.source;
                    v47 = v16.videoAnalyticsContext.videoAnalyticsData.sourceId;
                    v48 = v16.videoAnalyticsContext.getPlaybackSessionId();
                    if not v46 or not v47 or not v48 then
                        local v49 = not v46 and "source " or "";
                        local v50 = not v47 and "sourceId " or "";
                        local v51 = not v48 and "playbackSessionId" or "";
                        l_reportWarning_0(v2.default, "EventLogging", (("reportVideoAction requires a valid %*%*%*"):format(v49, v50, v51)));
                    end;
                end;
                v10.reportVideoAction(v44, nil, {
                    videoAssetId = v16.video, 
                    source = v46 or "", 
                    sourceId = v47 or "", 
                    playbackSessionId = v48 or "", 
                    videoAssetDuration = l_current_1.TimeLength, 
                    isVisible = true, 
                    isAudible = l_current_1.Volume ~= 0, 
                    volumeLevel = l_current_1.Volume == 0 and 0 or 1
                });
                return;
            end;
        end, {
            v16.video, 
            v16.videoAnalyticsContext
        });
        v37 = v3.useCallback(function() --[[ Line: 219 ]]
            -- upvalues: v28 (ref), v35 (ref), v15 (ref)
            local l_current_2 = v28.current;
            if not l_current_2 then
                return;
            elseif v35 then
                l_current_2:Pause();
                return;
            else
                if math.abs(l_current_2.TimePosition - l_current_2.TimeLength) <= v15 then
                    l_current_2.TimePosition = 0;
                end;
                l_current_2:Play();
                return;
            end;
        end, {
            v35
        });
        v41 = v4.usePreferredInput() == v4.Input.Directional;
        v3.useEffect(function() --[[ Line: 239 ]]
            -- upvalues: v16 (copy), v37 (ref), v26 (copy)
            local v53 = {};
            if v16.toggleVideoPlaybackSignal then
                table.insert(v53, v16.toggleVideoPlaybackSignal:connect(v37));
            end;
            if v16.toggleMuteSignal then
                table.insert(v53, v16.toggleMuteSignal:connect(v26));
            end;
            return function() --[[ Line: 247 ]]
                -- upvalues: v53 (copy)
                for _, v55 in v53 do
                    if v55 then
                        v55:disconnect();
                    end;
                end;
            end;
        end, {
            v16.toggleVideoPlaybackSignal, 
            v16.toggleMuteSignal, 
            v37, 
            v26
        });
        v38 = v3.useCallback(function() --[[ Line: 258 ]]
            -- upvalues: v16 (copy), v37 (ref)
            if v16.onVideoPlayerActivated then
                v16.onVideoPlayerActivated();
                return;
            else
                v37();
                return;
            end;
        end, {
            v16.onVideoPlayerActivated, 
            v37
        });
        v39 = v3.useMemo(function() --[[ Line: 268 ]]
            -- upvalues: v16 (copy), v35 (ref), v37 (ref)
            if v16.showPlayButton then
                return {
                    isVideoPlaying = v35, 
                    onPlayButtonActivated = v37
                };
            else
                return nil;
            end;
        end, {
            v16.showPlayButton, 
            v35, 
            v37
        });
        v40 = v3.useMemo(function() --[[ Line: 277 ]]
            -- upvalues: v16 (copy), v29 (ref)
            if v16.showProgressBar then
                return {
                    progressBinding = v29
                };
            else
                return nil;
            end;
        end, {
            v16.showProgressBar, 
            v29
        });
        v3.useEffect(function() --[[ Line: 285 ]]
            -- upvalues: v28 (ref), v16 (copy), v36 (ref), v42 (copy), l_VideoActions_0 (ref)
            local l_current_3 = v28.current;
            if not v16.shouldStartPlayback or not l_current_3 then
                return nil;
            else
                local v57 = l_current_3.Played:Connect(function() --[[ Line: 292 ]]
                    -- upvalues: v36 (ref), v42 (ref), l_VideoActions_0 (ref)
                    v36(true);
                    v42(l_VideoActions_0.play);
                end);
                local v58 = l_current_3.Paused:Connect(function() --[[ Line: 297 ]]
                    -- upvalues: v36 (ref), v42 (ref), l_VideoActions_0 (ref)
                    v36(false);
                    v42(l_VideoActions_0.pause);
                end);
                local v59 = l_current_3.Ended:Connect(function() --[[ Line: 302 ]]
                    -- upvalues: v36 (ref)
                    v36(false);
                end);
                return function() --[[ Line: 306 ]]
                    -- upvalues: v57 (copy), v58 (copy), v59 (copy)
                    v57:Disconnect();
                    v58:Disconnect();
                    v59:Disconnect();
                end;
            end;
        end, {
            v16.shouldStartPlayback, 
            v42
        });
        v3.useEffect(function() --[[ Line: 314 ]]
            -- upvalues: v16 (copy), v19 (copy), v36 (ref)
            if not v16.shouldStartPlayback then
                v19(false);
                v36(false);
            end;
            return nil;
        end, {
            v16.shouldStartPlayback
        });
    end;
    return v3.createElement(l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and "TextButton" or "Frame", {
        Size = v16.Size, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ClipsDescendants = true, 
        ZIndex = v16.ZIndex, 
        Text = l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and "" or nil, 
        [v3.Event.Activated] = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v38 else nil, 
        Selectable = false
    }, {
        Corner = if v16.cornerRadius then v3.createElement("UICorner", {
            CornerRadius = UDim.new(0, v16.cornerRadius)
        }) else nil, 
        Video = v3.createElement(v6, {
            video = v16.video, 
            thumbnail = v16.thumbnail, 
            shouldStartPlayback = v16.shouldStartPlayback, 
            muted = v20, 
            looped = v16.looped, 
            ScaleType = v16.ScaleType, 
            cornerRadius = v16.cornerRadius, 
            onVideoLoaded = v24, 
            onVideoLooped = v16.onVideoLooped, 
            onVideoEnded = if l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 then v16.onVideoEnded else nil, 
            ref = if not not l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 or l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v28 else nil
        }), 
        PlayButton = if not (l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and v18) or v35 then nil else v3.createElement(v7, {
            icon = "play-large", 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            ZIndex = 2, 
            Selectable = not v41 and nil, 
            onActivated = v37
        }), 
        BottomOverlay = if v17 then v3.createElement(v11, {
            cornerRadius = v16.cornerRadius, 
            ZIndex = 10, 
            videoLoaded = v18, 
            muteButtonConfig = v27, 
            playButtonConfig = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v39 else nil, 
            progressBarConfig = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v40 else nil
        }) else nil
    });
end;