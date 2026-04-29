local IXPService = game:GetService("IXPService")
local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local AppChatPerfExperimentation = require(AppChatParent.SocialExperiments).AppChatPerfExperimentation
local AppPage = require(AppChatParent.RobloxAppEnums).AppPage
local BidirectionalFlatList = require(AppChatParent.VirtualizedList).BidirectionalFlatList
local CoreGui = require(AppChatParent.ReactFocusNavigation).EngineInterface.CoreGui
local Cryo = require(AppChatParent.Cryo)
local FocusNavigationService = require(AppChatParent.ReactFocusNavigation).FocusNavigationService
local memoize = require(AppChatParent.AppCommonLib).memoize
local React = require(AppChatParent.React)
local Roact = require(AppChatParent.Roact)
local Promise = require(AppChatParent.Promise)
local SharedFlags = require(AppChatParent.SharedFlags)
local Signal = require(AppChatParent.AppCommonLib).Signal
local SocialCarousel = require(AppChatParent.SocialCarousel)
local SocialExperiments = require(AppChatParent.SocialExperiments)
local withStyle = require(AppChatParent.UIBlox).Style.withStyle
local FFlagAppChatPerfTracking = require(AppChat.Flags.FFlagAppChatPerfTracking)
local AppChatPerfTracker = require(AppChat.Telemetry.AppChatPerfTracker)
local createScrollIntervalTracker = require(AppChat.Telemetry.createScrollIntervalTracker)
local Constants = SocialCarousel.Constants
local Enums = SocialCarousel.Enums
local SquadQuickStartExperimentation = SocialExperiments.SquadQuickStartExperimentation
local ChatLandingModalContainer = require(script.Parent.ChatLandingModal.ChatLandingModalContainer)
local ConversationEntry = require(script.Parent.ConversationEntry)
local ConversationGroupsEntryContainer = require(script.Parent.ConversationGroupsEntryContainer)
local PartyQuickStartContainer = require(script.Parent.PartyQuickStartContainer)
local FFlagEnableAppChatFocusableFixes = require(AppChatParent.SharedFlags).FFlagEnableAppChatFocusableFixes
local v30 = game:DefineFastInt("AppChatChatLandingInitialFetchLimit", 5)
local FFlagEnablePartyQuickStartButton = require(AppChatParent.SharedFlags).FFlagEnablePartyQuickStartButton
local FFlagAppIaScrollAway = SharedFlags.FFlagAppIaScrollAway
local v33 = game:DefineFastInt("AppChatChatLandingInitialFetchMinimumConversations", 30)
local FFlagAppChatConversationListTimestampAndUnreadDotIxpEnabled = require(AppChat.Flags.FFlagAppChatConversationListTimestampAndUnreadDotIxpEnabled)
local FStringAppChatConversationListTimestampAndUnreadDotIxpLayer = require(AppChat.Flags.FStringAppChatConversationListTimestampAndUnreadDotIxpLayer)
local v36 = game:DefineFastInt("AppChatPerfChatLandingPaginationWindowSize", 2)
local v37 = game:DefineFastInt("AppChatPerfChatLandingPaginationInitialRender", 8)
local v38 = game:DefineFastInt("AppChatPerfChatLandingPaginationOnStartReachedUnits", 1)
local v39 = game:DefineFastInt("AppChatPerfChatLandingPaginationOnEndReachedUnits", 1)
local FFlagIsSquadEnabledAMP = require(AppChatParent.SharedFlags).FFlagIsSquadEnabledAMP
local FFlagAppChatGroupOsaAnalytics = require(AppChat.Flags.FFlagAppChatGroupOsaAnalytics)
local PartyPageCarouselExperimentation = require(AppChatParent.SocialExperiments).PartyPageCarouselExperimentation
local v43 = require(script.Parent.Logger):new(script.Name)
local v44 = Roact.PureComponent:extend("ConversationList")

v44.defaultProps = {
	focusIndex = 1,
	focusLock = {},
	itemList = {},
	loadNext = nil,
	loadPrevious = nil,
	onActivated = nil,
	navigateToQuickStartSquadInviteFriends = function() --[[ navigateToQuickStartSquadInviteFriends ]] -- line: 71
	end,
	navigateToSquadLobby = function() --[[ navigateToSquadLobby ]] -- line: 72
	end,
	isDebugEnabled = false,
	Size = UDim2.fromScale(1, 1),
	LayoutOrder = 1,
	onScrollUpdate = function() --[[ onScrollUpdate ]] -- line: 76
	end,
	entryHeight = 64,
	shouldShowPhoneVerificationUpsell = false,
	shouldShowUnfilteredAccessFtux = false,
	shouldShowPartyUpsellFtux = false,
	dismissUnfilteredThreadsFtux = function() --[[ dismissUnfilteredThreadsFtux ]] -- line: 81
	end,
	canvasTopPadding = if not FFlagAppIaScrollAway then nil else 0,
	fireConversationImpressionEvent = function() --[[ fireConversationImpressionEvent ]] -- line: 83
	end,
	isPartyQuickStartEnabled = not FFlagIsSquadEnabledAMP and nil,
	fireConversationClickedEvent = if not FFlagAppChatGroupOsaAnalytics then nil else function() -- line: 85
	end
}

function v44.init(p1) -- line: 88
	-- upvalues: v44 (copy), FFlagAppChatPerfTracking (copy), Signal (copy), AppPage (copy), Constants (copy), PartyPageCarouselExperimentation (copy), memoize (copy), Enums (copy), FFlagIsSquadEnabledAMP (copy), SquadQuickStartExperimentation (copy), FFlagEnablePartyQuickStartButton (copy), Roact (copy), ChatLandingModalContainer (copy), ConversationGroupsEntryContainer (copy), PartyQuickStartContainer (copy), React (copy), SocialCarousel (copy), FFlagAppIaScrollAway (copy), ConversationEntry (copy), FFlagAppChatGroupOsaAnalytics (copy), FFlagEnableAppChatFocusableFixes (copy), FocusNavigationService (copy), CoreGui (copy), AppChatPerfExperimentation (copy), FFlagAppChatConversationListTimestampAndUnreadDotIxpEnabled (copy), IXPService (copy), FStringAppChatConversationListTimestampAndUnreadDotIxpLayer (copy)
	v44.ENTRY_HEIGHT = p1.props.entryHeight

	if FFlagAppChatPerfTracking then
		p1.scrollIntervalTracker = nil
	end

	p1.scrollViewPositionChangedSignal = Signal.new()
	p1.unifiedLogging = {
		appPage = AppPage.Chat,
		impressionTag = if not p1.props.isInExperience then Constants.ANALYTICS.SRC.PARTY_PAGE_UA else Constants.ANALYTICS.SRC.PARTY_PAGE_IN_EXP,
		scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
		sortId = 0,
		sortIndex = 1
	}

	function p1.onScrollUpdate(p2) -- line: 105
		-- upvalues: FFlagAppChatPerfTracking (copy), p1 (copy)
		if FFlagAppChatPerfTracking and p1.scrollIntervalTracker then
			p1.scrollIntervalTracker.onScrollTick()
		end

		p1.currentAnchor = math.floor(p2.CanvasPosition.Y / 64)
		p1.scrollViewPositionChangedSignal:fire()
		p1.props.onScrollUpdate(p2)
	end

	p1.focusLock = p1.props.focusLock

	if PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() then
		function p1.navigateToConversationFromSocialCarousel(p3) -- line: 119
			-- upvalues: p1 (copy)
			p1.props.navigateToConversationFromUserId(p3.id)
		end
	end

	function p1.identifier(p4) -- line: 124
		if not p4 then
			return nil
		end

		return p4.id .. tostring(p4.unixTime)
	end

	local v46 = memoize(function() -- line: 132
		-- upvalues: Enums (copy), p1 (copy)
		return {
			{
				tileGroup = Enums.TileGroup.StartSquad,
				onActivated = p1.props.navigateToQuickStartSquadInviteFriends
			},
			{
				tileGroup = Enums.TileGroup.FriendsList,
				onActivated = p1.navigateToConversationFromSocialCarousel
			}
		}
	end)

	function p1.isPartyQuickStartEnabled() -- line: 145
		-- upvalues: FFlagIsSquadEnabledAMP (copy), p1 (copy), SquadQuickStartExperimentation (copy), FFlagEnablePartyQuickStartButton (copy)
		if FFlagIsSquadEnabledAMP then
			return p1.props.isPartyQuickStartEnabled
		end

		return SquadQuickStartExperimentation.getPartyQuickStartChangesEnabled() and FFlagEnablePartyQuickStartButton
	end
	function p1.renderItem(p5, _) -- line: 154
		-- upvalues: Roact (copy), ChatLandingModalContainer (copy), ConversationGroupsEntryContainer (copy), p1 (copy), PartyQuickStartContainer (copy), PartyPageCarouselExperimentation (copy), React (copy), SocialCarousel (copy), v46 (copy), Constants (copy), FFlagAppIaScrollAway (copy), ConversationEntry (copy), FFlagAppChatGroupOsaAnalytics (copy)
		local item = p5.item

		if item.isChatLandingModal then
			return Roact.createElement(ChatLandingModalContainer, {})
		end

		if item.isGroupLink then
			return Roact.createElement(ConversationGroupsEntryContainer, {
				entryHeight = p1.ENTRY_HEIGHT
			})
		end

		if p1.isPartyQuickStartEnabled() and item.isQuickStartLink then
			return Roact.createElement(PartyQuickStartContainer, {
				entryHeight = p1.ENTRY_HEIGHT
			})
		end

		if PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() and item.isSocialCarousel then
			return React.createElement(SocialCarousel.Entry, {
				customTileList = v46(),
				roduxKey = "ChatAppReducer",
				hideCarouselHeader = true,
				source = if not p1.props.isInExperience then Constants.ANALYTICS.SRC.PARTY_PAGE_UA else Constants.ANALYTICS.SRC.PARTY_PAGE_IN_EXP,
				unifiedLogging = p1.unifiedLogging
			})
		end

		if FFlagAppIaScrollAway and item.isCanvasTopPadding then
			return Roact.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, item.height),
				BackgroundTransparency = 1
			})
		end

		return Roact.createElement(ConversationEntry, {
			boldTitle = false,
			entryHeight = p1.ENTRY_HEIGHT,
			conversation = item,
			onActivated = p1.props.onActivated,
			onSquadJoinButtonActivated = p1.props.navigateToSquadLobby,
			key = "ConversationEntry" .. tostring(item.id),
			fireImpressionEvent = p1.props.fireConversationImpressionEvent,
			fireClickEvent = if not FFlagAppChatGroupOsaAnalytics then nil else p1.props.fireConversationClickedEvent
		}, p1.props.isDebugEnabled and {
			debugCell = Roact.createElement("StringValue", {
				Value = tostring(item.id)
			})
		})
	end

	p1.ref = Roact.createRef()
	p1.viewRef = Roact.createRef()
	p1.initialFetchesAttempted = 0

	if FFlagEnableAppChatFocusableFixes then
		p1.focusNavigationService = FocusNavigationService.new(CoreGui)

		function p1.getScrollRef() -- line: 210
			-- upvalues: p1 (copy)
			if p1.ref.current == nil then
				return nil
			end

			local v66 = p1.ref.current._listRef._scrollRef.getNativeScrollRef()

			if v66 == nil then
				return nil
			end

			return v66._nativeRef.current
		end
	end

	AppChatPerfExperimentation.logExposure()
	PartyPageCarouselExperimentation.logExposure()

	if SquadQuickStartExperimentation.isLogExposureEnabled then
		SquadQuickStartExperimentation.logExposure()
	end

	if FFlagAppChatConversationListTimestampAndUnreadDotIxpEnabled and game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then
		IXPService:LogFlagLinkedUserLayerExposure(FStringAppChatConversationListTimestampAndUnreadDotIxpLayer)
	end
end
function v44.didMount(p7) -- line: 239
	-- upvalues: FFlagAppChatPerfTracking (copy), FFlagEnableAppChatFocusableFixes (copy), createScrollIntervalTracker (copy), AppChatPerfTracker (copy)
	if FFlagAppChatPerfTracking and (FFlagEnableAppChatFocusableFixes and p7.getScrollRef) then
		local v48 = p7.getScrollRef()

		if v48 ~= nil then
			p7.scrollIntervalTracker = createScrollIntervalTracker(AppChatPerfTracker.Events.ScrollConversationList, v48)
		end
	end

	if FFlagEnableAppChatFocusableFixes then
		local v49 = p7.getScrollRef()

		if v49 ~= nil then
			v49.Selectable = false
		end
	end
end
function v44.willUnmount(p8) -- line: 255
	-- upvalues: FFlagAppChatPerfTracking (copy), FFlagEnableAppChatFocusableFixes (copy)
	if FFlagAppChatPerfTracking and p8.scrollIntervalTracker then
		p8.scrollIntervalTracker.cleanup()
	end

	if FFlagEnableAppChatFocusableFixes then
		p8.focusNavigationService:teardown()
	end
end
function v44.willUpdate(p9, p10, _) -- line: 264
	-- upvalues: v30 (copy), v33 (copy), v43 (copy), v44 (copy)
	if p10.filterText and (p10.filterText ~= "" and p10.filterText ~= p9.props.filterText) then
		p9.focusLock = p10.filterText
	elseif p10.itemList[1] and p9.props.itemList[1] and p10.itemList[1].id ~= p9.props.itemList[1].id and p9.currentAnchor == 1 then
		p9.focusLock = {}
	end

	if p10.itemList and p9.props.itemList ~= p10.itemList and p9.initialFetchesAttempted < v30 and #p10.itemList < v33 then
		p9.initialFetchesAttempted = p9.initialFetchesAttempted + 1
		v43:info("Loading more conversations because the list (count: {} out of {}) is not enough (attempt {} out of {})", #p10.itemList, v33, p9.initialFetchesAttempted, v30)
		p9.props.loadNext()
	end

	if p10.entryHeight ~= p9.props.entryHeight then
		v44.ENTRY_HEIGHT = p10.entryHeight
	end
end
function v44.render(p12) -- line: 299
	-- upvalues: Cryo (copy), PartyPageCarouselExperimentation (copy), FFlagAppIaScrollAway (copy), Roact (copy), BidirectionalFlatList (copy), v36 (copy), v37 (copy), v43 (copy), Promise (copy), v39 (copy), v38 (copy), withStyle (copy)
	local itemList = p12.props.itemList
	local v56 = p12.props.filterText == "" or p12.props.filterText == nil
	local showGroupsLink = p12.props.showGroupsLink

	if v56 and showGroupsLink then
		itemList = Cryo.List.join({{
			id = "ConversationGroupsEntryContainer",
			isGroupLink = true
		}}, itemList)
	end

	if not PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() and p12.isPartyQuickStartEnabled() then
		itemList = Cryo.List.join({{
			id = "PartyQuickStartContainer",
			isQuickStartLink = true
		}}, itemList)
	end

	if v56 then
		if p12.isPartyQuickStartEnabled() and PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() and (p12.props.isWideMode or not p12.props.isInExperience) then
			itemList = Cryo.List.join({{
				id = "SocialCarousel",
				isSocialCarousel = true
			}}, itemList)
		end

		itemList = Cryo.List.join({{
			id = "UnfilteredThreadsFtux",
			isChatLandingModal = true
		}}, itemList)
	end

	if FFlagAppIaScrollAway and p12.props.canvasTopPadding > 0 then
		itemList = Cryo.List.join({{
			id = "CanvasTopPadding",
			isCanvasTopPadding = true,
			height = p12.props.canvasTopPadding
		}}, itemList)
	end

	local v58 = if not FFlagAppIaScrollAway then nil else function(_, p14) -- line: 357
		-- upvalues: p12 (copy)
		local canvasTopPadding, n1

		if p12.props.canvasTopPadding > 0 then
			if p14 == 1 then
				canvasTopPadding = p12.props.canvasTopPadding
				n1 = 0
			else
				canvasTopPadding = p12.ENTRY_HEIGHT
				n1 = p12.props.canvasTopPadding + p12.ENTRY_HEIGHT * (p14 - 2)
			end
		else
			canvasTopPadding = p12.ENTRY_HEIGHT
			n1 = p12.ENTRY_HEIGHT * (p14 - 1)
		end

		return {
			length = canvasTopPadding,
			offset = n1,
			index = p14
		}
	end

	local function renderScroller(p15) -- line: 381
		-- upvalues: Roact (copy), p12 (copy), BidirectionalFlatList (copy), itemList (ref), FFlagAppIaScrollAway (copy), v58 (copy), v36 (copy), v37 (copy), v43 (copy), Promise (copy), v39 (copy), v38 (copy)
		return Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = p12.props.Size,
			[Roact.Ref] = p12.viewRef
		}, {
			scroller = Roact.createElement(BidirectionalFlatList, {
				data = itemList,
				renderItem = p12.renderItem,
				getItemLayout = not FFlagAppIaScrollAway and function(_, p17) -- line: 392
					-- upvalues: p12 (copy)
					return {
						length = p12.ENTRY_HEIGHT,
						offset = p12.ENTRY_HEIGHT * (p17 - 1),
						index = p17
					}
				end or v58,
				style = {
					BackgroundColor3 = p15.Theme.BackgroundDefault.Color,
					BackgroundTransparency = p15.Tokens.Global.Color.None.Transparency,
					ScrollBarThickness = 0,
					BorderSizePixel = 0
				},
				contentContainerStyle = {
					BackgroundColor3 = p15.Theme.BackgroundDefault.Color,
					BackgroundTransparency = p15.Tokens.Global.Color.None.Transparency,
					BorderSizePixel = 0
				},
				windowSize = v36,
				initialNumToRender = v37,
				onScroll = p12.onScrollUpdate,
				onContentSizeChange = function(_, p19) --[[ onContentSizeChange ]] -- line: 414
					-- upvalues: p12 (copy), v43 (copy)
					local current = p12.viewRef.current

					if current then
						v43:debug("onContentSizeChange - Window height: {} vs Content height: {}", current.AbsoluteSize.Y, p19)

						if p19 <= current.AbsoluteSize.Y then
							v43:info("Not enough content to fill the view, loading more conversations")
							p12.props.loadNext()
						end
					end
				end,
				onEndReached = function() --[[ onEndReached ]] -- line: 428
					-- upvalues: v43 (copy), p12 (copy), Promise (copy)
					v43:debug("onEndReached - Loading more conversations")
					p12.props.loadNext()

					return Promise.resolve()
				end,
				onStartReached = function() --[[ onStartReached ]] -- line: 433
					-- upvalues: v43 (copy), p12 (copy), Promise (copy)
					v43:debug("onStartReached - Loading previous conversations")

					if p12.props.loadPrevious then
						p12.props.loadPrevious()
					end

					return Promise.resolve()
				end,
				AutomaticCanvasSize = Enum.AutomaticSize.XY,
				CanvasSize = UDim2.fromScale(0, 0),
				onEndReachedThreshold = p12.ENTRY_HEIGHT * v39,
				onStartReachedThreshold = p12.ENTRY_HEIGHT * v38,
				compareItemData = function(p20, p21) --[[ compareItemData ]] -- line: 444
					return p20.id == p21.id
				end,
				[Roact.Ref] = p12.ref,
				autoscrollToTopThreshold = 33,
				enableAutoscrollToTop = true
			})
		})
	end

	return withStyle(function(p22) -- line: 454
		-- upvalues: itemList (ref), Roact (copy), p12 (copy), renderScroller (copy)
		if #itemList == 0 then
			return Roact.createElement("Frame", {
				Size = p12.props.Size,
				BackgroundColor3 = p22.Theme.BackgroundDefault.Color,
				BackgroundTransparency = p22.Tokens.Global.Color.None.Transparency,
				BorderSizePixel = 0,
				LayoutOrder = p12.props.LayoutOrder
			})
		end

		return renderScroller(p22)
	end)
end

return v44
