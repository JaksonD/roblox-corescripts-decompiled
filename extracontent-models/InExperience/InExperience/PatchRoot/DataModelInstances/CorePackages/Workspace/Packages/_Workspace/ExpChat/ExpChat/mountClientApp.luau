local AppStorageService = game:GetService("AppStorageService")
local Chat = game:GetService("Chat")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local ExpChat = script:FindFirstAncestor("ExpChat")
local ExpChatParent = ExpChat.Parent
local Promise = require(ExpChatParent.Promise)
local Roact = require(ExpChatParent.Roact)
local UIBlox = require(ExpChatParent.UIBlox)
local Dictionary = require(ExpChatParent.llama).Dictionary
local ExpChatShared = require(ExpChatParent.ExpChatShared)
local LocalStorageKey = require(ExpChatParent.LocalStorage).Enums.LocalStorageKey
local NotificationModalsManager = require(ExpChatParent.NotificationModalsManager)
local SharedFlags = require(ExpChatParent.SharedFlags)
local Signals = require(ExpChatParent.Signals)
local GetAdorneeStore = require(ExpChat.Stores.GetAdorneeStore)
local GetMessagesStore = require(ExpChat.Stores.GetMessagesStore)
local GetChannelTabsStore = require(ExpChat.Stores.GetChannelTabsStore)
local GetTransparencyStore = require(ExpChat.Stores.GetTransparencyStore)
local GetCharacterStore = require(ExpChat.Stores.GetCharacterStore)
local GetChatConfigurationStore = require(ExpChat.Stores.GetChatConfigurationStore)
local GetChatStatusStore = require(ExpChat.Stores.GetChatStatusStore)
local GetChatModerationStore = require(ExpChat.Stores.GetChatModerationStore)
local GetGlobalMutedUsersStore = require(ExpChat.Stores.GetGlobalMutedUsersStore)
local FFlagConnectionsToFriendsRename = SharedFlags.FFlagConnectionsToFriendsRename
local FFlagExpChatUseProximityStore = SharedFlags.FFlagExpChatUseProximityStore
local v31 = if not FFlagExpChatUseProximityStore then nil else require(ExpChat.Stores.GetProximityStore)
local Analytics = ExpChatShared.Analytics
local countParticipantsInTextChannel = ExpChatShared.countParticipantsInTextChannel
local App = require(script.Parent.App)
local v35 = ExpChatShared.Logger:new("ExpChat/" .. script.Name)
local createDispatchBindableEvent = require(script.Parent.createDispatchBindableEvent)
local bindableEventQueue = require(ExpChat.Events.bindableEventQueue)
local createStore = require(script.Parent.createStore)
local GetNameColor = require(script.Parent.GetNameColor)
local reportMessageReceived = require(script.Parent.reportMessageReceived)
local canPlatformEnableChat = require(script.Parent.canPlatformEnableChat)
local watchForErrors = ExpChatShared.watchForErrors
local Commands = ExpChatShared.Commands
local Actions = ExpChat.Actions
local IncomingMessageReceived = require(Actions.IncomingMessageReceived)
local UniverseChatSystemMessageAdded = require(Actions.UniverseChatSystemMessageAdded)
local IncomingBubbleChatMessageReceived = require(Actions.IncomingBubbleChatMessageReceived)
local OutgoingMessageSent = require(Actions.OutgoingMessageSent)
local TextChannelCreated = ExpChatShared.Actions.TextChannelCreated
local TextChannelRemoved = ExpChatShared.Actions.TextChannelRemoved
local PlayerAdded = ExpChatShared.Actions.PlayerAdded
local PlayerRemoved = ExpChatShared.Actions.PlayerRemoved
local CharacterAdded = ExpChatShared.Actions.CharacterAdded
local LocalCharacterLoaded = ExpChatShared.Actions.LocalCharacterLoaded
local LocalTeamChanged = ExpChatShared.Actions.LocalTeamChanged
local ClientAppLoaded = ExpChatShared.Actions.ClientAppLoaded
local LastInputTypeChanged = require(Actions.LastInputTypeChanged)
local ChatPrivacySettingsReceived = require(Actions.ChatPrivacySettingsReceived)
local ChatPrivacySettingsFetchFailed = require(Actions.ChatPrivacySettingsFetchFailed)
local CommandAliasChanged = ExpChatShared.Actions.CommandAliasChanged
local HumanoidDied = require(Actions.HumanoidDied)
local AdorneeAdded = require(Actions.AdorneeAdded)
local LegacyBubbleChatEnabledChanged = require(Actions.LegacyBubbleChatEnabledChanged)
local LegacyBubbleChatSettingsChanged = require(Actions.LegacyBubbleChatSettingsChanged)
local LocalTextChannelParticipantAdded = require(Actions.LocalTextChannelParticipantAdded)
local LocalTextChannelParticipantRemoved = ExpChatShared.Actions.LocalTextChannelParticipantRemoved
local HiddenMessageReceived = require(Actions.HiddenMessageReceived)
local HiddenMessagesCleared = require(Actions.HiddenMessagesCleared)
local UniverseChatChannelAdded = require(Actions.UniverseChatChannelAdded)
local displaySystemMessage = require(ExpChat.displaySystemMessage)
local generateRichSystemMessageTextFormat = require(ExpChat.generateRichSystemMessageTextFormat)
local summaryMessageRichText = require(ExpChat.summaryMessageRichText)
local TextChatMessageChatActionType = require(ExpChat.TextChatMessageChatActionType)
local getExperienceChatVisualConfig = require(ExpChat.getExperienceChatVisualConfig)
local getOtherDisplayNameInWhisperChannel = require(ExpChat.getOtherDisplayNameInWhisperChannel)
local handleChannelWelcomeMessage = require(ExpChat.handleChannelWelcomeMessage)
local isPlayerVerified = require(ExpChat.isPlayerVerified)
local isChatRegionLocked = require(ExpChat.isChatRegionLocked)
local isUserChatEnabled = require(ExpChat.isUserChatEnabled)
local canOnlyChatInRegion = require(ExpChat.canOnlyChatInRegion)
local shouldSendHighFrequencyTelemetry = require(ExpChat.shouldSendHighFrequencyTelemetry)
local shouldShowFOMOUpsell = require(ExpChat.shouldShowFOMOUpsell)
local shouldShowCrossAgeChatActivity = require(ExpChat.shouldShowCrossAgeChatActivity)
local shouldSuppressUnreadForTabMetadata = require(ExpChat.shouldSuppressUnreadForTabMetadata)
local ExpChatPerfTracker = require(ExpChat.Telemetry.ExpChatPerfTracker)
local Flags = ExpChat.Flags
local getEngineFeatureFlagEnableDisplayBubble = require(Flags.getEngineFeatureFlagEnableDisplayBubble)
local getFFlagUnreduxLastInputTypeChanged = require(Flags.getFFlagUnreduxLastInputTypeChanged)
local getFFlagExpChatEnableChannelTabsUI = require(Flags.getFFlagExpChatEnableChannelTabsUI)
local getFFlagExpChatOverridePrefixNameColor = require(Flags.getFFlagExpChatOverridePrefixNameColor)
local getFFlagUseCharacterStore = ExpChatShared.Flags.getFFlagUseCharacterStore
local GetFFlagExpChatSuppressWelcomeMessageTabUnread = ExpChatShared.Flags.GetFFlagExpChatSuppressWelcomeMessageTabUnread
local getFFlagExpChatTelemetryEventTrigger = require(ExpChat.Flags.getFFlagExpChatTelemetryEventTrigger)
local FFlagAEGIS2EnableGatesForExpChat = require(Flags.FFlagAEGIS2EnableGatesForExpChat)
local v95 = game:DefineFastFlag("ExpChatShowBubblesOnMeshParts", false)
local v96 = game:DefineFastInt("ExpChatMessageResponseThrottlePermyriad", 0)
local v97 = game:DefineFastInt("ExpChatMessageResponseUserSamplePermyriad", 0)
local v98 = game:DefineFastFlag("ExpChatEnableNewFOMOSystemMessages", false)
local v99 = game:DefineFastInt("ExpChatHiddenMessagesPromptThresholdLowerBound", 10)
local v100 = game:DefineFastInt("ExpChatHiddenMessagesPromptThresholdUpperBound", 45)
local FFlagExpChatEnableFOMOUpsell = require(Flags.FFlagExpChatEnableFOMOUpsell)
local FFlagExpChatClearHiddenMessagesPostAgeCheck = require(Flags.FFlagExpChatClearHiddenMessagesPostAgeCheck)
local FFlagEnableInExpChatSummaryOnLua = require(Flags.FFlagEnableInExpChatSummaryOnLua)
local FFlagExpChatEnableCrossAgeChatActivity = require(Flags.FFlagExpChatEnableCrossAgeChatActivity)
local v105 = game:DefineFastInt("MaxExpChatUserMessageIntentImpressionCount", 9999999)
local GetFFlagExpChatUserMessageIntentSentCooldown = SharedFlags.GetFFlagExpChatUserMessageIntentSentCooldown
local GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled = SharedFlags.GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled
local FIntMaxExpChatUnlockChatButtonImpressionsCount = SharedFlags.FIntMaxExpChatUnlockChatButtonImpressionsCount
local FStringExpChatFOMOUpsellImpressionsCountKey = SharedFlags.FStringExpChatFOMOUpsellImpressionsCountKey
local GetFFlagExpChatFOMOUpsellImpressionsCountEnabled = SharedFlags.GetFFlagExpChatFOMOUpsellImpressionsCountEnabled
local FFlagExpChatUseAdorneeStore = SharedFlags.FFlagExpChatUseAdorneeStore
local FFlagExpChatUseMessagesStore = SharedFlags.FFlagExpChatUseMessagesStore
local FFlagExpChatUseChannelTabsStore = SharedFlags.FFlagExpChatUseChannelTabsStore
local FFlagExpChatUseChatConfigStore = SharedFlags.FFlagExpChatUseChatConfigStore
local FFlagEnableModerateChatRemoteEvent = SharedFlags.FFlagEnableModerateChatRemoteEvent
local FFlagEnableClientSummarySystemMessageOnLua = SharedFlags.FFlagEnableClientSummarySystemMessageOnLua
local FFlagExpChatPerfTracking = SharedFlags.FFlagExpChatPerfTracking
local GetFFlagTextChatEnableUniverseChatTabs = ExpChatShared.Flags.GetFFlagTextChatEnableUniverseChatTabs
local GetFFlagEnableExpChatUniverseChatTabNames = ExpChatShared.Flags.GetFFlagEnableExpChatUniverseChatTabNames
local FFlagExpChatDisableUniverseBubbleChat = ExpChatShared.Flags.FFlagExpChatDisableUniverseBubbleChat
local GetFFlagExpChatGlobalMuteCommandEnabled = ExpChatShared.Flags.GetFFlagExpChatGlobalMuteCommandEnabled
local v122 = game:DefineFastFlag("ExpChatRemoveSpaceFromTeamPrefix", false)
local FFlagChatLineReportingGlobalMuteEnabled = SharedFlags.FFlagChatLineReportingGlobalMuteEnabled

function getChatTranslationEnabled() -- line: 148
	-- upvalues: TextChatService (copy)
	local ok, result = pcall(function() -- line: 149
		-- upvalues: TextChatService (copy)
		return TextChatService.ChatTranslationEnabled
	end)

	return ok and result
end

local t1 = {
	eventName = "MessageResponse",
	backends = { "EventIngest" },
	throttlingPercentage = v96,
	lastUpdated = {
		25,
		10,
		8
	},
	description = "When a client receives a text chat message through TextChatService.",
	links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/message_response.proto"
}
local helpers = script.helpers
local setUpConfigurationObjects = require(helpers.setUpConfigurationObjects)
local setUpClientSettings = require(helpers.setUpClientSettings)
local waitForFirst = require(helpers.waitForFirst)
local shouldFilterGlobalMessage = require(helpers.shouldFilterGlobalMessage)
local context = ExpChatShared.context
local reportVersionLoaded = require(script.reportVersionLoaded)
local Version = ExpChatShared.Version
local AtomicBinding = require(ExpChat.AtomicBinding)

local function watchPlayersService(p1, p2, p3) -- line: 178
	-- upvalues: v35 (copy), isPlayerVerified (copy), PlayerAdded (copy), Players (copy), LocalTeamChanged (copy), v95 (copy), FFlagExpChatUseAdorneeStore (copy), context (copy), AdorneeAdded (copy), HumanoidDied (copy), AtomicBinding (copy), waitForFirst (copy), LocalCharacterLoaded (copy), getFFlagUseCharacterStore (copy), CharacterAdded (copy), Promise (copy), displaySystemMessage (copy), FFlagConnectionsToFriendsRename (copy), PlayerRemoved (copy), FFlagExpChatUseMessagesStore (copy)
	v35:trace("Watching Players service")

	local t2 = {}

	local function onPlayerAdded(p4) -- line: 182
		-- upvalues: v35 (copy), isPlayerVerified (copy), p2 (copy), PlayerAdded (copy), Players (copy), LocalTeamChanged (copy), v95 (copy), FFlagExpChatUseAdorneeStore (copy), context (copy), AdorneeAdded (copy), HumanoidDied (copy), AtomicBinding (copy), waitForFirst (copy), LocalCharacterLoaded (copy), getFFlagUseCharacterStore (copy), CharacterAdded (copy), t2 (copy)
		v35:trace("Player added: {} {}", p4.Name, (tostring(p4.UserId)))

		local v204 = not not isPlayerVerified(p4) or nil

		p2:dispatch(PlayerAdded(p4.UserId, p4.Name, p4.DisplayName, v204))

		if p4 == Players.LocalPlayer then
			v35:trace("Found local player")
			p4:GetPropertyChangedSignal("Team"):Connect(function() -- line: 191
				-- upvalues: p2 (copy), LocalTeamChanged (copy), p4 (copy)
				p2:dispatch(LocalTeamChanged(p4.Team))
			end)
		end

		local v205 = AtomicBinding.new({
			humanoid = "Humanoid",
			humanoidRootPart = "HumanoidRootPart"
		}, function(p5) --[[ dispatchBubbleChatAdornee ]] -- line: 199
			-- upvalues: v95 (copy), p4 (copy), FFlagExpChatUseAdorneeStore (copy), context (copy), p2 (copy), AdorneeAdded (copy), HumanoidDied (copy)
			local root = p5.root
			local humanoid = p5.humanoid
			local humanoidRootPart = p5.humanoidRootPart
			local v304 = not v95 and "Part" or "BasePart"

			if humanoid:IsA("Humanoid") and humanoidRootPart:IsA(v304) then
				if root and humanoidRootPart and root == p4.Character then
					if FFlagExpChatUseAdorneeStore then
						context.adorneeStore.handleAdorneeAdded(p4.UserId, root, humanoid)
					else
						p2:dispatch(AdorneeAdded(p4.UserId, root, humanoid))
					end
				end

				local connection = humanoid.Died:Connect(function() -- line: 214
					-- upvalues: FFlagExpChatUseAdorneeStore (copy), context (copy), p4 (copy), p2 (copy), HumanoidDied (copy)
					if FFlagExpChatUseAdorneeStore then
						context.adorneeStore.handleHumanoidDied(p4.UserId)

						return
					end

					p2:dispatch(HumanoidDied(p4.UserId))
				end)

				return function() --[[ disconnectHumanoidDied ]] -- line: 222
					-- upvalues: connection (copy)
					if connection then
						connection:Disconnect()
					end
				end
			end

			return function() -- line: 233
			end
		end)

		local function onCharacterAdded(p6) -- line: 244
			-- upvalues: waitForFirst (copy), p4 (copy), v35 (copy), Players (copy), p2 (copy), LocalCharacterLoaded (copy), getFFlagUseCharacterStore (copy), context (copy), CharacterAdded (copy), v205 (copy)
			if not p6.Parent then
				waitForFirst(p6.AncestryChanged, p4.CharacterAdded)
			end

			if p6 ~= p4.Character or not p6.Parent then
				v35:debug("Mismatched or unparented character in onCharacterAdded for {}", (tostring(p4.UserId)))

				return
			end

			if p4 == Players.LocalPlayer then
				v35:debug("Local character loaded: {}", p6.Name)
				p2:dispatch(LocalCharacterLoaded(p6))
			end

			if getFFlagUseCharacterStore() then
				context.characterStore.handleCharacterAdded(p4.UserId, p6)
			else
				p2:dispatch(CharacterAdded(p4.UserId, p6))
			end

			v205:bindRoot(p6)
		end

		if p4.Character then
			onCharacterAdded(p4.Character)
		end

		local connection = p4.CharacterAdded:Connect(onCharacterAdded)
		local connection2 = p4.CharacterRemoving:Connect(function(character) --[[ onCharacterRemoving ]] -- line: 268
			-- upvalues: v205 (copy)
			v205:unbindRoot(character)
		end)

		if not t2[p4.UserId] then
			t2[p4.UserId] = {
				connection,
				connection2
			}
		end
	end

	for _, v in pairs(Players:GetPlayers()) do
		if v:IsA("Player") then
			onPlayerAdded(v)
		end
	end

	Players.PlayerAdded:Connect(function(player) --[[ onNewPlayerAdded ]] -- line: 286
		-- upvalues: onPlayerAdded (copy), Players (copy), Promise (copy), displaySystemMessage (copy), FFlagConnectionsToFriendsRename (copy), p1 (copy), v35 (copy)
		onPlayerAdded(player)

		if Players.LocalPlayer then
			Promise.try(function() -- line: 290
				-- upvalues: player (copy), Players (copy)
				if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
					return player:IsFriendsWithAsync(Players.LocalPlayer.UserId)
				end

				return player:IsFriendsWith(Players.LocalPlayer.UserId)
			end):andThen(function(p7) -- line: 297
				-- upvalues: displaySystemMessage (copy), FFlagConnectionsToFriendsRename (copy), player (copy), p1 (copy)
				if p7 then
					displaySystemMessage(not FFlagConnectionsToFriendsRename and "InGame.UnknownNamespace.GameChat_FriendChatNotifier_JoinMessage" or "InGame.UnknownNamespace.GameChat.FriendChatNotifier.JoinMessage", {
						RBX_NAME = player.DisplayName
					}, "Roblox.Notification.Friend.Joined", p1.translator, p1.defaultSystemTextChannel)
				end
			end):catch(function(p8) -- line: 310
				-- upvalues: v35 (copy)
				v35:error("Could not fetch friendship status. Error: {}", (tostring(p8)))
			end)
		end
	end)
	Players.PlayerRemoving:Connect(function(player) -- line: 325
		-- upvalues: v35 (copy), p2 (copy), PlayerRemoved (copy), FFlagExpChatUseMessagesStore (copy), p3 (copy), FFlagExpChatUseAdorneeStore (copy), context (copy), getFFlagUseCharacterStore (copy), t2 (copy)
		v35:trace("Player removed: {} {}", player.Name, (tostring(player.UserId)))
		p2:dispatch(PlayerRemoved(player.UserId))

		if FFlagExpChatUseMessagesStore then
			p3.handlePlayerRemoved(player.UserId)
		end

		if FFlagExpChatUseAdorneeStore then
			context.adorneeStore.handlePlayerRemoved(player.UserId)
		end

		if getFFlagUseCharacterStore() then
			context.characterStore.handlePlayerRemoved(player.UserId)
		end

		local v211 = t2[player.UserId]

		if v211 then
			for _, v in ipairs(v211) do
				v:Disconnect()
			end

			t2[player.UserId] = nil
		end
	end)
end

local t3 = {
	canUserChatAsync = function(p9) --[[ canUserChatAsync ]] -- line: 378
		-- upvalues: Chat (copy)
		return Chat:CanUserChatAsync(p9)
	end
}

local function v136(p10) -- line: 383
	-- upvalues: v35 (copy), FFlagEnableInExpChatSummaryOnLua (copy), generateRichSystemMessageTextFormat (copy), UIBlox (copy)
	v35:trace("System OnIncomingMessage started: {} {}", p10.PrefixText, p10.Text)

	local TextChatMessageProperties = Instance.new("TextChatMessageProperties")

	TextChatMessageProperties.Text = if not FFlagEnableInExpChatSummaryOnLua then string.format("<font color=\"#%s\">%s</font>", if not string.find(p10.Metadata, "Error") then UIBlox.App.Style.Colors.LightGrey:ToHex() else UIBlox.App.Style.Colors.Red:ToHex(), p10.Text) else generateRichSystemMessageTextFormat(p10.Text, not not string.find(p10.Metadata, "Error"))
	v35:trace("System OnIncomingMessage finished: {} {}", TextChatMessageProperties.PrefixText, TextChatMessageProperties.Text)

	return TextChatMessageProperties
end

return function(t4: {[any]: any}) -- line: 401
	-- upvalues: v35 (copy), Dictionary (copy), t3 (copy), createStore (copy), createDispatchBindableEvent (copy), bindableEventQueue (copy), watchForErrors (copy), context (copy), FFlagExpChatUseAdorneeStore (copy), GetAdorneeStore (copy), FFlagExpChatUseProximityStore (copy), v31 (copy), FFlagExpChatUseMessagesStore (copy), GetMessagesStore (copy), FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStore (copy), FFlagExpChatUseChatConfigStore (copy), GetChatConfigurationStore (copy), FFlagAEGIS2EnableGatesForExpChat (copy), GetChatStatusStore (copy), GetFFlagExpChatGlobalMuteCommandEnabled (copy), GetGlobalMutedUsersStore (copy), getFFlagUseCharacterStore (copy), GetCharacterStore (copy), Analytics (copy), getFFlagUnreduxLastInputTypeChanged (copy), UserInputService (copy), LastInputTypeChanged (copy), v136 (copy), Chat (copy), TextChatService (copy), setUpConfigurationObjects (copy), setUpClientSettings (copy), GetFFlagExpChatFOMOUpsellImpressionsCountEnabled (copy), AppStorageService (copy), LocalStorageKey (copy), HttpService (copy), FStringExpChatFOMOUpsellImpressionsCountKey (copy), Players (copy), displaySystemMessage (copy), FFlagExpChatPerfTracking (copy), ExpChatPerfTracker (copy), reportMessageReceived (copy), handleChannelWelcomeMessage (copy), GetTransparencyStore (copy), IncomingMessageReceived (copy), GetFFlagExpChatSuppressWelcomeMessageTabUnread (copy), shouldSuppressUnreadForTabMetadata (copy), UniverseChatSystemMessageAdded (copy), shouldSendHighFrequencyTelemetry (copy), v97 (copy), t1 (copy), TextChannelCreated (copy), getFFlagExpChatEnableChannelTabsUI (copy), GetNameColor (copy), getFFlagExpChatOverridePrefixNameColor (copy), v122 (copy), getOtherDisplayNameInWhisperChannel (copy), GetFFlagTextChatEnableUniverseChatTabs (copy), summaryMessageRichText (copy), FFlagEnableInExpChatSummaryOnLua (copy), FFlagEnableClientSummarySystemMessageOnLua (copy), TextChannelRemoved (copy), TextChatMessageChatActionType (copy), RobloxReplicatedStorage (copy), OutgoingMessageSent (copy), countParticipantsInTextChannel (copy), LocalTextChannelParticipantAdded (copy), LocalTextChannelParticipantRemoved (copy), UniverseChatChannelAdded (copy), GetFFlagEnableExpChatUniverseChatTabNames (copy), shouldFilterGlobalMessage (copy), FFlagChatLineReportingGlobalMuteEnabled (copy), IncomingBubbleChatMessageReceived (copy), LegacyBubbleChatEnabledChanged (copy), LegacyBubbleChatSettingsChanged (copy), getEngineFeatureFlagEnableDisplayBubble (copy), FFlagExpChatDisableUniverseBubbleChat (copy), Commands (copy), CommandAliasChanged (copy), Promise (copy), ChatPrivacySettingsReceived (copy), ChatPrivacySettingsFetchFailed (copy), watchPlayersService (copy), UIBlox (copy), Roact (copy), App (copy), getFFlagExpChatTelemetryEventTrigger (copy), ClientAppLoaded (copy), StarterGui (copy), reportVersionLoaded (copy), Version (copy), isChatRegionLocked (copy), v98 (copy), canPlatformEnableChat (copy), GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled (copy), FIntMaxExpChatUnlockChatButtonImpressionsCount (copy), canOnlyChatInRegion (copy), FFlagConnectionsToFriendsRename (copy), v99 (copy), v100 (copy), HiddenMessageReceived (copy), isUserChatEnabled (copy), FFlagExpChatEnableFOMOUpsell (copy), shouldShowFOMOUpsell (copy), FFlagExpChatEnableCrossAgeChatActivity (copy), shouldShowCrossAgeChatActivity (copy), GetFFlagExpChatUserMessageIntentSentCooldown (copy), v105 (copy), FFlagEnableModerateChatRemoteEvent (copy), getExperienceChatVisualConfig (copy), GetChatModerationStore (copy), Signals (copy), NotificationModalsManager (copy), FFlagExpChatClearHiddenMessagesPostAgeCheck (copy), HiddenMessagesCleared (copy)
	v35:trace("mountClientApp started")

	local u150 = Dictionary.join(t3, t4)
	local v151 = createStore()

	createDispatchBindableEvent(v151)
	bindableEventQueue:flush()
	watchForErrors(game:GetService("ScriptContext"), u150.script, false)
	context.translator = u150.translator
	context.store = v151

	if FFlagExpChatUseAdorneeStore then
		context.adorneeStore = GetAdorneeStore(false)
	end

	if FFlagExpChatUseProximityStore then
		context.proximityStore = v31(false)
	end

	local v152 = if not FFlagExpChatUseMessagesStore then nil else GetMessagesStore(false)
	local v153 = if not FFlagExpChatUseChannelTabsStore then nil else GetChannelTabsStore(false)
	local v154 = if not FFlagExpChatUseChatConfigStore then nil else GetChatConfigurationStore(false)
	local v155 = if not FFlagAEGIS2EnableGatesForExpChat then nil else GetChatStatusStore(false)

	if FFlagExpChatUseMessagesStore then
		context.messagesStore = v152
	end

	if GetFFlagExpChatGlobalMuteCommandEnabled() then
		context.globalMutedUsersStore = GetGlobalMutedUsersStore(false)
	end

	if getFFlagUseCharacterStore() then
		context.characterStore = GetCharacterStore(false)
	end

	if u150.analytics then
		Analytics.with(u150.analytics)
	end

	if not getFFlagUnreduxLastInputTypeChanged() then
		UserInputService.LastInputTypeChanged:Connect(function(p11) -- line: 448
			-- upvalues: v151 (copy), LastInputTypeChanged (copy)
			v151:dispatch(LastInputTypeChanged(p11))
		end)
	end

	if u150.defaultSystemTextChannel then
		u150.defaultSystemTextChannel.OnIncomingMessage = v136
	else
		Chat:GetPropertyChangedSignal("IsAutoMigrated"):Once(function() -- line: 456
			-- upvalues: TextChatService (copy), u150 (ref), v136 (copy)
			local RBXSystem = TextChatService:FindFirstChild("RBXSystem", true)

			if RBXSystem and RBXSystem:IsA("TextChannel") then
				u150.defaultSystemTextChannel = RBXSystem
				RBXSystem.OnIncomingMessage = v136
			end
		end)
	end

	setUpConfigurationObjects(v151, u150)
	setUpClientSettings(v151)

	local n1 = 1

	if GetFFlagExpChatFOMOUpsellImpressionsCountEnabled() then
		local t5 = {}
		local ok, result = pcall(function() -- line: 476
			-- upvalues: AppStorageService (copy), LocalStorageKey (copy)
			return AppStorageService:GetItem(LocalStorageKey.ExpChatFOMOUpsellImpressionsCount)
		end)

		if ok and result ~= "" then
			local ok2, result2 = pcall(function() -- line: 481
				-- upvalues: HttpService (copy), result (copy)
				return HttpService:JSONDecode(result)
			end)

			if ok2 then
				t5 = result2
			end
		end

		if t5[FStringExpChatFOMOUpsellImpressionsCountKey] then
			n1 = t5[FStringExpChatFOMOUpsellImpressionsCountKey] + 1
		end

		t5[FStringExpChatFOMOUpsellImpressionsCountKey] = n1
		AppStorageService:SetItem(LocalStorageKey.ExpChatFOMOUpsellImpressionsCount, HttpService:JSONEncode(t5))
		AppStorageService:Flush()
	end

	local LocalPlayer = Players.LocalPlayer

	if LocalPlayer then
		LocalPlayer:GetPropertyChangedSignal("Team"):Connect(function() -- line: 503
			-- upvalues: LocalPlayer (copy), displaySystemMessage (copy), u150 (ref)
			local Team = LocalPlayer.Team

			if Team then
				displaySystemMessage("InGame.UnknownNamespace.GameChat_TeamChat_NowInTeam", {
					RBX_NAME = Team.Name
				}, "Roblox.Team.Success.NowInTeam", u150.translator, u150.defaultSystemTextChannel)
			end
		end)
	end

	local t6 = {
		[Enum.TextChatMessageStatus.Floodchecked] = {
			key = "CoreScripts.TextChat.MessageStatus.Warning.Floodchecked",
			metadata = "Roblox.MessageStatus.Warning.Floodchecked"
		},
		[Enum.TextChatMessageStatus.TextFilterFailed] = {
			key = "CoreScripts.TextChat.MessageStatus.Warning.TextFilterFailed",
			metadata = "Roblox.MessageStatus.Warning.TextFilterFailed"
		},
		[Enum.TextChatMessageStatus.InvalidPrivacySettings] = {
			key = "CoreScripts.TextChat.MessageStatus.Warning.InvalidPrivacySettings",
			metadata = "Roblox.MessageStatus.Warning.InvalidPrivacySettings"
		},
		[Enum.TextChatMessageStatus.MessageTooLong] = {
			key = "CoreScripts.TextChat.MessageStatus.Warning.MessageTooLong",
			metadata = "Roblox.MessageStatus.Warning.MessageTooLong"
		},
		[Enum.TextChatMessageStatus.ModerationTimeout] = {
			key = "CoreScripts.TextChat.MessageStatus.Warning.ModerationTimeout",
			metadata = "Roblox.MessageStatus.Warning.ModerationTimeout"
		},
		[Enum.TextChatMessageStatus.Unknown] = {
			key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown",
			metadata = "Roblox.MessageStatus.Warning.Unknown"
		}
	}

	local function _processIncomingMessageCore(p12, s1: string?, b1: boolean?) -- line: 547
		-- upvalues: v35 (copy), FFlagExpChatPerfTracking (copy), LocalPlayer (copy), ExpChatPerfTracker (copy), reportMessageReceived (copy), handleChannelWelcomeMessage (copy), displaySystemMessage (copy), u150 (ref), FFlagExpChatUseMessagesStore (copy), v152 (copy), GetTransparencyStore (copy), FFlagExpChatUseChannelTabsStore (copy), v153 (copy), v151 (copy), IncomingMessageReceived (copy), t6 (copy), GetFFlagExpChatSuppressWelcomeMessageTabUnread (copy), shouldSuppressUnreadForTabMetadata (copy), UniverseChatSystemMessageAdded (copy), TextChatService (copy), shouldSendHighFrequencyTelemetry (copy), v97 (copy), Analytics (copy), t1 (copy)
		v35:debug("Incoming MessageReceived Status: {} Text: {}", p12.Status.Name, p12.Text)

		if FFlagExpChatPerfTracking and (p12.TextSource and p12.TextSource.UserId or "UNKNOWN_TEXT_SOURCE_USER_ID") ~= (LocalPlayer and LocalPlayer.UserId or "UNKNOWN_LOCAL_USER_ID") then
			ExpChatPerfTracker.start(ExpChatPerfTracker.Events.MessageReceiveToWindowRenderInterval, {
				messageId = p12.MessageId
			})
		end

		if LocalPlayer then
			reportMessageReceived(LocalPlayer.UserId, p12)
		end

		if LocalPlayer and p12.TextSource and p12.TextSource.UserId ~= LocalPlayer.UserId then
			local v220 = handleChannelWelcomeMessage(p12, LocalPlayer)

			if v220 then
				displaySystemMessage(v220.key, v220.args, v220.metadata, u150.translator, p12.TextChannel)
			end
		end

		local v221 = LocalPlayer and (p12.TextSource and p12.TextSource.UserId == LocalPlayer.UserId)

		if FFlagExpChatUseMessagesStore then
			v152.handleIncomingOrOutgoingMessage(p12, v221, s1, b1)
			GetTransparencyStore(false).resetTextTransparency()

			if FFlagExpChatUseChannelTabsStore and v153 then
				v153.handleIncomingOrOutgoingMessage(p12, v221, s1)
			end
		else
			v151:dispatch(IncomingMessageReceived(p12, v221, s1, b1))
			GetTransparencyStore(false).resetTextTransparency()
		end

		local v222 = t6[p12.Status]

		if v222 then
			local ok, result = pcall(function() -- line: 610
				-- upvalues: u150 (ref), v222 (copy)
				return u150.translator:FormatByKey(v222.key)
			end)
			local v225 = ok and (result and result ~= "")

			if s1 and v225 then
				if FFlagExpChatUseMessagesStore and v152 then
					v152.addSystemMessage(result, s1, if not GetFFlagExpChatSuppressWelcomeMessageTabUnread() then nil else v222.metadata)

					if FFlagExpChatUseChannelTabsStore and v153 and (not GetFFlagExpChatSuppressWelcomeMessageTabUnread() or not shouldSuppressUnreadForTabMetadata(v222.metadata)) then
						v153.markChannelUnread(s1)
					end
				else
					v151:dispatch(UniverseChatSystemMessageAdded(result, s1, if not GetFFlagExpChatSuppressWelcomeMessageTabUnread() then nil else v222.metadata))
				end
			else
				local defaultSystemTextChannel = u150.defaultSystemTextChannel

				if s1 then
					local s1_2 = TextChatService:FindFirstChild(s1)

					if s1_2 and s1_2:IsA("TextChannel") then
						defaultSystemTextChannel = s1_2
					end
				end

				displaySystemMessage(v222.key, nil, v222.metadata, u150.translator, defaultSystemTextChannel)
			end
		end

		if shouldSendHighFrequencyTelemetry(v97) then
			Analytics:TelemetryLogEvent(t1, {
				messageStatus = p12.Status.Name
			}, {
				"addOsInfo",
				"addSessionId",
				"addUniverseId",
				"addPlaceId"
			})
		end
	end
	local function handleMessageReceived(p13) -- line: 677
		-- upvalues: v151 (copy), TextChannelCreated (copy), getFFlagExpChatEnableChannelTabsUI (copy), TextChatService (copy), GetNameColor (copy), getFFlagExpChatOverridePrefixNameColor (copy), v35 (copy), Players (copy), v122 (copy), LocalPlayer (copy), getOtherDisplayNameInWhisperChannel (copy), u150 (ref), GetFFlagTextChatEnableUniverseChatTabs (copy), _processIncomingMessageCore (copy), FFlagExpChatPerfTracking (copy), ExpChatPerfTracker (copy), reportMessageReceived (copy), handleChannelWelcomeMessage (copy), displaySystemMessage (copy), FFlagExpChatUseMessagesStore (copy), v152 (copy), GetTransparencyStore (copy), FFlagExpChatUseChannelTabsStore (copy), v153 (copy), IncomingMessageReceived (copy), shouldSendHighFrequencyTelemetry (copy), v97 (copy), Analytics (copy), t1 (copy)
		v151:dispatch(TextChannelCreated(p13))

		local u233 = false

		if getFFlagExpChatEnableChannelTabsUI() then
			local ChannelTabsConfiguration = TextChatService:FindFirstChildOfClass("ChannelTabsConfiguration")

			if ChannelTabsConfiguration then
				u233 = ChannelTabsConfiguration.Enabled
			end
		end

		if string.find(p13.Name, "RBXGeneral") then
			function p13.OnIncomingMessage(p14) -- line: 689
				-- upvalues: GetNameColor (copy), getFFlagExpChatOverridePrefixNameColor (copy)
				local TextChatMessageProperties = Instance.new("TextChatMessageProperties")

				if p14.TextSource then
					local v312 = GetNameColor(p14.TextSource.UserId)

					if not getFFlagExpChatOverridePrefixNameColor() or not p14.ChatWindowMessageProperties then
						TextChatMessageProperties.PrefixText = string.format("<font color=\"#%s\">%s</font>", v312:ToHex(), p14.PrefixText)
					end
				end

				return TextChatMessageProperties
			end
		elseif string.find(p13.Name, "^RBXTeam") then
			function p13.OnIncomingMessage(p15) -- line: 703
				-- upvalues: v35 (copy), Players (copy), v122 (copy), u233 (ref)
				v35:trace("Team OnIncomingMessage started: {} {}", p15.PrefixText, p15.Text)

				local TextChatMessageProperties = Instance.new("TextChatMessageProperties")

				if Players.LocalPlayer then
					local TeamColorColor = Players.LocalPlayer.TeamColor.Color
					local v316 = if not v122 then not u233 and "[Team] " or "" else if not u233 then not (#(p15.PrefixText or "") > 0) and "[Team]" or "[Team] " else ""

					TextChatMessageProperties.PrefixText = string.format("<font color=\"#%s\">%s%s</font>", TeamColorColor:ToHex(), v316, p15.PrefixText)
				end

				v35:trace("Team OnIncomingMessage finished: {} {}", TextChatMessageProperties.PrefixText, TextChatMessageProperties.Text)

				return TextChatMessageProperties
			end
		elseif string.find(p13.Name, "^RBXWhisper") and LocalPlayer then
			function p13.OnIncomingMessage(p16) -- line: 733
				-- upvalues: getOtherDisplayNameInWhisperChannel (copy), p13 (copy), LocalPlayer (copy), u233 (ref), u150 (ref), GetNameColor (copy)
				local TextSource = p16.TextSource

				if TextSource then
					local v319 = getOtherDisplayNameInWhisperChannel(p13, LocalPlayer)

					if v319 then
						local v320 = nil

						if not u233 then
							v320 = if TextSource.UserId ~= LocalPlayer.UserId then u150.translator:FormatByKey("CoreScripts.TextChat.WhisperChat.PrefixText.Incoming", {
								RBX_NAME = v319
							}) else u150.translator:FormatByKey("CoreScripts.TextChat.WhisperChat.PrefixText.Outgoing", {
								RBX_NAME = v319
							})
						end

						local TextChatMessageProperties = Instance.new("TextChatMessageProperties")
						local v322 = GetNameColor(TextSource.UserId)

						TextChatMessageProperties.PrefixText = string.format("%s<font color=\"#%s\">%s</font>", not v320 and "" or v320 .. " ", v322:ToHex(), p16.PrefixText)

						return TextChatMessageProperties
					end
				end

				return nil
			end
		end

		p13.MessageReceived:Connect(function(p17) -- line: 770
			-- upvalues: GetFFlagTextChatEnableUniverseChatTabs (copy), _processIncomingMessageCore (copy), v35 (copy), FFlagExpChatPerfTracking (copy), LocalPlayer (copy), ExpChatPerfTracker (copy), reportMessageReceived (copy), handleChannelWelcomeMessage (copy), displaySystemMessage (copy), u150 (ref), FFlagExpChatUseMessagesStore (copy), v152 (copy), GetTransparencyStore (copy), FFlagExpChatUseChannelTabsStore (copy), v153 (copy), v151 (copy), IncomingMessageReceived (copy), shouldSendHighFrequencyTelemetry (copy), v97 (copy), Analytics (copy), t1 (copy)
			if GetFFlagTextChatEnableUniverseChatTabs() then
				_processIncomingMessageCore(p17, nil, nil)

				return
			end

			v35:debug("Incoming MessageReceived Status: {} Text: {}", p17.Status.Name, p17.Text)

			if FFlagExpChatPerfTracking and (p17.TextSource and p17.TextSource.UserId or "UNKNOWN_TEXT_SOURCE_USER_ID") ~= (LocalPlayer and LocalPlayer.UserId or "UNKNOWN_LOCAL_USER_ID") then
				ExpChatPerfTracker.start(ExpChatPerfTracker.Events.MessageReceiveToWindowRenderInterval, {
					messageId = p17.MessageId
				})
			end

			if LocalPlayer then
				reportMessageReceived(LocalPlayer.UserId, p17)
			end

			if LocalPlayer and p17.TextSource and p17.TextSource.UserId ~= LocalPlayer.UserId then
				local v324 = handleChannelWelcomeMessage(p17, LocalPlayer)

				if v324 then
					displaySystemMessage(v324.key, v324.args, v324.metadata, u150.translator, p17.TextChannel)
				end
			end

			local v325 = LocalPlayer and (p17.TextSource and p17.TextSource.UserId == LocalPlayer.UserId)

			if FFlagExpChatUseMessagesStore then
				v152.handleIncomingOrOutgoingMessage(p17, v325)
				GetTransparencyStore(false).resetTextTransparency()

				if FFlagExpChatUseChannelTabsStore and v153 then
					v153.handleIncomingOrOutgoingMessage(p17, v325)
				end
			else
				v151:dispatch(IncomingMessageReceived(p17, v325))
				GetTransparencyStore(false).resetTextTransparency()
			end

			if p17.Status == Enum.TextChatMessageStatus.Floodchecked then
				displaySystemMessage("CoreScripts.TextChat.MessageStatus.Warning.Floodchecked", nil, "Roblox.MessageStatus.Warning.Floodchecked", u150.translator, u150.defaultSystemTextChannel)
			elseif p17.Status == Enum.TextChatMessageStatus.TextFilterFailed then
				displaySystemMessage("CoreScripts.TextChat.MessageStatus.Warning.TextFilterFailed", nil, "Roblox.MessageStatus.Warning.TextFilterFailed", u150.translator, u150.defaultSystemTextChannel)
			elseif p17.Status == Enum.TextChatMessageStatus.InvalidPrivacySettings then
				displaySystemMessage("CoreScripts.TextChat.MessageStatus.Warning.InvalidPrivacySettings", nil, "Roblox.MessageStatus.Warning.InvalidPrivacySettings", u150.translator, u150.defaultSystemTextChannel)
			elseif p17.Status == Enum.TextChatMessageStatus.MessageTooLong then
				displaySystemMessage("CoreScripts.TextChat.MessageStatus.Warning.MessageTooLong", nil, "Roblox.MessageStatus.Warning.MessageTooLong", u150.translator, u150.defaultSystemTextChannel)
			elseif p17.Status == Enum.TextChatMessageStatus.ModerationTimeout then
				displaySystemMessage("CoreScripts.TextChat.MessageStatus.Warning.ModerationTimeout", nil, "Roblox.MessageStatus.Warning.ModerationTimeout", u150.translator, u150.defaultSystemTextChannel)
			elseif p17.Status == Enum.TextChatMessageStatus.Unknown then
				displaySystemMessage("CoreScripts.TextChat.MessageStatus.Warning.Unknown", nil, "Roblox.MessageStatus.Warning.Unknown", u150.translator, u150.defaultSystemTextChannel)
			end

			if shouldSendHighFrequencyTelemetry(v97) then
				Analytics:TelemetryLogEvent(t1, {
					messageStatus = p17.Status.Name
				}, {
					"addOsInfo",
					"addSessionId",
					"addUniverseId",
					"addPlaceId"
				})
			end
		end)
	end

	for _, v in pairs(TextChatService:GetDescendants()) do
		if v:IsA("TextChannel") then
			handleMessageReceived(v)
		elseif v:IsA("TextChatCommand") then
			v.Triggered:Connect(function() -- line: 891
				-- upvalues: Analytics (copy), v (copy)
				Analytics.FireClientAnalyticsWithEventName("CommandSent", {
					commandName = v.Name
				})
			end)
		end
	end

	local u168 = false
	local t7 = {}

	local function tryShowSummarySystemMessageOnChannel(p18) -- line: 909
		-- upvalues: u168 (ref), t7 (copy), displaySystemMessage (copy), u150 (ref), summaryMessageRichText (copy)
		if not p18 then
			return
		end

		if not u168 then
			return
		end

		if t7[p18.Name] then
			return
		end

		if p18.Name ~= "RBXGeneral" then
			return
		end

		t7[p18.Name] = true
		displaySystemMessage("CoreScripts.TextChat.ChatWindow.SummarySystemMessage", nil, "Roblox.Summary.Info", u150.translator, p18, "Roblox auto-generates summaries of players' messages.", function(s2: string) -- line: 934
			-- upvalues: summaryMessageRichText (copy)
			return summaryMessageRichText.wrapInSummaryMutedStyle(`{ summaryMessageRichText.getSummaryIconPrefix() } { s2 }`)
		end)
	end

	TextChatService.DescendantAdded:Connect(function(descendant) -- line: 943
		-- upvalues: handleMessageReceived (copy), FFlagEnableInExpChatSummaryOnLua (copy), FFlagEnableClientSummarySystemMessageOnLua (copy), tryShowSummarySystemMessageOnChannel (copy), Analytics (copy)
		if descendant:IsA("TextChannel") then
			handleMessageReceived(descendant)

			if FFlagEnableInExpChatSummaryOnLua and FFlagEnableClientSummarySystemMessageOnLua then
				tryShowSummarySystemMessageOnChannel(descendant)

				return
			end
		elseif descendant:IsA("TextChatCommand") then
			descendant.Triggered:Connect(function() -- line: 891
				-- upvalues: Analytics (copy), descendant (copy)
				Analytics.FireClientAnalyticsWithEventName("CommandSent", {
					commandName = descendant.Name
				})
			end)
		end
	end)
	TextChatService.DescendantRemoving:Connect(function(descendant) -- line: 954
		-- upvalues: v151 (copy), TextChannelRemoved (copy), FFlagExpChatUseChannelTabsStore (copy), v153 (copy)
		if descendant:IsA("TextChannel") then
			v151:dispatch(TextChannelRemoved(descendant))

			if FFlagExpChatUseChannelTabsStore and v153 then
				v153.handleChannelRemoved(descendant)
			end
		end
	end)

	if FFlagEnableInExpChatSummaryOnLua then
		TextChatService.ChatActionReceived:Connect(function(p19) -- line: 965
			-- upvalues: v35 (copy), TextChatMessageChatActionType (copy), _processIncomingMessageCore (copy)
			v35:debug("Incoming ChatActionReceived ChatActionType: {}, Text: {}", p19.ChatActionType, p19.Text)

			if p19.ChatActionType == TextChatMessageChatActionType.Summary then
				_processIncomingMessageCore(p19, nil, nil)

				return
			end

			v35:error("Unknown ChatActionType: {}", p19.ChatActionType)
		end)
	end

	if FFlagEnableInExpChatSummaryOnLua then
		coroutine.wrap(function() -- line: 981
			-- upvalues: RobloxReplicatedStorage (copy), v35 (copy), LocalPlayer (copy), FFlagEnableClientSummarySystemMessageOnLua (copy), u168 (ref), TextChatService (copy), tryShowSummarySystemMessageOnChannel (copy)
			local ExpChatFeatureValueChanged = RobloxReplicatedStorage:WaitForChild("ExpChatFeatureValueChanged", 10)

			if ExpChatFeatureValueChanged then
				ExpChatFeatureValueChanged.OnClientEvent:Connect(function(n2: number, s3: string, s4: string) -- line: 984
					-- upvalues: v35 (copy), LocalPlayer (copy), FFlagEnableClientSummarySystemMessageOnLua (copy), u168 (ref), TextChatService (copy), tryShowSummarySystemMessageOnChannel (copy)
					v35:debug("Incoming ExpChatFeatureValueChanged userId: {}, featureName: {}, featureValue: {}", n2, s3, s4)

					if LocalPlayer and (n2 == LocalPlayer.UserId and FFlagEnableClientSummarySystemMessageOnLua and s3 == "EligibleForThirdPartySummary") then
						u168 = s4 == "true"

						if u168 then
							for _, v331 in TextChatService:GetDescendants() do
								if v331:IsA("TextChannel") then
									tryShowSummarySystemMessageOnChannel(v331)
								end
							end
						end
					end
				end)
			end
		end)()
	end

	TextChatService.SendingMessage:Connect(function(message) -- line: 1013
		-- upvalues: FFlagExpChatPerfTracking (copy), ExpChatPerfTracker (copy), v35 (copy), LocalPlayer (copy), handleChannelWelcomeMessage (copy), displaySystemMessage (copy), u150 (ref), FFlagExpChatUseMessagesStore (copy), v152 (copy), v151 (copy), OutgoingMessageSent (copy), Analytics (copy), countParticipantsInTextChannel (copy)
		if FFlagExpChatPerfTracking then
			ExpChatPerfTracker.start(ExpChatPerfTracker.Events.MessageSendToWindowRenderInterval, {
				messageId = message.MessageId
			})
		end

		v35:debug("Outgoing SendingMessage Status: {} Text: {}", message.Status.Name, message.Text)

		if LocalPlayer then
			local v242 = handleChannelWelcomeMessage(message, LocalPlayer)

			if v242 and v242.key then
				displaySystemMessage(v242.key, v242.args, v242.metadata, u150.translator, message.TextChannel)
			end
		end

		if FFlagExpChatUseMessagesStore then
			v152.handleIncomingOrOutgoingMessage(message, true)
		else
			v151:dispatch(OutgoingMessageSent(message))
		end

		local TextChannel = message.TextChannel

		if TextChannel then
			Analytics.FireClientAnalyticsWithEventName("MessageSent", {
				channelName = TextChannel.Name,
				totalParticipants = countParticipantsInTextChannel(TextChannel)
			})
		end
	end)

	if GetFFlagTextChatEnableUniverseChatTabs() then
		TextChatService.SendingUniverseChatMessage:Connect(function(p20) -- line: 1053
			-- upvalues: FFlagExpChatPerfTracking (copy), ExpChatPerfTracker (copy), v35 (copy), LocalPlayer (copy), handleChannelWelcomeMessage (copy), displaySystemMessage (copy), u150 (ref), TextChatService (copy), FFlagExpChatUseMessagesStore (copy), v152 (copy), v151 (copy), OutgoingMessageSent (copy), FFlagExpChatUseChannelTabsStore (copy), v153 (copy), Analytics (copy), countParticipantsInTextChannel (copy)
			if FFlagExpChatPerfTracking then
				ExpChatPerfTracker.start(ExpChatPerfTracker.Events.MessageSendToWindowRenderInterval, {
					messageId = p20.MessageId
				})
			end

			v35:debug("Outgoing SendingMessage Status: {} Text: {}", p20.Status.Name, p20.Text)

			if LocalPlayer then
				local v245 = handleChannelWelcomeMessage(p20, LocalPlayer)

				if v245 and v245.key then
					displaySystemMessage(v245.key, v245.args, v245.metadata, u150.translator, p20.TextChannel)
				end
			end

			local ChatInputBarConfiguration = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
			local v247 = if ChatInputBarConfiguration and ChatInputBarConfiguration.TargetTextChannel then nil else "RBXGlobal"

			if FFlagExpChatUseMessagesStore then
				v152.handleIncomingOrOutgoingMessage(p20, true, v247)
			else
				v151:dispatch(OutgoingMessageSent(p20, v247))
			end

			if FFlagExpChatUseChannelTabsStore and v153 then
				v153.handleIncomingOrOutgoingMessage(p20, true, v247)
			end

			local TextChannel = p20.TextChannel

			if TextChannel then
				Analytics.FireClientAnalyticsWithEventName("MessageSent", {
					channelName = TextChannel.Name,
					totalParticipants = countParticipantsInTextChannel(TextChannel)
				})
			end
		end)
	end

	if getFFlagExpChatEnableChannelTabsUI() then
		local ChannelTabsConfiguration = TextChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
		local v172 = not not ChannelTabsConfiguration and ChannelTabsConfiguration.Enabled
		local v173 = GetFFlagTextChatEnableUniverseChatTabs() and not v172

		for _, v in pairs(TextChatService:GetDescendants()) do
			if v.Parent and v.Parent:IsA("TextChannel") and (v and (v:IsA("TextSource") and (Players.LocalPlayer and Players.LocalPlayer.UserId == v.UserId))) then
				v151:dispatch(LocalTextChannelParticipantAdded(v.Parent))

				if FFlagExpChatUseChannelTabsStore and v153 then
					local ParentName = v.Parent.Name

					if ParentName ~= "RBXSystem" and (not v173 or ParentName == "RBXGeneral") then
						local v177 = ParentName ~= "RBXGeneral" and 2 or 1

						if GetFFlagTextChatEnableUniverseChatTabs() then
							v177 = if ParentName ~= "RBXGeneral" then ParentName ~= "RBXGlobal" and 3 or 2 else 1
						end

						v153.addChannelTab(ParentName, v177)
					end
				end
			end

			if v:IsA("TextChannel") then
				v.DescendantRemoving:Connect(function(descendant) -- line: 1150
					-- upvalues: Players (copy), v151 (copy), LocalTextChannelParticipantRemoved (copy), v (copy), FFlagExpChatUseChannelTabsStore (copy), v153 (copy)
					if descendant and (descendant:IsA("TextSource") and (Players.LocalPlayer and Players.LocalPlayer.UserId == descendant.UserId)) then
						v151:dispatch(LocalTextChannelParticipantRemoved(v))

						if FFlagExpChatUseChannelTabsStore and v153 then
							local vName = v.Name

							v153.removeChannelTab(vName)
						end
					end
				end)
			end
		end

		TextChatService.DescendantAdded:Connect(function(descendant) -- line: 1164
			-- upvalues: Players (copy), v151 (copy), LocalTextChannelParticipantAdded (copy), FFlagExpChatUseChannelTabsStore (copy), v153 (copy), v173 (copy), GetFFlagTextChatEnableUniverseChatTabs (copy), LocalTextChannelParticipantRemoved (copy)
			if descendant.Parent and (descendant.Parent:IsA("TextChannel") and (descendant and (descendant:IsA("TextSource") and (Players.LocalPlayer and Players.LocalPlayer.UserId == descendant.UserId)))) then
				v151:dispatch(LocalTextChannelParticipantAdded(descendant.Parent))

				if FFlagExpChatUseChannelTabsStore and v153 then
					local ParentName = descendant.Parent.Name

					if ParentName ~= "RBXSystem" and (not v173 or ParentName == "RBXGeneral") then
						local v255 = ParentName ~= "RBXGeneral" and 2 or 1

						if GetFFlagTextChatEnableUniverseChatTabs() then
							v255 = if ParentName ~= "RBXGeneral" then ParentName ~= "RBXGlobal" and 3 or 2 else 1
						end

						v153.addChannelTab(ParentName, v255)
					end
				end
			end

			if descendant:IsA("TextChannel") then
				descendant.DescendantRemoving:Connect(function(descendant2) -- line: 1189
					-- upvalues: Players (copy), v151 (copy), LocalTextChannelParticipantRemoved (copy), descendant (copy), FFlagExpChatUseChannelTabsStore (copy), v153 (copy)
					if descendant2 and (descendant2:IsA("TextSource") and (Players.LocalPlayer and Players.LocalPlayer.UserId == descendant2.UserId)) then
						v151:dispatch(LocalTextChannelParticipantRemoved(descendant))

						if FFlagExpChatUseChannelTabsStore and v153 then
							local descendantName = descendant.Name

							v153.removeChannelTab(descendantName)
						end
					end
				end)
			end
		end)
	end

	if GetFFlagTextChatEnableUniverseChatTabs() then
		local t8 = {}

		local function handleUniverseChatChannelAllocated(s5: string) -- line: 1208
			-- upvalues: t8 (copy), TextChatService (copy), v151 (copy), UniverseChatChannelAdded (copy), FFlagExpChatUseChannelTabsStore (copy), v153 (copy), GetFFlagEnableExpChatUniverseChatTabNames (copy), u150 (ref), FFlagExpChatUseMessagesStore (copy), v152 (copy), GetFFlagExpChatSuppressWelcomeMessageTabUnread (copy), UniverseChatSystemMessageAdded (copy)
			if t8[s5] then
				return
			end

			t8[s5] = true

			local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
			local ChatInputBarConfiguration = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
			local v259 = not ChatWindowConfiguration or ChatWindowConfiguration.Enabled ~= false
			local v260 = not ChatInputBarConfiguration or ChatInputBarConfiguration.Enabled ~= false

			if not v259 or not v260 then
				return
			end

			local s6 = ""

			if s5 == "global" then
				s6 = "RBXGlobal"
			end

			v151:dispatch(UniverseChatChannelAdded(s6, if s6 ~= "RBXGeneral" then s6 ~= "RBXGlobal" and 3 or 2 else 1))

			if FFlagExpChatUseChannelTabsStore and v153 then
				v153.addChannelTab(s6, if s6 ~= "RBXGeneral" then s6 ~= "RBXGlobal" and 3 or 2 else 1)
			end

			if GetFFlagEnableExpChatUniverseChatTabNames() and s6 ~= "" then
				local ok, result = pcall(function() -- line: 1235
					-- upvalues: u150 (ref)
					return u150.translator:FormatByKey("CoreScripts.TextChat.ChatWindow.ChatEnabled.Global2")
				end)

				if ok and result and result ~= "" then
					if FFlagExpChatUseMessagesStore and v152 then
						if GetFFlagExpChatSuppressWelcomeMessageTabUnread() then
							v152.addSystemMessage(result, s6, "Roblox.Welcome.GlobalChat")
						else
							v152.addSystemMessage(result, s6)
						end

						if FFlagExpChatUseChannelTabsStore and v153 and not GetFFlagExpChatSuppressWelcomeMessageTabUnread() then
							v153.markChannelUnread(s6)

							return
						end
					else
						if GetFFlagExpChatSuppressWelcomeMessageTabUnread() then
							v151:dispatch(UniverseChatSystemMessageAdded(result, s6, "Roblox.Welcome.GlobalChat"))

							return
						end

						v151:dispatch(UniverseChatSystemMessageAdded(result, s6))
					end
				end
			end
		end

		if TextChatService:HasAllocatedUniverseChatContext("global") then
			handleUniverseChatChannelAllocated("global")
		end

		TextChatService.UniverseChatChannelAllocated:Connect(handleUniverseChatChannelAllocated)
		TextChatService.UniverseChatMessageReceived:Connect(function(p21) -- line: 1287
			-- upvalues: GetFFlagExpChatGlobalMuteCommandEnabled (copy), shouldFilterGlobalMessage (copy), GetGlobalMutedUsersStore (copy), LocalPlayer (copy), FFlagChatLineReportingGlobalMuteEnabled (copy), _processIncomingMessageCore (copy)
			if GetFFlagExpChatGlobalMuteCommandEnabled() and shouldFilterGlobalMessage(p21, GetGlobalMutedUsersStore(false), LocalPlayer and LocalPlayer.UserId) then
				return
			end

			if FFlagChatLineReportingGlobalMuteEnabled then
				local t9 = {
					channelNameOverride = "RBXGlobal",
					isUniverseChat = true
				}

				_processIncomingMessageCore(p21, t9 and t9.channelNameOverride, t9 and t9.isUniverseChat)

				return
			end

			_processIncomingMessageCore(p21, "RBXGlobal", nil)
		end)
	end

	local function runOnBubbleDisplayed(p22, s7: string, p23) -- line: 1310
		-- upvalues: Players (copy), HttpService (copy), FFlagExpChatUseMessagesStore (copy), v152 (copy), v151 (copy), IncomingBubbleChatMessageReceived (copy)
		local player = nil

		if p22:IsA("Model") then
			player = Players:GetPlayerFromCharacter(p22)
		end

		local guid = HttpService:GenerateGUID(false)
		local BubbleChatMessageProperties = nil
		local Translation = nil

		if p23 then
			guid = p23.MessageId
			BubbleChatMessageProperties = p23.BubbleChatMessageProperties
			Translation = p23.Translation
		end

		local dateTime = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000)
		local t10 = {
			message = s7,
			translation = Translation,
			bubbleChatMessageId = guid,
			bubbleChatMessageUserId = player and tostring(player.UserId) or nil,
			partOrModel = p22,
			timestamp = dateTime,
			bubbleChatMessageProperties = BubbleChatMessageProperties
		}

		if FFlagExpChatUseMessagesStore then
			v152.handleIncomingBubbleChatMessage(t10)

			return
		end

		v151:dispatch(IncomingBubbleChatMessageReceived(t10))
	end

	Chat.Chatted:Connect(function(message, p24) -- line: 1343
		-- upvalues: TextChatService (copy), Chat (copy), runOnBubbleDisplayed (copy)
		if TextChatService.ChatVersion ~= Enum.ChatVersion.LegacyChatService or Chat.BubbleChatEnabled then
			runOnBubbleDisplayed(message, p24)
		end
	end)
	Chat:GetPropertyChangedSignal("BubbleChatEnabled"):Connect(function() -- line: 1350
		-- upvalues: Chat (copy), v151 (copy), LegacyBubbleChatEnabledChanged (copy)
		local BubbleChatEnabled = Chat.BubbleChatEnabled

		v151:dispatch(LegacyBubbleChatEnabledChanged("Enabled", BubbleChatEnabled))
	end)

	local BubbleChatEnabled = Chat.BubbleChatEnabled

	v151:dispatch(LegacyBubbleChatEnabledChanged("Enabled", BubbleChatEnabled))
	Chat.BubbleChatSettingsChanged:Connect(function(p25) -- line: 1359
		-- upvalues: u150 (ref), FFlagExpChatUseMessagesStore (copy), v154 (copy), v151 (copy), LegacyBubbleChatSettingsChanged (copy)
		if u150.validateLegacyBubbleChatSettings then
			local v279, v280 = u150.validateLegacyBubbleChatSettings(p25)

			assert(v279, "Bad settings object passed to Chat:SetBubbleChatSettings:\n inside consolidated BubbleChat " .. (v280 or ""))

			if FFlagExpChatUseMessagesStore and v154 then
				v154.setBubbleChatSettings(p25)

				return
			end

			v151:dispatch(LegacyBubbleChatSettingsChanged(p25))
		end
	end)

	if getEngineFeatureFlagEnableDisplayBubble() then
		TextChatService.BubbleDisplayed:Connect(function(p26, p27) -- line: 1377
			-- upvalues: FFlagExpChatDisableUniverseBubbleChat (copy), GetFFlagTextChatEnableUniverseChatTabs (copy), runOnBubbleDisplayed (copy)
			if FFlagExpChatDisableUniverseBubbleChat and (GetFFlagTextChatEnableUniverseChatTabs() and p27 and p27.TextChannel == nil) then
				return
			end

			runOnBubbleDisplayed(p26, p27 and p27.Text, p27)
		end)
	end

	local function findCommandInstance(s8: string) -- line: 1390
		-- upvalues: TextChatService (copy)
		for _, v in ipairs(TextChatService:GetDescendants()) do
			if s8 == v.Name and v:IsA("TextChatCommand") then
				return v
			end
		end

		return nil
	end

	local t11 = {}

	local function setupTextChatCommands() -- line: 1401
		-- upvalues: Commands (copy), findCommandInstance (copy), t11 (copy), FFlagExpChatUseMessagesStore (copy), v151 (copy), context (copy), displaySystemMessage (copy), u150 (ref), CommandAliasChanged (copy)
		for _, v in ipairs(Commands.enabledCommands) do
			if v.clientRun then
				local v288 = findCommandInstance(v.name)

				if v288 and not t11[v288] then
					t11[v288] = true
					v288.Triggered:Connect(function(p28, ...) -- line: 1412
						-- upvalues: FFlagExpChatUseMessagesStore (copy), v (copy), v151 (copy), context (copy), displaySystemMessage (copy), u150 (ref)
						local v340 = if not FFlagExpChatUseMessagesStore then v.clientRun(v151, p28.UserId, ...) else v.clientRun(v151, p28.UserId, ..., context)

						if v340 then
							displaySystemMessage(v340.key, v340.args, v340.metadata, u150.translator, u150.defaultSystemTextChannel)
						end
					end)

					if string.find(v288.Name, "RBXTeamCommand") or string.find(v288.Name, "RBXWhisperCommand") then
						for _, v290 in {
							"PrimaryAlias",
							"SecondaryAlias"
						} do
							v288:GetPropertyChangedSignal(v290):Connect(function() -- line: 1435
								-- upvalues: v151 (copy), CommandAliasChanged (copy), v288 (copy)
								v151:dispatch(CommandAliasChanged(v288.Name, v288.PrimaryAlias, v288.SecondaryAlias))
							end)
						end
					end
				end
			end
		end
	end

	setupTextChatCommands()
	Chat:GetPropertyChangedSignal("IsAutoMigrated"):Once(setupTextChatCommands)

	if u150.canUserChatAsync and Players.LocalPlayer then
		Promise.try(function() -- line: 1455
			-- upvalues: u150 (ref), Players (copy)
			return u150.canUserChatAsync(Players.LocalPlayer.UserId)
		end):andThen(function(p29) -- line: 1458
			-- upvalues: FFlagExpChatUseMessagesStore (copy), v152 (copy), v151 (copy), ChatPrivacySettingsReceived (copy)
			if FFlagExpChatUseMessagesStore then
				v152.setCanLocalUserChat(p29)

				return
			end

			v151:dispatch(ChatPrivacySettingsReceived(p29))
		end):catch(function() -- line: 1465
			-- upvalues: FFlagExpChatUseMessagesStore (copy), v152 (copy), v151 (copy), ChatPrivacySettingsFetchFailed (copy)
			if FFlagExpChatUseMessagesStore then
				v152.setCanLocalUserChat(false)

				return
			end

			v151:dispatch(ChatPrivacySettingsFetchFailed())
		end)
	end

	watchPlayersService(u150, v151, v152)

	local AppStyleProvider = UIBlox.App.Style.AppStyleProvider
	local Constants = UIBlox.App.Style.Constants
	local Dark = Constants.ThemeName.Dark
	local Gotham = Constants.FontName.Gotham
	local t12 = {
		Dark = {
			themeName = Dark,
			fontName = Gotham
		}
	}
	local v190 = Roact.createElement(AppStyleProvider, {
		style = t12.Dark
	}, {
		app = Roact.createElement(App, {
			store = v151,
			translator = u150.translator,
			gameTranslator = if not getFFlagExpChatEnableChannelTabsUI() then nil else u150.gameTranslator,
			isChatWindowVisible = true,
			isChatInputBarVisible = true,
			isChannelBarVisible = false,
			isDefaultChatEnabled = true,
			getIconVoiceIndicator = u150.getIconVoiceIndicator,
			onClickedVoiceIndicator = u150.onClickedVoiceIndicator,
			onClickedCameraIndicator = u150.onClickedCameraIndicator,
			selfViewListenerChanged = u150.selfViewListenerChanged,
			getPermissions = u150.getPermissions,
			displayCameraDeniedToast = u150.displayCameraDeniedToast,
			isCamEnabledForUserAndPlace = u150.isCamEnabledForUserAndPlace,
			isCameraOnlyUser = u150.isCameraOnlyUser,
			isVoiceServiceInitialized = u150.isVoiceServiceInitialized,
			onClickedLikelySpeakingBubble = u150.onClickedLikelySpeakingBubble,
			isSpatialUIEnabled = u150.isSpatialUIEnabled,
			expChatLoadStartTime = if not getFFlagExpChatTelemetryEventTrigger() then nil else os.clock()
		})
	})

	v151:dispatch(ClientAppLoaded({
		team = Players.LocalPlayer and Players.LocalPlayer.Team,
		isChatCoreGuiEnabled = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Chat),
		isTouchEnabled = UserInputService.TouchEnabled,
		isGamepadEnabled = UserInputService.PreferredInput == Enum.PreferredInput.Gamepad
	}))
	reportVersionLoaded(Analytics, Version[1])
	v35:trace("Roact.mount to {}", (tostring(u150.parent)))

	local v191 = Roact.mount(v190, u150.parent, "ExperienceChat")

	local function updateChatStatus(p30) -- line: 1525
		-- upvalues: v155 (copy), isChatRegionLocked (copy), displaySystemMessage (copy), v98 (copy), u150 (ref), canPlatformEnableChat (copy), GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled (copy), n1 (ref), FIntMaxExpChatUnlockChatButtonImpressionsCount (copy), canOnlyChatInRegion (copy), FFlagConnectionsToFriendsRename (copy)
		v155.setChatStatus(p30)

		if p30 == "GeoBlocked" or p30 ~= "Unknown" and isChatRegionLocked() then
			displaySystemMessage(not v98 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionUnavailable" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionIsntAvailable", nil, "Roblox.ChatDisabled.Info", u150.translator, u150.defaultSystemTextChannel, not v98 and "You can only view system messages here. Chat is not available in your region." or "You can only view system messages here. Chat isn’t available in your region.")

			return
		end

		if p30 == "AgeCheckGateExperiment" then
			displaySystemMessage("CoreScripts.TextChat.ChatWindow.ChatDisabled.CheckAgeInAccountInfo", nil, "Roblox.ChatDisabled.Info", u150.translator, u150.defaultSystemTextChannel, "You can only view system messages here. Unlock chat with an age check at Settings > Account info.")

			return
		end

		if p30 == "SettingsDisabled" then
			displaySystemMessage(not v98 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.SettingOff" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.DontMissMessagesUpdateCommsSettings", nil, "Roblox.ChatDisabled.Info", u150.translator, u150.defaultSystemTextChannel, not v98 and "You can only view system messages here. Update your Communication settings to turn on chat." or "You can only view system messages here. Update your communication settings to turn on chat.")

			return
		end

		if p30 == "SettingsDisabledVpc" then
			displaySystemMessage("CoreScripts.TextChat.ChatWindow.ChatDisabled.AskForPermission", nil, "Roblox.ChatDisabled.Info", u150.translator, u150.defaultSystemTextChannel, "You can only view system messages here. Ask your parent for permission to chat in Communication settings.")

			return
		end

		if p30 == "AgeCheckVpc" then
			displaySystemMessage("CoreScripts.TextChat.ChatWindow.ChatDisabled.AskForPermissionToAgeCheck", nil, "Roblox.ChatDisabled.Info", u150.translator, u150.defaultSystemTextChannel, "You can only view system messages here. Ask your parent for permission to age check in Communication settings.")

			return
		end

		if not canPlatformEnableChat() and p30 == "AgeVerificationRequired" or p30 == "IdVerificationRequired" then
			displaySystemMessage(not v98 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.CheckAgeInSettings" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.GetAnAgeCheckInCommsSetting", nil, "Roblox.ChatDisabled.Info", u150.translator, u150.defaultSystemTextChannel, not v98 and "You can only view system messages here. To chat, get an age check in your Communication settings." or "Don’t miss messages. Unlock chat with an age check in your communication settings.")

			return
		end

		if p30 == "AgeVerificationRequired" then
			if GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled() and n1 > FIntMaxExpChatUnlockChatButtonImpressionsCount then
				displaySystemMessage("CoreScripts.TextChat.ChatWindow.ChatDisabled.GetAnAgeCheckInCommsSetting", nil, "Roblox.ChatDisabled.Info", u150.translator, u150.defaultSystemTextChannel, "Don’t miss messages. Unlock chat with an age check in your communication settings.")

				return
			end

			displaySystemMessage(not v98 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.GetAnAgeCheck" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.DontMissMessages", nil, "Roblox.ChatDisabled.Info", u150.translator, u150.defaultSystemTextChannel, not v98 and "You can only view system messages here. Get an age check to chat." or "Don’t miss messages. Unlock chat with an age check.")

			return
		end

		if p30 == "EnabledBubble" or p30 == "Enabled" and canOnlyChatInRegion() then
			displaySystemMessage("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatInRegion", nil, "Roblox.ChatEnabled.Info", u150.translator, u150.defaultSystemTextChannel, "You can view system messages and chat with users in your region only.")

			return
		end

		if p30 == "Enabled" then
			displaySystemMessage(not FFlagConnectionsToFriendsRename and "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAndTC" or "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAAndTF", nil, "Roblox.ChatEnabled.Info", u150.translator, u150.defaultSystemTextChannel, "Only people in similar age groups and your Trusted Connections can chat with you.")

			return
		end

		if p30 == "AllUsers" or p30 == "NoOne" then
			if getChatTranslationEnabled() then
				displaySystemMessage("CoreScripts.TextChat.ChatTranslation.ChatWindow.SystemMessageNew", nil, "Roblox.ChatTranslation.ChatWindow.SystemMessage", u150.translator, u150.defaultSystemTextChannel, "Roblox automatically translates supported languages in chat")

				return
			end
		elseif p30 == "Ineligible" or p30 ~= "Unknown" then
			displaySystemMessage("CoreScripts.TextChat.ChatWindow.ChatDisabled.OnlyViewSystemMessages", nil, "Roblox.ChatDisabled.Info", u150.translator, u150.defaultSystemTextChannel, "You can only view system messages here.")
		end
	end

	local n3 = 0
	local u194 = math.random(v99, v100)

	local function handleUserMessageIntentSent(p31) -- line: 1696
		-- upvalues: v35 (copy), FFlagExpChatUseMessagesStore (copy), v152 (copy), v151 (copy), HiddenMessageReceived (copy), isUserChatEnabled (copy), LocalPlayer (copy), n3 (ref), u194 (ref), v99 (copy), v100 (copy), displaySystemMessage (copy), u150 (ref), GetTransparencyStore (copy)
		v35:debug("Handling a message from UserMessageIntentSent")

		if FFlagExpChatUseMessagesStore then
			v152.handleHiddenMessageReceived(p31)
		else
			v151:dispatch(HiddenMessageReceived(p31))
		end

		if not isUserChatEnabled(LocalPlayer.ChatAvailabilityStatus) then
			n3 += 1

			if n3 == u194 then
				u194 += math.random(v99, v100)
				displaySystemMessage("CoreScripts.TextChat.ChatWindow.ChatDisabled.DontMissMessages", nil, "Roblox.ChatDisabled.Info", u150.translator, u150.defaultSystemTextChannel, "Don’t miss messages. Unlock chat with an age check.")
			end
		end

		GetTransparencyStore(false).resetTextTransparency()
	end

	if FFlagAEGIS2EnableGatesForExpChat and LocalPlayer then
		if FFlagEnableModerateChatRemoteEvent then
			local v196 = getExperienceChatVisualConfig()
			local v197 = GetChatModerationStore(false)
			local u198 = false

			u150.moderateChatStoreDisposeEffect = Signals.createEffect(function(p32) -- line: 1746
				-- upvalues: v197 (copy), u198 (ref), displaySystemMessage (copy), u150 (ref), NotificationModalsManager (copy), UIBlox (copy), v196 (copy), FFlagConnectionsToFriendsRename (copy)
				local v297 = v197.getIsSettingEnabled(p32)

				if v297 ~= u198 then
					if v297 then
						displaySystemMessage("CoreScripts.TextChat.MessageStatus.Warning.ModerateChatOn", nil, "Roblox.MessageStatus.Warning.ModerateChatOn", u150.translator, u150.defaultSystemTextChannel)
						NotificationModalsManager.SetUIBloxToast({
							iconImage = UIBlox.App.ImageSet.Images[v196.icon.off],
							toastSubtitle = u150.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOn.Subtitle"),
							toastTitle = u150.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOn.Title")
						})
					else
						displaySystemMessage("CoreScripts.TextChat.MessageStatus.Warning.ModerateChatOff", nil, "Roblox.MessageStatus.Warning.ModerateChatOff", u150.translator, u150.defaultSystemTextChannel)
						NotificationModalsManager.SetUIBloxToast({
							iconImage = UIBlox.App.ImageSet.Images[v196.icon.off],
							toastSubtitle = u150.translator:FormatByKey(not FFlagConnectionsToFriendsRename and "CoreScripts.TextChat.Toast.ModerateChatOff.Subtitle" or "CoreScripts.TextChat.Toast.ModerateChatOff.Subtitle.FriendsRename"),
							toastTitle = u150.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOff.Title")
						})
					end

					u198 = v297
				end
			end)
		end

		local ChatAvailabilityStatus = LocalPlayer.ChatAvailabilityStatus

		v35:debug("Local player's initial ChatAvailabilityStatus is {}", ChatAvailabilityStatus)
		updateChatStatus(ChatAvailabilityStatus)

		local connection = nil
		local v201 = FFlagExpChatEnableFOMOUpsell and shouldShowFOMOUpsell()
		local v202 = FFlagExpChatEnableCrossAgeChatActivity and shouldShowCrossAgeChatActivity()

		if if not GetFFlagExpChatUserMessageIntentSentCooldown() then v201 or v202 else v202 or v201 and v105 >= n1 then
			v35:debug("Connecting to UserMessageIntentSent")
			connection = TextChatService.UserMessageIntentSent:Connect(handleUserMessageIntentSent)
		end

		LocalPlayer:GetPropertyChangedSignal("ChatAvailabilityStatus"):Connect(function() -- line: 1809
			-- upvalues: ChatAvailabilityStatus (ref), LocalPlayer (copy), v35 (copy), updateChatStatus (copy), FFlagExpChatEnableFOMOUpsell (copy), shouldShowFOMOUpsell (copy), FFlagExpChatEnableCrossAgeChatActivity (copy), shouldShowCrossAgeChatActivity (copy), GetFFlagExpChatUserMessageIntentSentCooldown (copy), n1 (ref), v105 (copy), connection (ref), TextChatService (copy), handleUserMessageIntentSent (copy), isUserChatEnabled (copy), FFlagExpChatClearHiddenMessagesPostAgeCheck (copy), FFlagExpChatUseMessagesStore (copy), v152 (copy), v151 (copy), HiddenMessagesCleared (copy), GetTransparencyStore (copy), ChatPrivacySettingsReceived (copy)
			ChatAvailabilityStatus = LocalPlayer.ChatAvailabilityStatus
			v35:debug("Local player's ChatAvailabilityStatus has changed to {}", ChatAvailabilityStatus)
			updateChatStatus(ChatAvailabilityStatus)

			local v298 = FFlagExpChatEnableFOMOUpsell and shouldShowFOMOUpsell()
			local v299 = FFlagExpChatEnableCrossAgeChatActivity and shouldShowCrossAgeChatActivity()

			if ((if not GetFFlagExpChatUserMessageIntentSentCooldown() then v298 or v299 else v299 or v298 and n1 <= v105)) and not connection then
				v35:debug("Connecting to UserMessageIntentSent")
				connection = TextChatService.UserMessageIntentSent:Connect(handleUserMessageIntentSent)
			end

			if FFlagExpChatEnableFOMOUpsell and isUserChatEnabled(ChatAvailabilityStatus) and connection and (not FFlagExpChatEnableCrossAgeChatActivity or not shouldShowCrossAgeChatActivity()) then
				v35:debug("Disconnecting from UserMessageIntentSent")
				connection:Disconnect()

				if FFlagExpChatClearHiddenMessagesPostAgeCheck then
					if FFlagExpChatUseMessagesStore then
						v152.handleHiddenMessagesCleared()
					else
						v151:dispatch(HiddenMessagesCleared())
					end

					GetTransparencyStore(false).resetTextTransparency()
				end
			end

			if FFlagExpChatUseMessagesStore then
				v152.setCanLocalUserChat(isUserChatEnabled(ChatAvailabilityStatus))

				return
			end

			v151:dispatch(ChatPrivacySettingsReceived(isUserChatEnabled(ChatAvailabilityStatus)))
		end)
	elseif isChatRegionLocked() then
		displaySystemMessage(not v98 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionUnavailable" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionIsntAvailable", nil, "Roblox.ChatDisabled.Info", u150.translator, u150.defaultSystemTextChannel, not FFlagAEGIS2EnableGatesForExpChat and "Chat is unavailable in your region. You can still receive system messages." or (not v98 and "You can only view system messages here. Chat is currently unavailable in your region." or "You can only view system messages here. Chat isn’t available in your region."))
	elseif not FFlagAEGIS2EnableGatesForExpChat and getChatTranslationEnabled() then
		displaySystemMessage("CoreScripts.TextChat.ChatTranslation.ChatWindow.SystemMessageNew", nil, "Roblox.ChatTranslation.ChatWindow.SystemMessage", u150.translator, u150.defaultSystemTextChannel, "Roblox automatically translates supported languages in chat")
	end

	return {
		roactInstance = v191
	}
end
