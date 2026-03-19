local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppMusicPlayer");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v5 = require(l_script_FirstAncestor_0.Parent.Responsive);
local v6 = require(l_script_FirstAncestor_0.Components.SongAttribution);
local v7 = require(l_script_FirstAncestor_0.Enums.SongAttributionVariant);
local l_createNextOrder_0 = v4.createNextOrder;
local v9 = {
    isLoading = false
};
return v3.memo(function(v10) --[[ Line: 38 ]] --[[ Name: CompactMusicPlayer ]]
    -- upvalues: v1 (copy), v9 (copy), l_createNextOrder_0 (copy), v5 (copy), v3 (copy), v2 (copy), v6 (copy), v7 (copy)
    local v11 = v1.Dictionary.join(v9, v10);
    local v12 = l_createNextOrder_0();
    local v13 = v5.useBreakpointXOrSmaller(v5.BreakpointConfig.Enum.Small);
    return v3.createElement(v2.View, {
        tag = "auto-xy col bg-surface-200 radius-medium", 
        sizeConstraint = {
            MaxSize = Vector2.new(300, 1e999)
        }, 
        LayoutOrder = v11.LayoutOrder
    }, {
        ProgressBar = v3.createElement(v2.View, {
            tag = "size-full-50 bg-action-standard", 
            LayoutOrder = v12()
        }, {
            Fill = v3.createElement(v2.View, {
                tag = "size-0-full bg-action-emphasis", 
                testId = "compact-music-player-progress-bar-fill", 
                Size = v11.elapsed:map(function(v14) --[[ Line: 58 ]]
                    -- upvalues: v11 (copy)
                    return UDim2.fromScale(v14 / v11.duration, 1);
                end)
            })
        }), 
        Content = v3.createElement(v2.View, {
            tag = "auto-xy row flex-between gap-medium align-y-center padding-small", 
            LayoutOrder = v12()
        }, {
            SongAttributionWrapper = v3.createElement(v2.View, {
                tag = "size-full-0 auto-y shrink", 
                LayoutOrder = v12()
            }, {
                SongAttribution = v3.createElement(v6, {
                    title = v11.title, 
                    artist = v11.artist, 
                    albumArt = v11.albumArt, 
                    isLoading = v11.isLoading, 
                    variant = v7.Compact, 
                    onActivated = v11.onOpenSongDetails, 
                    LayoutOrder = v12()
                })
            }), 
            CollapseButton = if not v13 then v3.createElement(v2.IconButton, {
                icon = v2.Enums.IconName.TwoArrowsFromCenter, 
                size = v2.Enums.ButtonSize.Small, 
                onActivated = v11.onExpand, 
                LayoutOrder = v12()
            }) else nil, 
            PlaybackToggleButton = v3.createElement(v2.IconButton, {
                icon = if v11.isPlaying then v2.Enums.IconName.PauseLarge else v2.Enums.IconName.PlayLarge, 
                variant = v2.Enums.ButtonVariant.Emphasis, 
                size = v2.Enums.ButtonSize.Small, 
                isCircular = true, 
                onActivated = v11.onTogglePlayback, 
                LayoutOrder = v12()
            })
        })
    });
end);