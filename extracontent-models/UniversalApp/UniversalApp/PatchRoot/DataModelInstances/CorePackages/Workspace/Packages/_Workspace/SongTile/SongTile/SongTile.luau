local l_Parent_0 = script:FindFirstAncestor("SongTile").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.MediaPlayback);
local v4 = require(l_Parent_0.t);
local l_validateProps_0 = require(l_Parent_0.DiscoveryUtils).validateProps;
local v6 = require(l_Parent_0.SignalsReact);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v9 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableTopSongsSort_0 = v9.FFlagEnableTopSongsSort;
local l_GetFFlagLuaAppPersistentMusicPlayer_0 = v9.GetFFlagLuaAppPersistentMusicPlayer;
local l_useSongTileData_0 = require(l_Parent_0.SongInfosRodux).useSongTileData;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_GameTileView_0 = require(l_Parent_0.GameTile).GameTileView;
local l_GameTileViewConfig_0 = require(l_Parent_0.GameTile).GameTileViewConfig;
local l_GameTileConstants_0 = require(l_Parent_0.GameTile).GameTileConstants;
local l_useImpressionsTagger_0 = require(l_Parent_0.Impressions).useImpressionsTagger;
local l_OpenSongDetail_0 = require(l_Parent_0.DiscoveryRouting).OpenSongDetail;
local l_getAudioPlaybackStore_0 = v3.getAudioPlaybackStore;
local l_useAudioStore_0 = v3.useAudioStore;
local l_useSignalState_0 = v6.useSignalState;
local v22 = v4.strictInterface({
    contentId = v4.string, 
    contentTextLineCount = v4.optional(v4.number), 
    hasBackground = v4.optional(v4.boolean), 
    hasOutline = v4.optional(v4.boolean), 
    layoutOrder = v4.optional(v4.number), 
    size = v4.optional(v4.UDim2), 
    zIndex = v4.optional(v4.number), 
    useLargerFooterFont = v4.optional(v4.boolean), 
    impressionsTag = v4.optional(v4.string), 
    reportTileOpened = v4.optional(v4.callback), 
    isContained = v4.optional(v4.boolean)
});
return function(v23) --[[ Line: 62 ]]
    -- upvalues: l_FFlagEnableTopSongsSort_0 (copy), l_validateProps_0 (copy), v22 (copy), l_useDispatch_0 (copy), l_useStyle_0 (copy), l_useSongTileData_0 (copy), l_GetFFlagLuaAppPersistentMusicPlayer_0 (copy), l_useAudioStore_0 (copy), l_useSignalState_0 (copy), v1 (copy), l_getAudioPlaybackStore_0 (copy), l_useTokens_0 (copy), l_OpenSongDetail_0 (copy), l_useImpressionsTagger_0 (copy), v2 (copy), l_GameTileView_0 (copy), l_GameTileConstants_0 (copy), l_GameTileViewConfig_0 (copy)
    assert(l_FFlagEnableTopSongsSort_0, "Song Sort is not enabled");
    l_validateProps_0(v22, v23);
    local v24 = l_useDispatch_0();
    local v25 = l_useStyle_0();
    local v26 = l_useSongTileData_0(v23.contentId);
    local l_song_0 = v26.song;
    local l_thumbnail_0 = v26.thumbnail;
    local v29 = v23.size or UDim2.fromScale(1, 1);
    local v30 = if l_GetFFlagLuaAppPersistentMusicPlayer_0() then l_useAudioStore_0(v23.contentId) else nil;
    local v31 = if l_GetFFlagLuaAppPersistentMusicPlayer_0() then l_useSignalState_0(v30.getIsPlaying) else nil;
    local v32 = if l_GetFFlagLuaAppPersistentMusicPlayer_0() then v1.useCallback(function() --[[ Line: 81 ]]
        -- upvalues: l_getAudioPlaybackStore_0 (ref), v31 (copy), v30 (copy)
        l_getAudioPlaybackStore_0(false).stopAll();
        if not v31 then
            v30.play();
        end;
    end, {
        v31, 
        v30.play
    }) else nil;
    local v33 = l_useTokens_0();
    local v36 = v1.useCallback(function() --[[ Line: 91 ]]
        -- upvalues: l_song_0 (copy), v33 (copy), v1 (ref), v25 (copy)
        local v34 = l_song_0 and l_song_0.artist or "";
        local l_TitleMedium_0 = v33.Typography.TitleMedium;
        return v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_TitleMedium_0.FontSize), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            v1.createElement("TextLabel", {
                Text = v34, 
                Size = UDim2.new(1, 0, 0, l_TitleMedium_0.FontSize), 
                Font = v33.Typography.TitleMedium.Font, 
                BackgroundTransparency = 1, 
                TextWrapped = false, 
                TextSize = l_TitleMedium_0.FontSize, 
                TextColor3 = v25.Theme.TextMuted.Color, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        });
    end, {
        v25, 
        l_song_0, 
        v33
    });
    local v37 = v1.useCallback(function() --[[ Line: 116 ]]
        -- upvalues: v23 (copy), v24 (copy), l_OpenSongDetail_0 (ref)
        if v23.reportTileOpened then
            v23.reportTileOpened(v23.contentId);
        end;
        v24(l_OpenSongDetail_0(v23.contentId));
    end, {
        v24, 
        v23.contentId, 
        v23.reportTileOpened
    });
    local v38 = v1.useRef(nil);
    l_useImpressionsTagger_0(v38, v23.impressionsTag or "", v23.layoutOrder);
    if not l_song_0 or not l_thumbnail_0 then
        return nil;
    else
        local v39 = if l_GetFFlagLuaAppPersistentMusicPlayer_0() then v1.createElement(v2.View, {
            tag = "size-full col align-x-right align-y-bottom padding-small", 
            stateLayer = {
                affordance = v2.Enums.StateLayerAffordance.None
            }, 
            onActivated = v32
        }, {
            TogglePlaybackButton = v1.createElement(v2.View, {
                tag = "auto-xy bg-over-media-100 radius-circle"
            }, {
                IconButton = v1.createElement(v2.IconButton, {
                    icon = if v31 then v2.Enums.IconName.PauseLarge else v2.Enums.IconName.PlayLarge, 
                    size = v2.Enums.InputSize.Medium, 
                    variant = v2.Enums.ButtonVariant.Utility, 
                    isCircular = true, 
                    onActivated = v32
                })
            })
        }) else nil;
        return v1.createElement("Frame", {
            Size = v29, 
            BackgroundTransparency = 1, 
            LayoutOrder = v23.layoutOrder, 
            ZIndex = v23.zIndex, 
            ref = v38
        }, {
            Tile = v1.createElement(l_GameTileView_0, {
                numLinesForTitle = l_GameTileConstants_0.TileTextLines.Narrow.titleTextLines, 
                Size = UDim2.fromScale(1, 1), 
                image = l_thumbnail_0, 
                title = l_song_0.title, 
                onActivated = v37, 
                footerMetadata = v36(), 
                containmentSidePadding = l_GameTileViewConfig_0.getContainmentSidePadding(v25.Tokens, "Narrow"), 
                isUnifiedGameTile = true, 
                hidePlayButton = true, 
                isContained = v23.isContained and true or false, 
                isHovered = false, 
                imageAspectRatio = l_GameTileViewConfig_0.getImageAspectRatio("Narrow"), 
                thumbnailOverlay = if l_GetFFlagLuaAppPersistentMusicPlayer_0() then v39 else nil
            })
        });
    end;
end;