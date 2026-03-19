local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppMusicPlayer");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v5 = require(l_script_FirstAncestor_0.Parent.Songbird);
local v6 = require(l_script_FirstAncestor_0.Parent.Localization);
local v7 = require(l_script_FirstAncestor_0.Components.SongAttribution);
local l_createNextOrder_0 = v4.createNextOrder;
local l_useLocalization_0 = v6.Hooks.useLocalization;
local l_useRef_0 = v3.useRef;
local l_useCallback_0 = v3.useCallback;
local l_useMemo_0 = v3.useMemo;
local l_useState_0 = v3.useState;
local v14 = Vector2.new(300, 1e999);
local v15 = {
    isLoading = false, 
    analyticsSource = "unknown"
};
return v3.memo(function(v16) --[[ Line: 63 ]] --[[ Name: ExpandedMusicPlayer ]]
    -- upvalues: v1 (copy), v15 (copy), l_createNextOrder_0 (copy), l_useRef_0 (copy), l_useState_0 (copy), l_useLocalization_0 (copy), l_useCallback_0 (copy), l_useMemo_0 (copy), v2 (copy), v3 (copy), v14 (copy), v7 (copy), v5 (copy)
    local v17 = v1.Dictionary.join(v15, v16);
    local v18 = l_createNextOrder_0();
    local v19 = l_useRef_0(nil);
    local v20, v21 = l_useState_0(false);
    local v22 = l_useLocalization_0({
        report = "Feature.MusicPlayer.Action.Report", 
        goToSongDetails = "Feature.MusicPlayer.Action.GoToSongDetails"
    });
    local v23 = l_useCallback_0(function() --[[ Line: 75 ]]
        -- upvalues: v21 (copy)
        v21(false);
    end, {});
    local v24 = l_useCallback_0(function() --[[ Line: 79 ]]
        -- upvalues: v21 (copy)
        v21(true);
    end, {});
    local v25 = l_useMemo_0(function() --[[ Line: 83 ]]
        -- upvalues: v22 (copy), v2 (ref), v21 (copy), v17 (copy)
        return {
            {
                id = "report", 
                text = v22.report, 
                icon = v2.Enums.IconName.Flag, 
                isChecked = false, 
                isDisabled = false, 
                onActivated = function() --[[ Line: 91 ]] --[[ Name: onActivated ]]
                    -- upvalues: v21 (ref), v17 (ref)
                    v21(false);
                    v17.onReport();
                end
            }, 
            {
                id = "view-details", 
                text = v22.goToSongDetails, 
                icon = v2.Enums.IconName.MusicNote, 
                isChecked = false, 
                isDisabled = false, 
                onActivated = function() --[[ Line: 102 ]] --[[ Name: onActivated ]]
                    -- upvalues: v21 (ref), v17 (ref)
                    v21(false);
                    v17.onOpenSongDetails();
                end
            }
        };
    end, {
        v17.onReport, 
        v17.onOpenSongDetails
    });
    return v3.createElement(v2.View, {
        tag = "size-full-2000 row flex-between gap-medium bg-surface-200 align-y-center padding-small"
    }, {
        SongAttributionWrapper = v3.createElement(v2.View, {
            tag = "size-full-0 auto-y shrink row align-y-center gap-medium", 
            sizeConstraint = {
                MaxSize = v14
            }, 
            LayoutOrder = v18()
        }, {
            SongAttribution = v3.createElement(v7, {
                title = v17.title, 
                artist = v17.artist, 
                albumArt = v17.albumArt, 
                isLoading = v17.isLoading, 
                onActivated = v17.onOpenSongDetails, 
                LayoutOrder = v18()
            }), 
            LikeButton = v3.createElement(v2.IconButton, {
                icon = {
                    name = v2.Enums.IconName.Star, 
                    variant = if v17.isLiked then v2.Enums.IconVariant.Filled else nil
                }, 
                onActivated = v17.onToggleLike, 
                LayoutOrder = v18()
            })
        }), 
        PlaybackControls = v3.createElement(v2.View, {
            tag = "auto-xy shrink-3 col align-x-center align-y-center", 
            LayoutOrder = v18()
        }, {
            ButtonCluster = v3.createElement(v2.View, {
                tag = "auto-xy row gap-small align-x-center"
            }, {
                PrevButton = v3.createElement(v2.IconButton, {
                    icon = v2.Enums.IconName.SkipStartLarge, 
                    isDisabled = not v17.hasPrevSong, 
                    onActivated = v17.onPlayPrevTrack, 
                    LayoutOrder = v18()
                }), 
                PlaybackToggleButton = v3.createElement(v2.IconButton, {
                    icon = if v17.isPlaying then v2.Enums.IconName.PauseLarge else v2.Enums.IconName.PlayLarge, 
                    isCircular = true, 
                    variant = v2.Enums.ButtonVariant.Emphasis, 
                    onActivated = v17.onTogglePlayback, 
                    LayoutOrder = v18()
                }), 
                NextButton = v3.createElement(v2.IconButton, {
                    icon = v2.Enums.IconName.SkipEndLarge, 
                    isDisabled = not v17.hasNextSong, 
                    onActivated = v17.onPlayNextTrack, 
                    LayoutOrder = v18()
                })
            }), 
            AudioPlaybackTimelineWrapper = v3.createElement(v2.View, {
                tag = "auto-xy", 
                sizeConstraint = {
                    MaxSize = v14
                }
            }, {
                AudioPlaybackTimeline = v3.createElement(v5.AudioPlaybackTimeline, {
                    duration = v17.duration, 
                    elapsed = v17.elapsed, 
                    onDragTimeline = v17.onDragTimeline, 
                    onDragTimelineStart = v17.onDragTimelineStart, 
                    onDragTimelineEnd = v17.onDragTimelineEnd, 
                    LayoutOrder = v18()
                })
            })
        }), 
        Actions = v3.createElement(v2.View, {
            tag = "size-full-0 auto-y shrink row gap-small align-x-right", 
            sizeConstraint = {
                MaxSize = v14
            }, 
            LayoutOrder = v18()
        }, {
            VolumeControl = v3.createElement(v2.View, {
                tag = "auto-xy row align-y-center", 
                LayoutOrder = v18()
            }, {
                VolumeButton = v3.createElement(v2.IconButton, {
                    icon = if v17.volume == 0 then v2.Enums.IconName.SpeakerSlash else v2.Enums.IconName.Speaker, 
                    onActivated = v17.onToggleMute, 
                    LayoutOrder = v18()
                })
            }), 
            CollapseButton = v3.createElement(v2.IconButton, {
                icon = v2.Enums.IconName.TwoArrowsToCenter, 
                onActivated = v17.onCollapse, 
                LayoutOrder = v18()
            }), 
            OverflowButton = v3.createElement(v2.IconButton, {
                icon = v2.Enums.IconName.ThreeDotsVertical, 
                onActivated = if v20 then v23 else v24, 
                ref = v19, 
                LayoutOrder = v18()
            }), 
            CloseButton = v3.createElement(v2.IconButton, {
                icon = v2.Enums.IconName.X, 
                onActivated = v17.onClose, 
                LayoutOrder = v18()
            })
        }), 
        OverflowMenu = v20 and v3.createElement(v2.Menu, {
            isOpen = true, 
            items = v25, 
            side = v2.Enums.PopoverSide.Top, 
            anchorRef = v19, 
            onPressedOutside = v23
        })
    });
end);