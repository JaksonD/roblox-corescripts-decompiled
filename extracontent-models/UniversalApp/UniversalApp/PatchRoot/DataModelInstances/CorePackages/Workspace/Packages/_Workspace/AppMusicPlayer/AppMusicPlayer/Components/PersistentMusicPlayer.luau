local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppMusicPlayer");
local v1 = require(l_script_FirstAncestor_0.Parent.AssetFavorites);
local l_ExperienceService_0 = require(l_script_FirstAncestor_0.Parent.ExperienceService).ExperienceService;
local v3 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v4 = require(l_script_FirstAncestor_0.Parent.MediaPlayback);
local v5 = require(l_script_FirstAncestor_0.Parent.Motion);
local v6 = require(l_script_FirstAncestor_0.Parent.Navigation);
local v7 = require(l_script_FirstAncestor_0.Parent.React);
local v8 = require(l_script_FirstAncestor_0.Parent.ReactRoblox);
local v9 = require(l_script_FirstAncestor_0.Parent.Responsive);
local v10 = require(l_script_FirstAncestor_0.Parent.RobloxAppEnums);
local v11 = require(l_script_FirstAncestor_0.Parent.SignalsReact);
local v12 = require(l_script_FirstAncestor_0.Parent.Songbird);
local v13 = require(l_script_FirstAncestor_0.Components.CompactMusicPlayer);
local v14 = require(l_script_FirstAncestor_0.Components.ExpandedMusicPlayer);
local v15 = require(l_script_FirstAncestor_0.Components.SongDetailsSheet);
local v16 = require(l_script_FirstAncestor_0.Hooks.useMusicTop100Playlist);
local l_useAudioMetadata_0 = v12.useAudioMetadata;
local l_useSongAlbumArt_0 = v12.useSongAlbumArt;
local l_useAssetFavoriting_0 = v1.useAssetFavoriting;
local l_useNavigation_0 = v6.useNavigation;
local l_useLastPlayedAudioStore_0 = v4.useLastPlayedAudioStore;
local l_getAudioPlaybackStore_0 = v4.getAudioPlaybackStore;
local l_useRef_0 = v7.useRef;
local l_useCallback_0 = v7.useCallback;
local l_useMemo_0 = v7.useMemo;
local l_useState_0 = v7.useState;
local l_useEffect_0 = v7.useEffect;
local l_useSignalState_0 = v11.useSignalState;
local l_useSignalBinding_0 = v11.useSignalBinding;
local l_useOverlay_0 = v3.Hooks.useOverlay;
return v7.memo(function(v31) --[[ Line: 43 ]] --[[ Name: PersistentMusicPlayer ]]
    -- upvalues: l_useNavigation_0 (copy), l_useOverlay_0 (copy), l_useRef_0 (copy), l_useState_0 (copy), v9 (copy), l_useMemo_0 (copy), v16 (copy), l_getAudioPlaybackStore_0 (copy), l_useSignalState_0 (copy), l_useLastPlayedAudioStore_0 (copy), l_useSignalBinding_0 (copy), l_useAssetFavoriting_0 (copy), l_useAudioMetadata_0 (copy), l_useSongAlbumArt_0 (copy), v5 (copy), l_useCallback_0 (copy), v10 (copy), l_useEffect_0 (copy), l_ExperienceService_0 (copy), v7 (copy), v3 (copy), v13 (copy), v14 (copy), v15 (copy), v8 (copy), v12 (copy)
    local v32 = l_useNavigation_0();
    local v33 = l_useOverlay_0();
    local v34 = l_useRef_0(false);
    local v35, v36 = l_useState_0(false);
    local v37, v38 = l_useState_0(false);
    local v39, v40 = l_useState_0(true);
    local v41, v42 = l_useState_0(false);
    local v43 = v9.useBreakpointXOrSmaller(v9.BreakpointConfig.Enum.Small);
    local v44 = l_useMemo_0(function() --[[ Line: 53 ]]
        -- upvalues: v43 (copy), v39 (copy)
        return v43 or not v39;
    end, {
        v39, 
        v43
    });
    local v45 = v16();
    local v46 = l_getAudioPlaybackStore_0(false);
    local v47 = l_useSignalState_0(v46.hasNextSong);
    local v48 = l_useSignalState_0(v46.hasPrevSong);
    local v49 = l_useSignalState_0(v46.getIsMuted);
    local v50 = l_useSignalState_0(v46.getGlobalVolume);
    local v51 = l_useLastPlayedAudioStore_0();
    local v52 = l_useSignalState_0(v51.getDuration);
    local v53 = l_useSignalBinding_0(v51.getElapsed);
    local v54 = l_useSignalState_0(v51.getIsPlaying);
    local v55 = l_useSignalState_0(v51.getIsLoaded);
    local v56 = tonumber(v51.assetId);
    local v57 = l_useAssetFavoriting_0(if v56 then {
        v56
    } else {});
    local v58 = if v56 then v57.getByAssetId(v56) else false;
    local v59 = l_useAudioMetadata_0({
        v51.assetId
    });
    local v60 = l_useSongAlbumArt_0(v51.assetId);
    local v61 = l_useMemo_0(function() --[[ Line: 78 ]]
        -- upvalues: v5 (ref)
        return {
            expanded = v5.createState({
                expandedPlayerPosition = UDim2.fromScale(0, 0), 
                compactPlayerPosition = UDim2.fromScale(1, 1)
            }), 
            collapsed = v5.createState({
                expandedPlayerPosition = UDim2.fromScale(0, 1), 
                compactPlayerPosition = UDim2.fromScale(1, 0)
            }), 
            closed = v5.createState({
                expandedPlayerPosition = UDim2.fromScale(0, 1), 
                compactPlayerPosition = UDim2.fromScale(1, 1)
            })
        };
    end, {});
    local v62, v63 = v5.useMotion(v61.expanded);
    local v64 = l_useCallback_0(function() --[[ Line: 97 ]]
        -- upvalues: v34 (copy), v54 (copy), v51 (copy)
        v34.current = v54;
        v51.pause();
    end, {
        v51.pause, 
        v54
    });
    local v66 = l_useCallback_0(function(v65) --[[ Line: 102 ]]
        -- upvalues: v51 (copy), v52 (copy)
        v51.seek(v52 * v65);
    end, {
        v51.seek, 
        v52
    });
    local v67 = l_useCallback_0(function() --[[ Line: 106 ]]
        -- upvalues: v34 (copy), v51 (copy)
        if v34.current then
            v51.play();
        end;
    end, {
        v51.play
    });
    local v68 = l_useCallback_0(function() --[[ Line: 112 ]]
        -- upvalues: v54 (copy), v51 (copy)
        if v54 then
            v51.pause();
            return;
        else
            v51.play();
            return;
        end;
    end, {
        v54, 
        v51.play, 
        v51.pause
    });
    local v69 = l_useCallback_0(function() --[[ Line: 120 ]]
        -- upvalues: v46 (copy)
        v46.playPrevSong();
    end, {});
    local v70 = l_useCallback_0(function() --[[ Line: 124 ]]
        -- upvalues: v46 (copy)
        v46.playNextSong();
    end, {});
    local v71 = l_useCallback_0(function() --[[ Line: 128 ]]
        -- upvalues: v49 (copy), v46 (copy)
        if v49 then
            v46.unmute();
            return;
        else
            v46.mute();
            return;
        end;
    end, {
        v49, 
        v46.unmute, 
        v46.mute
    });
    local v72 = l_useCallback_0(function() --[[ Line: 136 ]]
        -- upvalues: v56 (copy), v57 (copy)
        if v56 then
            v57.toggleFavorite(v56);
        end;
    end, {
        v57.toggleFavorite, 
        v56
    });
    local v73 = l_useCallback_0(function() --[[ Line: 142 ]]
        -- upvalues: v46 (copy), v38 (copy)
        v46.stopAll();
        v38(true);
    end, {
        v46
    });
    local v74 = l_useCallback_0(function() --[[ Line: 147 ]]
        -- upvalues: v40 (copy)
        v40(true);
    end, {});
    local v75 = l_useCallback_0(function() --[[ Line: 151 ]]
        -- upvalues: v40 (copy)
        v40(false);
    end, {});
    local v76 = l_useCallback_0(function() --[[ Line: 155 ]]
        -- upvalues: v32 (copy), v10 (ref), v51 (copy)
        v32.navigate(v10.AppPage.SongDetail, {
            songId = v51.assetId
        });
    end, {
        v51.assetId
    });
    local v77 = l_useCallback_0(function() --[[ Line: 161 ]]
        -- upvalues: v36 (copy)
        v36(false);
    end, {});
    local v78 = l_useCallback_0(function() --[[ Line: 165 ]]
        -- upvalues: v46 (copy), v42 (copy), v36 (copy)
        v46.pauseAll();
        v42(false);
        v36(true);
    end, {
        v46
    });
    local v79 = l_useCallback_0(function() --[[ Line: 171 ]]
        -- upvalues: v42 (copy)
        v42(true);
    end, {});
    local v80 = l_useCallback_0(function() --[[ Line: 175 ]]
        -- upvalues: v42 (copy)
        v42(false);
    end, {});
    l_useEffect_0(function() --[[ Line: 179 ]]
        -- upvalues: v45 (copy), v46 (copy)
        if #v45 > 0 then
            v46.setPlaylist(v45);
        end;
    end, {
        v45
    });
    l_useEffect_0(function() --[[ Line: 185 ]]
        -- upvalues: v37 (copy), v63 (copy), v61 (copy), v44 (copy)
        if v37 then
            v63(v61.closed);
            return;
        elseif v44 then
            v63(v61.collapsed);
            return;
        else
            v63(v61.expanded);
            return;
        end;
    end, {
        v37, 
        v44
    });
    l_useEffect_0(function() --[[ Line: 197 ]]
        -- upvalues: v54 (copy), v38 (copy)
        if v54 then
            v38(false);
        end;
    end, {
        v54
    });
    l_useEffect_0(function() --[[ Line: 203 ]]
        -- upvalues: l_ExperienceService_0 (ref), v46 (copy)
        local v81 = l_ExperienceService_0:RegisterForExperienceJoin(function(...) --[[ Line: 204 ]]
            -- upvalues: v46 (ref)
            v46.stopAll();
        end);
        return function() --[[ Line: 208 ]]
            -- upvalues: v81 (copy)
            if v81 then
                v81:Disconnect();
            end;
        end;
    end, {
        v46
    });
    if not v55 then
        return nil;
    else
        local v82 = v59.getByAssetId(v51.assetId);
        local v83 = false;
        if v82 ~= nil then
            v83 = v60.status == "ok";
        end;
        local v84 = if v82 then v82.Title else "";
        local v85 = if v82 then v82.Artist else "";
        return v7.createElement(v3.View, {
            tag = "size-full-2000 clip", 
            LayoutOrder = v31.LayoutOrder
        }, {
            Compact = v7.createElement(v3.View, {
                tag = "auto-xy", 
                AnchorPoint = Vector2.new(1, 0), 
                Position = v62.compactPlayerPosition
            }, {
                CompactMusicPlayer = v7.createElement(v13, {
                    title = v84, 
                    artist = v85, 
                    albumArt = v60.value, 
                    isLoading = not v83, 
                    duration = v52, 
                    elapsed = v53, 
                    isPlaying = v54, 
                    onOpenSongDetails = v79, 
                    onTogglePlayback = v68, 
                    onExpand = v74, 
                    onToggleLike = v72
                })
            }), 
            Expanded = v7.createElement(v3.View, {
                tag = "size-full", 
                Position = v62.expandedPlayerPosition, 
                ZIndex = 2
            }, {
                ExpandedMusicPlayer = v7.createElement(v14, {
                    albumArt = v60.value, 
                    artist = v85, 
                    duration = v52, 
                    elapsed = v53, 
                    hasNextSong = v47, 
                    hasPrevSong = v48, 
                    isLiked = v58, 
                    isLoading = not v83, 
                    isPlaying = v54, 
                    title = v84, 
                    volume = v50, 
                    assetId = v51.assetId, 
                    analyticsSource = v31.analyticsSource, 
                    onClose = v73, 
                    onCollapse = v75, 
                    onDragTimeline = v66, 
                    onDragTimelineEnd = v67, 
                    onDragTimelineStart = v64, 
                    onOpenSongDetails = v76, 
                    onPlayNextTrack = v70, 
                    onPlayPrevTrack = v69, 
                    onToggleLike = v72, 
                    onToggleMute = v71, 
                    onVolumeChanged = v46.setGlobalVolume, 
                    onTogglePlayback = v68, 
                    onReport = v78
                })
            }), 
            SongDetailsSheet = v7.createElement(v15, {
                title = v84, 
                artist = v85, 
                isLiked = v58, 
                isOpen = v41, 
                albumArt = v60.value, 
                assetId = v51.assetId, 
                onClose = v80, 
                onLike = v72, 
                onUnlike = v72, 
                onReport = v78
            }), 
            ReportDialog = if v35 and v33 then v8.createPortal(v7.createElement(v3.View, {
                tag = "size-full row align-y-center align-x-center bg-over-media-100", 
                stateLayer = {
                    affordance = v3.Enums.StateLayerAffordance.None
                }, 
                onActivated = v77
            }, {
                Dialog = v7.createElement(v12.ReportSongDialog, {
                    audio = {
                        assetId = v51.assetId, 
                        thumbnailAssetId = "-1"
                    }, 
                    analyticsSource = v31.analyticsSource or "unknown", 
                    onClose = v77
                })
            }), v33) else nil
        });
    end;
end);