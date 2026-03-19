local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.UIBlox);
local v6 = require(l_Parent_0.Cryo);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_Interactable_0 = v5.Core.Control.Interactable;
local l_FullscreenPageWithSafeArea_0 = require(l_Parent_0.AppBlox).FullscreenPageWithSafeArea;
local v10 = require(l_Parent_0.Navigation);
local v11 = require(l_script_FirstAncestor_0.Components.Videos.VideoPlayer);
local v12 = require(l_script_FirstAncestor_0.Components.Videos.ProgressBar);
local v13 = require(l_Parent_0.VideoUtils);
local l_VideoPlaybackCoordinator_0 = v13.VideoPlaybackCoordinator;
local l_VideoLogger_0 = v13.VideoLogger;
local l_VideoActions_0 = v13.AnalyticsEnums.VideoActions;
local l_useNavigation_0 = v10.useNavigation;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_IconButton_0 = v4.IconButton;
local l_View_0 = v4.View;
local l_ButtonSize_0 = v4.Enums.ButtonSize;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_useNavigationFocus_0 = require(l_Parent_0.Navigation).useNavigationFocus;
local l_FFlagBrandVideosEnableActionAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagBrandVideosEnableActionAnalytics;
local v25 = game:DefineFastFlag("BrandVideosFixCloseFullscreen", false);
return function() --[[ Line: 58 ]]
    -- upvalues: l_useNavigation_0 (copy), l_useScreenSize_0 (copy), l_useStyle_0 (copy), v3 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (copy), l_useNavigationFocus_0 (copy), v6 (copy), l_dependencyArray_0 (copy), l_VideoLogger_0 (copy), l_VideoActions_0 (copy), v25 (copy), l_UserInputService_0 (copy), l_FullscreenPageWithSafeArea_0 (copy), l_View_0 (copy), l_IconButton_0 (copy), l_ButtonSize_0 (copy), v11 (copy), l_VideoPlaybackCoordinator_0 (copy), v12 (copy), l_Interactable_0 (copy)
    local v26 = l_useNavigation_0();
    local v27 = v26.getParam("extraProps");
    local v28 = l_useScreenSize_0();
    local l_Theme_0 = l_useStyle_0().Theme;
    local v30, v31 = v3.useState(0);
    local v32, v33 = v3.useState(0);
    local v34, v35 = v3.useState(true);
    local v36, v37 = v3.useState(not v27 or not (v27.isMuted ~= nil) or v27.isMuted);
    local v38 = v3.useRef(nil);
    local v39 = if l_FFlagBrandVideosEnableActionAnalytics_0 and v27 and v27.videoKey then v27.videoKey or v27.videoId else nil;
    v3.useEffect(function() --[[ Line: 77 ]]
        -- upvalues: v27 (copy), v36 (copy)
        if v27 and v27.onMuteUpdate then
            v27.onMuteUpdate(v36);
        end;
    end, {
        v36, 
        v27
    });
    local v40 = if l_FFlagBrandVideosEnableActionAnalytics_0 then l_useNavigationFocus_0() else nil;
    local v43 = if l_FFlagBrandVideosEnableActionAnalytics_0 then v3.useCallback(function(v41) --[[ Line: 86 ]]
        -- upvalues: v36 (copy), v27 (copy), v39 (copy), v6 (ref), v40 (copy), v32 (copy)
        if v41 == nil then
            v41 = v36;
        end;
        local v42 = nil;
        if v27 and v27.videoPlaybackCoordinator then
            v42 = v27.videoPlaybackCoordinator:getVideoMetadata(v39);
        end;
        return v6.Dictionary.join(if v27 then v27.videoAnalyticsMetadata else {}, {
            isAudible = not v41, 
            isFullscreen = true, 
            isVisible = v40, 
            videoAssetDuration = v32 or 0, 
            volumeLevel = v41 and 0 or 1, 
            playbackSessionId = v42 and v42.playbackSessionId, 
            impressionId = v42 and v42.impressionId
        });
    end, l_dependencyArray_0(v36, v40, v32)) else nil;
    local v46 = v3.useMemo(function() --[[ Line: 107 ]]
        -- upvalues: v28 (copy)
        local l_X_0 = v28.X;
        local v45 = l_X_0 / 1.7777777777777777;
        if v28.Y < v45 then
            v45 = v28.Y;
            l_X_0 = v45 * 1.7777777777777777;
        end;
        return UDim2.new(0, l_X_0, 0, v45);
    end, {
        v28.X, 
        v28.Y
    });
    local v47 = v3.useCallback(function() --[[ Line: 119 ]]
        -- upvalues: l_FFlagBrandVideosEnableActionAnalytics_0 (ref), l_VideoLogger_0 (ref), l_VideoActions_0 (ref), v43 (copy), v25 (ref), v38 (copy), v34 (copy), v27 (copy), v39 (copy), v26 (copy)
        if l_FFlagBrandVideosEnableActionAnalytics_0 then
            l_VideoLogger_0.reportVideoAction(l_VideoActions_0.exit_fullscreen, nil, v43());
        end;
        if v25 and v38.current and v34 then
            v38.current.togglePlayPause();
        end;
        if l_FFlagBrandVideosEnableActionAnalytics_0 and v27 and v27.videoPlaybackCoordinator then
            v27.videoPlaybackCoordinator:setVideoKeepSessionOnPlaybackCancel(v39, false);
            v27.videoPlaybackCoordinator:cancelPlayback(v39, "", nil, nil, v43());
        end;
        if l_FFlagBrandVideosEnableActionAnalytics_0 and v27 and v27.onFullscreenClose then
            v27.onFullscreenClose();
        end;
        v26.goBack();
    end, {
        v26.goBack
    });
    local v52 = v3.useCallback(function(v48, v49, v50, v51) --[[ Line: 137 ]]
        -- upvalues: v31 (copy), v33 (copy), v35 (copy), v37 (copy)
        v31(v48);
        v33(v49);
        v35(v50);
        v37(v51);
    end, {});
    local v54 = v3.useCallback(function(v53) --[[ Line: 144 ]]
        -- upvalues: v38 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (ref), l_VideoLogger_0 (ref), l_VideoActions_0 (ref), v43 (copy), v30 (copy), v32 (copy)
        if v38.current and v38.current.setTimePosition then
            if l_FFlagBrandVideosEnableActionAnalytics_0 then
                l_VideoLogger_0.reportVideoAction(l_VideoActions_0.scrub, nil, v43(), {
                    scrubStartTime = v30, 
                    scrubEndTime = v32 * v53
                });
            end;
            v38.current.setTimePosition(v32 * v53);
        end;
    end, if l_FFlagBrandVideosEnableActionAnalytics_0 then l_dependencyArray_0(v32, v30) else {
        v32
    });
    local v55 = v3.useCallback(function() --[[ Line: 156 ]]
        -- upvalues: v38 (copy)
        if v38.current and v38.current.togglePlayPause then
            v38.current.togglePlayPause();
        end;
    end, {});
    local v57 = v3.useCallback(function() --[[ Line: 163 ]]
        -- upvalues: v38 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (ref), v36 (copy), l_VideoLogger_0 (ref), l_VideoActions_0 (ref), v43 (copy)
        if v38.current and v38.current.toggleMute then
            v38.current.toggleMute();
            if l_FFlagBrandVideosEnableActionAnalytics_0 then
                local v56 = not v36;
                l_VideoLogger_0.reportVideoAction(l_VideoActions_0.volume, nil, v43(v56));
            end;
        end;
    end, if l_FFlagBrandVideosEnableActionAnalytics_0 then l_dependencyArray_0(v36, v32, v40, v27) else {});
    v3.useEffect(function() --[[ Line: 178 ]]
        -- upvalues: l_UserInputService_0 (ref), v55 (copy), v47 (copy)
        local v60 = l_UserInputService_0.InputBegan:Connect(function(v58, v59) --[[ Line: 179 ]]
            -- upvalues: v55 (ref), v47 (ref)
            if v59 then
                return;
            else
                if v58.KeyCode == Enum.KeyCode.Space then
                    v55();
                end;
                if v58.KeyCode == Enum.KeyCode.Escape then
                    v47();
                end;
                return;
            end;
        end);
        return function() --[[ Line: 193 ]]
            -- upvalues: v60 (copy)
            v60:Disconnect();
        end;
    end, {
        v55, 
        v47
    });
    return v3.createElement(l_FullscreenPageWithSafeArea_0, {
        includeStatusBar = true, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency
    }, {
        CloseButtonContainer = v3.createElement(l_View_0, {
            tag = "align-x-right align-y-top anchor-top-right position-top-right auto-xy padding-medium padding-xlarge", 
            ZIndex = 100000
        }, {
            CloseButton = v3.createElement(l_IconButton_0, {
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 0, 0.5, 0), 
                icon = "icons/navigation/close", 
                size = l_ButtonSize_0.Medium, 
                onActivated = v47
            })
        }), 
        VideoContainer = v3.createElement(l_View_0, {
            Size = v46, 
            tag = "anchor-center-center position-center-center"
        }, {
            VideoPlayer = if v27 and v27.videoId then v3.createElement(v11, {
                initialTimePosition = v27.initialTimePosition, 
                isFullscreen = true, 
                isMuted = v36, 
                looped = false, 
                videoId = v27.videoId, 
                videoKey = if l_FFlagBrandVideosEnableActionAnalytics_0 then v39 else nil, 
                onProgressUpdate = v52, 
                videoPlaybackCoordinator = if l_FFlagBrandVideosEnableActionAnalytics_0 then v27.videoPlaybackCoordinator or l_VideoPlaybackCoordinator_0.new() else nil, 
                videoAnalyticsMetadata = if l_FFlagBrandVideosEnableActionAnalytics_0 then v27.videoAnalyticsMetadata else nil, 
                ref = v38
            }) else nil
        }), 
        FixedProgressBar = if v32 > 0 then v3.createElement(l_View_0, {
            Size = UDim2.new(1, 0, 0, 80), 
            tag = "anchor-bottom-center position-bottom-center", 
            ZIndex = 1000
        }, {
            ProgressBar = v3.createElement(v12, {
                isFullScreen = true, 
                isMuted = v36, 
                isPlaying = v34, 
                onMuteButtonActivated = v57, 
                onPlayButtonActivated = v55, 
                onProgressBarActivated = v54, 
                timePosition = v30, 
                timeLength = v32
            })
        }) else nil, 
        InteractableWrapper = if v32 > 0 then v3.createElement(l_View_0, {
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 999
        }, {
            Interactable = v3.createElement(l_Interactable_0, {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                Selectable = false, 
                [v3.Event.Activated] = v55
            })
        }) else nil
    });
end;