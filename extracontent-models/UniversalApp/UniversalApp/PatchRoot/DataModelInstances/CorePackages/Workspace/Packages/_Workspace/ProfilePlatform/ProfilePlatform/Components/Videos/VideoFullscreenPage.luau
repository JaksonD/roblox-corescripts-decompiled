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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function() --[[ Line: 60 ]]
    -- upvalues: l_useNavigation_0 (copy), l_useScreenSize_0 (copy), l_useStyle_0 (copy), v3 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (copy), l_useNavigationFocus_0 (copy), v6 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_VideoLogger_0 (copy), l_VideoActions_0 (copy), v25 (copy), l_UserInputService_0 (copy), l_FullscreenPageWithSafeArea_0 (copy), l_View_0 (copy), l_IconButton_0 (copy), l_ButtonSize_0 (copy), v11 (copy), l_VideoPlaybackCoordinator_0 (copy), v12 (copy), l_Interactable_0 (copy)
    local v27 = l_useNavigation_0();
    local v28 = v27.getParam("extraProps");
    local v29 = l_useScreenSize_0();
    local l_Theme_0 = l_useStyle_0().Theme;
    local v31, v32 = v3.useState(0);
    local v33, v34 = v3.useState(0);
    local v35, v36 = v3.useState(true);
    local v37, v38 = v3.useState(not v28 or not (v28.isMuted ~= nil) or v28.isMuted);
    local v39 = v3.useRef(nil);
    local v40 = if l_FFlagBrandVideosEnableActionAnalytics_0 and v28 and v28.videoKey then v28.videoKey or v28.videoId else nil;
    v3.useEffect(function() --[[ Line: 79 ]]
        -- upvalues: v28 (copy), v37 (copy)
        if v28 and v28.onMuteUpdate then
            v28.onMuteUpdate(v37);
        end;
    end, {
        v37, 
        v28
    });
    local v41 = if l_FFlagBrandVideosEnableActionAnalytics_0 then l_useNavigationFocus_0() else nil;
    local v44 = if l_FFlagBrandVideosEnableActionAnalytics_0 then v3.useCallback(function(v42) --[[ Line: 89 ]]
        -- upvalues: v37 (copy), v28 (copy), v40 (copy), v6 (ref), v41 (copy), v33 (copy)
        if v42 == nil then
            v42 = v37;
        end;
        local v43 = nil;
        if v28 and v28.videoPlaybackCoordinator then
            v43 = v28.videoPlaybackCoordinator:getVideoMetadata(v40);
        end;
        return v6.Dictionary.join(if v28 then v28.videoAnalyticsMetadata else {}, {
            isAudible = not v42, 
            isFullscreen = true, 
            isVisible = v41, 
            videoAssetDuration = v33 or 0, 
            volumeLevel = v42 and 0 or 1, 
            playbackSessionId = v43 and v43.playbackSessionId, 
            impressionId = v43 and v43.impressionId
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v37, 
        v41, 
        v33
    } else l_dependencyArray_0(v37, v41, v33)) else nil;
    local v47 = v3.useMemo(function() --[[ Line: 114 ]]
        -- upvalues: v29 (copy)
        local l_X_0 = v29.X;
        local v46 = l_X_0 / 1.7777777777777777;
        if v29.Y < v46 then
            v46 = v29.Y;
            l_X_0 = v46 * 1.7777777777777777;
        end;
        return UDim2.new(0, l_X_0, 0, v46);
    end, {
        v29.X, 
        v29.Y
    });
    local v48 = v3.useCallback(function() --[[ Line: 126 ]]
        -- upvalues: l_FFlagBrandVideosEnableActionAnalytics_0 (ref), l_VideoLogger_0 (ref), l_VideoActions_0 (ref), v44 (copy), v25 (ref), v39 (copy), v35 (copy), v28 (copy), v40 (copy), v27 (copy)
        if l_FFlagBrandVideosEnableActionAnalytics_0 then
            l_VideoLogger_0.reportVideoAction(l_VideoActions_0.exit_fullscreen, nil, v44());
        end;
        if v25 and v39.current and v35 then
            v39.current.togglePlayPause();
        end;
        if l_FFlagBrandVideosEnableActionAnalytics_0 and v28 and v28.videoPlaybackCoordinator then
            v28.videoPlaybackCoordinator:setVideoKeepSessionOnPlaybackCancel(v40, false);
            v28.videoPlaybackCoordinator:cancelPlayback(v40, "", nil, nil, v44());
        end;
        if l_FFlagBrandVideosEnableActionAnalytics_0 and v28 and v28.onFullscreenClose then
            v28.onFullscreenClose();
        end;
        v27.goBack();
    end, {
        v27.goBack
    });
    local v53 = v3.useCallback(function(v49, v50, v51, v52) --[[ Line: 144 ]]
        -- upvalues: v32 (copy), v34 (copy), v36 (copy), v38 (copy)
        v32(v49);
        v34(v50);
        v36(v51);
        v38(v52);
    end, {});
    local v55 = v3.useCallback(function(v54) --[[ Line: 152 ]]
        -- upvalues: v39 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (ref), l_VideoLogger_0 (ref), l_VideoActions_0 (ref), v44 (copy), v31 (copy), v33 (copy)
        if v39.current and v39.current.setTimePosition then
            if l_FFlagBrandVideosEnableActionAnalytics_0 then
                l_VideoLogger_0.reportVideoAction(l_VideoActions_0.scrub, nil, v44(), {
                    scrubStartTime = v31, 
                    scrubEndTime = v33 * v54
                });
            end;
            v39.current.setTimePosition(v33 * v54);
        end;
    end, if l_FFlagBrandVideosEnableActionAnalytics_0 then if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v33, 
        v31
    } else l_dependencyArray_0(v33, v31) else {
        v33
    });
    local v56 = v3.useCallback(function() --[[ Line: 170 ]]
        -- upvalues: v39 (copy)
        if v39.current and v39.current.togglePlayPause then
            v39.current.togglePlayPause();
        end;
    end, {});
    local v58 = v3.useCallback(function() --[[ Line: 177 ]]
        -- upvalues: v39 (copy), l_FFlagBrandVideosEnableActionAnalytics_0 (ref), v37 (copy), l_VideoLogger_0 (ref), l_VideoActions_0 (ref), v44 (copy)
        if v39.current and v39.current.toggleMute then
            v39.current.toggleMute();
            if l_FFlagBrandVideosEnableActionAnalytics_0 then
                local v57 = not v37;
                l_VideoLogger_0.reportVideoAction(l_VideoActions_0.volume, nil, v44(v57));
            end;
        end;
    end, if l_FFlagBrandVideosEnableActionAnalytics_0 then if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v37, 
        v33, 
        v41, 
        v28
    } else l_dependencyArray_0(v37, v33, v41, v28) else {});
    v3.useEffect(function() --[[ Line: 194 ]]
        -- upvalues: l_UserInputService_0 (ref), v56 (copy), v48 (copy)
        local v61 = l_UserInputService_0.InputBegan:Connect(function(v59, v60) --[[ Line: 195 ]]
            -- upvalues: v56 (ref), v48 (ref)
            if v60 then
                return;
            else
                if v59.KeyCode == Enum.KeyCode.Space then
                    v56();
                end;
                if v59.KeyCode == Enum.KeyCode.Escape then
                    v48();
                end;
                return;
            end;
        end);
        return function() --[[ Line: 209 ]]
            -- upvalues: v61 (copy)
            v61:Disconnect();
        end;
    end, {
        v56, 
        v48
    });
    return v3.createElement(l_FullscreenPageWithSafeArea_0, {
        includeStatusBar = true, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency
    }, {
        CloseButtonContainer = v3.createElement(l_View_0, {
            tag = "align-x-right align-y-top position-top-right anchor-top-right auto-xy padding-xlarge padding-medium", 
            ZIndex = 100000
        }, {
            CloseButton = v3.createElement(l_IconButton_0, {
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 0, 0.5, 0), 
                icon = "icons/navigation/close", 
                size = l_ButtonSize_0.Medium, 
                onActivated = v48
            })
        }), 
        VideoContainer = v3.createElement(l_View_0, {
            Size = v47, 
            tag = "position-center-center anchor-center-center"
        }, {
            VideoPlayer = if v28 and v28.videoId then v3.createElement(v11, {
                initialTimePosition = v28.initialTimePosition, 
                isFullscreen = true, 
                isMuted = v37, 
                looped = false, 
                videoId = v28.videoId, 
                videoKey = if l_FFlagBrandVideosEnableActionAnalytics_0 then v40 else nil, 
                onProgressUpdate = v53, 
                videoPlaybackCoordinator = if l_FFlagBrandVideosEnableActionAnalytics_0 then v28.videoPlaybackCoordinator or l_VideoPlaybackCoordinator_0.new() else nil, 
                videoAnalyticsMetadata = if l_FFlagBrandVideosEnableActionAnalytics_0 then v28.videoAnalyticsMetadata else nil, 
                ref = v39
            }) else nil
        }), 
        FixedProgressBar = if v33 > 0 then v3.createElement(l_View_0, {
            Size = UDim2.new(1, 0, 0, 80), 
            tag = "position-bottom-center anchor-bottom-center", 
            ZIndex = 1000
        }, {
            ProgressBar = v3.createElement(v12, {
                isFullScreen = true, 
                isMuted = v37, 
                isPlaying = v35, 
                onMuteButtonActivated = v58, 
                onPlayButtonActivated = v56, 
                onProgressBarActivated = v55, 
                timePosition = v31, 
                timeLength = v33
            })
        }) else nil, 
        InteractableWrapper = if v33 > 0 then v3.createElement(l_View_0, {
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 999
        }, {
            Interactable = v3.createElement(l_Interactable_0, {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                Selectable = false, 
                [v3.Event.Activated] = v56
            })
        }) else nil
    });
end;