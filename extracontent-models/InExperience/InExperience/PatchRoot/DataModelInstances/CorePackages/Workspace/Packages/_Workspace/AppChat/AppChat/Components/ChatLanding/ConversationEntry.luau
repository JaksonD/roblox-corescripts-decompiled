local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local HttpService = game:GetService("HttpService")
local RoactUtils = require(AppChatParent.RoactUtils)
local React = require(AppChatParent.React)
local dependencyArray = RoactUtils.Hooks.dependencyArray
local memo = React.memo
local useMemo = React.useMemo
local useIsUserPending = require(AppChat.Hooks.useIsUserPending)
local useRelativeTimestampBinding = require(AppChat.Hooks.useRelativeTimestampBinding)
local useChatPagePadding = require(AppChat.Contexts.ChatPagePadding.useChatPagePadding)
local UIBlox = require(AppChatParent.UIBlox)
local useStyle = UIBlox.Core.Style.useStyle
local useTextSizeOffset = UIBlox.Core.Style.useTextSizeOffset
local Text = require(AppChatParent.AppCommonLib).Text
local Cryo = require(AppChatParent.Cryo)
local useTokens = require(AppChatParent.Foundation).Hooks.useTokens
local getBoldTextTheme = require(script.Parent.Utils.getBoldTextTheme)
local ConversationCell = require(AppChat.Components.Cells).ConversationCell
local ConversationTimestamp = require(script.Parent.ConversationTimestamp)
local ConversationRelativeTimestamp = require(script.Parent.ConversationRelativeTimestamp)
local DomLocators = require(AppChat.Utils.DomLocators)
local Squads = require(AppChatParent.Squads)
local SquadJoinButton = Squads.SquadJoinButton
local SquadButtonSourceEnum = Squads.Enums.SquadButtonSourceEnum
local SquadComponentAccessWrapper = Squads.SquadComponentAccessWrapper
local useDispatch = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useDispatch
local useNavigation = require(AppChatParent.Navigation).useNavigation
local ReactFocusNavigation = require(AppChatParent.ReactFocusNavigation)
local getFFlagDebugAppChat = require(AppChat.Flags.getFFlagDebugAppChat)
local GetFFlagIsSquadEnabled = require(AppChatParent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagEnableAppChatFocusableFixes = require(AppChatParent.SharedFlags).FFlagEnableAppChatFocusableFixes
local FFlagIsSquadEnabledAMP = require(AppChatParent.SharedFlags).FFlagIsSquadEnabledAMP
local FFlagAppChatEnableGroupOSA = require(AppChatParent.SharedFlags).FFlagAppChatEnableGroupOSA
local FFlagAppChatGroupOsaAnalytics = require(AppChat.Flags.FFlagAppChatGroupOsaAnalytics)
local FFlagAppChatLiftPostAPICallActionsUp = require(AppChatParent.SharedFlags).FFlagAppChatLiftPostAPICallActionsUp
local FFlagAppChatSquadJoinButtonOSA = require(AppChat.Flags.FFlagAppChatSquadJoinButtonOSA)
local FFlagAppChatSquadJoinButtonU13OSA = require(AppChat.Flags.FFlagAppChatSquadJoinButtonU13OSA)
local FFlagDebugAppChatEnableDomLocators = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local FFlagAppChatUpdateConvAfterRecordModalSequence = require(AppChat.Flags.FFlagAppChatUpdateConvAfterRecordModalSequence)
local FFlagAppChatConversationListUnreadDot = require(AppChat.Flags.FFlagAppChatConversationListUnreadDot)
local FFlagAppChatConversationListRelativeTimestamps = require(AppChat.Flags.FFlagAppChatConversationListRelativeTimestamps)
local v43 = FFlagAppChatConversationListUnreadDot or FFlagAppChatConversationListRelativeTimestamps
local useTelemetry = require(AppChat.Telemetry.useTelemetry)
local ChatLandingTelemetryLayer = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local Constants = require(AppChat.Constants)
local API = require(AppChatParent.AppChatNetworking).rodux.GetConversationDetails.API
local RemovedConversation = require(AppChat.Conversations.Actions.RemovedConversation)
local EnumScreens = require(AppChat.EnumScreens)
local Conversation = require(AppChat.Models.Conversation)
local shouldShowOSAForConversation = require(AppChat.Utils.shouldShowOSAForConversation)
local shouldShowU13ChatOptInForConversation = require(AppChat.Utils.shouldShowU13ChatOptInForConversation)
local GetOverlayStore = require(AppChat.Stores.GetOverlayStore)
local OverlayTypes = require(AppChat.Stores.GetOverlayStore.OverlayTypes)
local FFlagAppChatGroupOsaDialogHost = require(AppChatParent.SharedFlags).FFlagAppChatGroupOsaDialogHost
local useChatPlacementContext = require(AppChat.Contexts.ChatPlacementContext).useChatPlacementContext
local useCanAccessParty = require(AppChatParent.Squads).Hooks.useCanAccessParty

require(AppChat.types)

local FFlagRemoveDependencyArrayAntipattern = require(AppChatParent.SharedFlags).FFlagRemoveDependencyArrayAntipattern
local t1 = {
	entryHeight = 64,
	boldTitle = true,
	onSquadJoinButtonActivated = function() --[[ onSquadJoinButtonActivated ]] -- line: 100
	end
}

return memo(function(t2: {[any]: any}) --[[ ConversationEntry ]] -- line: 104
	-- upvalues: Cryo (copy), t1 (copy), useStyle (copy), useTokens (copy), useTextSizeOffset (copy), FFlagAppChatGroupOsaAnalytics (copy), useTelemetry (copy), ChatLandingTelemetryLayer (copy), useIsUserPending (copy), FFlagAppChatConversationListUnreadDot (copy), getBoldTextTheme (copy), FFlagAppChatLiftPostAPICallActionsUp (copy), useDispatch (copy), useChatPlacementContext (copy), useChatPagePadding (copy), useRelativeTimestampBinding (copy), FFlagAppChatConversationListRelativeTimestamps (copy), useMemo (copy), Text (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), React (copy), useNavigation (copy), FFlagAppChatEnableGroupOSA (copy), FFlagAppChatGroupOsaDialogHost (copy), GetOverlayStore (copy), EnumScreens (copy), OverlayTypes (copy), FFlagAppChatUpdateConvAfterRecordModalSequence (copy), API (copy), FFlagAppChatSquadJoinButtonOSA (copy), FFlagAppChatSquadJoinButtonU13OSA (copy), Conversation (copy), RemovedConversation (copy), shouldShowU13ChatOptInForConversation (copy), Constants (copy), shouldShowOSAForConversation (copy), HttpService (copy), FFlagEnableAppChatFocusableFixes (copy), ReactFocusNavigation (copy), FFlagIsSquadEnabledAMP (copy), useCanAccessParty (copy), GetFFlagIsSquadEnabled (copy), v43 (copy), SquadComponentAccessWrapper (copy), SquadJoinButton (copy), SquadButtonSourceEnum (copy), FFlagDebugAppChatEnableDomLocators (copy), DomLocators (copy), ConversationCell (copy), getFFlagDebugAppChat (copy), ConversationRelativeTimestamp (copy), ConversationTimestamp (copy)
	local v61 = Cryo.Dictionary.join(t1, t2)
	local v62 = useStyle()
	local v63 = useTokens()
	local v64 = useTextSizeOffset()
	local u65 = nil

	if FFlagAppChatGroupOsaAnalytics then
		u65 = useTelemetry(ChatLandingTelemetryLayer.Context)
	end

	local conversation = v61.conversation
	local hasGroupUp = conversation.hasGroupUp
	local v68 = useIsUserPending(conversation)
	local v69 = conversation.hasUnreadMessages and not v68
	local v70 = FFlagAppChatConversationListUnreadDot and v69
	local v71 = v69 and not v70
	local v72 = if not v71 then v62 else getBoldTextTheme(v62)
	local v73 = if not FFlagAppChatLiftPostAPICallActionsUp then nil else useDispatch()
	local v74 = useChatPlacementContext()
	local v75 = useChatPagePadding()
	local CaptionSubHeader = v72.Font.CaptionSubHeader
	local v77 = v72.Font.BaseSize * CaptionSubHeader.RelativeSize
	local v78 = v61.conversation.shortRelativeTime or ""
	local v79 = useRelativeTimestampBinding(if not FFlagAppChatConversationListRelativeTimestamps then nil else v61.conversation.unixTime)
	local v80 = if not FFlagAppChatConversationListRelativeTimestamps then v78 else v79
	local v81 = useMemo(function() -- line: 136
		-- upvalues: Text (copy), v78 (copy), CaptionSubHeader (copy), v77 (copy)
		return Text.GetTextWidth(v78, CaptionSubHeader.Font, v77)
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v78, CaptionSubHeader.Font, v77, v64) else {
		v78,
		CaptionSubHeader.Font,
		v77,
		v64
	})
	local v82 = React.useRef(nil)
	local v83 = useNavigation()
	local u84 = false

	if v83.getScreenProps then
		u84 = v83.getScreenProps("wideMode", u84)
	end

	React.useEffect(function() -- line: 150
		-- upvalues: v61 (copy)
		v61.fireImpressionEvent(v61.conversation)
	end, {})

	local v85 = nil
	local u86 = nil

	if FFlagAppChatEnableGroupOSA then
		local v87 = if not FFlagAppChatGroupOsaDialogHost then nil else GetOverlayStore(false)
		local v88 = React.useCallback(function(s1: string) -- line: 159
			-- upvalues: v83 (copy), EnumScreens (copy)
			v83.navigate(EnumScreens.ChatConversation, {
				conversationId = s1,
				isNavigatedFromGroupOSAJoin = true
			})
		end, { v83 })

		u86 = React.useCallback(function(s2: string, s3: string?, s4: string?, s5: string?, p1: ((...any) -> ...any)?) -- line: 167
			-- upvalues: FFlagAppChatGroupOsaDialogHost (copy), v87 (copy), OverlayTypes (copy), FFlagAppChatLiftPostAPICallActionsUp (copy), FFlagAppChatUpdateConvAfterRecordModalSequence (copy), v73 (copy), API (copy), FFlagAppChatSquadJoinButtonOSA (copy), FFlagAppChatSquadJoinButtonU13OSA (copy), v88 (copy), Conversation (copy), RemovedConversation (copy), v83 (copy), EnumScreens (copy)
			if FFlagAppChatGroupOsaDialogHost then
				v87.showOverlay(OverlayTypes.GroupOSADialog, {
					conversationId = s2,
					impressionId = s3,
					modalVariant = s4,
					onJoin = function() --[[ onJoin ]] -- line: 179
						-- upvalues: FFlagAppChatLiftPostAPICallActionsUp (copy), FFlagAppChatUpdateConvAfterRecordModalSequence (copy), s2 (copy), v73 (copy), API (copy), v87 (copy), FFlagAppChatSquadJoinButtonOSA (copy), FFlagAppChatSquadJoinButtonU13OSA (copy), p1 (copy), v88 (copy)
						if FFlagAppChatLiftPostAPICallActionsUp and (not FFlagAppChatUpdateConvAfterRecordModalSequence and s2) then
							v73(API(s2))
						end

						v87.dismissOverlay()

						if (FFlagAppChatSquadJoinButtonOSA or FFlagAppChatSquadJoinButtonU13OSA) and p1 then
							p1(s2)

							return
						end

						v88(s2)
					end,
					onDecline = function() --[[ onDecline ]] -- line: 197
						-- upvalues: FFlagAppChatLiftPostAPICallActionsUp (copy), s2 (copy), s5 (copy), Conversation (copy), v73 (copy), RemovedConversation (copy), v87 (copy)
						if FFlagAppChatLiftPostAPICallActionsUp and (s2 and s5 == Conversation.Type.MULTI_USER_CONVERSATION) then
							v73(RemovedConversation(s2))
						end

						v87.dismissOverlay()
					end
				})

				return
			end

			v83.navigate(EnumScreens.GroupOSADialog, {
				conversationId = s2,
				impressionId = s3,
				modalVariant = s4
			})
		end, {
			v83,
			if not FFlagAppChatGroupOsaDialogHost then nil else v88,
			if not FFlagAppChatLiftPostAPICallActionsUp then nil else v73
		})
		v85 = React.useCallback(function(p2) -- line: 224
			-- upvalues: shouldShowU13ChatOptInForConversation (copy), Constants (copy), shouldShowOSAForConversation (copy), FFlagAppChatGroupOsaAnalytics (copy), HttpService (copy), u86 (ref), v61 (copy), u65 (ref)
			local guid = nil
			local ChatOptInInfoCard = nil

			if shouldShowU13ChatOptInForConversation(p2) then
				ChatOptInInfoCard = Constants.OptInVariant.ChatOptInInfoCard
			elseif shouldShowOSAForConversation(p2) then
				ChatOptInInfoCard = Constants.OptInVariant.OsaContextCard
			end

			if ChatOptInInfoCard then
				if FFlagAppChatGroupOsaAnalytics then
					guid = HttpService:GenerateGUID(false)
				end

				u86(p2.id, guid, ChatOptInInfoCard, p2.conversationType)
			elseif v61.onActivated then
				v61.onActivated(p2)
			end

			if FFlagAppChatGroupOsaAnalytics then
				v61.fireClickEvent(p2, u65, guid)
			end
		end, {
			u86,
			v61.onActivated,
			if not FFlagAppChatGroupOsaAnalytics then nil else v61.fireClickEvent,
			if not FFlagAppChatGroupOsaAnalytics then nil else u65
		})
	end

	local v89 = nil

	if FFlagAppChatEnableGroupOSA and (FFlagAppChatSquadJoinButtonOSA or FFlagAppChatSquadJoinButtonU13OSA) then
		local onSquadJoinButtonActivated = v61.onSquadJoinButtonActivated

		v89 = React.useCallback(function(s6: string) -- line: 259
			-- upvalues: FFlagAppChatSquadJoinButtonOSA (copy), shouldShowOSAForConversation (copy), conversation (copy), Constants (copy), FFlagAppChatSquadJoinButtonU13OSA (copy), shouldShowU13ChatOptInForConversation (copy), Conversation (copy), u86 (ref), FFlagAppChatGroupOsaAnalytics (copy), HttpService (copy), onSquadJoinButtonActivated (copy)
			local OsaContextCard = nil

			if FFlagAppChatSquadJoinButtonOSA and shouldShowOSAForConversation(conversation) then
				OsaContextCard = Constants.OptInVariant.OsaContextCard
			elseif FFlagAppChatSquadJoinButtonU13OSA and shouldShowU13ChatOptInForConversation(conversation) and conversation.conversationType == Conversation.Type.MULTI_USER_CONVERSATION then
				OsaContextCard = Constants.OptInVariant.ChatOptInInfoCard
			end

			if OsaContextCard and u86 then
				local guid = nil

				if FFlagAppChatGroupOsaAnalytics then
					guid = HttpService:GenerateGUID(false)
				end

				u86(s6, guid, OsaContextCard, conversation.conversationType, onSquadJoinButtonActivated)

				return
			end

			if onSquadJoinButtonActivated then
				onSquadJoinButtonActivated(s6)
			end
		end, {
			u86,
			conversation,
			onSquadJoinButtonActivated
		})
	end

	local v91 = if not FFlagAppChatEnableGroupOSA then v61.onActivated else v85
	local u92 = nil

	if FFlagEnableAppChatFocusableFixes then
		u92 = React.useContext(ReactFocusNavigation.FocusNavigationContext)
	end

	React.useEffect(function() -- line: 301
		-- upvalues: FFlagEnableAppChatFocusableFixes (copy), u84 (ref), v91 (copy), u92 (ref), v82 (copy), conversation (copy)
		if FFlagEnableAppChatFocusableFixes and (u84 and v91 and u92) then
			local v114 = u92.focusedGuiObject:subscribe(function(p3) -- line: 304
				-- upvalues: v82 (copy), v91 (copy), conversation (copy)
				if v82.current and p3 == v82.current.cell then
					v91(conversation)
				end
			end)

			return function() -- line: 309
				-- upvalues: v114 (copy)
				v114:unsubscribe()
			end
		end

		return function() -- line: 314
		end
	end, {
		v91,
		u84,
		u92
	})

	local v93 = v61.children or {}
	local Size_1900 = v63.Size.Size_1900
	local v95 = if not FFlagIsSquadEnabledAMP then nil else useCanAccessParty()
	local v96 = if not FFlagIsSquadEnabledAMP then GetFFlagIsSquadEnabled() else v95
	local v97 = shouldShowOSAForConversation(conversation) and not FFlagAppChatSquadJoinButtonOSA
	local v98 = not v70 and 0 or v63.Size.Size_200 + v63.Gap.XSmall
	local v99 = not v43 and 24 or v75.right
	local v100 = if not v96 or (not hasGroupUp or v97) then v81 + v98 + v99 else v99 + Size_1900

	if not v43 then
		v100 -= 12
	end

	local v101 = if not v96 or (not hasGroupUp or (not conversation.id or v97)) then nil else React.createElement(SquadComponentAccessWrapper, {
		parentChannelId = conversation.id
	}, { React.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, Size_1900, 1, 0),
		LayoutOrder = 2
	}, {}, {
		layout = React.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		padding = React.createElement("UIPadding", {
			PaddingRight = UDim.new(0, 0)
		}),
		button = React.createElement(SquadJoinButton, {
			conversationId = conversation.id,
			isFullWidth = false,
			isInCard = false,
			layoutOrder = 0,
			onActivated = v89 or v61.onSquadJoinButtonActivated,
			Selectable = false,
			shouldAnimate = false,
			squadLocation = v74.chatPlacement,
			squadButtonSource = SquadButtonSourceEnum.ConversationEntry,
			testId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.chatLandingConversationEntrySquadButton(conversation.title)
		})
	}) })

	return React.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, v61.entryHeight),
		BackgroundTransparency = 1,
		ref = v82
	}, {
		cell = React.createElement(ConversationCell, {
			Size = UDim2.new(1, 0, 0, v61.entryHeight),
			conversation = v61.conversation,
			childWidth = v100,
			subTitleText = if not getFFlagDebugAppChat() then v61.conversation.lastMessageContent else v61.conversation.id,
			onActivated = v91,
			style = v72,
			boldTitle = v71,
			hideLeftAvatarPadding = true,
			onSquadJoinButtonActivated = v61.onSquadJoinButtonActivated,
			paddingLeft = v75.left,
			paddingRight = v75.right,
			testId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.chatLandingConversationEntry(conversation.title)
		}, Cryo.Dictionary.join(v93, {
			timeStamp = if not v101 then if not v43 then React.createElement(ConversationTimestamp, {
				currentStyle = v72,
				paddingX = v101 and 12 or 0,
				paddingY = 14,
				text = v78,
				textSize = v77,
				textWidth = v81
			}) else React.createElement(ConversationRelativeTimestamp, {
				timestampText = v80,
				hasUnreadMessages = v69
			}) else nil,
			squadButton = v101
		}))
	})
end)
