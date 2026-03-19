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
local v28 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatCoreScriptSupport();
local l_GetFFlagUseLuaSignalrConsumer_0 = v19.Flags.GetFFlagUseLuaSignalrConsumer;
local l_GetFFlagNonVoiceFTUX_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagNonVoiceFTUX;
local l_GetFFlagJoinWithoutMicPermissions_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagJoinWithoutMicPermissions;
local v32 = require(l_RobloxGui_0.Modules.Flags.GetFIntVoiceReverseNudgeUXDisplayTimeSeconds);
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local v34 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableSeamlessVoiceDataConsentToast);
local l_GetFFlagSeamlessVoiceConsentToastPolicy_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSeamlessVoiceConsentToastPolicy;
local l_GetFFlagEnableFtuxExitOnMuteToggle_0 = v19.Flags.GetFFlagEnableFtuxExitOnMuteToggle;
local l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableVoiceChatMuteForVideoCaptures;
local l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExperienceVoiceCaptureMute;
local l_GetFFlagExpChatUseVoiceParticipantsStore_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagExpChatUseVoiceParticipantsStore;
local l_GetFFlagEnableVoiceUxUpdates_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableVoiceUxUpdates;
local l_GetFFlagShowToastWhenAgeGatingVoice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagShowToastWhenAgeGatingVoice;
local v42 = require(script.Parent.Flags.GetFFlagEnableVoiceTrustedConnectionsToasts);
local v43 = game:DefineFastFlag("FixNudgeDeniedEvents", false);
local v44 = game:DefineFastFlag("DebugShowAudioDeviceInputDebugger", false);
local v45 = game:DefineFastFlag("FixMissingPermissionsAnalytics", false);
local v46 = game:DefineFastFlag("DebugSkipVoicePermissionCheck", false);
local v47 = game:DefineFastFlag("DebugSimulateConnectDisconnect", false);
local v48 = game:DefineFastFlag("DebugSkipSeamlessVoiceAPICheck", false);
local v49 = game:DefineFastFlag("FixSTUXShowingIncorrectly", false);
local v50 = game:DefineFastFlag("SendUserConnectionStatus", false);
local v51 = game:DefineFastInt("DebugConnectDisconnectInterval", 15);
local v52 = game:DefineFastFlag("SeamlessVoiceV2JoinVoiceToast", false);
local v53 = game:DefineFastFlag("DisablePermissionPromptDeeplink", false);
local v54 = game:DefineFastFlag("VoiceEndedCheckDisregardIdleState", false);
local v55 = game:DefineFastFlag("DisableMicRejectedPromiseReject", false);
local v56 = game:DefineFastFlag("DisableLeaveToastInStudio", false);
local v57 = game:DefineFastFlag("EnableVerifiedCheckViaOverlay", false);
local v58 = game:DefineFastFlag("InExperienceVoiceUpsellAnalyticsV2", false);
local l_GetFIntThrottleParticipantsUpdateMs_0 = v19.Flags.GetFIntThrottleParticipantsUpdateMs;
local v60 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableConnectDisconnectInSettingsAndChrome);
local v61 = game:DefineFastString("VoiceUIImprovementsIXPLayerName", "Voice.Exposure");
local v62 = game:DefineFastString("ThrottleParticipantsUpdateIXPLayerValue", "ThrottleParticipantsUpdate");
local v63 = game:DefineFastInt("SeamlessVoiceSTUXDisplayCount", 3);
local l_GetFFlagShowLikelySpeakingBubbles_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagShowLikelySpeakingBubbles;
local l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints;
local l_GetFFlagShowDevicePermissionsModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagShowDevicePermissionsModal;
local l_FFlagEnableRetryForLinkingProtocolFetch_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableRetryForLinkingProtocolFetch;
local v68 = game:DefineFastFlag("SeamlessVoiceBugfixesV1", false);
local l_GetFFlagIntegratePhoneUpsellJoinVoice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIntegratePhoneUpsellJoinVoice;
local l_GetFFlagInExperiencePhoneUpsellNewCopy_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagInExperiencePhoneUpsellNewCopy;
local l_GetFFlagCheckUniversePlaceBeforeSuspending_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagCheckUniversePlaceBeforeSuspending;
local l_FIntLinkingProtocolFetchRetries_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FIntLinkingProtocolFetchRetries;
local l_FIntLinkingProtocolFetchTimeoutMS_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FIntLinkingProtocolFetchTimeoutMS;
local v74 = game:DefineFastFlag("FixOutputDeviceChange", false);
local v75 = require(l_CorePackages_0.Workspace.Packages.VoiceChat);
local l_Constants_0 = v75.Constants;
local l_PostRecordUserSeenGeneralModal_0 = v75.AgeVerificationOverlay.PostRecordUserSeenGeneralModal;
local v78 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v79 = require(l_RobloxGui_0.Modules.VoiceChatPrompt.Components.VoiceChatPrompt);
local v80 = require(l_RobloxGui_0.Modules.VoiceChat.Components.AudioDeviceInputDebugger);
local v81 = require(l_RobloxGui_0.Modules.VoiceChatPrompt.PromptType);
local l_GetUserSettings_0 = v75.GetUserSettings;
local l_GetInformedOfBan_0 = v75.GetInformedOfBan;
local l_PostInformedOfBan_0 = v75.PostInformedOfBan;
local v85 = require(l_RobloxGui_0.Modules.Settings.getCamMicPermissions);
local l_BAN_REASON_0 = v78.BAN_REASON;
local v87 = require(l_RobloxGui_0.Modules.Settings.Enum.SeamlessVoiceStatus);
local v88 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy);
local l_GetFFlagVoiceChatClientRewriteMasterLua_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagVoiceChatClientRewriteMasterLua;
local l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagVoiceChatClientRewriteDisableVCSDevice;
local l_GetFFlagEnableSeamlessVoiceV2_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableSeamlessVoiceV2;
local l_GetFFlagDisconnectToastClientRewrite_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagDisconnectToastClientRewrite;
local l_GetFFlagEnableVrVoiceParity_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableVrVoiceParity;
local l_Analytics_0 = v19.Analytics;
local l_HttpService_0 = game:GetService("HttpService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local v97 = require(l_CorePackages_0.Workspace.Packages.BlockingUtility);
local v98 = require(l_RobloxGui_0.Modules.Settings.Resources.MicrophoneDevicePermissionsLogging);
local v99 = if l_GetFFlagAvatarChatServiceEnabled_0() then game:GetService("AvatarChatService") else nil;
local v100 = if l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0() then game:GetService("CaptureService") else nil;
local v101 = require(l_CorePackages_0.Workspace.Packages.ExpChat);
local l_default_2 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol.default;
local l_SettingsRoute_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).Enums.SettingsRoute;
local v104 = if l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() then require(l_CorePackages_0.Workspace.Packages.PhoneUpsell).PhoneUpsellController else nil;
local v105 = if l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() then require(l_CorePackages_0.Workspace.Packages.PhoneUpsell).Http.Requests.PostPhoneUpsellDisplayed else nil;
local l_CoreVoiceManager_0 = v19.CoreVoiceManager;
local l_Constants_1 = v19.Constants;
local l_getOverlayStore_0 = v15.Overlay.getOverlayStore;
local l_OverlayTypes_0 = v15.Overlay.OverlayTypes;
local l_SocialUpsellType_0 = v15.Enum.SocialUpsellType;
local l_Enum_0 = v15.Analytics.Enum;
local v112 = require(l_CorePackages_0.Workspace.Packages.SocialExperiments);
local l_FFlagTestDeviceForFAEUpsell_0 = v112.FFlagTestDeviceForFAEUpsell;
local l_deviceMeetsRequirementsForFAE_0 = v112.deviceMeetsRequirementsForFAE;
local l_game_EngineFeature_1 = game:GetEngineFeature("EnableMutedByLocalUser");
local l_FFlagEnablePartyVoiceChangersInLua_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnablePartyVoiceChangersInLua;
local l_VOICE_STATE_0 = l_Constants_0.VOICE_STATE;
local l_VOICE_CHAT_DEVICE_TYPE_0 = l_Constants_0.VOICE_CHAT_DEVICE_TYPE;
local l_VOICE_CHAT_AVAILABILITY_0 = l_Constants_0.VOICE_CHAT_AVAILABILITY;
local l_MIN_VOICE_CHAT_API_VERSION_0 = l_Constants_0.MIN_VOICE_CHAT_API_VERSION;
local l_WATCHED_MESSAGE_TYPES_0 = l_Constants_0.WATCHED_MESSAGE_TYPES;
local l_PERMISSION_STATE_0 = l_Constants_0.PERMISSION_STATE;
local l_VOICE_JOIN_PROGRESS_0 = l_Constants_1.VOICE_JOIN_PROGRESS;
local v124 = {
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
    getPermissionsFunction = v85, 
    AvatarChatService = v99, 
    inExpUpsellEntrypoint = nil, 
    seamlessVoiceStatus = nil, 
    isShowingFTUX = false, 
    hideFTUXSignal = Instance.new("BindableEvent"), 
    settingsAppAvailable = nil, 
    hasLeftFTUX = false, 
    deniedMicPermissions = nil, 
    isInitialJoin = false, 
    CaptureService = v100
};
local v125 = v5.Set.new({
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
v125:add("_mutedAnyone");
v125:add("muteAllChanged");
local v126 = {};
local v127 = {
    [v78.IN_EXP_UPSELL_VARIANT.VARIANT1] = v81.VoiceConsentModalV1, 
    [v78.IN_EXP_UPSELL_VARIANT.VARIANT2] = v81.VoiceConsentModalV2, 
    [v78.IN_EXP_UPSELL_VARIANT.VARIANT3] = v81.VoiceConsentModalV3
};
getIconSrc = function(v128, v129) --[[ Line: 334 ]] --[[ Name: getIconSrc ]]
    return "rbxasset://textures/ui/VoiceChat/" .. (v129 and v129 .. "/" or "") .. v128 .. ".png";
end;
getIcon = function(v130, v131, v132) --[[ Line: 339 ]] --[[ Name: getIcon ]]
    -- upvalues: l_VOICE_STATE_0 (copy)
    if v130 == l_VOICE_STATE_0.MUTED then
        return getIconSrc("Muted", v132);
    elseif v130 == l_VOICE_STATE_0.CONNECTING then
        return getIconSrc("Connecting", v132);
    elseif v130 == l_VOICE_STATE_0.INACTIVE then
        return getIconSrc("Blank", v132);
    elseif v130 == l_VOICE_STATE_0.TALKING then
        local v133 = math.floor(0.5 + 5 * (v131 or math.random())) * 20;
        return v131 and getIconSrc("Unmuted" .. tostring(v133), v132) or getIconSrc("Blank", v132);
    else
        return getIconSrc("Error", v132);
    end;
end;
v124.__index = v124;
v124.__index = function(v134, v135) --[[ Line: 357 ]] --[[ Name: __index ]]
    -- upvalues: v125 (copy), v124 (copy)
    if v125:has(v135) then
        return v134.coreVoiceManager[v135];
    else
        return (rawget(v124, v135));
    end;
end;
v124.__newindex = function(v136, v137, v138) --[[ Line: 364 ]] --[[ Name: __newindex ]]
    -- upvalues: v125 (copy), v124 (copy)
    if v125:has(v137) then
        v136.coreVoiceManager[v137] = v138;
        return;
    else
        rawset(v124, v137, v138);
        return;
    end;
end;
v124.new = function(v139, v140, v141, v142, v143, v144, v145, v146, v147, v148) --[[ Line: 372 ]] --[[ Name: new ]]
    -- upvalues: l_Analytics_0 (copy), v85 (copy), v124 (copy), l_GetFFlagUseLuaSignalrConsumer_0 (copy), l_WATCHED_MESSAGE_TYPES_0 (copy), l_GetFIntThrottleParticipantsUpdateMs_0 (copy), l_IXPServiceWrapper_0 (copy), v61 (copy), v62 (copy), l_GetFFlagExpChatUseVoiceParticipantsStore_0 (copy), v101 (copy), l_GetFFlagShowLikelySpeakingBubbles_0 (copy), v24 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy), v46 (copy), v55 (copy), v3 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), v98 (copy), v60 (copy), v56 (copy), v81 (copy), v47 (copy), v17 (copy), v42 (copy), l_AppStorageService_0 (copy), v78 (copy), l_GetFFlagShowDevicePermissionsModal_0 (copy), v34 (copy), l_GetFFlagNonVoiceFTUX_0 (copy), v23 (copy), v52 (copy), l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0 (copy), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (copy), l_default_1 (copy)
    local v149 = setmetatable({
        service = v140, 
        HttpRbxApiService = v141, 
        NotificationService = v145, 
        PermissionsService = v142, 
        BlockStatusChanged = v143, 
        Analytics = l_Analytics_0.new(v144), 
        getPermissionsFunction = v146 or v85, 
        AvatarChatService = v147, 
        SequenceNumbers = {}, 
        SignalREventTable = {}, 
        coreVoiceManager = v139, 
        _mutedAnyone = false, 
        CaptureService = v148
    }, v124);
    if l_GetFFlagUseLuaSignalrConsumer_0() then
        for _, v151 in l_WATCHED_MESSAGE_TYPES_0 do
            v149.SignalREventTable[v151] = Instance.new("BindableEvent");
        end;
    end;
    v149.shouldThrottleParticipantUpdate = false;
    v149.participantsStateThrottleTime = 0;
    v149.lastParticipantsStateUpdate = 0;
    v149.lastStateUpdateCounter = 0;
    v149.reverseNudgeToxicUserRemovalCallbacks = {};
    if l_GetFIntThrottleParticipantsUpdateMs_0() > 0 then
        v149.participantsStateThrottleTime = l_GetFIntThrottleParticipantsUpdateMs_0() / 1000;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 414 ]]
            -- upvalues: l_IXPServiceWrapper_0 (ref), v61 (ref)
            return l_IXPServiceWrapper_0:GetLayerData(v61);
        end);
        if l_status_0 and l_result_0 and l_result_0[v62] then
            v149.shouldThrottleParticipantUpdate = true;
        end;
    end;
    v149.MuteStatusIcons = {
        MicOn = v149:GetIcon("Unmuted0", "SpeakerLight"), 
        MicOff = v149:GetIcon("Muted", "SpeakerLight"), 
        MicDisabled = v149:GetIcon("Muted", "SpeakerLight"), 
        Loading = v149:GetIcon("Connecting", "SpeakerLight"), 
        Error = v149:GetIcon("Error", "SpeakerLight")
    };
    v149.PlayerMuteStatusIcons = {
        MicOn = v149:GetIcon("Unmuted0", "MicLight"), 
        MicOff = v149:GetIcon("Muted", "MicLight"), 
        MicDisabled = v149:GetIcon("Muted", "MicLight"), 
        Loading = v149:GetIcon("Connecting", "MicLight"), 
        Error = v149:GetIcon("Error", "MicLight")
    };
    local v154 = false;
    local v155 = v149.attemptVoiceRejoin.Event:Connect(function() --[[ Line: 440 ]]
        -- upvalues: v154 (ref)
        v154 = true;
    end);
    local v156 = if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then v101.Stores.GetVoiceStore(false) else nil;
    v149.coreVoiceManager:subscribe("GetPermissions", function(v157, v158, v159, v160) --[[ Line: 447 ]]
        -- upvalues: v149 (copy)
        local v161 = "VoiceChatServiceManager.requestMicPermission";
        if v149.inExpUpsellEntrypoint ~= nil then
            v161 = v149.inExpUpsellEntrypoint;
        end;
        v149.getPermissionsFunction(v157, v158, v159, v161, v160);
    end);
    v149.coreVoiceManager:subscribe("OnVoiceParticipantRemoved", function(v162) --[[ Line: 454 ]]
        -- upvalues: l_GetFFlagExpChatUseVoiceParticipantsStore_0 (ref), v156 (copy), v101 (ref)
        if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then
            v156.handleVoiceParticipantRemoved(v162);
            return;
        else
            if v101.Events.VoiceParticipantRemoved then
                v101.Events.VoiceParticipantRemoved((tostring(v162)));
            end;
            return;
        end;
    end);
    v149.coreVoiceManager:subscribe("OnVoiceParticipantAdded", function(v163) --[[ Line: 461 ]]
        -- upvalues: l_GetFFlagExpChatUseVoiceParticipantsStore_0 (ref), v156 (copy), v101 (ref)
        if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then
            v156.handleVoiceParticipantAdded(v163);
            return;
        else
            if v101.Events.VoiceParticipantAdded then
                v101.Events.VoiceParticipantAdded((tostring(v163)));
            end;
            return;
        end;
    end);
    v149.coreVoiceManager:subscribe("OnVoiceParticipantToggleMuted", function(v164, v165) --[[ Line: 468 ]]
        -- upvalues: v101 (ref)
        if v101.Events.VoiceParticipantToggleMuted then
            v101.Events.VoiceParticipantToggleMuted(tostring(v164), v165);
        end;
    end);
    if l_GetFFlagShowLikelySpeakingBubbles_0() then
        v149.coreVoiceManager:subscribe("OnLikelySpeakingUsersUpdated", function(v166) --[[ Line: 476 ]]
            -- upvalues: v101 (ref)
            if v101.Events.LikelySpeakingUsersUpdated then
                v101.Events.LikelySpeakingUsersUpdated(v166);
            end;
        end);
        v149.coreVoiceManager:subscribe("OnShowLikelySpeakingBubblesChanged", function(v167) --[[ Line: 484 ]]
            -- upvalues: v101 (ref)
            if v101.Events.ShowLikelySpeakingBubblesChanged then
                v101.Events.ShowLikelySpeakingBubblesChanged(v167);
            end;
        end);
    end;
    v149.coreVoiceManager:subscribe("OnUserAndPlaceCanUseVoiceResolved", function(v168, v169) --[[ Line: 490 ]]
        -- upvalues: v149 (copy)
        v149:_onUserAndPlaceCanUseVoiceResolved(v168, v169);
    end);
    v149.coreVoiceManager:subscribe("OnRequestMicPermissionResolved", function() --[[ Line: 493 ]]
        -- upvalues: v24 (ref), v149 (copy)
        if v24() then
            return v149:CheckAndShowNotAudiblePrompt();
        else
            return;
        end;
    end);
    v149.coreVoiceManager:subscribe("OnRequestMicPermissionRejected", function() --[[ Line: 498 ]]
        -- upvalues: l_GetFFlagEnableSeamlessVoiceV2_0 (ref), v149 (copy), v24 (ref), v46 (ref), v55 (ref), v3 (ref)
        if l_GetFFlagEnableSeamlessVoiceV2_0() and v149:IsSeamlessVoice() then
            v149.deniedMicPermissions = true;
        end;
        if v24() and not v46 then
            if v55 then
                return v149:CheckAndShowPermissionPrompt();
            else
                return v149:CheckAndShowPermissionPrompt():finallyReturn(v3.reject());
            end;
        else
            return;
        end;
    end);
    v149.coreVoiceManager:subscribe("OnDevicePlayerChanged", function() --[[ Line: 511 ]]
        -- upvalues: v149 (copy)
        v149:UpdateAudioDeviceInputDebugger();
    end);
    v149.coreVoiceManager:subscribe("OnDeviceActiveChanged", function() --[[ Line: 514 ]]
        -- upvalues: v149 (copy)
        v149:UpdateAudioDeviceInputDebugger();
    end);
    v149.coreVoiceManager:subscribe("OnDeviceMuteChanged", function() --[[ Line: 517 ]]
        -- upvalues: v149 (copy)
        v149:UpdateAudioDeviceInputDebugger();
    end);
    if l_FFlagEnablePartyVoiceChangersInLua_0 then
        v149.coreVoiceManager:subscribe("OnVoiceChangerChanged", function() --[[ Line: 521 ]]
            -- upvalues: v149 (copy)
            v149:UpdateAudioDeviceInputDebugger();
        end);
    end;
    v149.coreVoiceManager:subscribe("OnStateChanged", function(_, v171) --[[ Line: 525 ]]
        -- upvalues: v98 (ref), v149 (copy), v60 (ref), v56 (ref), v81 (ref)
        v98:setClientSessionId(v149.coreVoiceManager:GetSessionId());
        if v171 == Enum.VoiceChatState.Ended and v149.bannedUntil == nil then
            if not v60() then
                v149:HideVoiceUI();
            end;
            if v56 and v149.runService:IsStudio() then
                return;
            else
                v149:showPrompt(v81.LeaveVoice);
            end;
        end;
    end);
    v149.coreVoiceManager:subscribe("OnPlayerMuted", function() --[[ Line: 538 ]]
        -- upvalues: v149 (copy)
        v149:UpdateAudioDeviceInputDebugger();
    end);
    v149.coreVoiceManager:subscribe("OnAudioDeviceInputAdded", function() --[[ Line: 541 ]]
        -- upvalues: v149 (copy)
        v149:UpdateAudioDeviceInputDebugger();
    end);
    v149.coreVoiceManager:subscribe("OnVoiceChatServiceInitialized", function() --[[ Line: 545 ]]
        -- upvalues: v149 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (ref), v101 (ref), v47 (ref), v17 (ref), v42 (ref), l_AppStorageService_0 (ref), v78 (ref), v81 (ref)
        v149:ShowVoiceUI();
        if l_GetFFlagEnableSeamlessVoiceV2_0() and v149:IsSeamlessVoice() then
            v101.Events.ShowLikelySpeakingBubblesChanged(false);
        end;
        if v47 then
            v17:debug("Simulating join voice");
            v149:simulateVoiceConnectDisconnect();
        end;
        if v42() and not v149.coreVoiceManager.initializedPostSuspension then
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 556 ]]
                -- upvalues: l_AppStorageService_0 (ref), v78 (ref)
                return l_AppStorageService_0:GetItem(v78.VOICE_WITH_TC_TOAST_KEY) == "true";
            end);
            if not (not l_status_1 or l_result_1) then
                v149:showPrompt(v81.UpdateOnAutoJoinToast);
                pcall(function() --[[ Line: 563 ]]
                    -- upvalues: l_AppStorageService_0 (ref), v78 (ref)
                    l_AppStorageService_0:SetItem(v78.VOICE_WITH_TC_TOAST_KEY, "true");
                    l_AppStorageService_0:Flush();
                end);
            end;
        end;
    end);
    v149.coreVoiceManager:subscribe("OnAudioDeviceInputRemoved", function() --[[ Line: 571 ]]
        -- upvalues: v149 (copy)
        v149:UpdateAudioDeviceInputDebugger();
    end);
    v149.coreVoiceManager:subscribe("OnInitialJoinFailed", function() --[[ Line: 574 ]]
        -- upvalues: v149 (copy)
        v149:InitialJoinFailedPrompt();
    end);
    v149.coreVoiceManager:subscribe("OnPlayerModerated", function() --[[ Line: 577 ]]
        -- upvalues: v149 (copy)
        v149:ShowPlayerModeratedMessage();
    end);
    v149.coreVoiceManager:subscribe("OnRetryRequested", function() --[[ Line: 581 ]]
        -- upvalues: v149 (copy), v81 (ref)
        v149:showPrompt(v81.Retry);
    end);
    v149.coreVoiceManager:subscribe("OnVoiceToxicityModal", function() --[[ Line: 584 ]]
        -- upvalues: v17 (ref), v149 (copy), v81 (ref)
        v17:debug("Showing Voice Toxicity Modal");
        v149:showPrompt(v81.VoiceToxicityModal);
    end);
    v149.coreVoiceManager:subscribe("OnVoiceToxicityToast", function() --[[ Line: 588 ]]
        -- upvalues: v17 (ref), v149 (copy), v81 (ref)
        v17:debug("Showing Voice Toxicity Toast");
        v149:showPrompt(v81.VoiceToxicityToast);
    end);
    v149.coreVoiceManager:subscribe("OnPermissionRequested", function() --[[ Line: 592 ]]
        -- upvalues: l_GetFFlagShowDevicePermissionsModal_0 (ref), v149 (copy), v81 (ref)
        if l_GetFFlagShowDevicePermissionsModal_0() then
            v149:showPrompt(v81.DevicePermissionsModal);
            return;
        else
            v149:showPrompt(v81.Permission);
            return;
        end;
    end);
    v149.coreVoiceManager:subscribe("OnShowDataConsentToast", function() --[[ Line: 599 ]]
        -- upvalues: v34 (ref), v149 (copy)
        if v34() then
            v149:showDataConsentToast();
        end;
    end);
    v149.coreVoiceManager:subscribe("OnVoiceReverseNudgeIconColorChange", function(v174) --[[ Line: 604 ]]
        -- upvalues: v17 (ref), v101 (ref), v149 (copy)
        v17:debug("Showing Reverse Nudge Icon Color Change");
        if v101.Events.AddReverseNudgeToxicUser and v101.Events.RemoveReverseNudgeToxicUser then
            v149:AddReverseNudgeToxicUser(v174.toxicUserId, v101.Events.AddReverseNudgeToxicUser, v101.Events.RemoveReverseNudgeToxicUser);
        end;
    end);
    v149.coreVoiceManager.setVoiceUIVisibility.Event:Connect(function(v175) --[[ Line: 614 ]]
        -- upvalues: v149 (copy)
        if v175 then
            v149:ShowVoiceUI();
            return;
        else
            v149:HideVoiceUI();
            return;
        end;
    end);
    v149.coreVoiceManager:subscribe("OnVoiceJoin", function() --[[ Line: 621 ]]
        -- upvalues: l_GetFFlagNonVoiceFTUX_0 (ref), v149 (copy), v42 (ref), v23 (ref), v81 (ref), l_GetFFlagEnableSeamlessVoiceV2_0 (ref), v101 (ref), v52 (ref), l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0 (ref), l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0 (ref), l_default_1 (ref), v154 (ref), v155 (copy)
        if l_GetFFlagNonVoiceFTUX_0() and v149.hasLeftFTUX then
            v149.hasLeftFTUX = false;
            if v42() then
                v149:showJoinVoicePrompt();
            elseif v23() then
                v149:showPrompt(v81.UnifiedJoinVoiceToast);
            else
                v149:showPrompt(v81.JoinedVoiceToast);
            end;
            v149.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxLeaveEvent", v149:GetConnectDisconnectAnalyticsData());
        elseif l_GetFFlagEnableSeamlessVoiceV2_0() and v149:IsSeamlessVoice() then
            v101.Events.ShowLikelySpeakingBubblesChanged(false);
            if v42() then
                v149:showJoinVoicePrompt();
            elseif v23() then
                v149:showPrompt(v81.UnifiedJoinVoiceToast);
            elseif v52 and v149.isInitialJoin then
                v149:showPrompt(v81.JoinedVoiceToast);
            else
                v149:showPrompt(v81.JoinVoice);
            end;
            v149:SetVoiceConnectCookieValue(true);
        else
            v149:showPrompt(v81.VoiceConsentAcceptedToast);
        end;
        if l_GetFFlagEnableVoiceChatMuteForVideoCaptures_0() and v149.CaptureService:IsCapturingVideo() then
            if l_GetFFlagEnableCrossExperienceVoiceCaptureMute_0() then
                l_default_1:MuteAll("Capture");
                v149:HideVoiceUI();
            else
                v149:MuteAll(true, "Capture");
                v149:HideVoiceUI();
            end;
        end;
        if v154 then
            v149.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", v149:GetConnectDisconnectAnalyticsData());
            v155:Disconnect();
        end;
    end);
    return v149;
end;
local function _(v176) --[[ Line: 673 ]] --[[ Name: shorten ]]
    return "..." .. string.sub(tostring(v176), -4);
end;
local function _(v178, v179) --[[ Line: 677 ]] --[[ Name: bind ]]
    return function(...) --[[ Line: 678 ]]
        -- upvalues: v178 (copy), v179 (copy)
        return v178[v179](v178, ...);
    end;
end;
v124.subscribe = function(v181, v182, v183) --[[ Line: 683 ]] --[[ Name: subscribe ]]
    return v181.coreVoiceManager:subscribe(v182, v183);
end;
v124._reportJoinFailed = function(v184, v185, v186) --[[ Line: 687 ]] --[[ Name: _reportJoinFailed ]]
    return v184.coreVoiceManager:_reportJoinFailed(v185, v186);
end;
v124._asyncInit = function(v187) --[[ Line: 691 ]] --[[ Name: _asyncInit ]]
    return v187.coreVoiceManager:_asyncInit();
end;
v124.asyncInit = function(v188) --[[ Line: 695 ]] --[[ Name: asyncInit ]]
    return v188.coreVoiceManager:asyncInit();
end;
v124.CheckAudioInputExists = function(v189) --[[ Line: 699 ]] --[[ Name: CheckAudioInputExists ]]
    return v189.coreVoiceManager:CheckAudioInputExists();
end;
v124.getService = function(v190) --[[ Line: 703 ]] --[[ Name: getService ]]
    return v190.service;
end;
v124.GetMutedAnyone = function(v191) --[[ Line: 707 ]] --[[ Name: GetMutedAnyone ]]
    return v191.coreVoiceManager:GetMutedAnyone();
end;
v124.GetRequest = function(v192, v193, v194) --[[ Line: 711 ]] --[[ Name: GetRequest ]]
    return v192.coreVoiceManager:GetRequest(v193, v194);
end;
v124.PostRequest = function(v195, v196, _, v198) --[[ Line: 715 ]] --[[ Name: PostRequest ]]
    -- upvalues: l_HttpService_0 (copy)
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 716 ]]
        -- upvalues: v195 (copy), v196 (copy), v198 (copy), l_HttpService_0 (ref)
        local v199 = v195.HttpRbxApiService:PostAsyncFullUrl(v196, v198, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson, Enum.HttpRequestType.Players);
        return l_HttpService_0:JSONDecode(v199);
    end);
    return l_status_2 and l_result_2;
end;
v124._GetShowAgeVerificationOverlay = function(v202, v203) --[[ Line: 737 ]] --[[ Name: _GetShowAgeVerificationOverlay ]]
    return v202.coreVoiceManager:_GetShowAgeVerificationOverlay(v203);
end;
v124.simulateVoiceConnectDisconnect = function(v204) --[[ Line: 741 ]] --[[ Name: simulateVoiceConnectDisconnect ]]
    -- upvalues: v51 (copy), v17 (copy)
    task.spawn(function() --[[ Line: 742 ]]
        -- upvalues: v51 (ref), v204 (copy), v17 (ref)
        while true do
            task.wait(v51);
            if v204.voiceUIVisible then
                v17:debug("Hiding Voice");
                v204:HideVoiceUI();
            else
                v17:debug("Showing Voice");
                v204:ShowVoiceUI();
            end;
        end;
    end);
end;
v124.FetchAgeVerificationOverlay = function(v205, v206) --[[ Line: 756 ]] --[[ Name: FetchAgeVerificationOverlay ]]
    return v205.coreVoiceManager:FetchAgeVerificationOverlay(v206);
end;
v124.FetchPhoneVerificationUpsell = function(v207, v208, v209, v210) --[[ Line: 760 ]] --[[ Name: FetchPhoneVerificationUpsell ]]
    return v207.coreVoiceManager:FetchPhoneVerificationUpsell(v208, v209, v210);
end;
v124.RecordUserSeenModal = function(v211, v212) --[[ Line: 768 ]] --[[ Name: RecordUserSeenModal ]]
    -- upvalues: l_PostRecordUserSeenGeneralModal_0 (copy)
    local l_l_PostRecordUserSeenGeneralModal_0_0 = l_PostRecordUserSeenGeneralModal_0;
    local v214 = "PostRequest";
    return l_l_PostRecordUserSeenGeneralModal_0_0(function(...) --[[ Line: 678 ]]
        -- upvalues: v211 (copy), v214 (copy)
        return v211[v214](v211, ...);
    end, v212);
end;
v124.checkAndUpdateSequence = function(v215, v216, v217) --[[ Line: 772 ]] --[[ Name: checkAndUpdateSequence ]]
    return v215.coreVoiceManager:checkAndUpdateSequence(v216, v217);
end;
v124.onMissedSequence = function(v218, v219) --[[ Line: 776 ]] --[[ Name: onMissedSequence ]]
    return v218.coreVoiceManager:onMissedSequence(v219);
end;
v124.watchSignalR = function(v220) --[[ Line: 780 ]] --[[ Name: watchSignalR ]]
    return v220.coreVoiceManager:watchSignalR();
end;
v124.voicePermissionGranted = function(v221, v222) --[[ Line: 788 ]] --[[ Name: voicePermissionGranted ]]
    return v221.coreVoiceManager:voicePermissionGranted(v222);
end;
v124.GetSignalREvent = function(v223, v224) --[[ Line: 792 ]] --[[ Name: GetSignalREvent ]]
    return v223.coreVoiceManager:GetSignalREvent(v224);
end;
v124.avatarChatUserAndPlaceSettingsValueOfClientFeatures = function(v225, v226) --[[ Line: 797 ]] --[[ Name: avatarChatUserAndPlaceSettingsValueOfClientFeatures ]]
    return v225.coreVoiceManager:avatarChatUserAndPlaceSettingsValueOfClientFeatures(v226);
end;
v124.resolveAvatarChatUserAndPlaceSettings = function(v227) --[[ Line: 801 ]] --[[ Name: resolveAvatarChatUserAndPlaceSettings ]]
    return v227.coreVoiceManager:resolveAvatarChatUserAndPlaceSettings();
end;
v124.EnableVoice = function(v228) --[[ Line: 805 ]] --[[ Name: EnableVoice ]]
    return v228.coreVoiceManager:EnableVoice();
end;
v124._VoiceChatFirstTimeUX = function(v229, v230) --[[ Line: 809 ]] --[[ Name: _VoiceChatFirstTimeUX ]]
    -- upvalues: v78 (copy), v17 (copy), l_GetFFlagNonVoiceFTUX_0 (copy), v101 (copy), l_GetFFlagEnableFtuxExitOnMuteToggle_0 (copy), v63 (copy), v49 (copy), v81 (copy)
    local v231 = nil;
    local v232 = nil;
    if not pcall(function() --[[ Line: 811 ]]
        -- upvalues: v230 (copy), v78 (ref), v231 (ref), v232 (ref)
        local l_v230_Item_0 = v230:GetItem(v78.SEAMLESS_VOICE_FTUX_KEY);
        local l_v230_Item_1 = v230:GetItem(v78.SEAMLESS_VOICE_STUX_KEY);
        v231 = l_v230_Item_0 == "true";
        v232 = l_v230_Item_1 == nil and 0 or tonumber(l_v230_Item_1);
    end) then
        v17:warning("Failed to read FTUX/STUX from AppStorage");
        return;
    else
        v17:trace("hasShownFTUX: {}. STUXCount: {}", v231, v232);
        if not v231 then
            v17:debug("Showing FTUX");
            v229.isShowingFTUX = true;
            v229.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxJoinEvent", v229:GetConnectDisconnectAnalyticsData());
            if l_GetFFlagNonVoiceFTUX_0() then
                v101.Events.VoiceUIVisibilityChanged(true);
            else
                v229:MuteAll(true, "FTUX");
                if v101.Events.ShowLikelySpeakingBubblesChanged and v101.Events.LikelySpeakingUsersUpdated then
                    v17:debug("Showing likely speaking bubbles");
                    local v235 = {};
                    v101.Events.ShowLikelySpeakingBubblesChanged(true);
                    local v236 = v229.participants or {};
                    for v237 in v236 do
                        v235[v237] = true;
                    end;
                    v101.Events.LikelySpeakingUsersUpdated(v235);
                    v236 = v229.participantJoined.Event:Connect(function(v238) --[[ Line: 848 ]]
                        -- upvalues: v235 (copy), v101 (ref)
                        v235[v238] = true;
                        v101.Events.LikelySpeakingUsersUpdated(v235);
                    end);
                    v229.hideFTUXSignal.Event:Connect(function() --[[ Line: 852 ]]
                        -- upvalues: v236 (copy), v101 (ref)
                        v236:Disconnect();
                        v101.Events.ShowLikelySpeakingBubblesChanged(false);
                        v101.Events.LikelySpeakingUsersUpdated({});
                    end);
                    v229.hideVoiceUI.Event:Once(function() --[[ Line: 857 ]]
                        -- upvalues: v101 (ref)
                        v101.Events.ShowLikelySpeakingBubblesChanged(false);
                        v101.Events.LikelySpeakingUsersUpdated({});
                    end);
                    v229.muteAllChanged.Event:Once(function() --[[ Line: 861 ]]
                        -- upvalues: v229 (copy), v230 (copy)
                        v229:HideFTUX(v230);
                        v229.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxLeaveEvent", v229:GetConnectDisconnectAnalyticsData());
                    end);
                    v229.talkingChanged.Event:Once(function() --[[ Line: 868 ]]
                        -- upvalues: v229 (copy), v230 (copy)
                        v229:HideFTUX(v230);
                    end);
                    if l_GetFFlagEnableFtuxExitOnMuteToggle_0() then
                        v229.coreVoiceManager.onPlayerMuteToggled.Event:Once(function() --[[ Line: 872 ]]
                            -- upvalues: v229 (copy), v230 (copy)
                            v229:HideFTUX(v230);
                        end);
                    end;
                end;
            end;
        elseif v232 < v63 and (not v49 or v229:GetVoiceConnectCookieValue()) then
            v17:debug("Showing STUX");
            v229:showPrompt(v81.JoinVoiceSTUX);
            pcall(function() --[[ Line: 884 ]]
                -- upvalues: v230 (copy), v78 (ref), v232 (ref)
                v230:SetItem(v78.SEAMLESS_VOICE_STUX_KEY, (tostring(v232 + 1)));
                v230:Flush();
            end);
        end;
        return;
    end;
end;
v124.VoiceChatFirstTimeUX = function(v239, v240) --[[ Line: 891 ]] --[[ Name: VoiceChatFirstTimeUX ]]
    -- upvalues: v49 (copy), v17 (copy), v48 (copy), v68 (copy), v78 (copy), l_GetFFlagNonVoiceFTUX_0 (copy)
    if v49 and not v239:verifyUniverseAndPlaceCanUseVoice() then
        v17:debug("Universe/place is not voice enabled, do not run FTUX/STUX");
        return;
    else
        if not v48 then
            local v241 = v239:FetchAgeVerificationOverlay();
            if v68 then
                if type(v241) == "table" and v241.voiceSettings and v241.voiceSettings.seamlessVoiceStatus ~= v78.SEAMLESS_VOICE_STATUS_ENABLED_NEW_USER then
                    v17:debug("User not eligible for FTUX/STUX");
                    return;
                end;
            elseif v241.voiceSettings and v241.voiceSettings.seamlessVoiceStatus ~= v78.SEAMLESS_VOICE_STATUS_ENABLED_NEW_USER then
                v17:debug("User not eligible for FTUX/STUX");
                return;
            end;
        end;
        local function _() --[[ Line: 922 ]] --[[ Name: startFTUX ]]
            -- upvalues: v17 (ref), v239 (copy), v240 (copy)
            v17:debug("Starting FTUX");
            v239:_VoiceChatFirstTimeUX(v240);
        end;
        if l_GetFFlagNonVoiceFTUX_0() then
            v17:debug("Starting FTUX");
            v239:_VoiceChatFirstTimeUX(v240);
            return;
        else
            v239:asyncInit():andThen(function() --[[ Line: 930 ]]
                -- upvalues: v239 (copy), v17 (ref), v240 (copy)
                local v243 = nil;
                if v239.service.VoiceChatState and v239.service.VoiceChatState == Enum.VoiceChatState.Joined then
                    v17:debug("Starting FTUX");
                    v239:_VoiceChatFirstTimeUX(v240);
                end;
                v243 = v239.service.StateChanged:Connect(function(_, v245) --[[ Line: 938 ]]
                    -- upvalues: v17 (ref), v239 (ref), v240 (ref), v243 (ref)
                    if v245 == Enum.VoiceChatState.Joined then
                        v17:debug("Starting FTUX");
                        v239:_VoiceChatFirstTimeUX(v240);
                        v243:Disconnect();
                    end;
                end);
            end):catch(function(v246) --[[ Line: 945 ]]
                -- upvalues: v17 (ref)
                v17:trace("Failed to start FTUX: {}", v246);
            end);
            return;
        end;
    end;
end;
v124.HideFTUX = function(v247, v248) --[[ Line: 951 ]] --[[ Name: HideFTUX ]]
    -- upvalues: v78 (copy), l_GetFFlagNonVoiceFTUX_0 (copy), v81 (copy)
    v247.isShowingFTUX = false;
    v247.hideFTUXSignal:Fire();
    pcall(function() --[[ Line: 954 ]]
        -- upvalues: v248 (copy), v78 (ref)
        v248:SetItem(v78.SEAMLESS_VOICE_FTUX_KEY, "true");
        v248:Flush();
    end);
    if l_GetFFlagNonVoiceFTUX_0() then
        v247.hasLeftFTUX = true;
        v247.attemptVoiceRejoin:Fire();
    end;
    if not l_GetFFlagNonVoiceFTUX_0() then
        v247:MuteAll(false, "FTUX");
        v247:showPrompt(v81.JoinedVoiceToast);
    end;
end;
v124._onUserAndPlaceCanUseVoiceResolved = function(v249, v250, v251) --[[ Line: 968 ]] --[[ Name: _onUserAndPlaceCanUseVoiceResolved ]]
    -- upvalues: l_GetInformedOfBan_0 (copy), l_GetFFlagAvatarChatServiceEnabled_0 (copy), l_GetFFlagVoiceChatServiceManagerUseAvatarChat_0 (copy), v81 (copy), l_BAN_REASON_0 (copy), v25 (copy)
    v249.bannedUntil = nil;
    if v250 and v250.isBanned then
        local l_l_GetInformedOfBan_0_0 = l_GetInformedOfBan_0;
        local v253 = "GetRequest";
        l_l_GetInformedOfBan_0_0 = l_l_GetInformedOfBan_0_0(function(...) --[[ Line: 678 ]]
            -- upvalues: v249 (copy), v253 (copy)
            return v249[v253](v249, ...);
        end);
        if l_l_GetInformedOfBan_0_0 and not l_l_GetInformedOfBan_0_0.informedOfBan then
            if l_GetFFlagAvatarChatServiceEnabled_0() and l_GetFFlagVoiceChatServiceManagerUseAvatarChat_0() and v250.bannedUntil == nil then
                v249:ShowPlayerModeratedMessage();
            elseif v250.bannedUntil == nil then
                v249:showPrompt(v81.VoiceChatSuspendedPermanent);
            else
                v249.bannedUntil = v250.bannedUntil;
                if v250.banReason == l_BAN_REASON_0.NUDGE_V3 then
                    v249:showPrompt(v81.VoiceChatSuspendedTemporaryB);
                else
                    v249:showPrompt(v81.VoiceChatSuspendedTemporary);
                end;
            end;
        end;
        if l_l_GetInformedOfBan_0_0 and l_l_GetInformedOfBan_0_0.informedOfBan then
            v249:ShowPlayerModeratedMessage(true);
            return;
        end;
    elseif v249.runService:IsStudio() and v250 and not v250.isVoiceEnabled then
        v249:showPrompt(v81.User);
        return;
    elseif v249.runService:IsStudio() and v251 and not v251.isPlaceEnabledForVoice then
        v249:showPrompt(v81.Place, v25() and table.concat(v251.reasons or {}, "") or nil);
    end;
end;
v124.ChangeVoiceJoinProgress = function(v254, v255) --[[ Line: 1012 ]] --[[ Name: ChangeVoiceJoinProgress ]]
    return v254.coreVoiceManager:ChangeVoiceJoinProgress(v255);
end;
v124.GetVoiceJoinProgress = function(v256) --[[ Line: 1016 ]] --[[ Name: GetVoiceJoinProgress ]]
    return v256.coreVoiceManager.VoiceJoinProgress;
end;
v124.UserOnlyEligibleForVoice = function(v257) --[[ Line: 1020 ]] --[[ Name: UserOnlyEligibleForVoice ]]
    return v257.coreVoiceManager:UserOnlyEligibleForVoice();
end;
v124.UserOnlyEligibleForVoiceViaOverlay = function(v258) --[[ Line: 1024 ]] --[[ Name: UserOnlyEligibleForVoiceViaOverlay ]]
    return v258.coreVoiceManager:UserOnlyEligibleForVoiceViaOverlay();
end;
v124.UserVoiceEnabled = function(v259) --[[ Line: 1028 ]] --[[ Name: UserVoiceEnabled ]]
    return v259.coreVoiceManager:UserVoiceEnabled();
end;
v124.UserInInExperienceUpsellTreatment = function(v260) --[[ Line: 1032 ]] --[[ Name: UserInInExperienceUpsellTreatment ]]
    return v260.coreVoiceManager:UserInInExperienceUpsellTreatment();
end;
v124.UserEligibleForInExperienceUpsell = function(v261) --[[ Line: 1036 ]] --[[ Name: UserEligibleForInExperienceUpsell ]]
    return v261.coreVoiceManager:UserEligibleForInExperienceUpsell();
end;
v124.UserEligibleForLikelySpeakingBubbles = function(v262) --[[ Line: 1040 ]] --[[ Name: UserEligibleForLikelySpeakingBubbles ]]
    return v262.coreVoiceManager:UserEligibleForLikelySpeakingBubbles();
end;
v124.ShowInExperienceVoiceUpsell = function(v263, v264) --[[ Line: 1044 ]] --[[ Name: ShowInExperienceVoiceUpsell ]]
    local l_showVoiceInExperienceUpsellVariant_0 = v263:FetchAgeVerificationOverlay().showVoiceInExperienceUpsellVariant;
    v263:SetInExpUpsellEntrypoint(v264);
    v263:showPrompt((v263:GetInExpUpsellPromptFromEnum(l_showVoiceInExperienceUpsellVariant_0)));
end;
v124.ShowInExperiencePhoneVoiceUpsell = function(v266, v267, v268) --[[ Line: 1054 ]] --[[ Name: ShowInExperiencePhoneVoiceUpsell ]]
    -- upvalues: v104 (copy), l_GetFFlagInExperiencePhoneUpsellNewCopy_0 (copy), l_GetFFlagShowLikelySpeakingBubbles_0 (copy), v101 (copy), v105 (copy), v78 (copy), v81 (copy)
    v266:SetInExpUpsellEntrypoint(v267);
    v104.openPhoneUpsell({
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
        onSuccessBeforeToast = function() --[[ Line: 1071 ]] --[[ Name: onSuccessBeforeToast ]]
            -- upvalues: v266 (copy), l_GetFFlagShowLikelySpeakingBubbles_0 (ref), v101 (ref), v105 (ref), v268 (copy)
            v266.coreVoiceManager:DisablePhoneVerificationUpsell();
            if l_GetFFlagShowLikelySpeakingBubbles_0() and v101.Events.ShowLikelySpeakingBubblesChanged then
                v101.Events.ShowLikelySpeakingBubblesChanged(false);
            end;
            local l_v105_0 = v105;
            local l_v266_0 = v266;
            local v271 = "PostRequest";
            l_v105_0(function(...) --[[ Line: 678 ]]
                -- upvalues: l_v266_0 (copy), v271 (copy)
                return l_v266_0[v271](l_v266_0, ...);
            end, v268, os.time(), false);
        end, 
        onSuccess = function() --[[ Line: 1078 ]] --[[ Name: onSuccess ]]
            -- upvalues: v266 (copy)
            v266:EnableVoice();
        end, 
        closeUpsell = function() --[[ Line: 1081 ]] --[[ Name: closeUpsell ]]
            -- upvalues: l_GetFFlagShowLikelySpeakingBubbles_0 (ref), v101 (ref), v267 (copy), v78 (ref), v266 (copy), v81 (ref), v105 (ref), v268 (copy)
            if l_GetFFlagShowLikelySpeakingBubbles_0() and v101.Events.ShowLikelySpeakingBubblesChanged then
                v101.Events.ShowLikelySpeakingBubblesChanged(false);
            end;
            if v267 ~= v78.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
                v266:showPrompt(v81.VoiceConsentDeclinedToast);
            end;
            local l_v105_1 = v105;
            local l_v266_1 = v266;
            local v274 = "PostRequest";
            l_v105_1(function(...) --[[ Line: 678 ]]
                -- upvalues: l_v266_1 (copy), v274 (copy)
                return l_v266_1[v274](l_v266_1, ...);
            end, v268, os.time(), true);
        end
    });
end;
v124.DisablePhoneVerificationUpsell = function(v275) --[[ Line: 1093 ]] --[[ Name: DisablePhoneVerificationUpsell ]]
    v275.coreVoiceManager:DisablePhoneVerificationUpsell();
end;
v124.SetInExpUpsellEntrypoint = function(v276, v277) --[[ Line: 1097 ]] --[[ Name: SetInExpUpsellEntrypoint ]]
    v276.inExpUpsellEntrypoint = v277;
end;
v124.userAndPlaceCanUseVoice = function(v278) --[[ Line: 1101 ]] --[[ Name: userAndPlaceCanUseVoice ]]
    return v278.coreVoiceManager:userAndPlaceCanUseVoice();
end;
v124.verifyUniverseAndPlaceCanUseVoice = function(v279) --[[ Line: 1105 ]] --[[ Name: verifyUniverseAndPlaceCanUseVoice ]]
    return v279.coreVoiceManager:verifyUniverseAndPlaceCanUseVoice();
end;
v124.GetVoiceConnectCookieValue = function(v280) --[[ Line: 1109 ]] --[[ Name: GetVoiceConnectCookieValue ]]
    return v280.coreVoiceManager:GetVoiceConnectCookieValue();
end;
v124.GetVoiceConnectCookie = function(v281) --[[ Line: 1113 ]] --[[ Name: GetVoiceConnectCookie ]]
    return v281.coreVoiceManager:GetVoiceConnectCookie();
end;
v124.SetVoiceConnectCookieValue = function(v282, v283) --[[ Line: 1117 ]] --[[ Name: SetVoiceConnectCookieValue ]]
    return v282.coreVoiceManager:SetVoiceConnectCookieValue(v283);
end;
v124.SetNewUserFTUXCookieValue = function(v284, v285) --[[ Line: 1121 ]] --[[ Name: SetNewUserFTUXCookieValue ]]
    return v284.coreVoiceManager:SetNewUserFTUXCookieValue(v285);
end;
v124.ShowPlayerModeratedMessage = function(v286, v287) --[[ Line: 1125 ]] --[[ Name: ShowPlayerModeratedMessage ]]
    -- upvalues: l_GetUserSettings_0 (copy), l_Analytics_0 (copy), v81 (copy), l_BAN_REASON_0 (copy)
    local l_l_GetUserSettings_0_0 = l_GetUserSettings_0;
    local v289 = "GetRequest";
    l_l_GetUserSettings_0_0 = l_l_GetUserSettings_0_0(function(...) --[[ Line: 678 ]]
        -- upvalues: v286 (copy), v289 (copy)
        return v286[v289](v286, ...);
    end);
    if not l_l_GetUserSettings_0_0 or not l_l_GetUserSettings_0_0.isBanned then
        v286:_reportJoinFailed("PlayerModeratedBadState", l_Analytics_0.ERROR);
        return;
    else
        v286.banReason = l_l_GetUserSettings_0_0.banReason;
        if l_l_GetUserSettings_0_0.bannedUntil == nil then
            v286:showPrompt(v81.VoiceChatSuspendedPermanent);
            return;
        else
            v286.bannedUntil = l_l_GetUserSettings_0_0.bannedUntil;
            if v287 then
                v286:showPrompt(v81.VoiceChatSuspendedTemporaryToast);
                return;
            elseif v286.banReason == l_BAN_REASON_0.NUDGE_V3 then
                v286:showPrompt(v81.VoiceChatSuspendedTemporaryB);
                return;
            else
                v286:showPrompt(v81.VoiceChatSuspendedTemporary);
                return;
            end;
        end;
    end;
end;
v124.CheckCallState = function(v290) --[[ Line: 1150 ]] --[[ Name: CheckCallState ]]
    return v290.coreVoiceManager:CheckCallState();
end;
v124.ShowVoiceChatLoadingMessage = function(v291) --[[ Line: 1154 ]] --[[ Name: ShowVoiceChatLoadingMessage ]]
    -- upvalues: v81 (copy)
    v291:showPrompt(v81.VoiceLoading);
end;
v124.requestMicPermission = function(v292) --[[ Line: 1158 ]] --[[ Name: requestMicPermission ]]
    return v292.coreVoiceManager:requestMicPermission();
end;
v124.canUseServiceAsync = function(v293) --[[ Line: 1162 ]] --[[ Name: canUseServiceAsync ]]
    return v293.coreVoiceManager:canUseServiceAsync();
end;
v124.canUseService = function(v294) --[[ Line: 1167 ]] --[[ Name: canUseService ]]
    -- upvalues: l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy), l_VOICE_CHAT_AVAILABILITY_0 (copy)
    if v294.available ~= nil or not game:GetEngineFeature("VoiceChatSupported") then
        return false;
    else
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 1171 ]]
            -- upvalues: l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref)
            local l_l_HttpRbxApiService_0_AsyncFullUrl_0 = l_HttpRbxApiService_0:GetAsyncFullUrl("https://voice.roblox.com/v1/settings", Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players);
            return l_HttpService_0:JSONDecode(l_l_HttpRbxApiService_0_AsyncFullUrl_0);
        end);
        local v298 = l_status_3 and l_result_3.isVoiceEnabled;
        if not v298 then
            v294.available = l_VOICE_CHAT_AVAILABILITY_0.UserNotAvailable;
        end;
        return v298;
    end;
end;
v124.ensureInitialized = function(v299, v300) --[[ Line: 1187 ]] --[[ Name: ensureInitialized ]]
    return v299.coreVoiceManager:ensureInitialized(v300);
end;
v124.GetSessionId = function(v301) --[[ Line: 1192 ]] --[[ Name: GetSessionId ]]
    return v301.coreVoiceManager:GetSessionId();
end;
v124.GetChannelId = function(v302) --[[ Line: 1196 ]] --[[ Name: GetChannelId ]]
    return v302.coreVoiceManager:GetChannelId();
end;
v124.JoinWithVoiceMuteData = function(v303, v304) --[[ Line: 1200 ]] --[[ Name: JoinWithVoiceMuteData ]]
    return v303.coreVoiceManager:JoinWithVoiceMuteData(v304);
end;
v124.calculateBanDuration = function(_, v306, v307) --[[ Line: 1204 ]] --[[ Name: calculateBanDuration ]]
    return (math.ceil((v307 - v306) / 60));
end;
v124.ShowVoiceUI = function(v308) --[[ Line: 1208 ]] --[[ Name: ShowVoiceUI ]]
    -- upvalues: v101 (copy)
    v308.voiceUIVisible = true;
    v308.showVoiceUI:Fire();
    if v101.Events.VoiceUIVisibilityChanged then
        v101.Events.VoiceUIVisibilityChanged(true);
    end;
end;
v124.HideVoiceUI = function(v309) --[[ Line: 1217 ]] --[[ Name: HideVoiceUI ]]
    -- upvalues: v101 (copy)
    v309.voiceUIVisible = false;
    v309.hideVoiceUI:Fire();
    if v101.Events.VoiceUIVisibilityChanged then
        v101.Events.VoiceUIVisibilityChanged(false);
    end;
end;
v124.createPromptInstance = function(v310, v311, v312) --[[ Line: 1226 ]] --[[ Name: createPromptInstance ]]
    -- upvalues: v25 (copy), v81 (copy), l_LocalizationService_0 (copy), l_GetFFlagShowDevicePermissionsModal_0 (copy), l_FFlagEnableRetryForLinkingProtocolFetch_0 (copy), l_FIntLinkingProtocolFetchRetries_0 (copy), l_default_2 (copy), l_SettingsRoute_0 (copy), l_FIntLinkingProtocolFetchTimeoutMS_0 (copy), v4 (copy), v79 (copy), l_Analytics_0 (copy), l_PostInformedOfBan_0 (copy), v78 (copy), l_GetFFlagShowLikelySpeakingBubbles_0 (copy), v101 (copy), v53 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), v17 (copy), v43 (copy), l_CoreGui_0 (copy)
    if v310.promptSignal then
        v310.promptSignal:Destroy();
        v310.promptSignal = nil;
    end;
    v310.promptSignal = Instance.new("BindableEvent");
    local v313 = nil;
    if v25() then
        v313 = v310.errorText;
    end;
    local v314 = v312 == v81.VoiceChatSuspendedTemporaryB;
    local v315 = "";
    if v310.bannedUntil ~= nil then
        v315 = if v314 then tostring((v310:calculateBanDuration(DateTime.now().UnixTimestamp, v310.bannedUntil.Seconds))) else DateTime.fromUnixTimestamp(v310.bannedUntil.Seconds):FormatLocalTime("l LT", l_LocalizationService_0.RobloxLocaleId);
    end;
    local v316 = true;
    if v312 ~= v81.VoiceToxicityModal then
        v316 = v312 == v81.VoiceToxicityToast;
    end;
    local v317 = true;
    if v312 ~= v81.VoiceConsentModalV1 then
        v317 = true;
        if v312 ~= v81.VoiceConsentModalV2 then
            v317 = v312 == v81.VoiceConsentModalV3;
        end;
    end;
    local v318 = false;
    local v319 = nil;
    if l_GetFFlagShowDevicePermissionsModal_0() and v312 == v81.DevicePermissionsModal and v310.settingsAppAvailable == nil then
        if l_FFlagEnableRetryForLinkingProtocolFetch_0 then
            for _ = 0, l_FIntLinkingProtocolFetchRetries_0 do
                local v323 = task.spawn(function() --[[ Line: 1271 ]]
                    -- upvalues: v318 (ref), v319 (ref), l_default_2 (ref), l_SettingsRoute_0 (ref)
                    local v321, v322 = l_default_2:supportsSwitchToSettingsApp(l_SettingsRoute_0.Microphone):await();
                    v318 = v321;
                    v319 = v322;
                end);
                task.wait(l_FIntLinkingProtocolFetchTimeoutMS_0 / 1000);
                task.cancel(v323);
                if v319 ~= nil then
                    break;
                end;
            end;
        else
            local v324, v325 = l_default_2:supportsSwitchToSettingsApp(l_SettingsRoute_0.Microphone):await();
            v318 = v324;
            v319 = v325;
        end;
        v310.settingsAppAvailable = v318 and v319;
    end;
    v310.voiceChatPromptInstance = v4.mount(v4.createElement(v79, {
        Analytics = l_Analytics_0.new(), 
        promptSignal = v310.promptSignal.Event, 
        bannedUntil = v315, 
        policyMapper = v310.policyMapper, 
        errorText = v313, 
        onReadyForSignal = v311, 
        VoiceChatServiceManager = v310, 
        settingsAppAvailable = v310.settingsAppAvailable ~= nil and v310.settingsAppAvailable, 
        onContinueFunc = (not (v312 ~= v81.VoiceChatSuspendedTemporary) or v314) and function() --[[ Line: 1304 ]]
            -- upvalues: l_PostInformedOfBan_0 (ref), v310 (copy)
            local l_l_PostInformedOfBan_0_0 = l_PostInformedOfBan_0;
            local l_v310_0 = v310;
            local v328 = "PostRequest";
            l_l_PostInformedOfBan_0_0(function(...) --[[ Line: 678 ]]
                -- upvalues: l_v310_0 (copy), v328 (copy)
                return l_v310_0[v328](l_v310_0, ...);
            end, true);
        end or v316 and function() --[[ Line: 1307 ]]
            -- upvalues: v310 (copy)
            v310.Analytics:reportClosedNudge(v310:GetNudgeAnalyticsData());
        end or v317 and function() --[[ Line: 1310 ]]
            -- upvalues: v310 (copy), v78 (ref), l_GetFFlagShowLikelySpeakingBubbles_0 (ref), v101 (ref)
            v310:RecordUserSeenModal(v78.MODAL_IDS.IN_EXP_UPSELL);
            if l_GetFFlagShowLikelySpeakingBubbles_0() and v101.Events.ShowLikelySpeakingBubblesChanged then
                v101.Events.ShowLikelySpeakingBubblesChanged(false);
            end;
        end or nil, 
        onPrimaryActivated = v316 and function() --[[ Line: 1321 ]]
            -- upvalues: v310 (copy)
            v310.Analytics:reportAcknowledgedNudge(v310:GetNudgeAnalyticsData());
        end or not v53 and l_GetFFlagJoinWithoutMicPermissions_0() and v312 == v81.Permission and function() --[[ Line: 1328 ]]
            -- upvalues: l_default_2 (ref), v17 (ref)
            local v329 = l_default_2:supportsSwitchToSettingsApp():await();
            v17:debug("Settings app available: {}", v329);
            if v329 then
                v17:debug("Switching to settings app");
                l_default_2:switchToSettingsApp():andThen(function() --[[ Line: 1334 ]]
                    -- upvalues: v17 (ref)
                    v17:debug("Successfully switched to settings app");
                end):catch(function() --[[ Line: 1337 ]]
                    -- upvalues: v17 (ref)
                    v17:error("Error switching to settings app");
                end);
                return;
            else
                v17:debug("Current platform does not support switching to settings app");
                return;
            end;
        end or l_GetFFlagJoinWithoutMicPermissions_0() and l_GetFFlagShowDevicePermissionsModal_0() and v312 == v81.DevicePermissionsModal and function() --[[ Line: 1348 ]]
            -- upvalues: v17 (ref), v310 (copy), l_default_2 (ref), l_SettingsRoute_0 (ref)
            v17:debug("Settings app available: {}", v310.settingsAppAvailable);
            v310.Analytics:reportDevicePermissionsModalEvent(v310.settingsAppAvailable and "OpenedSettings" or "Acknowledged", v310:GetSessionId(), v310:GetInExpUpsellAnalyticsData());
            if v310.settingsAppAvailable then
                v17:debug("Switching to settings app");
                l_default_2:switchToSettingsApp(l_SettingsRoute_0.Microphone):andThen(function() --[[ Line: 1359 ]]
                    -- upvalues: v17 (ref)
                    v17:debug("Successfully switched to settings app");
                end):catch(function() --[[ Line: 1362 ]]
                    -- upvalues: v17 (ref)
                    v17:error("Error switching to settings app");
                end);
                return;
            else
                v17:debug("Current platform does not support switching to settings app");
                return;
            end;
        end or v314 and function() --[[ Line: 1369 ]]
            -- upvalues: v310 (copy)
            v310:reportBanMessage("Understood");
            v310.Analytics:reportBanMessageEvent("Understood");
        end or v317 and function() --[[ Line: 1373 ]]
            -- upvalues: v310 (copy)
            v310.Analytics:reportInExpConsent("accepted", v310.inExpUpsellEntrypoint, v310:GetInExpUpsellAnalyticsData());
            v310:EnableVoice();
        end or nil, 
        onSecondaryActivated = v312 == v81.VoiceToxicityModal and function() --[[ Line: 1383 ]]
            -- upvalues: v310 (copy), v43 (ref)
            v310:ShowVoiceToxicityFeedbackToast();
            if v43 then
                v310.Analytics:reportDeniedNudge(v310:GetNudgeAnalyticsData());
            end;
        end or v316 and function() --[[ Line: 1389 ]]
            -- upvalues: v310 (copy)
            v310.Analytics:reportDeniedNudge(v310:GetNudgeAnalyticsData());
        end or v314 and function() --[[ Line: 1392 ]]
            -- upvalues: v310 (copy)
            v310:ShowVoiceToxicityFeedbackToast();
            v310:reportBanMessage("Denied");
            v310.Analytics:reportBanMessageEvent("Denied");
        end or v317 and function() --[[ Line: 1397 ]]
            -- upvalues: v310 (copy), v78 (ref), v81 (ref)
            v310.Analytics:reportInExpConsent("denied", v310.inExpUpsellEntrypoint, v310:GetInExpUpsellAnalyticsData());
            if v310.inExpUpsellEntrypoint ~= v78.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
                v310:showPrompt(v81.VoiceConsentDeclinedToast);
            end;
        end or v312 == v81.DevicePermissionsModal and function() --[[ Line: 1407 ]]
            -- upvalues: v310 (copy)
            v310.Analytics:reportDevicePermissionsModalEvent("Denied", v310:GetSessionId(), v310:GetInExpUpsellAnalyticsData());
        end or nil
    }), l_CoreGui_0, "RobloxVoiceChatPromptGui");
end;
v124.showPrompt = function(v330, v331, v332) --[[ Line: 1421 ]] --[[ Name: showPrompt ]]
    -- upvalues: v25 (copy), v17 (copy)
    if v25() then
        v330.errorText = v332 or nil;
    end;
    v330:createPromptInstance(function() --[[ Line: 1425 ]]
        -- upvalues: v17 (ref), v331 (copy), v330 (copy)
        v17:debug("Show Prompt: {}", v331);
        v330.promptSignal:fire(v331);
    end, v331);
end;
v124.showJoinVoicePrompt = function(v333) --[[ Line: 1431 ]] --[[ Name: showJoinVoicePrompt ]]
    -- upvalues: v81 (copy), l_AppStorageService_0 (copy), v78 (copy)
    v333:showPrompt(v81.UnifiedJoinVoiceToast);
    pcall(function() --[[ Line: 1433 ]]
        -- upvalues: l_AppStorageService_0 (ref), v78 (ref)
        l_AppStorageService_0:SetItem(v78.VOICE_WITH_TC_TOAST_KEY, "true");
        l_AppStorageService_0:Flush();
    end);
end;
v124.CheckAndShowPermissionPrompt = function(v334) --[[ Line: 1439 ]] --[[ Name: CheckAndShowPermissionPrompt ]]
    -- upvalues: l_GetFFlagEnableSeamlessVoiceV2_0 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), l_PERMISSION_STATE_0 (copy), v81 (copy), v28 (copy), v45 (copy), l_PermissionsProtocol_0 (copy), v3 (copy), v24 (copy)
    local function v337() --[[ Line: 1440 ]] --[[ Name: showPrompt ]]
        -- upvalues: v334 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (ref), l_GetFFlagJoinWithoutMicPermissions_0 (ref), l_PERMISSION_STATE_0 (ref), v81 (ref), v28 (ref), v45 (ref), l_PermissionsProtocol_0 (ref), v3 (ref)
        local l_userEligible_0 = v334.userEligible;
        if v334.voiceEnabled or l_userEligible_0 then
            if not l_GetFFlagEnableSeamlessVoiceV2_0() and l_GetFFlagJoinWithoutMicPermissions_0() then
                if v334.permissionState == l_PERMISSION_STATE_0.LISTEN_ONLY then
                    v334:showPrompt(v81.Permission);
                end;
            elseif v28 then
                if v45 then
                    v334:_reportJoinFailed("missingPermissions");
                end;
                v334:showPrompt(v81.Permission);
            else
                return v334.PermissionsService:hasPermissions({
                    l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS
                }):andThen(function(v336) --[[ Line: 1458 ]]
                    -- upvalues: l_PermissionsProtocol_0 (ref), v334 (ref), v81 (ref)
                    if v336 and v336.status == l_PermissionsProtocol_0.Status.DENIED then
                        v334:showPrompt(v81.Permission);
                    end;
                end);
            end;
        end;
        return v3.resolve();
    end;
    if v24() then
        return v337();
    else
        return v334:asyncInit():andThen(function() --[[ Line: 1471 ]]

        end):catch(function() --[[ Line: 1471 ]]
            -- upvalues: v337 (copy)
            return v337();
        end);
    end;
end;
v124.showDataConsentToast = function(v338) --[[ Line: 1477 ]] --[[ Name: showDataConsentToast ]]
    -- upvalues: l_GetFFlagSeamlessVoiceConsentToastPolicy_0 (copy), v88 (copy), v87 (copy), v78 (copy), v81 (copy)
    local v339 = v338:FetchAgeVerificationOverlay();
    local v340 = nil;
    local v341 = nil;
    local v342 = false;
    if l_GetFFlagSeamlessVoiceConsentToastPolicy_0() then
        v342 = v88.getAppFeaturePolicies().getDisplayCheckboxInVoiceConsent() or false;
    end;
    if type(v339) == "table" then
        v340 = if v339.voiceSettings then v339.voiceSettings.seamlessVoiceStatus else v87.Invalid;
        v341 = v339.showDataConsentToast;
    else
        v341 = false;
        v340 = v87.Invalid;
    end;
    if v341 and v342 then
        v341 = type(v338:_GetShowAgeVerificationOverlay()) == "table" and v338:_GetShowAgeVerificationOverlay().showDataConsentToast;
    end;
    if v340 == v87.EnabledExistingUser and v341 and v342 then
        v338:RecordUserSeenModal(v78.MODAL_IDS.DATA_CONSENT_TOAST);
        return v338:showPrompt(v81.VoiceDataConsentOptOutToast);
    else
        return;
    end;
end;
v124.CheckAndShowNotAudiblePrompt = function(v343) --[[ Line: 1511 ]] --[[ Name: CheckAndShowNotAudiblePrompt ]]
    -- upvalues: v81 (copy), v3 (copy)
    if game:GetEngineFeature("VoiceChatSupported") then
        return v343:asyncInit():andThen(function() --[[ Line: 1514 ]]
            -- upvalues: v343 (copy), v81 (ref)
            if UserSettings().GameSettings.MasterVolume == 0 then
                v343:showPrompt(v81.NotAudible);
            end;
        end):catch(function() --[[ Line: 1520 ]]

        end);
    else
        return v3.resolve();
    end;
end;
v124.InitialJoinFailedPrompt = function(v344) --[[ Line: 1525 ]] --[[ Name: InitialJoinFailedPrompt ]]
    -- upvalues: v17 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), v81 (copy)
    v17:debug("JoinByGroupIdToken returns false");
    if not l_GetFFlagVoiceChatClientRewriteMasterLua_0 then
        v344:showPrompt(v81.Retry);
    end;
end;
v124.ShowVoiceToxicityFeedbackToast = function(v345) --[[ Line: 1532 ]] --[[ Name: ShowVoiceToxicityFeedbackToast ]]
    -- upvalues: v17 (copy), v81 (copy)
    v17:debug("Sending feedback toast");
    v345:showPrompt(v81.VoiceToxicityFeedbackToast);
end;
v124.GetNudgeAnalyticsData = function(v346) --[[ Line: 1537 ]] --[[ Name: GetNudgeAnalyticsData ]]
    -- upvalues: l_Players_0 (copy)
    return l_Players_0.LocalPlayer.UserId, v346:GetSessionId();
end;
v124.GetInExpUpsellAnalyticsData = function(_) --[[ Line: 1541 ]] --[[ Name: GetInExpUpsellAnalyticsData ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy)
    local v348 = "";
    if l_game_EngineFeature_0 then
        v348 = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    return game.GameId, game.PlaceId, v348;
end;
v124.reportBanMessage = function(v349, v350) --[[ Line: 1549 ]] --[[ Name: reportBanMessage ]]
    -- upvalues: l_Players_0 (copy)
    v349.Analytics:reportBanMessageEventV2(v350, v349.banReason, l_Players_0.LocalPlayer.UserId, if v349.service then v349.previousSessionId else "");
end;
v124.reportJoinVoiceUpsellEvent = function(v351, v352) --[[ Line: 1558 ]] --[[ Name: reportJoinVoiceUpsellEvent ]]
    -- upvalues: v58 (copy), l_RbxAnalyticsService_0 (copy)
    if v58 then
        local l_l_RbxAnalyticsService_0_PlaySessionId_0 = l_RbxAnalyticsService_0:GetPlaySessionId();
        v351.Analytics:reportJoinVoiceUpsellEvent(v352, l_l_RbxAnalyticsService_0_PlaySessionId_0, v351:UserVoiceEnabled());
    end;
end;
v124.SetAndSyncActive = function(v354, v355, v356) --[[ Line: 1569 ]] --[[ Name: SetAndSyncActive ]]
    v354.coreVoiceManager:SetAndSyncActive(v355, v356);
end;
v124.CreateAudioDeviceData = function(v357, v358) --[[ Line: 1573 ]] --[[ Name: CreateAudioDeviceData ]]
    return v357.coreVoiceManager:CreateAudioDeviceData(v358);
end;
v124.onInstanceAdded = function(v359, v360) --[[ Line: 1577 ]] --[[ Name: onInstanceAdded ]]
    return v359.coreVoiceManager:onInstanceAdded(v360);
end;
v124.UpdateAudioDeviceInputDebugger = function(v361) --[[ Line: 1581 ]] --[[ Name: UpdateAudioDeviceInputDebugger ]]
    -- upvalues: v44 (copy), v17 (copy), v4 (copy), v80 (copy), l_CoreGui_0 (copy)
    if v44 then
        if not v361.voiceDebuggerInstance then
            v17:debug("Mounting AudioDeviceInput Debugger");
            v361.voiceDebuggerInstance = v4.mount(v4.createElement(v80, {
                instances = v361.audioDevices, 
                mutedPlayers = v361.mutedPlayers
            }), l_CoreGui_0, "RobloxVoiceChatPromptGui");
            return;
        else
            v4.update(v361.voiceDebuggerInstance, v4.createElement(v80, {
                instances = v361.audioDevices, 
                mutedPlayers = v361.mutedPlayers
            }));
        end;
    end;
end;
v124.AddReverseNudgeToxicUser = function(v362, v363, v364, v365) --[[ Line: 1605 ]] --[[ Name: AddReverseNudgeToxicUser ]]
    -- upvalues: v32 (copy)
    v364(v363, "iconColorChange");
    local v366 = v362.reverseNudgeToxicUserRemovalCallbacks[v363];
    if v366 ~= nil then
        task.cancel(v366);
    end;
    local v367 = task.delay(v32(), function() --[[ Line: 1619 ]]
        -- upvalues: v365 (copy), v363 (copy), v362 (copy)
        v365(v363);
        v362.reverseNudgeToxicUserRemovalCallbacks[v363] = nil;
    end);
    v362.reverseNudgeToxicUserRemovalCallbacks[v363] = v367;
end;
v124.onInstanceRemove = function(v368, v369) --[[ Line: 1626 ]] --[[ Name: onInstanceRemove ]]
    return v368.coreVoiceManager:onInstanceRemove(v369);
end;
v124.hookupAudioDeviceInputListener = function(v370) --[[ Line: 1630 ]] --[[ Name: hookupAudioDeviceInputListener ]]
    return v370.coreVoiceManager:hookupAudioDeviceInputListener();
end;
v124.ToggleMutePlayer = function(v371, v372, v373) --[[ Line: 1634 ]] --[[ Name: ToggleMutePlayer ]]
    return v371.coreVoiceManager:ToggleMutePlayer(v372, v373);
end;
v124.MuteAll = function(v374, v375, v376) --[[ Line: 1638 ]] --[[ Name: MuteAll ]]
    return v374.coreVoiceManager:MuteAll(v375, v376);
end;
v124.ToggleMuteSome = function(v377, v378, v379, v380, v381) --[[ Line: 1642 ]] --[[ Name: ToggleMuteSome ]]
    return v377.coreVoiceManager:ToggleMuteSome(v378, v379, v380, v381);
end;
v124.FireMuteNonFriendsEvent = function(v382) --[[ Line: 1651 ]] --[[ Name: FireMuteNonFriendsEvent ]]
    v382.mutedNonFriends:Fire();
end;
v124.EnsureCorrectMuteState = function(v383, v384, v385) --[[ Line: 1655 ]] --[[ Name: EnsureCorrectMuteState ]]
    -- upvalues: l_VoiceChatService_0 (copy), l_game_EngineFeature_1 (copy), l_Players_0 (copy)
    local v386 = {};
    for _, v388 in v384 do
        local v389 = v383.participants[tostring(v388)];
        if v389 and v389.isMutedLocally ~= v385 then
            if l_VoiceChatService_0.UseNewAudioApi then
                v386[v388] = true;
                v383.mutedPlayers[v388] = v385;
            else
                v383.service:SubscribePause(v388, v385);
            end;
            v389.isMutedLocally = v385;
            v383.participantsUpdate:Fire(v383.participants);
        end;
    end;
    if l_VoiceChatService_0.UseNewAudioApi then
        for v390 in v383.audioDevices do
            if v390.Player and v386[v390.Player.UserId] then
                if l_game_EngineFeature_1 and v390.Player ~= l_Players_0.LocalPlayer then
                    v390.MutedByLocalUser = v385;
                else
                    v390.Active = not v385;
                end;
            end;
        end;
    end;
end;
v124.FireUserAgencySelectedEvent = function(v391, v392) --[[ Line: 1687 ]] --[[ Name: FireUserAgencySelectedEvent ]]
    v391.userAgencySelected:Fire(v392);
end;
v124.ParticipantStateToIcon = function(_, v394, v395) --[[ Line: 1691 ]] --[[ Name: ParticipantStateToIcon ]]
    -- upvalues: l_VOICE_STATE_0 (copy)
    local l_INACTIVE_0 = l_VOICE_STATE_0.INACTIVE;
    if not v394.subscriptionCompleted then
        l_INACTIVE_0 = l_VOICE_STATE_0.CONNECTING;
    elseif v394.isMutedLocally then
        l_INACTIVE_0 = l_VOICE_STATE_0.LOCAL_MUTED;
    elseif v394.isMuted then
        l_INACTIVE_0 = l_VOICE_STATE_0.MUTED;
    elseif v394.isSignalActive then
        l_INACTIVE_0 = l_VOICE_STATE_0.TALKING;
    end;
    return getIcon(l_INACTIVE_0, v395);
end;
v124.VoiceStateToIcon = function(_, v398, v399, v400) --[[ Line: 1706 ]] --[[ Name: VoiceStateToIcon ]]
    return getIcon(v398, v399, v400);
end;
v124.GetIcon = function(_, v402, v403) --[[ Line: 1710 ]] --[[ Name: GetIcon ]]
    return getIconSrc(v402, v403);
end;
v124.JoinVoice = function(v404, v405) --[[ Line: 1714 ]] --[[ Name: JoinVoice ]]
    -- upvalues: v78 (copy), v60 (copy), v42 (copy), v23 (copy), v81 (copy), l_GetFFlagNonVoiceFTUX_0 (copy), l_AppStorageService_0 (copy), l_GetFFlagEnableVrVoiceParity_0 (copy), v3 (copy), v52 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy), v57 (copy), v21 (copy), l_GetFFlagShowToastWhenAgeGatingVoice_0 (copy), l_GetFFlagIntegratePhoneUpsellJoinVoice_0 (copy), l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 (copy), l_getOverlayStore_0 (copy), l_OverlayTypes_0 (copy), l_SocialUpsellType_0 (copy), l_Enum_0 (copy), v50 (copy)
    local v406 = v404:FetchAgeVerificationOverlay().showVoiceInExperienceUpsellVariant or v78.IN_EXP_UPSELL_VARIANT.VARIANT3;
    v404.Analytics:reportJoinVoiceButtonEvent("clicked", v404:GetInExpUpsellAnalyticsData());
    if v60() and v404.previousGroupId then
        v404:RejoinPreviousChannel();
        if v42() then
            v404:showJoinVoicePrompt();
        elseif v23() then
            v404:showPrompt(v81.UnifiedJoinVoiceToast);
        else
            v404:showPrompt(v81.JoinVoice);
        end;
        v404:ShowVoiceUI();
        v404:SetVoiceConnectCookieValue(true);
    elseif l_GetFFlagNonVoiceFTUX_0() and v404.isShowingFTUX then
        v404:HideFTUX(l_AppStorageService_0);
    elseif v404.deniedMicPermissions then
        if l_GetFFlagEnableVrVoiceParity_0() then
            v404:CheckAndShowPermissionPrompt();
        else
            v404:CheckAndShowPermissionPrompt():finallyReturn(v3.reject());
        end;
    elseif v60() and v404:UserVoiceEnabled() then
        if v52 then
            v404.isInitialJoin = true;
        end;
        v404.attemptVoiceRejoin:Fire();
        if l_GetFFlagEnableSeamlessVoiceV2_0() and v404:IsNewSeamlessVoiceUserDisconnect() then
            v404:SetVoiceConnectCookieValue(true);
            v404:SetNewUserFTUXCookieValue(true);
        end;
    elseif v57 and v404:UserOnlyEligibleForVoiceViaOverlay() or v404:UserOnlyEligibleForVoice() then
        if v21() and v404:IsSeamlessVoice() then
            v404:EnableVoice();
        else
            v404:SetInExpUpsellEntrypoint(v78.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE);
            v404:showPrompt((v404:GetInExpUpsellPromptFromEnum(v406)));
        end;
    elseif l_GetFFlagShowToastWhenAgeGatingVoice_0() and v404:EligibleForAgeCheckToast() then
        v404:showPrompt(v81.AgeCheckForVoiceToast);
    elseif l_GetFFlagIntegratePhoneUpsellJoinVoice_0() and l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and not v404:UserVoiceEnabled() and v404:FetchPhoneVerificationUpsell(v78.IN_EXP_PHONE_UPSELL_IXP_LAYER) == v78.PHONE_UPSELL_VALUE_PROP.VoiceChat then
        if v405 then
            v405:SetVisibility(false, true);
        end;
        v404:ShowInExperiencePhoneVoiceUpsell(v78.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE, v78.IN_EXP_PHONE_UPSELL_IXP_LAYER);
    elseif v404:EligibleForFaeUpsell() then
        v404.coreVoiceManager:OptUserToJoinVoice();
        local v407 = l_getOverlayStore_0(false);
        v404:reportJoinVoiceUpsellEvent("Click");
        v407.setCurrentOverlay(l_OverlayTypes_0.SocialUpsell, {
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
    if v50 and v404:IsSeamlessVoice() then
        task.spawn(function() --[[ Line: 1801 ]]
            -- upvalues: v404 (copy)
            v404.coreVoiceManager:PostUserVoiceConnectionStatus(true);
        end);
    end;
end;
v124.EligibleForFaeUpsell = function(v408) --[[ Line: 1807 ]] --[[ Name: EligibleForFaeUpsell ]]
    -- upvalues: l_GetFFlagEnableVoiceUxUpdates_0 (copy), l_FFlagTestDeviceForFAEUpsell_0 (copy), l_deviceMeetsRequirementsForFAE_0 (copy)
    local v409 = l_GetFFlagEnableVoiceUxUpdates_0();
    if v409 then
        v409 = v408.coreVoiceManager:EligibleForFaeUpsell();
        if v409 then
            v409 = v408.AvatarChatService:deviceMeetsRequirementsForFeature(Enum.DeviceFeatureType.InExperienceFAE);
            if v409 then
                if l_FFlagTestDeviceForFAEUpsell_0 then
                    return (l_deviceMeetsRequirementsForFAE_0());
                else
                    v409 = true;
                end;
            end;
        end;
    end;
    return v409;
end;
v124.EligibleForAgeCheckToast = function(v410) --[[ Line: 1814 ]] --[[ Name: EligibleForAgeCheckToast ]]
    return v410.coreVoiceManager:EligibleForAgeCheckToast();
end;
v124.ShouldShowJoinVoice = function(v411) --[[ Line: 1819 ]] --[[ Name: ShouldShowJoinVoice ]]
    -- upvalues: l_GetFFlagEnableVoiceUxUpdates_0 (copy), v19 (copy), v22 (copy), v60 (copy), l_GetFFlagShowToastWhenAgeGatingVoice_0 (copy), l_GetFFlagIntegratePhoneUpsellJoinVoice_0 (copy), l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 (copy), v78 (copy)
    if l_GetFFlagEnableVoiceUxUpdates_0() then
        if v411:EligibleForFaeUpsell() or v411:HasSeamlessVoiceFeature(v19.Constants.SeamlessVoiceFeatures.InitialJoinVoice) and v411:GetVoiceConnectCookie() == "" then
            return true;
        end;
    elseif v22() then
        if v60() and v411:IsSeamlessVoice() and v411:verifyUniverseAndPlaceCanUseVoice() then
            return not v411.voiceUIVisible;
        end;
    elseif v60() and v411:IsSeamlessVoice() then
        return not v411.voiceUIVisible;
    end;
    if l_GetFFlagShowToastWhenAgeGatingVoice_0() and v411:EligibleForAgeCheckToast() then
        return true;
    else
        local v412 = v411:UserInInExperienceUpsellTreatment();
        local v413 = v411:UserOnlyEligibleForVoice() or v411:UserVoiceEnabled();
        if l_GetFFlagIntegratePhoneUpsellJoinVoice_0() and l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and not v413 and not v411:UserVoiceEnabled() and v411:FetchPhoneVerificationUpsell(v78.IN_EXP_PHONE_UPSELL_IXP_LAYER) == v78.PHONE_UPSELL_VALUE_PROP.VoiceChat then
            return true;
        else
            return v412 and v413;
        end;
    end;
end;
v124.ShouldShowJoinVoiceOnDisconnect = function(v414) --[[ Line: 1872 ]] --[[ Name: ShouldShowJoinVoiceOnDisconnect ]]
    return v414.coreVoiceManager:ShouldShowJoinVoiceOnDisconnect();
end;
v124.IsSeamlessVoice = function(v415) --[[ Line: 1876 ]] --[[ Name: IsSeamlessVoice ]]
    -- upvalues: l_GetFFlagCheckUniversePlaceBeforeSuspending_0 (copy), v17 (copy), v87 (copy)
    if l_GetFFlagCheckUniversePlaceBeforeSuspending_0() then
        return v415.coreVoiceManager:IsSeamlessVoice();
    else
        local v416 = v415:FetchAgeVerificationOverlay();
        if not v416 or not v416.voiceSettings then
            v17:error("VoiceChatServiceManager:IsSeamlessVoice() - ageVerificationOverlayData or voiceSettings is nil");
            return false;
        else
            local l_seamlessVoiceStatus_0 = v416.voiceSettings.seamlessVoiceStatus;
            local v418 = true;
            if l_seamlessVoiceStatus_0 ~= v87.EnabledExistingUser then
                v418 = l_seamlessVoiceStatus_0 == v87.EnabledNewUser;
            end;
            return v418;
        end;
    end;
end;
v124.HasSeamlessVoiceFeature = function(v419, v420) --[[ Line: 1892 ]] --[[ Name: HasSeamlessVoiceFeature ]]
    return v419.coreVoiceManager:HasSeamlessVoiceFeature(v420);
end;
v124.IsNewSeamlessVoiceUserDisconnect = function(v421) --[[ Line: 1896 ]] --[[ Name: IsNewSeamlessVoiceUserDisconnect ]]
    return v421.coreVoiceManager:IsNewSeamlessVoiceUserDisconnect();
end;
v124.GetConnectDisconnectButtonAnalyticsData = function(v422, v423) --[[ Line: 1900 ]] --[[ Name: GetConnectDisconnectButtonAnalyticsData ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy)
    local v424 = "";
    if l_game_EngineFeature_0 then
        v424 = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    local v425 = {
        game.GameId, 
        game.PlaceId, 
        v424
    };
    if v423 and v422:getService() then
        table.insert(v425, v422:GetSessionId());
    end;
    return unpack(v425);
end;
v124.GetConnectDisconnectAnalyticsData = function(v426) --[[ Line: 1912 ]] --[[ Name: GetConnectDisconnectAnalyticsData ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy), l_GetFFlagNonVoiceFTUX_0 (copy), l_default_0 (copy)
    local v427 = {};
    local v428 = "";
    if l_game_EngineFeature_0 then
        v428 = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    v427.universeId = game.GameId;
    v427.placeId = game.PlaceId;
    v427.playSessionId = v428;
    if l_GetFFlagNonVoiceFTUX_0() then
        v427.voiceSessionId = if v426.service then v426:GetSessionId() else "";
    else
        v427.voiceSessionId = v426:GetSessionId();
    end;
    v427.durationTimestamp = l_default_0:getTimestamp();
    return v427;
end;
v124.Leave = function(v429) --[[ Line: 1932 ]] --[[ Name: Leave ]]
    -- upvalues: l_GetFFlagDisconnectToastClientRewrite_0 (copy), v60 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), v50 (copy)
    v429:ensureInitialized("leave");
    if l_GetFFlagDisconnectToastClientRewrite_0() and v60() then
        v429:SetVoiceConnectCookieValue(false);
    end;
    v429.Analytics:reportConnectDisconnectEvents("voiceDisconnectEvent", v429:GetConnectDisconnectAnalyticsData());
    local l_GroupId_0 = v429.service:GetGroupId();
    local v431 = v429.service:IsPublishPaused();
    if l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
        local l_VoiceChatService_1 = game:GetService("VoiceChatService");
        if l_VoiceChatService_1 then
            l_VoiceChatService_1:leaveVoice();
        end;
    else
        v429.service:Leave();
    end;
    v429:HideVoiceUI();
    v429.previousGroupId = l_GroupId_0;
    v429.previousMutedState = v431;
    if not l_GetFFlagDisconnectToastClientRewrite_0() and v60() then
        v429:SetVoiceConnectCookieValue(false);
    end;
    if v50 and v429:IsSeamlessVoice() then
        task.spawn(function() --[[ Line: 1955 ]]
            -- upvalues: v429 (copy)
            v429.coreVoiceManager:PostUserVoiceConnectionStatus(false);
        end);
    end;
end;
v124.GetVoiceStateFromEnum = function(_, v434) --[[ Line: 1961 ]] --[[ Name: GetVoiceStateFromEnum ]]
    -- upvalues: v126 (ref), l_VOICE_STATE_0 (copy)
    if not v126[v434] then
        v126 = {
            [Enum.VoiceChatState.Idle] = l_VOICE_STATE_0.HIDDEN, 
            [Enum.VoiceChatState.Joining] = l_VOICE_STATE_0.CONNECTING, 
            [Enum.VoiceChatState.JoiningRetry] = l_VOICE_STATE_0.CONNECTING, 
            [Enum.VoiceChatState.Joined] = l_VOICE_STATE_0.MUTED, 
            [Enum.VoiceChatState.Leaving] = l_VOICE_STATE_0.MUTED, 
            [Enum.VoiceChatState.Ended] = l_VOICE_STATE_0.HIDDEN, 
            [Enum.VoiceChatState.Failed] = l_VOICE_STATE_0.ERROR
        };
    end;
    return v126[v434];
end;
v124.GetInExpUpsellPromptFromEnum = function(_, v436) --[[ Line: 1981 ]] --[[ Name: GetInExpUpsellPromptFromEnum ]]
    -- upvalues: v127 (copy)
    return v127[v436];
end;
v124.getRecentUsersInteractionData = function(v437) --[[ Line: 1986 ]] --[[ Name: getRecentUsersInteractionData ]]
    return v437.coreVoiceManager:getRecentUsersInteractionData();
end;
v124._setRecentUserState = function(v438, v439, v440) --[[ Line: 1990 ]] --[[ Name: _setRecentUserState ]]
    return v438.coreVoiceManager:_setRecentUserState(v439, v440);
end;
v124._updateRecentUsersInteractionData = function(v441) --[[ Line: 1994 ]] --[[ Name: _updateRecentUsersInteractionData ]]
    return v441.coreVoiceManager:_updateRecentUsersInteractionData();
end;
v124.SetupParticipantListeners = function(v442) --[[ Line: 1998 ]] --[[ Name: SetupParticipantListeners ]]
    return v442.coreVoiceManager:SetupParticipantListeners();
end;
v124.Disconnect = function(v443) --[[ Line: 2002 ]] --[[ Name: Disconnect ]]
    v443.coreVoiceManager:Disconnect();
    v443.coreVoiceManager:unsubscribeAll();
end;
v124.GetSendMuteEvent = function(v444) --[[ Line: 2007 ]] --[[ Name: GetSendMuteEvent ]]
    return v444.coreVoiceManager:GetSendMuteEvent();
end;
v124.GetLikelySpeakingUsersEvent = function(v445) --[[ Line: 2011 ]] --[[ Name: GetLikelySpeakingUsersEvent ]]
    return v445.coreVoiceManager:GetLikelySpeakingUsersEvent();
end;
v124.ToggleMic = function(v446, v447) --[[ Line: 2016 ]] --[[ Name: ToggleMic ]]
    return v446.coreVoiceManager:ToggleMic(v447);
end;
v124.SubscribeRetry = function(v448, v449) --[[ Line: 2020 ]] --[[ Name: SubscribeRetry ]]
    -- upvalues: v17 (copy)
    v448:ensureInitialized("subscribe retry");
    v17:debug("Attempting to retry connection to user: {}", "..." .. string.sub(tostring(v449), -4));
    v448.service:SubscribeRetry(v449);
end;
v124.JoinByGroupIdToken = function(v450, v451, v452) --[[ Line: 2026 ]] --[[ Name: JoinByGroupIdToken ]]
    return v450.coreVoiceManager:JoinByGroupIdToken(v451, v452);
end;
v124.RejoinPreviousChannel = function(v453) --[[ Line: 2030 ]] --[[ Name: RejoinPreviousChannel ]]
    -- upvalues: v17 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy)
    local l_previousGroupId_0 = v453.previousGroupId;
    local l_previousMutedState_0 = v453.previousMutedState;
    v17:debug("Rejoining previous channel {} with mute status {}", l_previousGroupId_0, l_previousMutedState_0);
    pcall(function() --[[ Line: 2035 ]]
        -- upvalues: l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), v453 (copy), l_previousGroupId_0 (copy), l_previousMutedState_0 (copy)
        if l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
            v453.coreVoiceManager:RejoinVoice();
            v453.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", v453:GetConnectDisconnectAnalyticsData());
            return;
        else
            if l_previousGroupId_0 and l_previousGroupId_0 ~= "" then
                v453.service:Leave();
                if not v453.service:JoinByGroupIdToken(l_previousGroupId_0, l_previousMutedState_0, true) then
                    v453:InitialJoinFailedPrompt();
                    return;
                else
                    v453.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", v453:GetConnectDisconnectAnalyticsData());
                end;
            end;
            return;
        end;
    end);
end;
local function _(v456, v457, v458) --[[ Line: 2059 ]] --[[ Name: isValidDeviceList ]]
    return v456 and v457 and v458 and #v456 > 0 and v458 > 0 and v458 <= #v456 and #v456 == #v457;
end;
local function v469(v460, v461) --[[ Line: 2069 ]] --[[ Name: setVCSOutput ]]
    -- upvalues: l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0 (copy), v17 (copy)
    if l_GetFFlagVoiceChatClientRewriteDisableVCSDevice_0() then
        v17:error("[OutputDeviceSelection] setVCSOutput is deprecated");
        return {};
    else
        local v462, v463, v464, v465 = pcall(function() --[[ Line: 2075 ]]
            -- upvalues: v461 (copy)
            return v461:GetSpeakerDevices();
        end);
        if v462 and v463 and v464 and v465 and #v463 > 0 and v465 > 0 and v465 <= #v463 and #v463 == #v464 then
            local v466 = 0;
            for v467, v468 in ipairs(v463) do
                if v468 == v460 then
                    v466 = v467;
                end;
            end;
            if v466 > 0 then
                v17:info("[OutputDeviceSelection] Setting VCS Speaker Device To {} {}", v463[v466], v464[v466]);
                v461:SetSpeakerDevice(v463[v466], v464[v466]);
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
v124.SwitchDevice = function(v470, v471, v472, v473) --[[ Line: 2103 ]] --[[ Name: SwitchDevice ]]
    -- upvalues: l_VOICE_CHAT_DEVICE_TYPE_0 (copy), l_SoundService_0 (copy), v17 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), v469 (copy), v74 (copy)
    if v471 == l_VOICE_CHAT_DEVICE_TYPE_0.Input then
        l_SoundService_0:SetInputDevice(v472, v473);
        v17:info("[InputDeviceSelection] Setting SS Mic Device To {} {}", v472, v473);
        return;
    else
        l_SoundService_0:SetOutputDevice(v472, v473);
        v17:info("[OutputDeviceSelection] Setting SS Speaker Device To {} {}", v472, v473);
        if not l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
            v469(v472, if v74 then v470.service else nil);
        end;
        return;
    end;
end;
v124.GetDevices = function(_, v475) --[[ Line: 2116 ]] --[[ Name: GetDevices ]]
    -- upvalues: l_VOICE_CHAT_DEVICE_TYPE_0 (copy), l_SoundService_0 (copy)
    local v476, v477, v478, v479 = pcall(function() --[[ Line: 2117 ]]
        -- upvalues: v475 (copy), l_VOICE_CHAT_DEVICE_TYPE_0 (ref), l_SoundService_0 (ref)
        if v475 == l_VOICE_CHAT_DEVICE_TYPE_0.Input then
            return l_SoundService_0:GetInputDevices();
        else
            return l_SoundService_0:GetOutputDevices();
        end;
    end);
    return v476, v477, v478, v479;
end;
v124.VoiceChatAvailable = function(v480) --[[ Line: 2128 ]] --[[ Name: VoiceChatAvailable ]]
    -- upvalues: l_MIN_VOICE_CHAT_API_VERSION_0 (copy), l_VOICE_CHAT_AVAILABILITY_0 (copy)
    local l_service_0 = v480.service;
    if v480.available == nil and l_service_0 then
        v480.version = l_service_0:GetVoiceChatApiVersion();
        if v480.version >= l_MIN_VOICE_CHAT_API_VERSION_0 then
            v480.available = l_service_0:GetVoiceChatAvailable();
            while v480.available == l_VOICE_CHAT_AVAILABILITY_0.Checking do
                wait(1);
                v480.available = l_service_0:GetVoiceChatAvailable();
            end;
        end;
    end;
    if l_service_0 then
        local v482 = false;
        if v480.version >= l_MIN_VOICE_CHAT_API_VERSION_0 then
            v482 = v480.available == l_VOICE_CHAT_AVAILABILITY_0.Available;
        end;
        return v482;
    else
        return false;
    end;
end;
v124.VoiceChatEnded = function(v483) --[[ Line: 2148 ]] --[[ Name: VoiceChatEnded ]]
    -- upvalues: v54 (copy)
    if v483.service then
        local l_VoiceChatState_0 = v483.service.VoiceChatState;
        if v54 then
            return l_VoiceChatState_0 == Enum.VoiceChatState.Ended;
        else
            local v485 = true;
            if l_VoiceChatState_0 ~= Enum.VoiceChatState.Ended then
                v485 = l_VoiceChatState_0 == Enum.VoiceChatState.Idle;
            end;
            return v485;
        end;
    else
        return true;
    end;
end;
v124.UnmountPrompt = function(v486) --[[ Line: 2160 ]] --[[ Name: UnmountPrompt ]]
    -- upvalues: v4 (copy)
    if v486.voiceChatPromptInstance ~= nil then
        v4.unmount(v486.voiceChatPromptInstance);
        v486.voiceChatPromptInstance = nil;
    end;
end;
v124.default = v124.new(l_CoreVoiceManager_0.default, nil, l_HttpRbxApiService_0, l_PermissionsProtocol_0.default, v97:GetAfterBlockedStatusChangedEvent());
return v124;