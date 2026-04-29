local Chat = game:GetService("Chat")
local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

game:GetService("StarterGui")

local TextChatService = game:GetService("TextChatService")
local RobloxGui = CoreGui.RobloxGui
local VoiceChatCore = require(CorePackages.Workspace.Packages.VoiceChatCore)
local Rodux = require(CorePackages.Packages.Rodux)
local chatReducer = require(RobloxGui.Modules.InGameChat.BubbleChat.Reducers.chatReducer)
local SetMessageText = require(RobloxGui.Modules.InGameChat.BubbleChat.Actions.SetMessageText)
local AddMessageFromEvent = require(RobloxGui.Modules.InGameChat.BubbleChat.Actions.AddMessageFromEvent)
local AddMessageWithTimeout = require(RobloxGui.Modules.InGameChat.BubbleChat.Actions.AddMessageWithTimeout)
local UpdateChatSettings = require(RobloxGui.Modules.InGameChat.BubbleChat.Actions.UpdateChatSettings)
local BubbleChatEnabledChanged = require(RobloxGui.Modules.InGameChat.BubbleChat.Actions.BubbleChatEnabledChanged)
local VoiceEnabledChanged = require(RobloxGui.Modules.VoiceChat.Actions.VoiceEnabledChanged)
local ParticipantsChanged = require(RobloxGui.Modules.VoiceChat.Actions.ParticipantsChanged)
local VoiceStateChanged = require(RobloxGui.Modules.VoiceChat.Actions.VoiceStateChanged)
local ParticipantAdded = require(RobloxGui.Modules.VoiceChat.Actions.ParticipantAdded)
local ParticipantRemoved = require(RobloxGui.Modules.VoiceChat.Actions.ParticipantRemoved)
local PlayerRemoved = require(RobloxGui.Modules.VoiceChat.Actions.PlayerRemoved)
local getPlayerFromPart = require(RobloxGui.Modules.InGameChat.BubbleChat.Helpers.getPlayerFromPart)
local validateMessage = require(RobloxGui.Modules.InGameChat.BubbleChat.Helpers.validateMessage)
local Constants = require(RobloxGui.Modules.InGameChat.BubbleChat.Constants)
local Types = require(RobloxGui.Modules.InGameChat.BubbleChat.Types)
local BlockingUtility = require(CorePackages.Workspace.Packages.BlockingUtility)
local GameTranslator = require(RobloxGui.Modules.GameTranslator)
local default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local initVoiceChatStore = require(RobloxGui.Modules.VoiceChat.initVoiceChatStore)
local GetFFlagEnableVoiceChatVoiceUISync = require(RobloxGui.Modules.Flags.GetFFlagEnableVoiceChatVoiceUISync)
local GetFFlagLocalMutedNilFix = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLocalMutedNilFix
local GetFFlagBatchVoiceParticipantsUpdates = VoiceChatCore.Flags.GetFFlagBatchVoiceParticipantsUpdates
local getFFlagExpChatAlwaysRunTCS = require(CorePackages.Workspace.Packages.SharedFlags).getFFlagExpChatAlwaysRunTCS
local GetFFlagExpChatUseVoiceParticipantsStore = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagExpChatUseVoiceParticipantsStore
local _ = require(CorePackages.Workspace.Packages.SharedFlags).FFlagExpChatUseMessagesStore
local FFlagExpChatUseChatConfigStore = require(CorePackages.Workspace.Packages.SharedFlags).FFlagExpChatUseChatConfigStore
local ExpChat = require(CorePackages.Workspace.Packages.ExpChat)
local v38 = require(RobloxGui.Modules.InGameChat.BubbleChat.Logger)(script.Name)
local v39 = if not GetFFlagExpChatUseVoiceParticipantsStore() then nil else ExpChat.Stores.GetVoiceStore(false)
local t1 = {
	[VoiceEnabledChanged.name] = function(p1) -- line: 68
		-- upvalues: ExpChat (copy)
		ExpChat.Events.VoiceEnabledChanged(p1.enabled)
	end,
	[VoiceStateChanged.name] = function(p2) -- line: 72
		-- upvalues: GetFFlagExpChatUseVoiceParticipantsStore (copy), v39 (copy), ExpChat (copy)
		if GetFFlagExpChatUseVoiceParticipantsStore() then
			v39.handleVoiceStateChanged(p2.userId, p2.newState)

			return
		end

		ExpChat.Events.VoiceStateChanged(p2.userId, p2.newState)
	end,
	[ParticipantsChanged.name] = function(p3) -- line: 80
		-- upvalues: GetFFlagExpChatUseVoiceParticipantsStore (copy), v39 (copy), ExpChat (copy)
		if GetFFlagExpChatUseVoiceParticipantsStore() then
			v39.handleVoiceParticipantsChanged(p3.newParticipants)

			return
		end

		ExpChat.Events.VoiceParticipantsChanged(p3.newParticipants)
	end,
	[ParticipantAdded.name] = not GetFFlagExpChatUseVoiceParticipantsStore() and function(p4) -- line: 91
		-- upvalues: ExpChat (copy)
		ExpChat.Events.VoiceParticipantAdded(p4.userId)
	end or nil,
	[ParticipantRemoved.name] = not GetFFlagExpChatUseVoiceParticipantsStore() and function(p5) -- line: 98
		-- upvalues: ExpChat (copy)
		ExpChat.Events.VoiceParticipantRemoved(p5.userId)
	end or nil
}
local u41 = Rodux.Store.new(chatReducer, nil, {
	Rodux.thunkMiddleware,
	function(p6) -- line: 103
		-- upvalues: t1 (copy)
		return function(p7) -- line: 104
			-- upvalues: t1 (copy), p6 (copy)
			local v88 = t1[p7.type]

			if v88 then
				v88(p7)
			end

			p6(p7)
		end
	end
})
local connection = nil

if game:IsLoaded() and (not not getFFlagExpChatAlwaysRunTCS() or TextChatService.ChatVersion == Enum.ChatVersion.TextChatService) then
	return
end

connection = game.Loaded:Connect(function() -- line: 131
	-- upvalues: connection (ref)
	if game:IsLoaded() then
		connection:Disconnect()
	end
end)

local function validateMessageWithWarning(p8, p9) -- line: 138
	-- upvalues: validateMessage (copy), Constants (copy)
	local v65, v66 = validateMessage(p9)

	if not v65 then
		if v66 then
			warn(("Message text %q is too long for chat event %q (expected a message of length %i, got %i)"):format(p9, p8, Constants.MAX_MESSAGE_LENGTH, v66))

			return v65
		end

		warn(("Message text %q sent to chat event %q is not a valid UTF-8 characters sequence"):format(p9, p8))
	end

	return v65
end

local connection2 = nil
local connection3 = nil
local connection4 = nil
local u47 = nil
local u48 = nil
local n1 = 0
local n2 = 0
local t2 = {}

local function initBubbleChat() -- line: 167
	-- upvalues: ReplicatedStorage (copy), connection2 (ref), Types (copy), Players (copy), validateMessageWithWarning (copy), u41 (ref), AddMessageFromEvent (copy), connection3 (ref), SetMessageText (copy), getPlayerFromPart (copy), t2 (copy), n1 (ref), GameTranslator (copy), CoreGui (copy), AddMessageWithTimeout (copy), n2 (ref), connection4 (ref), Chat (copy)
	coroutine.resume(coroutine.create(function() -- line: 168
		-- upvalues: ReplicatedStorage (copy), connection2 (ref), Types (copy), Players (copy), validateMessageWithWarning (copy), u41 (ref), AddMessageFromEvent (copy), connection3 (ref), SetMessageText (copy)
		local DefaultChatSystemChatEvents = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents", 1e999)

		connection2 = DefaultChatSystemChatEvents:WaitForChild("OnNewMessage", 1e999).OnClientEvent:Connect(function(p10) -- line: 176
			-- upvalues: Types (copy), Players (copy), validateMessageWithWarning (copy), u41 (ref), AddMessageFromEvent (copy)
			local v113, v114 = Types.IMessageData(p10)

			if not v113 then
				warn(("Malformed message data sent to chat event %q. If you have modified the chat system, check what you are firing to this event"):format("OnNewMessage"))
				warn(v114)
			end

			if not v113 then
				return
			end

			if p10.FromSpeaker == Players.LocalPlayer.Name then
				if not validateMessageWithWarning("OnNewMessage", p10.Message) then
					return
				end

				local v115 = table.clone(p10)

				v115.Time = workspace:GetServerTimeNow() * 1000
				u41:dispatch(AddMessageFromEvent(v115))
			end
		end)
		connection3 = DefaultChatSystemChatEvents:WaitForChild("OnMessageDoneFiltering", 1e999).OnClientEvent:Connect(function(p11) -- line: 194
			-- upvalues: Types (copy), validateMessageWithWarning (copy), u41 (ref), SetMessageText (copy), AddMessageFromEvent (copy)
			local v117, v118 = Types.IMessageData(p11)

			if not v117 then
				warn(("Malformed message data sent to chat event %q. If you have modified the chat system, check what you are firing to this event"):format("OnMessageDoneFiltering"))
				warn(v118)
			end

			if not v117 or not validateMessageWithWarning("OnMessageDoneFiltering", p11.Message) then
				return
			end

			local str = tostring(p11.ID)

			if u41:getState().messages[str] then
				u41:dispatch(SetMessageText(str, p11.Message))

				return
			end

			local v120 = table.clone(p11)

			v120.Time = workspace:GetServerTimeNow() * 1000
			u41:dispatch(AddMessageFromEvent(v120))
		end)
	end))

	local function addMessageWithId(p12, p13, p14) -- line: 213
		-- upvalues: getPlayerFromPart (copy), t2 (copy), n1 (ref), GameTranslator (copy), CoreGui (copy), u41 (ref), AddMessageWithTimeout (copy)
		local v93 = if not p12:IsA("Model") then p12 else if not p12.PrimaryPart then p12:FindFirstChildWhichIsA("BasePart", true) else p12.PrimaryPart
		local v94 = nil

		if v93 then
			v94 = getPlayerFromPart(v93)
		end

		local str

		if v94 then
			str = tostring(v94.UserId)
		else
			str = t2[p12]

			if str then
			else
				n1 += 1
				str = "adornee_" .. n1
				t2[p12] = str
			end
		end

		local t3 = {
			id = "chatted_" .. p14,
			userId = str,
			name = p12.Name,
			text = GameTranslator:TranslateGameText(CoreGui, p13),
			timestamp = os.time(),
			adornee = p12
		}

		u41:dispatch(AddMessageWithTimeout(t3))
	end

	connection4 = Chat.Chatted:Connect(function(message, p15) --[[ addMessage ]] -- line: 256
		-- upvalues: n2 (ref), addMessageWithId (copy)
		n2 += 1
		addMessageWithId(message, p15, n2)
	end)
end
local function destroyBubbleChat() -- line: 264
	-- upvalues: connection2 (ref), connection3 (ref), connection4 (ref), u48 (ref), u47 (ref)
	if connection2 then
		connection2:Disconnect()
		connection2 = nil
	end

	if connection3 then
		connection3:Disconnect()
		connection3 = nil
	end

	if connection4 then
		connection4:Disconnect()
		connection4 = nil
	end

	if u48 then
		u48:Disconnect()
		u48 = nil
	end

	if u47 then
		u47:Disconnect()
		u47 = nil
	end
end

local t4 = {}

local function setVoiceEnabled(p16) -- line: 300
	-- upvalues: Players (copy), u41 (ref), VoiceEnabledChanged (copy), t4 (ref), v38 (copy), VoiceStateChanged (copy), Constants (copy), GetFFlagLocalMutedNilFix (copy), default (copy)
	local str = tostring(Players.LocalPlayer.UserId)
	local v75 = p16 ~= Enum.VoiceChatState.Ended

	u41:dispatch(VoiceEnabledChanged(v75))

	if not t4[p16] then
		v38:warning("LOCAL_STATE_MAP does not exist for {} state", p16)
		u41:dispatch(VoiceStateChanged(str, Constants.VOICE_STATE.MUTED))
	else
		u41:dispatch(VoiceStateChanged(str, t4[p16]))
	end

	if p16 == Enum.VoiceChatState.Failed then
		for _, v in pairs(Players:GetPlayers()) do
			local str2 = tostring(v.UserId)

			if v ~= Players.LocalPlayer then
				u41:dispatch(VoiceStateChanged(str2, Constants.VOICE_STATE.HIDDEN))
			end
		end

		return
	end

	if p16 == Enum.VoiceChatState.Joined and if not GetFFlagLocalMutedNilFix then not default.localMuted else default.localMuted == false then
		u41:dispatch(VoiceStateChanged(str, Constants.VOICE_STATE.INACTIVE))
	end
end

if game:GetEngineFeature("EnableBubbleChatFromChatService") then
	Chat:GetPropertyChangedSignal("BubbleChatEnabled"):Connect(function() --[[ onBubbleChatEnabledChanged ]] -- line: 288
		-- upvalues: destroyBubbleChat (copy), Chat (copy), initBubbleChat (copy), u41 (ref), BubbleChatEnabledChanged (copy)
		destroyBubbleChat()

		local v72 = not game:GetEngineFeature("EnableBubbleChatFromChatService") or Chat.BubbleChatEnabled

		if v72 then
			initBubbleChat()
		end

		u41:dispatch(BubbleChatEnabledChanged(v72))
	end)
end

destroyBubbleChat()

local v56 = not game:GetEngineFeature("EnableBubbleChatFromChatService") or Chat.BubbleChatEnabled

if v56 then
	initBubbleChat()
end

u41:dispatch(BubbleChatEnabledChanged(v56))

if game:GetEngineFeature("BubbleChatSettingsApi") then
	Chat.BubbleChatSettingsChanged:Connect(function(p17) -- line: 444
		-- upvalues: Types (copy), FFlagExpChatUseChatConfigStore (copy), ExpChat (copy), u41 (ref), UpdateChatSettings (copy)
		local v85, v86 = Types.IChatSettings(p17)

		assert(v85, "Bad settings object passed to Chat:SetBubbleChatSettings:\n" .. (v86 or ""))

		if FFlagExpChatUseChatConfigStore then
			ExpChat.Stores.GetChatConfigurationStore(false).setBubbleChatSettings(p17)

			return
		end

		u41:dispatch(UpdateChatSettings(p17))
	end)
end

default:asyncInit():andThen(function() --[[ initVoiceChat ]] -- line: 335
	-- upvalues: GetFFlagEnableVoiceChatVoiceUISync (copy), initVoiceChatStore (copy), u41 (ref), v38 (copy), default (copy), t4 (ref), Constants (copy), Players (copy), ParticipantAdded (copy), PlayerRemoved (copy), ParticipantRemoved (copy), VoiceStateChanged (copy), GetFFlagBatchVoiceParticipantsUpdates (copy), ParticipantsChanged (copy), BlockingUtility (copy), setVoiceEnabled (copy)
	if GetFFlagEnableVoiceChatVoiceUISync() then
		initVoiceChatStore(u41)

		return
	end

	v38:debug("Initializing VoiceChatService connections")

	local v80 = default:getService()

	if not v80 then
		v38:debug("VoiceChatService is not available")

		return
	end

	if not Enum.VoiceChatState then
		v38:error("Enum.VoiceChatState does not exist but voice is enabled")

		return
	end

	t4 = {
		[Enum.VoiceChatState.Idle] = Constants.VOICE_STATE.HIDDEN,
		[Enum.VoiceChatState.Joining] = Constants.VOICE_STATE.CONNECTING,
		[Enum.VoiceChatState.JoiningRetry] = Constants.VOICE_STATE.CONNECTING,
		[Enum.VoiceChatState.Joined] = Constants.VOICE_STATE.MUTED,
		[Enum.VoiceChatState.Leaving] = Constants.VOICE_STATE.MUTED,
		[Enum.VoiceChatState.Ended] = Constants.VOICE_STATE.HIDDEN,
		[Enum.VoiceChatState.Failed] = Constants.VOICE_STATE.ERROR
	}

	local UserId = Players.LocalPlayer.UserId

	for _, v in pairs(Players:GetPlayers()) do
		v38:trace("Adding existing player {}", "..." .. string.sub(tostring(v.UserId), -4))
		u41:dispatch(ParticipantAdded((tostring(v.UserId))))
	end

	Players.PlayerAdded:Connect(function(player) -- line: 371
		-- upvalues: v38 (copy), u41 (ref), ParticipantAdded (copy)
		v38:trace("Adding joining player {}", "..." .. string.sub(tostring(player.UserId), -4))
		u41:dispatch(ParticipantAdded((tostring(player.userId))))
	end)
	Players.PlayerRemoving:Connect(function(player) -- line: 376
		-- upvalues: v38 (copy), u41 (ref), PlayerRemoved (copy), ParticipantRemoved (copy)
		v38:trace("Removing player {}", "..." .. string.sub(tostring(player.UserId), -4))
		u41:dispatch(PlayerRemoved((tostring(player.userId))))
		u41:dispatch(ParticipantRemoved((tostring(player.userId))))
	end)
	u41:dispatch(VoiceStateChanged(UserId, Constants.VOICE_STATE.HIDDEN))
	default.muteChanged.Event:connect(function(p18) -- line: 385
		-- upvalues: v38 (copy), Constants (copy), u41 (ref), VoiceStateChanged (copy), UserId (copy)
		v38:debug("Mute changed to {}", p18)

		local v102 = p18 and Constants.VOICE_STATE.MUTED or Constants.VOICE_STATE.INACTIVE

		u41:dispatch(VoiceStateChanged(UserId, v102))
	end)
	default.participantsUpdate.Event:Connect(function(p19) -- line: 391
		-- upvalues: GetFFlagBatchVoiceParticipantsUpdates (copy), u41 (ref), ParticipantsChanged (copy), Constants (copy), v38 (copy), VoiceStateChanged (copy)
		if GetFFlagBatchVoiceParticipantsUpdates() then
			u41:dispatch(ParticipantsChanged(p19))

			return
		end

		for k, v in pairs(p19) do
			local INACTIVE = Constants.VOICE_STATE.INACTIVE

			if not v.subscriptionCompleted then
				INACTIVE = Constants.VOICE_STATE.CONNECTING
			elseif v.isMutedLocally then
				INACTIVE = Constants.VOICE_STATE.LOCAL_MUTED
			elseif v.isMuted then
				INACTIVE = Constants.VOICE_STATE.MUTED
			elseif v.isSignalActive then
				INACTIVE = Constants.VOICE_STATE.TALKING
			end

			v38:trace("Participant update for {}, voice state {}", "..." .. string.sub(tostring(k), -4), INACTIVE)
			u41:dispatch(VoiceStateChanged(k, INACTIVE))
		end
	end)
	default.talkingChanged.Event:Connect(function(p20) -- line: 413
		-- upvalues: u41 (ref), VoiceStateChanged (copy), UserId (copy), Constants (copy)
		if p20 then
			u41:dispatch(VoiceStateChanged(UserId, Constants.VOICE_STATE.TALKING))

			return
		end

		u41:dispatch(VoiceStateChanged(UserId, Constants.VOICE_STATE.INACTIVE))
	end)
	BlockingUtility:GetBlockedStatusChangedEvent():Connect(function(p21, p22) -- line: 422
		-- upvalues: u41 (ref), ParticipantRemoved (copy), ParticipantAdded (copy)
		if p22 then
			u41:dispatch(ParticipantRemoved((tostring(p21))))

			return
		end

		u41:dispatch(ParticipantAdded((tostring(p21))))
	end)
	v38:debug("Initial voice state is {}", v80.VoiceChatState)
	setVoiceEnabled(v80.VoiceChatState)
	v80.StateChanged:Connect(function(_, newState) -- line: 432
		-- upvalues: v38 (copy), setVoiceEnabled (copy)
		v38:debug("Voice state changed to {}", newState)
		setVoiceEnabled(newState)
	end)
end):catch(function() -- line: 459
	-- upvalues: v38 (copy)
	v38:debug("VoiceChatServiceManager failed to initialize")
end)
