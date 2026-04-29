local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local VoiceChatService = game:GetService("VoiceChatService")
local Promise = require(CorePackages.Packages.Promise)
local Roact = require(CorePackages.Packages.Roact)
local LuauPolyfill = require(CorePackages.Packages.LuauPolyfill)
local PermissionsProtocol = require(CorePackages.Workspace.Packages.PermissionsProtocol).PermissionsProtocol
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local NotificationService = game:GetService("NotificationService")
local LocalizationService = game:GetService("LocalizationService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local AppStorageService = game:GetService("AppStorageService")
local SocialUpsell = require(CorePackages.Workspace.Packages.SocialUpsell)
local default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local v18 = require(CorePackages.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local VoiceChatCore = require(CorePackages.Workspace.Packages.VoiceChatCore)
local default2 = require(CorePackages.Workspace.Packages.VoiceChat).GlobalVoiceManager.default
local GetFFlagDisableConsentModalForExistingUsers = require(script.Parent.Flags.GetFFlagDisableConsentModalForExistingUsers)
local GetFFlagOnlyEnableJoinVoiceInVoiceEnabledUniverses = require(script.Parent.Flags.GetFFlagOnlyEnableJoinVoiceInVoiceEnabledUniverses)
local GetFFlagUpdateVoiceConnectionToasts = require(script.Parent.Flags.GetFFlagUpdateVoiceConnectionToasts)
local GetFFlagEnableUniveralVoiceToasts = require(RobloxGui.Modules.Flags.GetFFlagEnableUniveralVoiceToasts)
local GetFFlagEnableVoicePromptReasonText = require(RobloxGui.Modules.Flags.GetFFlagEnableVoicePromptReasonText)
local GetFFlagAvatarChatServiceEnabled = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled
local GetFFlagVoiceChatServiceManagerUseAvatarChat = VoiceChatCore.Flags.GetFFlagVoiceChatServiceManagerUseAvatarChat
local GetFFlagUseLuaSignalrConsumer = VoiceChatCore.Flags.GetFFlagUseLuaSignalrConsumer
local GetFFlagNonVoiceFTUX = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagNonVoiceFTUX
local GetFFlagJoinWithoutMicPermissions = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagJoinWithoutMicPermissions
local GetFIntVoiceReverseNudgeUXDisplayTimeSeconds = require(RobloxGui.Modules.Flags.GetFIntVoiceReverseNudgeUXDisplayTimeSeconds)
local EngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local GetFFlagEnableSeamlessVoiceDataConsentToast = require(RobloxGui.Modules.Flags.GetFFlagEnableSeamlessVoiceDataConsentToast)
local GetFFlagSeamlessVoiceConsentToastPolicy = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagSeamlessVoiceConsentToastPolicy
local GetFFlagEnableFtuxExitOnMuteToggle = VoiceChatCore.Flags.GetFFlagEnableFtuxExitOnMuteToggle
local GetFFlagEnableVoiceChatMuteForVideoCaptures = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableVoiceChatMuteForVideoCaptures
local GetFFlagEnableCrossExperienceVoiceCaptureMute = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExperienceVoiceCaptureMute
local GetFFlagExpChatUseVoiceParticipantsStore = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagExpChatUseVoiceParticipantsStore
local GetFFlagEnableVoiceUxUpdates = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableVoiceUxUpdates
local GetFFlagShowToastWhenAgeGatingVoice = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagShowToastWhenAgeGatingVoice
local GetFFlagEnableVoiceTrustedConnectionsToasts = require(script.Parent.Flags.GetFFlagEnableVoiceTrustedConnectionsToasts)
local v43 = game:DefineFastFlag("FixNudgeDeniedEvents", false)
local v44 = game:DefineFastFlag("DebugShowAudioDeviceInputDebugger", false)
local v45 = game:DefineFastFlag("DebugSkipVoicePermissionCheck", false)
local v46 = game:DefineFastFlag("DebugSimulateConnectDisconnect", false)
local v47 = game:DefineFastFlag("DebugSkipSeamlessVoiceAPICheck", false)
local v48 = game:DefineFastFlag("FixSTUXShowingIncorrectly", false)
local v49 = game:DefineFastFlag("SendUserConnectionStatus", false)
local v50 = game:DefineFastInt("DebugConnectDisconnectInterval", 15)
local v51 = game:DefineFastFlag("SeamlessVoiceV2JoinVoiceToast", false)
local v52 = game:DefineFastFlag("DisablePermissionPromptDeeplink", false)
local v53 = game:DefineFastFlag("VoiceEndedCheckDisregardIdleState", false)
local v54 = game:DefineFastFlag("DisableMicRejectedPromiseReject", false)
local v55 = game:DefineFastFlag("DisableLeaveToastInStudio", false)
local v56 = game:DefineFastFlag("EnableVerifiedCheckViaOverlay", false)
local v57 = game:DefineFastFlag("InExperienceVoiceUpsellAnalyticsV2", false)
local GetFIntThrottleParticipantsUpdateMs = VoiceChatCore.Flags.GetFIntThrottleParticipantsUpdateMs
local GetFFlagEnableConnectDisconnectInSettingsAndChrome = require(RobloxGui.Modules.Flags.GetFFlagEnableConnectDisconnectInSettingsAndChrome)
local v60 = game:DefineFastString("VoiceUIImprovementsIXPLayerName", "Voice.Exposure")
local v61 = game:DefineFastString("ThrottleParticipantsUpdateIXPLayerValue", "ThrottleParticipantsUpdate")
local v62 = game:DefineFastInt("SeamlessVoiceSTUXDisplayCount", 3)
local GetFFlagShowLikelySpeakingBubbles = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagShowLikelySpeakingBubbles
local GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints
local GetFFlagShowDevicePermissionsModal = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagShowDevicePermissionsModal
local FFlagEnableRetryForLinkingProtocolFetch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableRetryForLinkingProtocolFetch
local v67 = game:DefineFastFlag("SeamlessVoiceBugfixesV1", false)
local v68 = game:DefineFastFlag("ShowJoinVoiceWhenDisconnected", false)
local FFlagVoiceRewarmTelemetry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagVoiceRewarmTelemetry
local t1 = {
	FAE_UPSELL = "FaeUpsell",
	VOICE_FTUX = "VoiceFtux",
	REWARM = "Rewarm"
}
local t2 = {
	REJOIN_PREVIOUS_CHANNEL = "RejoinPreviousChannel",
	EXIT_FTUX = "ExitFtux",
	MIC_PERMISSION_PROMPT = "MicPermissionPrompt",
	FIRST_JOIN_SESSION = "FirstJoinSession",
	CONSENT_MODAL = "ConsentModal",
	AGE_CHECK_TOAST = "AgeCheckToast",
	PHONE_UPSELL = "PhoneUpsell",
	FAE_UPSELL = "FaeUpsell"
}
local GetFFlagIntegratePhoneUpsellJoinVoice = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagIntegratePhoneUpsellJoinVoice
local GetFFlagInExperiencePhoneUpsellNewCopy = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagInExperiencePhoneUpsellNewCopy
local GetFFlagCheckUniversePlaceBeforeSuspending = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagCheckUniversePlaceBeforeSuspending
local FIntLinkingProtocolFetchRetries = require(CorePackages.Workspace.Packages.SharedFlags).FIntLinkingProtocolFetchRetries
local FIntLinkingProtocolFetchTimeoutMS = require(CorePackages.Workspace.Packages.SharedFlags).FIntLinkingProtocolFetchTimeoutMS
local v77 = game:DefineFastFlag("FixOutputDeviceChange", false)
local VoiceChat = require(CorePackages.Workspace.Packages.VoiceChat)
local Constants = VoiceChat.Constants
local PostRecordUserSeenGeneralModal = VoiceChat.AgeVerificationOverlay.PostRecordUserSeenGeneralModal
local Constants2 = require(RobloxGui.Modules.VoiceChat.Constants)
local VoiceChatPrompt = require(RobloxGui.Modules.VoiceChatPrompt.Components.VoiceChatPrompt)
local AudioDeviceInputDebugger = require(RobloxGui.Modules.VoiceChat.Components.AudioDeviceInputDebugger)
local PromptType = require(RobloxGui.Modules.VoiceChatPrompt.PromptType)
local GetUserSettings = VoiceChat.GetUserSettings
local GetInformedOfBan = VoiceChat.GetInformedOfBan
local PostInformedOfBan = VoiceChat.PostInformedOfBan
local getCamMicPermissions = require(RobloxGui.Modules.Settings.getCamMicPermissions)
local BAN_REASON = Constants2.BAN_REASON
local SeamlessVoiceStatus = require(RobloxGui.Modules.Settings.Enum.SeamlessVoiceStatus)
local UniversalAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy)
local GetFFlagVoiceChatClientRewriteMasterLua = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagVoiceChatClientRewriteMasterLua
local GetFFlagVoiceChatClientRewriteDisableVCSDevice = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagVoiceChatClientRewriteDisableVCSDevice
local GetFFlagEnableSeamlessVoiceV2 = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableSeamlessVoiceV2
local GetFFlagDisconnectToastClientRewrite = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagDisconnectToastClientRewrite
local GetFFlagEnableVrVoiceParity = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableVrVoiceParity
local Analytics = VoiceChatCore.Analytics
local HttpService = game:GetService("HttpService")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local BlockingUtility = require(CorePackages.Workspace.Packages.BlockingUtility)
local MicrophoneDevicePermissionsLogging = require(RobloxGui.Modules.Settings.Resources.MicrophoneDevicePermissionsLogging)
local v102 = if not GetFFlagAvatarChatServiceEnabled() then nil else game:GetService("AvatarChatService")
local v103 = if not GetFFlagEnableVoiceChatMuteForVideoCaptures() then nil else game:GetService("CaptureService")
local ExpChat = require(CorePackages.Workspace.Packages.ExpChat)
local default3 = require(CorePackages.Workspace.Packages.LinkingProtocol).LinkingProtocol.default
local SettingsRoute = require(CorePackages.Workspace.Packages.LinkingProtocol).Enums.SettingsRoute
local v107 = if not GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints() then nil else require(CorePackages.Workspace.Packages.PhoneUpsell).PhoneUpsellController
local v108 = if not GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints() then nil else require(CorePackages.Workspace.Packages.PhoneUpsell).Http.Requests.PostPhoneUpsellDisplayed
local CoreVoiceManager = VoiceChatCore.CoreVoiceManager
local Constants3 = VoiceChatCore.Constants
local getOverlayStore = SocialUpsell.Overlay.getOverlayStore
local OverlayTypes = SocialUpsell.Overlay.OverlayTypes
local SocialUpsellType = SocialUpsell.Enum.SocialUpsellType
local Enum2 = SocialUpsell.Analytics.Enum
local SocialExperiments = require(CorePackages.Workspace.Packages.SocialExperiments)
local FFlagTestDeviceForFAEUpsell = SocialExperiments.FFlagTestDeviceForFAEUpsell
local deviceMeetsRequirementsForFAE = SocialExperiments.deviceMeetsRequirementsForFAE
local EngineFeature2 = game:GetEngineFeature("EnableMutedByLocalUser")
local FFlagEnablePartyVoiceChangersInLua = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnablePartyVoiceChangersInLua
local VOICE_STATE = Constants.VOICE_STATE
local VOICE_CHAT_DEVICE_TYPE = Constants.VOICE_CHAT_DEVICE_TYPE
local VOICE_CHAT_AVAILABILITY = Constants.VOICE_CHAT_AVAILABILITY
local MIN_VOICE_CHAT_API_VERSION = Constants.MIN_VOICE_CHAT_API_VERSION
local WATCHED_MESSAGE_TYPES = Constants.WATCHED_MESSAGE_TYPES
local PERMISSION_STATE = Constants.PERMISSION_STATE
local VOICE_JOIN_PROGRESS = Constants3.VOICE_JOIN_PROGRESS
local t3 = {
	available = nil,
	version = nil,
	participants = nil,
	recentUsersInteractionData = nil,
	permissionPromise = nil,
	canUseServicePromise = nil,
	localMuted = nil,
	isTalking = false,
	previousGroupId = nil,
	previousMutedState = nil,
	userEligible = false,
	HttpRbxApiService = HttpRbxApiService,
	NotificationService = NotificationService,
	runService = RunService,
	PermissionsService = PermissionsProtocol.default,
	communicationPermissionsResult = nil,
	VoiceJoinProgress = VOICE_JOIN_PROGRESS.Idle,
	VoiceJoinProgressChanged = Instance.new("BindableEvent"),
	participantJoined = Instance.new("BindableEvent"),
	participantLeft = Instance.new("BindableEvent"),
	participantsUpdate = Instance.new("BindableEvent"),
	muteChanged = Instance.new("BindableEvent"),
	muteAllChanged = Instance.new("BindableEvent"),
	attemptVoiceRejoin = Instance.new("BindableEvent"),
	showVoiceUI = Instance.new("BindableEvent"),
	hideVoiceUI = Instance.new("BindableEvent"),
	voiceUIVisible = false,
	mutedNonFriends = Instance.new("BindableEvent"),
	userAgencySelected = Instance.new("BindableEvent"),
	sendMuteEvent = nil,
	LikelySpeakingUsersEvent = nil,
	muteAll = false,
	mutedPlayers = {},
	talkingChanged = Instance.new("BindableEvent"),
	SignalREventTable = {},
	audioDevices = {},
	service = nil,
	previousSessionId = nil,
	voiceEnabled = false,
	VOICE_STATE = VOICE_STATE,
	permissionState = if not GetFFlagJoinWithoutMicPermissions() then nil else PERMISSION_STATE.IDLE,
	isBanned = false,
	bannedUntil = nil,
	errorText = nil,
	BlockStatusChanged = nil,
	isInCall = false,
	callMutedState = false,
	banReason = nil,
	_mutedAnyone = false,
	VOICE_CHAT_DEVICE_TYPE = VOICE_CHAT_DEVICE_TYPE,
	getPermissionsFunction = getCamMicPermissions,
	AvatarChatService = v102,
	inExpUpsellEntrypoint = nil,
	seamlessVoiceStatus = nil,
	isShowingFTUX = false,
	hideFTUXSignal = Instance.new("BindableEvent"),
	settingsAppAvailable = nil,
	hasLeftFTUX = false,
	deniedMicPermissions = nil,
	isInitialJoin = false,
	joinVoiceButtonContext = nil,
	joinVoiceButtonConsequence = nil,
	CaptureService = v103
}
local v128 = LuauPolyfill.Set.new({
	"available",
	"participants",
	"recentUsersInteractionData",
	"permissionPromise",
	"canUseServicePromise",
	"localMuted",
	"isTalking",
	"previousGroupId",
	"previousMutedState",
	"userEligible",
	"sendMuteEvent",
	"LikelySpeakingUsersEvent",
	"mutedPlayers",
	"SignalREventTable",
	"audioDevices",
	"service",
	"previousSessionId",
	"voiceEnabled",
	"permissionState",
	"BlockStatusChanged",
	"isInCall",
	"callMutedState",
	"attemptVoiceRejoin",
	"VoiceJoinProgressChanged",
	"participantJoined",
	"participantLeft",
	"participantsUpdate",
	"muteChanged",
	"audioDeviceInputAdded",
	"talkingChanged",
	"canUseServiceResult"
})

v128:add("_mutedAnyone")
v128:add("muteAllChanged")

local t4 = {}
local t5 = {
	[Constants2.IN_EXP_UPSELL_VARIANT.VARIANT1] = PromptType.VoiceConsentModalV1,
	[Constants2.IN_EXP_UPSELL_VARIANT.VARIANT2] = PromptType.VoiceConsentModalV2,
	[Constants2.IN_EXP_UPSELL_VARIANT.VARIANT3] = PromptType.VoiceConsentModalV3
}

function getIconSrc(p1, p2) -- line: 352
	return "rbxasset://textures/ui/VoiceChat/" .. (p2 and p2 .. "/" or "") .. p1 .. ".png"
end
function getIcon(p3, p4, p5) -- line: 357
	-- upvalues: VOICE_STATE (copy)
	if p3 == VOICE_STATE.MUTED then
		return getIconSrc("Muted", p5)
	end

	if p3 == VOICE_STATE.CONNECTING then
		return getIconSrc("Connecting", p5)
	end

	if p3 == VOICE_STATE.INACTIVE then
		return getIconSrc("Blank", p5)
	end

	if p3 == VOICE_STATE.TALKING then
		local v137 = math.floor(0.5 + 5 * (p4 or math.random())) * 20

		return p4 and getIconSrc("Unmuted" .. tostring(v137), p5) or getIconSrc("Blank", p5)
	end

	return getIconSrc("Error", p5)
end

t3.__index = t3

function t3.__index(p6, p7) -- line: 375
	-- upvalues: v128 (copy), t3 (copy)
	if v128:has(p7) then
		return p6.coreVoiceManager[p7]
	end

	return (rawget(t3, p7))
end
function t3.__newindex(p8, p9, p10) -- line: 382
	-- upvalues: v128 (copy), t3 (copy)
	if v128:has(p9) then
		p8.coreVoiceManager[p9] = p10

		return
	end

	rawset(t3, p9, p10)
end
function t3.new(p11, p12, p13, p14, p15, p16, p17, p18, p19, p20) -- line: 390
	-- upvalues: Analytics (copy), getCamMicPermissions (copy), t3 (copy), GetFFlagUseLuaSignalrConsumer (copy), WATCHED_MESSAGE_TYPES (copy), GetFIntThrottleParticipantsUpdateMs (copy), IXPServiceWrapper (copy), v60 (copy), v61 (copy), GetFFlagExpChatUseVoiceParticipantsStore (copy), ExpChat (copy), GetFFlagShowLikelySpeakingBubbles (copy), GetFFlagEnableUniveralVoiceToasts (copy), GetFFlagEnableSeamlessVoiceV2 (copy), v45 (copy), v54 (copy), Promise (copy), FFlagEnablePartyVoiceChangersInLua (copy), MicrophoneDevicePermissionsLogging (copy), GetFFlagEnableConnectDisconnectInSettingsAndChrome (copy), v55 (copy), PromptType (copy), v46 (copy), v18 (copy), GetFFlagEnableVoiceTrustedConnectionsToasts (copy), AppStorageService (copy), Constants2 (copy), GetFFlagShowDevicePermissionsModal (copy), GetFFlagEnableSeamlessVoiceDataConsentToast (copy), GetFFlagNonVoiceFTUX (copy), GetFFlagUpdateVoiceConnectionToasts (copy), v51 (copy), GetFFlagEnableVoiceChatMuteForVideoCaptures (copy), GetFFlagEnableCrossExperienceVoiceCaptureMute (copy), default2 (copy)
	local v153 = setmetatable({
		service = p12,
		HttpRbxApiService = p13,
		NotificationService = p17,
		PermissionsService = p14,
		BlockStatusChanged = p15,
		Analytics = Analytics.new(p16),
		getPermissionsFunction = p18 or getCamMicPermissions,
		AvatarChatService = p19,
		SequenceNumbers = {},
		SignalREventTable = {},
		coreVoiceManager = p11,
		_mutedAnyone = false,
		CaptureService = p20
	}, t3)

	if GetFFlagUseLuaSignalrConsumer() then
		for _, v155 in WATCHED_MESSAGE_TYPES do
			v153.SignalREventTable[v155] = Instance.new("BindableEvent")
		end
	end

	v153.shouldThrottleParticipantUpdate = false
	v153.participantsStateThrottleTime = 0
	v153.lastParticipantsStateUpdate = 0
	v153.lastStateUpdateCounter = 0
	v153.reverseNudgeToxicUserRemovalCallbacks = {}

	if GetFIntThrottleParticipantsUpdateMs() > 0 then
		v153.participantsStateThrottleTime = GetFIntThrottleParticipantsUpdateMs() / 1000

		local ok, result = pcall(function() -- line: 432
			-- upvalues: IXPServiceWrapper (copy), v60 (copy)
			return IXPServiceWrapper:GetLayerData(v60)
		end)

		if ok and result and result[v61] then
			v153.shouldThrottleParticipantUpdate = true
		end
	end

	v153.MuteStatusIcons = {
		MicOn = v153:GetIcon("Unmuted0", "SpeakerLight"),
		MicOff = v153:GetIcon("Muted", "SpeakerLight"),
		MicDisabled = v153:GetIcon("Muted", "SpeakerLight"),
		Loading = v153:GetIcon("Connecting", "SpeakerLight"),
		Error = v153:GetIcon("Error", "SpeakerLight")
	}
	v153.PlayerMuteStatusIcons = {
		MicOn = v153:GetIcon("Unmuted0", "MicLight"),
		MicOff = v153:GetIcon("Muted", "MicLight"),
		MicDisabled = v153:GetIcon("Muted", "MicLight"),
		Loading = v153:GetIcon("Connecting", "MicLight"),
		Error = v153:GetIcon("Error", "MicLight")
	}

	local u158 = false
	local connection = v153.attemptVoiceRejoin.Event:Connect(function() -- line: 458
		-- upvalues: u158 (ref)
		u158 = true
	end)
	local v160 = if not GetFFlagExpChatUseVoiceParticipantsStore() then nil else ExpChat.Stores.GetVoiceStore(false)

	v153.coreVoiceManager:subscribe("GetPermissions", function(p21, p22, p23, p24) -- line: 465
		-- upvalues: v153 (copy)
		local s1 = "VoiceChatServiceManager.requestMicPermission"

		if v153.inExpUpsellEntrypoint ~= nil then
			s1 = v153.inExpUpsellEntrypoint
		end

		v153.getPermissionsFunction(p21, p22, p23, s1, p24)
	end)
	v153.coreVoiceManager:subscribe("OnVoiceParticipantRemoved", function(p25) -- line: 472
		-- upvalues: GetFFlagExpChatUseVoiceParticipantsStore (copy), v160 (copy), ExpChat (copy)
		if GetFFlagExpChatUseVoiceParticipantsStore() then
			v160.handleVoiceParticipantRemoved(p25)

			return
		end

		if ExpChat.Events.VoiceParticipantRemoved then
			ExpChat.Events.VoiceParticipantRemoved((tostring(p25)))
		end
	end)
	v153.coreVoiceManager:subscribe("OnVoiceParticipantAdded", function(p26) -- line: 479
		-- upvalues: GetFFlagExpChatUseVoiceParticipantsStore (copy), v160 (copy), ExpChat (copy)
		if GetFFlagExpChatUseVoiceParticipantsStore() then
			v160.handleVoiceParticipantAdded(p26)

			return
		end

		if ExpChat.Events.VoiceParticipantAdded then
			ExpChat.Events.VoiceParticipantAdded((tostring(p26)))
		end
	end)
	v153.coreVoiceManager:subscribe("OnVoiceParticipantToggleMuted", function(p27, p28) -- line: 486
		-- upvalues: ExpChat (copy)
		if ExpChat.Events.VoiceParticipantToggleMuted then
			ExpChat.Events.VoiceParticipantToggleMuted(tostring(p27), p28)
		end
	end)

	if GetFFlagShowLikelySpeakingBubbles() then
		v153.coreVoiceManager:subscribe("OnLikelySpeakingUsersUpdated", function(p29) -- line: 494
			-- upvalues: ExpChat (copy)
			if ExpChat.Events.LikelySpeakingUsersUpdated then
				ExpChat.Events.LikelySpeakingUsersUpdated(p29)
			end
		end)
		v153.coreVoiceManager:subscribe("OnShowLikelySpeakingBubblesChanged", function(p30) -- line: 502
			-- upvalues: ExpChat (copy)
			if ExpChat.Events.ShowLikelySpeakingBubblesChanged then
				ExpChat.Events.ShowLikelySpeakingBubblesChanged(p30)
			end
		end)
	end

	v153.coreVoiceManager:subscribe("OnUserAndPlaceCanUseVoiceResolved", function(p31, p32) -- line: 508
		-- upvalues: v153 (copy)
		v153:_onUserAndPlaceCanUseVoiceResolved(p31, p32)
	end)
	v153.coreVoiceManager:subscribe("OnRequestMicPermissionResolved", function() -- line: 511
		-- upvalues: GetFFlagEnableUniveralVoiceToasts (copy), v153 (copy)
		if GetFFlagEnableUniveralVoiceToasts() then
			return v153:CheckAndShowNotAudiblePrompt()
		end
	end)
	v153.coreVoiceManager:subscribe("OnRequestMicPermissionRejected", function() -- line: 516
		-- upvalues: GetFFlagEnableSeamlessVoiceV2 (copy), v153 (copy), GetFFlagEnableUniveralVoiceToasts (copy), v45 (copy), v54 (copy), Promise (copy)
		if GetFFlagEnableSeamlessVoiceV2() and v153:IsSeamlessVoice() then
			v153.deniedMicPermissions = true
		end

		if GetFFlagEnableUniveralVoiceToasts() and not v45 then
			if v54 then
				return v153:CheckAndShowPermissionPrompt()
			end

			return v153:CheckAndShowPermissionPrompt():finallyReturn(Promise.reject())
		end
	end)
	v153.coreVoiceManager:subscribe("OnDevicePlayerChanged", function() -- line: 529
		-- upvalues: v153 (copy)
		v153:UpdateAudioDeviceInputDebugger()
	end)
	v153.coreVoiceManager:subscribe("OnDeviceActiveChanged", function() -- line: 532
		-- upvalues: v153 (copy)
		v153:UpdateAudioDeviceInputDebugger()
	end)
	v153.coreVoiceManager:subscribe("OnDeviceMuteChanged", function() -- line: 535
		-- upvalues: v153 (copy)
		v153:UpdateAudioDeviceInputDebugger()
	end)

	if FFlagEnablePartyVoiceChangersInLua then
		v153.coreVoiceManager:subscribe("OnVoiceChangerChanged", function() -- line: 539
			-- upvalues: v153 (copy)
			v153:UpdateAudioDeviceInputDebugger()
		end)
	end

	v153.coreVoiceManager:subscribe("OnStateChanged", function(_, p34) -- line: 543
		-- upvalues: MicrophoneDevicePermissionsLogging (copy), v153 (copy), GetFFlagEnableConnectDisconnectInSettingsAndChrome (copy), v55 (copy), PromptType (copy)
		MicrophoneDevicePermissionsLogging:setClientSessionId(v153.coreVoiceManager:GetSessionId())

		if p34 == Enum.VoiceChatState.Ended and v153.bannedUntil == nil then
			if not GetFFlagEnableConnectDisconnectInSettingsAndChrome() then
				v153:HideVoiceUI()
			end

			if v55 and v153.runService:IsStudio() then
				return
			end

			v153:showPrompt(PromptType.LeaveVoice)
		end
	end)
	v153.coreVoiceManager:subscribe("OnPlayerMuted", function() -- line: 556
		-- upvalues: v153 (copy)
		v153:UpdateAudioDeviceInputDebugger()
	end)
	v153.coreVoiceManager:subscribe("OnAudioDeviceInputAdded", function() -- line: 559
		-- upvalues: v153 (copy)
		v153:UpdateAudioDeviceInputDebugger()
	end)
	v153.coreVoiceManager:subscribe("OnVoiceChatServiceInitialized", function() -- line: 563
		-- upvalues: v153 (copy), GetFFlagEnableSeamlessVoiceV2 (copy), ExpChat (copy), v46 (copy), v18 (copy), GetFFlagEnableVoiceTrustedConnectionsToasts (copy), AppStorageService (copy), Constants2 (copy), PromptType (copy)
		v153:ShowVoiceUI()

		if GetFFlagEnableSeamlessVoiceV2() and v153:IsSeamlessVoice() then
			ExpChat.Events.ShowLikelySpeakingBubblesChanged(false)
		end

		if v46 then
			v18:debug("Simulating join voice")
			v153:simulateVoiceConnectDisconnect()
		end

		if GetFFlagEnableVoiceTrustedConnectionsToasts() and not v153.coreVoiceManager.initializedPostSuspension then
			local ok, result = pcall(function() -- line: 574
				-- upvalues: AppStorageService (copy), Constants2 (copy)
				return AppStorageService:GetItem(Constants2.VOICE_WITH_TC_TOAST_KEY) == "true"
			end)

			if ok and not result then
				v153:showPrompt(PromptType.UpdateOnAutoJoinToast)
				pcall(function() -- line: 581
					-- upvalues: AppStorageService (copy), Constants2 (copy)
					AppStorageService:SetItem(Constants2.VOICE_WITH_TC_TOAST_KEY, "true")
					AppStorageService:Flush()
				end)
			end
		end
	end)
	v153.coreVoiceManager:subscribe("OnAudioDeviceInputRemoved", function() -- line: 589
		-- upvalues: v153 (copy)
		v153:UpdateAudioDeviceInputDebugger()
	end)
	v153.coreVoiceManager:subscribe("OnInitialJoinFailed", function() -- line: 592
		-- upvalues: v153 (copy)
		v153:InitialJoinFailedPrompt()
	end)
	v153.coreVoiceManager:subscribe("OnPlayerModerated", function() -- line: 595
		-- upvalues: v153 (copy)
		v153:ShowPlayerModeratedMessage()
	end)
	v153.coreVoiceManager:subscribe("OnRetryRequested", function() -- line: 599
		-- upvalues: v153 (copy), PromptType (copy)
		v153:showPrompt(PromptType.Retry)
	end)
	v153.coreVoiceManager:subscribe("OnVoiceToxicityModal", function() -- line: 602
		-- upvalues: v18 (copy), v153 (copy), PromptType (copy)
		v18:debug("Showing Voice Toxicity Modal")
		v153:showPrompt(PromptType.VoiceToxicityModal)
	end)
	v153.coreVoiceManager:subscribe("OnVoiceToxicityToast", function() -- line: 606
		-- upvalues: v18 (copy), v153 (copy), PromptType (copy)
		v18:debug("Showing Voice Toxicity Toast")
		v153:showPrompt(PromptType.VoiceToxicityToast)
	end)
	v153.coreVoiceManager:subscribe("OnPermissionRequested", function() -- line: 610
		-- upvalues: GetFFlagShowDevicePermissionsModal (copy), v153 (copy), PromptType (copy)
		if GetFFlagShowDevicePermissionsModal() then
			v153:showPrompt(PromptType.DevicePermissionsModal)

			return
		end

		v153:showPrompt(PromptType.Permission)
	end)
	v153.coreVoiceManager:subscribe("OnShowDataConsentToast", function() -- line: 617
		-- upvalues: GetFFlagEnableSeamlessVoiceDataConsentToast (copy), v153 (copy)
		if GetFFlagEnableSeamlessVoiceDataConsentToast() then
			v153:showDataConsentToast()
		end
	end)
	v153.coreVoiceManager:subscribe("OnVoiceReverseNudgeIconColorChange", function(p35) -- line: 622
		-- upvalues: v18 (copy), ExpChat (copy), v153 (copy)
		v18:debug("Showing Reverse Nudge Icon Color Change")

		if ExpChat.Events.AddReverseNudgeToxicUser and ExpChat.Events.RemoveReverseNudgeToxicUser then
			v153:AddReverseNudgeToxicUser(p35.toxicUserId, ExpChat.Events.AddReverseNudgeToxicUser, ExpChat.Events.RemoveReverseNudgeToxicUser)
		end
	end)
	v153.coreVoiceManager.setVoiceUIVisibility.Event:Connect(function(b1: boolean) -- line: 632
		-- upvalues: v153 (copy)
		if b1 then
			v153:ShowVoiceUI()

			return
		end

		v153:HideVoiceUI()
	end)
	v153.coreVoiceManager:subscribe("OnVoiceJoin", function() -- line: 639
		-- upvalues: GetFFlagNonVoiceFTUX (copy), v153 (copy), GetFFlagEnableVoiceTrustedConnectionsToasts (copy), GetFFlagUpdateVoiceConnectionToasts (copy), PromptType (copy), GetFFlagEnableSeamlessVoiceV2 (copy), ExpChat (copy), v51 (copy), GetFFlagEnableVoiceChatMuteForVideoCaptures (copy), GetFFlagEnableCrossExperienceVoiceCaptureMute (copy), default2 (copy), u158 (ref), connection (copy)
		if GetFFlagNonVoiceFTUX() and v153.hasLeftFTUX then
			v153.hasLeftFTUX = false

			if GetFFlagEnableVoiceTrustedConnectionsToasts() then
				v153:showJoinVoicePrompt()
			elseif GetFFlagUpdateVoiceConnectionToasts() then
				v153:showPrompt(PromptType.UnifiedJoinVoiceToast)
			else
				v153:showPrompt(PromptType.JoinedVoiceToast)
			end

			v153.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxLeaveEvent", v153:GetConnectDisconnectAnalyticsData())
		elseif GetFFlagEnableSeamlessVoiceV2() and v153:IsSeamlessVoice() then
			ExpChat.Events.ShowLikelySpeakingBubblesChanged(false)

			if GetFFlagEnableVoiceTrustedConnectionsToasts() then
				v153:showJoinVoicePrompt()
			elseif GetFFlagUpdateVoiceConnectionToasts() then
				v153:showPrompt(PromptType.UnifiedJoinVoiceToast)
			elseif v51 and v153.isInitialJoin then
				v153:showPrompt(PromptType.JoinedVoiceToast)
			else
				v153:showPrompt(PromptType.JoinVoice)
			end

			v153:SetVoiceConnectCookieValue(true)
		else
			v153:showPrompt(PromptType.VoiceConsentAcceptedToast)
		end

		if GetFFlagEnableVoiceChatMuteForVideoCaptures() and v153.CaptureService:IsCapturingVideo() then
			if GetFFlagEnableCrossExperienceVoiceCaptureMute() then
				default2:MuteAll("Capture")
				v153:HideVoiceUI()
			else
				v153:MuteAll(true, "Capture")
				v153:HideVoiceUI()
			end
		end

		if u158 then
			v153.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", v153:GetConnectDisconnectAnalyticsData())
			connection:Disconnect()
		end
	end)

	return v153
end
function t3.subscribe(p36, p37, p38) -- line: 701
	return p36.coreVoiceManager:subscribe(p37, p38)
end
function t3._reportJoinFailed(p39, p40, p41) -- line: 705
	return p39.coreVoiceManager:_reportJoinFailed(p40, p41)
end
function t3._asyncInit(p42) -- line: 709
	return p42.coreVoiceManager:_asyncInit()
end
function t3.asyncInit(p43) -- line: 713
	return p43.coreVoiceManager:asyncInit()
end
function t3.CheckAudioInputExists(p44) -- line: 717
	return p44.coreVoiceManager:CheckAudioInputExists()
end
function t3.getService(p45) -- line: 721
	return p45.service
end
function t3.GetMutedAnyone(p46) -- line: 725
	return p46.coreVoiceManager:GetMutedAnyone()
end
function t3.GetRequest(p47, p48, p49) -- line: 729
	return p47.coreVoiceManager:GetRequest(p48, p49)
end
function t3.PostRequest(p50, p51, _, p53) -- line: 733
	-- upvalues: HttpService (copy)
	local ok, result = pcall(function() -- line: 734
		-- upvalues: p50 (copy), p51 (copy), p53 (copy), HttpService (copy)
		local v469 = p50.HttpRbxApiService:PostAsyncFullUrl(p51, p53, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson, Enum.HttpRequestType.Players)

		return HttpService:JSONDecode(v469)
	end)

	return ok and result
end
function t3._GetShowAgeVerificationOverlay(p54, p55) -- line: 755
	return p54.coreVoiceManager:_GetShowAgeVerificationOverlay(p55)
end
function t3.simulateVoiceConnectDisconnect(p56) -- line: 759
	-- upvalues: v50 (copy), v18 (copy)
	task.spawn(function() -- line: 760
		-- upvalues: v50 (copy), p56 (copy), v18 (copy)
		while true do
			task.wait(v50)

			if p56.voiceUIVisible then
				v18:debug("Hiding Voice")
				p56:HideVoiceUI()
			else
				v18:debug("Showing Voice")
				p56:ShowVoiceUI()
			end
		end
	end)
end
function t3.FetchAgeVerificationOverlay(p57, p58) -- line: 774
	return p57.coreVoiceManager:FetchAgeVerificationOverlay(p58)
end
function t3.FetchPhoneVerificationUpsell(t6: {[any]: any}, s2: string, n1: number?, b2: boolean?) -- line: 778
	return t6.coreVoiceManager:FetchPhoneVerificationUpsell(s2, n1, b2)
end
function t3.RecordUserSeenModal(t7: {[any]: any}, s3: string) -- line: 786
	-- upvalues: PostRecordUserSeenGeneralModal (copy)
	local s4 = "PostRequest"

	return PostRecordUserSeenGeneralModal(function(...) -- line: 696
		-- upvalues: t7 (copy), s4 (copy)
		return t7[s4](t7, ...)
	end, s3)
end
function t3.checkAndUpdateSequence(t8: {[any]: any}, s5: string, n2: number) -- line: 790
	return t8.coreVoiceManager:checkAndUpdateSequence(s5, n2)
end
function t3.onMissedSequence(p59, p60) -- line: 794
	return p59.coreVoiceManager:onMissedSequence(p60)
end
function t3.watchSignalR(p61) -- line: 798
	return p61.coreVoiceManager:watchSignalR()
end
function t3.voicePermissionGranted(p62, p63) -- line: 806
	return p62.coreVoiceManager:voicePermissionGranted(p63)
end
function t3.GetSignalREvent(p64, p65) -- line: 810
	return p64.coreVoiceManager:GetSignalREvent(p65)
end
function t3.avatarChatUserAndPlaceSettingsValueOfClientFeatures(p66, p67) -- line: 815
	return p66.coreVoiceManager:avatarChatUserAndPlaceSettingsValueOfClientFeatures(p67)
end
function t3.resolveAvatarChatUserAndPlaceSettings(p68) -- line: 819
	return p68.coreVoiceManager:resolveAvatarChatUserAndPlaceSettings()
end
function t3.EnableVoice(p69) -- line: 823
	return p69.coreVoiceManager:EnableVoice()
end
function t3._VoiceChatFirstTimeUX(t9: {[any]: any}, p70) -- line: 827
	-- upvalues: Constants2 (copy), v18 (copy), GetFFlagNonVoiceFTUX (copy), ExpChat (copy), GetFFlagEnableFtuxExitOnMuteToggle (copy), v62 (copy), v48 (copy), PromptType (copy)
	local u212 = nil
	local u213 = nil

	if not pcall(function() -- line: 829
		-- upvalues: p70 (copy), Constants2 (copy), u212 (ref), u213 (ref)
		local Item = p70:GetItem(Constants2.SEAMLESS_VOICE_FTUX_KEY)
		local Item2 = p70:GetItem(Constants2.SEAMLESS_VOICE_STUX_KEY)

		u212 = Item == "true"
		u213 = if Item2 ~= nil then tonumber(Item2) else 0
	end) then
		v18:warning("Failed to read FTUX/STUX from AppStorage")

		return
	end

	v18:trace("hasShownFTUX: {}. STUXCount: {}", u212, u213)

	if not u212 then
		v18:debug("Showing FTUX")
		t9.isShowingFTUX = true
		t9.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxJoinEvent", t9:GetConnectDisconnectAnalyticsData())

		if GetFFlagNonVoiceFTUX() then
			ExpChat.Events.VoiceUIVisibilityChanged(true)
		else
			t9:MuteAll(true, "FTUX")

			if ExpChat.Events.ShowLikelySpeakingBubblesChanged and ExpChat.Events.LikelySpeakingUsersUpdated then
				v18:debug("Showing likely speaking bubbles")

				local t10 = {}

				ExpChat.Events.ShowLikelySpeakingBubblesChanged(true)

				for v215 in t9.participants or {} do
					t10[v215] = true
				end

				ExpChat.Events.LikelySpeakingUsersUpdated(t10)

				local connection = t9.participantJoined.Event:Connect(function(p71) -- line: 866
					-- upvalues: t10 (copy), ExpChat (copy)
					t10[p71] = true
					ExpChat.Events.LikelySpeakingUsersUpdated(t10)
				end)

				t9.hideFTUXSignal.Event:Connect(function() -- line: 870
					-- upvalues: connection (copy), ExpChat (copy)
					connection:Disconnect()
					ExpChat.Events.ShowLikelySpeakingBubblesChanged(false)
					ExpChat.Events.LikelySpeakingUsersUpdated({})
				end)
				t9.hideVoiceUI.Event:Once(function() -- line: 875
					-- upvalues: ExpChat (copy)
					ExpChat.Events.ShowLikelySpeakingBubblesChanged(false)
					ExpChat.Events.LikelySpeakingUsersUpdated({})
				end)
				t9.muteAllChanged.Event:Once(function() -- line: 879
					-- upvalues: t9 (copy), p70 (copy)
					t9:HideFTUX(p70)
					t9.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxLeaveEvent", t9:GetConnectDisconnectAnalyticsData())
				end)
				t9.talkingChanged.Event:Once(function() -- line: 886
					-- upvalues: t9 (copy), p70 (copy)
					t9:HideFTUX(p70)
				end)

				if GetFFlagEnableFtuxExitOnMuteToggle() then
					t9.coreVoiceManager.onPlayerMuteToggled.Event:Once(function() -- line: 890
						-- upvalues: t9 (copy), p70 (copy)
						t9:HideFTUX(p70)
					end)
				end
			end
		end
	elseif v62 > u213 and (not v48 or t9:GetVoiceConnectCookieValue()) then
		v18:debug("Showing STUX")
		t9:showPrompt(PromptType.JoinVoiceSTUX)
		pcall(function() -- line: 902
			-- upvalues: p70 (copy), Constants2 (copy), u213 (ref)
			p70:SetItem(Constants2.SEAMLESS_VOICE_STUX_KEY, (tostring(u213 + 1)))
			p70:Flush()
		end)
	end
end
function t3.VoiceChatFirstTimeUX(t11: {[any]: any}, p72) -- line: 909
	-- upvalues: v48 (copy), v18 (copy), v47 (copy), v67 (copy), Constants2 (copy), GetFFlagNonVoiceFTUX (copy)
	if v48 and not t11:verifyUniverseAndPlaceCanUseVoice() then
		v18:debug("Universe/place is not voice enabled, do not run FTUX/STUX")

		return
	end

	if not v47 then
		local v219 = t11:FetchAgeVerificationOverlay()

		if v67 then
			if type(v219) == "table" and v219.voiceSettings and v219.voiceSettings.seamlessVoiceStatus ~= Constants2.SEAMLESS_VOICE_STATUS_ENABLED_NEW_USER then
				v18:debug("User not eligible for FTUX/STUX")

				return
			end
		elseif v219.voiceSettings and v219.voiceSettings.seamlessVoiceStatus ~= Constants2.SEAMLESS_VOICE_STATUS_ENABLED_NEW_USER then
			v18:debug("User not eligible for FTUX/STUX")

			return
		end
	end

	if GetFFlagNonVoiceFTUX() then
		v18:debug("Starting FTUX")
		t11:_VoiceChatFirstTimeUX(p72)

		return
	end

	t11:asyncInit():andThen(function() -- line: 948
		-- upvalues: t11 (copy), v18 (copy), p72 (copy)
		local connection = nil

		if t11.service.VoiceChatState and t11.service.VoiceChatState == Enum.VoiceChatState.Joined then
			v18:debug("Starting FTUX")
			t11:_VoiceChatFirstTimeUX(p72)
		end

		connection = t11.service.StateChanged:Connect(function(_, newState) -- line: 956
			-- upvalues: v18 (copy), t11 (copy), p72 (copy), connection (ref)
			if newState == Enum.VoiceChatState.Joined then
				v18:debug("Starting FTUX")
				t11:_VoiceChatFirstTimeUX(p72)
				connection:Disconnect()
			end
		end)
	end):catch(function(p74) -- line: 963
		-- upvalues: v18 (copy)
		v18:trace("Failed to start FTUX: {}", p74)
	end)
end
function t3.HideFTUX(t12: {[any]: any}, p75) -- line: 969
	-- upvalues: Constants2 (copy), GetFFlagNonVoiceFTUX (copy), PromptType (copy)
	t12.isShowingFTUX = false
	t12.hideFTUXSignal:Fire()
	pcall(function() -- line: 972
		-- upvalues: p75 (copy), Constants2 (copy)
		p75:SetItem(Constants2.SEAMLESS_VOICE_FTUX_KEY, "true")
		p75:Flush()
	end)

	if GetFFlagNonVoiceFTUX() then
		t12.hasLeftFTUX = true
		t12.attemptVoiceRejoin:Fire()
	end

	if not GetFFlagNonVoiceFTUX() then
		t12:MuteAll(false, "FTUX")
		t12:showPrompt(PromptType.JoinedVoiceToast)
	end
end
function t3._onUserAndPlaceCanUseVoiceResolved(p76, p77, p78) -- line: 986
	-- upvalues: GetInformedOfBan (copy), GetFFlagAvatarChatServiceEnabled (copy), GetFFlagVoiceChatServiceManagerUseAvatarChat (copy), PromptType (copy), BAN_REASON (copy), GetFFlagEnableVoicePromptReasonText (copy)
	p76.bannedUntil = nil

	if p77 and p77.isBanned then
		local s6 = "GetRequest"
		local v226 = GetInformedOfBan(function(...) -- line: 696
			-- upvalues: p76 (copy), s6 (copy)
			return p76[s6](p76, ...)
		end)

		if v226 and not v226.informedOfBan then
			if GetFFlagAvatarChatServiceEnabled() and GetFFlagVoiceChatServiceManagerUseAvatarChat() and p77.bannedUntil == nil then
				p76:ShowPlayerModeratedMessage()
			elseif p77.bannedUntil == nil then
				p76:showPrompt(PromptType.VoiceChatSuspendedPermanent)
			else
				p76.bannedUntil = p77.bannedUntil

				if p77.banReason == BAN_REASON.NUDGE_V3 then
					p76:showPrompt(PromptType.VoiceChatSuspendedTemporaryB)
				else
					p76:showPrompt(PromptType.VoiceChatSuspendedTemporary)
				end
			end
		end

		if v226 and v226.informedOfBan then
			p76:ShowPlayerModeratedMessage(true)

			return
		end
	else
		if p76.runService:IsStudio() and p77 and not p77.isVoiceEnabled then
			p76:showPrompt(PromptType.User)

			return
		end

		if p76.runService:IsStudio() and p78 and not p78.isPlaceEnabledForVoice then
			p76:showPrompt(PromptType.Place, GetFFlagEnableVoicePromptReasonText() and table.concat(p78.reasons or {}, "") or nil)
		end
	end
end
function t3.ChangeVoiceJoinProgress(p79, p80) -- line: 1030
	return p79.coreVoiceManager:ChangeVoiceJoinProgress(p80)
end
function t3.GetVoiceJoinProgress(p81) -- line: 1034
	return p81.coreVoiceManager.VoiceJoinProgress
end
function t3.UserOnlyEligibleForVoice(p82) -- line: 1038
	return p82.coreVoiceManager:UserOnlyEligibleForVoice()
end
function t3.UserOnlyEligibleForVoiceViaOverlay(p83) -- line: 1042
	return p83.coreVoiceManager:UserOnlyEligibleForVoiceViaOverlay()
end
function t3.UserVoiceEnabled(p84) -- line: 1046
	return p84.coreVoiceManager:UserVoiceEnabled()
end
function t3.UserInInExperienceUpsellTreatment(p85) -- line: 1050
	return p85.coreVoiceManager:UserInInExperienceUpsellTreatment()
end
function t3.UserEligibleForInExperienceUpsell(p86) -- line: 1054
	return p86.coreVoiceManager:UserEligibleForInExperienceUpsell()
end
function t3.UserEligibleForLikelySpeakingBubbles(p87) -- line: 1058
	return p87.coreVoiceManager:UserEligibleForLikelySpeakingBubbles()
end
function t3.ShowInExperienceVoiceUpsell(t13: {[any]: any}, s7: string) -- line: 1062
	local showVoiceInExperienceUpsellVariant = t13:FetchAgeVerificationOverlay().showVoiceInExperienceUpsellVariant

	t13:SetInExpUpsellEntrypoint(s7)
	t13:showPrompt((t13:GetInExpUpsellPromptFromEnum(showVoiceInExperienceUpsellVariant)))
end
function t3.ShowInExperiencePhoneVoiceUpsell(t14: {[any]: any}, s8: string, s9: string) -- line: 1072
	-- upvalues: v107 (copy), GetFFlagInExperiencePhoneUpsellNewCopy (copy), GetFFlagShowLikelySpeakingBubbles (copy), ExpChat (copy), v108 (copy), Constants2 (copy), PromptType (copy)
	t14:SetInExpUpsellEntrypoint(s8)
	v107.openPhoneUpsell({
		origin = "inExperience",
		eventContext = "verificationUpsell",
		entryConfig = {
			titleKey = "Feature.VerificationUpsell.Heading.UnlockVoiceChat",
			descriptionKey = "Feature.VerificationUpsell.Description.UnlockVoiceChatBody",
			buttonKey = not GetFFlagInExperiencePhoneUpsellNewCopy() and "Feature.VerificationUpsell.Action.AddPhoneNumber" or "Feature.AccountSettings.Action.Verify",
			extraButtonConfig = {
				extraButtonKey = "Feature.VerificationUpsell.Action.NotNow"
			},
			legalTextKey = "Feature.VerificationUpsell.Description.VoiceLegalDisclaimer2"
		},
		onSuccessBeforeToast = function() --[[ onSuccessBeforeToast ]] -- line: 1089
			-- upvalues: t14 (copy), GetFFlagShowLikelySpeakingBubbles (copy), ExpChat (copy), v108 (copy), s9 (copy)
			t14.coreVoiceManager:DisablePhoneVerificationUpsell()

			if GetFFlagShowLikelySpeakingBubbles() and ExpChat.Events.ShowLikelySpeakingBubblesChanged then
				ExpChat.Events.ShowLikelySpeakingBubblesChanged(false)
			end

			local v475 = v108
			local v476 = t14
			local s10 = "PostRequest"

			v475(function(...) -- line: 696
				-- upvalues: v476 (copy), s10 (copy)
				return v476[s10](v476, ...)
			end, s9, os.time(), false)
		end,
		onSuccess = function() --[[ onSuccess ]] -- line: 1096
			-- upvalues: t14 (copy)
			t14:EnableVoice()
		end,
		closeUpsell = function() --[[ closeUpsell ]] -- line: 1099
			-- upvalues: GetFFlagShowLikelySpeakingBubbles (copy), ExpChat (copy), s8 (copy), Constants2 (copy), t14 (copy), PromptType (copy), v108 (copy), s9 (copy)
			if GetFFlagShowLikelySpeakingBubbles() and ExpChat.Events.ShowLikelySpeakingBubblesChanged then
				ExpChat.Events.ShowLikelySpeakingBubblesChanged(false)
			end

			if s8 ~= Constants2.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
				t14:showPrompt(PromptType.VoiceConsentDeclinedToast)
			end

			local v478 = v108
			local v479 = t14
			local s11 = "PostRequest"

			v478(function(...) -- line: 696
				-- upvalues: v479 (copy), s11 (copy)
				return v479[s11](v479, ...)
			end, s9, os.time(), true)
		end
	})
end
function t3.DisablePhoneVerificationUpsell(p88) -- line: 1111
	p88.coreVoiceManager:DisablePhoneVerificationUpsell()
end
function t3.SetInExpUpsellEntrypoint(t15: {[any]: any}, s12: string) -- line: 1115
	t15.inExpUpsellEntrypoint = s12
end
function t3.userAndPlaceCanUseVoice(p89) -- line: 1119
	return p89.coreVoiceManager:userAndPlaceCanUseVoice()
end
function t3.verifyUniverseAndPlaceCanUseVoice(p90) -- line: 1123
	return p90.coreVoiceManager:verifyUniverseAndPlaceCanUseVoice()
end
function t3.GetVoiceConnectCookieValue(p91) -- line: 1127
	return p91.coreVoiceManager:GetVoiceConnectCookieValue()
end
function t3.GetVoiceConnectCookie(p92) -- line: 1131
	return p92.coreVoiceManager:GetVoiceConnectCookie()
end
function t3.SetVoiceConnectCookieValue(t16: {[any]: any}, b3: boolean) -- line: 1135
	return t16.coreVoiceManager:SetVoiceConnectCookieValue(b3)
end
function t3.GetVoiceRewarmCookie(p93) -- line: 1139
	return p93.coreVoiceManager:GetVoiceRewarmCookie()
end
function t3.SetVoiceRewarmCookie(t17: {[any]: any}, s13: string) -- line: 1143
	t17.coreVoiceManager:SetVoiceRewarmCookie(s13)
end
function t3.SetNewUserFTUXCookieValue(t18: {[any]: any}, b4: boolean) -- line: 1147
	return t18.coreVoiceManager:SetNewUserFTUXCookieValue(b4)
end
function t3.ShowPlayerModeratedMessage(t19: {[any]: any}, b5: boolean) -- line: 1151
	-- upvalues: GetUserSettings (copy), Analytics (copy), PromptType (copy), BAN_REASON (copy)
	local s14 = "GetRequest"
	local v259 = GetUserSettings(function(...) -- line: 696
		-- upvalues: t19 (copy), s14 (copy)
		return t19[s14](t19, ...)
	end)

	if not v259 or not v259.isBanned then
		t19:_reportJoinFailed("PlayerModeratedBadState", Analytics.ERROR)

		return
	end

	t19.banReason = v259.banReason

	if v259.bannedUntil == nil then
		t19:showPrompt(PromptType.VoiceChatSuspendedPermanent)

		return
	end

	t19.bannedUntil = v259.bannedUntil

	if b5 then
		t19:showPrompt(PromptType.VoiceChatSuspendedTemporaryToast)

		return
	end

	if t19.banReason == BAN_REASON.NUDGE_V3 then
		t19:showPrompt(PromptType.VoiceChatSuspendedTemporaryB)

		return
	end

	t19:showPrompt(PromptType.VoiceChatSuspendedTemporary)
end
function t3.CheckCallState(p94) -- line: 1176
	return p94.coreVoiceManager:CheckCallState()
end
function t3.ShowVoiceChatLoadingMessage(p95) -- line: 1180
	-- upvalues: PromptType (copy)
	p95:showPrompt(PromptType.VoiceLoading)
end
function t3.requestMicPermission(p96) -- line: 1184
	return p96.coreVoiceManager:requestMicPermission()
end
function t3.canUseServiceAsync(p97) -- line: 1188
	return p97.coreVoiceManager:canUseServiceAsync()
end
function t3.canUseService(p98) -- line: 1193
	-- upvalues: HttpRbxApiService (copy), HttpService (copy), VOICE_CHAT_AVAILABILITY (copy)
	if p98.available ~= nil or not game:GetEngineFeature("VoiceChatSupported") then
		return false
	end

	local ok, result = pcall(function() -- line: 1197
		-- upvalues: HttpRbxApiService (copy), HttpService (copy)
		local AsyncFullUrl = HttpRbxApiService:GetAsyncFullUrl("https://voice.roblox.com/v1/settings", Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players)

		return HttpService:JSONDecode(AsyncFullUrl)
	end)
	local v267 = ok and result.isVoiceEnabled

	if not v267 then
		p98.available = VOICE_CHAT_AVAILABILITY.UserNotAvailable
	end

	return v267
end
function t3.ensureInitialized(p99, p100) -- line: 1213
	return p99.coreVoiceManager:ensureInitialized(p100)
end
function t3.GetSessionId(p101) -- line: 1218
	return p101.coreVoiceManager:GetSessionId()
end
function t3.GetChannelId(p102) -- line: 1222
	return p102.coreVoiceManager:GetChannelId()
end
function t3.JoinWithVoiceMuteData(p103, p104) -- line: 1226
	return p103.coreVoiceManager:JoinWithVoiceMuteData(p104)
end
function t3.calculateBanDuration(_: {[any]: any}, n3: number, n4: number) -- line: 1230
	return (math.ceil((n4 - n3) / 60))
end
function t3.ShowVoiceUI(p105) -- line: 1234
	-- upvalues: ExpChat (copy)
	p105.voiceUIVisible = true
	p105.showVoiceUI:Fire()

	if ExpChat.Events.VoiceUIVisibilityChanged then
		ExpChat.Events.VoiceUIVisibilityChanged(true)
	end
end
function t3.HideVoiceUI(p106) -- line: 1243
	-- upvalues: ExpChat (copy)
	p106.voiceUIVisible = false
	p106.hideVoiceUI:Fire()

	if ExpChat.Events.VoiceUIVisibilityChanged then
		ExpChat.Events.VoiceUIVisibilityChanged(false)
	end
end
function t3.createPromptInstance(p107, p108, p109) -- line: 1252
	-- upvalues: GetFFlagEnableVoicePromptReasonText (copy), PromptType (copy), LocalizationService (copy), GetFFlagShowDevicePermissionsModal (copy), FFlagEnableRetryForLinkingProtocolFetch (copy), FIntLinkingProtocolFetchRetries (copy), default3 (copy), SettingsRoute (copy), FIntLinkingProtocolFetchTimeoutMS (copy), Roact (copy), VoiceChatPrompt (copy), Analytics (copy), PostInformedOfBan (copy), Constants2 (copy), GetFFlagShowLikelySpeakingBubbles (copy), ExpChat (copy), v52 (copy), GetFFlagJoinWithoutMicPermissions (copy), v18 (copy), v43 (copy), CoreGui (copy)
	if p107.promptSignal then
		p107.promptSignal:Destroy()
		p107.promptSignal = nil
	end

	p107.promptSignal = Instance.new("BindableEvent")

	local errorText = nil

	if GetFFlagEnableVoicePromptReasonText() then
		errorText = p107.errorText
	end

	local v283 = p109 == PromptType.VoiceChatSuspendedTemporaryB
	local s15 = ""

	if p107.bannedUntil ~= nil then
		s15 = if not v283 then DateTime.fromUnixTimestamp(p107.bannedUntil.Seconds):FormatLocalTime("l LT", LocalizationService.RobloxLocaleId) else tostring((p107:calculateBanDuration(DateTime.now().UnixTimestamp, p107.bannedUntil.Seconds)))
	end

	local v285 = p109 == PromptType.VoiceToxicityModal or p109 == PromptType.VoiceToxicityToast
	local v286 = p109 == PromptType.VoiceConsentModalV1 or (p109 == PromptType.VoiceConsentModalV2 or p109 == PromptType.VoiceConsentModalV3)
	local u287 = false
	local u288 = nil

	if GetFFlagShowDevicePermissionsModal() and p109 == PromptType.DevicePermissionsModal and p107.settingsAppAvailable == nil then
		if FFlagEnableRetryForLinkingProtocolFetch then
			for _ = 0, FIntLinkingProtocolFetchRetries do
				local thread = task.spawn(function() -- line: 1297
					-- upvalues: u287 (ref), u288 (ref), default3 (copy), SettingsRoute (copy)
					local v482, v483 = default3:supportsSwitchToSettingsApp(SettingsRoute.Microphone):await()

					u287 = v482
					u288 = v483
				end)

				task.wait(FIntLinkingProtocolFetchTimeoutMS / 1000)
				task.cancel(thread)

				if u288 ~= nil then
					break
				end
			end
		else
			local v291, v292 = default3:supportsSwitchToSettingsApp(SettingsRoute.Microphone):await()

			u287 = v291
			u288 = v292
		end

		p107.settingsAppAvailable = u287 and u288
	end

	p107.voiceChatPromptInstance = Roact.mount(Roact.createElement(VoiceChatPrompt, {
		Analytics = Analytics.new(),
		promptSignal = p107.promptSignal.Event,
		bannedUntil = s15,
		policyMapper = p107.policyMapper,
		errorText = errorText,
		onReadyForSignal = p108,
		VoiceChatServiceManager = p107,
		settingsAppAvailable = p107.settingsAppAvailable ~= nil and p107.settingsAppAvailable,
		onContinueFunc = if p109 ~= PromptType.VoiceChatSuspendedTemporary and not v283 then if not v285 then if not v286 then nil else function() -- line: 1336
			-- upvalues: p107 (copy), Constants2 (copy), GetFFlagShowLikelySpeakingBubbles (copy), ExpChat (copy)
			p107:RecordUserSeenModal(Constants2.MODAL_IDS.IN_EXP_UPSELL)

			if GetFFlagShowLikelySpeakingBubbles() and ExpChat.Events.ShowLikelySpeakingBubblesChanged then
				ExpChat.Events.ShowLikelySpeakingBubblesChanged(false)
			end
		end else function() -- line: 1333
			-- upvalues: p107 (copy)
			p107.Analytics:reportClosedNudge(p107:GetNudgeAnalyticsData())
		end else function() -- line: 1330
			-- upvalues: PostInformedOfBan (copy), p107 (copy)
			local v484 = PostInformedOfBan
			local v485 = p107
			local s16 = "PostRequest"

			v484(function(...) -- line: 696
				-- upvalues: v485 (copy), s16 (copy)
				return v485[s16](v485, ...)
			end, true)
		end,
		onPrimaryActivated = if not v285 then if v52 or (not GetFFlagJoinWithoutMicPermissions() or p109 ~= PromptType.Permission) then if not GetFFlagJoinWithoutMicPermissions() or (not GetFFlagShowDevicePermissionsModal() or p109 ~= PromptType.DevicePermissionsModal) then if not v283 then if not v286 then nil else function() -- line: 1399
			-- upvalues: p107 (copy)
			p107.Analytics:reportInExpConsent("accepted", p107.inExpUpsellEntrypoint, p107:GetInExpUpsellAnalyticsData())
			p107:EnableVoice()
		end else function() -- line: 1395
			-- upvalues: p107 (copy)
			p107:reportBanMessage("Understood")
			p107.Analytics:reportBanMessageEvent("Understood")
		end else function() -- line: 1374
			-- upvalues: v18 (copy), p107 (copy), default3 (copy), SettingsRoute (copy)
			v18:debug("Settings app available: {}", p107.settingsAppAvailable)
			p107.Analytics:reportDevicePermissionsModalEvent(not p107.settingsAppAvailable and "Acknowledged" or "OpenedSettings", p107:GetSessionId(), p107:GetInExpUpsellAnalyticsData())

			if p107.settingsAppAvailable then
				v18:debug("Switching to settings app")
				default3:switchToSettingsApp(SettingsRoute.Microphone):andThen(function() -- line: 1385
					-- upvalues: v18 (copy)
					v18:debug("Successfully switched to settings app")
				end):catch(function() -- line: 1388
					-- upvalues: v18 (copy)
					v18:error("Error switching to settings app")
				end)

				return
			end

			v18:debug("Current platform does not support switching to settings app")
		end else function() -- line: 1354
			-- upvalues: default3 (copy), v18 (copy)
			local v487 = default3:supportsSwitchToSettingsApp():await()

			v18:debug("Settings app available: {}", v487)

			if v487 then
				v18:debug("Switching to settings app")
				default3:switchToSettingsApp():andThen(function() -- line: 1360
					-- upvalues: v18 (copy)
					v18:debug("Successfully switched to settings app")
				end):catch(function() -- line: 1363
					-- upvalues: v18 (copy)
					v18:error("Error switching to settings app")
				end)

				return
			end

			v18:debug("Current platform does not support switching to settings app")
		end else function() -- line: 1347
			-- upvalues: p107 (copy)
			p107.Analytics:reportAcknowledgedNudge(p107:GetNudgeAnalyticsData())
		end,
		onSecondaryActivated = if p109 ~= PromptType.VoiceToxicityModal then if not v285 then if not v283 then if not v286 then if p109 ~= PromptType.DevicePermissionsModal then nil else function() -- line: 1433
			-- upvalues: p107 (copy)
			p107.Analytics:reportDevicePermissionsModalEvent("Denied", p107:GetSessionId(), p107:GetInExpUpsellAnalyticsData())
		end else function() -- line: 1423
			-- upvalues: p107 (copy), Constants2 (copy), PromptType (copy)
			p107.Analytics:reportInExpConsent("denied", p107.inExpUpsellEntrypoint, p107:GetInExpUpsellAnalyticsData())

			if p107.inExpUpsellEntrypoint ~= Constants2.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
				p107:showPrompt(PromptType.VoiceConsentDeclinedToast)
			end
		end else function() -- line: 1418
			-- upvalues: p107 (copy)
			p107:ShowVoiceToxicityFeedbackToast()
			p107:reportBanMessage("Denied")
			p107.Analytics:reportBanMessageEvent("Denied")
		end else function() -- line: 1415
			-- upvalues: p107 (copy)
			p107.Analytics:reportDeniedNudge(p107:GetNudgeAnalyticsData())
		end else function() -- line: 1409
			-- upvalues: p107 (copy), v43 (copy)
			p107:ShowVoiceToxicityFeedbackToast()

			if v43 then
				p107.Analytics:reportDeniedNudge(p107:GetNudgeAnalyticsData())
			end
		end
	}), CoreGui, "RobloxVoiceChatPromptGui")
end
function t3.showPrompt(p110, p111, p112) -- line: 1447
	-- upvalues: GetFFlagEnableVoicePromptReasonText (copy), v18 (copy)
	if GetFFlagEnableVoicePromptReasonText() then
		p110.errorText = p112 or nil
	end

	p110:createPromptInstance(function() -- line: 1451
		-- upvalues: v18 (copy), p111 (copy), p110 (copy)
		v18:debug("Show Prompt: {}", p111)
		p110.promptSignal:fire(p111)
	end, p111)
end
function t3.showJoinVoicePrompt(p113) -- line: 1457
	-- upvalues: PromptType (copy), AppStorageService (copy), Constants2 (copy)
	p113:showPrompt(PromptType.UnifiedJoinVoiceToast)
	pcall(function() -- line: 1459
		-- upvalues: AppStorageService (copy), Constants2 (copy)
		AppStorageService:SetItem(Constants2.VOICE_WITH_TC_TOAST_KEY, "true")
		AppStorageService:Flush()
	end)
end
function t3.CheckAndShowPermissionPrompt(p114) -- line: 1465
	-- upvalues: GetFFlagEnableSeamlessVoiceV2 (copy), GetFFlagJoinWithoutMicPermissions (copy), PERMISSION_STATE (copy), PromptType (copy), PermissionsProtocol (copy), Promise (copy), GetFFlagEnableUniveralVoiceToasts (copy)
	local function showPrompt() -- line: 1466
		-- upvalues: p114 (copy), GetFFlagEnableSeamlessVoiceV2 (copy), GetFFlagJoinWithoutMicPermissions (copy), PERMISSION_STATE (copy), PromptType (copy), PermissionsProtocol (copy), Promise (copy)
		local userEligible = p114.userEligible

		if p114.voiceEnabled or userEligible then
			if GetFFlagEnableSeamlessVoiceV2() or not GetFFlagJoinWithoutMicPermissions() then
				return p114.PermissionsService:hasPermissions({ PermissionsProtocol.Permissions.MICROPHONE_ACCESS }):andThen(function(p115) -- line: 1479
					-- upvalues: PermissionsProtocol (copy), p114 (copy), PromptType (copy)
					if p115 and p115.status == PermissionsProtocol.Status.DENIED then
						p114:showPrompt(PromptType.Permission)
					end
				end)
			end

			if p114.permissionState == PERMISSION_STATE.LISTEN_ONLY then
				p114:showPrompt(PromptType.Permission)
			end
		end

		return Promise.resolve()
	end

	if GetFFlagEnableUniveralVoiceToasts() then
		return showPrompt()
	end

	return p114:asyncInit():andThen(function() -- line: 1492
	end):catch(function() -- line: 1492
		-- upvalues: showPrompt (copy)
		return showPrompt()
	end)
end
function t3.showDataConsentToast(p116) -- line: 1498
	-- upvalues: GetFFlagSeamlessVoiceConsentToastPolicy (copy), UniversalAppPolicy (copy), SeamlessVoiceStatus (copy), Constants2 (copy), PromptType (copy)
	local v300 = p116:FetchAgeVerificationOverlay()
	local v301 = false

	if GetFFlagSeamlessVoiceConsentToastPolicy() then
		v301 = UniversalAppPolicy.getAppFeaturePolicies().getDisplayCheckboxInVoiceConsent() or false
	end

	local v302, showDataConsentToast

	if type(v300) == "table" then
		v302 = if not v300.voiceSettings then SeamlessVoiceStatus.Invalid else v300.voiceSettings.seamlessVoiceStatus
		showDataConsentToast = v300.showDataConsentToast
	else
		showDataConsentToast = false
		v302 = SeamlessVoiceStatus.Invalid
	end

	if showDataConsentToast and v301 then
		showDataConsentToast = type(p116:_GetShowAgeVerificationOverlay()) == "table" and p116:_GetShowAgeVerificationOverlay().showDataConsentToast
	end

	if v302 == SeamlessVoiceStatus.EnabledExistingUser and showDataConsentToast and v301 then
		p116:RecordUserSeenModal(Constants2.MODAL_IDS.DATA_CONSENT_TOAST)

		return p116:showPrompt(PromptType.VoiceDataConsentOptOutToast)
	end
end
function t3.CheckAndShowNotAudiblePrompt(p117) -- line: 1532
	-- upvalues: PromptType (copy), Promise (copy)
	if game:GetEngineFeature("VoiceChatSupported") then
		return p117:asyncInit():andThen(function() -- line: 1535
			-- upvalues: p117 (copy), PromptType (copy)
			if UserSettings().GameSettings.MasterVolume == 0 then
				p117:showPrompt(PromptType.NotAudible)
			end
		end):catch(function() -- line: 1541
		end)
	end

	return Promise.resolve()
end
function t3.InitialJoinFailedPrompt(p118) -- line: 1546
	-- upvalues: v18 (copy), GetFFlagVoiceChatClientRewriteMasterLua (copy), PromptType (copy)
	v18:debug("JoinByGroupIdToken returns false")

	if not GetFFlagVoiceChatClientRewriteMasterLua then
		p118:showPrompt(PromptType.Retry)
	end
end
function t3.ShowVoiceToxicityFeedbackToast(p119) -- line: 1553
	-- upvalues: v18 (copy), PromptType (copy)
	v18:debug("Sending feedback toast")
	p119:showPrompt(PromptType.VoiceToxicityFeedbackToast)
end
function t3.GetNudgeAnalyticsData(p120) -- line: 1558
	-- upvalues: Players (copy)
	return Players.LocalPlayer.UserId, p120:GetSessionId()
end
function t3.GetInExpUpsellAnalyticsData(_) -- line: 1562
	-- upvalues: EngineFeature (copy), RbxAnalyticsService (copy)
	local s17 = ""

	if EngineFeature then
		s17 = RbxAnalyticsService:GetPlaySessionId()
	end

	return game.GameId, game.PlaceId, s17
end
function t3.reportBanMessage(t21: {[any]: any}, s18: string) -- line: 1570
	-- upvalues: Players (copy)
	t21.Analytics:reportBanMessageEventV2(s18, t21.banReason, Players.LocalPlayer.UserId, not t21.service and "" or t21.previousSessionId)
end
function t3.reportJoinVoiceUpsellEvent(t22: {[any]: any}, p122, s19: string?, s20: string?) -- line: 1579
	-- upvalues: v57 (copy), RbxAnalyticsService (copy), FFlagVoiceRewarmTelemetry (copy)
	if v57 then
		local PlaySessionId = RbxAnalyticsService:GetPlaySessionId()

		if FFlagVoiceRewarmTelemetry then
			t22.Analytics:reportJoinVoiceUpsellEvent(p122, PlaySessionId, t22:UserVoiceEnabled(), s19, s20)

			return
		end

		t22.Analytics:reportJoinVoiceUpsellEvent(p122, PlaySessionId, t22:UserVoiceEnabled())
	end
end
function t3.SetAndSyncActive(t23: {[any]: any}, p123, b6: boolean) -- line: 1600
	t23.coreVoiceManager:SetAndSyncActive(p123, b6)
end
function t3.CreateAudioDeviceData(t24: {[any]: any}, p124) -- line: 1604
	return t24.coreVoiceManager:CreateAudioDeviceData(p124)
end
function t3.onInstanceAdded(t25: {[any]: any}, p125) -- line: 1608
	return t25.coreVoiceManager:onInstanceAdded(p125)
end
function t3.UpdateAudioDeviceInputDebugger(p126) -- line: 1612
	-- upvalues: v44 (copy), v18 (copy), Roact (copy), AudioDeviceInputDebugger (copy), CoreGui (copy)
	if v44 then
		if not p126.voiceDebuggerInstance then
			v18:debug("Mounting AudioDeviceInput Debugger")
			p126.voiceDebuggerInstance = Roact.mount(Roact.createElement(AudioDeviceInputDebugger, {
				instances = p126.audioDevices,
				mutedPlayers = p126.mutedPlayers
			}), CoreGui, "RobloxVoiceChatPromptGui")

			return
		end

		Roact.update(p126.voiceDebuggerInstance, Roact.createElement(AudioDeviceInputDebugger, {
			instances = p126.audioDevices,
			mutedPlayers = p126.mutedPlayers
		}))
	end
end
function t3.AddReverseNudgeToxicUser(t26: {[any]: any}, s21: string, p127, p128) -- line: 1636
	-- upvalues: GetFIntVoiceReverseNudgeUXDisplayTimeSeconds (copy)
	p127(s21, "iconColorChange")

	local v329 = t26.reverseNudgeToxicUserRemovalCallbacks[s21]

	if v329 ~= nil then
		task.cancel(v329)
	end

	local thread = task.delay(GetFIntVoiceReverseNudgeUXDisplayTimeSeconds(), function() -- line: 1650
		-- upvalues: p128 (copy), s21 (copy), t26 (copy)
		p128(s21)
		t26.reverseNudgeToxicUserRemovalCallbacks[s21] = nil
	end)

	t26.reverseNudgeToxicUserRemovalCallbacks[s21] = thread
end
function t3.onInstanceRemove(t27: {[any]: any}, p129) -- line: 1657
	return t27.coreVoiceManager:onInstanceRemove(p129)
end
function t3.hookupAudioDeviceInputListener(p130) -- line: 1661
	return p130.coreVoiceManager:hookupAudioDeviceInputListener()
end
function t3.ToggleMutePlayer(t28: {[any]: any}, n5: number, s22: string) -- line: 1665
	return t28.coreVoiceManager:ToggleMutePlayer(n5, s22)
end
function t3.MuteAll(t29: {[any]: any}, b7: boolean, s23: string) -- line: 1669
	return t29.coreVoiceManager:MuteAll(b7, s23)
end
function t3.ToggleMuteSome(t30: {[any]: any}, t31: {[any]: any}, b8: boolean, s24: string, s25: string) -- line: 1673
	return t30.coreVoiceManager:ToggleMuteSome(t31, b8, s24, s25)
end
function t3.FireMuteNonFriendsEvent(p131) -- line: 1682
	p131.mutedNonFriends:Fire()
end
function t3.EnsureCorrectMuteState(t32: {[any]: any}, t33: {[any]: any}, b9: boolean) -- line: 1686
	-- upvalues: VoiceChatService (copy), EngineFeature2 (copy), Players (copy)
	local t34 = {}

	for _, v351 in t33 do
		local v352 = t32.participants[tostring(v351)]

		if v352 and b9 ~= v352.isMutedLocally then
			if VoiceChatService.UseNewAudioApi then
				t34[v351] = true
				t32.mutedPlayers[v351] = b9
			else
				t32.service:SubscribePause(v351, b9)
			end

			v352.isMutedLocally = b9
			t32.participantsUpdate:Fire(t32.participants)
		end
	end

	if VoiceChatService.UseNewAudioApi then
		for v353 in t32.audioDevices do
			if v353.Player and t34[v353.Player.UserId] then
				if EngineFeature2 and v353.Player ~= Players.LocalPlayer then
					v353.MutedByLocalUser = b9
				else
					v353.Active = not b9
				end
			end
		end
	end
end
function t3.FireUserAgencySelectedEvent(t35: {[any]: any}, b10: boolean) -- line: 1718
	t35.userAgencySelected:Fire(b10)
end
function t3.ParticipantStateToIcon(_, p133, p134) -- line: 1722
	-- upvalues: VOICE_STATE (copy)
	local INACTIVE = VOICE_STATE.INACTIVE

	if not p133.subscriptionCompleted then
		INACTIVE = VOICE_STATE.CONNECTING
	elseif p133.isMutedLocally then
		INACTIVE = VOICE_STATE.LOCAL_MUTED
	elseif p133.isMuted then
		INACTIVE = VOICE_STATE.MUTED
	elseif p133.isSignalActive then
		INACTIVE = VOICE_STATE.TALKING
	end

	return getIcon(INACTIVE, p134)
end
function t3.VoiceStateToIcon(_, p136, p137, p138) -- line: 1737
	return getIcon(p136, p137, p138)
end
function t3.GetIcon(_, p140, p141) -- line: 1741
	return getIconSrc(p140, p141)
end
function t3.JoinVoice(p142, p143) -- line: 1745
	-- upvalues: FFlagVoiceRewarmTelemetry (copy), v68 (copy), v18 (copy), Constants2 (copy), GetFFlagEnableConnectDisconnectInSettingsAndChrome (copy), t2 (copy), GetFFlagEnableVoiceTrustedConnectionsToasts (copy), GetFFlagUpdateVoiceConnectionToasts (copy), PromptType (copy), GetFFlagNonVoiceFTUX (copy), AppStorageService (copy), GetFFlagEnableVrVoiceParity (copy), Promise (copy), v51 (copy), GetFFlagEnableSeamlessVoiceV2 (copy), v56 (copy), GetFFlagDisableConsentModalForExistingUsers (copy), GetFFlagShowToastWhenAgeGatingVoice (copy), GetFFlagIntegratePhoneUpsellJoinVoice (copy), GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints (copy), getOverlayStore (copy), OverlayTypes (copy), SocialUpsellType (copy), Enum2 (copy), v49 (copy)
	local joinVoiceButtonContext = nil
	local REJOIN_PREVIOUS_CHANNEL = nil

	if FFlagVoiceRewarmTelemetry then
		joinVoiceButtonContext = p142.joinVoiceButtonContext
		p142.joinVoiceButtonContext = nil
	end

	if v68 then
		v18:debug("Consuming voice re-warm cookie on JoinVoice")
		p142:SetVoiceRewarmCookie("true")
	end

	local v371 = p142:FetchAgeVerificationOverlay().showVoiceInExperienceUpsellVariant or Constants2.IN_EXP_UPSELL_VARIANT.VARIANT3

	if not FFlagVoiceRewarmTelemetry then
		p142.Analytics:reportJoinVoiceButtonEvent("clicked", p142:GetInExpUpsellAnalyticsData())
	end

	if GetFFlagEnableConnectDisconnectInSettingsAndChrome() and p142.previousGroupId then
		if FFlagVoiceRewarmTelemetry then
			REJOIN_PREVIOUS_CHANNEL = t2.REJOIN_PREVIOUS_CHANNEL
		end

		p142:RejoinPreviousChannel()

		if GetFFlagEnableVoiceTrustedConnectionsToasts() then
			p142:showJoinVoicePrompt()
		elseif GetFFlagUpdateVoiceConnectionToasts() then
			p142:showPrompt(PromptType.UnifiedJoinVoiceToast)
		else
			p142:showPrompt(PromptType.JoinVoice)
		end

		p142:ShowVoiceUI()
		p142:SetVoiceConnectCookieValue(true)
	elseif GetFFlagNonVoiceFTUX() and p142.isShowingFTUX then
		if FFlagVoiceRewarmTelemetry then
			REJOIN_PREVIOUS_CHANNEL = t2.EXIT_FTUX
		end

		p142:HideFTUX(AppStorageService)
	elseif p142.deniedMicPermissions then
		if FFlagVoiceRewarmTelemetry then
			REJOIN_PREVIOUS_CHANNEL = t2.MIC_PERMISSION_PROMPT
		end

		if GetFFlagEnableVrVoiceParity() then
			p142:CheckAndShowPermissionPrompt()
		else
			p142:CheckAndShowPermissionPrompt():finallyReturn(Promise.reject())
		end
	elseif GetFFlagEnableConnectDisconnectInSettingsAndChrome() and p142:UserVoiceEnabled() then
		if FFlagVoiceRewarmTelemetry then
			REJOIN_PREVIOUS_CHANNEL = t2.FIRST_JOIN_SESSION
		end

		if v51 then
			p142.isInitialJoin = true
		end

		p142.attemptVoiceRejoin:Fire()

		if GetFFlagEnableSeamlessVoiceV2() and p142:IsNewSeamlessVoiceUserDisconnect() then
			p142:SetVoiceConnectCookieValue(true)
			p142:SetNewUserFTUXCookieValue(true)
		end
	elseif v56 and p142:UserOnlyEligibleForVoiceViaOverlay() or p142:UserOnlyEligibleForVoice() then
		if FFlagVoiceRewarmTelemetry then
			REJOIN_PREVIOUS_CHANNEL = t2.CONSENT_MODAL
		end

		if GetFFlagDisableConsentModalForExistingUsers() and p142:IsSeamlessVoice() then
			p142:EnableVoice()
		else
			p142:SetInExpUpsellEntrypoint(Constants2.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE)
			p142:showPrompt((p142:GetInExpUpsellPromptFromEnum(v371)))
		end
	elseif GetFFlagShowToastWhenAgeGatingVoice() and p142:EligibleForAgeCheckToast() then
		if FFlagVoiceRewarmTelemetry then
			REJOIN_PREVIOUS_CHANNEL = t2.AGE_CHECK_TOAST
		end

		p142:showPrompt(PromptType.AgeCheckForVoiceToast)
	elseif GetFFlagIntegratePhoneUpsellJoinVoice() and GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints() and not p142:UserVoiceEnabled() and p142:FetchPhoneVerificationUpsell(Constants2.IN_EXP_PHONE_UPSELL_IXP_LAYER) == Constants2.PHONE_UPSELL_VALUE_PROP.VoiceChat then
		if FFlagVoiceRewarmTelemetry then
			REJOIN_PREVIOUS_CHANNEL = t2.PHONE_UPSELL
		end

		if p143 then
			p143:SetVisibility(false, true)
		end

		p142:ShowInExperiencePhoneVoiceUpsell(Constants2.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE, Constants2.IN_EXP_PHONE_UPSELL_IXP_LAYER)
	elseif p142:EligibleForFaeUpsell() then
		if FFlagVoiceRewarmTelemetry then
			REJOIN_PREVIOUS_CHANNEL = t2.FAE_UPSELL
		end

		p142.coreVoiceManager:OptUserToJoinVoice()

		local v372 = getOverlayStore(false)

		if FFlagVoiceRewarmTelemetry then
			p142:reportJoinVoiceUpsellEvent("Click", joinVoiceButtonContext, REJOIN_PREVIOUS_CHANNEL)
		else
			p142:reportJoinVoiceUpsellEvent("Click")
		end

		v372.setCurrentOverlay(OverlayTypes.SocialUpsell, {
			upsellType = SocialUpsellType.FacialAgeEstimation,
			data = {
				isInExperience = true,
				countDownBadgeText = nil,
				isPhase2 = true,
				upsellEntrySurface = Enum2.UpsellEntrySurfaceType.InExperienceVoiceChatIcon,
				upsellEntryComponent = Enum2.UpsellComponent.Modal,
				upsellPurpose = Enum2.UpsellStage.Fae
			}
		})
	end

	if FFlagVoiceRewarmTelemetry then
		local v373, v374, v375 = p142:GetInExpUpsellAnalyticsData()

		p142.Analytics:reportJoinVoiceButtonEvent("clicked", v373, v374, v375, joinVoiceButtonContext, REJOIN_PREVIOUS_CHANNEL)
	end

	if v49 and p142:IsSeamlessVoice() then
		task.spawn(function() -- line: 1877
			-- upvalues: p142 (copy)
			p142.coreVoiceManager:PostUserVoiceConnectionStatus(true)
		end)
	end
end
function t3.EligibleForFaeUpsell(p144) -- line: 1883
	-- upvalues: GetFFlagEnableVoiceUxUpdates (copy), FFlagTestDeviceForFAEUpsell (copy), deviceMeetsRequirementsForFAE (copy)
	local v377 = GetFFlagEnableVoiceUxUpdates()

	if v377 then
		v377 = p144.coreVoiceManager:EligibleForFaeUpsell()

		if v377 then
			v377 = p144.AvatarChatService:deviceMeetsRequirementsForFeature(Enum.DeviceFeatureType.InExperienceFAE)

			if v377 then
				if FFlagTestDeviceForFAEUpsell then
					return (deviceMeetsRequirementsForFAE())
				end

				v377 = true
			end
		end
	end

	return v377
end
function t3.EligibleForAgeCheckToast(p145) -- line: 1890
	return p145.coreVoiceManager:EligibleForAgeCheckToast()
end
function t3.ShouldShowJoinVoice(p146) -- line: 1895
	-- upvalues: GetFFlagEnableVoiceUxUpdates (copy), FFlagVoiceRewarmTelemetry (copy), t1 (copy), VoiceChatCore (copy), v68 (copy), GetFFlagOnlyEnableJoinVoiceInVoiceEnabledUniverses (copy), GetFFlagEnableConnectDisconnectInSettingsAndChrome (copy), GetFFlagShowToastWhenAgeGatingVoice (copy), GetFFlagIntegratePhoneUpsellJoinVoice (copy), GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints (copy), Constants2 (copy)
	if GetFFlagEnableVoiceUxUpdates() then
		if FFlagVoiceRewarmTelemetry then
			if p146:EligibleForFaeUpsell() then
				p146.joinVoiceButtonContext = t1.FAE_UPSELL

				return true
			end

			if p146:HasSeamlessVoiceFeature(VoiceChatCore.Constants.SeamlessVoiceFeatures.InitialJoinVoice) and p146:GetVoiceConnectCookie() == "" then
				p146.joinVoiceButtonContext = t1.VOICE_FTUX

				return true
			end

			if v68 and p146:GetVoiceRewarmCookie() == "" and p146:VoiceChatEnded() then
				p146.joinVoiceButtonContext = t1.REWARM

				return true
			end
		elseif p146:EligibleForFaeUpsell() or p146:HasSeamlessVoiceFeature(VoiceChatCore.Constants.SeamlessVoiceFeatures.InitialJoinVoice) and p146:GetVoiceConnectCookie() == "" or v68 and p146:GetVoiceRewarmCookie() == "" and p146:VoiceChatEnded() then
			return true
		end
	elseif GetFFlagOnlyEnableJoinVoiceInVoiceEnabledUniverses() then
		if GetFFlagEnableConnectDisconnectInSettingsAndChrome() and p146:IsSeamlessVoice() and p146:verifyUniverseAndPlaceCanUseVoice() then
			return not p146.voiceUIVisible
		end
	elseif GetFFlagEnableConnectDisconnectInSettingsAndChrome() and p146:IsSeamlessVoice() then
		return not p146.voiceUIVisible
	end

	if GetFFlagShowToastWhenAgeGatingVoice() and p146:EligibleForAgeCheckToast() then
		return true
	end

	local v380 = p146:UserInInExperienceUpsellTreatment()
	local v381 = p146:UserOnlyEligibleForVoice() or p146:UserVoiceEnabled()

	if GetFFlagIntegratePhoneUpsellJoinVoice() and GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints() and not v381 and not p146:UserVoiceEnabled() and p146:FetchPhoneVerificationUpsell(Constants2.IN_EXP_PHONE_UPSELL_IXP_LAYER) == Constants2.PHONE_UPSELL_VALUE_PROP.VoiceChat then
		return true
	end

	return v380 and v381
end
function t3.ShouldShowJoinVoiceOnDisconnect(p147) -- line: 1971
	return p147.coreVoiceManager:ShouldShowJoinVoiceOnDisconnect()
end
function t3.IsSeamlessVoice(p148) -- line: 1975
	-- upvalues: GetFFlagCheckUniversePlaceBeforeSuspending (copy), v18 (copy), SeamlessVoiceStatus (copy)
	if GetFFlagCheckUniversePlaceBeforeSuspending() then
		return p148.coreVoiceManager:IsSeamlessVoice()
	end

	local v384 = p148:FetchAgeVerificationOverlay()

	if not v384 or not v384.voiceSettings then
		v18:error("VoiceChatServiceManager:IsSeamlessVoice() - ageVerificationOverlayData or voiceSettings is nil")

		return false
	end

	local seamlessVoiceStatus = v384.voiceSettings.seamlessVoiceStatus

	return seamlessVoiceStatus == SeamlessVoiceStatus.EnabledExistingUser or seamlessVoiceStatus == SeamlessVoiceStatus.EnabledNewUser
end
function t3.HasSeamlessVoiceFeature(p149, p150) -- line: 1991
	return p149.coreVoiceManager:HasSeamlessVoiceFeature(p150)
end
function t3.IsNewSeamlessVoiceUserDisconnect(p151) -- line: 1995
	return p151.coreVoiceManager:IsNewSeamlessVoiceUserDisconnect()
end
function t3.GetConnectDisconnectButtonAnalyticsData(t36: {[any]: any}, b11: boolean) -- line: 1999
	-- upvalues: EngineFeature (copy), RbxAnalyticsService (copy)
	local s26 = ""

	if EngineFeature then
		s26 = RbxAnalyticsService:GetPlaySessionId()
	end

	local t37 = {
		game.GameId,
		game.PlaceId,
		s26
	}

	if b11 and t36:getService() then
		table.insert(t37, t36:GetSessionId())
	end

	return unpack(t37)
end
function t3.GetConnectDisconnectAnalyticsData(p152) -- line: 2011
	-- upvalues: EngineFeature (copy), RbxAnalyticsService (copy), GetFFlagNonVoiceFTUX (copy), default (copy)
	local t38 = {}
	local s27 = ""

	if EngineFeature then
		s27 = RbxAnalyticsService:GetPlaySessionId()
	end

	t38.universeId = game.GameId
	t38.placeId = game.PlaceId
	t38.playSessionId = s27

	if GetFFlagNonVoiceFTUX() then
		t38.voiceSessionId = not p152.service and "" or p152:GetSessionId()
	else
		t38.voiceSessionId = p152:GetSessionId()
	end

	t38.durationTimestamp = default:getTimestamp()

	return t38
end
function t3.Leave(p153) -- line: 2031
	-- upvalues: GetFFlagDisconnectToastClientRewrite (copy), GetFFlagEnableConnectDisconnectInSettingsAndChrome (copy), GetFFlagVoiceChatClientRewriteMasterLua (copy), v49 (copy)
	p153:ensureInitialized("leave")

	if GetFFlagDisconnectToastClientRewrite() and GetFFlagEnableConnectDisconnectInSettingsAndChrome() then
		p153:SetVoiceConnectCookieValue(false)
	end

	p153.Analytics:reportConnectDisconnectEvents("voiceDisconnectEvent", p153:GetConnectDisconnectAnalyticsData())

	local GroupId = p153.service:GetGroupId()
	local v398 = p153.service:IsPublishPaused()

	if GetFFlagVoiceChatClientRewriteMasterLua() then
		local VoiceChatService2 = game:GetService("VoiceChatService")

		if VoiceChatService2 then
			VoiceChatService2:leaveVoice()
		end
	else
		p153.service:Leave()
	end

	p153:HideVoiceUI()
	p153.previousGroupId = GroupId
	p153.previousMutedState = v398

	if not GetFFlagDisconnectToastClientRewrite() and GetFFlagEnableConnectDisconnectInSettingsAndChrome() then
		p153:SetVoiceConnectCookieValue(false)
	end

	if v49 and p153:IsSeamlessVoice() then
		task.spawn(function() -- line: 2054
			-- upvalues: p153 (copy)
			p153.coreVoiceManager:PostUserVoiceConnectionStatus(false)
		end)
	end
end
function t3.GetVoiceStateFromEnum(_, p155) -- line: 2060
	-- upvalues: t4 (ref), VOICE_STATE (copy)
	if not t4[p155] then
		t4 = {
			[Enum.VoiceChatState.Idle] = VOICE_STATE.HIDDEN,
			[Enum.VoiceChatState.Joining] = VOICE_STATE.CONNECTING,
			[Enum.VoiceChatState.JoiningRetry] = VOICE_STATE.CONNECTING,
			[Enum.VoiceChatState.Joined] = VOICE_STATE.MUTED,
			[Enum.VoiceChatState.Leaving] = VOICE_STATE.MUTED,
			[Enum.VoiceChatState.Ended] = VOICE_STATE.HIDDEN,
			[Enum.VoiceChatState.Failed] = VOICE_STATE.ERROR
		}
	end

	return t4[p155]
end
function t3.GetInExpUpsellPromptFromEnum(_: {[any]: any}, s28: string) -- line: 2080
	-- upvalues: t5 (copy)
	return t5[s28]
end
function t3.getRecentUsersInteractionData(p156) -- line: 2085
	return p156.coreVoiceManager:getRecentUsersInteractionData()
end
function t3._setRecentUserState(p157, p158, p159) -- line: 2089
	return p157.coreVoiceManager:_setRecentUserState(p158, p159)
end
function t3._updateRecentUsersInteractionData(p160) -- line: 2093
	return p160.coreVoiceManager:_updateRecentUsersInteractionData()
end
function t3.SetupParticipantListeners(p161) -- line: 2097
	return p161.coreVoiceManager:SetupParticipantListeners()
end
function t3.Disconnect(p162) -- line: 2101
	p162.coreVoiceManager:Disconnect()
	p162.coreVoiceManager:unsubscribeAll()
end
function t3.GetSendMuteEvent(p163) -- line: 2106
	return p163.coreVoiceManager:GetSendMuteEvent()
end
function t3.GetLikelySpeakingUsersEvent(p164) -- line: 2110
	return p164.coreVoiceManager:GetLikelySpeakingUsersEvent()
end
function t3.ToggleMic(t40: {[any]: any}, s29: string?) -- line: 2115
	return t40.coreVoiceManager:ToggleMic(s29)
end
function t3.SubscribeRetry(t41: {[any]: any}, n6: number) -- line: 2119
	-- upvalues: v18 (copy)
	t41:ensureInitialized("subscribe retry")
	v18:debug("Attempting to retry connection to user: {}", "..." .. string.sub(tostring(n6), -4))
	t41.service:SubscribeRetry(n6)
end
function t3.JoinByGroupIdToken(p165, p166, p167) -- line: 2125
	return p165.coreVoiceManager:JoinByGroupIdToken(p166, p167)
end
function t3.RejoinPreviousChannel(p168) -- line: 2129
	-- upvalues: v18 (copy), GetFFlagVoiceChatClientRewriteMasterLua (copy)
	local previousGroupId = p168.previousGroupId
	local previousMutedState = p168.previousMutedState

	v18:debug("Rejoining previous channel {} with mute status {}", previousGroupId, previousMutedState)
	pcall(function() -- line: 2134
		-- upvalues: GetFFlagVoiceChatClientRewriteMasterLua (copy), p168 (copy), previousGroupId (copy), previousMutedState (copy)
		if GetFFlagVoiceChatClientRewriteMasterLua() then
			p168.coreVoiceManager:RejoinVoice()
			p168.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", p168:GetConnectDisconnectAnalyticsData())

			return
		end

		if previousGroupId and previousGroupId ~= "" then
			p168.service:Leave()

			if not p168.service:JoinByGroupIdToken(previousGroupId, previousMutedState, true) then
				p168:InitialJoinFailedPrompt()

				return
			end

			p168.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", p168:GetConnectDisconnectAnalyticsData())
		end
	end)
end

local function setVCSOutput(p169, p170) -- line: 2168
	-- upvalues: GetFFlagVoiceChatClientRewriteDisableVCSDevice (copy), v18 (copy)
	if GetFFlagVoiceChatClientRewriteDisableVCSDevice() then
		v18:error("[OutputDeviceSelection] setVCSOutput is deprecated")

		return {}
	end

	local ok, result, v430, v431 = pcall(function() -- line: 2174
		-- upvalues: p170 (copy)
		return p170:GetSpeakerDevices()
	end)

	if ok and (result and (v430 and (v431 and (#result > 0 and (v431 > 0 and (v431 <= #result and #result == #v430)))))) then
		local n7 = 0

		for i, v in ipairs(result) do
			if v == p169 then
				n7 = i
			end
		end

		if n7 > 0 then
			v18:info("[OutputDeviceSelection] Setting VCS Speaker Device To {} {}", result[n7], v430[n7])
			p170:SetSpeakerDevice(result[n7], v430[n7])

			return
		end

		v18:warning("Could not find equivalent VoiceChatService Device")

		return
	end

	v18:warning("Could not connect to Voice Chat Service to change Output Device")
end

function t3.SwitchDevice(p171, p172, p173, p174) -- line: 2202
	-- upvalues: VOICE_CHAT_DEVICE_TYPE (copy), SoundService (copy), v18 (copy), GetFFlagVoiceChatClientRewriteMasterLua (copy), setVCSOutput (copy), v77 (copy)
	if p172 == VOICE_CHAT_DEVICE_TYPE.Input then
		SoundService:SetInputDevice(p173, p174)
		v18:info("[InputDeviceSelection] Setting SS Mic Device To {} {}", p173, p174)

		return
	end

	SoundService:SetOutputDevice(p173, p174)
	v18:info("[OutputDeviceSelection] Setting SS Speaker Device To {} {}", p173, p174)

	if not GetFFlagVoiceChatClientRewriteMasterLua() then
		setVCSOutput(p173, if not v77 then nil else p171.service)
	end
end
function t3.GetDevices(_, p176) -- line: 2215
	-- upvalues: VOICE_CHAT_DEVICE_TYPE (copy), SoundService (copy)
	local ok, result, v443, v444 = pcall(function() -- line: 2216
		-- upvalues: p176 (copy), VOICE_CHAT_DEVICE_TYPE (copy), SoundService (copy)
		if p176 == VOICE_CHAT_DEVICE_TYPE.Input then
			return SoundService:GetInputDevices()
		end

		return SoundService:GetOutputDevices()
	end)

	return ok, result, v443, v444
end
function t3.VoiceChatAvailable(p177) -- line: 2227
	-- upvalues: MIN_VOICE_CHAT_API_VERSION (copy), VOICE_CHAT_AVAILABILITY (copy)
	local service = p177.service

	if p177.available == nil and service then
		p177.version = service:GetVoiceChatApiVersion()

		if p177.version >= MIN_VOICE_CHAT_API_VERSION then
			p177.available = service:GetVoiceChatAvailable()

			while p177.available == VOICE_CHAT_AVAILABILITY.Checking do
				wait(1)
				p177.available = service:GetVoiceChatAvailable()
			end
		end
	end

	if service then
		return p177.version >= MIN_VOICE_CHAT_API_VERSION and p177.available == VOICE_CHAT_AVAILABILITY.Available
	end

	return false
end
function t3.VoiceChatEnded(p178) -- line: 2247
	-- upvalues: v53 (copy)
	if p178.service then
		local VoiceChatState = p178.service.VoiceChatState

		if v53 then
			return VoiceChatState == Enum.VoiceChatState.Ended
		end

		return VoiceChatState == Enum.VoiceChatState.Ended or VoiceChatState == Enum.VoiceChatState.Idle
	end

	return true
end
function t3.UnmountPrompt(p179) -- line: 2259
	-- upvalues: Roact (copy)
	if p179.voiceChatPromptInstance ~= nil then
		Roact.unmount(p179.voiceChatPromptInstance)
		p179.voiceChatPromptInstance = nil
	end
end

t3.default = t3.new(CoreVoiceManager.default, nil, HttpRbxApiService, PermissionsProtocol.default, BlockingUtility:GetAfterBlockedStatusChangedEvent())

return t3
