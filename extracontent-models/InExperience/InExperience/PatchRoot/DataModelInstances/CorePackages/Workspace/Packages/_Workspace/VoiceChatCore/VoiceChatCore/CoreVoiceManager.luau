local ParentParent = script.Parent.Parent
local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")
local SoundService = game:GetService("SoundService")
local VoiceChatService = game:GetService("VoiceChatService")
local HttpService = game:GetService("HttpService")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local AppStorageService = game:GetService("AppStorageService")
local NotificationService = game:GetService("NotificationService")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local IXPServiceWrapper = require(ParentParent.IXPServiceWrapper).IXPServiceWrapper
local Players2 = game:GetService("Players")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local ThirdPartyUserService = game:GetService("ThirdPartyUserService")
local AdService = game:GetService("AdService")
local Chat = game:GetService("Chat")
local Constants = require(script.Parent.Constants)
local Utils = require(script.Parent.Utils)
local Flags = script.Parent.Flags
local Analytics = require(script.Parent.Analytics)
local Requests = script.Parent.Requests
local Promise = require(ParentParent.Promise)
local Cryo = require(ParentParent.Cryo)
local default = require(ParentParent.CallProtocol).CallProtocol.default
local Enums = require(ParentParent.CallProtocol).Enums
local PermissionsProtocol = require(ParentParent.PermissionsProtocol).PermissionsProtocol
local BlockingUtility = require(ParentParent.BlockingUtility)
local v29 = require(ParentParent.CoreScriptsInitializer).CoreLogger:new(script.Name)
local v30 = require(Flags.GetFFlagOverwriteIsMutedLocally)()
local v31 = require(Flags.GetFFlagReceiveLikelySpeakingUsers)()
local v32 = require(Flags.GetFFlagUseAudioInstanceAdded)()
local v33 = require(Flags.GetFFlagSetActiveWhenConnecting)()
local v34 = require(Flags.GetFFlagUpdateDeviceInputPlayerChanged)()
local v35 = game:DefineFastFlag("StringKeyFixForParticipantsTable", false)
local v36 = game:DefineFastFlag("ShowJoinVoiceRaceConditionFix", false)
local v37 = game:DefineFastFlag("ConsoleVoiceIXPEnabled", false)
local v38 = game:DefineFastString("ConsoleVoiceIXPLayerName", "User.Communication.ConsoleVoice")
local v39 = game:DefineFastString("ConsoleVoiceEnabledIXPLayerValue", "ConsoleVoiceEnabled")
local v40 = game:DefineFastFlag("TalkingChangedWithDebounce", false)
local v41 = game:DefineFastInt("TalkingChangedDebounceTime", 300)
local v42 = game:DefineFastFlag("SendVoiceCapturedDuringVideoCaptureEvent", false)
local GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice = require(ParentParent.SharedFlags).GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice
local GetFFlagLuaConsumePlayerModerated = require(Flags.GetFFlagLuaConsumePlayerModerated)
local GetFFlagEnableLuaVoiceChatAnalytics = require(Flags.GetFFlagEnableLuaVoiceChatAnalytics)
local GetFFlagUseLuaSignalrConsumer = require(Flags.GetFFlagUseLuaSignalrConsumer)
local GetFFlagLocalMutedNilFix = require(ParentParent.SharedFlags).GetFFlagLocalMutedNilFix
local GetFFlagEnableVoiceNudge = require(Flags.GetFFlagEnableVoiceNudge)
local GetFFlagEnableVoiceReverseNudge = require(Flags.GetFFlagEnableVoiceReverseNudge)
local GetFFlagClearUserFromRecentVoiceDataOnLeave = require(Flags.GetFFlagClearUserFromRecentVoiceDataOnLeave)
local GetFIntVoiceUsersInteractionExpiryTimeSeconds = require(Flags.GetFIntVoiceUsersInteractionExpiryTimeSeconds)
local GetFFlagAvatarChatServiceEnabled = require(ParentParent.SharedFlags).GetFFlagAvatarChatServiceEnabled
local GetFFlagVoiceChatServiceManagerUseAvatarChat = require(Flags.GetFFlagVoiceChatServiceManagerUseAvatarChat)
local GetFFlagJoinWithoutMicPermissions = require(ParentParent.SharedFlags).GetFFlagJoinWithoutMicPermissions
local GetFFlagBatchVoiceParticipantsUpdates = require(Flags.GetFFlagBatchVoiceParticipantsUpdates)
local GetFIntThrottleParticipantsUpdateMs = require(Flags.GetFIntThrottleParticipantsUpdateMs)
local GetFFlagSeamlessVoiceFTUX = require(ParentParent.SharedFlags).GetFFlagSeamlessVoiceFTUX
local GetFFlagNonVoiceFTUX = require(ParentParent.SharedFlags).GetFFlagNonVoiceFTUX
local GetFFlagEnableFtuxExitOnMuteToggle = require(Flags.GetFFlagEnableFtuxExitOnMuteToggle)
local GetFFlagEnableExpJoinMicPermAnalytics = require(Flags.GetFFlagEnableExpJoinMicPermAnalytics)
local GetFFlagEnableSeamlessVoiceFeature = require(Flags.GetFFlagEnableSeamlessVoiceFeature)
local v62 = game:DefineFastString("VoicePerformanceThrottlingIXPLayerName", "Voice.Performance")
local v63 = game:DefineFastString("ThrottleParticipantsUpdateIXPLayerValue", "ThrottleParticipantsUpdate")
local v64 = game:DefineFastFlag("PollLikelySpeakingV2", false)
local GetFFlagShowLikelySpeakingBubbles = require(ParentParent.SharedFlags).GetFFlagShowLikelySpeakingBubbles
local v66 = game:DefineFastFlag("UseAudioAnalyzerForLocalMetering2", false)
local v67 = game:DefineFastFlag("StopModerationConnectionOnLeave", false)
local v68 = game:DefineFastFlag("DisableRejoinGroupIdDoubleRead", false)
local EngineFeature = game:GetEngineFeature("EnableMutedByLocalUser")
local EngineFeature2 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local GetFFlagEnableVoiceChatMuteForVideoCaptures = require(ParentParent.SharedFlags).GetFFlagEnableVoiceChatMuteForVideoCaptures
local v72 = v42 and GetFFlagEnableVoiceChatMuteForVideoCaptures()
local GetFFlagEnableVoiceSignal = require(ParentParent.SharedFlags).GetFFlagEnableVoiceSignal
local GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints = require(ParentParent.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints
local GetFFlagVoiceChatClientRewriteMasterLua = require(ParentParent.SharedFlags).GetFFlagVoiceChatClientRewriteMasterLua
local GetFFlagCheckUniversePlaceBeforeSuspending = require(ParentParent.SharedFlags).GetFFlagCheckUniversePlaceBeforeSuspending
local GetFFlagEnableSeamlessVoiceV2 = require(ParentParent.SharedFlags).GetFFlagEnableSeamlessVoiceV2
local GetFFlagDisconnectToastClientRewrite = require(ParentParent.SharedFlags).GetFFlagDisconnectToastClientRewrite
local FFlagEnablePartyVoiceChangersInLua = require(ParentParent.SharedFlags).FFlagEnablePartyVoiceChangersInLua
local GetFFlagEnableVoiceUxUpdates = require(ParentParent.SharedFlags).GetFFlagEnableVoiceUxUpdates
local WATCHED_NAMESPACES = Constants.WATCHED_NAMESPACES
local WATCHED_MESSAGE_TYPES = Constants.WATCHED_MESSAGE_TYPES
local VOICE_CHAT_AVAILABILITY = Constants.VOICE_CHAT_AVAILABILITY
local MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED = Constants.MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED
local MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY = Constants.MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY
local PERMISSION_STATE = Constants.PERMISSION_STATE
local VOICE_JOIN_PROGRESS = Constants.VOICE_JOIN_PROGRESS
local FAE_ENABLED = Constants.FAE_ENABLED
local FAE_SETTINGS_TOAST = Constants.FAE_SETTINGS_TOAST
local GetShowAgeVerificationOverlay = require(Requests.GetShowAgeVerificationOverlay)
local GetShowPhoneVerificationUpsell = require(Requests.GetShowPhoneVerificationUpsell)
local t1 = {
	eventName = "VoiceCapturedDuringVideoCapture",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("VoiceCapturedDuringVideoCaptureThrottlingPercentage", 10000),
	lastUpdated = {
		26,
		1,
		28
	},
	description = "Event fired when a video capture has stopped logging if voice was captured",
	links = ""
}
local v93 = if not GetFFlagAvatarChatServiceEnabled() then nil else game:GetService("AvatarChatService")
local v94 = if not GetFFlagEnableVoiceChatMuteForVideoCaptures() then nil else game:GetService("CaptureService")
local v95 = if not v72 then nil else game:GetService("TelemetryService")
local t2 = {
	available = nil,
	canUseServicePromise = nil,
	userEligible = false,
	participants = nil,
	localMuted = nil,
	isVoiceChangerActive = false,
	isVoiceChangerHearMyselfActive = false,
	currentVoicePack = nil,
	isTalking = false,
	previousGroupId = nil,
	muteAll = false,
	previousMutedState = nil,
	permissionPromise = nil,
	hasOptedToJoinVoiceOnAgeVerification = false,
	permissionState = if not GetFFlagJoinWithoutMicPermissions() then nil else PERMISSION_STATE.IDLE,
	recentUsersInteractionData = nil,
	NotificationService = NotificationService,
	PermissionsService = PermissionsProtocol.default,
	ChatService = Chat,
	voiceEnabled = false,
	LikelySpeakingUsersEvent = nil,
	ReceiveLikelySpeakingUsersEvent = nil,
	service = nil,
	SignalREventTable = {},
	isInCall = false,
	callMutedState = false,
	audioDeviceInputAdded = nil,
	muteChanged = Instance.new("BindableEvent"),
	voiceChangerChanged = Instance.new("BindableEvent"),
	voiceChangerHearMyselfChanged = Instance.new("BindableEvent"),
	muteAllChanged = Instance.new("BindableEvent"),
	participantLeft = Instance.new("BindableEvent"),
	participantJoined = Instance.new("BindableEvent"),
	participantsUpdate = Instance.new("BindableEvent"),
	talkingChanged = Instance.new("BindableEvent"),
	_lastTalkingChangedFireTime = 0,
	attemptVoiceRejoin = Instance.new("BindableEvent"),
	onPlayerMuteToggled = Instance.new("BindableEvent"),
	setVoiceUIVisibility = Instance.new("BindableEvent"),
	communicationPermissionsResult = nil,
	VoiceJoinProgress = VOICE_JOIN_PROGRESS.Idle,
	VoiceJoinProgressChanged = Instance.new("BindableEvent"),
	mutedPlayers = {},
	voiceChangerActivePlayers = {},
	BlockStatusChanged = nil,
	AvatarChatService = v93,
	HttpRbxApiService = HttpRbxApiService,
	ThirdPartyUserService = ThirdPartyUserService,
	CaptureService = v94,
	TelemetryService = v95,
	SendMuteEvent = nil,
	SetVoicePackEvent = nil,
	VoiceChangerWasToggledEvent = nil,
	InputToModifierWire = nil,
	PartyVoiceDeviceInput = nil,
	_mutedAnyone = false,
	canUseServiceResult = nil,
	signalRConnectionChanged = nil,
	signalRConnection = nil,
	AdService = AdService,
	isPlayerWatchingAd = false,
	options = {
		allowSeamlessVoice = true,
		passInitErrorInPromiseReject = false,
		forceVoiceEnabled = false
	},
	initializedPostSuspension = false,
	voiceCapturedDuringVideoCapture = false
}

t2.__index = t2

function t2.new(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11) -- line: 302
	-- upvalues: Utils (copy), Analytics (copy), AppStorageService (copy), t2 (copy), GetFFlagUseLuaSignalrConsumer (copy), WATCHED_MESSAGE_TYPES (copy), GetFIntThrottleParticipantsUpdateMs (copy), Players2 (copy), v29 (copy), IXPServiceWrapper (copy), v62 (copy), v63 (copy)
	local v109 = setmetatable({
		previousSessionId = nil,
		HttpRbxApiService = p3,
		eventEmitter = Utils.EventEmitter.new(),
		service = p4,
		PermissionsService = p2,
		NotificationService = p6,
		AvatarChatService = p7,
		Analytics = Analytics.new(p5),
		SequenceNumbers = {},
		SignalREventTable = {},
		audioDevices = {},
		BlockStatusChanged = p1,
		AppStorageService = p8 or AppStorageService,
		ThirdPartyUserService = p9,
		CaptureService = p10,
		AdService = p11
	}, t2)

	if GetFFlagUseLuaSignalrConsumer() then
		for _, v111 in WATCHED_MESSAGE_TYPES do
			v109.SignalREventTable[v111] = Instance.new("BindableEvent")
		end
	end

	v109.shouldThrottleParticipantUpdate = false
	v109.participantsStateThrottleTime = 0
	v109.lastParticipantsStateUpdate = 0
	v109.lastStateUpdateCounter = 0

	if GetFIntThrottleParticipantsUpdateMs() > 0 then
		task.spawn(function() -- line: 346
			-- upvalues: Players2 (copy), p4 (copy), v29 (copy), IXPServiceWrapper (copy), v62 (copy)
			local ok, result = pcall(function() -- line: 347
				-- upvalues: Players2 (copy), p4 (copy)
				if Players2.LocalPlayer then
					return p4:IsVoiceEnabledForUserIdAsync(Players2.LocalPlayer.UserId)
				end

				return false
			end)

			if not ok then
				v29:debug("Unable to get voice enabled status: ", result)

				return
			end

			if result then
				IXPServiceWrapper:LogUserLayerExposure(v62)
			end
		end)
		v109.participantsStateThrottleTime = GetFIntThrottleParticipantsUpdateMs() / 1000

		local ok, result = pcall(function() -- line: 363
			-- upvalues: IXPServiceWrapper (copy), v62 (copy)
			return IXPServiceWrapper:GetLayerData(v62)
		end)

		if ok and result and result[v63] then
			v109.shouldThrottleParticipantUpdate = true
		end
	end

	return v109
end
function t2.emit(p12, p13, ...) -- line: 374
	p12.eventEmitter:emit(p13, ...)
end
function t2.subscribe(p14, p15, p16) -- line: 378
	p14.eventEmitter:addListener(p15, p16)
end
function t2.unsubscribeAll(p17) -- line: 382
	p17.eventEmitter:removeAllListeners()
end
function t2.CheckCallStateWithPromise(p18) -- line: 386
	-- upvalues: default (copy), v29 (copy), Enums (copy)
	return default:getCallState():andThen(function(p19) -- line: 388
		-- upvalues: v29 (copy), Enums (copy), p18 (copy)
		v29:trace("Got user call state")

		if p19.status ~= Enums.CallStatus.Idle.rawValue() and p19.status ~= Enums.CallStatus.Ringing.rawValue() then
			p18.isInCall = true
			p18.callMutedState = p19.muted
			v29:trace("Changing call muted state to {}", p19.muted)
		end
	end):catch(function(p20) -- line: 400
		-- upvalues: v29 (copy)
		v29:trace("User not in call {}", p20)
	end)
end
function t2.CheckCallState(p21) -- line: 406
	-- upvalues: v29 (copy), default (copy), Enums (copy)
	v29:trace("Checking user call state")

	local ok, result = pcall(function() -- line: 408
		-- upvalues: default (copy), v29 (copy), Enums (copy), p21 (copy)
		default:getCallState():andThen(function(p22) -- line: 410
			-- upvalues: v29 (copy), Enums (copy), p21 (copy)
			v29:trace("Got user call state")

			if p22.status ~= Enums.CallStatus.Idle.rawValue() and p22.status ~= Enums.CallStatus.Ringing.rawValue() then
				p21.isInCall = true
				p21.callMutedState = p22.muted
				v29:trace("Changing call muted state to {}", p22.muted)
			end
		end):catch(function(p23) -- line: 422
			-- upvalues: v29 (copy)
			v29:trace("User not in call {}", p23)
		end)
	end)

	if not ok then
		v29:debug("Error checking user call state {}", result)
	end
end
function t2._GetShowAgeVerificationOverlay(p24, p25) -- line: 441
	-- upvalues: GetShowAgeVerificationOverlay (copy), Utils (copy)
	return GetShowAgeVerificationOverlay(Utils.bind(p24, "GetRequest"), tostring(game.GameId), tostring(game.PlaceId), p25)
end
function t2.FetchAgeVerificationOverlay(p26, p27) -- line: 450
	-- upvalues: Promise (copy)
	if not p26._getShowAgeVerificationOverlayResult then
		if not p26._getShowAgeVerificationOverlayPromise then
			p26._getShowAgeVerificationOverlayPromise = Promise.new(function(p28, _) -- line: 453
				-- upvalues: p26 (copy), p27 (copy)
				p26._getShowAgeVerificationOverlayResult = p26:_GetShowAgeVerificationOverlay(p27)
				p28(p26._getShowAgeVerificationOverlayResult)
			end)
		end

		p26._getShowAgeVerificationOverlayPromise:await()
	end

	return p26._getShowAgeVerificationOverlayResult
end
function t2._GetShowPhoneVerificationUpsell(t3: {[any]: any}, s1: string, n1: number?) -- line: 469
	-- upvalues: GetShowPhoneVerificationUpsell (copy), Utils (copy)
	return (GetShowPhoneVerificationUpsell(Utils.bind(t3, "GetRequest"), tostring(game.GameId), s1, n1))
end
function t2.FetchPhoneVerificationUpsell(t4: {[any]: any}, s2: string, n2: number?, b1: boolean?) -- line: 482
	-- upvalues: Promise (copy), Constants (copy)
	if not t4._getShowPhoneVerificationUpsellResult then
		t4._getShowPhoneVerificationUpsellResult = {}
		t4._getShowPhoneVerificationUpsellPromise = {}
	end

	if not t4._getShowPhoneVerificationUpsellResult[s2] or b1 then
		if not t4._getShowPhoneVerificationUpsellPromise[s2] or b1 then
			t4._getShowPhoneVerificationUpsellPromise[s2] = Promise.new(function(p30, _) -- line: 493
				-- upvalues: t4 (copy), s2 (copy), n2 (copy), Constants (copy)
				local v436 = t4:_GetShowPhoneVerificationUpsell(s2, n2)

				t4._getShowPhoneVerificationUpsellResult[s2] = if type(v436) ~= "table" or v436.valueProp == nil then Constants.PHONE_UPSELL_VOICE_CHAT_PROP.None else v436.valueProp
				p30()
			end)
		end

		t4._getShowPhoneVerificationUpsellPromise[s2]:await()
	end

	return t4._getShowPhoneVerificationUpsellResult[s2]
end
function t2.DisablePhoneVerificationUpsell(p32) -- line: 507
	-- upvalues: Cryo (copy), Constants (copy)
	p32._getShowPhoneVerificationUpsellResult = Cryo.Dictionary.map(p32._getShowPhoneVerificationUpsellResult, function() -- line: 510
		-- upvalues: Constants (copy)
		return Constants.PHONE_UPSELL_VOICE_CHAT_PROP.None
	end)
end
function t2.GetNudgeAnalyticsData(p33) -- line: 516
	-- upvalues: Players (copy)
	return Players.LocalPlayer.UserId, p33:GetSessionId()
end
function t2.avatarChatUserAndPlaceSettingsValueOfClientFeatures(p34, p35) -- line: 521
	-- upvalues: GetFFlagEnableVoiceSignal (copy)
	local t5 = {
		isUniverseEnabledForVoice = p34.AvatarChatService:IsEnabled(p35, Enum.AvatarChatServiceFeature.UniverseAudio),
		isPlaceEnabledForVoice = p34.AvatarChatService:IsEnabled(p35, Enum.AvatarChatServiceFeature.PlaceAudio),
		isUniverseEnabledForAvatarVideo = p34.AvatarChatService:IsEnabled(p35, Enum.AvatarChatServiceFeature.UniverseVideo),
		isPlaceEnabledForAvatarVideo = p34.AvatarChatService:IsEnabled(p35, Enum.AvatarChatServiceFeature.PlaceVideo)
	}
	local t6 = {
		isUserEligible = p34.AvatarChatService:IsEnabled(p35, Enum.AvatarChatServiceFeature.UserAudioEligible),
		isVoiceEnabled = p34.AvatarChatService:IsEnabled(p35, Enum.AvatarChatServiceFeature.UserAudio),
		isAvatarVideoEligible = p34.AvatarChatService:IsEnabled(p35, Enum.AvatarChatServiceFeature.UserVideoEligible),
		isAvatarVideoEnabled = p34.AvatarChatService:IsEnabled(p35, Enum.AvatarChatServiceFeature.UserVideo),
		isUserVerifiedForVoice = if not GetFFlagEnableVoiceSignal() then nil else p34.AvatarChatService:IsEnabled(p35, Enum.AvatarChatServiceFeature.UserVerifiedForVoice),
		isBanned = p34.AvatarChatService:IsEnabled(p35, Enum.AvatarChatServiceFeature.UserBanned),
		bannedUntil = nil
	}

	return {
		universePlaceVoiceEnabledSettings = t5,
		voiceSettings = t6
	}
end
function t2.resolveAvatarChatUserAndPlaceSettings(p36) -- line: 568
	local ok, result = pcall(p36.AvatarChatService.GetClientFeaturesAsync, p36.AvatarChatService)

	if not ok then
		return nil
	end

	return p36:avatarChatUserAndPlaceSettingsValueOfClientFeatures(result)
end
function t2.GetRequest(p37, p38, _) -- line: 578
	-- upvalues: HttpService (copy)
	local ok, result = pcall(function() -- line: 579
		-- upvalues: p37 (copy), p38 (copy), HttpService (copy)
		local AsyncFullUrl = p37.HttpRbxApiService:GetAsyncFullUrl(p38, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players)

		return HttpService:JSONDecode(AsyncFullUrl)
	end)

	return ok and result
end
function t2.PostUserVoiceConnectionStatus(p40, p41) -- line: 587
	-- upvalues: HttpService (copy), Constants (copy)
	local ok, _ = pcall(function() -- line: 588
		-- upvalues: HttpService (copy), p41 (copy), p40 (copy), Constants (copy)
		local json = HttpService:JSONEncode({
			IsUserVoiceConnected = p41
		})
		local v439 = p40.HttpRbxApiService:PostAsyncFullUrl(Constants.VOICE_URL .. "/v1/user-voice-connection-state", json)

		return HttpService:JSONDecode(v439)
	end)

	return ok
end
function t2.GetVoiceAnalyticsData(p42) -- line: 597
	-- upvalues: EngineFeature2 (copy), RbxAnalyticsService (copy)
	return {
		universeId = game.GameId,
		placeId = game.PlaceId,
		playSessionId = not EngineFeature2 and "" or RbxAnalyticsService:GetPlaySessionId(),
		voiceSessionId = not p42.service and "" or p42:GetSessionId(),
		micAvailability = ""
	}
end
function t2.RecordExperienceJoinMicPermissionStatus(p43, p44) -- line: 609
	-- upvalues: PermissionsProtocol (copy), PERMISSION_STATE (copy)
	local VoiceAnalyticsData = p43:GetVoiceAnalyticsData()

	if p44 ~= nil and typeof(p44) == "table" then
		if p44.status == PermissionsProtocol.Status.AUTHORIZED then
			VoiceAnalyticsData.micAvailability = "Granted"
		else
			VoiceAnalyticsData.micAvailability = "Denied"
		end
	elseif p43.permissionState then
		if p43.permissionState == PERMISSION_STATE.LISTEN_AND_TALK then
			VoiceAnalyticsData.micAvailability = "Granted"
		else
			VoiceAnalyticsData.micAvailability = "Denied"
		end
	end

	p43.Analytics:reportVoiceEvents("experienceJoinDeviceMicPermissionEvent", VoiceAnalyticsData)
end
function t2.CheckCaptureMute(p45) -- line: 629
	-- upvalues: GetFFlagEnableVoiceChatMuteForVideoCaptures (copy)
	if GetFFlagEnableVoiceChatMuteForVideoCaptures() then
		return p45.CaptureService:IsCapturingVideo()
	end

	return false
end
function t2.ToggleMuteSome(t7: {[any]: any}, t8: {[any]: any}, b2: boolean, s3: string, s4: string) -- line: 638
	-- upvalues: VoiceChatService (copy), EngineFeature (copy), Players (copy)
	t7:ensureInitialized("mute some players")
	t7._mutedAnyone = true

	local t9 = {}
	local v164 = b2 or t7:CheckCaptureMute()

	for _, v166 in t8 do
		if VoiceChatService.UseNewAudioApi then
			t9[v166] = true
			t7.mutedPlayers[v166] = v164
		else
			t7.service:SubscribePause(v166, v164)
		end

		local v167 = t7.participants[tostring(v166)]

		if v167 then
			v167.isMutedLocally = v164
			t7.participantsUpdate:Fire(t7.participants)
		end
	end

	if VoiceChatService.UseNewAudioApi then
		for v168 in t7.audioDevices do
			if v168.Player and t9[v168.Player.UserId] then
				if EngineFeature and v168.Player ~= Players.LocalPlayer then
					v168.MutedByLocalUser = v164
				else
					if not EngineFeature then
					end

					v168.Active = not v164
				end
			end
		end
	end

	if s3 and s4 then
		t7.Analytics:reportVoiceMuteGroup((t7:JoinWithVoiceMuteData({
			groupType = s3,
			context = s4,
			muted = v164
		})))
	end
end
function t2.GetMutedAnyone(p46) -- line: 683
	return p46._mutedAnyone
end
function t2.ToggleMutePlayer(t10: {[any]: any}, n3: number, s5: string) -- line: 687
	-- upvalues: VoiceChatService (copy), v30 (copy), v29 (copy), Utils (copy), GetFFlagEnableFtuxExitOnMuteToggle (copy), EngineFeature (copy), Players (copy)
	t10:ensureInitialized("mute player " .. n3)
	t10._mutedAnyone = true

	local v173 = ((if not VoiceChatService.UseNewAudioApi or not v30 then not t10.service:IsSubscribePaused(n3) else not t10.mutedPlayers[n3])) or t10:CheckCaptureMute()

	v29:trace("Setting mute for {} to {}", Utils.shorten(n3), v173)

	if GetFFlagEnableFtuxExitOnMuteToggle() then
		t10.onPlayerMuteToggled:Fire()
	end

	if VoiceChatService.UseNewAudioApi then
		t10.mutedPlayers[n3] = v173

		for v174 in t10.audioDevices do
			if v174.Player and n3 == v174.Player.UserId then
				if EngineFeature and v174.Player ~= Players.LocalPlayer then
					v174.MutedByLocalUser = v173
				else
					if not EngineFeature then
					end

					local v175 = t10.participants[tostring(n3)]
					local v176 = v175 and not v175.isMuted

					v174.Active = not v173 and v176
				end
			end
		end

		t10:emit("OnPlayerMuted")
	else
		t10.service:SubscribePause(n3, v173)
	end

	for _, v in pairs(t10.participants) do
		if n3 == v.userId then
			v.isMutedLocally = v173
			t10.participantsUpdate:Fire(t10.participants)
		end
	end

	if s5 then
		t10.Analytics:reportVoiceMuteIndividual((t10:JoinWithVoiceMuteData({
			targetUserId = tonumber(n3),
			context = s5,
			muted = v173
		})))
	end
end
function t2.MuteAll(t11: {[any]: any}, b3: boolean, s6: string) -- line: 741
	-- upvalues: VoiceChatService (copy), v29 (copy), Players (copy), EngineFeature (copy), Constants (copy)
	t11:ensureInitialized("mute all")
	t11._mutedAnyone = true

	local v182 = b3 or t11:CheckCaptureMute()

	if VoiceChatService.UseNewAudioApi then
		t11.muteAll = v182
		v29:trace("Setting self mute all to {} context: {}", v182, s6)

		for v183 in t11.audioDevices do
			if v183.Player and v183.Player ~= Players.LocalPlayer then
				v29:debug("Local muting {} to '{} = {}'", v183.Player.Name, v183.Active, v182)

				if EngineFeature then
					v183.MutedByLocalUser = v182
				else
					local UserId = v183.Player.UserId

					t11.mutedPlayers[UserId] = v182

					local v185 = t11.participants[tostring(UserId)]
					local v186 = v185 and not v185.isMuted

					v183.Active = not v182 and v186
				end
			end
		end
	else
		t11.service:SubscribePauseAll(v182)
	end

	for _, v in pairs(t11.participants) do
		v.isMutedLocally = v182
		t11.participantsUpdate:Fire(t11.participants)
	end

	t11.muteAllChanged:Fire(v182)

	if s6 then
		t11.Analytics:reportVoiceMuteGroup((t11:JoinWithVoiceMuteData({
			groupType = Constants.VOICE_GROUP_TYPE.ALL,
			context = s6,
			muted = v182
		})))
	end
end
function t2.FetchVoicePermissions(p47) -- line: 784
	if not p47.communicationPermissionsResult then
		p47.communicationPermissionsResult = p47:resolveAvatarChatUserAndPlaceSettings()
	end

	return p47.communicationPermissionsResult
end
function t2.verifyUniverseAndPlaceCanUseVoice(p48) -- line: 792
	-- upvalues: GetFFlagAvatarChatServiceEnabled (copy), GetFFlagVoiceChatServiceManagerUseAvatarChat (copy), Analytics (copy)
	local v191 = if not GetFFlagAvatarChatServiceEnabled() or not GetFFlagVoiceChatServiceManagerUseAvatarChat() then p48:FetchAgeVerificationOverlay() else p48:resolveAvatarChatUserAndPlaceSettings()

	if not v191 then
		p48:_reportJoinFailed("invalidResponse", Analytics.ERROR)

		return false
	end

	local universePlaceVoiceEnabledSettings = v191.universePlaceVoiceEnabledSettings

	return universePlaceVoiceEnabledSettings and (universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice and universePlaceVoiceEnabledSettings.isUniverseEnabledForVoice)
end
function t2.IsUserInFTUX(p49) -- line: 812
	-- upvalues: GetFFlagSeamlessVoiceFTUX (copy), GetFFlagCheckUniversePlaceBeforeSuspending (copy), v29 (copy)
	if not GetFFlagSeamlessVoiceFTUX() then
		return false
	end

	if GetFFlagCheckUniversePlaceBeforeSuspending() and not p49:verifyUniverseAndPlaceCanUseVoice() then
		return false
	end

	local AppStorageService2 = game:GetService("AppStorageService")
	local u195 = nil

	if not pcall(function() -- line: 822
		-- upvalues: AppStorageService2 (copy), u195 (ref)
		u195 = AppStorageService2:GetItem("SeamlessVoiceFTUX") == "true"
	end) then
		v29:warning("Failed to read FTUX/STUX from AppStorage")

		return false
	end

	local v196 = p49:FetchAgeVerificationOverlay()

	if type(v196) == "table" and v196.voiceSettings and v196.voiceSettings.seamlessVoiceStatus ~= 3 then
		v29:debug("User not eligible for FTUX/STUX")

		return false
	end

	return not u195
end
function t2.isEnableDefaultVoiceOnForPlace(_) -- line: 845
	-- upvalues: VoiceChatService (copy)
	if not game:IsLoaded() then
		game.Loaded:Wait()
	end

	return VoiceChatService.UseNewAudioApi or VoiceChatService.EnableDefaultVoice
end
function t2.verifyPlaceCanUseVoice(p51, p52, p53) -- line: 856
	-- upvalues: Analytics (copy)
	if not p52 or not p53 then
		p51:_reportJoinFailed("invalidResponse", Analytics.ERROR)

		return false
	end

	if not p52.isUniverseEnabledForVoice then
		p51:_reportJoinFailed("universeNotEnabled")

		return false
	end

	p51:emit("OnUserAndPlaceCanUseVoiceResolved", p53, p52)

	if not p52.isPlaceEnabledForVoice then
		p51:_reportJoinFailed("placeNotEnabled")

		return false
	end

	if not p51:isEnableDefaultVoiceOnForPlace() then
		return false
	end

	return true
end
function t2.EligibleForFaeUpsell(p54) -- line: 881
	-- upvalues: FAE_ENABLED (copy)
	local v202 = p54:FetchAgeVerificationOverlay()

	if not v202 or type(v202) ~= "table" then
		return false
	end

	local v203 = v202.inExperienceFaeUpsell == FAE_ENABLED
	local isPlaceEnabledForVoice = v202.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice

	return v203 and isPlaceEnabledForVoice
end
function t2.OptUserToJoinVoice(p55) -- line: 891
	-- upvalues: v29 (copy)
	v29:debug("Opting user to join voice on age verification")
	p55.hasOptedToJoinVoiceOnAgeVerification = true
end
function t2.SetupFAECompleteListener(p56) -- line: 896
	-- upvalues: v29 (copy)
	v29:debug("Setting up FAE complete listener")

	if game:GetEngineFeature("ChatReconcileAccess") then
		v29:debug("Using ChatService ReconcileCommunicationAccessCompleted event")
		p56.ChatService.ReconcileCommunicationAccessCompleted:Connect(function() -- line: 900
			-- upvalues: v29 (copy), p56 (copy)
			v29:debug("FAE complete listener triggered, re-fetching voice permissions")
			p56.communicationPermissionsResult = nil
			p56:FetchVoicePermissions()
			p56._getShowAgeVerificationOverlayResult = p56:_GetShowAgeVerificationOverlay()

			if p56.hasOptedToJoinVoiceOnAgeVerification then
				v29:debug("FAE complete listener triggered, attempting voice rejoin")

				if p56:IsSeamlessVoice() then
					v29:debug("Opting-in user to voice")
					p56.AvatarChatService:EnableVoice()
					p56.attemptVoiceRejoin:Fire()
				end
			end
		end)
	end
end
function t2.EligibleForAgeCheckToast(p57) -- line: 920
	-- upvalues: FAE_SETTINGS_TOAST (copy)
	local v208 = p57:FetchAgeVerificationOverlay()

	if not v208 or type(v208) ~= "table" then
		return false
	end

	local isPlaceEnabledForVoice = v208.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice
	local v210 = v208.inExperienceFaeUpsell == FAE_SETTINGS_TOAST

	return isPlaceEnabledForVoice and (p57:isEnableDefaultVoiceOnForPlace() and v210)
end
function t2.userAndPlaceCanUseVoice(p58) -- line: 930
	-- upvalues: GetFFlagAvatarChatServiceEnabled (copy), GetFFlagVoiceChatServiceManagerUseAvatarChat (copy), GetShowAgeVerificationOverlay (copy), Utils (copy), Analytics (copy), v29 (copy), GetFFlagEnableVoiceSignal (copy), GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints (copy), Constants (copy), VOICE_JOIN_PROGRESS (copy), GetFFlagEnableVoiceUxUpdates (copy), GetFFlagNonVoiceFTUX (copy), GetFFlagEnableSeamlessVoiceV2 (copy), GetFFlagShowLikelySpeakingBubbles (copy)
	if p58.ThirdPartyUserService ~= nil and (p58.ThirdPartyUserService:IsChatRestrictionSupported() and p58.ThirdPartyUserService:GetVoiceChatRestrictionStatus() ~= Enum.ChatRestrictionStatus.NotRestricted) then
		return false
	end

	local v212 = if not GetFFlagAvatarChatServiceEnabled() or not GetFFlagVoiceChatServiceManagerUseAvatarChat() then GetShowAgeVerificationOverlay(Utils.bind(p58, "GetRequest"), tostring(game.GameId), (tostring(game.PlaceId))) else p58:resolveAvatarChatUserAndPlaceSettings()

	if not v212 then
		p58:_reportJoinFailed("invalidResponse", Analytics.ERROR)

		return false
	end

	if p58.options.forceVoiceEnabled then
		v212.voiceSettings.isVoiceEnabled = true
		v29:debug("bypassing voice permissions check")
	end

	local universePlaceVoiceEnabledSettings = v212.universePlaceVoiceEnabledSettings
	local voiceSettings = v212.voiceSettings

	v29:trace("Voice settings endpoint returned {}", v212)

	if not p58:verifyPlaceCanUseVoice(universePlaceVoiceEnabledSettings, voiceSettings) then
		return false
	end

	if GetFFlagEnableVoiceSignal() then
		p58.communicationPermissionsResult = v212

		local v215 = GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints() and os.time()
		local v216 = GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints() and (not p58:UserVoiceEnabled() and (not voiceSettings.isUserVerifiedForVoice and (p58:FetchPhoneVerificationUpsell(Constants.IN_EXP_PHONE_UPSELL_IXP_LAYER) == Constants.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat or v215 and p58:FetchPhoneVerificationUpsell(Constants.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, v215) == Constants.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat)))

		if p58:UserEligibleForInExperienceUpsell() or v216 then
			p58:ChangeVoiceJoinProgress(VOICE_JOIN_PROGRESS.Suspended)
		end

		if GetFFlagEnableVoiceUxUpdates() then
			local VoiceConnectCookie = p58:GetVoiceConnectCookie()
			local v218 = p58:HasSeamlessVoiceFeature(Constants.SeamlessVoiceFeatures.DeferConnection) and VoiceConnectCookie == ""
			local v219 = p58:IsSeamlessVoice() and VoiceConnectCookie == "false"

			if v218 or v219 then
				p58:ChangeVoiceJoinProgress(VOICE_JOIN_PROGRESS.Suspended)
			elseif p58:EligibleForFaeUpsell() then
				v29:debug("Suspending voice join for FAE Eligible user")
				p58:ChangeVoiceJoinProgress(VOICE_JOIN_PROGRESS.Suspended)
				p58:SetupFAECompleteListener()
			end
		else
			if GetFFlagNonVoiceFTUX() and p58:IsUserInFTUX() then
				p58:ChangeVoiceJoinProgress(VOICE_JOIN_PROGRESS.Suspended)
			end

			if p58:IsSeamlessVoice() and not p58:GetVoiceConnectCookieValue() then
				v29:debug("Suspending voice join due to voice connect cookie")
				p58:ChangeVoiceJoinProgress(VOICE_JOIN_PROGRESS.Suspended)
			elseif GetFFlagEnableSeamlessVoiceV2() and p58:IsNewSeamlessVoiceUserDisconnect() then
				v29:debug("Suspending voice join for new seamless voice user")
				p58:ChangeVoiceJoinProgress(VOICE_JOIN_PROGRESS.Suspended)
			elseif p58:IsSeamlessVoice() and p58:UserOnlyEligibleForVoice() then
				v29:debug("Suspending voice join for opt-out user")
				p58:ChangeVoiceJoinProgress(VOICE_JOIN_PROGRESS.Suspended)
			end
		end

		task.spawn(function() -- line: 1027
			-- upvalues: p58 (copy)
			p58:FetchAgeVerificationOverlay()
		end)

		if GetFFlagShowLikelySpeakingBubbles() and p58:UserEligibleForLikelySpeakingBubbles() then
			p58:emit("OnShowLikelySpeakingBubblesChanged", true)
		end
	end

	if not voiceSettings.isVoiceEnabled then
		p58:_reportJoinFailed("userNotEnabled")
	end

	return voiceSettings.isVoiceEnabled
end
function t2.voicePermissionGranted(_, p60) -- line: 1046
	-- upvalues: PermissionsProtocol (copy), Cryo (copy)
	if typeof(p60) == "table" then
		return p60.status == PermissionsProtocol.Status.AUTHORIZED or not Cryo.List.find(p60.missingPermissions, PermissionsProtocol.Permissions.MICROPHONE_ACCESS)
	end

	return p60 == PermissionsProtocol.Status.AUTHORIZED
end
function t2.RawGetPermissions(p61, p62) -- line: 1066
	-- upvalues: Promise (copy)
	return Promise.new(function(p63, _) -- line: 1067
		-- upvalues: p61 (copy), p62 (copy)
		p61:emit("GetPermissions", function(p65) -- line: 1068
			-- upvalues: p63 (copy)
			p63(p65)
		end, p62, true, true)
	end)
end
function t2.requestMicPermission(p66) -- line: 1075
	-- upvalues: v29 (copy), PermissionsProtocol (copy), GetFFlagEnableSeamlessVoiceV2 (copy), GetFFlagJoinWithoutMicPermissions (copy), PERMISSION_STATE (copy), Promise (copy), GetFFlagEnableExpJoinMicPermAnalytics (copy), Analytics (copy)
	if p66.permissionPromise then
		v29:trace("PermissionProtocol already invoked")

		return p66.permissionPromise
	end

	local t12 = { PermissionsProtocol.Permissions.MICROPHONE_ACCESS }
	local v229

	if not GetFFlagEnableSeamlessVoiceV2() and GetFFlagJoinWithoutMicPermissions(p66:IsSeamlessVoice()) then
		v29:debug("Requesting device permission")

		local ok, result, v228 = pcall(function() -- line: 1089
			-- upvalues: p66 (copy), t12 (copy)
			return p66:RawGetPermissions(t12):await()
		end)

		if ok and result then
			if v228.status == PermissionsProtocol.Status.AUTHORIZED then
				p66.permissionState = PERMISSION_STATE.LISTEN_AND_TALK
			elseif v228.missingPermissions then
				p66.permissionState = PERMISSION_STATE.PENDING_MIC
			elseif v228.deniedPermissions then
				p66.permissionState = PERMISSION_STATE.LISTEN_ONLY
			else
				v29:error("PermissionsService returned unknown permission state. Defaulting to listen only.")
				p66.permissionState = PERMISSION_STATE.LISTEN_ONLY
			end
		else
			v29:error("PermissionsService call failed.")
			p66.permissionState = PERMISSION_STATE.LISTEN_ONLY
		end

		v29:debug("Joining without mic permissions. Permission State: {}", p66.permissionState)
		v229 = Promise.resolve()
	else
		v229 = p66.PermissionsService:requestPermissions(t12)
	end

	p66.permissionPromise = v229:andThen(function(p67) -- line: 1118
		-- upvalues: GetFFlagEnableExpJoinMicPermAnalytics (copy), p66 (copy), GetFFlagEnableSeamlessVoiceV2 (copy), GetFFlagJoinWithoutMicPermissions (copy), Promise (copy), v29 (copy), Analytics (copy), PermissionsProtocol (copy)
		if GetFFlagEnableExpJoinMicPermAnalytics() then
			p66:RecordExperienceJoinMicPermissionStatus(p67)
		end

		if not GetFFlagEnableSeamlessVoiceV2() and GetFFlagJoinWithoutMicPermissions() then
			return Promise.resolve()
		end

		if not p67 and not p67.status then
			v29:debug("No permission response, rejecting access")
			p66:_reportJoinFailed("noPermissionResponse", Analytics.ERROR)

			if p66.options.passInitErrorInPromiseReject then
				return Promise.reject({
					code = "INIT_ERROR_NO_PERM_RESPONSE"
				})
			end

			return Promise.reject()
		end

		v29:debug("Permission status {}", p67.status)

		local v443 = p67.status == PermissionsProtocol.Status.AUTHORIZED

		if p66.options.passInitErrorInPromiseReject and not v443 then
			return Promise.reject({
				code = "INIT_ERROR_PERM_NOT_GRANTED"
			})
		end

		return v443 and Promise.resolve() or Promise.reject()
	end):andThen(function() -- line: 1142
		-- upvalues: p66 (copy), Promise (copy)
		p66:emit("OnRequestMicPermissionResolved")

		return Promise.resolve()
	end):catch(function() -- line: 1147
		-- upvalues: p66 (copy), Promise (copy)
		p66:emit("OnRequestMicPermissionRejected")

		if p66.options.passInitErrorInPromiseReject then
			return Promise.reject({
				code = "INIT_ERROR_MIC_PERM_REJECTED"
			})
		end

		return Promise.reject()
	end)

	return p66.permissionPromise
end
function t2.JoinByGroupIdToken(p68, p69, p70) -- line: 1157
	p68.previousGroupId = p69
	p68.previousMutedState = p70

	return p68.service:JoinByGroupIdToken(p69, p70)
end
function t2.EnableVoice(p71) -- line: 1163
	-- upvalues: v29 (copy)
	v29:trace("Enabling voice")
	p71.AvatarChatService:GetPropertyChangedSignal("ClientFeatures"):Once(function() -- line: 1166
		-- upvalues: p71 (copy)
		p71.attemptVoiceRejoin:Fire()
	end)
	p71.AvatarChatService:EnableVoice()
end
function t2.ChangeVoiceJoinProgress(p72, p73) -- line: 1172
	p72.VoiceJoinProgress = p73
	p72.VoiceJoinProgressChanged:Fire(p72.VoiceJoinProgress)
end
function t2.setOptions(t13: {[any]: any}, t14: {[any]: any}) -- line: 1177
	t13.options = t14
end
function t2.ShouldShowJoinVoiceOnDisconnect(p74) -- line: 1181
	-- upvalues: VOICE_JOIN_PROGRESS (copy)
	return p74:IsSeamlessVoice() and p74.VoiceJoinProgress == VOICE_JOIN_PROGRESS.Suspended
end
function t2.IsSeamlessVoice(p75) -- line: 1185
	-- upvalues: GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), GetFFlagCheckUniversePlaceBeforeSuspending (copy), Constants (copy)
	if GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and not p75.options.allowSeamlessVoice then
		return false
	end

	local v240 = p75:FetchAgeVerificationOverlay()

	if type(v240) ~= "table" or not v240 or not v240.voiceSettings then
		return false
	end

	if GetFFlagCheckUniversePlaceBeforeSuspending() and not p75:verifyUniverseAndPlaceCanUseVoice() then
		return false
	end

	local seamlessVoiceStatus = v240.voiceSettings.seamlessVoiceStatus

	return seamlessVoiceStatus == Constants.SeamlessVoiceStatus.EnabledExistingUser or seamlessVoiceStatus == Constants.SeamlessVoiceStatus.EnabledNewUser
end
function t2.HasSeamlessVoiceFeature(p76, p77) -- line: 1207
	-- upvalues: GetFFlagEnableSeamlessVoiceFeature (copy), Utils (copy), Constants (copy)
	if not p76.options.allowSeamlessVoice or not p76:verifyUniverseAndPlaceCanUseVoice() then
		return false
	end

	local v244 = p76:FetchAgeVerificationOverlay()

	if not p76:_isValidAgeVerificationOverlayData(v244) then
		return false
	end

	local seamlessVoiceVariant = v244.voiceSettings.seamlessVoiceVariant

	if not seamlessVoiceVariant then
		return false
	end

	if GetFFlagEnableSeamlessVoiceFeature() then
		if type(p77) == "string" then
			p77 = { p77 }
		end

		if GetFFlagEnableSeamlessVoiceFeature(p77) then
			local v246 = Utils.jsonDecode(seamlessVoiceVariant)
			local t15 = {}

			for _, v in pairs(v246) do
				t15[v] = true
			end

			if #p77 == 1 and p77[1] == Constants.SeamlessVoiceFeatures.ConnectDisconnect and seamlessVoiceVariant == Constants.SeamlessVoiceVariants.OnlyConnectDisconnect then
				return true
			end

			for _, v in pairs(p77) do
				if not t15[v] then
					return false
				end
			end

			return true
		end
	else
		local v252 = ({
			[Constants.SeamlessVoiceFeatures.ConnectDisconnect] = function(p78) -- line: 1252
				-- upvalues: Constants (copy)
				return p78 ~= Constants.SeamlessVoiceVariants.Control
			end,
			[Constants.SeamlessVoiceFeatures.HearingWithoutMicPermissions] = function(p79) -- line: 1255
				-- upvalues: Constants (copy)
				return p79 == Constants.SeamlessVoiceVariants.HearingWithoutMicPermissions
			end,
			[Constants.SeamlessVoiceFeatures.LikelySpeakingBubblesRemoved] = function(p80) -- line: 1258
				-- upvalues: Constants (copy)
				return p80 == Constants.SeamlessVoiceVariants.LikelySpeakingBubblesRemoved
			end
		})[p77]

		if v252 then
			return v252(seamlessVoiceVariant)
		end
	end

	return false
end
function t2.IsNewSeamlessVoiceUserDisconnect(p81) -- line: 1272
	-- upvalues: Constants (copy)
	if not p81.options.allowSeamlessVoice or not p81:verifyUniverseAndPlaceCanUseVoice() then
		return false
	end

	local v254 = p81:FetchAgeVerificationOverlay()

	if not p81:_isValidAgeVerificationOverlayData(v254) then
		return false
	end

	if v254.voiceSettings.seamlessVoiceStatus ~= Constants.SeamlessVoiceStatus.EnabledNewUser then
		return false
	end

	local ok, result = pcall(function() -- line: 1291
		-- upvalues: p81 (copy), Constants (copy)
		return p81.AppStorageService:GetItem(Constants.SEAMLESS_VOICE_FTUX_KEY)
	end)

	return ok and result == "false"
end
function t2._isValidAgeVerificationOverlayData(_: {[any]: any}, t17: {[any]: any}?) -- line: 1299
	return type(t17) == "table" and (t17 and t17.voiceSettings)
end
function t2.UserInInExperienceUpsellTreatment(p82) -- line: 1303
	-- upvalues: Constants (copy)
	local v260 = p82:FetchAgeVerificationOverlay()

	if not v260 then
		return false
	end

	local showVoiceInExperienceUpsellVariant = v260.showVoiceInExperienceUpsellVariant

	return showVoiceInExperienceUpsellVariant == Constants.IN_EXP_UPSELL_VARIANT.VARIANT1 or (showVoiceInExperienceUpsellVariant == Constants.IN_EXP_UPSELL_VARIANT.VARIANT2 or showVoiceInExperienceUpsellVariant == Constants.IN_EXP_UPSELL_VARIANT.VARIANT3)
end
function t2.UserOnlyEligibleForVoice(p83) -- line: 1315
	-- upvalues: v36 (copy)
	local communicationPermissionsResult = p83.communicationPermissionsResult

	if not communicationPermissionsResult or (not communicationPermissionsResult.voiceSettings or not communicationPermissionsResult.universePlaceVoiceEnabledSettings) then
		if not v36 then
			return false
		end

		p83:FetchVoicePermissions()
		communicationPermissionsResult = p83.communicationPermissionsResult
	end

	return communicationPermissionsResult.voiceSettings.isUserVerifiedForVoice and (not communicationPermissionsResult.voiceSettings.isVoiceEnabled and communicationPermissionsResult.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice)
end
function t2.UserOnlyEligibleForVoiceViaOverlay(p84) -- line: 1331
	local v265 = p84:FetchAgeVerificationOverlay()

	if not p84:_isValidAgeVerificationOverlayData(v265) then
		return false
	end

	return v265.voiceSettings.isVerifiedForVoice and (not v265.voiceSettings.isVoiceEnabled and v265.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice)
end
function t2.UserVoiceEnabled(p85) -- line: 1344
	local communicationPermissionsResult = p85.communicationPermissionsResult

	if not communicationPermissionsResult or (not communicationPermissionsResult.voiceSettings or not communicationPermissionsResult.universePlaceVoiceEnabledSettings) then
		return false
	end

	return communicationPermissionsResult.voiceSettings.isVoiceEnabled and communicationPermissionsResult.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice
end
function t2.UserEligibleForInExperienceUpsell(p86) -- line: 1354
	-- upvalues: GetFFlagEnableVoiceSignal (copy)
	local v269 = p86:UserOnlyEligibleForVoice()

	if not v269 then
		return false
	end

	if GetFFlagEnableVoiceSignal() then
		local v270 = p86:UserInInExperienceUpsellTreatment()

		return v269 and v270
	end

	local v271 = p86:FetchAgeVerificationOverlay()

	return v269 and (v271 and v271.showVoiceInExperienceUpsell)
end
function t2.UserEligibleForLikelySpeakingBubbles(p87) -- line: 1375
	-- upvalues: GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints (copy), Constants (copy), GetFFlagEnableSeamlessVoiceV2 (copy)
	local v273 = p87:UserOnlyEligibleForVoice()

	if GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints() and (not v273 and not p87:UserVoiceEnabled() and p87:FetchPhoneVerificationUpsell(Constants.IN_EXP_PHONE_UPSELL_IXP_LAYER) == Constants.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat) then
		return true
	end

	if not GetFFlagEnableSeamlessVoiceV2() and not v273 then
		return false
	end

	local v274 = p87:FetchAgeVerificationOverlay()

	if GetFFlagEnableSeamlessVoiceV2() then
		if not p87:_isValidAgeVerificationOverlayData(v274) then
			return false
		end

		local v275 = v273 and (v274 and v274.showVoiceInExperienceUpsell)
		local showM3LikelySpeakingBubbles = v274.showM3LikelySpeakingBubbles

		return v275 or showM3LikelySpeakingBubbles
	end

	return v273 and (v274 and v274.showVoiceInExperienceUpsell)
end
function t2.canUseServiceAsync(p88) -- line: 1413
	-- upvalues: v29 (copy), Promise (copy), GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), GetFFlagEnableVoiceSignal (copy), VOICE_JOIN_PROGRESS (copy), VOICE_CHAT_AVAILABILITY (copy), VoiceChatService (copy), v37 (copy), IXPServiceWrapper (copy), v38 (copy), v39 (copy)
	if p88.available ~= nil or not game:GetEngineFeature("VoiceChatSupported") then
		v29:debug("Voice Chat is not Available, rejecting canUseService promise")

		if p88.options.passInitErrorInPromiseReject then
			return Promise.reject({
				code = "INIT_ERROR_VOICE_NOT_SUPPORTED"
			})
		end

		return Promise.reject()
	end

	if not p88.canUseServicePromise then
		p88.canUseServicePromise = Promise.defer(function(p89, p90) -- line: 1423
			-- upvalues: p88 (copy), GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), GetFFlagEnableVoiceSignal (copy), VOICE_JOIN_PROGRESS (copy), v29 (copy), VOICE_CHAT_AVAILABILITY (copy), VoiceChatService (copy), v37 (copy), IXPServiceWrapper (copy), v38 (copy), v39 (copy)
			local v449 = p88:userAndPlaceCanUseVoice()

			if GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then
				p88.canUseServiceResult = v449
				p88:emit("OnCanUseServiceResult", v449)
			end

			if GetFFlagEnableVoiceSignal() and p88.VoiceJoinProgress == VOICE_JOIN_PROGRESS.Suspended then
				v29:debug("Place is voice enabled but user is not, delaying voice rejection")
				p88.attemptVoiceRejoin.Event:Wait()
				v29:debug("Attempting voice rejoin")
				p88.communicationPermissionsResult.voiceSettings.isVoiceEnabled = true
				p88.userEligible = true
				p88.initializedPostSuspension = true
				p89()
				p88:ChangeVoiceJoinProgress(VOICE_JOIN_PROGRESS.Joining)

				return
			end

			if not v449 then
				v29:info("Voice access denied")
				p88.available = VOICE_CHAT_AVAILABILITY.UserNotAvailable

				if p88.options.passInitErrorInPromiseReject then
					p90({
						code = "INIT_ERROR_USER_NOT_AVAILABLE"
					})

					return
				end

				p90()

				return
			end

			if game:GetEngineFeature("VoiceChatEnabledRccProperties") and (not VoiceChatService.VoiceChatEnabledForUniverseOnRcc or not VoiceChatService.VoiceChatEnabledForPlaceOnRcc) then
				v29:debug("Disabling voice chat due to RCC Response. Universe: {}, Place: {}", VoiceChatService.VoiceChatEnabledForUniverseOnRcc, VoiceChatService.VoiceChatEnabledForPlaceOnRcc)

				if not VoiceChatService.VoiceChatEnabledForUniverseOnRcc then
					p88:_reportJoinFailed("universeNotEnabled")
				elseif not VoiceChatService.VoiceChatEnabledForPlaceOnRcc then
					p88:_reportJoinFailed("placeNotEnabled")
				end

				p88.available = VOICE_CHAT_AVAILABILITY.PlaceNotAvailable

				if p88.options.passInitErrorInPromiseReject then
					p90({
						code = "INIT_ERROR_PLACE_NOT_AVAILABLE"
					})

					return
				end

				p90()

				return
			end

			if v37 then
				IXPServiceWrapper:WaitForInitialization()

				local ok, result = pcall(function() -- line: 1483
					-- upvalues: IXPServiceWrapper (copy), v38 (copy)
					return IXPServiceWrapper:GetLayerData(v38)
				end)

				if ok and result and result[v39] ~= nil then
					p88.userEligible = result[v39]
					IXPServiceWrapper:LogUserLayerExposure(v38)
				end

				if p88.userEligible then
					p89()

					return
				end

				if p88.options.passInitErrorInPromiseReject then
					p90({
						code = "INIT_ERROR_IXP_NOT_ELIGIBLE"
					})

					return
				end

				p90()

				return
			end

			p88.userEligible = true
			p89()
		end):andThen(function() -- line: 1505
			-- upvalues: p88 (copy)
			return p88:requestMicPermission()
		end)
	end

	return p88.canUseServicePromise
end
function t2._setRecentUserState(p91, p92, p93) -- line: 1512
	-- upvalues: Cryo (copy)
	local v281 = p91.recentUsersInteractionData[tostring(p92)] or {}
	local v282 = Cryo.Dictionary.join(v281, p93)

	p91.recentUsersInteractionData = Cryo.Dictionary.join(p91.recentUsersInteractionData, {
		[tostring(p92)] = v282
	})
end
function t2.getRecentUsersInteractionData(p94) -- line: 1522
	p94:_updateRecentUsersInteractionData()

	return p94.recentUsersInteractionData
end
function t2.GetSignalREvent(p95, p96) -- line: 1527
	return p95.SignalREventTable[p96].Event
end
function t2.StartModerationSignal(p97) -- line: 1532
	-- upvalues: v29 (copy), GetFFlagVoiceChatClientRewriteMasterLua (copy), VoiceChatService (copy)
	if not p97.playerModeratedConnection then
		p97.playerModeratedConnection = p97:GetSignalREvent("ParticipantModeratedFromVoice"):Connect(function() -- line: 1535
			-- upvalues: v29 (copy), p97 (copy), GetFFlagVoiceChatClientRewriteMasterLua (copy), VoiceChatService (copy)
			v29:debug("User Moderated")
			p97.previousSessionId = p97.service:GetSessionId()
			p97:emit("OnPlayerModerated")

			if GetFFlagVoiceChatClientRewriteMasterLua() then
				VoiceChatService:notifyServerACSCleanup()
				VoiceChatService:leaveVoice()

				return
			end

			VoiceChatService:notifyServerACSCleanup()
			p97.service:Leave()
		end)
	end
end
function t2.StopModerationSignal(p98) -- line: 1550
	if p98.playerModeratedConnection then
		p98.playerModeratedConnection:Disconnect()
		p98.playerModeratedConnection = nil
	end
end
function t2._updateRecentUsersInteractionData(p99) -- line: 1557
	-- upvalues: v35 (copy), GetFFlagClearUserFromRecentVoiceDataOnLeave (copy), Players (copy), GetFIntVoiceUsersInteractionExpiryTimeSeconds (copy), Cryo (copy)
	local timestamp = os.time()
	local t18 = {}

	if p99.recentUsersInteractionData then
		for k, v in pairs(p99.recentUsersInteractionData) do
			local v293 = if not v35 then p99.participants[k] else p99.participants[tostring(k)]
			local v294 = GetFFlagClearUserFromRecentVoiceDataOnLeave() and not Players:GetPlayerByUserId((tonumber(k)))
			local v295 = timestamp - v.lastHeardTime >= GetFIntVoiceUsersInteractionExpiryTimeSeconds()
			local v296 = not v293 or v293.isMuted

			if v295 and v296 or v294 then
				t18[k] = Cryo.None
			end
		end

		p99.recentUsersInteractionData = Cryo.Dictionary.join(p99.recentUsersInteractionData, t18)
	end
end
function t2.SetupParticipantListeners(p100) -- line: 1581
	-- upvalues: v29 (copy), GetFFlagClearUserFromRecentVoiceDataOnLeave (copy), v35 (copy), Players (copy), VoiceChatService (copy), v30 (copy), FFlagEnablePartyVoiceChangersInLua (copy), GetFFlagBatchVoiceParticipantsUpdates (copy), v72 (copy), GetFFlagVoiceChatClientRewriteMasterLua (copy), v67 (copy), v68 (copy), GetFFlagDisconnectToastClientRewrite (copy), GetFFlagEnableVoiceSignal (copy), VOICE_JOIN_PROGRESS (copy), v66 (copy), MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY (copy), GetFFlagLocalMutedNilFix (copy), v40 (copy), GetFFlagLuaConsumePlayerModerated (copy), GetFFlagEnableVoiceNudge (copy), GetFFlagEnableVoiceReverseNudge (copy), Utils (copy), t1 (copy)
	p100:ensureInitialized("setup participant listeners")

	if not p100.participants then
		p100.participants = {}
		p100.recentUsersInteractionData = {}
		p100.updatedParticipants = {}
		p100.participantConnection = p100.service.ParticipantsStateChanged:Connect(function(p101, p102, p103) -- line: 1590
			-- upvalues: v29 (copy), GetFFlagClearUserFromRecentVoiceDataOnLeave (copy), p100 (copy), v35 (copy), Players (copy), VoiceChatService (copy), v30 (copy), FFlagEnablePartyVoiceChangersInLua (copy), GetFFlagBatchVoiceParticipantsUpdates (copy), v72 (copy)
			v29:trace("Participants state changed")

			for _, v in ipairs(p101) do
				if not GetFFlagClearUserFromRecentVoiceDataOnLeave() and not p100.participants[tostring(v)].isMuted then
					p100:_setRecentUserState(v, {
						lastHeardTime = os.time()
					})
				end

				p100.participants[tostring(v)] = nil
				p100.participantLeft:Fire(p100.participants, v)
				p100:emit("OnVoiceParticipantRemoved", v)
			end

			for _, v in ipairs(p102) do
				p100.participantJoined:Fire(p100.participants, v)
				p100:emit("OnVoiceParticipantAdded", v)
			end

			for _, v in pairs(p103) do
				local userId = v.userId
				local v462 = if not v35 then p100.participants[userId] else p100.participants[tostring(userId)]

				if not v.isMuted or v462 and not v462.isMuted then
					p100:_setRecentUserState(userId, {
						lastHeardTime = os.time(),
						player = Players:GetPlayerByUserId(userId)
					})
				end

				if not v462 or v462.isMuted ~= v.isMuted then
					p100:emit("OnVoiceParticipantToggleMuted", userId, v.isMuted)
				end

				if VoiceChatService.UseNewAudioApi and v30 then
					v.isMutedLocally = not not p100.mutedPlayers[userId]
				end

				if VoiceChatService.UseNewAudioApi then
					v.isMutedLocally = if not p100.mutedPlayers[userId] then v.isMutedLocally else not not p100.mutedPlayers[userId]
				end

				if FFlagEnablePartyVoiceChangersInLua and VoiceChatService.UseNewAudioApi then
					v.isVoiceChangerActive = if not p100.voiceChangerActivePlayers[userId] then v.isVoiceChangerActive else p100.voiceChangerActivePlayers[userId]
				end

				if p100.muteAll then
					v.isMutedLocally = true
				end

				p100.participants[tostring(userId)] = v

				if GetFFlagBatchVoiceParticipantsUpdates() then
					p100.updatedParticipants[tostring(userId)] = v
				end

				if v72 and p100.CaptureService:IsCapturingVideo() then
					p100.voiceCapturedDuringVideoCapture = p100.voiceCapturedDuringVideoCapture or v.isSignalActive
				end
			end

			p100:_updateRecentUsersInteractionData()

			if p100.shouldThrottleParticipantUpdate then
				local timestamp = tick()

				if timestamp - p100.lastParticipantsStateUpdate >= p100.participantsStateThrottleTime and #p103 > 0 then
					p100.lastParticipantsStateUpdate = timestamp
					p100.participantsUpdate:Fire(if not GetFFlagBatchVoiceParticipantsUpdates() then p100.participants else p100.updatedParticipants)
					p100.updatedParticipants = {}

					return
				end

				if #p103 > 0 then
					local v464 = p100.participantsStateThrottleTime - (timestamp - p100.lastParticipantsStateUpdate)

					p100.lastStateUpdateCounter = (p100.lastStateUpdateCounter + 1) % 100

					local lastStateUpdateCounter = p100.lastStateUpdateCounter

					task.wait(v464)

					if lastStateUpdateCounter == p100.lastStateUpdateCounter then
						p100.participantsUpdate:Fire(if not GetFFlagBatchVoiceParticipantsUpdates() then p100.participants else p100.updatedParticipants)
						p100.updatedParticipants = {}

						return
					end
				end
			elseif #p103 > 0 then
				p100.participantsUpdate:Fire(if not GetFFlagBatchVoiceParticipantsUpdates() then p100.participants else p100.updatedParticipants)
				p100.updatedParticipants = {}
			end
		end)

		local function onStateChanged(p104, p105) -- line: 1706
			-- upvalues: p100 (copy), GetFFlagVoiceChatClientRewriteMasterLua (copy), v29 (copy), v67 (copy), v68 (copy), GetFFlagDisconnectToastClientRewrite (copy), GetFFlagEnableVoiceSignal (copy), VOICE_JOIN_PROGRESS (copy)
			p100:emit("OnStateChanged", p104, p105)

			local v468 = p105 == Enum.VoiceChatState.Failed
			local v469 = p105 == Enum.VoiceChatState.Joining
			local v470 = p105 == Enum.VoiceChatState.Leaving
			local v471 = p105 == Enum.VoiceChatState.Ended
			local v472 = p100.service:IsPublishPaused()

			if v472 ~= p100.localMuted and (not v468 and not v469 and not v470 and not v471) then
				p100.localMuted = v472
				p100.muteChanged:Fire(v472)
			elseif v469 or v470 or v471 then
				p100.localMuted = nil
			end

			if GetFFlagVoiceChatClientRewriteMasterLua() and p105 == Enum.VoiceChatState.Joined and p100.isInCall and v472 ~= p100.callMutedState then
				v29:debug("In call, setting local muted to call muted state {}", p100.callMutedState)
				p100:ToggleMic("InitInCall")
			end

			if v67 and p105 == Enum.VoiceChatState.Joined then
				p100:StartModerationSignal()
			end

			if p105 == Enum.VoiceChatState.Leaving then
				if not v68 or not p100.previousGroupId then
					p100.previousGroupId = p100.service:GetGroupId()
				end

				p100.previousMutedState = p100.service:IsPublishPaused()
			end

			if p105 == Enum.VoiceChatState.Ended or v468 then
				p100.participants = {}
				p100.localMuted = nil
				p100.participantsUpdate:Fire(p100.participants)

				if v67 then
					p100:StopModerationSignal()
				end

				if v468 then
					v29:debug("State Changed to Failed. Reason: {}", p100.service:GetAndClearCallFailureMessage())
				end

				if p104 == Enum.VoiceChatState.Joining or p104 == Enum.VoiceChatState.JoiningRetry or p104 == Enum.VoiceChatState.Joined then
					if p105 == Enum.VoiceChatState.Ended then
						v29:debug("State Changed to Ended from {}", p104)
					end

					if not GetFFlagDisconnectToastClientRewrite() or not p100:IsSeamlessVoice() or p100:GetVoiceConnectCookieValue() then
						p100:emit("OnRetryRequested")
					end
				end
			end

			if GetFFlagEnableVoiceSignal() and p100.VoiceJoinProgress == VOICE_JOIN_PROGRESS.Joining and p105 == Enum.VoiceChatState.Joined then
				p100:ChangeVoiceJoinProgress(VOICE_JOIN_PROGRESS.Joined)
				p100:emit("OnVoiceJoin")
			end
		end

		if p100.service.VoiceChatState and p100.service.VoiceChatState == Enum.VoiceChatState.Joined then
			v29:debug("Joined voice chat {}", p100.service.VoiceChatState)
			onStateChanged(nil, Enum.VoiceChatState.Joined)
		end

		p100.stateConnection = p100.service.StateChanged:Connect(onStateChanged)

		if v66 and VoiceChatService.UseNewAudioApi then
			if not p100.localMeteringTask then
				p100.localMeteringTask = task.spawn(function() -- line: 1793
					-- upvalues: p100 (copy)
					while true do
						p100:UpdateLocalMetering()
						task.wait()
					end
				end)
			end
		elseif p100.service:GetVoiceChatApiVersion() >= MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY then
			p100.micConnection = p100.service.PlayerMicActivitySignalChange:Connect(function(p106) -- line: 1802
				-- upvalues: v72 (copy), p100 (copy), GetFFlagLocalMutedNilFix (copy), v40 (copy)
				if v72 and p100.CaptureService:IsCapturingVideo() then
					p100.voiceCapturedDuringVideoCapture = p100.voiceCapturedDuringVideoCapture or p106.isActive
				end

				p100.isTalking = p106.isActive

				if GetFFlagLocalMutedNilFix() then
					if p100.localMuted == false then
						if v40 then
							p100:FireTalkingChangedDebounced(p100.isTalking)

							return
						end

						p100.talkingChanged:Fire(p100.isTalking)

						return
					end
				elseif not p100.localMuted then
					if v40 then
						p100:FireTalkingChangedDebounced(p100.isTalking)

						return
					end

					p100.talkingChanged:Fire(p100.isTalking)
				end
			end)
		end

		if GetFFlagLuaConsumePlayerModerated() then
			p100:StartModerationSignal()
		elseif game:GetEngineFeature("VoiceChatServicePlayerModeratedEvent") then
			p100.playerModeratedConnection = p100.service.LocalPlayerModerated:connect(function() -- line: 1835
				-- upvalues: v29 (copy), p100 (copy), GetFFlagVoiceChatClientRewriteMasterLua (copy), VoiceChatService (copy)
				v29:debug("User Moderated old")
				p100.previousSessionId = p100.service:GetSessionId()
				p100:emit("OnPlayerModerated")

				if GetFFlagVoiceChatClientRewriteMasterLua() then
					VoiceChatService:leaveVoice()

					return
				end

				p100.service:Leave()
			end)
		end

		if GetFFlagEnableVoiceNudge() then
			v29:trace("Setting up voice nudge handlers")
			p100.voiceToxicityModalConnection = p100:GetSignalREvent("VoiceToxicityModal"):Connect(function(p107) -- line: 1849
				-- upvalues: p100 (copy)
				p100.Analytics:reportReceivedNudge(p107, p100:GetNudgeAnalyticsData())
				p100:emit("OnVoiceToxicityModal")
			end)
			p100.VoiceToxicityToastConnection = p100:GetSignalREvent("VoiceToxicityToast"):Connect(function(p108) -- line: 1855
				-- upvalues: p100 (copy)
				p100.Analytics:reportReceivedNudge(p108, p100:GetNudgeAnalyticsData())
				p100:emit("OnVoiceToxicityToast")
			end)
		end

		if GetFFlagEnableVoiceReverseNudge() then
			v29:trace("Setting up voice reverse nudge handlers")
			p100.voiceReverseNudgeConnection = p100:GetSignalREvent("VoiceReverseNudgeIconColorChange"):Connect(function(p109) -- line: 1863
				-- upvalues: p100 (copy)
				p100:emit("OnVoiceReverseNudgeIconColorChange", p109)
			end)
		end

		p100.blockConnection = p100.BlockStatusChanged:Connect(function(n4: number, b4: boolean) -- line: 1868
			-- upvalues: p100 (copy), v29 (copy), Utils (copy)
			if b4 then
				if p100.participants[tostring(n4)] then
					v29:debug("Blocking {}", Utils.shorten(n4))
					p100.service:SubscribeBlock(n4)

					return
				end
			else
				v29:debug("UnBlocking {}", Utils.shorten(n4))
				p100.service:SubscribeUnblock(n4)
			end
		end)

		if VoiceChatService.UseNewAudioApi then
			p100:hookupAudioDeviceInputListener()
		end

		if p100.service.TempSetMicMutedToggleMic then
			p100.tempSetMicMutedToggleMicConnection = p100.service.TempSetMicMutedToggleMic:connect(function() -- line: 1886
				-- upvalues: p100 (copy)
				p100:ToggleMic("TempSetMicMutedToggleMic")
			end)
		end

		if v72 then
			p100.videoCaptureInProgressConnection = p100.CaptureService.VideoCaptureInProgress:connect(function(b5: boolean) -- line: 1893
				-- upvalues: p100 (copy), t1 (copy)
				if b5 then
					p100.voiceCapturedDuringVideoCapture = false

					return
				end

				p100.TelemetryService:LogEvent(t1, {
					customFields = {
						voiceCaptured = p100.voiceCapturedDuringVideoCapture
					}
				})
			end)
		end
	end
end

local u97 = nil

function t2.CheckAudioInputExists(p110) -- line: 1908
	-- upvalues: v29 (copy), u97 (ref), Promise (copy), Cryo (copy)
	v29:trace("Checking for AudioDeviceInput")

	if not u97 then
		u97 = Promise.new(function(p111, _) -- line: 1911
			-- upvalues: Cryo (copy), p110 (copy), v29 (copy)
			if #Cryo.Dictionary.keys(p110.audioDevices) > 0 then
				v29:trace("Found existing AudioDeviceInput")
				p111()

				return
			end

			p110.audioDeviceInputAdded.Event:Connect(function() -- line: 1916
				-- upvalues: v29 (copy), p111 (copy)
				v29:trace("Found new AudioDeviceInput")
				p111()
			end)
		end)
	end

	return u97
end
function t2.checkAndUpdateSequence(t19: {[any]: any}, s7: string, n5: number) -- line: 1926
	if not n5 then
		return 0
	end

	if not t19.SequenceNumbers[s7] then
		t19.SequenceNumbers[s7] = n5

		return 0
	end

	local v303 = n5 - t19.SequenceNumbers[s7]

	if v303 > 0 then
		t19.SequenceNumbers[s7] = n5
	end

	return v303 - 1
end
function t2.onInstanceAdded(t20: {[any]: any}, p113) -- line: 1949
	-- upvalues: v29 (copy)
	if p113:IsA("AudioDeviceInput") then
		v29:debug("Found new audio device instance for {}", p113.Player and p113.Player.Name)
		t20.audioDevices[p113] = t20:CreateAudioDeviceData(p113)
		t20:emit("OnAudioDeviceInputAdded")
		t20:StartAnalysis(p113)
	end
end
function t2.GetSendMuteEvent(p114) -- line: 1959
	-- upvalues: RobloxReplicatedStorage (copy)
	if not p114.SendMuteEvent then
		p114.SendMuteEvent = RobloxReplicatedStorage:WaitForChild("SetUserActive", 10)
	end

	return p114.SendMuteEvent
end
function t2.GetToggleVoiceChangerEvent(p115) -- line: 1966
	-- upvalues: ReplicatedStorage (copy)
	if not p115.SendVoiceChangerEvent then
		p115.SendVoiceChangerEvent = ReplicatedStorage:WaitForChild("ToggleUserVoiceChanger", 10)
	end

	return p115.SendVoiceChangerEvent
end
function t2.GetInputToModifierWire(p116) -- line: 1973
	-- upvalues: Players (copy)
	if not p116.InputToModifierWire then
		p116.InputToModifierWire = Players.LocalPlayer:FindFirstChild("InputToModifier")
	end

	return p116.InputToModifierWire
end
function t2.GetPartyVoiceDeviceInput(p117) -- line: 1980
	-- upvalues: Players (copy)
	if not p117.PartyVoiceDeviceInput then
		p117.PartyVoiceDeviceInput = Players.LocalPlayer:FindFirstChild("PartyVoiceDeviceInput")
	end

	return p117.PartyVoiceDeviceInput
end
function t2.GetSetVoicePackEvent(p118) -- line: 1988
	-- upvalues: ReplicatedStorage (copy)
	if not p118.SetVoicePackEvent then
		p118.SetVoicePackEvent = ReplicatedStorage:WaitForChild("SetVoicePack", 10)
	end

	return p118.SetVoicePackEvent
end
function t2.GetVoiceChangerWasToggledEvent(p119) -- line: 1995
	-- upvalues: ReplicatedStorage (copy)
	if not p119.VoiceChangerWasToggledEvent then
		p119.VoiceChangerWasToggledEvent = ReplicatedStorage:WaitForChild("VoiceChangerWasToggled", 3)
	end

	return p119.VoiceChangerWasToggledEvent
end
function t2.GetAnalyzer(_: {[any]: any}, p120) -- line: 2016
	-- upvalues: RobloxReplicatedStorage (copy)
	local v317 = p120.Name .. "_Analyzer"
	local v318 = RobloxReplicatedStorage
	local v319 = v318:FindFirstChild(v317)

	if not v319 then
		v319 = Instance.new("AudioAnalyzer")
		v319.SpectrumEnabled = false
		v319.Name = v317
		v319.Parent = v318
	end

	return v319
end
function t2.IsSignalActive(t22: {[any]: any}, n6: number) -- line: 2033
	-- upvalues: v66 (copy), Players (copy)
	if not v66 then
		return false
	end

	local PlayerByUserId = Players:GetPlayerByUserId(n6)

	if not PlayerByUserId then
		return false
	end

	return math.log10(t22:GetAnalyzer(PlayerByUserId).PeakLevel) * 20 > -36
end
function t2.StopAnalysis(_: {[any]: any}, p121) -- line: 2047
	-- upvalues: v66 (copy), RobloxReplicatedStorage (copy)
	if not v66 then
		return
	end

	for _, v327 in p121:GetConnectedWires("Output") do
		local TargetInstance = v327.TargetInstance

		if TargetInstance and TargetInstance:IsDescendantOf(RobloxReplicatedStorage) then
			v327:Destroy()
		end
	end
end
function t2.StartAnalysis(t24: {[any]: any}, p122) -- line: 2063
	-- upvalues: v66 (copy)
	if not v66 then
		return
	end

	t24:StopAnalysis(p122)

	local Player = p122.Player

	if not Player then
		return
	end

	local Analyzer = t24:GetAnalyzer(Player)
	local Wire = Instance.new("Wire")

	Wire.SourceInstance = p122
	Wire.TargetInstance = Analyzer
	Wire.Parent = Analyzer
end
function t2.GetVoiceConnectCookie(p123) -- line: 2077
	-- upvalues: Constants (copy)
	local ok, result = pcall(function() -- line: 2078
		-- upvalues: p123 (copy), Constants (copy)
		return p123.AppStorageService:GetItem(Constants.VOICE_CONNECT_DISCONNECT_KEY_V3)
	end)

	if ok and result then
		return result
	end

	return ""
end
function t2.GetVoiceConnectCookieValue(p124) -- line: 2089
	-- upvalues: GetFFlagEnableVoiceUxUpdates (copy), Constants (copy), GetFFlagEnableSeamlessVoiceV2 (copy)
	if GetFFlagEnableVoiceUxUpdates() then
		local ok, result = pcall(function() -- line: 2091
			-- upvalues: p124 (copy), Constants (copy)
			return p124.AppStorageService:GetItem(Constants.VOICE_CONNECT_DISCONNECT_KEY_V3)
		end)

		if ok then
			return result == "true"
		end

		return true
	end

	local ok, result = pcall(function() -- line: 2097
		-- upvalues: p124 (copy), GetFFlagEnableSeamlessVoiceV2 (copy), Constants (copy)
		return p124.AppStorageService:GetItem(if not GetFFlagEnableSeamlessVoiceV2() then Constants.VOICE_CONNECT_DISCONNECT_KEY else Constants.VOICE_CONNECT_DISCONNECT_KEY_V2)
	end)

	if ok then
		return result == "true"
	end

	return true
end
function t2.SetVoiceConnectCookieValue(t25: {[any]: any}, b6: boolean) -- line: 2109
	-- upvalues: GetFFlagEnableVoiceUxUpdates (copy), Constants (copy), GetFFlagEnableSeamlessVoiceV2 (copy)
	if GetFFlagEnableVoiceUxUpdates() then
		return (pcall(function() -- line: 2111
			-- upvalues: t25 (copy), Constants (copy), b6 (copy)
			t25.AppStorageService:SetItem(Constants.VOICE_CONNECT_DISCONNECT_KEY_V3, (tostring(b6)))
			t25.AppStorageService:Flush()
		end))
	end

	return (pcall(function() -- line: 2117
		-- upvalues: t25 (copy), GetFFlagEnableSeamlessVoiceV2 (copy), Constants (copy), b6 (copy)
		t25.AppStorageService:SetItem(if not GetFFlagEnableSeamlessVoiceV2() then Constants.VOICE_CONNECT_DISCONNECT_KEY else Constants.VOICE_CONNECT_DISCONNECT_KEY_V2, (tostring(b6)))
		t25.AppStorageService:Flush()
	end))
end
function t2.GetVoiceRewarmCookie(p125) -- line: 2130
	-- upvalues: Constants (copy), v29 (copy)
	local ok, result = pcall(function() -- line: 2131
		-- upvalues: p125 (copy), Constants (copy)
		return p125.AppStorageService:GetItem(Constants.VOICE_REWARM_KEY)
	end)

	if ok and result then
		v29:debug("Got voice re-warm cookie: {}", result)

		return result
	end

	v29:debug("Voice re-warm cookie not set, returning empty string")

	return ""
end
function t2.SetVoiceRewarmCookie(t26: {[any]: any}, s8: string) -- line: 2144
	-- upvalues: v29 (copy), Constants (copy)
	v29:debug("Setting voice re-warm cookie to {}", s8)
	pcall(function() -- line: 2146
		-- upvalues: t26 (copy), Constants (copy), s8 (copy)
		t26.AppStorageService:SetItem(Constants.VOICE_REWARM_KEY, (tostring(s8)))
		t26.AppStorageService:Flush()
	end)
end
function t2.ShouldRewarmUser(p126) -- line: 2152
	return p126:GetVoiceRewarmCookie() == ""
end
function t2.RewarmUser(p127) -- line: 2156
	p127:SetVoiceRewarmCookie("true")
end
function t2.SetNewUserFTUXCookieValue(t27: {[any]: any}, b7: boolean) -- line: 2160
	-- upvalues: Constants (copy)
	return (pcall(function() -- line: 2161
		-- upvalues: t27 (copy), Constants (copy), b7 (copy)
		t27.AppStorageService:SetItem(Constants.SEAMLESS_VOICE_FTUX_KEY, (tostring(b7)))
		t27.AppStorageService:Flush()
	end))
end
function t2.SetAndSyncActive(t28: {[any]: any}, p128, b8: boolean) -- line: 2168
	-- upvalues: Players (copy)
	p128.Active = b8

	local SendMuteEvent = t28:GetSendMuteEvent()

	if SendMuteEvent and p128.Player == Players.LocalPlayer then
		SendMuteEvent:FireServer(b8)
	end
end
function t2.CreateAudioDeviceData(t29: {[any]: any}, p129) -- line: 2177
	-- upvalues: Players (copy), EngineFeature (copy), v33 (copy), v29 (copy), v34 (copy)
	local t30 = {}
	local u360 = p129.Player == Players.LocalPlayer

	if EngineFeature then
		if not p129.MutedByLocalUser then
			if t29.muteAll and not u360 then
				p129.MutedByLocalUser = true
			end

			if p129.Player and t29.mutedPlayers[p129.Player.UserId] then
				p129.MutedByLocalUser = true
			end
		end
	elseif p129.Active then
		if t29.muteAll and not u360 then
			p129.Active = false
		end

		if p129.Player and t29.mutedPlayers[p129.Player.UserId] then
			p129.Active = false
		end
	end

	if v33 and p129.Active and u360 and t29.localMuted == nil then
		t29:SetAndSyncActive(p129, false)
	end

	if u360 and t29.localMuted ~= nil and t29.localMuted ~= not p129.Active and not t29.isInCall then
		v29:debug("Mismatch between LocalMuted and device.Active")

		local v361 = not t29.localMuted

		p129.Active = v361

		local SendMuteEvent = t29:GetSendMuteEvent()

		if SendMuteEvent then
			SendMuteEvent:FireServer(v361)
		end
	elseif t29.isInCall and u360 then
		local v363 = not t29.callMutedState

		v29:debug("Overwriting Active State to match Iris call. .Active = {}", v363)
		p129.Active = v363

		local SendMuteEvent = t29:GetSendMuteEvent()

		if SendMuteEvent then
			SendMuteEvent:FireServer(v363)
		end
	end

	t30.onPlayerChanged = p129:GetPropertyChangedSignal("Player"):Connect(function() -- line: 2229
		-- upvalues: v34 (copy), u360 (ref), p129 (copy), Players (copy), v33 (copy), t29 (copy), v29 (copy), EngineFeature (copy)
		if v34 then
			u360 = p129.Player == Players.LocalPlayer

			if u360 then
				if v33 and p129.Active and t29.localMuted == nil then
					t29:SetAndSyncActive(p129, false)
				elseif t29.localMuted ~= nil and t29.localMuted ~= not p129.Active then
					v29:debug("Mismatch between LocalMuted and device.Active")
					t29:SetAndSyncActive(p129, not t29.localMuted)
				end
			elseif t29.muteAll or p129.Player and t29.mutedPlayers[p129.Player.UserId] then
				if EngineFeature then
					p129.MutedByLocalUser = true
				else
					p129.Active = false
				end
			end
		end

		t29:emit("OnDevicePlayerChanged")
		t29:StartAnalysis(p129)
	end)
	t30.onMutedChanged = p129:GetPropertyChangedSignal("Muted"):Connect(function() -- line: 2254
		-- upvalues: t29 (copy)
		t29:emit("OnDeviceMuteChanged")
	end)

	if not EngineFeature then
		t30.onActiveChanged = p129:GetPropertyChangedSignal("Active"):Connect(function() -- line: 2259
			-- upvalues: t29 (copy), u360 (ref), p129 (copy)
			t29:emit("OnDeviceActiveChanged")

			if t29.muteAll and not u360 then
				p129.Active = false
			end

			if p129.Player and t29.mutedPlayers[p129.Player.UserId] then
				p129.Active = false
			end
		end)
	end

	return t30
end
function t2.onInstanceRemove(t31: {[any]: any}, p130) -- line: 2273
	-- upvalues: v29 (copy), EngineFeature (copy), v66 (copy)
	if p130:IsA("AudioDeviceInput") then
		t31:StopAnalysis(p130)
		v29:trace("Removing AudioDeviceInput {} {} {}", p130, "for user", p130.Player and p130.Player.UserId)

		local v367 = t31.audioDevices[p130]

		if v367 then
			if not EngineFeature then
				v367.onActiveChanged:Disconnect()
			end

			v367.onMutedChanged:Disconnect()
			v367.onPlayerChanged:Disconnect()
		end

		t31.audioDevices[p130] = nil
		t31:emit("OnAudioDeviceInputRemoved")

		if v66 and p130.Player then
			t31:GetAnalyzer(p130.Player):Destroy()
		end
	end
end
function t2.hookupAudioDeviceInputListener(p131) -- line: 2294
	-- upvalues: v29 (copy), Players (copy), v32 (copy), SoundService (copy), VoiceChatService (copy), CollectionService (copy), Utils (copy)
	v29:debug("Hooking up audio device listeners")

	local LocalPlayer = Players.LocalPlayer

	if v32 then
		SoundService.AudioInstanceAdded:Connect(function(p132) -- line: 2298
			-- upvalues: p131 (copy)
			p131:onInstanceAdded(p132)
		end)
	else
		game.DescendantAdded:Connect(function(descendant) -- line: 2302
			-- upvalues: p131 (copy)
			p131:onInstanceAdded(descendant)
		end)
	end

	local AudioDeviceInput = LocalPlayer:FindFirstChildOfClass("AudioDeviceInput")

	v29:debug("Found local user audio device {}", AudioDeviceInput)

	if AudioDeviceInput then
		p131:onInstanceAdded(AudioDeviceInput)
	end

	if VoiceChatService.EnableDefaultVoice then
		v29:debug("Creating default voice listener")

		if not game:GetEngineFeature("SoundServiceControlsDefaultListenerLocation") then
			local AudioListener = Instance.new("AudioListener")

			AudioListener.Parent = workspace.CurrentCamera

			local Wire = Instance.new("Wire")

			Wire.Parent = AudioListener

			local AudioDeviceOutput = Instance.new("AudioDeviceOutput")

			AudioDeviceOutput.Parent = Wire
			Wire.SourceInstance = AudioListener
			Wire.TargetInstance = AudioDeviceOutput
		end

		for _, v375 in CollectionService:GetTagged("RbxDefaultVoiceEmitter") do
			Utils.destroyDefaultEmitter(v375)
		end

		CollectionService:GetInstanceAddedSignal("RbxDefaultVoiceEmitter"):Connect(Utils.destroyDefaultEmitter)
		LocalPlayer.CharacterAdded:Connect(Utils.avoidEmitting)

		if LocalPlayer.Character then
			Utils.avoidEmitting(LocalPlayer.Character)
		end
	end

	game.DescendantRemoving:Connect(function(descendant) -- line: 2338
		-- upvalues: p131 (copy)
		p131:onInstanceRemove(descendant)
	end)

	for _, v377 in game:GetDescendants() do
		p131:onInstanceAdded(v377)
	end

	Players.PlayerRemoving:Connect(function(player) -- line: 2347
		-- upvalues: p131 (copy)
		for v486 in p131.audioDevices do
			if v486.Player and player == v486.Player then
				p131:onInstanceRemove(v486)
			end
		end
	end)
end
function t2.RejoinCurrentChannel(p133) -- line: 2357
	-- upvalues: v29 (copy)
	pcall(function() -- line: 2358
		-- upvalues: p133 (copy), v29 (copy)
		local GroupId = p133.service:GetGroupId()

		if GroupId and GroupId ~= "" then
			local v488 = p133.service:IsPublishPaused()

			p133.service:Leave()
			v29:debug("Rejoining current channel {}", GroupId)
			p133.participants = {}
			p133.participantsUpdate:Fire(p133.participants)

			if not p133.service:JoinByGroupIdToken(GroupId, v488, true) then
				p133:emit("OnInitialJoinFailed")
			end
		end
	end)
end
function t2.RejoinChannel(p134, p135, p136) -- line: 2374
	-- upvalues: v29 (copy)
	v29:debug("Rejoining previous channel {} with mute status {}", p135, p136)

	if p135 and p135 ~= "" then
		pcall(function() -- line: 2378
			-- upvalues: p134 (copy), p135 (copy), p136 (copy)
			p134.service:Leave()
			p134.participants = {}
			p134.participantsUpdate:Fire(p134.participants)

			if not p134.service:JoinByGroupIdToken(p135, p136, true) then
				p134:emit("OnInitialJoinFailed")
			end
		end)
	end
end
function t2.RejoinVoice(p137) -- line: 2390
	-- upvalues: GetFFlagVoiceChatClientRewriteMasterLua (copy), v29 (copy), VoiceChatService (copy)
	if GetFFlagVoiceChatClientRewriteMasterLua() then
		v29:debug("Rejoining voice")
		p137.participants = {}
		p137.participantsUpdate:Fire(p137.participants)
		VoiceChatService:rejoinVoice()
	end
end
function t2.watchSignalR(p138) -- line: 2401
	-- upvalues: WATCHED_NAMESPACES (copy), Utils (copy), GetFFlagUseLuaSignalrConsumer (copy), v29 (copy)
	p138.signalRConnection = p138.NotificationService.RobloxEventReceived:Connect(function(t32: {[any]: any}) -- line: 2402
		-- upvalues: WATCHED_NAMESPACES (copy), Utils (copy), GetFFlagUseLuaSignalrConsumer (copy), p138 (copy), v29 (copy)
		local namespace = t32.namespace

		if not WATCHED_NAMESPACES[namespace] then
			return
		end

		local v491 = Utils.jsonDecode(t32.detail)

		if GetFFlagUseLuaSignalrConsumer() then
			local v492 = p138.SignalREventTable[v491.type]

			if v492 then
				v492:Fire(v491)
			end
		end

		local SequenceNumber = v491.SequenceNumber

		v29:trace("SignalR message {}: {}", namespace, SequenceNumber)

		local v494 = p138:checkAndUpdateSequence(namespace, SequenceNumber)

		if v494 > 0 then
			p138.Analytics:reportReconnectDueToMissedSequence()

			return
		end

		if v494 < -1 then
			p138.Analytics:reportOutOfOrderSequence()
		end
	end)
	p138.signalRConnectionChanged = p138.NotificationService.RobloxConnectionChanged:Connect(function(p139, p140, _, p142) -- line: 2428
		-- upvalues: v29 (copy), Utils (copy), WATCHED_NAMESPACES (copy), p138 (copy)
		if p139 == "signalR" then
			if p140 ~= Enum.ConnectionState.Connected then
				v29:info("SignalR disconnected")

				return
			end

			for k, v in pairs(Utils.jsonDecode(p142)) do
				if WATCHED_NAMESPACES[k] then
					v29:trace("SignalR message {}: {}", k, v)

					local v501 = p138:checkAndUpdateSequence(k, v)

					if v501 > 0 then
						p138.Analytics:reportReconnectDueToMissedSequence()
					elseif v501 < -1 then
						p138.Analytics:reportOutOfOrderSequence()
					end
				end
			end
		end
	end)
end
function t2.StopSignalRConnection(p143) -- line: 2453
	if p143.signalRConnectionChanged then
		p143.signalRConnectionChanged:Disconnect()
		p143.signalRConnectionChanged = nil
	end

	if p143.signalRConnection then
		p143.signalRConnection:Disconnect()
		p143.signalRConnection = nil
	end
end
function t2.getService(p144) -- line: 2464
	return p144.service
end
function t2.ToggleMic(t33: {[any]: any}, s9: string?) -- line: 2468
	-- upvalues: v29 (copy), GetFFlagJoinWithoutMicPermissions (copy), PERMISSION_STATE (copy), PermissionsProtocol (copy), VoiceChatService (copy), Players (copy)
	t33:ensureInitialized("toggle mic")

	if t33.localMuted == nil then
		v29:trace("ToggleMic context: {} - Voice not connected yet", s9)

		return
	end

	v29:trace("ToggleMic context: {}", s9)

	if GetFFlagJoinWithoutMicPermissions() then
		if t33.permissionState == PERMISSION_STATE.PENDING_MIC then
			v29:debug("In pending mic mode, requesting permission")
			t33:emit("GetPermissions", function(p145) -- line: 2481
				-- upvalues: t33 (copy), PERMISSION_STATE (copy), v29 (copy), s9 (copy)
				t33.permissionState = if not p145.hasMicPermissions then PERMISSION_STATE.LISTEN_ONLY else PERMISSION_STATE.LISTEN_AND_TALK
				v29:debug("Got permissions, setting state to {}", t33.permissionState)
				t33:ToggleMic(s9)
			end, { PermissionsProtocol.Permissions.MICROPHONE_ACCESS }, false)

			return
		end

		if t33.permissionState == PERMISSION_STATE.LISTEN_ONLY then
			v29:debug("User tried to unmute despite being in listen only mode")
			t33:emit("OnPermissionRequested")

			return
		end
	end

	if t33.isPlayerWatchingAd then
		v29:trace("User is watching an ad, skipping toggling mic")

		return
	end

	if VoiceChatService.UseNewAudioApi then
		t33.localMuted = not t33.localMuted

		local v388 = not t33.localMuted

		v29:trace("Setting self mute to {} context: {}", v388, s9)

		local SendMuteEvent = t33:GetSendMuteEvent()

		if SendMuteEvent then
			SendMuteEvent:FireServer(v388)

			for v390 in t33.audioDevices do
				if v390.Player and v390.Player == Players.LocalPlayer then
					v390.Active = v388
				end
			end

			t33.muteChanged:Fire(t33.localMuted)
		else
			v29:error("Could not find SendMuteEvent")
		end
	else
		local v391 = not t33.service:IsPublishPaused()

		v29:trace("Setting self mute to {} context: {}", v391, s9)
		t33.service:PublishPause(v391)
		t33.localMuted = v391
		t33.muteChanged:Fire(v391)
	end

	if not t33.localMuted then
		t33.talkingChanged:Fire(t33.isTalking)
		t33:emit("OnShowDataConsentToast")
	end

	if s9 then
		t33.Analytics:reportVoiceMuteSelf((t33:JoinWithVoiceMuteData({
			context = s9,
			muted = t33.localMuted
		})))
	end
end
function t2.ToggleVoiceChanger(t34: {[any]: any}, _: string?) -- line: 2542
	-- upvalues: VoiceChatService (copy), v29 (copy)
	t34:ensureInitialized("toggle voice changer")

	if t34.localMuted == nil then
		return
	end

	if VoiceChatService.UseNewAudioApi then
		t34.isVoiceChangerActive = not t34.isVoiceChangerActive
		v29:trace("setting voice changer active to {}", t34.isVoiceChangerActive)

		local ToggleVoiceChangerEvent = t34:GetToggleVoiceChangerEvent()

		if ToggleVoiceChangerEvent then
			ToggleVoiceChangerEvent:FireServer(t34.isVoiceChangerActive)
			t34.voiceChangerChanged:Fire(t34.isVoiceChangerActive)

			return
		end

		v29:error("Could not find ToggleVoiceChangerEvent")

		return
	end

	t34.isVoiceChangerActive = false
	v29:trace("forcibly disabling voice changer since using old audio api", t34.isVoiceChangerActive)

	local ToggleVoiceChangerEvent = t34:GetToggleVoiceChangerEvent()

	if ToggleVoiceChangerEvent then
		ToggleVoiceChangerEvent:FireServer(t34.isVoiceChangerActive)
		t34.voiceChangerChanged:Fire(t34.isVoiceChangerActive)

		return
	end

	v29:error("Could not find ToggleVoiceChangerEvent")
end
function t2.ToggleVoiceChangerHearMyself(t35: {[any]: any}, _: string?) -- line: 2572
	-- upvalues: VoiceChatService (copy), v29 (copy)
	if t35.localMuted == nil then
		return
	end

	if VoiceChatService.UseNewAudioApi then
		t35.isVoiceChangerHearMyselfActive = not t35.isVoiceChangerHearMyselfActive

		local InputToModifierWire = t35:GetInputToModifierWire()
		local PartyVoiceDeviceInput = t35:GetPartyVoiceDeviceInput()

		if InputToModifierWire and PartyVoiceDeviceInput then
			v29:trace("setting voice changer hear myself active to {}", t35.isVoiceChangerHearMyselfActive)

			if t35.isVoiceChangerHearMyselfActive then
				InputToModifierWire.SourceInstance = PartyVoiceDeviceInput
			else
				InputToModifierWire.SourceInstance = nil
			end

			t35.voiceChangerHearMyselfChanged:Fire(t35.isVoiceChangerHearMyselfActive)

			return
		end

		v29:error("Could not find InputToModifierWire or PartyVoiceDeviceInput")
	end
end
function t2.SetVoicePack(t36: {[any]: any}, s12: string) -- line: 2597
	-- upvalues: VoiceChatService (copy), v29 (copy)
	t36:ensureInitialized("set voice pack")

	if t36.localMuted == nil then
		return
	end

	if VoiceChatService.UseNewAudioApi then
		t36.currentVoicePack = s12
		v29:trace("setting current voice pack to {}", t36.currentVoicePack)

		local SetVoicePackEvent = t36:GetSetVoicePackEvent()

		if SetVoicePackEvent then
			SetVoicePackEvent:FireServer("VoicePack_" .. t36.currentVoicePack)

			return
		end

		v29:error("Could not find SetVoicePackEvent")
	end
end
function t2.JoinWithVoiceMuteData(p146, p147) -- line: 2616
	-- upvalues: Players (copy), Cryo (copy)
	local LocalPlayer = Players.LocalPlayer

	return Cryo.Dictionary.join({
		userId = LocalPlayer.UserId,
		clientSessionId = p146:GetSessionId(),
		channelId = p146:GetChannelId()
	}, p147)
end
function t2._reportJoinFailed(p148, p149, p150) -- line: 2625
	-- upvalues: GetFFlagEnableLuaVoiceChatAnalytics (copy)
	if GetFFlagEnableLuaVoiceChatAnalytics() then
		p148.Analytics:reportVoiceChatJoinResult(false, p149, p150)
	end

	p148:emit("OnReportJoinFailed", p149)
end
function t2._asyncInit(p151) -- line: 2632
	-- upvalues: v29 (copy), MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED (copy), GetFFlagVoiceChatClientRewriteMasterLua (copy), VoiceChatService (copy), Analytics (copy), Promise (copy)
	p151:CheckCallState()

	return p151:canUseServiceAsync():andThen(function(_) -- line: 2635
		-- upvalues: v29 (copy), MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED (copy), p151 (copy), GetFFlagVoiceChatClientRewriteMasterLua (copy), VoiceChatService (copy), Analytics (copy), Promise (copy)
		local s13 = "VoiceChatService"

		if game:GetEngineFeature("UseNewVoiceChatService") then
			s13 = "VoiceChatInternal"
			v29:debug("Using VoiceChatInternal")
		end

		local ok, result = pcall(function() -- line: 2641
			-- upvalues: s13 (ref), MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED (copy), p151 (copy)
			local s13_2 = game:GetService(s13)

			if s13_2 and (s13_2:GetVoiceChatApiVersion() < MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED or s13_2:IsContextVoiceEnabled()) then
				p151.voiceEnabled = true
				p151.service = s13_2
				p151:SetupParticipantListeners()
			end
		end)

		if GetFFlagVoiceChatClientRewriteMasterLua() then
			VoiceChatService:joinVoice()
			v29:debug("Starting Voice Chat Client Join Operation")
		else
			local VoiceChatService2 = game:GetService("VoiceChatService")

			if VoiceChatService2 then
				VoiceChatService2:joinVoice()
				v29:debug("Starting Voice Chat Client Join Operation")
			end
		end

		if not ok then
			v29:warning("EnableVoiceChat flag is enabled but GetService panicked {}", result)
			p151:_reportJoinFailed("getServiceFailed", Analytics.ERROR)

			if p151.options.passInitErrorInPromiseReject then
				return Promise.reject({
					code = "INIT_ERROR_GET_SERVICE_FAILED"
				})
			end

			return Promise.reject()
		end

		if not p151.service then
			v29:debug("VoiceChatService is not set after init")
			p151:_reportJoinFailed("contextNotEnabled")

			if p151.options.passInitErrorInPromiseReject then
				return Promise.reject({
					code = "INIT_ERROR_CONTEXT_NOT_ENABLED"
				})
			end

			return Promise.reject()
		end

		p151:emit("OnVoiceChatServiceInitialized")
		p151:watchSignalR()

		return Promise.resolve()
	end)
end
function t2.UpdateLocalMetering(p153) -- line: 2691
	-- upvalues: Players (copy), v40 (copy)
	p153.isTalking = p153:IsSignalActive(Players.LocalPlayer.UserId)

	if p153.localMuted == false then
		if v40 then
			p153:FireTalkingChangedDebounced(p153.isTalking)

			return
		end

		p153.talkingChanged:Fire(p153.isTalking)
	end
end
function t2.FireTalkingChangedDebounced(p154, p155) -- line: 2702
	-- upvalues: v41 (copy)
	local v413 = v41
	local v414 = tick() * 1000

	if v413 < v414 - p154._lastTalkingChangedFireTime then
		p154._lastTalkingChangedFireTime = v414
		p154.talkingChanged:Fire(p155)
	end
end
function t2.asyncInit(p156) -- line: 2712
	-- upvalues: v29 (copy), Promise (copy), v31 (copy), HttpService (copy), GetFFlagShowLikelySpeakingBubbles (copy), v64 (copy), Constants (copy), FFlagEnablePartyVoiceChangersInLua (copy), v35 (copy)
	if p156.service then
		v29:trace("Manager already initialized")

		return Promise.resolve()
	end

	if not p156.initPromise then
		p156.initPromise = p156:_asyncInit()

		if v31 and not p156.LikelySpeakingUsersEvent then
			task.spawn(function() -- line: 2724
				-- upvalues: p156 (copy), v29 (copy), HttpService (copy), GetFFlagShowLikelySpeakingBubbles (copy)
				local LikelySpeakingUsersEvent = p156:GetLikelySpeakingUsersEvent()

				if LikelySpeakingUsersEvent then
					v29:trace("Connecting to likely speaking users")
					LikelySpeakingUsersEvent.OnClientEvent:Connect(function(p157) -- line: 2728
						-- upvalues: v29 (copy), HttpService (copy), GetFFlagShowLikelySpeakingBubbles (copy), p156 (copy)
						v29:trace("New Likely Speaking Users: {}", HttpService:JSONEncode(p157))

						if GetFFlagShowLikelySpeakingBubbles() and p156:UserEligibleForLikelySpeakingBubbles() then
							p156:emit("OnLikelySpeakingUsersUpdated", p157)
						end
					end)
				end
			end)
		end

		if v64 then
			v29:trace("Polling for likely speaking users")
			task.spawn(function() -- line: 2742
				-- upvalues: p156 (copy)
				p156:SendLikelySpeakingPing()
			end)
		end

		if p156.AdService then
			(function(p158) --[[ setupRewardedAdMuting ]] -- line: 2748
				-- upvalues: Constants (copy)
				local u510 = false

				p158.AdService.RewardedVideoAdStarted:Connect(function() -- line: 2750
					-- upvalues: p158 (copy), u510 (ref), Constants (copy)
					if p158.localMuted == nil then
						return
					end

					u510 = p158.localMuted

					if not p158.localMuted then
						p158:ToggleMic(Constants.REWARDED_VIDEO_AD_STARTED)
					end

					p158.isPlayerWatchingAd = true
				end)
				p158.AdService.RewardedVideoAdEnded:Connect(function() -- line: 2766
					-- upvalues: p158 (copy), u510 (ref), Constants (copy)
					if p158.localMuted == nil then
						return
					end

					p158.isPlayerWatchingAd = false

					if u510 ~= p158.localMuted then
						p158:ToggleMic(Constants.REWARDED_VIDEO_AD_ENDED)
					end
				end)
			end)(p156)
		end

		if FFlagEnablePartyVoiceChangersInLua and not p156.voiceChangerWasToggledEvent then
			task.spawn(function() -- line: 2786
				-- upvalues: p156 (copy), v35 (copy)
				local VoiceChangerWasToggledEvent = p156:GetVoiceChangerWasToggledEvent()

				if VoiceChangerWasToggledEvent then
					VoiceChangerWasToggledEvent.OnClientEvent:Connect(function(n7: number, b9: boolean) -- line: 2790
						-- upvalues: v35 (copy), p156 (copy)
						local v519 = if not v35 then p156.participants[n7] else p156.participants[tostring(n7)]

						if v519 then
							v519.isVoiceChangerActive = b9
							p156.voiceChangerActivePlayers[n7] = b9
							p156.participantsUpdate:Fire(p156.participants)
						end
					end)
				end
			end)
		end
	end

	return p156.initPromise
end
function t2.GetLikelySpeakingUsersEvent(p159) -- line: 2810
	-- upvalues: RobloxReplicatedStorage (copy)
	if not p159.LikelySpeakingUsersEvent then
		p159.LikelySpeakingUsersEvent = RobloxReplicatedStorage:WaitForChild("SendLikelySpeakingUsers", 3)
	end

	return p159.LikelySpeakingUsersEvent
end
function t2.GetReceiveLikelySpeakingEvent(p160) -- line: 2818
	-- upvalues: RobloxReplicatedStorage (copy)
	if not p160.ReceiveLikelySpeakingUsersEvent then
		p160.ReceiveLikelySpeakingUsersEvent = RobloxReplicatedStorage:WaitForChild("ReceiveLikelySpeakingUsers", 3)
	end

	return p160.ReceiveLikelySpeakingUsersEvent
end
function t2.SendLikelySpeakingPing(p161) -- line: 2826
	-- upvalues: v29 (copy)
	p161:FetchVoicePermissions()

	local ReceiveLikelySpeakingEvent = p161:GetReceiveLikelySpeakingEvent()

	if not ReceiveLikelySpeakingEvent or not p161:UserEligibleForLikelySpeakingBubbles() then
		v29:debug("Could not find likely speaking users event.")

		return
	end

	v29:trace("Sending likely speaking user event")
	ReceiveLikelySpeakingEvent:FireServer()
end
function t2.IsInitialized(p162) -- line: 2837
	if p162.service then
		return true
	end

	return false
end
function t2.ensureInitialized(p163, p164) -- line: 2841
	if not p163.service then
		error("[corescripts VCS Manager] " .. "Attempting to " .. p164 .. " before calling init")
	end
end
function t2.GetSessionId(p165) -- line: 2848
	p165:ensureInitialized("get session id")

	return p165.service:GetSessionId()
end
function t2.GetChannelId(p166) -- line: 2853
	p166:ensureInitialized("get channel id")

	return p166.service:GetChannelId()
end
function t2.Disconnect(p167) -- line: 2858
	-- upvalues: v72 (copy)
	if p167.participantConnection then
		p167.participantConnection:Disconnect()
		p167.participantConnection = nil
	end

	if p167.stateConnection then
		p167.stateConnection:Disconnect()
		p167.stateConnection = nil
	end

	if p167.micConnection then
		p167.micConnection:Disconnect()
		p167.micConnection = nil
	end

	if p167.blockConnection then
		p167.blockConnection:Disconnect()
		p167.blockConnection = nil
	end

	if p167.playerModeratedConnection then
		p167.playerModeratedConnection:Disconnect()
		p167.playerModeratedConnection = nil
	end

	if p167.voiceToxicityModalConnection then
		p167.voiceToxicityModalConnection:Disconnect()
		p167.voiceToxicityModalConnection = nil
	end

	if p167.VoiceToxicityToastConnection then
		p167.VoiceToxicityToastConnection:Disconnect()
		p167.VoiceToxicityToastConnection = nil
	end

	if p167.voiceReverseNudgeConnection then
		p167.voiceReverseNudgeConnection:Disconnect()
		p167.voiceReverseNudgeConnection = nil
	end

	if p167.tempSetMicMutedToggleMicConnection then
		p167.tempSetMicMutedToggleMicConnection:Disconnect()
		p167.tempSetMicMutedToggleMicConnection = nil
	end

	if v72 and p167.videoCaptureInProgressConnection then
		p167.videoCaptureInProgressConnection:Disconnect()
		p167.videoCaptureInProgressConnection = nil
	end
end
function t2.RequestHidePublicVoiceUI(p168) -- line: 2909
	task.defer(function() -- line: 2910
		-- upvalues: p168 (copy)
		p168.setVoiceUIVisibility:Fire(false)
	end)
end
function t2.RequestShowPublicVoiceUI(p169) -- line: 2915
	task.defer(function() -- line: 2916
		-- upvalues: p169 (copy)
		p169.setVoiceUIVisibility:Fire(true)
	end)
end

t2.default = t2.new(BlockingUtility:GetAfterBlockedStatusChangedEvent(), PermissionsProtocol.default, HttpRbxApiService, nil, nil, nil, nil, nil, ThirdPartyUserService, nil, AdService)

return t2
