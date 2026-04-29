local HttpService = game:GetService("HttpService")
local SongDetails = script:FindFirstAncestor("SongDetails")
local SongDetailsParent = SongDetails.Parent
local React = require(SongDetailsParent.React)
local RetrievalStatus = require(SongDetailsParent.Http).Enum.RetrievalStatus
local Foundation = require(SongDetailsParent.Foundation)
local useTokens = Foundation.Hooks.useTokens
local Cryo = require(SongDetailsParent.Cryo)
local RoactUtils = require(SongDetailsParent.RoactUtils)
local useDispatch = RoactUtils.Hooks.RoactRodux.useDispatch
local useSelector = RoactUtils.Hooks.RoactRodux.useSelector
local createNextOrder = require(SongDetailsParent.ReactUtils).createNextOrder
local DetailsPageComponents = require(SongDetailsParent.DetailsPageComponents)
local DetailsDescription = DetailsPageComponents.DetailsDescription
local DetailsInfoTable = DetailsPageComponents.DetailsInfoTable
local SongDetailRodux = require(SongDetailsParent.SongDetailRodux)
local useFetchSongDetail = SongDetailRodux.useFetchSongDetail
local useFetchArtistSongs = SongDetailRodux.useFetchArtistSongs
local useFetchSongExperiences = SongDetailRodux.useFetchSongExperiences
local UIBlox = require(SongDetailsParent.UIBlox)
local LoadingStateContainer = UIBlox.App.Container.LoadingStateContainer
local RetrievalStatus2 = UIBlox.App.Loading.Enum.RetrievalStatus
local NavigateBack = require(SongDetailsParent.NavigationRodux).Thunks.NavigateBack
local usePageSideMargin = require(SongDetailsParent.CollectionViews).usePageSideMargin
local FFlagEnableTopSongsSort = require(SongDetailsParent.SharedFlags).FFlagEnableTopSongsSort
local AppBlox = require(SongDetailsParent.AppBlox)
local ContentPosition = AppBlox.ContentPosition
local DetailsPageTemplate = AppBlox.DetailsPageTemplate
local FullscreenPageWithSafeArea = AppBlox.FullscreenPageWithSafeArea
local useDeviceType = require(SongDetailsParent.RobloxAppHooks).useDeviceType
local useLocalization = require(SongDetailsParent.Localization).Hooks.useLocalization
local useSongInfoTableData = require(SongDetails.Hooks.useSongInfoTableData)
local SongCollectionCarousel = require(SongDetails.SongCollectionCarousel)
local SongExperiencesCollectionCarousel = require(SongDetails.SongExperiencesCollectionCarousel)
local useSongTileData = require(SongDetailsParent.SongInfosRodux).useSongTileData
local AppPage = require(SongDetailsParent.RobloxAppEnums).AppPage
local useAssetFavoriting = require(SongDetailsParent.AssetFavorites).useAssetFavoriting
local Songbird = require(SongDetailsParent.Songbird)
local AudioPlayer = Songbird.AudioPlayer
local AudioPlayerActions = Songbird.AudioPlayerActions
local useNavigationFocus = require(SongDetailsParent.Navigation).useNavigationFocus
local FFlagSongCarouselPropUpdate = require(SongDetailsParent.SharedFlags).FFlagSongCarouselPropUpdate
local FFlagSongEdpCarouselIxp = require(SongDetailsParent.SharedFlags).FFlagSongEdpCarouselIxp
local FFlagUpdateSongCarouselClipDefault = require(SongDetailsParent.SharedFlags).FFlagUpdateSongCarouselClipDefault
local FFlagLuaAppFixSDPLayout = require(SongDetailsParent.SharedFlags).FFlagLuaAppFixSDPLayout
local v46 = game:DefineFastFlag("SongDetailFallbackAudio", false)

local function getCombinedLoadingStatus(t1: {[any]: any}, s1: string?) -- line: 112
	-- upvalues: RetrievalStatus (copy)
	for _, v51 in t1 do
		if v51 == RetrievalStatus.NotStarted then
			return RetrievalStatus.NotStarted
		end
	end

	for _, v53 in t1 do
		if v53 == RetrievalStatus.Fetching then
			return RetrievalStatus.Fetching
		end
	end

	return s1 or RetrievalStatus.NotStarted
end

return function(t2: {[any]: any}) -- line: 126
	-- upvalues: FFlagEnableTopSongsSort (copy), useDispatch (copy), createNextOrder (copy), FFlagLuaAppFixSDPLayout (copy), useTokens (copy), React (copy), usePageSideMargin (copy), useNavigationFocus (copy), useSongTileData (copy), useFetchSongDetail (copy), useFetchSongExperiences (copy), useSongInfoTableData (copy), useFetchArtistSongs (copy), Cryo (copy), useAssetFavoriting (copy), useLocalization (copy), useSelector (copy), useDeviceType (copy), NavigateBack (copy), v46 (copy), Foundation (copy), AudioPlayer (copy), HttpService (copy), ContentPosition (copy), AudioPlayerActions (copy), DetailsDescription (copy), RetrievalStatus2 (copy), SongExperiencesCollectionCarousel (copy), AppPage (copy), SongCollectionCarousel (copy), FFlagSongCarouselPropUpdate (copy), FFlagSongEdpCarouselIxp (copy), FFlagUpdateSongCarouselClipDefault (copy), DetailsInfoTable (copy), FullscreenPageWithSafeArea (copy), DetailsPageTemplate (copy), RetrievalStatus (copy), LoadingStateContainer (copy), getCombinedLoadingStatus (copy)
	assert(FFlagEnableTopSongsSort, "Song Sort is not enabled")

	local v55 = useDispatch()
	local v56 = createNextOrder()
	local v57 = if not FFlagLuaAppFixSDPLayout then nil else useTokens()
	local v58 = React.useRef(nil)
	local v59 = usePageSideMargin(v58.current)
	local v60 = useNavigationFocus()
	local v61 = (t2.navigation and (not not t2.navigation.state and t2.navigation.state.params) or {}).songId or nil
	local num = tonumber(v61)
	local v63 = useSongTileData(v61)
	local v64 = useFetchSongDetail(v61)
	local songDetail = v64.songDetail
	local v66 = useFetchSongExperiences(v61)
	local v67 = useSongInfoTableData(songDetail)
	local v68 = v67 and v67.rows or nil
	local v69 = useFetchArtistSongs(v61)
	local v70 = Cryo.List.filter(v69.artistSongIds, function(p1) -- line: 149
		-- upvalues: v61 (copy)
		return p1 ~= v61
	end)
	local v71 = useAssetFavoriting(if not num then {} else { num })
	local v72 = not not num and v71.getByAssetId(num)
	local v73 = useLocalization({
		descriptionTitle = "Feature.SongDetails.Body.DescriptionTitle",
		songsByArtistTitle = {
			"Feature.SongDetails.Label.SongsBy",
			artistName = songDetail and songDetail.artistName or ""
		},
		experiencesFeaturingTrackTitle = {
			"Feature.SongDetails.Label.ExperiencesFeaturingTrack",
			trackName = songDetail and songDetail.name or ""
		},
		reportAudio = "Feature.SongDetails.Action.ReportAudio"
	})
	local v74 = useSelector(function(p2) -- line: 169
		return p2.ScreenSize
	end)
	local v75 = not not v74 and (v74.X >= 850 or false)
	local v76 = useDeviceType()
	local v77 = React.useCallback(function() -- line: 178
		-- upvalues: v55 (copy), NavigateBack (copy)
		v55(NavigateBack())
	end, { v55 })
	local v78 = React.useCallback(function() -- line: 182
		-- upvalues: num (copy), v71 (copy)
		if num then
			v71.toggleFavorite(num)
		end
	end, {
		v71.toggleFavorite,
		num
	})
	local v79 = React.useMemo(function() -- line: 189
		-- upvalues: v63 (copy), v72 (copy), v46 (copy), songDetail (copy)
		if v63.song then
			return {
				assetId = v63.song.assetId,
				isLiked = v72,
				title = v63.song.title,
				artist = v63.song.artist,
				thumbnailAssetId = v63.song.albumArtAssetId,
				thumbnail = v63.thumbnail
			}
		end

		if v46 and songDetail then
			return {
				assetId = songDetail.assetId,
				isLiked = v72,
				title = songDetail.name,
				artist = songDetail.artistName,
				thumbnail = v63.thumbnail
			}
		end

		return nil
	end, {
		v63.song,
		v63.thumbnail,
		v72,
		if not v46 then nil else songDetail
	})
	local v80 = React.useCallback(function() -- line: 218
		-- upvalues: v79 (copy), React (copy), Foundation (copy), AudioPlayer (copy), v60 (copy)
		if not v79 then
			return nil
		end

		return React.createElement(Foundation.View, {
			tag = "row align-x-center",
			Size = UDim2.new(1, 0, 0, 500)
		}, {
			MusicPlayer = React.createElement(AudioPlayer, {
				audio = v79,
				isNavigationFocus = v60,
				analyticsSource = "song-details"
			})
		})
	end, {
		v79,
		v60
	})
	local v81 = React.useCallback(function() -- line: 236
		-- upvalues: v61 (copy), songDetail (copy), HttpService (copy), v63 (copy), v74 (copy), v79 (copy), v56 (copy), ContentPosition (copy), React (copy), AudioPlayerActions (copy), v78 (copy), DetailsDescription (copy), RetrievalStatus2 (copy), v64 (copy), v73 (copy), v66 (copy), SongExperiencesCollectionCarousel (copy), AppPage (copy), v70 (copy), SongCollectionCarousel (copy), FFlagSongCarouselPropUpdate (copy), FFlagSongEdpCarouselIxp (copy), FFlagUpdateSongCarouselClipDefault (copy), v68 (copy), DetailsInfoTable (copy), FullscreenPageWithSafeArea (copy), DetailsPageTemplate (copy), v75 (copy), v80 (copy), v58 (copy), v76 (copy), v77 (copy), v59 (copy), FFlagLuaAppFixSDPLayout (copy), v57 (copy)
		if not v61 or not songDetail then
			return nil
		end

		local v85 = tostring(v61) .. tostring(HttpService:GenerateGUID())
		local name = songDetail.name
		local artistName = songDetail.artistName
		local thumbnail = v63.thumbnail
		local v89 = (not v74 or not (v74.X > 850)) and 0 or 12
		local v90 = if not v74 or not (v74.X > 850) then nil else 4
		local v91 = if not v74 or not (v74.X > 850) then nil else 4
		local t3 = {
			Actions = if not v79 then nil else {
				portraitLayoutOrder = v56(),
				landscapeLayoutOrder = v56(),
				landscapePosition = ContentPosition.Left,
				renderComponent = function() --[[ renderComponent ]] -- line: 265
					-- upvalues: React (copy), AudioPlayerActions (copy), v79 (copy), v78 (copy)
					return React.createElement(AudioPlayerActions, {
						audio = v79,
						onLike = v78,
						onUnlike = v78,
						analyticsSource = "song-details"
					})
				end
			},
			DetailsDescription = if not songDetail.description or not (#songDetail.description > 0) then nil else {
				portraitLayoutOrder = v56(),
				landscapeLayoutOrder = v56(),
				landscapePosition = ContentPosition.Left,
				renderComponent = function() --[[ renderComponent ]] -- line: 280
					-- upvalues: React (copy), DetailsDescription (copy), RetrievalStatus2 (copy), v64 (copy), songDetail (copy), v73 (copy)
					return React.createElement(DetailsDescription, {
						dataStatus = RetrievalStatus2.fromRawValue(v64.fetchStatus),
						descriptionText = songDetail.description,
						LayoutOrder = 1,
						titleText = v73.descriptionTitle
					})
				end
			},
			SongExperiencesCarousel = if not v66.songExperiences or not (#v66.songExperiences > 0) then nil else {
				portraitLayoutOrder = v56(),
				landscapeLayoutOrder = v56(),
				landscapePosition = ContentPosition.Left,
				renderComponent = function() --[[ renderComponent ]] -- line: 296
					-- upvalues: React (copy), SongExperiencesCollectionCarousel (copy), v66 (copy), v91 (copy), v73 (copy), v85 (copy), v61 (copy), AppPage (copy)
					return React.createElement(SongExperiencesCollectionCarousel, {
						fractionalItemAmount = 0,
						items = v66.songExperiences,
						numColumns = v91,
						sideMargin = 0,
						title = v73.experiencesFeaturingTrackTitle,
						impressionsTag = "SongDetails_" .. "SongExperience" .. v85,
						songId = v61,
						layoutOrder = 2,
						pageContext = AppPage.SongDetail
					})
				end
			},
			ArtistSongsCarousel = if not (#v70 > 0) then nil else {
				portraitLayoutOrder = v56(),
				landscapeLayoutOrder = v56(),
				landscapePosition = ContentPosition.Left,
				renderComponent = function() --[[ renderComponent ]] -- line: 318
					-- upvalues: React (copy), SongCollectionCarousel (copy), v70 (copy), v73 (copy), v85 (copy), v90 (copy), FFlagSongCarouselPropUpdate (copy), AppPage (copy), v61 (copy), FFlagSongEdpCarouselIxp (copy), FFlagUpdateSongCarouselClipDefault (copy)
					return React.createElement(SongCollectionCarousel, {
						songIds = v70,
						title = v73.songsByArtistTitle,
						impressionsTag = "SongDetails_" .. "ArtistSong" .. v85,
						numColumns = v90,
						fractionalItemAmount = 0,
						collectionOrder = if not FFlagSongCarouselPropUpdate then nil else 3,
						layoutOrder = not FFlagSongCarouselPropUpdate and 3 or nil,
						pageContext = AppPage.SongDetail,
						referralId = v61,
						clipsDescendants = FFlagSongEdpCarouselIxp and true or (not not FFlagUpdateSongCarouselClipDefault or nil)
					})
				end
			},
			DetailsInfoTable = if not v68 or not (#v68 > 0) then nil else {
				portraitLayoutOrder = v56(),
				landscapeLayoutOrder = v56(),
				landscapePosition = ContentPosition.Left,
				renderComponent = function() --[[ renderComponent ]] -- line: 344
					-- upvalues: React (copy), DetailsInfoTable (copy), v89 (copy), v68 (copy)
					return React.createElement(DetailsInfoTable, {
						dividerStartOffset = 0,
						horizontalPadding = v89,
						rows = v68
					})
				end
			}
		}

		return React.createElement(FullscreenPageWithSafeArea, {
			includeStatusBar = true,
			BackgroundTransparency = 1
		}, {
			DetailsPageTemplate = React.createElement(DetailsPageTemplate, {
				bannerImageUrl = if not v75 then nil else `rbxthumb://type=Asset&id={ v61 }&w=1440&h=456`,
				renderCustomHeader = v80,
				componentList = t3,
				containerRef = v58,
				deviceType = v76,
				gradientHeight = 320,
				dualPanelBreakpoint = 1e999,
				headerBarBackgroundHeight = 80,
				maxContentWidth = 850,
				onClose = v77,
				sideMargin = v59,
				startingOffsetPosition = 500,
				subTitleText = artistName,
				thumbnailImageUrl = thumbnail,
				titleText = name,
				backgroundFrameSize = UDim2.new(1, 0, 0, 580),
				backgroundImageTransparency = 1,
				disableBackgroundAspectRatio = true,
				bodyContainerSafeAreaSize = if not FFlagLuaAppFixSDPLayout then nil else UDim2.fromScale(1, 1),
				backgroundImageSize = if not FFlagLuaAppFixSDPLayout then nil else UDim2.fromScale(1, 1),
				headerPadding = if not FFlagLuaAppFixSDPLayout or not v57 then nil else 500 * v57.Stroke.Standard
			})
		})
	end, {
		v70,
		v76,
		v55,
		v73.descriptionTitle,
		v73.experiencesFeaturingTrackTitle,
		v73.songsByArtistTitle,
		v77,
		v74,
		v59,
		songDetail,
		v64.fetchStatus,
		v66.songExperiences,
		v63.thumbnail,
		v61,
		v68,
		v80
	})
	local v82 = React.useCallback(function() -- line: 417
		-- upvalues: v64 (copy), RetrievalStatus (copy), v69 (copy), v66 (copy)
		if v64.fetchStatus == RetrievalStatus.Failed then
			v64.refetchSongDetail()
		end

		if v69.fetchStatus == RetrievalStatus.Failed then
			v69.refetchArtistSongs()
		end

		if v66.fetchStatus == RetrievalStatus.Failed then
			v66.refetchSongExperiences()
		end
	end, {
		v64.refetchSongDetail,
		v69.refetchArtistSongs,
		v66.refetchSongExperiences
	})

	if not v61 then
		return nil
	end

	return React.createElement(LoadingStateContainer, {
		dataStatus = RetrievalStatus2.fromRawValue((getCombinedLoadingStatus({
			v64.fetchStatus,
			v69.fetchStatus,
			v66.fetchStatus
		}, v64.fetchStatus))),
		onRetry = v82,
		renderOnLoaded = v81
	})
end
