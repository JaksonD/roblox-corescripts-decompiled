local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SongDetails");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Http);
local l_RetrievalStatus_0 = v4.Enum.RetrievalStatus;
local l_Url_0 = v4.Url;
local v7 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v7.Hooks.useTokens;
local v9 = require(l_Parent_0.Cryo);
local v10 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v10.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v10.Hooks.RoactRodux.useSelector;
local l_createNextOrder_0 = require(l_Parent_0.ReactUtils).createNextOrder;
local v14 = require(l_Parent_0.DetailsPageComponents);
local l_DetailsDescription_0 = v14.DetailsDescription;
local l_DetailsInfoTable_0 = v14.DetailsInfoTable;
local v17 = require(l_Parent_0.SongDetailRodux);
local l_useFetchSongDetail_0 = v17.useFetchSongDetail;
local l_useFetchArtistSongs_0 = v17.useFetchArtistSongs;
local l_useFetchSongExperiences_0 = v17.useFetchSongExperiences;
local v21 = require(l_Parent_0.UIBlox);
local l_LoadingStateContainer_0 = v21.App.Container.LoadingStateContainer;
local l_RetrievalStatus_1 = v21.App.Loading.Enum.RetrievalStatus;
local v24 = require(l_Parent_0.NavigationRodux);
local l_NavigateBack_0 = v24.Thunks.NavigateBack;
local l_NavigateDown_0 = v24.Thunks.NavigateDown;
local l_usePageSideMargin_0 = require(l_Parent_0.CollectionViews).usePageSideMargin;
local l_FFlagEnableTopSongsSort_0 = require(l_Parent_0.SharedFlags).FFlagEnableTopSongsSort;
local v29 = require(l_Parent_0.AppBlox);
local l_ContentPosition_0 = v29.ContentPosition;
local l_DetailsPageTemplate_0 = v29.DetailsPageTemplate;
local l_FullscreenPageWithSafeArea_0 = v29.FullscreenPageWithSafeArea;
local l_useDeviceType_0 = require(l_Parent_0.RobloxAppHooks).useDeviceType;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v35 = require(l_script_FirstAncestor_0.Hooks.useSongInfoTableData);
local v36 = require(l_script_FirstAncestor_0.SongCollectionCarousel);
local v37 = require(l_script_FirstAncestor_0.SongExperiencesCollectionCarousel);
local l_useSongTileData_0 = require(l_Parent_0.SongInfosRodux).useSongTileData;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_useAssetFavoriting_0 = require(l_Parent_0.AssetFavorites).useAssetFavoriting;
local v41 = require(l_Parent_0.Songbird);
local l_AudioPlayer_0 = v41.AudioPlayer;
local l_AudioPlayerActions_0 = v41.AudioPlayerActions;
local l_useNavigationFocus_0 = require(l_Parent_0.Navigation).useNavigationFocus;
local l_GetFFlagSongDetailsInAppReportingFlow_0 = require(l_Parent_0.SharedFlags).GetFFlagSongDetailsInAppReportingFlow;
local l_FFlagSongCarouselPropUpdate_0 = require(l_Parent_0.SharedFlags).FFlagSongCarouselPropUpdate;
local l_FFlagSongEdpCarouselIxp_0 = require(l_Parent_0.SharedFlags).FFlagSongEdpCarouselIxp;
local l_FFlagUpdateSongCarouselClipDefault_0 = require(l_Parent_0.SharedFlags).FFlagUpdateSongCarouselClipDefault;
local l_FFlagLuaAppFixSDPLayout_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixSDPLayout;
local function v56(v50, v51) --[[ Line: 114 ]] --[[ Name: getCombinedLoadingStatus ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    for _, v53 in v50 do
        if v53 == l_RetrievalStatus_0.NotStarted then
            return l_RetrievalStatus_0.NotStarted;
        end;
    end;
    for _, v55 in v50 do
        if v55 == l_RetrievalStatus_0.Fetching then
            return l_RetrievalStatus_0.Fetching;
        end;
    end;
    return v51 or l_RetrievalStatus_0.NotStarted;
end;
return function(v57) --[[ Line: 128 ]]
    -- upvalues: l_FFlagEnableTopSongsSort_0 (copy), l_useDispatch_0 (copy), l_createNextOrder_0 (copy), l_FFlagLuaAppFixSDPLayout_0 (copy), l_useTokens_0 (copy), v3 (copy), l_usePageSideMargin_0 (copy), l_useNavigationFocus_0 (copy), l_useSongTileData_0 (copy), l_useFetchSongDetail_0 (copy), l_useFetchSongExperiences_0 (copy), v35 (copy), l_useFetchArtistSongs_0 (copy), v9 (copy), l_useAssetFavoriting_0 (copy), l_useLocalization_0 (copy), l_useSelector_0 (copy), l_useDeviceType_0 (copy), l_NavigateBack_0 (copy), l_GetFFlagSongDetailsInAppReportingFlow_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_Url_0 (copy), v7 (copy), l_AudioPlayer_0 (copy), l_HttpService_0 (copy), l_ContentPosition_0 (copy), l_AudioPlayerActions_0 (copy), l_DetailsDescription_0 (copy), l_RetrievalStatus_1 (copy), v37 (copy), v36 (copy), l_FFlagSongCarouselPropUpdate_0 (copy), l_FFlagSongEdpCarouselIxp_0 (copy), l_FFlagUpdateSongCarouselClipDefault_0 (copy), l_DetailsInfoTable_0 (copy), l_FullscreenPageWithSafeArea_0 (copy), l_DetailsPageTemplate_0 (copy), l_RetrievalStatus_0 (copy), l_LoadingStateContainer_0 (copy), v56 (copy)
    assert(l_FFlagEnableTopSongsSort_0, "Song Sort is not enabled");
    local v58 = l_useDispatch_0();
    local v59 = l_createNextOrder_0();
    local v60 = if l_FFlagLuaAppFixSDPLayout_0 then l_useTokens_0() else nil;
    local v61 = v3.useRef(nil);
    local v62 = l_usePageSideMargin_0(v61.current);
    local v63 = l_useNavigationFocus_0();
    local v64 = (v57.navigation and v57.navigation.state and v57.navigation.state.params or {}).songId or nil;
    local v65 = tonumber(v64);
    local v66 = l_useSongTileData_0(v64);
    local v67 = l_useFetchSongDetail_0(v64);
    local l_songDetail_0 = v67.songDetail;
    local v69 = l_useFetchSongExperiences_0(v64);
    local v70 = v35(l_songDetail_0);
    local v71 = v70 and v70.rows or nil;
    local v72 = l_useFetchArtistSongs_0(v64);
    local v74 = v9.List.filter(v72.artistSongIds, function(v73) --[[ Line: 151 ]]
        -- upvalues: v64 (copy)
        return v73 ~= v64;
    end);
    local v75 = l_useAssetFavoriting_0(if v65 then {
        v65
    } else {});
    local v76 = if v65 then v75.getByAssetId(v65) else false;
    local v77 = l_useLocalization_0({
        descriptionTitle = "Feature.SongDetails.Body.DescriptionTitle", 
        songsByArtistTitle = {
            "Feature.SongDetails.Label.SongsBy"; 
            artistName = l_songDetail_0 and l_songDetail_0.artistName or ""
        }, 
        experiencesFeaturingTrackTitle = {
            "Feature.SongDetails.Label.ExperiencesFeaturingTrack"; 
            trackName = l_songDetail_0 and l_songDetail_0.name or ""
        }, 
        reportAudio = "Feature.SongDetails.Action.ReportAudio"
    });
    local v79 = l_useSelector_0(function(v78) --[[ Line: 171 ]]
        return v78.ScreenSize;
    end);
    local v80 = v79 and v79.X >= 850 or false;
    local v81 = l_useDeviceType_0();
    local v82 = v3.useCallback(function() --[[ Line: 180 ]]
        -- upvalues: v58 (copy), l_NavigateBack_0 (ref)
        v58(l_NavigateBack_0());
    end, {
        v58
    });
    local v83 = if l_GetFFlagSongDetailsInAppReportingFlow_0() then nil else v3.useCallback(function() --[[ Line: 186 ]]
        -- upvalues: v64 (copy), v58 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_Url_0 (ref), v77 (copy)
        if not v64 then
            return;
        else
            v58(l_NavigateDown_0({
                name = l_AppPage_0.GenericWebPage, 
                detail = ("%*/abusereport/asset?id=%*&Source=Music"):format(l_Url_0.BASE_URL, v64), 
                extraProps = {
                    title = v77.reportAudio
                }
            }));
            return;
        end;
    end, {
        v58, 
        v64, 
        v77.reportAudio
    });
    local v84 = v3.useCallback(function() --[[ Line: 200 ]]
        -- upvalues: v65 (copy), v75 (copy)
        if v65 then
            v75.toggleFavorite(v65);
        end;
    end, {
        v75.toggleFavorite, 
        v65
    });
    local v85 = v3.useMemo(function() --[[ Line: 206 ]]
        -- upvalues: v66 (copy), v76 (copy)
        if v66.song then
            return {
                assetId = v66.song.assetId, 
                isLiked = v76, 
                title = v66.song.title, 
                artist = v66.song.artist, 
                thumbnailAssetId = v66.song.albumArtAssetId, 
                thumbnail = v66.thumbnail
            };
        else
            return nil;
        end;
    end, {
        v66.song, 
        v66.thumbnail, 
        v76
    });
    local v86 = v3.useCallback(function() --[[ Line: 220 ]]
        -- upvalues: v85 (copy), v3 (ref), v7 (ref), l_AudioPlayer_0 (ref), v63 (copy)
        if not v85 then
            return nil;
        else
            return v3.createElement(v7.View, {
                tag = "row align-x-center", 
                Size = UDim2.new(1, 0, 0, 500)
            }, {
                MusicPlayer = v3.createElement(l_AudioPlayer_0, {
                    audio = v85, 
                    isNavigationFocus = v63, 
                    analyticsSource = "song-details"
                })
            });
        end;
    end, {
        v85, 
        v63
    });
    local v95 = v3.useCallback(function() --[[ Line: 238 ]]
        -- upvalues: v64 (copy), l_songDetail_0 (copy), l_HttpService_0 (ref), v66 (copy), v79 (copy), v85 (copy), v59 (copy), l_ContentPosition_0 (ref), v3 (ref), l_AudioPlayerActions_0 (ref), v84 (copy), l_GetFFlagSongDetailsInAppReportingFlow_0 (ref), v83 (copy), l_DetailsDescription_0 (ref), l_RetrievalStatus_1 (ref), v67 (copy), v77 (copy), v69 (copy), v37 (ref), l_AppPage_0 (ref), v74 (copy), v36 (ref), l_FFlagSongCarouselPropUpdate_0 (ref), l_FFlagSongEdpCarouselIxp_0 (ref), l_FFlagUpdateSongCarouselClipDefault_0 (ref), v71 (copy), l_DetailsInfoTable_0 (ref), l_FullscreenPageWithSafeArea_0 (ref), l_DetailsPageTemplate_0 (ref), v80 (copy), v86 (copy), v61 (copy), v81 (copy), v82 (copy), v62 (copy), l_FFlagLuaAppFixSDPLayout_0 (ref), v60 (copy)
        if not v64 or not l_songDetail_0 then
            return nil;
        else
            local v87 = tostring(v64) .. tostring(l_HttpService_0:GenerateGUID());
            local l_name_0 = l_songDetail_0.name;
            local l_artistName_0 = l_songDetail_0.artistName;
            local l_thumbnail_0 = v66.thumbnail;
            local v91 = v79 and v79.X > 850 and 12 or 0;
            local v92 = v79 and v79.X > 850 and 4 or nil;
            local v93 = v79 and v79.X > 850 and 4 or nil;
            local v94 = {
                Actions = if v85 then {
                    portraitLayoutOrder = v59(), 
                    landscapeLayoutOrder = v59(), 
                    landscapePosition = l_ContentPosition_0.Left, 
                    renderComponent = function() --[[ Line: 267 ]] --[[ Name: renderComponent ]]
                        -- upvalues: v3 (ref), l_AudioPlayerActions_0 (ref), v85 (ref), v84 (ref), l_GetFFlagSongDetailsInAppReportingFlow_0 (ref), v83 (ref)
                        return v3.createElement(l_AudioPlayerActions_0, {
                            audio = v85, 
                            onLike = v84, 
                            onUnlike = v84, 
                            onReport = if l_GetFFlagSongDetailsInAppReportingFlow_0() then nil else v83, 
                            analyticsSource = "song-details"
                        });
                    end
                } else nil, 
                DetailsDescription = if l_songDetail_0.description and #l_songDetail_0.description > 0 then {
                    portraitLayoutOrder = v59(), 
                    landscapeLayoutOrder = v59(), 
                    landscapePosition = l_ContentPosition_0.Left, 
                    renderComponent = function() --[[ Line: 283 ]] --[[ Name: renderComponent ]]
                        -- upvalues: v3 (ref), l_DetailsDescription_0 (ref), l_RetrievalStatus_1 (ref), v67 (ref), l_songDetail_0 (ref), v77 (ref)
                        return v3.createElement(l_DetailsDescription_0, {
                            dataStatus = l_RetrievalStatus_1.fromRawValue(v67.fetchStatus), 
                            descriptionText = l_songDetail_0.description, 
                            LayoutOrder = 1, 
                            titleText = v77.descriptionTitle
                        });
                    end
                } else nil, 
                SongExperiencesCarousel = if v69.songExperiences and #v69.songExperiences > 0 then {
                    portraitLayoutOrder = v59(), 
                    landscapeLayoutOrder = v59(), 
                    landscapePosition = l_ContentPosition_0.Left, 
                    renderComponent = function() --[[ Line: 299 ]] --[[ Name: renderComponent ]]
                        -- upvalues: v3 (ref), v37 (ref), v69 (ref), v93 (copy), v77 (ref), v87 (copy), v64 (ref), l_AppPage_0 (ref)
                        return v3.createElement(v37, {
                            fractionalItemAmount = 0, 
                            items = v69.songExperiences, 
                            numColumns = v93, 
                            sideMargin = 0, 
                            title = v77.experiencesFeaturingTrackTitle, 
                            impressionsTag = "SongDetails_" .. "SongExperience" .. v87, 
                            songId = v64, 
                            layoutOrder = 2, 
                            pageContext = l_AppPage_0.SongDetail
                        });
                    end
                } else nil, 
                ArtistSongsCarousel = if #v74 > 0 then {
                    portraitLayoutOrder = v59(), 
                    landscapeLayoutOrder = v59(), 
                    landscapePosition = l_ContentPosition_0.Left, 
                    renderComponent = function() --[[ Line: 321 ]] --[[ Name: renderComponent ]]
                        -- upvalues: v3 (ref), v36 (ref), v74 (ref), v77 (ref), v87 (copy), v92 (copy), l_FFlagSongCarouselPropUpdate_0 (ref), l_AppPage_0 (ref), v64 (ref), l_FFlagSongEdpCarouselIxp_0 (ref), l_FFlagUpdateSongCarouselClipDefault_0 (ref)
                        return v3.createElement(v36, {
                            songIds = v74, 
                            title = v77.songsByArtistTitle, 
                            impressionsTag = "SongDetails_" .. "ArtistSong" .. v87, 
                            numColumns = v92, 
                            fractionalItemAmount = 0, 
                            collectionOrder = l_FFlagSongCarouselPropUpdate_0 and 3 or nil, 
                            layoutOrder = if l_FFlagSongCarouselPropUpdate_0 then nil else 3, 
                            pageContext = l_AppPage_0.SongDetail, 
                            referralId = v64, 
                            clipsDescendants = not not l_FFlagSongEdpCarouselIxp_0 or l_FFlagUpdateSongCarouselClipDefault_0 and true or nil
                        });
                    end
                } else nil, 
                DetailsInfoTable = if v71 and #v71 > 0 then {
                    portraitLayoutOrder = v59(), 
                    landscapeLayoutOrder = v59(), 
                    landscapePosition = l_ContentPosition_0.Left, 
                    renderComponent = function() --[[ Line: 347 ]] --[[ Name: renderComponent ]]
                        -- upvalues: v3 (ref), l_DetailsInfoTable_0 (ref), v91 (copy), v71 (ref)
                        return v3.createElement(l_DetailsInfoTable_0, {
                            dividerStartOffset = 0, 
                            horizontalPadding = v91, 
                            rows = v71
                        });
                    end
                } else nil
            };
            return v3.createElement(l_FullscreenPageWithSafeArea_0, {
                includeStatusBar = true, 
                BackgroundTransparency = 1
            }, {
                DetailsPageTemplate = v3.createElement(l_DetailsPageTemplate_0, {
                    bannerImageUrl = if v80 then ("rbxthumb://type=Asset&id=%*&w=1440&h=456"):format(v64) else nil, 
                    renderCustomHeader = v86, 
                    componentList = v94, 
                    containerRef = v61, 
                    deviceType = v81, 
                    gradientHeight = 320, 
                    dualPanelBreakpoint = 1e999, 
                    headerBarBackgroundHeight = 80, 
                    maxContentWidth = 850, 
                    onClose = v82, 
                    sideMargin = v62, 
                    startingOffsetPosition = 500, 
                    subTitleText = l_artistName_0, 
                    thumbnailImageUrl = l_thumbnail_0, 
                    titleText = l_name_0, 
                    backgroundFrameSize = UDim2.new(1, 0, 0, 580), 
                    backgroundImageTransparency = 1, 
                    disableBackgroundAspectRatio = true, 
                    bodyContainerSafeAreaSize = if l_FFlagLuaAppFixSDPLayout_0 then UDim2.fromScale(1, 1) else nil, 
                    backgroundImageSize = if l_FFlagLuaAppFixSDPLayout_0 then UDim2.fromScale(1, 1) else nil, 
                    headerPadding = if l_FFlagLuaAppFixSDPLayout_0 and v60 then 500 * v60.Stroke.Standard else nil
                })
            });
        end;
    end, {
        v74, 
        v81, 
        v58, 
        v77.descriptionTitle, 
        v77.experiencesFeaturingTrackTitle, 
        v77.songsByArtistTitle, 
        v82, 
        v79, 
        v62, 
        l_songDetail_0, 
        v67.fetchStatus, 
        v69.songExperiences, 
        v66.thumbnail, 
        v64, 
        v71, 
        v86
    });
    local v96 = v3.useCallback(function() --[[ Line: 420 ]]
        -- upvalues: v67 (copy), l_RetrievalStatus_0 (ref), v72 (copy), v69 (copy)
        if v67.fetchStatus == l_RetrievalStatus_0.Failed then
            v67.refetchSongDetail();
        end;
        if v72.fetchStatus == l_RetrievalStatus_0.Failed then
            v72.refetchArtistSongs();
        end;
        if v69.fetchStatus == l_RetrievalStatus_0.Failed then
            v69.refetchSongExperiences();
        end;
    end, {
        v67.refetchSongDetail, 
        v72.refetchArtistSongs, 
        v69.refetchSongExperiences
    });
    if not v64 then
        return nil;
    else
        return v3.createElement(l_LoadingStateContainer_0, {
            dataStatus = l_RetrievalStatus_1.fromRawValue((v56({
                v67.fetchStatus, 
                v72.fetchStatus, 
                v69.fetchStatus
            }, v67.fetchStatus))), 
            onRetry = v96, 
            renderOnLoaded = v95
        });
    end;
end;