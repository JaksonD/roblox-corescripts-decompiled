local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local v3 = require(l_CorePackages_0.Packages.Promise);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.LuauPolyfill);
local l_PermissionsProtocol_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_SoundService_0 = game:GetService("SoundService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v15 = require(l_CorePackages_0.Workspace.Packages.SocialUpsell);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v17 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local v19 = require(l_CorePackages_0.Workspace.Packages.VoiceChatCore);
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.VoiceChat).GlobalVoiceManager.default;
local v21 = require(script.Parent.Flags.GetFFlagDisableConsentModalForExistingUsers);
local v22 = require(script.Parent.Flags.GetFFlagOnlyEnableJoinVoiceInVoiceEnabledUniverses);
local v23 = require(script.Parent.Flags.GetFFlagUpdateVoiceConnectionToasts);
local v24 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableUniveralVoiceToasts);
local v25 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoicePromptReasonText);
local l_GetFFlagAvatarChatServiceEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled;
local l_GetFFlagVoiceChatServiceManagerUseAvatarChat_0 = v19.Flags.GetFFlagVoiceChatServiceManagerUseAvatarChat;
local l_GetFFlagUseLuaSignalrConsumer_0 = v19.Flags.GetFFlagUseLuaSignalrConsumer;
local l_GetFFlagNonVoiceFTUX_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagNonVoiceFTUX;
local l_GetFFlagJoinWithoutMicPermissions_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagJoinWithoutMicPermissions;
local v31 = require(l_RobloxGui_0.Modules.Flags.GetFIntVoiceReverseNudgeUXDisplayTimeSeconds);
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local v33 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableSeamlessVoiceDataConsentToast);
local l_GetFFlagSeamlessVoiceConsentToastPolicy_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSeamlessVoiceConsentToastPolicy;
local l_GetFFlagEnableFtuxExitOnMuteToggle_0 = v19.Flags.GetFFlagEnableFtuxExitOnMuteToggle;
local l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableVoiceChatMuteForVideoCaptures;
local l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExperienceVoiceCaptureMute;
local l_GetFFlagExpChatUseVoiceParticipantsStore_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagExpChatUseVoiceParticipantsStore;
local l_GetFFlagEnableVoiceUxUpdates_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableVoiceUxUpdates;
local l_GetFFlagShowToastWhenAgeGatingVoice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagShowToastWhenAgeGatingVoice;
local v41 = require(script.Parent.Flags.GetFFlagEnableVoiceTrustedConnectionsToasts);
local v42 = game:DefineFastFlag("FixNudgeDeniedEvents", false);
local v43 = game:DefineFastFlag("DebugShowAudioDeviceInputDebugger", false);
local v44 = game:DefineFastFlag("DebugSkipVoicePermissionCheck", false);
local v45 = game:DefineFastFlag("DebugSimulateConnectDisconnect", false);
local v46 = game:DefineFastFlag("DebugSkipSeamlessVoiceAPICheck", false);
local v47 = game:DefineFastFlag("FixSTUXShowingIncorrectly", false);
local v48 = game:DefineFastFlag("SendUserConnectionStatus", false);
local v49 = game:DefineFastInt("DebugConnectDisconnectInterval", 15);
local v50 = game:DefineFastFlag("SeamlessVoiceV2JoinVoiceToast", false);
local v51 = game:DefineFastFlag("DisablePermissionPromptDeeplink", false);
local v52 = game:DefineFastFlag("VoiceEndedCheckDisregardIdleState", false);
local v53 = game:DefineFastFlag("DisableMicRejectedPromiseReject", false);
local v54 = game:DefineFastFlag("DisableLeaveToastInStudio", false);
local v55 = game:DefineFastFlag("EnableVerifiedCheckViaOverlay", false);
local v56 = game:DefineFastFlag("InExperienceVoiceUpsellAnalyticsV2", false);
local l_GetFIntThrottleParticipantsUpdateMs_0 = v19.Flags.GetFIntThrottleParticipantsUpdateMs;
local v58 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableConnectDisconnectInSettingsAndChrome);
local v59 = game:DefineFastString("VoiceUIImprovementsIXPLayerName", "Voice.Exposure");
local v60 = game:DefineFastString("ThrottleParticipantsUpdateIXPLayerValue", "ThrottleParticipantsUpdate");
local v61 = game:DefineFastInt("SeamlessVoiceSTUXDisplayCount", 3);
local l_GetFFlagShowLikelySpeakingBubbles_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagShowLikelySpeakingBubbles;
local l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints;
local l_GetFFlagShowDevicePermissionsModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagShowDevicePermissionsModal;
local l_FFlagEnableRetryForLinkingProtocolFetch_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableRetryForLinkingProtocolFetch;
local v66 = game:DefineFastFlag("SeamlessVoiceBugfixesV1", false);
local l_GetFFlagIntegratePhoneUpsellJoinVoice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIntegratePhoneUpsellJoinVoice;
local l_GetFFlagInExperiencePhoneUpsellNewCopy_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagInExperiencePhoneUpsellNewCopy;
local l_GetFFlagCheckUniversePlaceBeforeSuspending_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagCheckUniversePlaceBeforeSuspending;
local l_FIntLinkingProtocolFetchRetries_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FIntLinkingProtocolFetchRetries;
local l_FIntLinkingProtocolFetchTimeoutMS_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FIntLinkingProtocolFetchTimeoutMS;
local v72 = game:DefineFastFlag("FixOutputDeviceChange", false);
local v73 = require(l_CorePackages_0.Workspace.Packages.VoiceChat);
local l_Constants_0 = v73.Constants;
local l_PostRecordUserSeenGeneralModal_0 = v73.AgeVerificationOverlay.PostRecordUserSeenGeneralModal;
local v76 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v77 = require(l_RobloxGui_0.Modules.VoiceChatPrompt.Components.VoiceChatPrompt);
local v78 = require(l_RobloxGui_0.Modules.VoiceChat.Components.AudioDeviceInputDebugger);
local v79 = require(l_RobloxGui_0.Modules.VoiceChatPrompt.PromptType);
local l_GetUserSettings_0 = v73.GetUserSettings;
local l_GetInformedOfBan_0 = v73.GetInformedOfBan;
local l_PostInformedOfBan_0 = v73.PostInformedOfBan;
local v83 = require(l_RobloxGui_0.Modules.Settings.getCamMicPermissions);
local l_BAN_REASON_0 = v76.BAN_REASON;
local v85 = require(l_RobloxGui_0.Modules.Settings.Enum.SeamlessVoiceStatus);
local v86 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy);
local l_GetFFlagVoiceChatClientRewriteMasterLua_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagVoiceChatClientRewriteMasterLua;
local l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagVoiceChatClientRewriteDisableVCSDevice;
local l_GetFFlagEnableSeamlessVoiceV2_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableSeamlessVoiceV2;
local l_GetFFlagDisconnectToastClientRewrite_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagDisconnectToastClientRewrite;
local l_GetFFlagEnableVrVoiceParity_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableVrVoiceParity;
local l_Analytics_0 = v19.Analytics;
local l_HttpService_0 = game:GetService("HttpService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local v95 = require(l_CorePackages_0.Workspace.Packages.BlockingUtility);
local v96 = require(l_RobloxGui_0.Modules.Settings.Resources.MicrophoneDevicePermissionsLogging);
local v97 = if l_GetFFlagAvatarChatServiceEnabled_0() then game:GetService("AvatarChatService") else nil;
local v98 = if l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0() then game:GetService("CaptureService") else nil;
local v99 = require(l_CorePackages_0.Workspace.Packages.ExpChat);
local l_default_2 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol.default;
local l_SettingsRoute_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).Enums.SettingsRoute;
local v102 = if l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() then require(l_CorePackages_0.Workspace.Packages.PhoneUpsell).PhoneUpsellController else nil;
local v103 = if l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() then require(l_CorePackages_0.Workspace.Packages.PhoneUpsell).Http.Requests.PostPhoneUpsellDisplayed else nil;
local l_CoreVoiceManager_0 = v19.CoreVoiceManager;
local l_Constants_1 = v19.Constants;
local l_getOverlayStore_0 = v15.Overlay.getOverlayStore;
local l_OverlayTypes_0 = v15.Overlay.OverlayTypes;
local l_SocialUpsellType_0 = v15.Enum.SocialUpsellType;
local l_Enum_0 = v15.Analytics.Enum;
local v110 = require(l_CorePackages_0.Workspace.Packages.SocialExperiments);
local l_FFlagTestDeviceForFAEUpsell_0 = v110.FFlagTestDeviceForFAEUpsell;
local l_deviceMeetsRequirementsForFAE_0 = v110.deviceMeetsRequirementsForFAE;
local l_game_EngineFeature_1 = game:GetEngineFeature("EnableMutedByLocalUser");
local l_FFlagEnablePartyVoiceChangersInLua_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnablePartyVoiceChangersInLua;
local l_VOICE_STATE_0 = l_Constants_0.VOICE_STATE;
local l_VOICE_CHAT_DEVICE_TYPE_0 = l_Constants_0.VOICE_CHAT_DEVICE_TYPE;
local l_VOICE_CHAT_AVAILABILITY_0 = l_Constants_0.VOICE_CHAT_AVAILABILITY;
local l_MIN_VOICE_CHAT_API_VERSION_0 = l_Constants_0.MIN_VOICE_CHAT_API_VERSION;
local l_WATCHED_MESSAGE_TYPES_0 = l_Constants_0.WATCHED_MESSAGE_TYPES;
local l_PERMISSION_STATE_0 = l_Constants_0.PERMISSION_STATE;
local l_VOICE_JOIN_PROGRESS_0 = l_Constants_1.VOICE_JOIN_PROGRESS;
local v122 = {
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
    HttpRbxApiService = l_HttpRbxApiService_0, 
    NotificationService = l_NotificationService_0, 
    runService = l_RunService_0, 
    PermissionsService = l_PermissionsProtocol_0.default, 
    communicationPermissionsResult = nil, 
    VoiceJoinProgress = l_VOICE_JOIN_PROGRESS_0.Idle, 
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
    VOICE_STATE = l_VOICE_STATE_0, 
    permissionState = if l_GetFFlagJoinWithoutMicPermissions_0() then l_PERMISSION_STATE_0.IDLE else nil, 
    isBanned = false, 
    bannedUntil = nil, 
    errorText = nil, 
    BlockStatusChanged = nil, 
    isInCall = false, 
    callMutedState = false, 
    banReason = nil, 
    _mutedAnyone = false, 
    VOICE_CHAT_DEVICE_TYPE = l_VOICE_CHAT_DEVICE_TYPE_0, 
    getPermissionsFunction = v83, 
    AvatarChatService = v97, 
    inExpUpsellEntrypoint = nil, 
    seamlessVoiceStatus = nil, 
    isShowingFTUX = false, 
    hideFTUXSignal = Instance.new("BindableEvent"), 
    settingsAppAvailable = nil, 
    hasLeftFTUX = false, 
    deniedMicPermissions = nil, 
    isInitialJoin = false, 
    CaptureService = v98
};
local v123 = v5.Set.new({
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
});
v123:add("_mutedAnyone");
v123:add("muteAllChanged");
local v124 = {};
local v125 = {
    [v76.IN_EXP_UPSELL_VARIANT.VARIANT1] = v79.VoiceConsentModalV1, 
    [v76.IN_EXP_UPSELL_VARIANT.VARIANT2] = v79.VoiceConsentModalV2, 
    [v76.IN_EXP_UPSELL_VARIANT.VARIANT3] = v79.VoiceConsentModalV3
};
getIconSrc = function(v126, v127) --[[ Line: 331 ]] --[[ Name: getIconSrc ]]
    return "rbxasset://textures/ui/VoiceChat/" .. (v127 and v127 .. "/" or "") .. v126 .. ".png";
end;
getIcon = function(v128, v129, v130) --[[ Line: 336 ]] --[[ Name: getIcon ]]
    -- upvalues: l_VOICE_STATE_0 (copy)
    if v128 == l_VOICE_STATE_0.MUTED then
        return getIconSrc("Muted", v130);
    elseif v128 == l_VOICE_STATE_0.CONNECTING then
        return getIconSrc("Connecting", v130);
    elseif v128 == l_VOICE_STATE_0.INACTIVE then
        return getIconSrc("Blank", v130);
    elseif v128 == l_VOICE_STATE_0.TALKING then
        local v131 = math.floor(0.5 + 5 * (v129 or math.random())) * 20;
        return v129 and getIconSrc("Unmuted" .. tostring(v131), v130) or getIconSrc("Blank", v130);
    else
        return getIconSrc("Error", v130);
    end;
end;
v122.__index = v122;
v122.__index = function(v132, v133) --[[ Line: 354 ]] --[[ Name: __index ]]
    -- upvalues: v123 (copy), v122 (copy)
    if v123:has(v133) then
        return v132.coreVoiceManager[v133];
    else
        return (rawget(v122, v133));
    end;
end;
v122.__newindex = function(v134, v135, v136) --[[ Line: 361 ]] --[[ Name: __newindex ]]
    -- upvalues: v123 (copy), v122 (copy)
    if v123:has(v135) then
        v134.coreVoiceManager[v135] = v136;
        return;
    else
        rawset(v122, v135, v136);
        return;
    end;
end;
v122.new = function(v137, v138, v139, v140, v141, v142, v143, v144, v145, v146) --[[ Line: 369 ]] --[[ Name: new ]]
    -- upvalues: l_Analytics_0 (copy), v83 (copy), v122 (copy), l_GetFFlagUseLuaSignalrConsumer_0 (copy), l_WATCHED_MESSAGE_TYPES_0 (copy), l_GetFIntThrottleParticipantsUpdateMs_0 (copy), l_IXPServiceWrapper_0 (copy), v59 (copy), v60 (copy), l_GetFFlagExpChatUseVoiceParticipantsStore_0 (copy), v99 (copy), l_GetFFlagShowLikelySpeakingBubbles_0 (copy), v24 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy), v44 (copy), v53 (copy), v3 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), v96 (copy), v58 (copy), v54 (copy), v79 (copy), v45 (copy), v17 (copy), v41 (copy), l_AppStorageService_0 (copy), v76 (copy), l_GetFFlagShowDevicePermissionsModal_0 (copy), v33 (copy), l_GetFFlagNonVoiceFTUX_0 (copy), v23 (copy), v50 (copy), l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0 (copy), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (copy), l_default_1 (copy)
    local v147 = setmetatable({
        service = v138, 
        HttpRbxApiService = v139, 
        NotificationService = v143, 
        PermissionsService = v140, 
        BlockStatusChanged = v141, 
        Analytics = l_Analytics_0.new(v142), 
        getPermissionsFunction = v144 or v83, 
        AvatarChatService = v145, 
        SequenceNumbers = {}, 
        SignalREventTable = {}, 
        coreVoiceManager = v137, 
        _mutedAnyone = false, 
        CaptureService = v146
    }, v122);
    if l_GetFFlagUseLuaSignalrConsumer_0() then
        for _, v149 in l_WATCHED_MESSAGE_TYPES_0 do
            v147.SignalREventTable[v149] = Instance.new("BindableEvent");
        end;
    end;
    v147.shouldThrottleParticipantUpdate = false;
    v147.participantsStateThrottleTime = 0;
    v147.lastParticipantsStateUpdate = 0;
    v147.lastStateUpdateCounter = 0;
    v147.reverseNudgeToxicUserRemovalCallbacks = {};
    if l_GetFIntThrottleParticipantsUpdateMs_0() > 0 then
        v147.participantsStateThrottleTime = l_GetFIntThrottleParticipantsUpdateMs_0() / 1000;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 411 ]]
            -- upvalues: l_IXPServiceWrapper_0 (ref), v59 (ref)
            return l_IXPServiceWrapper_0:GetLayerData(v59);
        end);
        if l_status_0 and l_result_0 and l_result_0[v60] then
            v147.shouldThrottleParticipantUpdate = true;
        end;
    end;
    v147.MuteStatusIcons = {
        MicOn = v147:GetIcon("Unmuted0", "SpeakerLight"), 
        MicOff = v147:GetIcon("Muted", "SpeakerLight"), 
        MicDisabled = v147:GetIcon("Muted", "SpeakerLight"), 
        Loading = v147:GetIcon("Connecting", "SpeakerLight"), 
        Error = v147:GetIcon("Error", "SpeakerLight")
    };
    v147.PlayerMuteStatusIcons = {
        MicOn = v147:GetIcon("Unmuted0", "MicLight"), 
        MicOff = v147:GetIcon("Muted", "MicLight"), 
        MicDisabled = v147:GetIcon("Muted", "MicLight"), 
        Loading = v147:GetIcon("Connecting", "MicLight"), 
        Error = v147:GetIcon("Error", "MicLight")
    };
    local v152 = false;
    local v153 = v147.attemptVoiceRejoin.Event:Connect(function() --[[ Line: 437 ]]
        -- upvalues: v152 (ref)
        v152 = true;
    end);
    local v154 = if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then v99.Stores.GetVoiceStore(false) else nil;
    v147.coreVoiceManager:subscribe("GetPermissions", function(v155, v156, v157, v158) --[[ Line: 444 ]]
        -- upvalues: v147 (copy)
        local v159 = "VoiceChatServiceManager.requestMicPermission";
        if v147.inExpUpsellEntrypoint ~= nil then
            v159 = v147.inExpUpsellEntrypoint;
        end;
        v147.getPermissionsFunction(v155, v156, v157, v159, v158);
    end);
    v147.coreVoiceManager:subscribe("OnVoiceParticipantRemoved", function(v160) --[[ Line: 451 ]]
        -- upvalues: l_GetFFlagExpChatUseVoiceParticipantsStore_0 (ref), v154 (copy), v99 (ref)
        if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then
            v154.handleVoiceParticipantRemoved(v160);
            return;
        else
            if v99.Events.VoiceParticipantRemoved then
                v99.Events.VoiceParticipantRemoved((tostring(v160)));
            end;
            return;
        end;
    end);
    v147.coreVoiceManager:subscribe("OnVoiceParticipantAdded", function(v161) --[[ Line: 458 ]]
        -- upvalues: l_GetFFlagExpChatUseVoiceParticipantsStore_0 (ref), v154 (copy), v99 (ref)
        if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then
            v154.handleVoiceParticipantAdded(v161);
            return;
        else
            if v99.Events.VoiceParticipantAdded then
                v99.Events.VoiceParticipantAdded((tostring(v161)));
            end;
            return;
        end;
    end);
    v147.coreVoiceManager:subscribe("OnVoiceParticipantToggleMuted", function(v162, v163) --[[ Line: 465 ]]
        -- upvalues: v99 (ref)
        if v99.Events.VoiceParticipantToggleMuted then
            v99.Events.VoiceParticipantToggleMuted(tostring(v162), v163);
        end;
    end);
    if l_GetFFlagShowLikelySpeakingBubbles_0() then
        v147.coreVoiceManager:subscribe("OnLikelySpeakingUsersUpdated", function(v164) --[[ Line: 473 ]]
            -- upvalues: v99 (ref)
            if v99.Events.LikelySpeakingUsersUpdated then
                v99.Events.LikelySpeakingUsersUpdated(v164);
            end;
        end);
        v147.coreVoiceManager:subscribe("OnShowLikelySpeakingBubblesChanged", function(v165) --[[ Line: 481 ]]
            -- upvalues: v99 (ref)
            if v99.Events.ShowLikelySpeakingBubblesChanged then
                v99.Events.ShowLikelySpeakingBubblesChanged(v165);
            end;
        end);
    end;
    v147.coreVoiceManager:subscribe("OnUserAndPlaceCanUseVoiceResolved", function(v166, v167) --[[ Line: 487 ]]
        -- upvalues: v147 (copy)
        v147:_onUserAndPlaceCanUseVoiceResolved(v166, v167);
    end);
    v147.coreVoiceManager:subscribe("OnRequestMicPermissionResolved", function() --[[ Line: 490 ]]
        -- upvalues: v24 (ref), v147 (copy)
        if v24() then
            return v147:CheckAndShowNotAudiblePrompt();
        else
            return;
        end;
    end);
    v147.coreVoiceManager:subscribe("OnRequestMicPermissionRejected", function() --[[ Line: 495 ]]
        -- upvalues: l_GetFFlagEnableSeamlessVoiceV2_0 (ref), v147 (copy), v24 (ref), v44 (ref), v53 (ref), v3 (ref)
        if l_GetFFlagEnableSeamlessVoiceV2_0() and v147:IsSeamlessVoice() then
            v147.deniedMicPermissions = true;
        end;
        if v24() and not v44 then
            if v53 then
                return v147:CheckAndShowPermissionPrompt();
            else
                return v147:CheckAndShowPermissionPrompt():finallyReturn(v3.reject());
            end;
        else
            return;
        end;
    end);
    v147.coreVoiceManager:subscribe("OnDevicePlayerChanged", function() --[[ Line: 508 ]]
        -- upvalues: v147 (copy)
        v147:UpdateAudioDeviceInputDebugger();
    end);
    v147.coreVoiceManager:subscribe("OnDeviceActiveChanged", function() --[[ Line: 511 ]]
        -- upvalues: v147 (copy)
        v147:UpdateAudioDeviceInputDebugger();
    end);
    v147.coreVoiceManager:subscribe("OnDeviceMuteChanged", function() --[[ Line: 514 ]]
        -- upvalues: v147 (copy)
        v147:UpdateAudioDeviceInputDebugger();
    end);
    if l_FFlagEnablePartyVoiceChangersInLua_0 then
        v147.coreVoiceManager:subscribe("OnVoiceChangerChanged", function() --[[ Line: 518 ]]
            -- upvalues: v147 (copy)
            v147:UpdateAudioDeviceInputDebugger();
        end);
    end;
    v147.coreVoiceManager:subscribe("OnStateChanged", function(_, v169) --[[ Line: 522 ]]
        -- upvalues: v96 (ref), v147 (copy), v58 (ref), v54 (ref), v79 (ref)
        v96:setClientSessionId(v147.coreVoiceManager:GetSessionId());
        if v169 == Enum.VoiceChatState.Ended and v147.bannedUntil == nil then
            if not v58() then
                v147:HideVoiceUI();
            end;
            if v54 and v147.runService:IsStudio() then
                return;
            else
                v147:showPrompt(v79.LeaveVoice);
            end;
        end;
    end);
    v147.coreVoiceManager:subscribe("OnPlayerMuted", function() --[[ Line: 535 ]]
        -- upvalues: v147 (copy)
        v147:UpdateAudioDeviceInputDebugger();
    end);
    v147.coreVoiceManager:subscribe("OnAudioDeviceInputAdded", function() --[[ Line: 538 ]]
        -- upvalues: v147 (copy)
        v147:UpdateAudioDeviceInputDebugger();
    end);
    v147.coreVoiceManager:subscribe("OnVoiceChatServiceInitialized", function() --[[ Line: 542 ]]
        -- upvalues: v147 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (ref), v99 (ref), v45 (ref), v17 (ref), v41 (ref), l_AppStorageService_0 (ref), v76 (ref), v79 (ref)
        v147:ShowVoiceUI();
        if l_GetFFlagEnableSeamlessVoiceV2_0() and v147:IsSeamlessVoice() then
            v99.Events.ShowLikelySpeakingBubblesChanged(false);
        end;
        if v45 then
            v17:debug("Simulating join voice");
            v147:simulateVoiceConnectDisconnect();
        end;
        if v41() and not v147.coreVoiceManager.initializedPostSuspension then
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 553 ]]
                -- upvalues: l_AppStorageService_0 (ref), v76 (ref)
                return l_AppStorageService_0:GetItem(v76.VOICE_WITH_TC_TOAST_KEY) == "true";
            end);
            if not (not l_status_1 or l_result_1) then
                v147:showPrompt(v79.UpdateOnAutoJoinToast);
                pcall(function() --[[ Line: 560 ]]
                    -- upvalues: l_AppStorageService_0 (ref), v76 (ref)
                    l_AppStorageService_0:SetItem(v76.VOICE_WITH_TC_TOAST_KEY, "true");
                    l_AppStorageService_0:Flush();
                end);
            end;
        end;
    end);
    v147.coreVoiceManager:subscribe("OnAudioDeviceInputRemoved", function() --[[ Line: 568 ]]
        -- upvalues: v147 (copy)
        v147:UpdateAudioDeviceInputDebugger();
    end);
    v147.coreVoiceManager:subscribe("OnInitialJoinFailed", function() --[[ Line: 571 ]]
        -- upvalues: v147 (copy)
        v147:InitialJoinFailedPrompt();
    end);
    v147.coreVoiceManager:subscribe("OnPlayerModerated", function() --[[ Line: 574 ]]
        -- upvalues: v147 (copy)
        v147:ShowPlayerModeratedMessage();
    end);
    v147.coreVoiceManager:subscribe("OnRetryRequested", function() --[[ Line: 578 ]]
        -- upvalues: v147 (copy), v79 (ref)
        v147:showPrompt(v79.Retry);
    end);
    v147.coreVoiceManager:subscribe("OnVoiceToxicityModal", function() --[[ Line: 581 ]]
        -- upvalues: v17 (ref), v147 (copy), v79 (ref)
        v17:debug("Showing Voice Toxicity Modal");
        v147:showPrompt(v79.VoiceToxicityModal);
    end);
    v147.coreVoiceManager:subscribe("OnVoiceToxicityToast", function() --[[ Line: 585 ]]
        -- upvalues: v17 (ref), v147 (copy), v79 (ref)
        v17:debug("Showing Voice Toxicity Toast");
        v147:showPrompt(v79.VoiceToxicityToast);
    end);
    v147.coreVoiceManager:subscribe("OnPermissionRequested", function() --[[ Line: 589 ]]
        -- upvalues: l_GetFFlagShowDevicePermissionsModal_0 (ref), v147 (copy), v79 (ref)
        if l_GetFFlagShowDevicePermissionsModal_0() then
            v147:showPrompt(v79.DevicePermissionsModal);
            return;
        else
            v147:showPrompt(v79.Permission);
            return;
        end;
    end);
    v147.coreVoiceManager:subscribe("OnShowDataConsentToast", function() --[[ Line: 596 ]]
        -- upvalues: v33 (ref), v147 (copy)
        if v33() then
            v147:showDataConsentToast();
        end;
    end);
    v147.coreVoiceManager:subscribe("OnVoiceReverseNudgeIconColorChange", function(v172) --[[ Line: 601 ]]
        -- upvalues: v17 (ref), v99 (ref), v147 (copy)
        v17:debug("Showing Reverse Nudge Icon Color Change");
        if v99.Events.AddReverseNudgeToxicUser and v99.Events.RemoveReverseNudgeToxicUser then
            v147:AddReverseNudgeToxicUser(v172.toxicUserId, v99.Events.AddReverseNudgeToxicUser, v99.Events.RemoveReverseNudgeToxicUser);
        end;
    end);
    v147.coreVoiceManager.setVoiceUIVisibility.Event:Connect(function(v173) --[[ Line: 611 ]]
        -- upvalues: v147 (copy)
        if v173 then
            v147:ShowVoiceUI();
            return;
        else
            v147:HideVoiceUI();
            return;
        end;
    end);
    v147.coreVoiceManager:subscribe("OnVoiceJoin", function() --[[ Line: 618 ]]
        -- upvalues: l_GetFFlagNonVoiceFTUX_0 (ref), v147 (copy), v41 (ref), v23 (ref), v79 (ref), l_GetFFlagEnableSeamlessVoiceV2_0 (ref), v99 (ref), v50 (ref), l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0 (ref), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (ref), l_default_1 (ref), v152 (ref), v153 (copy)
        if l_GetFFlagNonVoiceFTUX_0() and v147.hasLeftFTUX then
            v147.hasLeftFTUX = false;
            if v41() then
                v147:showJoinVoicePrompt();
            elseif v23() then
                v147:showPrompt(v79.UnifiedJoinVoiceToast);
            else
                v147:showPrompt(v79.JoinedVoiceToast);
            end;
            v147.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxLeaveEvent", v147:GetConnectDisconnectAnalyticsData());
        elseif l_GetFFlagEnableSeamlessVoiceV2_0() and v147:IsSeamlessVoice() then
            v99.Events.ShowLikelySpeakingBubblesChanged(false);
            if v41() then
                v147:showJoinVoicePrompt();
            elseif v23() then
                v147:showPrompt(v79.UnifiedJoinVoiceToast);
            elseif v50 and v147.isInitialJoin then
                v147:showPrompt(v79.JoinedVoiceToast);
            else
                v147:showPrompt(v79.JoinVoice);
            end;
            v147:SetVoiceConnectCookieValue(true);
        else
            v147:showPrompt(v79.VoiceConsentAcceptedToast);
        end;
        if l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0() and v147.CaptureService:IsCapturingVideo() then
            if l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() then
                l_default_1:MuteAll("Capture");
                v147:HideVoiceUI();
            else
                v147:MuteAll(true, "Capture");
                v147:HideVoiceUI();
            end;
        end;
        if v152 then
            v147.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", v147:GetConnectDisconnectAnalyticsData());
            v153:Disconnect();
        end;
    end);
    return v147;
end;
local function _(v174) --[[ Line: 670 ]] --[[ Name: shorten ]]
    return "..." .. string.sub(tostring(v174), -4);
end;
local function _(v176, v177) --[[ Line: 674 ]] --[[ Name: bind ]]
    return function(...) --[[ Line: 675 ]]
        -- upvalues: v176 (copy), v177 (copy)
        return v176[v177](v176, ...);
    end;
end;
v122.subscribe = function(v179, v180, v181) --[[ Line: 680 ]] --[[ Name: subscribe ]]
    return v179.coreVoiceManager:subscribe(v180, v181);
end;
v122._reportJoinFailed = function(v182, v183, v184) --[[ Line: 684 ]] --[[ Name: _reportJoinFailed ]]
    return v182.coreVoiceManager:_reportJoinFailed(v183, v184);
end;
v122._asyncInit = function(v185) --[[ Line: 688 ]] --[[ Name: _asyncInit ]]
    return v185.coreVoiceManager:_asyncInit();
end;
v122.asyncInit = function(v186) --[[ Line: 692 ]] --[[ Name: asyncInit ]]
    return v186.coreVoiceManager:asyncInit();
end;
v122.CheckAudioInputExists = function(v187) --[[ Line: 696 ]] --[[ Name: CheckAudioInputExists ]]
    return v187.coreVoiceManager:CheckAudioInputExists();
end;
v122.getService = function(v188) --[[ Line: 700 ]] --[[ Name: getService ]]
    return v188.service;
end;
v122.GetMutedAnyone = function(v189) --[[ Line: 704 ]] --[[ Name: GetMutedAnyone ]]
    return v189.coreVoiceManager:GetMutedAnyone();
end;
v122.GetRequest = function(v190, v191, v192) --[[ Line: 708 ]] --[[ Name: GetRequest ]]
    return v190.coreVoiceManager:GetRequest(v191, v192);
end;
v122.PostRequest = function(v193, v194, _, v196) --[[ Line: 712 ]] --[[ Name: PostRequest ]]
    -- upvalues: l_HttpService_0 (copy)
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 713 ]]
        -- upvalues: v193 (copy), v194 (copy), v196 (copy), l_HttpService_0 (ref)
        local v197 = v193.HttpRbxApiService:PostAsyncFullUrl(v194, v196, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson, Enum.HttpRequestType.Players);
        return l_HttpService_0:JSONDecode(v197);
    end);
    return l_status_2 and l_result_2;
end;
v122._GetShowAgeVerificationOverlay = function(v200, v201) --[[ Line: 734 ]] --[[ Name: _GetShowAgeVerificationOverlay ]]
    return v200.coreVoiceManager:_GetShowAgeVerificationOverlay(v201);
end;
v122.simulateVoiceConnectDisconnect = function(v202) --[[ Line: 738 ]] --[[ Name: simulateVoiceConnectDisconnect ]]
    -- upvalues: v49 (copy), v17 (copy)
    task.spawn(function() --[[ Line: 739 ]]
        -- upvalues: v49 (ref), v202 (copy), v17 (ref)
        while true do
            task.wait(v49);
            if v202.voiceUIVisible then
                v17:debug("Hiding Voice");
                v202:HideVoiceUI();
            else
                v17:debug("Showing Voice");
                v202:ShowVoiceUI();
            end;
        end;
    end);
end;
v122.FetchAgeVerificationOverlay = function(v203, v204) --[[ Line: 753 ]] --[[ Name: FetchAgeVerificationOverlay ]]
    return v203.coreVoiceManager:FetchAgeVerificationOverlay(v204);
end;
v122.FetchPhoneVerificationUpsell = function(v205, v206, v207, v208) --[[ Line: 757 ]] --[[ Name: FetchPhoneVerificationUpsell ]]
    return v205.coreVoiceManager:FetchPhoneVerificationUpsell(v206, v207, v208);
end;
v122.RecordUserSeenModal = function(v209, v210) --[[ Line: 765 ]] --[[ Name: RecordUserSeenModal ]]
    -- upvalues: l_PostRecordUserSeenGeneralModal_0 (copy)
    local l_l_PostRecordUserSeenGeneralModal_0_0 = l_PostRecordUserSeenGeneralModal_0;
    local v212 = "PostRequest";
    return l_l_PostRecordUserSeenGeneralModal_0_0(function(...) --[[ Line: 675 ]]
        -- upvalues: v209 (copy), v212 (copy)
        return v209[v212](v209, ...);
    end, v210);
end;
v122.checkAndUpdateSequence = function(v213, v214, v215) --[[ Line: 769 ]] --[[ Name: checkAndUpdateSequence ]]
    return v213.coreVoiceManager:checkAndUpdateSequence(v214, v215);
end;
v122.onMissedSequence = function(v216, v217) --[[ Line: 773 ]] --[[ Name: onMissedSequence ]]
    return v216.coreVoiceManager:onMissedSequence(v217);
end;
v122.watchSignalR = function(v218) --[[ Line: 777 ]] --[[ Name: watchSignalR ]]
    return v218.coreVoiceManager:watchSignalR();
end;
v122.voicePermissionGranted = function(v219, v220) --[[ Line: 785 ]] --[[ Name: voicePermissionGranted ]]
    return v219.coreVoiceManager:voicePermissionGranted(v220);
end;
v122.GetSignalREvent = function(v221, v222) --[[ Line: 789 ]] --[[ Name: GetSignalREvent ]]
    return v221.coreVoiceManager:GetSignalREvent(v222);
end;
v122.avatarChatUserAndPlaceSettingsValueOfClientFeatures = function(v223, v224) --[[ Line: 794 ]] --[[ Name: avatarChatUserAndPlaceSettingsValueOfClientFeatures ]]
    return v223.coreVoiceManager:avatarChatUserAndPlaceSettingsValueOfClientFeatures(v224);
end;
v122.resolveAvatarChatUserAndPlaceSettings = function(v225) --[[ Line: 798 ]] --[[ Name: resolveAvatarChatUserAndPlaceSettings ]]
    return v225.coreVoiceManager:resolveAvatarChatUserAndPlaceSettings();
end;
v122.EnableVoice = function(v226) --[[ Line: 802 ]] --[[ Name: EnableVoice ]]
    return v226.coreVoiceManager:EnableVoice();
end;
v122._VoiceChatFirstTimeUX = function(v227, v228) --[[ Line: 806 ]] --[[ Name: _VoiceChatFirstTimeUX ]]
    -- upvalues: v76 (copy), v17 (copy), l_GetFFlagNonVoiceFTUX_0 (copy), v99 (copy), l_GetFFlagEnableFtuxExitOnMuteToggle_0 (copy), v61 (copy), v47 (copy), v79 (copy)
    local v229 = nil;
    local v230 = nil;
    if not pcall(function() --[[ Line: 808 ]]
        -- upvalues: v228 (copy), v76 (ref), v229 (ref), v230 (ref)
        local l_v228_Item_0 = v228:GetItem(v76.SEAMLESS_VOICE_FTUX_KEY);
        local l_v228_Item_1 = v228:GetItem(v76.SEAMLESS_VOICE_STUX_KEY);
        v229 = l_v228_Item_0 == "true";
        v230 = l_v228_Item_1 == nil and 0 or tonumber(l_v228_Item_1);
    end) then
        v17:warning("Failed to read FTUX/STUX from AppStorage");
        return;
    else
        v17:trace("hasShownFTUX: {}. STUXCount: {}", v229, v230);
        if not v229 then
            v17:debug("Showing FTUX");
            v227.isShowingFTUX = true;
            v227.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxJoinEvent", v227:GetConnectDisconnectAnalyticsData());
            if l_GetFFlagNonVoiceFTUX_0() then
                v99.Events.VoiceUIVisibilityChanged(true);
            else
                v227:MuteAll(true, "FTUX");
                if v99.Events.ShowLikelySpeakingBubblesChanged and v99.Events.LikelySpeakingUsersUpdated then
                    v17:debug("Showing likely speaking bubbles");
                    local v233 = {};
                    v99.Events.ShowLikelySpeakingBubblesChanged(true);
                    local v234 = v227.participants or {};
                    for v235 in v234 do
                        v233[v235] = true;
                    end;
                    v99.Events.LikelySpeakingUsersUpdated(v233);
                    v234 = v227.participantJoined.Event:Connect(function(v236) --[[ Line: 845 ]]
                        -- upvalues: v233 (copy), v99 (ref)
                        v233[v236] = true;
                        v99.Events.LikelySpeakingUsersUpdated(v233);
                    end);
                    v227.hideFTUXSignal.Event:Connect(function() --[[ Line: 849 ]]
                        -- upvalues: v234 (copy), v99 (ref)
                        v234:Disconnect();
                        v99.Events.ShowLikelySpeakingBubblesChanged(false);
                        v99.Events.LikelySpeakingUsersUpdated({});
                    end);
                    v227.hideVoiceUI.Event:Once(function() --[[ Line: 854 ]]
                        -- upvalues: v99 (ref)
                        v99.Events.ShowLikelySpeakingBubblesChanged(false);
                        v99.Events.LikelySpeakingUsersUpdated({});
                    end);
                    v227.muteAllChanged.Event:Once(function() --[[ Line: 858 ]]
                        -- upvalues: v227 (copy), v228 (copy)
                        v227:HideFTUX(v228);
                        v227.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxLeaveEvent", v227:GetConnectDisconnectAnalyticsData());
                    end);
                    v227.talkingChanged.Event:Once(function() --[[ Line: 865 ]]
                        -- upvalues: v227 (copy), v228 (copy)
                        v227:HideFTUX(v228);
                    end);
                    if l_GetFFlagEnableFtuxExitOnMuteToggle_0() then
                        v227.coreVoiceManager.onPlayerMuteToggled.Event:Once(function() --[[ Line: 869 ]]
                            -- upvalues: v227 (copy), v228 (copy)
                            v227:HideFTUX(v228);
                        end);
                    end;
                end;
            end;
        elseif v230 < v61 and (not v47 or v227:GetVoiceConnectCookieValue()) then
            v17:debug("Showing STUX");
            v227:showPrompt(v79.JoinVoiceSTUX);
            pcall(function() --[[ Line: 881 ]]
                -- upvalues: v228 (copy), v76 (ref), v230 (ref)
                v228:SetItem(v76.SEAMLESS_VOICE_STUX_KEY, (tostring(v230 + 1)));
                v228:Flush();
            end);
        end;
        return;
    end;
end;
v122.VoiceChatFirstTimeUX = function(v237, v238) --[[ Line: 888 ]] --[[ Name: VoiceChatFirstTimeUX ]]
    -- upvalues: v47 (copy), v17 (copy), v46 (copy), v66 (copy), v76 (copy), l_GetFFlagNonVoiceFTUX_0 (copy)
    if v47 and not v237:verifyUniverseAndPlaceCanUseVoice() then
        v17:debug("Universe/place is not voice enabled, do not run FTUX/STUX");
        return;
    else
        if not v46 then
            local v239 = v237:FetchAgeVerificationOverlay();
            if v66 then
                if type(v239) == "table" and v239.voiceSettings and v239.voiceSettings.seamlessVoiceStatus ~= v76.SEAMLESS_VOICE_STATUS_ENABLED_NEW_USER then
                    v17:debug("User not eligible for FTUX/STUX");
                    return;
                end;
            elseif v239.voiceSettings and v239.voiceSettings.seamlessVoiceStatus ~= v76.SEAMLESS_VOICE_STATUS_ENABLED_NEW_USER then
                v17:debug("User not eligible for FTUX/STUX");
                return;
            end;
        end;
        local function _() --[[ Line: 919 ]] --[[ Name: startFTUX ]]
            -- upvalues: v17 (ref), v237 (copy), v238 (copy)
            v17:debug("Starting FTUX");
            v237:_VoiceChatFirstTimeUX(v238);
        end;
        if l_GetFFlagNonVoiceFTUX_0() then
            v17:debug("Starting FTUX");
            v237:_VoiceChatFirstTimeUX(v238);
            return;
        else
            v237:asyncInit():andThen(function() --[[ Line: 927 ]]
                -- upvalues: v237 (copy), v17 (ref), v238 (copy)
                local v241 = nil;
                if v237.service.VoiceChatState and v237.service.VoiceChatState == Enum.VoiceChatState.Joined then
                    v17:debug("Starting FTUX");
                    v237:_VoiceChatFirstTimeUX(v238);
                end;
                v241 = v237.service.StateChanged:Connect(function(_, v243) --[[ Line: 935 ]]
                    -- upvalues: v17 (ref), v237 (ref), v238 (ref), v241 (ref)
                    if v243 == Enum.VoiceChatState.Joined then
                        v17:debug("Starting FTUX");
                        v237:_VoiceChatFirstTimeUX(v238);
                        v241:Disconnect();
                    end;
                end);
            end):catch(function(v244) --[[ Line: 942 ]]
                -- upvalues: v17 (ref)
                v17:trace("Failed to start FTUX: {}", v244);
            end);
            return;
        end;
    end;
end;
v122.HideFTUX = function(v245, v246) --[[ Line: 948 ]] --[[ Name: HideFTUX ]]
    -- upvalues: v76 (copy), l_GetFFlagNonVoiceFTUX_0 (copy), v79 (copy)
    v245.isShowingFTUX = false;
    v245.hideFTUXSignal:Fire();
    pcall(function() --[[ Line: 951 ]]
        -- upvalues: v246 (copy), v76 (ref)
        v246:SetItem(v76.SEAMLESS_VOICE_FTUX_KEY, "true");
        v246:Flush();
    end);
    if l_GetFFlagNonVoiceFTUX_0() then
        v245.hasLeftFTUX = true;
        v245.attemptVoiceRejoin:Fire();
    end;
    if not l_GetFFlagNonVoiceFTUX_0() then
        v245:MuteAll(false, "FTUX");
        v245:showPrompt(v79.JoinedVoiceToast);
    end;
end;
v122._onUserAndPlaceCanUseVoiceResolved = function(v247, v248, v249) --[[ Line: 965 ]] --[[ Name: _onUserAndPlaceCanUseVoiceResolved ]]
    -- upvalues: l_GetInformedOfBan_0 (copy), l_GetFFlagAvatarChatServiceEnabled_0 (copy), l_GetFFlagVoiceChatServiceManagerUseAvatarChat_0 (copy), v79 (copy), l_BAN_REASON_0 (copy), v25 (copy)
    v247.bannedUntil = nil;
    if v248 and v248.isBanned then
        local l_l_GetInformedOfBan_0_0 = l_GetInformedOfBan_0;
        local v251 = "GetRequest";
        l_l_GetInformedOfBan_0_0 = l_l_GetInformedOfBan_0_0(function(...) --[[ Line: 675 ]]
            -- upvalues: v247 (copy), v251 (copy)
            return v247[v251](v247, ...);
        end);
        if l_l_GetInformedOfBan_0_0 and not l_l_GetInformedOfBan_0_0.informedOfBan then
            if l_GetFFlagAvatarChatServiceEnabled_0() and l_GetFFlagVoiceChatServiceManagerUseAvatarChat_0() and v248.bannedUntil == nil then
                v247:ShowPlayerModeratedMessage();
            elseif v248.bannedUntil == nil then
                v247:showPrompt(v79.VoiceChatSuspendedPermanent);
            else
                v247.bannedUntil = v248.bannedUntil;
                if v248.banReason == l_BAN_REASON_0.NUDGE_V3 then
                    v247:showPrompt(v79.VoiceChatSuspendedTemporaryB);
                else
                    v247:showPrompt(v79.VoiceChatSuspendedTemporary);
                end;
            end;
        end;
        if l_l_GetInformedOfBan_0_0 and l_l_GetInformedOfBan_0_0.informedOfBan then
            v247:ShowPlayerModeratedMessage(true);
            return;
        end;
    elseif v247.runService:IsStudio() and v248 and not v248.isVoiceEnabled then
        v247:showPrompt(v79.User);
        return;
    elseif v247.runService:IsStudio() and v249 and not v249.isPlaceEnabledForVoice then
        v247:showPrompt(v79.Place, v25() and table.concat(v249.reasons or {}, "") or nil);
    end;
end;
v122.ChangeVoiceJoinProgress = function(v252, v253) --[[ Line: 1009 ]] --[[ Name: ChangeVoiceJoinProgress ]]
    return v252.coreVoiceManager:ChangeVoiceJoinProgress(v253);
end;
v122.GetVoiceJoinProgress = function(v254) --[[ Line: 1013 ]] --[[ Name: GetVoiceJoinProgress ]]
    return v254.coreVoiceManager.VoiceJoinProgress;
end;
v122.UserOnlyEligibleForVoice = function(v255) --[[ Line: 1017 ]] --[[ Name: UserOnlyEligibleForVoice ]]
    return v255.coreVoiceManager:UserOnlyEligibleForVoice();
end;
v122.UserOnlyEligibleForVoiceViaOverlay = function(v256) --[[ Line: 1021 ]] --[[ Name: UserOnlyEligibleForVoiceViaOverlay ]]
    return v256.coreVoiceManager:UserOnlyEligibleForVoiceViaOverlay();
end;
v122.UserVoiceEnabled = function(v257) --[[ Line: 1025 ]] --[[ Name: UserVoiceEnabled ]]
    return v257.coreVoiceManager:UserVoiceEnabled();
end;
v122.UserInInExperienceUpsellTreatment = function(v258) --[[ Line: 1029 ]] --[[ Name: UserInInExperienceUpsellTreatment ]]
    return v258.coreVoiceManager:UserInInExperienceUpsellTreatment();
end;
v122.UserEligibleForInExperienceUpsell = function(v259) --[[ Line: 1033 ]] --[[ Name: UserEligibleForInExperienceUpsell ]]
    return v259.coreVoiceManager:UserEligibleForInExperienceUpsell();
end;
v122.UserEligibleForLikelySpeakingBubbles = function(v260) --[[ Line: 1037 ]] --[[ Name: UserEligibleForLikelySpeakingBubbles ]]
    return v260.coreVoiceManager:UserEligibleForLikelySpeakingBubbles();
end;
v122.ShowInExperienceVoiceUpsell = function(v261, v262) --[[ Line: 1041 ]] --[[ Name: ShowInExperienceVoiceUpsell ]]
    local l_showVoiceInExperienceUpsellVariant_0 = v261:FetchAgeVerificationOverlay().showVoiceInExperienceUpsellVariant;
    v261:SetInExpUpsellEntrypoint(v262);
    v261:showPrompt((v261:GetInExpUpsellPromptFromEnum(l_showVoiceInExperienceUpsellVariant_0)));
end;
v122.ShowInExperiencePhoneVoiceUpsell = function(v264, v265, v266) --[[ Line: 1051 ]] --[[ Name: ShowInExperiencePhoneVoiceUpsell ]]
    -- upvalues: v102 (copy), l_GetFFlagInExperiencePhoneUpsellNewCopy_0 (copy), l_GetFFlagShowLikelySpeakingBubbles_0 (copy), v99 (copy), v103 (copy), v76 (copy), v79 (copy)
    v264:SetInExpUpsellEntrypoint(v265);
    v102.openPhoneUpsell({
        origin = "inExperience", 
        eventContext = "verificationUpsell", 
        entryConfig = {
            titleKey = "Feature.VerificationUpsell.Heading.UnlockVoiceChat", 
            descriptionKey = "Feature.VerificationUpsell.Description.UnlockVoiceChatBody", 
            buttonKey = l_GetFFlagInExperiencePhoneUpsellNewCopy_0() and "Feature.AccountSettings.Action.Verify" or "Feature.VerificationUpsell.Action.AddPhoneNumber", 
            extraButtonConfig = {
                extraButtonKey = "Feature.VerificationUpsell.Action.NotNow"
            }, 
            legalTextKey = "Feature.VerificationUpsell.Description.VoiceLegalDisclaimer2"
        }, 
        onSuccessBeforeToast = function() --[[ Line: 1068 ]] --[[ Name: onSuccessBeforeToast ]]
            -- upvalues: v264 (copy), l_GetFFlagShowLikelySpeakingBubbles_0 (ref), v99 (ref), v103 (ref), v266 (copy)
            v264.coreVoiceManager:DisablePhoneVerificationUpsell();
            if l_GetFFlagShowLikelySpeakingBubbles_0() and v99.Events.ShowLikelySpeakingBubblesChanged then
                v99.Events.ShowLikelySpeakingBubblesChanged(false);
            end;
            local l_v103_0 = v103;
            local l_v264_0 = v264;
            local v269 = "PostRequest";
            l_v103_0(function(...) --[[ Line: 675 ]]
                -- upvalues: l_v264_0 (copy), v269 (copy)
                return l_v264_0[v269](l_v264_0, ...);
            end, v266, os.time(), false);
        end, 
        onSuccess = function() --[[ Line: 1075 ]] --[[ Name: onSuccess ]]
            -- upvalues: v264 (copy)
            v264:EnableVoice();
        end, 
        closeUpsell = function() --[[ Line: 1078 ]] --[[ Name: closeUpsell ]]
            -- upvalues: l_GetFFlagShowLikelySpeakingBubbles_0 (ref), v99 (ref), v265 (copy), v76 (ref), v264 (copy), v79 (ref), v103 (ref), v266 (copy)
            if l_GetFFlagShowLikelySpeakingBubbles_0() and v99.Events.ShowLikelySpeakingBubblesChanged then
                v99.Events.ShowLikelySpeakingBubblesChanged(false);
            end;
            if v265 ~= v76.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
                v264:showPrompt(v79.VoiceConsentDeclinedToast);
            end;
            local l_v103_1 = v103;
            local l_v264_1 = v264;
            local v272 = "PostRequest";
            l_v103_1(function(...) --[[ Line: 675 ]]
                -- upvalues: l_v264_1 (copy), v272 (copy)
                return l_v264_1[v272](l_v264_1, ...);
            end, v266, os.time(), true);
        end
    });
end;
v122.DisablePhoneVerificationUpsell = function(v273) --[[ Line: 1090 ]] --[[ Name: DisablePhoneVerificationUpsell ]]
    v273.coreVoiceManager:DisablePhoneVerificationUpsell();
end;
v122.SetInExpUpsellEntrypoint = function(v274, v275) --[[ Line: 1094 ]] --[[ Name: SetInExpUpsellEntrypoint ]]
    v274.inExpUpsellEntrypoint = v275;
end;
v122.userAndPlaceCanUseVoice = function(v276) --[[ Line: 1098 ]] --[[ Name: userAndPlaceCanUseVoice ]]
    return v276.coreVoiceManager:userAndPlaceCanUseVoice();
end;
v122.verifyUniverseAndPlaceCanUseVoice = function(v277) --[[ Line: 1102 ]] --[[ Name: verifyUniverseAndPlaceCanUseVoice ]]
    return v277.coreVoiceManager:verifyUniverseAndPlaceCanUseVoice();
end;
v122.GetVoiceConnectCookieValue = function(v278) --[[ Line: 1106 ]] --[[ Name: GetVoiceConnectCookieValue ]]
    return v278.coreVoiceManager:GetVoiceConnectCookieValue();
end;
v122.GetVoiceConnectCookie = function(v279) --[[ Line: 1110 ]] --[[ Name: GetVoiceConnectCookie ]]
    return v279.coreVoiceManager:GetVoiceConnectCookie();
end;
v122.SetVoiceConnectCookieValue = function(v280, v281) --[[ Line: 1114 ]] --[[ Name: SetVoiceConnectCookieValue ]]
    return v280.coreVoiceManager:SetVoiceConnectCookieValue(v281);
end;
v122.SetNewUserFTUXCookieValue = function(v282, v283) --[[ Line: 1118 ]] --[[ Name: SetNewUserFTUXCookieValue ]]
    return v282.coreVoiceManager:SetNewUserFTUXCookieValue(v283);
end;
v122.ShowPlayerModeratedMessage = function(v284, v285) --[[ Line: 1122 ]] --[[ Name: ShowPlayerModeratedMessage ]]
    -- upvalues: l_GetUserSettings_0 (copy), l_Analytics_0 (copy), v79 (copy), l_BAN_REASON_0 (copy)
    local l_l_GetUserSettings_0_0 = l_GetUserSettings_0;
    local v287 = "GetRequest";
    l_l_GetUserSettings_0_0 = l_l_GetUserSettings_0_0(function(...) --[[ Line: 675 ]]
        -- upvalues: v284 (copy), v287 (copy)
        return v284[v287](v284, ...);
    end);
    if not l_l_GetUserSettings_0_0 or not l_l_GetUserSettings_0_0.isBanned then
        v284:_reportJoinFailed("PlayerModeratedBadState", l_Analytics_0.ERROR);
        return;
    else
        v284.banReason = l_l_GetUserSettings_0_0.banReason;
        if l_l_GetUserSettings_0_0.bannedUntil == nil then
            v284:showPrompt(v79.VoiceChatSuspendedPermanent);
            return;
        else
            v284.bannedUntil = l_l_GetUserSettings_0_0.bannedUntil;
            if v285 then
                v284:showPrompt(v79.VoiceChatSuspendedTemporaryToast);
                return;
            elseif v284.banReason == l_BAN_REASON_0.NUDGE_V3 then
                v284:showPrompt(v79.VoiceChatSuspendedTemporaryB);
                return;
            else
                v284:showPrompt(v79.VoiceChatSuspendedTemporary);
                return;
            end;
        end;
    end;
end;
v122.CheckCallState = function(v288) --[[ Line: 1147 ]] --[[ Name: CheckCallState ]]
    return v288.coreVoiceManager:CheckCallState();
end;
v122.ShowVoiceChatLoadingMessage = function(v289) --[[ Line: 1151 ]] --[[ Name: ShowVoiceChatLoadingMessage ]]
    -- upvalues: v79 (copy)
    v289:showPrompt(v79.VoiceLoading);
end;
v122.requestMicPermission = function(v290) --[[ Line: 1155 ]] --[[ Name: requestMicPermission ]]
    return v290.coreVoiceManager:requestMicPermission();
end;
v122.canUseServiceAsync = function(v291) --[[ Line: 1159 ]] --[[ Name: canUseServiceAsync ]]
    return v291.coreVoiceManager:canUseServiceAsync();
end;
v122.canUseService = function(v292) --[[ Line: 1164 ]] --[[ Name: canUseService ]]
    -- upvalues: l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy), l_VOICE_CHAT_AVAILABILITY_0 (copy)
    if v292.available ~= nil or not game:GetEngineFeature("VoiceChatSupported") then
        return false;
    else
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 1168 ]]
            -- upvalues: l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref)
            local l_l_HttpRbxApiService_0_AsyncFullUrl_0 = l_HttpRbxApiService_0:GetAsyncFullUrl("https://voice.roblox.com/v1/settings", Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players);
            return l_HttpService_0:JSONDecode(l_l_HttpRbxApiService_0_AsyncFullUrl_0);
        end);
        local v296 = l_status_3 and l_result_3.isVoiceEnabled;
        if not v296 then
            v292.available = l_VOICE_CHAT_AVAILABILITY_0.UserNotAvailable;
        end;
        return v296;
    end;
end;
v122.ensureInitialized = function(v297, v298) --[[ Line: 1184 ]] --[[ Name: ensureInitialized ]]
    return v297.coreVoiceManager:ensureInitialized(v298);
end;
v122.GetSessionId = function(v299) --[[ Line: 1189 ]] --[[ Name: GetSessionId ]]
    return v299.coreVoiceManager:GetSessionId();
end;
v122.GetChannelId = function(v300) --[[ Line: 1193 ]] --[[ Name: GetChannelId ]]
    return v300.coreVoiceManager:GetChannelId();
end;
v122.JoinWithVoiceMuteData = function(v301, v302) --[[ Line: 1197 ]] --[[ Name: JoinWithVoiceMuteData ]]
    return v301.coreVoiceManager:JoinWithVoiceMuteData(v302);
end;
v122.calculateBanDuration = function(_, v304, v305) --[[ Line: 1201 ]] --[[ Name: calculateBanDuration ]]
    return (math.ceil((v305 - v304) / 60));
end;
v122.ShowVoiceUI = function(v306) --[[ Line: 1205 ]] --[[ Name: ShowVoiceUI ]]
    -- upvalues: v99 (copy)
    v306.voiceUIVisible = true;
    v306.showVoiceUI:Fire();
    if v99.Events.VoiceUIVisibilityChanged then
        v99.Events.VoiceUIVisibilityChanged(true);
    end;
end;
v122.HideVoiceUI = function(v307) --[[ Line: 1214 ]] --[[ Name: HideVoiceUI ]]
    -- upvalues: v99 (copy)
    v307.voiceUIVisible = false;
    v307.hideVoiceUI:Fire();
    if v99.Events.VoiceUIVisibilityChanged then
        v99.Events.VoiceUIVisibilityChanged(false);
    end;
end;
v122.createPromptInstance = function(v308, v309, v310) --[[ Line: 1223 ]] --[[ Name: createPromptInstance ]]
    -- upvalues: v25 (copy), v79 (copy), l_LocalizationService_0 (copy), l_GetFFlagShowDevicePermissionsModal_0 (copy), l_FFlagEnableRetryForLinkingProtocolFetch_0 (copy), l_FIntLinkingProtocolFetchRetries_0 (copy), l_default_2 (copy), l_SettingsRoute_0 (copy), l_FIntLinkingProtocolFetchTimeoutMS_0 (copy), v4 (copy), v77 (copy), l_Analytics_0 (copy), l_PostInformedOfBan_0 (copy), v76 (copy), l_GetFFlagShowLikelySpeakingBubbles_0 (copy), v99 (copy), v51 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), v17 (copy), v42 (copy), l_CoreGui_0 (copy)
    if v308.promptSignal then
        v308.promptSignal:Destroy();
        v308.promptSignal = nil;
    end;
    v308.promptSignal = Instance.new("BindableEvent");
    local v311 = nil;
    if v25() then
        v311 = v308.errorText;
    end;
    local v312 = v310 == v79.VoiceChatSuspendedTemporaryB;
    local v313 = "";
    if v308.bannedUntil ~= nil then
        v313 = if v312 then tostring((v308:calculateBanDuration(DateTime.now().UnixTimestamp, v308.bannedUntil.Seconds))) else DateTime.fromUnixTimestamp(v308.bannedUntil.Seconds):FormatLocalTime("l LT", l_LocalizationService_0.RobloxLocaleId);
    end;
    local v314 = true;
    if v310 ~= v79.VoiceToxicityModal then
        v314 = v310 == v79.VoiceToxicityToast;
    end;
    local v315 = true;
    if v310 ~= v79.VoiceConsentModalV1 then
        v315 = true;
        if v310 ~= v79.VoiceConsentModalV2 then
            v315 = v310 == v79.VoiceConsentModalV3;
        end;
    end;
    local v316 = false;
    local v317 = nil;
    if l_GetFFlagShowDevicePermissionsModal_0() and v310 == v79.DevicePermissionsModal and v308.settingsAppAvailable == nil then
        if l_FFlagEnableRetryForLinkingProtocolFetch_0 then
            for _ = 0, l_FIntLinkingProtocolFetchRetries_0 do
                local v321 = task.spawn(function() --[[ Line: 1268 ]]
                    -- upvalues: v316 (ref), v317 (ref), l_default_2 (ref), l_SettingsRoute_0 (ref)
                    local v319, v320 = l_default_2:supportsSwitchToSettingsApp(l_SettingsRoute_0.Microphone):await();
                    v316 = v319;
                    v317 = v320;
                end);
                task.wait(l_FIntLinkingProtocolFetchTimeoutMS_0 / 1000);
                task.cancel(v321);
                if v317 ~= nil then
                    break;
                end;
            end;
        else
            local v322, v323 = l_default_2:supportsSwitchToSettingsApp(l_SettingsRoute_0.Microphone):await();
            v316 = v322;
            v317 = v323;
        end;
        v308.settingsAppAvailable = v316 and v317;
    end;
    v308.voiceChatPromptInstance = v4.mount(v4.createElement(v77, {
        Analytics = l_Analytics_0.new(), 
        promptSignal = v308.promptSignal.Event, 
        bannedUntil = v313, 
        policyMapper = v308.policyMapper, 
        errorText = v311, 
        onReadyForSignal = v309, 
        VoiceChatServiceManager = v308, 
        settingsAppAvailable = v308.settingsAppAvailable ~= nil and v308.settingsAppAvailable, 
        onContinueFunc = (not (v310 ~= v79.VoiceChatSuspendedTemporary) or v312) and function() --[[ Line: 1301 ]]
            -- upvalues: l_PostInformedOfBan_0 (ref), v308 (copy)
            local l_l_PostInformedOfBan_0_0 = l_PostInformedOfBan_0;
            local l_v308_0 = v308;
            local v326 = "PostRequest";
            l_l_PostInformedOfBan_0_0(function(...) --[[ Line: 675 ]]
                -- upvalues: l_v308_0 (copy), v326 (copy)
                return l_v308_0[v326](l_v308_0, ...);
            end, true);
        end or v314 and function() --[[ Line: 1304 ]]
            -- upvalues: v308 (copy)
            v308.Analytics:reportClosedNudge(v308:GetNudgeAnalyticsData());
        end or v315 and function() --[[ Line: 1307 ]]
            -- upvalues: v308 (copy), v76 (ref), l_GetFFlagShowLikelySpeakingBubbles_0 (ref), v99 (ref)
            v308:RecordUserSeenModal(v76.MODAL_IDS.IN_EXP_UPSELL);
            if l_GetFFlagShowLikelySpeakingBubbles_0() and v99.Events.ShowLikelySpeakingBubblesChanged then
                v99.Events.ShowLikelySpeakingBubblesChanged(false);
            end;
        end or nil, 
        onPrimaryActivated = v314 and function() --[[ Line: 1318 ]]
            -- upvalues: v308 (copy)
            v308.Analytics:reportAcknowledgedNudge(v308:GetNudgeAnalyticsData());
        end or not v51 and l_GetFFlagJoinWithoutMicPermissions_0() and v310 == v79.Permission and function() --[[ Line: 1325 ]]
            -- upvalues: l_default_2 (ref), v17 (ref)
            local v327 = l_default_2:supportsSwitchToSettingsApp():await();
            v17:debug("Settings app available: {}", v327);
            if v327 then
                v17:debug("Switching to settings app");
                l_default_2:switchToSettingsApp():andThen(function() --[[ Line: 1331 ]]
                    -- upvalues: v17 (ref)
                    v17:debug("Successfully switched to settings app");
                end):catch(function() --[[ Line: 1334 ]]
                    -- upvalues: v17 (ref)
                    v17:error("Error switching to settings app");
                end);
                return;
            else
                v17:debug("Current platform does not support switching to settings app");
                return;
            end;
        end or l_GetFFlagJoinWithoutMicPermissions_0() and l_GetFFlagShowDevicePermissionsModal_0() and v310 == v79.DevicePermissionsModal and function() --[[ Line: 1345 ]]
            -- upvalues: v17 (ref), v308 (copy), l_default_2 (ref), l_SettingsRoute_0 (ref)
            v17:debug("Settings app available: {}", v308.settingsAppAvailable);
            v308.Analytics:reportDevicePermissionsModalEvent(v308.settingsAppAvailable and "OpenedSettings" or "Acknowledged", v308:GetSessionId(), v308:GetInExpUpsellAnalyticsData());
            if v308.settingsAppAvailable then
                v17:debug("Switching to settings app");
                l_default_2:switchToSettingsApp(l_SettingsRoute_0.Microphone):andThen(function() --[[ Line: 1356 ]]
                    -- upvalues: v17 (ref)
                    v17:debug("Successfully switched to settings app");
                end):catch(function() --[[ Line: 1359 ]]
                    -- upvalues: v17 (ref)
                    v17:error("Error switching to settings app");
                end);
                return;
            else
                v17:debug("Current platform does not support switching to settings app");
                return;
            end;
        end or v312 and function() --[[ Line: 1366 ]]
            -- upvalues: v308 (copy)
            v308:reportBanMessage("Understood");
            v308.Analytics:reportBanMessageEvent("Understood");
        end or v315 and function() --[[ Line: 1370 ]]
            -- upvalues: v308 (copy)
            v308.Analytics:reportInExpConsent("accepted", v308.inExpUpsellEntrypoint, v308:GetInExpUpsellAnalyticsData());
            v308:EnableVoice();
        end or nil, 
        onSecondaryActivated = v310 == v79.VoiceToxicityModal and function() --[[ Line: 1380 ]]
            -- upvalues: v308 (copy), v42 (ref)
            v308:ShowVoiceToxicityFeedbackToast();
            if v42 then
                v308.Analytics:reportDeniedNudge(v308:GetNudgeAnalyticsData());
            end;
        end or v314 and function() --[[ Line: 1386 ]]
            -- upvalues: v308 (copy)
            v308.Analytics:reportDeniedNudge(v308:GetNudgeAnalyticsData());
        end or v312 and function() --[[ Line: 1389 ]]
            -- upvalues: v308 (copy)
            v308:ShowVoiceToxicityFeedbackToast();
            v308:reportBanMessage("Denied");
            v308.Analytics:reportBanMessageEvent("Denied");
        end or v315 and function() --[[ Line: 1394 ]]
            -- upvalues: v308 (copy), v76 (ref), v79 (ref)
            v308.Analytics:reportInExpConsent("denied", v308.inExpUpsellEntrypoint, v308:GetInExpUpsellAnalyticsData());
            if v308.inExpUpsellEntrypoint ~= v76.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
                v308:showPrompt(v79.VoiceConsentDeclinedToast);
            end;
        end or v310 == v79.DevicePermissionsModal and function() --[[ Line: 1404 ]]
            -- upvalues: v308 (copy)
            v308.Analytics:reportDevicePermissionsModalEvent("Denied", v308:GetSessionId(), v308:GetInExpUpsellAnalyticsData());
        end or nil
    }), l_CoreGui_0, "RobloxVoiceChatPromptGui");
end;
v122.showPrompt = function(v328, v329, v330) --[[ Line: 1418 ]] --[[ Name: showPrompt ]]
    -- upvalues: v25 (copy), v17 (copy)
    if v25() then
        v328.errorText = v330 or nil;
    end;
    v328:createPromptInstance(function() --[[ Line: 1422 ]]
        -- upvalues: v17 (ref), v329 (copy), v328 (copy)
        v17:debug("Show Prompt: {}", v329);
        v328.promptSignal:fire(v329);
    end, v329);
end;
v122.showJoinVoicePrompt = function(v331) --[[ Line: 1428 ]] --[[ Name: showJoinVoicePrompt ]]
    -- upvalues: v79 (copy), l_AppStorageService_0 (copy), v76 (copy)
    v331:showPrompt(v79.UnifiedJoinVoiceToast);
    pcall(function() --[[ Line: 1430 ]]
        -- upvalues: l_AppStorageService_0 (ref), v76 (ref)
        l_AppStorageService_0:SetItem(v76.VOICE_WITH_TC_TOAST_KEY, "true");
        l_AppStorageService_0:Flush();
    end);
end;
v122.CheckAndShowPermissionPrompt = function(v332) --[[ Line: 1436 ]] --[[ Name: CheckAndShowPermissionPrompt ]]
    -- upvalues: l_GetFFlagEnableSeamlessVoiceV2_0 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), l_PERMISSION_STATE_0 (copy), v79 (copy), l_PermissionsProtocol_0 (copy), v3 (copy), v24 (copy)
    local function v335() --[[ Line: 1437 ]] --[[ Name: showPrompt ]]
        -- upvalues: v332 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (ref), l_GetFFlagJoinWithoutMicPermissions_0 (ref), l_PERMISSION_STATE_0 (ref), v79 (ref), l_PermissionsProtocol_0 (ref), v3 (ref)
        local l_userEligible_0 = v332.userEligible;
        if v332.voiceEnabled or l_userEligible_0 then
            if not l_GetFFlagEnableSeamlessVoiceV2_0() and l_GetFFlagJoinWithoutMicPermissions_0() then
                if v332.permissionState == l_PERMISSION_STATE_0.LISTEN_ONLY then
                    v332:showPrompt(v79.Permission);
                end;
            else
                return v332.PermissionsService:hasPermissions({
                    l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS
                }):andThen(function(v334) --[[ Line: 1450 ]]
                    -- upvalues: l_PermissionsProtocol_0 (ref), v332 (ref), v79 (ref)
                    if v334 and v334.status == l_PermissionsProtocol_0.Status.DENIED then
                        v332:showPrompt(v79.Permission);
                    end;
                end);
            end;
        end;
        return v3.resolve();
    end;
    if v24() then
        return v335();
    else
        return v332:asyncInit():andThen(function() --[[ Line: 1463 ]]

        end):catch(function() --[[ Line: 1463 ]]
            -- upvalues: v335 (copy)
            return v335();
        end);
    end;
end;
v122.showDataConsentToast = function(v336) --[[ Line: 1469 ]] --[[ Name: showDataConsentToast ]]
    -- upvalues: l_GetFFlagSeamlessVoiceConsentToastPolicy_0 (copy), v86 (copy), v85 (copy), v76 (copy), v79 (copy)
    local v337 = v336:FetchAgeVerificationOverlay();
    local v338 = nil;
    local v339 = nil;
    local v340 = false;
    if l_GetFFlagSeamlessVoiceConsentToastPolicy_0() then
        v340 = v86.getAppFeaturePolicies().getDisplayCheckboxInVoiceConsent() or false;
    end;
    if type(v337) == "table" then
        v338 = if v337.voiceSettings then v337.voiceSettings.seamlessVoiceStatus else v85.Invalid;
        v339 = v337.showDataConsentToast;
    else
        v339 = false;
        v338 = v85.Invalid;
    end;
    if v339 and v340 then
        v339 = type(v336:_GetShowAgeVerificationOverlay()) == "table" and v336:_GetShowAgeVerificationOverlay().showDataConsentToast;
    end;
    if v338 == v85.EnabledExistingUser and v339 and v340 then
        v336:RecordUserSeenModal(v76.MODAL_IDS.DATA_CONSENT_TOAST);
        return v336:showPrompt(v79.VoiceDataConsentOptOutToast);
    else
        return;
    end;
end;
v122.CheckAndShowNotAudiblePrompt = function(v341) --[[ Line: 1503 ]] --[[ Name: CheckAndShowNotAudiblePrompt ]]
    -- upvalues: v79 (copy), v3 (copy)
    if game:GetEngineFeature("VoiceChatSupported") then
        return v341:asyncInit():andThen(function() --[[ Line: 1506 ]]
            -- upvalues: v341 (copy), v79 (ref)
            if UserSettings().GameSettings.MasterVolume == 0 then
                v341:showPrompt(v79.NotAudible);
            end;
        end):catch(function() --[[ Line: 1512 ]]

        end);
    else
        return v3.resolve();
    end;
end;
v122.InitialJoinFailedPrompt = function(v342) --[[ Line: 1517 ]] --[[ Name: InitialJoinFailedPrompt ]]
    -- upvalues: v17 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), v79 (copy)
    v17:debug("JoinByGroupIdToken returns false");
    if not l_GetFFlagVoiceChatClientRewriteMasterLua_0 then
        v342:showPrompt(v79.Retry);
    end;
end;
v122.ShowVoiceToxicityFeedbackToast = function(v343) --[[ Line: 1524 ]] --[[ Name: ShowVoiceToxicityFeedbackToast ]]
    -- upvalues: v17 (copy), v79 (copy)
    v17:debug("Sending feedback toast");
    v343:showPrompt(v79.VoiceToxicityFeedbackToast);
end;
v122.GetNudgeAnalyticsData = function(v344) --[[ Line: 1529 ]] --[[ Name: GetNudgeAnalyticsData ]]
    -- upvalues: l_Players_0 (copy)
    return l_Players_0.LocalPlayer.UserId, v344:GetSessionId();
end;
v122.GetInExpUpsellAnalyticsData = function(_) --[[ Line: 1533 ]] --[[ Name: GetInExpUpsellAnalyticsData ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy)
    local v346 = "";
    if l_game_EngineFeature_0 then
        v346 = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    return game.GameId, game.PlaceId, v346;
end;
v122.reportBanMessage = function(v347, v348) --[[ Line: 1541 ]] --[[ Name: reportBanMessage ]]
    -- upvalues: l_Players_0 (copy)
    v347.Analytics:reportBanMessageEventV2(v348, v347.banReason, l_Players_0.LocalPlayer.UserId, if v347.service then v347.previousSessionId else "");
end;
v122.reportJoinVoiceUpsellEvent = function(v349, v350) --[[ Line: 1550 ]] --[[ Name: reportJoinVoiceUpsellEvent ]]
    -- upvalues: v56 (copy), l_RbxAnalyticsService_0 (copy)
    if v56 then
        local l_l_RbxAnalyticsService_0_PlaySessionId_0 = l_RbxAnalyticsService_0:GetPlaySessionId();
        v349.Analytics:reportJoinVoiceUpsellEvent(v350, l_l_RbxAnalyticsService_0_PlaySessionId_0, v349:UserVoiceEnabled());
    end;
end;
v122.SetAndSyncActive = function(v352, v353, v354) --[[ Line: 1561 ]] --[[ Name: SetAndSyncActive ]]
    v352.coreVoiceManager:SetAndSyncActive(v353, v354);
end;
v122.CreateAudioDeviceData = function(v355, v356) --[[ Line: 1565 ]] --[[ Name: CreateAudioDeviceData ]]
    return v355.coreVoiceManager:CreateAudioDeviceData(v356);
end;
v122.onInstanceAdded = function(v357, v358) --[[ Line: 1569 ]] --[[ Name: onInstanceAdded ]]
    return v357.coreVoiceManager:onInstanceAdded(v358);
end;
v122.UpdateAudioDeviceInputDebugger = function(v359) --[[ Line: 1573 ]] --[[ Name: UpdateAudioDeviceInputDebugger ]]
    -- upvalues: v43 (copy), v17 (copy), v4 (copy), v78 (copy), l_CoreGui_0 (copy)
    if v43 then
        if not v359.voiceDebuggerInstance then
            v17:debug("Mounting AudioDeviceInput Debugger");
            v359.voiceDebuggerInstance = v4.mount(v4.createElement(v78, {
                instances = v359.audioDevices, 
                mutedPlayers = v359.mutedPlayers
            }), l_CoreGui_0, "RobloxVoiceChatPromptGui");
            return;
        else
            v4.update(v359.voiceDebuggerInstance, v4.createElement(v78, {
                instances = v359.audioDevices, 
                mutedPlayers = v359.mutedPlayers
            }));
        end;
    end;
end;
v122.AddReverseNudgeToxicUser = function(v360, v361, v362, v363) --[[ Line: 1597 ]] --[[ Name: AddReverseNudgeToxicUser ]]
    -- upvalues: v31 (copy)
    v362(v361, "iconColorChange");
    local v364 = v360.reverseNudgeToxicUserRemovalCallbacks[v361];
    if v364 ~= nil then
        task.cancel(v364);
    end;
    local v365 = task.delay(v31(), function() --[[ Line: 1611 ]]
        -- upvalues: v363 (copy), v361 (copy), v360 (copy)
        v363(v361);
        v360.reverseNudgeToxicUserRemovalCallbacks[v361] = nil;
    end);
    v360.reverseNudgeToxicUserRemovalCallbacks[v361] = v365;
end;
v122.onInstanceRemove = function(v366, v367) --[[ Line: 1618 ]] --[[ Name: onInstanceRemove ]]
    return v366.coreVoiceManager:onInstanceRemove(v367);
end;
v122.hookupAudioDeviceInputListener = function(v368) --[[ Line: 1622 ]] --[[ Name: hookupAudioDeviceInputListener ]]
    return v368.coreVoiceManager:hookupAudioDeviceInputListener();
end;
v122.ToggleMutePlayer = function(v369, v370, v371) --[[ Line: 1626 ]] --[[ Name: ToggleMutePlayer ]]
    return v369.coreVoiceManager:ToggleMutePlayer(v370, v371);
end;
v122.MuteAll = function(v372, v373, v374) --[[ Line: 1630 ]] --[[ Name: MuteAll ]]
    return v372.coreVoiceManager:MuteAll(v373, v374);
end;
v122.ToggleMuteSome = function(v375, v376, v377, v378, v379) --[[ Line: 1634 ]] --[[ Name: ToggleMuteSome ]]
    return v375.coreVoiceManager:ToggleMuteSome(v376, v377, v378, v379);
end;
v122.FireMuteNonFriendsEvent = function(v380) --[[ Line: 1643 ]] --[[ Name: FireMuteNonFriendsEvent ]]
    v380.mutedNonFriends:Fire();
end;
v122.EnsureCorrectMuteState = function(v381, v382, v383) --[[ Line: 1647 ]] --[[ Name: EnsureCorrectMuteState ]]
    -- upvalues: l_VoiceChatService_0 (copy), l_game_EngineFeature_1 (copy), l_Players_0 (copy)
    local v384 = {};
    for _, v386 in v382 do
        local v387 = v381.participants[tostring(v386)];
        if v387 and v387.isMutedLocally ~= v383 then
            if l_VoiceChatService_0.UseNewAudioApi then
                v384[v386] = true;
                v381.mutedPlayers[v386] = v383;
            else
                v381.service:SubscribePause(v386, v383);
            end;
            v387.isMutedLocally = v383;
            v381.participantsUpdate:Fire(v381.participants);
        end;
    end;
    if l_VoiceChatService_0.UseNewAudioApi then
        for v388 in v381.audioDevices do
            if v388.Player and v384[v388.Player.UserId] then
                if l_game_EngineFeature_1 and v388.Player ~= l_Players_0.LocalPlayer then
                    v388.MutedByLocalUser = v383;
                else
                    v388.Active = not v383;
                end;
            end;
        end;
    end;
end;
v122.FireUserAgencySelectedEvent = function(v389, v390) --[[ Line: 1679 ]] --[[ Name: FireUserAgencySelectedEvent ]]
    v389.userAgencySelected:Fire(v390);
end;
v122.ParticipantStateToIcon = function(_, v392, v393) --[[ Line: 1683 ]] --[[ Name: ParticipantStateToIcon ]]
    -- upvalues: l_VOICE_STATE_0 (copy)
    local l_INACTIVE_0 = l_VOICE_STATE_0.INACTIVE;
    if not v392.subscriptionCompleted then
        l_INACTIVE_0 = l_VOICE_STATE_0.CONNECTING;
    elseif v392.isMutedLocally then
        l_INACTIVE_0 = l_VOICE_STATE_0.LOCAL_MUTED;
    elseif v392.isMuted then
        l_INACTIVE_0 = l_VOICE_STATE_0.MUTED;
    elseif v392.isSignalActive then
        l_INACTIVE_0 = l_VOICE_STATE_0.TALKING;
    end;
    return getIcon(l_INACTIVE_0, v393);
end;
v122.VoiceStateToIcon = function(_, v396, v397, v398) --[[ Line: 1698 ]] --[[ Name: VoiceStateToIcon ]]
    return getIcon(v396, v397, v398);
end;
v122.GetIcon = function(_, v400, v401) --[[ Line: 1702 ]] --[[ Name: GetIcon ]]
    return getIconSrc(v400, v401);
end;
v122.JoinVoice = function(v402, v403) --[[ Line: 1706 ]] --[[ Name: JoinVoice ]]
    -- upvalues: v76 (copy), v58 (copy), v41 (copy), v23 (copy), v79 (copy), l_GetFFlagNonVoiceFTUX_0 (copy), l_AppStorageService_0 (copy), l_GetFFlagEnableVrVoiceParity_0 (copy), v3 (copy), v50 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy), v55 (copy), v21 (copy), l_GetFFlagShowToastWhenAgeGatingVoice_0 (copy), l_GetFFlagIntegratePhoneUpsellJoinVoice_0 (copy), l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 (copy), l_getOverlayStore_0 (copy), l_OverlayTypes_0 (copy), l_SocialUpsellType_0 (copy), l_Enum_0 (copy), v48 (copy)
    local v404 = v402:FetchAgeVerificationOverlay().showVoiceInExperienceUpsellVariant or v76.IN_EXP_UPSELL_VARIANT.VARIANT3;
    v402.Analytics:reportJoinVoiceButtonEvent("clicked", v402:GetInExpUpsellAnalyticsData());
    if v58() and v402.previousGroupId then
        v402:RejoinPreviousChannel();
        if v41() then
            v402:showJoinVoicePrompt();
        elseif v23() then
            v402:showPrompt(v79.UnifiedJoinVoiceToast);
        else
            v402:showPrompt(v79.JoinVoice);
        end;
        v402:ShowVoiceUI();
        v402:SetVoiceConnectCookieValue(true);
    elseif l_GetFFlagNonVoiceFTUX_0() and v402.isShowingFTUX then
        v402:HideFTUX(l_AppStorageService_0);
    elseif v402.deniedMicPermissions then
        if l_GetFFlagEnableVrVoiceParity_0() then
            v402:CheckAndShowPermissionPrompt();
        else
            v402:CheckAndShowPermissionPrompt():finallyReturn(v3.reject());
        end;
    elseif v58() and v402:UserVoiceEnabled() then
        if v50 then
            v402.isInitialJoin = true;
        end;
        v402.attemptVoiceRejoin:Fire();
        if l_GetFFlagEnableSeamlessVoiceV2_0() and v402:IsNewSeamlessVoiceUserDisconnect() then
            v402:SetVoiceConnectCookieValue(true);
            v402:SetNewUserFTUXCookieValue(true);
        end;
    elseif v55 and v402:UserOnlyEligibleForVoiceViaOverlay() or v402:UserOnlyEligibleForVoice() then
        if v21() and v402:IsSeamlessVoice() then
            v402:EnableVoice();
        else
            v402:SetInExpUpsellEntrypoint(v76.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE);
            v402:showPrompt((v402:GetInExpUpsellPromptFromEnum(v404)));
        end;
    elseif l_GetFFlagShowToastWhenAgeGatingVoice_0() and v402:EligibleForAgeCheckToast() then
        v402:showPrompt(v79.AgeCheckForVoiceToast);
    elseif l_GetFFlagIntegratePhoneUpsellJoinVoice_0() and l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and not v402:UserVoiceEnabled() and v402:FetchPhoneVerificationUpsell(v76.IN_EXP_PHONE_UPSELL_IXP_LAYER) == v76.PHONE_UPSELL_VALUE_PROP.VoiceChat then
        if v403 then
            v403:SetVisibility(false, true);
        end;
        v402:ShowInExperiencePhoneVoiceUpsell(v76.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE, v76.IN_EXP_PHONE_UPSELL_IXP_LAYER);
    elseif v402:EligibleForFaeUpsell() then
        v402.coreVoiceManager:OptUserToJoinVoice();
        local v405 = l_getOverlayStore_0(false);
        v402:reportJoinVoiceUpsellEvent("Click");
        v405.setCurrentOverlay(l_OverlayTypes_0.SocialUpsell, {
            upsellType = l_SocialUpsellType_0.FacialAgeEstimation, 
            data = {
                isInExperience = true, 
                countDownBadgeText = nil, 
                isPhase2 = true, 
                upsellEntrySurface = l_Enum_0.UpsellEntrySurfaceType.InExperienceVoiceChatIcon, 
                upsellEntryComponent = l_Enum_0.UpsellComponent.Modal, 
                upsellPurpose = l_Enum_0.UpsellStage.Fae
            }
        });
    end;
    if v48 and v402:IsSeamlessVoice() then
        task.spawn(function() --[[ Line: 1793 ]]
            -- upvalues: v402 (copy)
            v402.coreVoiceManager:PostUserVoiceConnectionStatus(true);
        end);
    end;
end;
v122.EligibleForFaeUpsell = function(v406) --[[ Line: 1799 ]] --[[ Name: EligibleForFaeUpsell ]]
    -- upvalues: l_GetFFlagEnableVoiceUxUpdates_0 (copy), l_FFlagTestDeviceForFAEUpsell_0 (copy), l_deviceMeetsRequirementsForFAE_0 (copy)
    local v407 = l_GetFFlagEnableVoiceUxUpdates_0();
    if v407 then
        v407 = v406.coreVoiceManager:EligibleForFaeUpsell();
        if v407 then
            v407 = v406.AvatarChatService:deviceMeetsRequirementsForFeature(Enum.DeviceFeatureType.InExperienceFAE);
            if v407 then
                if l_FFlagTestDeviceForFAEUpsell_0 then
                    return (l_deviceMeetsRequirementsForFAE_0());
                else
                    v407 = true;
                end;
            end;
        end;
    end;
    return v407;
end;
v122.EligibleForAgeCheckToast = function(v408) --[[ Line: 1806 ]] --[[ Name: EligibleForAgeCheckToast ]]
    return v408.coreVoiceManager:EligibleForAgeCheckToast();
end;
v122.ShouldShowJoinVoice = function(v409) --[[ Line: 1811 ]] --[[ Name: ShouldShowJoinVoice ]]
    -- upvalues: l_GetFFlagEnableVoiceUxUpdates_0 (copy), v19 (copy), v22 (copy), v58 (copy), l_GetFFlagShowToastWhenAgeGatingVoice_0 (copy), l_GetFFlagIntegratePhoneUpsellJoinVoice_0 (copy), l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 (copy), v76 (copy)
    if l_GetFFlagEnableVoiceUxUpdates_0() then
        if v409:EligibleForFaeUpsell() or v409:HasSeamlessVoiceFeature(v19.Constants.SeamlessVoiceFeatures.InitialJoinVoice) and v409:GetVoiceConnectCookie() == "" then
            return true;
        end;
    elseif v22() then
        if v58() and v409:IsSeamlessVoice() and v409:verifyUniverseAndPlaceCanUseVoice() then
            return not v409.voiceUIVisible;
        end;
    elseif v58() and v409:IsSeamlessVoice() then
        return not v409.voiceUIVisible;
    end;
    if l_GetFFlagShowToastWhenAgeGatingVoice_0() and v409:EligibleForAgeCheckToast() then
        return true;
    else
        local v410 = v409:UserInInExperienceUpsellTreatment();
        local v411 = v409:UserOnlyEligibleForVoice() or v409:UserVoiceEnabled();
        if l_GetFFlagIntegratePhoneUpsellJoinVoice_0() and l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and not v411 and not v409:UserVoiceEnabled() and v409:FetchPhoneVerificationUpsell(v76.IN_EXP_PHONE_UPSELL_IXP_LAYER) == v76.PHONE_UPSELL_VALUE_PROP.VoiceChat then
            return true;
        else
            return v410 and v411;
        end;
    end;
end;
v122.ShouldShowJoinVoiceOnDisconnect = function(v412) --[[ Line: 1864 ]] --[[ Name: ShouldShowJoinVoiceOnDisconnect ]]
    return v412.coreVoiceManager:ShouldShowJoinVoiceOnDisconnect();
end;
v122.IsSeamlessVoice = function(v413) --[[ Line: 1868 ]] --[[ Name: IsSeamlessVoice ]]
    -- upvalues: l_GetFFlagCheckUniversePlaceBeforeSuspending_0 (copy), v17 (copy), v85 (copy)
    if l_GetFFlagCheckUniversePlaceBeforeSuspending_0() then
        return v413.coreVoiceManager:IsSeamlessVoice();
    else
        local v414 = v413:FetchAgeVerificationOverlay();
        if not v414 or not v414.voiceSettings then
            v17:error("VoiceChatServiceManager:IsSeamlessVoice() - ageVerificationOverlayData or voiceSettings is nil");
            return false;
        else
            local l_seamlessVoiceStatus_0 = v414.voiceSettings.seamlessVoiceStatus;
            local v416 = true;
            if l_seamlessVoiceStatus_0 ~= v85.EnabledExistingUser then
                v416 = l_seamlessVoiceStatus_0 == v85.EnabledNewUser;
            end;
            return v416;
        end;
    end;
end;
v122.HasSeamlessVoiceFeature = function(v417, v418) --[[ Line: 1884 ]] --[[ Name: HasSeamlessVoiceFeature ]]
    return v417.coreVoiceManager:HasSeamlessVoiceFeature(v418);
end;
v122.IsNewSeamlessVoiceUserDisconnect = function(v419) --[[ Line: 1888 ]] --[[ Name: IsNewSeamlessVoiceUserDisconnect ]]
    return v419.coreVoiceManager:IsNewSeamlessVoiceUserDisconnect();
end;
v122.GetConnectDisconnectButtonAnalyticsData = function(v420, v421) --[[ Line: 1892 ]] --[[ Name: GetConnectDisconnectButtonAnalyticsData ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy)
    local v422 = "";
    if l_game_EngineFeature_0 then
        v422 = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    local v423 = {
        game.GameId, 
        game.PlaceId, 
        v422
    };
    if v421 and v420:getService() then
        table.insert(v423, v420:GetSessionId());
    end;
    return unpack(v423);
end;
v122.GetConnectDisconnectAnalyticsData = function(v424) --[[ Line: 1904 ]] --[[ Name: GetConnectDisconnectAnalyticsData ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy), l_GetFFlagNonVoiceFTUX_0 (copy), l_default_0 (copy)
    local v425 = {};
    local v426 = "";
    if l_game_EngineFeature_0 then
        v426 = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    v425.universeId = game.GameId;
    v425.placeId = game.PlaceId;
    v425.playSessionId = v426;
    if l_GetFFlagNonVoiceFTUX_0() then
        v425.voiceSessionId = if v424.service then v424:GetSessionId() else "";
    else
        v425.voiceSessionId = v424:GetSessionId();
    end;
    v425.durationTimestamp = l_default_0:getTimestamp();
    return v425;
end;
v122.Leave = function(v427) --[[ Line: 1924 ]] --[[ Name: Leave ]]
    -- upvalues: l_GetFFlagDisconnectToastClientRewrite_0 (copy), v58 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), v48 (copy)
    v427:ensureInitialized("leave");
    if l_GetFFlagDisconnectToastClientRewrite_0() and v58() then
        v427:SetVoiceConnectCookieValue(false);
    end;
    v427.Analytics:reportConnectDisconnectEvents("voiceDisconnectEvent", v427:GetConnectDisconnectAnalyticsData());
    local l_GroupId_0 = v427.service:GetGroupId();
    local v429 = v427.service:IsPublishPaused();
    if l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
        local l_VoiceChatService_1 = game:GetService("VoiceChatService");
        if l_VoiceChatService_1 then
            l_VoiceChatService_1:leaveVoice();
        end;
    else
        v427.service:Leave();
    end;
    v427:HideVoiceUI();
    v427.previousGroupId = l_GroupId_0;
    v427.previousMutedState = v429;
    if not l_GetFFlagDisconnectToastClientRewrite_0() and v58() then
        v427:SetVoiceConnectCookieValue(false);
    end;
    if v48 and v427:IsSeamlessVoice() then
        task.spawn(function() --[[ Line: 1947 ]]
            -- upvalues: v427 (copy)
            v427.coreVoiceManager:PostUserVoiceConnectionStatus(false);
        end);
    end;
end;
v122.GetVoiceStateFromEnum = function(_, v432) --[[ Line: 1953 ]] --[[ Name: GetVoiceStateFromEnum ]]
    -- upvalues: v124 (ref), l_VOICE_STATE_0 (copy)
    if not v124[v432] then
        v124 = {
            [Enum.VoiceChatState.Idle] = l_VOICE_STATE_0.HIDDEN, 
            [Enum.VoiceChatState.Joining] = l_VOICE_STATE_0.CONNECTING, 
            [Enum.VoiceChatState.JoiningRetry] = l_VOICE_STATE_0.CONNECTING, 
            [Enum.VoiceChatState.Joined] = l_VOICE_STATE_0.MUTED, 
            [Enum.VoiceChatState.Leaving] = l_VOICE_STATE_0.MUTED, 
            [Enum.VoiceChatState.Ended] = l_VOICE_STATE_0.HIDDEN, 
            [Enum.VoiceChatState.Failed] = l_VOICE_STATE_0.ERROR
        };
    end;
    return v124[v432];
end;
v122.GetInExpUpsellPromptFromEnum = function(_, v434) --[[ Line: 1973 ]] --[[ Name: GetInExpUpsellPromptFromEnum ]]
    -- upvalues: v125 (copy)
    return v125[v434];
end;
v122.getRecentUsersInteractionData = function(v435) --[[ Line: 1978 ]] --[[ Name: getRecentUsersInteractionData ]]
    return v435.coreVoiceManager:getRecentUsersInteractionData();
end;
v122._setRecentUserState = function(v436, v437, v438) --[[ Line: 1982 ]] --[[ Name: _setRecentUserState ]]
    return v436.coreVoiceManager:_setRecentUserState(v437, v438);
end;
v122._updateRecentUsersInteractionData = function(v439) --[[ Line: 1986 ]] --[[ Name: _updateRecentUsersInteractionData ]]
    return v439.coreVoiceManager:_updateRecentUsersInteractionData();
end;
v122.SetupParticipantListeners = function(v440) --[[ Line: 1990 ]] --[[ Name: SetupParticipantListeners ]]
    return v440.coreVoiceManager:SetupParticipantListeners();
end;
v122.Disconnect = function(v441) --[[ Line: 1994 ]] --[[ Name: Disconnect ]]
    v441.coreVoiceManager:Disconnect();
    v441.coreVoiceManager:unsubscribeAll();
end;
v122.GetSendMuteEvent = function(v442) --[[ Line: 1999 ]] --[[ Name: GetSendMuteEvent ]]
    return v442.coreVoiceManager:GetSendMuteEvent();
end;
v122.GetLikelySpeakingUsersEvent = function(v443) --[[ Line: 2003 ]] --[[ Name: GetLikelySpeakingUsersEvent ]]
    return v443.coreVoiceManager:GetLikelySpeakingUsersEvent();
end;
v122.ToggleMic = function(v444, v445) --[[ Line: 2008 ]] --[[ Name: ToggleMic ]]
    return v444.coreVoiceManager:ToggleMic(v445);
end;
v122.SubscribeRetry = function(v446, v447) --[[ Line: 2012 ]] --[[ Name: SubscribeRetry ]]
    -- upvalues: v17 (copy)
    v446:ensureInitialized("subscribe retry");
    v17:debug("Attempting to retry connection to user: {}", "..." .. string.sub(tostring(v447), -4));
    v446.service:SubscribeRetry(v447);
end;
v122.JoinByGroupIdToken = function(v448, v449, v450) --[[ Line: 2018 ]] --[[ Name: JoinByGroupIdToken ]]
    return v448.coreVoiceManager:JoinByGroupIdToken(v449, v450);
end;
v122.RejoinPreviousChannel = function(v451) --[[ Line: 2022 ]] --[[ Name: RejoinPreviousChannel ]]
    -- upvalues: v17 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy)
    local l_previousGroupId_0 = v451.previousGroupId;
    local l_previousMutedState_0 = v451.previousMutedState;
    v17:debug("Rejoining previous channel {} with mute status {}", l_previousGroupId_0, l_previousMutedState_0);
    pcall(function() --[[ Line: 2027 ]]
        -- upvalues: l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), v451 (copy), l_previousGroupId_0 (copy), l_previousMutedState_0 (copy)
        if l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
            v451.coreVoiceManager:RejoinVoice();
            v451.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", v451:GetConnectDisconnectAnalyticsData());
            return;
        else
            if l_previousGroupId_0 and l_previousGroupId_0 ~= "" then
                v451.service:Leave();
                if not v451.service:JoinByGroupIdToken(l_previousGroupId_0, l_previousMutedState_0, true) then
                    v451:InitialJoinFailedPrompt();
                    return;
                else
                    v451.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", v451:GetConnectDisconnectAnalyticsData());
                end;
            end;
            return;
        end;
    end);
end;
local function _(v454, v455, v456) --[[ Line: 2051 ]] --[[ Name: isValidDeviceList ]]
    return v454 and v455 and v456 and #v454 > 0 and v456 > 0 and v456 <= #v454 and #v454 == #v455;
end;
local function v467(v458, v459) --[[ Line: 2061 ]] --[[ Name: setVCSOutput ]]
    -- upvalues: l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 (copy), v17 (copy)
    if l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0() then
        v17:error("[OutputDeviceSelection] setVCSOutput is deprecated");
        return {};
    else
        local v460, v461, v462, v463 = pcall(function() --[[ Line: 2067 ]]
            -- upvalues: v459 (copy)
            return v459:GetSpeakerDevices();
        end);
        if v460 and v461 and v462 and v463 and #v461 > 0 and v463 > 0 and v463 <= #v461 and #v461 == #v462 then
            local v464 = 0;
            for v465, v466 in ipairs(v461) do
                if v466 == v458 then
                    v464 = v465;
                end;
            end;
            if v464 > 0 then
                v17:info("[OutputDeviceSelection] Setting VCS Speaker Device To {} {}", v461[v464], v462[v464]);
                v459:SetSpeakerDevice(v461[v464], v462[v464]);
                return;
            else
                v17:warning("Could not find equivalent VoiceChatService Device");
                return;
            end;
        else
            v17:warning("Could not connect to Voice Chat Service to change Output Device");
            return;
        end;
    end;
end;
v122.SwitchDevice = function(v468, v469, v470, v471) --[[ Line: 2095 ]] --[[ Name: SwitchDevice ]]
    -- upvalues: l_VOICE_CHAT_DEVICE_TYPE_0 (copy), l_SoundService_0 (copy), v17 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), v467 (copy), v72 (copy)
    if v469 == l_VOICE_CHAT_DEVICE_TYPE_0.Input then
        l_SoundService_0:SetInputDevice(v470, v471);
        v17:info("[InputDeviceSelection] Setting SS Mic Device To {} {}", v470, v471);
        return;
    else
        l_SoundService_0:SetOutputDevice(v470, v471);
        v17:info("[OutputDeviceSelection] Setting SS Speaker Device To {} {}", v470, v471);
        if not l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
            v467(v470, if v72 then v468.service else nil);
        end;
        return;
    end;
end;
v122.GetDevices = function(_, v473) --[[ Line: 2108 ]] --[[ Name: GetDevices ]]
    -- upvalues: l_VOICE_CHAT_DEVICE_TYPE_0 (copy), l_SoundService_0 (copy)
    local v474, v475, v476, v477 = pcall(function() --[[ Line: 2109 ]]
        -- upvalues: v473 (copy), l_VOICE_CHAT_DEVICE_TYPE_0 (ref), l_SoundService_0 (ref)
        if v473 == l_VOICE_CHAT_DEVICE_TYPE_0.Input then
            return l_SoundService_0:GetInputDevices();
        else
            return l_SoundService_0:GetOutputDevices();
        end;
    end);
    return v474, v475, v476, v477;
end;
v122.VoiceChatAvailable = function(v478) --[[ Line: 2120 ]] --[[ Name: VoiceChatAvailable ]]
    -- upvalues: l_MIN_VOICE_CHAT_API_VERSION_0 (copy), l_VOICE_CHAT_AVAILABILITY_0 (copy)
    local l_service_0 = v478.service;
    if v478.available == nil and l_service_0 then
        v478.version = l_service_0:GetVoiceChatApiVersion();
        if v478.version >= l_MIN_VOICE_CHAT_API_VERSION_0 then
            v478.available = l_service_0:GetVoiceChatAvailable();
            while v478.available == l_VOICE_CHAT_AVAILABILITY_0.Checking do
                wait(1);
                v478.available = l_service_0:GetVoiceChatAvailable();
            end;
        end;
    end;
    if l_service_0 then
        local v480 = false;
        if v478.version >= l_MIN_VOICE_CHAT_API_VERSION_0 then
            v480 = v478.available == l_VOICE_CHAT_AVAILABILITY_0.Available;
        end;
        return v480;
    else
        return false;
    end;
end;
v122.VoiceChatEnded = function(v481) --[[ Line: 2140 ]] --[[ Name: VoiceChatEnded ]]
    -- upvalues: v52 (copy)
    if v481.service then
        local l_VoiceChatState_0 = v481.service.VoiceChatState;
        if v52 then
            return l_VoiceChatState_0 == Enum.VoiceChatState.Ended;
        else
            local v483 = true;
            if l_VoiceChatState_0 ~= Enum.VoiceChatState.Ended then
                v483 = l_VoiceChatState_0 == Enum.VoiceChatState.Idle;
            end;
            return v483;
        end;
    else
        return true;
    end;
end;
v122.UnmountPrompt = function(v484) --[[ Line: 2152 ]] --[[ Name: UnmountPrompt ]]
    -- upvalues: v4 (copy)
    if v484.voiceChatPromptInstance ~= nil then
        v4.unmount(v484.voiceChatPromptInstance);
        v484.voiceChatPromptInstance = nil;
    end;
end;
v122.default = v122.new(l_CoreVoiceManager_0.default, nil, l_HttpRbxApiService_0, l_PermissionsProtocol_0.default, v95:GetAfterBlockedStatusChangedEvent());
return v122;