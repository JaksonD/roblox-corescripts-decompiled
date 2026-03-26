local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Packages.Cryo);
local v9 = require(script.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v11 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_useLastInput_0 = v11.useLastInput;
local v13 = require(l_CorePackages_0.Packages.UIBlox);
local l_Button_0 = v13.App.Button.Button;
local l_ButtonType_0 = v13.App.Button.Enum.ButtonType;
local l_Toast_0 = v13.App.Dialog.Toast;
local l_Images_0 = v13.App.ImageSet.Images;
local l_useStyle_0 = v13.Core.Style.useStyle;
local l_validateStyle_0 = v13.Style.Validator.validateStyle;
local v20 = require(script.Parent.Parent.PromptType);
local v21 = require(script.Parent.Parent.Parent.InGameMenu.InGameMenuPolicy);
local v22 = require(script.Parent.VoiceChatConsentModal);
local v23 = require(script.Parent.VoiceChatTooltip);
local v24 = require(script.Parent.DevicePermissionsModal);
local v25 = require(script.Parent.Parent.Parent.InGameMenu.Resources.Assets);
local v26 = require(l_CorePackages_0.Workspace.Packages.VoiceChatCore);
local l_Flags_0 = require(l_CorePackages_0.Workspace.Packages.VoiceChat).Flags;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v31 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoicePromptReasonText);
local l_GetFFlagEnableVoiceNudge_0 = v26.Flags.GetFFlagEnableVoiceNudge;
local l_GetFFlagSupportGamepadNavInVoiceModals_0 = l_Flags_0.GetFFlagSupportGamepadNavInVoiceModals;
local v34 = require(l_RobloxGui_0.Modules.Flags.GetFIntVoiceToxicityToastDurationSeconds);
local v35 = game:DefineFastFlag("VoiceChatOnlyReportVoiceBans", false);
local v36 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagConnectionsToFriendsRename_0 = v36.FFlagConnectionsToFriendsRename;
local l_GetFFlagShowDevicePermissionsModal_0 = v36.GetFFlagShowDevicePermissionsModal;
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local v40 = require(l_RobloxGui_0.Modules.Flags.GetFIntVoiceJoinM3ToastDurationSeconds);
local v41 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableSeamlessVoiceDataConsentToast);
local v42 = require(script.Parent.Parent.Parent.VoiceChat.Flags.GetFFlagUpdateVoiceConnectionToasts);
local v43 = require(script.Parent.Parent.Parent.VoiceChat.Flags.GetFFlagEnableVoiceTrustedConnectionsToasts);
local l_GetFFlagShowToastWhenAgeGatingVoice_0 = v36.GetFFlagShowToastWhenAgeGatingVoice;
local v45 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v46 = nil;
if v41() or v42() or l_GetFFlagShowToastWhenAgeGatingVoice_0() then
    local l_LocalizationService_0 = game:GetService("LocalizationService");
    v46 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization.new(l_LocalizationService_0.RobloxLocaleId);
end;
local _ = v6.PureComponent:extend("VoiceChatPromptFrame");
local v49 = {
    [v20.None] = "", 
    [v20.NotAudible] = v45:FormatByKey("Feature.SettingsHub.Prompt.NotAudible"), 
    [v20.Permission] = v45:FormatByKey("Feature.SettingsHub.Prompt.MicrophonePermission"), 
    [v20.Retry] = v45:FormatByKey("Feature.SettingsHub.Prompt.MicrophonePermission"), 
    [v20.Place] = "Exceeds Max Players", 
    [v20.User] = "Not Eligible for Voice", 
    [v20.VoiceChatSuspendedTemporaryAvatarChat] = v45:FormatByKey("Feature.SettingsHub.Prompt.MicAndCameraUseSuspended"), 
    [v20.VoiceChatSuspendedTemporary] = v45:FormatByKey("Feature.SettingsHub.Prompt.MicUseSuspended"), 
    [v20.VoiceChatSuspendedTemporaryB] = v45:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatSuspended"), 
    [v20.VoiceChatSuspendedPermanent] = v45:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatSuspended"), 
    [v20.VoiceLoading] = v45:FormatByKey("Feature.SettingsHub.Prompt.Connecting"), 
    [v20.VoiceToxicityModal] = v45:FormatByKey("Feature.SettingsHub.Prompt.RememberRules"), 
    [v20.VoiceToxicityToast] = v45:FormatByKey("Feature.SettingsHub.Prompt.RememberRules"), 
    [v20.VoiceToxicityFeedbackToast] = v45:FormatByKey("Feature.SettingsHub.Prompt.ThankYouForFeedback"), 
    [v20.VoiceChatSuspendedTemporaryToast] = v45:FormatByKey("Feature.SettingsHub.Prompt.MicUseSuspended"), 
    [v20.VoiceConsentDeclinedToast] = v45:FormatByKey("Feature.SettingsHub.Prompt.ChangeYourMind"), 
    [v20.VoiceConsentAcceptedToast] = v45:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChat"), 
    [v20.VoiceConsentModalV1] = v45:FormatByKey("Feature.SettingsHub.Prompt.GetVoiceChat"), 
    [v20.VoiceConsentModalV2] = v45:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatWithOthers"), 
    [v20.VoiceConsentModalV3] = v45:FormatByKey("Feature.SettingsHub.Prompt.GetVoiceChat"), 
    [v20.JoinedVoiceToast] = v45:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChat"), 
    [v20.JoinVoiceSTUX] = v45:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChat"), 
    [v20.LeaveVoice] = if v42() then v46:Format("Feature.SettingsHub.Prompt.LeaveVoiceChatV2") else v45:FormatByKey("Feature.SettingsHub.Prompt.LeaveVoiceChat"), 
    [v20.JoinVoice] = v45:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChatV2"), 
    [v20.DevicePermissionsModal] = v45:FormatByKey("Feature.SettingsHub.Prompt.NeedMicrophoneAccess"), 
    [v20.VoiceDataConsentOptOutToast] = if v41() then v46:Format("Feature.SettingsHub.Prompt.Title.ImproveVoiceChat") else nil, 
    [v20.UnifiedJoinVoiceToast] = if v42() then v46:Format("Feature.SettingsHub.Prompt.JoinedVoiceChatV3") else nil, 
    [v20.AgeCheckForVoiceToast] = if l_GetFFlagShowToastWhenAgeGatingVoice_0() then v46:Format("Feature.SettingsHub.Prompt.Title.AgeCheckForVoiceToast") else nil, 
    [v20.UpdateOnAutoJoinToast] = if v43() then v46:Format("Feature.SettingsHub.Prompt.UpdateToVoiceChat") else nil
};
local v50 = l_FFlagConnectionsToFriendsRename_0 and "Feature.SettingsHub.Prompt.Subtitle.TalkInAgeGroupTrustedFriends" or "Feature.SettingsHub.Prompt.Subtitle.TalkInAgeGroupTrustedConnections";
local v51 = l_FFlagConnectionsToFriendsRename_0 and "Feature.SettingsHub.Prompt.Subtitle.TalkAgeGroupTrustedFriendsUpdate" or "Feature.SettingsHub.Prompt.Subtitle.TalkAgeGroupTrustedConnectionsUpdate";
local v53 = {
    [v20.None] = "", 
    [v20.NotAudible] = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.NotAudible"), 
    [v20.Permission] = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.MicrophonePermission"), 
    [v20.Retry] = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Retry"), 
    [v20.Place] = "Spatial voice is only available for places with Max Players of 30 or less.", 
    [v20.User] = "This account is not eligible to use Spatial Voice.", 
    [v20.VoiceChatSuspendedTemporary] = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Microphone"), 
    [v20.VoiceChatSuspendedTemporaryAvatarChat] = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.MicAndCamera"), 
    [v20.VoiceChatSuspendedTemporaryB] = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporaryVoiceBan1"), 
    [v20.VoiceChatSuspendedPermanent] = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Revoked"), 
    [v20.VoiceLoading] = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Connecting"), 
    [v20.VoiceToxicityModal] = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.VoiceToxicityModal"), 
    [v20.VoiceToxicityToast] = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.VoiceToxicityToast"), 
    [v20.VoiceToxicityFeedbackToast] = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.ThanksForLettingUsKnow"), 
    [v20.VoiceChatSuspendedTemporaryToast] = function(v52) --[[ Line: 180 ]]
        -- upvalues: v45 (copy)
        return v45:FormatByKey("Feature.SettingsHub.Description.ChatWithVoiceDisabledUntil", {
            dateTime = v52
        });
    end, 
    [v20.VoiceConsentDeclinedToast] = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.JoinVoiceLater"), 
    [v20.VoiceConsentAcceptedToast] = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.MuteAnyoneAnytime"), 
    [v20.VoiceConsentModalV1] = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.InExpVoiceUpsell1"), 
    [v20.VoiceConsentModalV2] = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.InExpVoiceUpsell2"), 
    [v20.VoiceConsentModalV3] = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.InExpVoiceUpsell2"), 
    [v20.JoinedVoiceToast] = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.DisconnectOrMute"), 
    [v20.JoinVoiceSTUX] = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.DisconnectOrMuteHere"), 
    [v20.DevicePermissionsModal] = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.AllowMicrophoneAccess"), 
    [v20.VoiceDataConsentOptOutToast] = if v41() then v46:Format("Feature.SettingsHub.Prompt.Subtitle.ThanksForVoiceData") else nil, 
    [v20.UnifiedJoinVoiceToast] = if v43() then v46:Format(v50) else if v42() then v46:Format("Feature.SettingsHub.Prompt.Subtitle.TalkInAgeGroupV2") else nil, 
    [v20.AgeCheckForVoiceToast] = if l_GetFFlagShowToastWhenAgeGatingVoice_0() then v46:Format("Feature.SettingsHub.Prompt.Subtitle.GoToAccountInfo") else nil, 
    [v20.UpdateOnAutoJoinToast] = if v43() then v46:Format(v51) else nil
};
if l_RunService_0:IsStudio() then
    v49[v20.Place] = v45:FormatByKey("Feature.SettingsHub.Prompt.Place");
    v49[v20.User] = v45:FormatByKey("Feature.SettingsHub.Prompt.User");
    v53[v20.Place] = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Place");
    v53[v20.User] = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.User");
end;
local _ = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Respect");
local v55 = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.FutureViolations");
local v56 = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.EffectiveUntil");
local v57 = v45:FormatByKey("Feature.SettingsHub.Prompt.Understand");
local v58 = v45:FormatByKey("Feature.SettingsHub.Prompt.GotIt");
local v59 = v45:FormatByKey("Feature.SettingsHub.Prompt.IncorrectNudge");
local v60 = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporaryVoiceBan2");
local function _(v61) --[[ Line: 242 ]] --[[ Name: PromptTypeIsBan ]]
    -- upvalues: v20 (copy)
    local v62 = true;
    if v61 ~= v20.VoiceChatSuspendedPermanent then
        v62 = true;
        if v61 ~= v20.VoiceChatSuspendedTemporary then
            v62 = true;
            if v61 ~= v20.VoiceChatSuspendedTemporaryAvatarChat then
                v62 = v61 == v20.VoiceChatSuspendedTemporaryB;
            end;
        end;
    end;
    return v62;
end;
local function _(v64) --[[ Line: 249 ]] --[[ Name: IsModalNudge ]]
    -- upvalues: v20 (copy)
    return v64 == v20.VoiceToxicityModal;
end;
local function _(v66) --[[ Line: 253 ]] --[[ Name: IsVoiceConsentModal ]]
    -- upvalues: v20 (copy)
    local v67 = true;
    if v66 ~= v20.VoiceConsentModalV1 then
        v67 = true;
        if v66 ~= v20.VoiceConsentModalV2 then
            v67 = v66 == v20.VoiceConsentModalV3;
        end;
    end;
    return v67;
end;
local function _(v69) --[[ Line: 259 ]] --[[ Name: IsDevicePermissionsModal ]]
    -- upvalues: v20 (copy)
    return v69 == v20.DevicePermissionsModal;
end;
local function _(v71) --[[ Line: 263 ]] --[[ Name: PromptTypeIsModal ]]
    -- upvalues: v20 (copy)
    local v72 = true;
    if v71 ~= v20.VoiceChatSuspendedPermanent then
        v72 = true;
        if v71 ~= v20.VoiceChatSuspendedTemporary then
            v72 = true;
            if v71 ~= v20.VoiceChatSuspendedTemporaryAvatarChat then
                v72 = v71 == v20.VoiceChatSuspendedTemporaryB;
            end;
        end;
    end;
    if not v72 then
        v72 = v71 == v20.VoiceToxicityModal;
        if not v72 then
            v72 = true;
            if v71 ~= v20.VoiceConsentModalV1 then
                v72 = true;
                if v71 ~= v20.VoiceConsentModalV2 then
                    v72 = v71 == v20.VoiceConsentModalV3;
                end;
            end;
            if not v72 then
                v72 = v71 == v20.DevicePermissionsModal;
            end;
        end;
    end;
    return v72;
end;
local function _(v74) --[[ Line: 270 ]] --[[ Name: PromptTypeIsVoiceConsent ]]
    -- upvalues: v20 (copy)
    local v75 = true;
    if v74 ~= v20.VoiceConsentDeclinedToast then
        v75 = v74 == v20.VoiceConsentAcceptedToast;
    end;
    return v75;
end;
local function _(v77) --[[ Line: 274 ]] --[[ Name: PromptTypeIsVoiceDataConsent ]]
    -- upvalues: v20 (copy)
    return v77 == v20.VoiceDataConsentOptOutToast;
end;
local function _(v79) --[[ Line: 278 ]] --[[ Name: PromptTypeIsConnectDisconnectToast ]]
    -- upvalues: v20 (copy), v42 (copy)
    local v80 = true;
    if v79 ~= v20.JoinVoice then
        v80 = true;
        if v79 ~= v20.LeaveVoice then
            v80 = v42() and v79 == v20.UnifiedJoinVoiceToast;
        end;
    end;
    return v80;
end;
local function _(v82) --[[ Line: 284 ]] --[[ Name: ShouldShowBannedUntil ]]
    -- upvalues: v20 (copy)
    local v83 = true;
    if v82 ~= v20.VoiceChatSuspendedTemporary then
        v83 = true;
        if v82 ~= v20.VoiceChatSuspendedTemporaryAvatarChat then
            v83 = true;
            if v82 ~= v20.VoiceChatSuspendedTemporaryToast then
                v83 = v82 == v20.VoiceChatSuspendedTemporaryB;
            end;
        end;
    end;
    return v83;
end;
local function _(v85) --[[ Line: 291 ]] --[[ Name: ShouldShowSecondaryButton ]]
    -- upvalues: v20 (copy)
    local v86 = true;
    if v85 ~= v20.VoiceChatSuspendedTemporaryB then
        v86 = v85 == v20.VoiceToxicityModal;
    end;
    return v86;
end;
local v88 = v6.PureComponent:extend("VoiceChatPromptFrame");
v88.validateProps = v7.strictInterface({
    promptSignal = v7.optional(v7.RBXScriptSignal), 
    errorText = v7.optional(v7.string), 
    bannedUntil = v7.optional(v7.string), 
    onContinueFunc = v7.optional(v7.callback), 
    onPrimaryActivated = v7.optional(v7.callback), 
    onSecondaryActivated = v7.optional(v7.callback), 
    onReadyForSignal = v7.optional(v7.callback), 
    Analytics = v7.optional(v7.table), 
    VoiceChatServiceManager = v7.optional(v7.table), 
    showNewContent = v7.optional(v7.boolean), 
    showCheckbox = v7.optional(v7.boolean), 
    showDataConsentToast = v7.optional(v7.boolean), 
    policyMapper = v7.optional(v7.callback), 
    appStyle = l_validateStyle_0, 
    settingsAppAvailable = v7.optional(v7.boolean), 
    UserInputService = v7.optional(v7.table), 
    lastInput = v7.optional(v7.string)
});
v88.init = function(v89) --[[ Line: 316 ]] --[[ Name: init ]]
    -- upvalues: v20 (copy), l_GetFFlagSupportGamepadNavInVoiceModals_0 (copy), v6 (copy), v45 (copy), v49 (copy), v53 (copy), l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy), v42 (copy), v43 (copy), l_Images_0 (copy), v41 (copy), l_ContextActionService_0 (copy), v35 (copy)
    v89.promptStyle = {
        Theme = v89.props.appStyle.Theme, 
        Font = v89.props.appStyle.Font
    };
    v89.state = {
        screenSize = Vector2.new(0, 0), 
        promptType = v20.None, 
        toastContent = nil, 
        banEnd = "", 
        showPrompt = true
    };
    v89.ref = if l_GetFFlagSupportGamepadNavInVoiceModals_0() then v6.createRef() else nil;
    if v89.props.showNewContent then
        local v90 = v45:FormatByKey("Feature.SettingsHub.Prompt.MicUseSuspended");
        local v91 = v45:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporarySuspension2");
        v49[v20.VoiceChatSuspendedTemporary] = v90;
        v49[v20.VoiceChatSuspendedPermanent] = v90;
        v53[v20.VoiceChatSuspendedTemporary] = v91;
    end;
    v89.onScreenSizeChanged = function(v92) --[[ Line: 340 ]]
        -- upvalues: v89 (copy)
        if v89.state.screenSize ~= v92.AbsoluteSize then
            v89:setState({
                screenSize = v92.AbsoluteSize
            });
        end;
    end;
    v89.promptSignalCallback = function(v93) --[[ Line: 348 ]]
        -- upvalues: v20 (ref), v89 (copy), l_game_EngineFeature_0 (ref), l_RbxAnalyticsService_0 (ref), v49 (ref), v53 (ref), v42 (ref), v43 (ref), l_Images_0 (ref), v41 (ref), v45 (ref), v6 (ref)
        local v94 = true;
        if v93 ~= v20.VoiceChatSuspendedPermanent then
            v94 = true;
            if v93 ~= v20.VoiceChatSuspendedTemporary then
                v94 = true;
                if v93 ~= v20.VoiceChatSuspendedTemporaryAvatarChat then
                    v94 = v93 == v20.VoiceChatSuspendedTemporaryB;
                end;
            end;
        end;
        if v94 then
            if v89.props.Analytics then
                v89.props.Analytics:reportBanMessageEvent("Shown");
            end;
            if v89.props.VoiceChatServiceManager then
                v89.props.VoiceChatServiceManager:reportBanMessage("Shown");
            end;
        end;
        v94 = true;
        if v93 ~= v20.VoiceConsentModalV1 then
            v94 = true;
            if v93 ~= v20.VoiceConsentModalV2 then
                v94 = v93 == v20.VoiceConsentModalV3;
            end;
        end;
        if v94 and v89.props.Analytics then
            v94 = "";
            if l_game_EngineFeature_0 then
                v94 = l_RbxAnalyticsService_0:GetPlaySessionId();
            end;
            v89.props.Analytics:reportInExpConsent("shown", v89.props.VoiceChatServiceManager.inExpUpsellEntrypoint, game.GameId, game.PlaceId, v94);
        end;
        if v93 == v20.DevicePermissionsModal and v89.props.Analytics and v89.props.VoiceChatServiceManager then
            v89.props.Analytics:reportDevicePermissionsModalEvent("Shown", v89.props.VoiceChatServiceManager:GetSessionId(), v89.props.VoiceChatServiceManager:GetInExpUpsellAnalyticsData());
        end;
        if v93 and v93 ~= v20.None then
            v94 = v49[v93];
            local v95 = v53[v93];
            local v96 = true;
            if v93 ~= v20.JoinVoice then
                v96 = true;
                if v93 ~= v20.LeaveVoice then
                    v96 = v42() and v93 == v20.UnifiedJoinVoiceToast;
                end;
            end;
            if v96 and v89.props.VoiceChatServiceManager and v89.props.VoiceChatServiceManager:HasSeamlessVoiceFeature("HideJoinToastSubtitle") then
                v95 = nil;
            end;
            if typeof(v94) == "function" then
                v94 = v94(v89.props.bannedUntil);
            end;
            if typeof(v95) == "function" then
                v95 = v95(v89.props.bannedUntil);
            end;
            v96 = nil;
            if v43() and v93 == v20.UpdateOnAutoJoinToast then
                v96 = l_Images_0["icons/controls/microphone"];
            else
                local v97 = true;
                if v93 ~= v20.VoiceConsentDeclinedToast then
                    v97 = v93 == v20.VoiceConsentAcceptedToast;
                end;
                if v97 or v93 == v20.JoinedVoiceToast or v42() and v93 == v20.UnifiedJoinVoiceToast then
                    v96 = l_Images_0["icons/controls/publicAudioJoin"];
                else
                    v97 = true;
                    if v93 ~= v20.JoinVoice then
                        v97 = true;
                        if v93 ~= v20.LeaveVoice then
                            v97 = v42() and v93 == v20.UnifiedJoinVoiceToast;
                        end;
                    end;
                    v96 = if v97 then l_Images_0["icons/actions/info"] else if v93 == v20.VoiceDataConsentOptOutToast and v41() then nil else l_Images_0["icons/status/alert"];
                end;
            end;
            v89:setState({
                showPrompt = true, 
                promptType = v93, 
                toastContent = {
                    iconImage = v96, 
                    toastTitle = v94, 
                    toastSubtitle = v95, 
                    onActivated = function() --[[ Line: 426 ]] --[[ Name: onActivated ]]
                        -- upvalues: v89 (ref)
                        if v89.props.onPrimaryActivated then
                            v89.props.onPrimaryActivated();
                        end;
                    end, 
                    onDismissed = function() --[[ Line: 431 ]] --[[ Name: onDismissed ]]

                    end
                }
            });
            local v98 = true;
            if v93 ~= v20.VoiceChatSuspendedTemporary then
                v98 = true;
                if v93 ~= v20.VoiceChatSuspendedTemporaryAvatarChat then
                    v98 = true;
                    if v93 ~= v20.VoiceChatSuspendedTemporaryToast then
                        v98 = v93 == v20.VoiceChatSuspendedTemporaryB;
                    end;
                end;
            end;
            if v98 then
                v98 = v45:FormatByKey("Feature.SettingsHub.Prompt.XMinuteSuspension", {
                    banDurationInMinutes = v89.props.bannedUntil
                });
                local v99 = if v93 == v20.VoiceChatSuspendedTemporaryB then v98 else " " .. v89.props.bannedUntil .. ".";
                v89:setState({
                    banEnd = v99
                });
                return;
            end;
        else
            v89:setState({
                promptType = v20.None, 
                toastContent = v6.None
            });
        end;
    end;
    v89.closeVoiceBanPrompt = function() --[[ Line: 455 ]]
        -- upvalues: v89 (copy), l_ContextActionService_0 (ref), v20 (ref), v35 (ref)
        v89:setState({
            showPrompt = false
        });
        if v89.props.onContinueFunc then
            v89.props.onContinueFunc();
        end;
        l_ContextActionService_0:UnbindCoreAction("CloseVoiceBanPrompt");
        local v100 = v89.state.promptType == v20.VoiceChatSuspendedTemporaryB;
        if v35 then
            local l_promptType_0 = v89.state.promptType;
            local v102 = true;
            if l_promptType_0 ~= v20.VoiceChatSuspendedPermanent then
                v102 = true;
                if l_promptType_0 ~= v20.VoiceChatSuspendedTemporary then
                    v102 = true;
                    if l_promptType_0 ~= v20.VoiceChatSuspendedTemporaryAvatarChat then
                        v102 = l_promptType_0 == v20.VoiceChatSuspendedTemporaryB;
                    end;
                end;
            end;
            if v102 and not v100 then
                if v89.props.Analytics then
                    v89.props.Analytics:reportBanMessageEvent("Acknowledged");
                end;
                if v89.props.VoiceChatServiceManager then
                    v89.props.VoiceChatServiceManager:reportBanMessage("Acknowledged");
                    return;
                end;
            end;
        elseif not v100 then
            if v89.props.Analytics then
                v89.props.Analytics:reportBanMessageEvent("Acknowledged");
            end;
            if v89.props.VoiceChatServiceManager then
                v89.props.VoiceChatServiceManager:reportBanMessage("Acknowledged");
            end;
        end;
    end;
    v89.checkInputStateForClosePrompt = function(_, v104, _) --[[ Line: 489 ]]
        -- upvalues: v89 (copy)
        if v104 == Enum.UserInputState.Begin then
            v89.closeVoiceBanPrompt();
        end;
    end;
    v89.handlePrimayActivated = function() --[[ Line: 495 ]]
        -- upvalues: v89 (copy)
        v89.closeVoiceBanPrompt();
        if v89.props.onPrimaryActivated then
            v89.props.onPrimaryActivated();
        end;
    end;
    v89.handleSecondaryActivated = function() --[[ Line: 502 ]]
        -- upvalues: v89 (copy)
        v89.closeVoiceBanPrompt();
        if v89.props.onSecondaryActivated then
            v89.props.onSecondaryActivated();
        end;
    end;
end;
v88.render = function(v106) --[[ Line: 510 ]] --[[ Name: render ]]
    -- upvalues: v31 (copy), v20 (copy), l_GetFFlagShowDevicePermissionsModal_0 (copy), l_GetFFlagEnableVoiceNudge_0 (copy), l_TextService_0 (copy), v56 (copy), v60 (copy), v55 (copy), l_GetFFlagSupportGamepadNavInVoiceModals_0 (copy), v6 (copy), v13 (copy), v25 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v58 (copy), v57 (copy), v59 (copy), v24 (copy), v49 (copy), v53 (copy), l_UserInputService_0 (copy), v22 (copy), l_CoreGui_0 (copy), v23 (copy), v34 (copy), v40 (copy), v41 (copy), l_Toast_0 (copy), l_ExternalEventConnection_0 (copy)
    local v107 = v31() and v106.props.errorText or nil;
    local v108 = v106.state.promptType == v20.VoiceToxicityModal;
    local v109 = v106.state.promptType == v20.VoiceToxicityToast;
    local v110 = v106.state.promptType == v20.VoiceChatSuspendedTemporaryB;
    local l_promptType_1 = v106.state.promptType;
    local v112 = true;
    if l_promptType_1 ~= v20.VoiceConsentModalV1 then
        v112 = true;
        if l_promptType_1 ~= v20.VoiceConsentModalV2 then
            v112 = l_promptType_1 == v20.VoiceConsentModalV3;
        end;
    end;
    l_promptType_1 = l_GetFFlagShowDevicePermissionsModal_0() and v106.state.promptType == v20.DevicePermissionsModal;
    local v113 = if l_GetFFlagEnableVoiceNudge_0() then Enum.AutomaticSize.Y else Enum.AutomaticSize.None;
    local _ = nil;
    local l_promptType_2 = v106.state.promptType;
    local v116 = true;
    if l_promptType_2 ~= v20.VoiceChatSuspendedPermanent then
        v116 = true;
        if l_promptType_2 ~= v20.VoiceChatSuspendedTemporary then
            v116 = true;
            if l_promptType_2 ~= v20.VoiceChatSuspendedTemporaryAvatarChat then
                v116 = l_promptType_2 == v20.VoiceChatSuspendedTemporaryB;
            end;
        end;
    end;
    if not v116 then
        v116 = l_promptType_2 == v20.VoiceToxicityModal;
        if not v116 then
            v116 = true;
            if l_promptType_2 ~= v20.VoiceConsentModalV1 then
                v116 = true;
                if l_promptType_2 ~= v20.VoiceConsentModalV2 then
                    v116 = l_promptType_2 == v20.VoiceConsentModalV3;
                end;
            end;
            if not v116 then
                v116 = l_promptType_2 == v20.DevicePermissionsModal;
            end;
        end;
    end;
    if v116 then
        v116 = v106.state.toastContent.toastTitle;
        l_promptType_2 = v106.promptStyle.Font.Header1.Font;
        local v117 = v106.promptStyle.Font.Header1.RelativeSize * v106.promptStyle.Font.BaseSize;
        local v118 = 20 + l_TextService_0:GetTextSize(v116, v117, l_promptType_2, Vector2.new(325, 1e999)).Y;
        local v119 = if v110 then v106.state.banEnd else v56 .. v106.state.banEnd;
        local v120 = if v106.state.banEnd ~= "" then "<b>" .. v119 .. "</b><br />" .. v106.state.toastContent.toastSubtitle else v106.state.toastContent.toastSubtitle .. v106.state.banEnd;
        local v121 = v107 or v120;
        local l_Font_0 = v106.promptStyle.Font.Body.Font;
        local v123 = v106.promptStyle.Font.Body.RelativeSize * v106.promptStyle.Font.BaseSize;
        local v124 = 20 + l_TextService_0:GetTextSize(v121, v123, l_Font_0, Vector2.new(325, 1e999)).Y;
        if v110 then
            v124 = v124 + 20;
        end;
        local v125 = if v110 then v60 else v55;
        local v126 = 20 + l_TextService_0:GetTextSize(v125, v123, l_Font_0, Vector2.new(325, 1e999)).Y;
        local l_promptType_3 = v106.state.promptType;
        local v128 = true;
        if l_promptType_3 ~= v20.VoiceChatSuspendedTemporaryB then
            v128 = l_promptType_3 == v20.VoiceToxicityModal;
        end;
        l_promptType_3 = if l_GetFFlagSupportGamepadNavInVoiceModals_0() then Enum.SelectionBehavior.Stop else nil;
        local v129 = l_GetFFlagSupportGamepadNavInVoiceModals_0() and true or nil;
        local v130 = v6.createElement("ScreenGui", {
            DisplayOrder = 8, 
            IgnoreGuiInset = true, 
            OnTopOfCoreBlur = true, 
            Enabled = v106.state.showPrompt, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            Overlay = v6.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundColor3 = v106.promptStyle.Theme.Overlay.Color, 
                BackgroundTransparency = v106.promptStyle.Theme.Overlay.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = ""
            }), 
            DialogMainFrame = v6.createElement(v13.Core.ImageSet.ImageSetLabel, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = v25.Images.RoundedRect.Image, 
                ImageColor3 = v106.promptStyle.Theme.BackgroundUIDefault.Color, 
                ImageTransparency = v106.promptStyle.Theme.BackgroundUIDefault.Transparency, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                ScaleType = v25.Images.RoundedRect.ScaleType, 
                Size = UDim2.new(0, 365, 0, 55 + v118 + 1 + v124 + 14 + v126 + 36 + 40), 
                AutomaticSize = v113, 
                SliceCenter = v25.Images.RoundedRect.SliceCenter, 
                SelectionBehaviorDown = l_promptType_3, 
                SelectionBehaviorLeft = l_promptType_3, 
                SelectionBehaviorRight = l_promptType_3, 
                SelectionBehaviorUp = l_promptType_3, 
                SelectionGroup = v129, 
                ref = if l_GetFFlagSupportGamepadNavInVoiceModals_0() then v106.ref else nil
            }, {
                Padding = v6.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 20), 
                    PaddingBottom = UDim.new(0, 20), 
                    PaddingLeft = UDim.new(0, 20), 
                    PaddingRight = UDim.new(0, 20)
                }), 
                Layout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Icon = v6.createElement(v13.Core.ImageSet.ImageSetLabel, {
                    Position = UDim2.fromScale(0.5, 0.5), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Image = v106.state.toastContent.iconImage, 
                    Size = UDim2.new(0, 55, 0, 55), 
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }), 
                TitleTextContainer = v6.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, v118), 
                    AutomaticSize = v113
                }, {
                    TitleText = v6.createElement(v13.App.Text.StyledTextLabel, {
                        fontStyle = v106.promptStyle.Font.Header1, 
                        colorStyle = v106.promptStyle.Theme.SystemPrimaryDefault, 
                        textXAlignment = Enum.TextXAlignment.Center, 
                        size = UDim2.new(1, 0, 1, 0), 
                        text = v116
                    })
                }), 
                Divider = v6.createElement("Frame", {
                    BackgroundColor3 = v106.promptStyle.Theme.Divider.Color, 
                    BackgroundTransparency = v106.promptStyle.Theme.Divider.Transparency, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 3, 
                    Size = UDim2.new(0.8, 0, 0, 1)
                }), 
                DividerSpaceContainer = v6.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, 0, 0, 7)
                }), 
                BodyTextContainer = v6.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 5, 
                    Size = UDim2.new(1, 0, 0, v124)
                }, {
                    BodyText = v6.createElement(v13.App.Text.StyledTextLabel, {
                        fontStyle = v106.promptStyle.Font.Body, 
                        colorStyle = v106.promptStyle.Theme.TextDefault, 
                        textXAlignment = Enum.TextXAlignment.Center, 
                        size = UDim2.new(1, 0, 1, 0), 
                        text = v121
                    })
                }), 
                TextSpaceContainer = v6.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 6, 
                    Size = UDim2.new(1, 0, 0, 7)
                }), 
                SubBodyTextContainer = not v108 and v6.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 7, 
                    Size = UDim2.new(1, 0, 0, v126), 
                    AutomaticSize = v113
                }, {
                    BodyText = v6.createElement(v13.App.Text.StyledTextLabel, {
                        fontStyle = v106.promptStyle.Font.Body, 
                        colorStyle = v106.promptStyle.Theme.TextDefault, 
                        textXAlignment = Enum.TextXAlignment.Center, 
                        size = UDim2.new(1, 0, 1, 0), 
                        text = v125
                    })
                }), 
                SpaceContainer2 = v6.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 8, 
                    Size = UDim2.new(1, 0, 0, 10)
                }), 
                ButtonContainer = v6.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 9, 
                    Size = UDim2.new(1, 0, 0, 36), 
                    AutomaticSize = v113
                }, {
                    Layout = v6.createElement("UIListLayout", {
                        FillDirection = if l_GetFFlagEnableVoiceNudge_0() then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, 20), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    ConfirmButton = v6.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        layoutOrder = 1, 
                        size = if l_GetFFlagEnableVoiceNudge_0() then UDim2.new(1, -5, 0, 48) else UDim2.new(1, -5, 1, 0), 
                        text = if v108 then v58 else v57, 
                        onActivated = if l_GetFFlagEnableVoiceNudge_0() then v106.handlePrimayActivated else v106.closeVoiceBanPrompt, 
                        Selectable = v129
                    }), 
                    SecondaryButton = v128 and v6.createElement(v13.App.Button.LinkButton, {
                        layoutOrder = 1, 
                        size = UDim2.new(1, -5, 0, 36), 
                        text = v59, 
                        colorStyleDefault = "TextMuted", 
                        colorStyleHover = "TextMuted", 
                        onActivated = v106.handleSecondaryActivated
                    })
                })
            })
        });
        if l_promptType_1 then
            v130 = v6.createElement(v24, {
                titleText = v49[v106.state.promptType], 
                bodyText = v53[v106.state.promptType], 
                handlePrimaryActivated = v106.handlePrimayActivated, 
                handleSecondaryActivated = v106.handleSecondaryActivated, 
                Analytics = v106.props.Analytics, 
                promptStyle = v106.promptStyle, 
                showPrompt = v106.state.showPrompt, 
                settingsAppAvailable = v106.props.settingsAppAvailable, 
                UserInputService = if v106.props.UserInputService ~= nil then v106.props.UserInputService else l_UserInputService_0, 
                ref = if l_GetFFlagSupportGamepadNavInVoiceModals_0() then v106.ref else nil
            });
        end;
        if v112 then
            v130 = v6.createElement(v22, {
                titleText = v49[v106.state.promptType], 
                bodyText = v53[v106.state.promptType], 
                handlePrimaryActivated = v106.handlePrimayActivated, 
                handleSecondaryActivated = v106.handleSecondaryActivated, 
                Analytics = v106.props.Analytics, 
                showCheckbox = v106.props.showCheckbox, 
                promptStyle = v106.promptStyle, 
                showPrompt = v106.state.showPrompt, 
                ref = if l_GetFFlagSupportGamepadNavInVoiceModals_0() then v106.ref else nil
            });
        end;
        return (v6.createElement(v6.Portal, {
            target = l_CoreGui_0
        }, {
            InGameMenuInformationalDialog = v130
        }));
    elseif v106.state.promptType == v20.JoinVoiceSTUX then
        return (v6.createElement(v23, {
            titleText = v49[v106.state.promptType], 
            subtitleText = v53[v106.state.promptType], 
            promptStyle = v106.promptStyle, 
            showPrompt = v106.state.showPrompt, 
            onClose = function() --[[ Line: 776 ]] --[[ Name: onClose ]]
                -- upvalues: v106 (copy)
                v106:setState({
                    showPrompt = false
                });
            end, 
            onMenuOpen = v106.hideOnMenuOpen
        }));
    else
        v116 = nil;
        v116 = if v109 then v34() else if v106.state.promptType == v20.JoinedVoiceToast then v40() else 3;
        l_promptType_2 = v106.state.showPrompt;
        if v106.state.promptType == v20.VoiceDataConsentOptOutToast and v41() then
            l_promptType_2 = if v106.props.showDataConsentToast then v106.props.showDataConsentToast else false;
        end;
        local l_createElement_0 = v6.createElement;
        local v132 = "Frame";
        local v133 = {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            [v6.Change.AbsoluteSize] = v106.onScreenSizeChanged
        };
        local v134 = {};
        local v135 = false;
        if v106.state.promptType ~= v20.None then
            v135 = v6.createElement(l_Toast_0, {
                duration = if v109 then v34() else v116, 
                toastContent = v106.state.toastContent, 
                show = l_promptType_2
            });
        end;
        v134.Toast = v135;
        v134.EventConnection = v106.props.promptSignal and v6.createElement(l_ExternalEventConnection_0, {
            event = v106.props.promptSignal, 
            callback = v106.promptSignalCallback
        });
        return (l_createElement_0(v132, v133, v134));
    end;
end;
v88.didUpdate = function(v136) --[[ Line: 820 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_GetFFlagSupportGamepadNavInVoiceModals_0 (copy), v11 (copy), l_GuiService_0 (copy)
    if l_GetFFlagSupportGamepadNavInVoiceModals_0() then
        if v136.props.lastInput == v11.Input.Directional then
            local v137 = v136.ref:getValue();
            if v136.state.showPrompt and v137 then
                l_GuiService_0:Select(v137);
            end;
            if not v136.state.showPrompt and v137 then
                l_GuiService_0.SelectedCoreObject = nil;
                return;
            end;
        elseif l_GuiService_0.SelectedCoreObject then
            l_GuiService_0.SelectedCoreObject = nil;
        end;
    end;
end;
v88.didMount = function(v138) --[[ Line: 852 ]] --[[ Name: didMount ]]
    -- upvalues: l_ContextActionService_0 (copy)
    if v138.props.onReadyForSignal then
        v138.props.onReadyForSignal();
    end;
    l_ContextActionService_0:BindCoreAction("CloseVoiceBanPrompt", v138.checkInputStateForClosePrompt, false, Enum.KeyCode.ButtonA);
    l_ContextActionService_0:BindCoreAction("CloseVoiceBanPrompt", v138.checkInputStateForClosePrompt, false, Enum.KeyCode.ButtonB);
end;
v88 = v21.connect(function(v139, _) --[[ Line: 870 ]]
    return {
        showNewContent = v139.getGameInfoShowChatFeatures(), 
        showCheckbox = v139.getDisplayCheckboxInVoiceConsent(), 
        showDataConsentToast = v139.getDisplayCheckboxInVoiceConsent() ~= nil and v139.getDisplayCheckboxInVoiceConsent()
    };
end)(v88);
local function v144(v141) --[[ Line: 880 ]] --[[ Name: WrappedVoiceChatPromptFrame ]]
    -- upvalues: l_useStyle_0 (copy), l_GetFFlagSupportGamepadNavInVoiceModals_0 (copy), l_useLastInput_0 (copy), v6 (copy), v88 (ref), v8 (copy)
    local v142 = l_useStyle_0();
    local v143 = if l_GetFFlagSupportGamepadNavInVoiceModals_0() then l_useLastInput_0() else nil;
    return v6.createElement(v88, v8.Dictionary.join(v141, {
        appStyle = v142, 
        lastInput = if l_GetFFlagSupportGamepadNavInVoiceModals_0() then v143 else nil
    }));
end;
return function(v145) --[[ Line: 891 ]]
    -- upvalues: v9 (copy), v6 (copy), v144 (copy)
    return v9({
        v6.createElement(v144, v145)
    });
end;