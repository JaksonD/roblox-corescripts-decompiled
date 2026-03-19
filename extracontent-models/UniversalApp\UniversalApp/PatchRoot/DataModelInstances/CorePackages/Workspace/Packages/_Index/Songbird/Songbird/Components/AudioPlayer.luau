local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v3 = require(l_script_FirstAncestor_0.Parent.MediaPlayback);
local v4 = require(l_script_FirstAncestor_0.Parent.React);
local v5 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v6 = require(l_script_FirstAncestor_0.Parent.SignalsReact);
local v7 = require(l_script_FirstAncestor_0.Components.RoundIconButton);
local v8 = require(l_script_FirstAncestor_0.Components.AudioPlaybackTimeline);
local _ = require(l_script_FirstAncestor_0.types);
local v10 = require(l_script_FirstAncestor_0.Analytics.AnalyticActions);
local v11 = require(l_script_FirstAncestor_0.Analytics.sendAudioPlayerAnalytics);
local v12 = require(l_script_FirstAncestor_0.Hooks.useStopSongOnPageNavigation);
local l_GetFFlagLuaAppPersistentMusicPlayer_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).GetFFlagLuaAppPersistentMusicPlayer;
local l_GetFFlagAudioPlayerCanSkipTracks_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).GetFFlagAudioPlayerCanSkipTracks;
local l_GetFFlagSongDetailsPageRegressionTracking_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).GetFFlagSongDetailsPageRegressionTracking;
local l_getAudioPlaybackStore_0 = v3.getAudioPlaybackStore;
local l_useAudioStore_0 = v3.useAudioStore;
local l_useCallback_0 = v4.useCallback;
local l_useRef_0 = v4.useRef;
local l_useEffect_0 = v4.useEffect;
local l_createNextOrder_0 = v5.createNextOrder;
local l_usePrevious_0 = v5.usePrevious;
local l_useSignalState_0 = v6.useSignalState;
local l_useSignalBinding_0 = v6.useSignalBinding;
local v25 = {
    isNavigationFocus = true
};
local v26 = Vector2.new(320, 320);
return function(v27) --[[ Line: 60 ]] --[[ Name: AudioPlayer ]]
    -- upvalues: v1 (copy), v25 (copy), l_createNextOrder_0 (copy), l_useAudioStore_0 (copy), l_useSignalState_0 (copy), l_useSignalBinding_0 (copy), l_GetFFlagAudioPlayerCanSkipTracks_0 (copy), l_getAudioPlaybackStore_0 (copy), l_useCallback_0 (copy), v11 (copy), l_GetFFlagSongDetailsPageRegressionTracking_0 (copy), v10 (copy), l_useRef_0 (copy), l_GetFFlagLuaAppPersistentMusicPlayer_0 (copy), v12 (copy), l_usePrevious_0 (copy), l_useEffect_0 (copy), v4 (copy), v2 (copy), v26 (copy), v8 (copy), v7 (copy)
    local v28 = v1.Dictionary.join(v25, v27);
    local v29 = l_createNextOrder_0();
    local v30 = l_useAudioStore_0(v28.audio.assetId);
    local v31 = l_useSignalState_0(v30.getIsPlaying);
    local v32 = l_useSignalState_0(v30.getIsElapsed);
    local v33 = l_useSignalState_0(v30.getDuration);
    local v34 = l_useSignalBinding_0(v30.getElapsed);
    local v35 = if l_GetFFlagAudioPlayerCanSkipTracks_0() then l_useSignalState_0(l_getAudioPlaybackStore_0) else nil;
    local v36 = if l_GetFFlagAudioPlayerCanSkipTracks_0() then l_useSignalState_0(v35.hasNextSong) else nil;
    local v37 = if l_GetFFlagAudioPlayerCanSkipTracks_0() then l_useSignalState_0(v35.hasPrevSong) else nil;
    local v38 = v36 or v37;
    local v42 = l_useCallback_0(function(v39) --[[ Line: 84 ]]
        -- upvalues: v28 (copy), v11 (ref), l_GetFFlagSongDetailsPageRegressionTracking_0 (ref), v34 (copy)
        local v40 = v28.audio.assetId:gsub("rbxassetid://", "");
        local v41 = if v28.audio.thumbnailAssetId then v28.audio.thumbnailAssetId:gsub("rbxassetid://", "") else nil;
        v11({
            action = v39, 
            songId = v40, 
            thumbnailId = v41 or "-1", 
            source = v28.analyticsSource, 
            listenDurationSeconds = if l_GetFFlagSongDetailsPageRegressionTracking_0() then v34:getValue() else nil
        });
    end, {
        v28.audio.assetId, 
        v28.audio.thumbnail, 
        v28.analyticsSource, 
        if l_GetFFlagSongDetailsPageRegressionTracking_0() then v34 else nil
    });
    local v43 = l_useCallback_0(function() --[[ Line: 111 ]]
        -- upvalues: v42 (copy), v10 (ref), l_GetFFlagSongDetailsPageRegressionTracking_0 (ref)
        v42(v10.AudioElapsed);
        if l_GetFFlagSongDetailsPageRegressionTracking_0() then
            v42(v10.AudioStopped);
        end;
    end, {
        v42
    });
    local v44 = l_useRef_0(false);
    local v45 = l_useCallback_0(function() --[[ Line: 120 ]]
        -- upvalues: v44 (copy), v31 (copy), v30 (copy)
        v44.current = v31;
        v30.pause();
    end, {
        v30.pause, 
        v31
    });
    local v47 = l_useCallback_0(function(v46) --[[ Line: 125 ]]
        -- upvalues: v30 (copy), v33 (copy)
        v30.seek(v33 * v46);
    end, {
        v30.seek, 
        v33
    });
    local v48 = l_useCallback_0(function() --[[ Line: 129 ]]
        -- upvalues: v44 (copy), v30 (copy)
        if v44.current then
            v30.play();
        end;
    end, {
        v30.play
    });
    local v49 = l_useCallback_0(function() --[[ Line: 136 ]]
        -- upvalues: v31 (copy), v42 (copy), v10 (ref), l_GetFFlagSongDetailsPageRegressionTracking_0 (ref), v30 (copy), l_GetFFlagAudioPlayerCanSkipTracks_0 (ref), v35 (copy), l_getAudioPlaybackStore_0 (ref)
        if v31 then
            v42(v10.AudioPause);
            if l_GetFFlagSongDetailsPageRegressionTracking_0() then
                v42(v10.AudioStopped);
            end;
            v30.pause();
            return;
        else
            v42(v10.AudioPlay);
            if l_GetFFlagAudioPlayerCanSkipTracks_0() then
                v35.pauseAll();
            else
                l_getAudioPlaybackStore_0(false).pauseAll();
            end;
            v30.play();
            return;
        end;
    end, {
        v30.play, 
        v30.pause, 
        v31, 
        if l_GetFFlagAudioPlayerCanSkipTracks_0() then v35 else nil
    });
    if not l_GetFFlagLuaAppPersistentMusicPlayer_0() then
        local v50 = if l_GetFFlagSongDetailsPageRegressionTracking_0() then l_useCallback_0(function() --[[ Line: 163 ]]
            -- upvalues: v42 (copy), v10 (ref)
            v42(v10.AudioStopped);
        end, {
            v42
        }) else nil;
        if l_GetFFlagSongDetailsPageRegressionTracking_0() then
            v12(v28.isNavigationFocus, v50);
        else
            v12(v28.isNavigationFocus);
        end;
        local v51 = l_usePrevious_0(v32);
        l_useEffect_0(function() --[[ Line: 175 ]]
            -- upvalues: v32 (copy), v51 (copy), v43 (copy)
            if v32 and not v51 then
                v43();
            end;
        end, {
            v32
        });
    end;
    return v4.createElement(v2.View, {
        tag = "auto-xy col align-x-center gap-large", 
        LayoutOrder = v28.LayoutOrder
    }, {
        AudioDetails = v4.createElement(v2.View, {
            tag = "size-full-0 auto-y col align-x-center gap-xlarge"
        }, {
            AlbumArt = v4.createElement(v2.Image, {
                tag = "size-full shrink bg-surface-100 radius-medium", 
                sizeConstraint = {
                    MaxSize = v26
                }, 
                aspectRatio = 1, 
                Image = v28.audio.thumbnail, 
                LayoutOrder = v29()
            }), 
            Info = v4.createElement(v2.View, {
                tag = "size-full-0 auto-y grow col align-x-center gap-medium", 
                LayoutOrder = v29()
            }, {
                Title = v4.createElement(v2.Text, {
                    tag = "auto-xy text-heading-small content-emphasis text-truncate-end", 
                    Text = v28.audio.title, 
                    LayoutOrder = v29()
                }), 
                Artist = v4.createElement(v2.Text, {
                    tag = "auto-xy text-body-large content-default text-truncate-end", 
                    Text = v28.audio.artist, 
                    LayoutOrder = v29()
                })
            })
        }), 
        PlaybackProgress = v4.createElement(v8, {
            LayoutOrder = v29(), 
            duration = v33, 
            elapsed = v34, 
            onDragTimeline = v47, 
            onDragTimelineStart = v45, 
            onDragTimelineEnd = v48
        }), 
        PlaybackControls = v4.createElement(v2.View, {
            tag = "auto-xy row gap-medium align-y-center", 
            LayoutOrder = v29()
        }, {
            PrevButton = if l_GetFFlagAudioPlayerCanSkipTracks_0() and v38 then v4.createElement(v2.IconButton, {
                icon = v2.Enums.IconName.SkipStartLarge, 
                isDisabled = not v37, 
                onActivated = v35.playPrevSong, 
                LayoutOrder = v29()
            }) else nil, 
            PlaybackToggleButton = if l_GetFFlagAudioPlayerCanSkipTracks_0() then v4.createElement(v2.IconButton, {
                icon = if v31 then v2.Enums.IconName.PauseLarge else v2.Enums.IconName.PlayLarge, 
                isCircular = true, 
                variant = v2.Enums.ButtonVariant.Emphasis, 
                onActivated = v49, 
                LayoutOrder = v29()
            }) else v4.createElement(v7, {
                icon = v31 and "icons/controls/media-pause-medium" or "icons/controls/media-play-medium", 
                onActivated = v49, 
                LayoutOrder = v29()
            }), 
            NextButton = if l_GetFFlagAudioPlayerCanSkipTracks_0() and v38 then v4.createElement(v2.IconButton, {
                icon = v2.Enums.IconName.SkipEndLarge, 
                isDisabled = not v36, 
                onActivated = v35.playNextSong, 
                LayoutOrder = v29()
            }) else nil
        })
    });
end;