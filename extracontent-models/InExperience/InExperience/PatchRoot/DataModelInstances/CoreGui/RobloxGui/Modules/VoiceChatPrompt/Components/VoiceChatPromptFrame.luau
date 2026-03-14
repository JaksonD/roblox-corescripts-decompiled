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
local l_GetFFlagShowDevicePermissionsModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagShowDevicePermissionsModal;
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local v38 = require(l_RobloxGui_0.Modules.Flags.GetFIntVoiceJoinM3ToastDurationSeconds);
local v39 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableSeamlessVoiceDataConsentToast);
local v40 = require(script.Parent.Parent.Parent.VoiceChat.Flags.GetFFlagUpdateVoiceConnectionToasts);
local v41 = require(script.Parent.Parent.Parent.VoiceChat.Flags.GetFFlagEnableVoiceTrustedConnectionsToasts);
local l_GetFFlagShowToastWhenAgeGatingVoice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagShowToastWhenAgeGatingVoice;
local v43 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v44 = nil;
if v39() or v40() or l_GetFFlagShowToastWhenAgeGatingVoice_0() then
    local l_LocalizationService_0 = game:GetService("LocalizationService");
    v44 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization.new(l_LocalizationService_0.RobloxLocaleId);
end;
local _ = v6.PureComponent:extend("VoiceChatPromptFrame");
local v47 = {
    [v20.None] = "", 
    [v20.NotAudible] = v43:FormatByKey("Feature.SettingsHub.Prompt.NotAudible"), 
    [v20.Permission] = v43:FormatByKey("Feature.SettingsHub.Prompt.MicrophonePermission"), 
    [v20.Retry] = v43:FormatByKey("Feature.SettingsHub.Prompt.MicrophonePermission"), 
    [v20.Place] = "Exceeds Max Players", 
    [v20.User] = "Not Eligible for Voice", 
    [v20.VoiceChatSuspendedTemporaryAvatarChat] = v43:FormatByKey("Feature.SettingsHub.Prompt.MicAndCameraUseSuspended"), 
    [v20.VoiceChatSuspendedTemporary] = v43:FormatByKey("Feature.SettingsHub.Prompt.MicUseSuspended"), 
    [v20.VoiceChatSuspendedTemporaryB] = v43:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatSuspended"), 
    [v20.VoiceChatSuspendedPermanent] = v43:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatSuspended"), 
    [v20.VoiceLoading] = v43:FormatByKey("Feature.SettingsHub.Prompt.Connecting"), 
    [v20.VoiceToxicityModal] = v43:FormatByKey("Feature.SettingsHub.Prompt.RememberRules"), 
    [v20.VoiceToxicityToast] = v43:FormatByKey("Feature.SettingsHub.Prompt.RememberRules"), 
    [v20.VoiceToxicityFeedbackToast] = v43:FormatByKey("Feature.SettingsHub.Prompt.ThankYouForFeedback"), 
    [v20.VoiceChatSuspendedTemporaryToast] = v43:FormatByKey("Feature.SettingsHub.Prompt.MicUseSuspended"), 
    [v20.VoiceConsentDeclinedToast] = v43:FormatByKey("Feature.SettingsHub.Prompt.ChangeYourMind"), 
    [v20.VoiceConsentAcceptedToast] = v43:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChat"), 
    [v20.VoiceConsentModalV1] = v43:FormatByKey("Feature.SettingsHub.Prompt.GetVoiceChat"), 
    [v20.VoiceConsentModalV2] = v43:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatWithOthers"), 
    [v20.VoiceConsentModalV3] = v43:FormatByKey("Feature.SettingsHub.Prompt.GetVoiceChat"), 
    [v20.JoinedVoiceToast] = v43:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChat"), 
    [v20.JoinVoiceSTUX] = v43:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChat"), 
    [v20.LeaveVoice] = if v40() then v44:Format("Feature.SettingsHub.Prompt.LeaveVoiceChatV2") else v43:FormatByKey("Feature.SettingsHub.Prompt.LeaveVoiceChat"), 
    [v20.JoinVoice] = v43:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChatV2"), 
    [v20.DevicePermissionsModal] = v43:FormatByKey("Feature.SettingsHub.Prompt.NeedMicrophoneAccess"), 
    [v20.VoiceDataConsentOptOutToast] = if v39() then v44:Format("Feature.SettingsHub.Prompt.Title.ImproveVoiceChat") else nil, 
    [v20.UnifiedJoinVoiceToast] = if v40() then v44:Format("Feature.SettingsHub.Prompt.JoinedVoiceChatV3") else nil, 
    [v20.AgeCheckForVoiceToast] = if l_GetFFlagShowToastWhenAgeGatingVoice_0() then v44:Format("Feature.SettingsHub.Prompt.Title.AgeCheckForVoiceToast") else nil, 
    [v20.UpdateOnAutoJoinToast] = if v41() then v44:Format("Feature.SettingsHub.Prompt.UpdateToVoiceChat") else nil
};
local v49 = {
    [v20.None] = "", 
    [v20.NotAudible] = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.NotAudible"), 
    [v20.Permission] = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.MicrophonePermission"), 
    [v20.Retry] = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Retry"), 
    [v20.Place] = "Spatial voice is only available for places with Max Players of 30 or less.", 
    [v20.User] = "This account is not eligible to use Spatial Voice.", 
    [v20.VoiceChatSuspendedTemporary] = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Microphone"), 
    [v20.VoiceChatSuspendedTemporaryAvatarChat] = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.MicAndCamera"), 
    [v20.VoiceChatSuspendedTemporaryB] = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporaryVoiceBan1"), 
    [v20.VoiceChatSuspendedPermanent] = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Revoked"), 
    [v20.VoiceLoading] = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Connecting"), 
    [v20.VoiceToxicityModal] = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.VoiceToxicityModal"), 
    [v20.VoiceToxicityToast] = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.VoiceToxicityToast"), 
    [v20.VoiceToxicityFeedbackToast] = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.ThanksForLettingUsKnow"), 
    [v20.VoiceChatSuspendedTemporaryToast] = function(v48) --[[ Line: 172 ]]
        -- upvalues: v43 (copy)
        return v43:FormatByKey("Feature.SettingsHub.Description.ChatWithVoiceDisabledUntil", {
            dateTime = v48
        });
    end, 
    [v20.VoiceConsentDeclinedToast] = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.JoinVoiceLater"), 
    [v20.VoiceConsentAcceptedToast] = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.MuteAnyoneAnytime"), 
    [v20.VoiceConsentModalV1] = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.InExpVoiceUpsell1"), 
    [v20.VoiceConsentModalV2] = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.InExpVoiceUpsell2"), 
    [v20.VoiceConsentModalV3] = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.InExpVoiceUpsell2"), 
    [v20.JoinedVoiceToast] = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.DisconnectOrMute"), 
    [v20.JoinVoiceSTUX] = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.DisconnectOrMuteHere"), 
    [v20.DevicePermissionsModal] = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.AllowMicrophoneAccess"), 
    [v20.VoiceDataConsentOptOutToast] = if v39() then v44:Format("Feature.SettingsHub.Prompt.Subtitle.ThanksForVoiceData") else nil, 
    [v20.UnifiedJoinVoiceToast] = if v41() then v44:Format("Feature.SettingsHub.Prompt.Subtitle.TalkInAgeGroupTrustedConnections") else if v40() then v44:Format("Feature.SettingsHub.Prompt.Subtitle.TalkInAgeGroupV2") else nil, 
    [v20.AgeCheckForVoiceToast] = if l_GetFFlagShowToastWhenAgeGatingVoice_0() then v44:Format("Feature.SettingsHub.Prompt.Subtitle.GoToAccountInfo") else nil, 
    [v20.UpdateOnAutoJoinToast] = if v41() then v44:Format("Feature.SettingsHub.Prompt.Subtitle.TalkAgeGroupTrustedConnectionsUpdate") else nil
};
if l_RunService_0:IsStudio() then
    v47[v20.Place] = v43:FormatByKey("Feature.SettingsHub.Prompt.Place");
    v47[v20.User] = v43:FormatByKey("Feature.SettingsHub.Prompt.User");
    v49[v20.Place] = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Place");
    v49[v20.User] = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.User");
end;
local _ = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Respect");
local v51 = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.FutureViolations");
local v52 = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.EffectiveUntil");
local v53 = v43:FormatByKey("Feature.SettingsHub.Prompt.Understand");
local v54 = v43:FormatByKey("Feature.SettingsHub.Prompt.GotIt");
local v55 = v43:FormatByKey("Feature.SettingsHub.Prompt.IncorrectNudge");
local v56 = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporaryVoiceBan2");
local function _(v57) --[[ Line: 233 ]] --[[ Name: PromptTypeIsBan ]]
    -- upvalues: v20 (copy)
    local v58 = true;
    if v57 ~= v20.VoiceChatSuspendedPermanent then
        v58 = true;
        if v57 ~= v20.VoiceChatSuspendedTemporary then
            v58 = true;
            if v57 ~= v20.VoiceChatSuspendedTemporaryAvatarChat then
                v58 = v57 == v20.VoiceChatSuspendedTemporaryB;
            end;
        end;
    end;
    return v58;
end;
local function _(v60) --[[ Line: 240 ]] --[[ Name: IsModalNudge ]]
    -- upvalues: v20 (copy)
    return v60 == v20.VoiceToxicityModal;
end;
local function _(v62) --[[ Line: 244 ]] --[[ Name: IsVoiceConsentModal ]]
    -- upvalues: v20 (copy)
    local v63 = true;
    if v62 ~= v20.VoiceConsentModalV1 then
        v63 = true;
        if v62 ~= v20.VoiceConsentModalV2 then
            v63 = v62 == v20.VoiceConsentModalV3;
        end;
    end;
    return v63;
end;
local function _(v65) --[[ Line: 250 ]] --[[ Name: IsDevicePermissionsModal ]]
    -- upvalues: v20 (copy)
    return v65 == v20.DevicePermissionsModal;
end;
local function _(v67) --[[ Line: 254 ]] --[[ Name: PromptTypeIsModal ]]
    -- upvalues: v20 (copy)
    local v68 = true;
    if v67 ~= v20.VoiceChatSuspendedPermanent then
        v68 = true;
        if v67 ~= v20.VoiceChatSuspendedTemporary then
            v68 = true;
            if v67 ~= v20.VoiceChatSuspendedTemporaryAvatarChat then
                v68 = v67 == v20.VoiceChatSuspendedTemporaryB;
            end;
        end;
    end;
    if not v68 then
        v68 = v67 == v20.VoiceToxicityModal;
        if not v68 then
            v68 = true;
            if v67 ~= v20.VoiceConsentModalV1 then
                v68 = true;
                if v67 ~= v20.VoiceConsentModalV2 then
                    v68 = v67 == v20.VoiceConsentModalV3;
                end;
            end;
            if not v68 then
                v68 = v67 == v20.DevicePermissionsModal;
            end;
        end;
    end;
    return v68;
end;
local function _(v70) --[[ Line: 261 ]] --[[ Name: PromptTypeIsVoiceConsent ]]
    -- upvalues: v20 (copy)
    local v71 = true;
    if v70 ~= v20.VoiceConsentDeclinedToast then
        v71 = v70 == v20.VoiceConsentAcceptedToast;
    end;
    return v71;
end;
local function _(v73) --[[ Line: 265 ]] --[[ Name: PromptTypeIsVoiceDataConsent ]]
    -- upvalues: v20 (copy)
    return v73 == v20.VoiceDataConsentOptOutToast;
end;
local function _(v75) --[[ Line: 269 ]] --[[ Name: PromptTypeIsConnectDisconnectToast ]]
    -- upvalues: v20 (copy), v40 (copy)
    local v76 = true;
    if v75 ~= v20.JoinVoice then
        v76 = true;
        if v75 ~= v20.LeaveVoice then
            v76 = v40() and v75 == v20.UnifiedJoinVoiceToast;
        end;
    end;
    return v76;
end;
local function _(v78) --[[ Line: 275 ]] --[[ Name: ShouldShowBannedUntil ]]
    -- upvalues: v20 (copy)
    local v79 = true;
    if v78 ~= v20.VoiceChatSuspendedTemporary then
        v79 = true;
        if v78 ~= v20.VoiceChatSuspendedTemporaryAvatarChat then
            v79 = true;
            if v78 ~= v20.VoiceChatSuspendedTemporaryToast then
                v79 = v78 == v20.VoiceChatSuspendedTemporaryB;
            end;
        end;
    end;
    return v79;
end;
local function _(v81) --[[ Line: 282 ]] --[[ Name: ShouldShowSecondaryButton ]]
    -- upvalues: v20 (copy)
    local v82 = true;
    if v81 ~= v20.VoiceChatSuspendedTemporaryB then
        v82 = v81 == v20.VoiceToxicityModal;
    end;
    return v82;
end;
local v84 = v6.PureComponent:extend("VoiceChatPromptFrame");
v84.validateProps = v7.strictInterface({
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
v84.init = function(v85) --[[ Line: 307 ]] --[[ Name: init ]]
    -- upvalues: v20 (copy), l_GetFFlagSupportGamepadNavInVoiceModals_0 (copy), v6 (copy), v43 (copy), v47 (copy), v49 (copy), l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy), v40 (copy), v41 (copy), l_Images_0 (copy), v39 (copy), l_ContextActionService_0 (copy), v35 (copy)
    v85.promptStyle = {
        Theme = v85.props.appStyle.Theme, 
        Font = v85.props.appStyle.Font
    };
    v85.state = {
        screenSize = Vector2.new(0, 0), 
        promptType = v20.None, 
        toastContent = nil, 
        banEnd = "", 
        showPrompt = true
    };
    v85.ref = if l_GetFFlagSupportGamepadNavInVoiceModals_0() then v6.createRef() else nil;
    if v85.props.showNewContent then
        local v86 = v43:FormatByKey("Feature.SettingsHub.Prompt.MicUseSuspended");
        local v87 = v43:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporarySuspension2");
        v47[v20.VoiceChatSuspendedTemporary] = v86;
        v47[v20.VoiceChatSuspendedPermanent] = v86;
        v49[v20.VoiceChatSuspendedTemporary] = v87;
    end;
    v85.onScreenSizeChanged = function(v88) --[[ Line: 331 ]]
        -- upvalues: v85 (copy)
        if v85.state.screenSize ~= v88.AbsoluteSize then
            v85:setState({
                screenSize = v88.AbsoluteSize
            });
        end;
    end;
    v85.promptSignalCallback = function(v89) --[[ Line: 339 ]]
        -- upvalues: v20 (ref), v85 (copy), l_game_EngineFeature_0 (ref), l_RbxAnalyticsService_0 (ref), v47 (ref), v49 (ref), v40 (ref), v41 (ref), l_Images_0 (ref), v39 (ref), v43 (ref), v6 (ref)
        local v90 = true;
        if v89 ~= v20.VoiceChatSuspendedPermanent then
            v90 = true;
            if v89 ~= v20.VoiceChatSuspendedTemporary then
                v90 = true;
                if v89 ~= v20.VoiceChatSuspendedTemporaryAvatarChat then
                    v90 = v89 == v20.VoiceChatSuspendedTemporaryB;
                end;
            end;
        end;
        if v90 then
            if v85.props.Analytics then
                v85.props.Analytics:reportBanMessageEvent("Shown");
            end;
            if v85.props.VoiceChatServiceManager then
                v85.props.VoiceChatServiceManager:reportBanMessage("Shown");
            end;
        end;
        v90 = true;
        if v89 ~= v20.VoiceConsentModalV1 then
            v90 = true;
            if v89 ~= v20.VoiceConsentModalV2 then
                v90 = v89 == v20.VoiceConsentModalV3;
            end;
        end;
        if v90 and v85.props.Analytics then
            v90 = "";
            if l_game_EngineFeature_0 then
                v90 = l_RbxAnalyticsService_0:GetPlaySessionId();
            end;
            v85.props.Analytics:reportInExpConsent("shown", v85.props.VoiceChatServiceManager.inExpUpsellEntrypoint, game.GameId, game.PlaceId, v90);
        end;
        if v89 == v20.DevicePermissionsModal and v85.props.Analytics and v85.props.VoiceChatServiceManager then
            v85.props.Analytics:reportDevicePermissionsModalEvent("Shown", v85.props.VoiceChatServiceManager:GetSessionId(), v85.props.VoiceChatServiceManager:GetInExpUpsellAnalyticsData());
        end;
        if v89 and v89 ~= v20.None then
            v90 = v47[v89];
            local v91 = v49[v89];
            local v92 = true;
            if v89 ~= v20.JoinVoice then
                v92 = true;
                if v89 ~= v20.LeaveVoice then
                    v92 = v40() and v89 == v20.UnifiedJoinVoiceToast;
                end;
            end;
            if v92 and v85.props.VoiceChatServiceManager and v85.props.VoiceChatServiceManager:HasSeamlessVoiceFeature("HideJoinToastSubtitle") then
                v91 = nil;
            end;
            if typeof(v90) == "function" then
                v90 = v90(v85.props.bannedUntil);
            end;
            if typeof(v91) == "function" then
                v91 = v91(v85.props.bannedUntil);
            end;
            v92 = nil;
            if v41() and v89 == v20.UpdateOnAutoJoinToast then
                v92 = l_Images_0["icons/controls/microphone"];
            else
                local v93 = true;
                if v89 ~= v20.VoiceConsentDeclinedToast then
                    v93 = v89 == v20.VoiceConsentAcceptedToast;
                end;
                if v93 or v89 == v20.JoinedVoiceToast or v40() and v89 == v20.UnifiedJoinVoiceToast then
                    v92 = l_Images_0["icons/controls/publicAudioJoin"];
                else
                    v93 = true;
                    if v89 ~= v20.JoinVoice then
                        v93 = true;
                        if v89 ~= v20.LeaveVoice then
                            v93 = v40() and v89 == v20.UnifiedJoinVoiceToast;
                        end;
                    end;
                    v92 = if v93 then l_Images_0["icons/actions/info"] else if v89 == v20.VoiceDataConsentOptOutToast and v39() then nil else l_Images_0["icons/status/alert"];
                end;
            end;
            v85:setState({
                showPrompt = true, 
                promptType = v89, 
                toastContent = {
                    iconImage = v92, 
                    toastTitle = v90, 
                    toastSubtitle = v91, 
                    onActivated = function() --[[ Line: 417 ]] --[[ Name: onActivated ]]
                        -- upvalues: v85 (ref)
                        if v85.props.onPrimaryActivated then
                            v85.props.onPrimaryActivated();
                        end;
                    end, 
                    onDismissed = function() --[[ Line: 422 ]] --[[ Name: onDismissed ]]

                    end
                }
            });
            local v94 = true;
            if v89 ~= v20.VoiceChatSuspendedTemporary then
                v94 = true;
                if v89 ~= v20.VoiceChatSuspendedTemporaryAvatarChat then
                    v94 = true;
                    if v89 ~= v20.VoiceChatSuspendedTemporaryToast then
                        v94 = v89 == v20.VoiceChatSuspendedTemporaryB;
                    end;
                end;
            end;
            if v94 then
                v94 = v43:FormatByKey("Feature.SettingsHub.Prompt.XMinuteSuspension", {
                    banDurationInMinutes = v85.props.bannedUntil
                });
                local v95 = if v89 == v20.VoiceChatSuspendedTemporaryB then v94 else " " .. v85.props.bannedUntil .. ".";
                v85:setState({
                    banEnd = v95
                });
                return;
            end;
        else
            v85:setState({
                promptType = v20.None, 
                toastContent = v6.None
            });
        end;
    end;
    v85.closeVoiceBanPrompt = function() --[[ Line: 446 ]]
        -- upvalues: v85 (copy), l_ContextActionService_0 (ref), v20 (ref), v35 (ref)
        v85:setState({
            showPrompt = false
        });
        if v85.props.onContinueFunc then
            v85.props.onContinueFunc();
        end;
        l_ContextActionService_0:UnbindCoreAction("CloseVoiceBanPrompt");
        local v96 = v85.state.promptType == v20.VoiceChatSuspendedTemporaryB;
        if v35 then
            local l_promptType_0 = v85.state.promptType;
            local v98 = true;
            if l_promptType_0 ~= v20.VoiceChatSuspendedPermanent then
                v98 = true;
                if l_promptType_0 ~= v20.VoiceChatSuspendedTemporary then
                    v98 = true;
                    if l_promptType_0 ~= v20.VoiceChatSuspendedTemporaryAvatarChat then
                        v98 = l_promptType_0 == v20.VoiceChatSuspendedTemporaryB;
                    end;
                end;
            end;
            if v98 and not v96 then
                if v85.props.Analytics then
                    v85.props.Analytics:reportBanMessageEvent("Acknowledged");
                end;
                if v85.props.VoiceChatServiceManager then
                    v85.props.VoiceChatServiceManager:reportBanMessage("Acknowledged");
                    return;
                end;
            end;
        elseif not v96 then
            if v85.props.Analytics then
                v85.props.Analytics:reportBanMessageEvent("Acknowledged");
            end;
            if v85.props.VoiceChatServiceManager then
                v85.props.VoiceChatServiceManager:reportBanMessage("Acknowledged");
            end;
        end;
    end;
    v85.checkInputStateForClosePrompt = function(_, v100, _) --[[ Line: 480 ]]
        -- upvalues: v85 (copy)
        if v100 == Enum.UserInputState.Begin then
            v85.closeVoiceBanPrompt();
        end;
    end;
    v85.handlePrimayActivated = function() --[[ Line: 486 ]]
        -- upvalues: v85 (copy)
        v85.closeVoiceBanPrompt();
        if v85.props.onPrimaryActivated then
            v85.props.onPrimaryActivated();
        end;
    end;
    v85.handleSecondaryActivated = function() --[[ Line: 493 ]]
        -- upvalues: v85 (copy)
        v85.closeVoiceBanPrompt();
        if v85.props.onSecondaryActivated then
            v85.props.onSecondaryActivated();
        end;
    end;
end;
v84.render = function(v102) --[[ Line: 501 ]] --[[ Name: render ]]
    -- upvalues: v31 (copy), v20 (copy), l_GetFFlagShowDevicePermissionsModal_0 (copy), l_GetFFlagEnableVoiceNudge_0 (copy), l_TextService_0 (copy), v52 (copy), v56 (copy), v51 (copy), l_GetFFlagSupportGamepadNavInVoiceModals_0 (copy), v6 (copy), v13 (copy), v25 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v54 (copy), v53 (copy), v55 (copy), v24 (copy), v47 (copy), v49 (copy), l_UserInputService_0 (copy), v22 (copy), l_CoreGui_0 (copy), v23 (copy), v34 (copy), v38 (copy), v39 (copy), l_Toast_0 (copy), l_ExternalEventConnection_0 (copy)
    local v103 = v31() and v102.props.errorText or nil;
    local v104 = v102.state.promptType == v20.VoiceToxicityModal;
    local v105 = v102.state.promptType == v20.VoiceToxicityToast;
    local v106 = v102.state.promptType == v20.VoiceChatSuspendedTemporaryB;
    local l_promptType_1 = v102.state.promptType;
    local v108 = true;
    if l_promptType_1 ~= v20.VoiceConsentModalV1 then
        v108 = true;
        if l_promptType_1 ~= v20.VoiceConsentModalV2 then
            v108 = l_promptType_1 == v20.VoiceConsentModalV3;
        end;
    end;
    l_promptType_1 = l_GetFFlagShowDevicePermissionsModal_0() and v102.state.promptType == v20.DevicePermissionsModal;
    local v109 = if l_GetFFlagEnableVoiceNudge_0() then Enum.AutomaticSize.Y else Enum.AutomaticSize.None;
    local _ = nil;
    local l_promptType_2 = v102.state.promptType;
    local v112 = true;
    if l_promptType_2 ~= v20.VoiceChatSuspendedPermanent then
        v112 = true;
        if l_promptType_2 ~= v20.VoiceChatSuspendedTemporary then
            v112 = true;
            if l_promptType_2 ~= v20.VoiceChatSuspendedTemporaryAvatarChat then
                v112 = l_promptType_2 == v20.VoiceChatSuspendedTemporaryB;
            end;
        end;
    end;
    if not v112 then
        v112 = l_promptType_2 == v20.VoiceToxicityModal;
        if not v112 then
            v112 = true;
            if l_promptType_2 ~= v20.VoiceConsentModalV1 then
                v112 = true;
                if l_promptType_2 ~= v20.VoiceConsentModalV2 then
                    v112 = l_promptType_2 == v20.VoiceConsentModalV3;
                end;
            end;
            if not v112 then
                v112 = l_promptType_2 == v20.DevicePermissionsModal;
            end;
        end;
    end;
    if v112 then
        v112 = v102.state.toastContent.toastTitle;
        l_promptType_2 = v102.promptStyle.Font.Header1.Font;
        local v113 = v102.promptStyle.Font.Header1.RelativeSize * v102.promptStyle.Font.BaseSize;
        local v114 = 20 + l_TextService_0:GetTextSize(v112, v113, l_promptType_2, Vector2.new(325, 1e999)).Y;
        local v115 = if v106 then v102.state.banEnd else v52 .. v102.state.banEnd;
        local v116 = if v102.state.banEnd ~= "" then "<b>" .. v115 .. "</b><br />" .. v102.state.toastContent.toastSubtitle else v102.state.toastContent.toastSubtitle .. v102.state.banEnd;
        local v117 = v103 or v116;
        local l_Font_0 = v102.promptStyle.Font.Body.Font;
        local v119 = v102.promptStyle.Font.Body.RelativeSize * v102.promptStyle.Font.BaseSize;
        local v120 = 20 + l_TextService_0:GetTextSize(v117, v119, l_Font_0, Vector2.new(325, 1e999)).Y;
        if v106 then
            v120 = v120 + 20;
        end;
        local v121 = if v106 then v56 else v51;
        local v122 = 20 + l_TextService_0:GetTextSize(v121, v119, l_Font_0, Vector2.new(325, 1e999)).Y;
        local l_promptType_3 = v102.state.promptType;
        local v124 = true;
        if l_promptType_3 ~= v20.VoiceChatSuspendedTemporaryB then
            v124 = l_promptType_3 == v20.VoiceToxicityModal;
        end;
        l_promptType_3 = if l_GetFFlagSupportGamepadNavInVoiceModals_0() then Enum.SelectionBehavior.Stop else nil;
        local v125 = l_GetFFlagSupportGamepadNavInVoiceModals_0() and true or nil;
        local v126 = v6.createElement("ScreenGui", {
            DisplayOrder = 8, 
            IgnoreGuiInset = true, 
            OnTopOfCoreBlur = true, 
            Enabled = v102.state.showPrompt, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            Overlay = v6.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundColor3 = v102.promptStyle.Theme.Overlay.Color, 
                BackgroundTransparency = v102.promptStyle.Theme.Overlay.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = ""
            }), 
            DialogMainFrame = v6.createElement(v13.Core.ImageSet.ImageSetLabel, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = v25.Images.RoundedRect.Image, 
                ImageColor3 = v102.promptStyle.Theme.BackgroundUIDefault.Color, 
                ImageTransparency = v102.promptStyle.Theme.BackgroundUIDefault.Transparency, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                ScaleType = v25.Images.RoundedRect.ScaleType, 
                Size = UDim2.new(0, 365, 0, 55 + v114 + 1 + v120 + 14 + v122 + 36 + 40), 
                AutomaticSize = v109, 
                SliceCenter = v25.Images.RoundedRect.SliceCenter, 
                SelectionBehaviorDown = l_promptType_3, 
                SelectionBehaviorLeft = l_promptType_3, 
                SelectionBehaviorRight = l_promptType_3, 
                SelectionBehaviorUp = l_promptType_3, 
                SelectionGroup = v125, 
                ref = if l_GetFFlagSupportGamepadNavInVoiceModals_0() then v102.ref else nil
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
                    Image = v102.state.toastContent.iconImage, 
                    Size = UDim2.new(0, 55, 0, 55), 
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }), 
                TitleTextContainer = v6.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, v114), 
                    AutomaticSize = v109
                }, {
                    TitleText = v6.createElement(v13.App.Text.StyledTextLabel, {
                        fontStyle = v102.promptStyle.Font.Header1, 
                        colorStyle = v102.promptStyle.Theme.SystemPrimaryDefault, 
                        textXAlignment = Enum.TextXAlignment.Center, 
                        size = UDim2.new(1, 0, 1, 0), 
                        text = v112
                    })
                }), 
                Divider = v6.createElement("Frame", {
                    BackgroundColor3 = v102.promptStyle.Theme.Divider.Color, 
                    BackgroundTransparency = v102.promptStyle.Theme.Divider.Transparency, 
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
                    Size = UDim2.new(1, 0, 0, v120)
                }, {
                    BodyText = v6.createElement(v13.App.Text.StyledTextLabel, {
                        fontStyle = v102.promptStyle.Font.Body, 
                        colorStyle = v102.promptStyle.Theme.TextDefault, 
                        textXAlignment = Enum.TextXAlignment.Center, 
                        size = UDim2.new(1, 0, 1, 0), 
                        text = v117
                    })
                }), 
                TextSpaceContainer = v6.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 6, 
                    Size = UDim2.new(1, 0, 0, 7)
                }), 
                SubBodyTextContainer = not v104 and v6.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 7, 
                    Size = UDim2.new(1, 0, 0, v122), 
                    AutomaticSize = v109
                }, {
                    BodyText = v6.createElement(v13.App.Text.StyledTextLabel, {
                        fontStyle = v102.promptStyle.Font.Body, 
                        colorStyle = v102.promptStyle.Theme.TextDefault, 
                        textXAlignment = Enum.TextXAlignment.Center, 
                        size = UDim2.new(1, 0, 1, 0), 
                        text = v121
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
                    AutomaticSize = v109
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
                        text = if v104 then v54 else v53, 
                        onActivated = if l_GetFFlagEnableVoiceNudge_0() then v102.handlePrimayActivated else v102.closeVoiceBanPrompt, 
                        Selectable = v125
                    }), 
                    SecondaryButton = v124 and v6.createElement(v13.App.Button.LinkButton, {
                        layoutOrder = 1, 
                        size = UDim2.new(1, -5, 0, 36), 
                        text = v55, 
                        colorStyleDefault = "TextMuted", 
                        colorStyleHover = "TextMuted", 
                        onActivated = v102.handleSecondaryActivated
                    })
                })
            })
        });
        if l_promptType_1 then
            v126 = v6.createElement(v24, {
                titleText = v47[v102.state.promptType], 
                bodyText = v49[v102.state.promptType], 
                handlePrimaryActivated = v102.handlePrimayActivated, 
                handleSecondaryActivated = v102.handleSecondaryActivated, 
                Analytics = v102.props.Analytics, 
                promptStyle = v102.promptStyle, 
                showPrompt = v102.state.showPrompt, 
                settingsAppAvailable = v102.props.settingsAppAvailable, 
                UserInputService = if v102.props.UserInputService ~= nil then v102.props.UserInputService else l_UserInputService_0, 
                ref = if l_GetFFlagSupportGamepadNavInVoiceModals_0() then v102.ref else nil
            });
        end;
        if v108 then
            v126 = v6.createElement(v22, {
                titleText = v47[v102.state.promptType], 
                bodyText = v49[v102.state.promptType], 
                handlePrimaryActivated = v102.handlePrimayActivated, 
                handleSecondaryActivated = v102.handleSecondaryActivated, 
                Analytics = v102.props.Analytics, 
                showCheckbox = v102.props.showCheckbox, 
                promptStyle = v102.promptStyle, 
                showPrompt = v102.state.showPrompt, 
                ref = if l_GetFFlagSupportGamepadNavInVoiceModals_0() then v102.ref else nil
            });
        end;
        return (v6.createElement(v6.Portal, {
            target = l_CoreGui_0
        }, {
            InGameMenuInformationalDialog = v126
        }));
    elseif v102.state.promptType == v20.JoinVoiceSTUX then
        return (v6.createElement(v23, {
            titleText = v47[v102.state.promptType], 
            subtitleText = v49[v102.state.promptType], 
            promptStyle = v102.promptStyle, 
            showPrompt = v102.state.showPrompt, 
            onClose = function() --[[ Line: 767 ]] --[[ Name: onClose ]]
                -- upvalues: v102 (copy)
                v102:setState({
                    showPrompt = false
                });
            end, 
            onMenuOpen = v102.hideOnMenuOpen
        }));
    else
        v112 = nil;
        v112 = if v105 then v34() else if v102.state.promptType == v20.JoinedVoiceToast then v38() else 3;
        l_promptType_2 = v102.state.showPrompt;
        if v102.state.promptType == v20.VoiceDataConsentOptOutToast and v39() then
            l_promptType_2 = if v102.props.showDataConsentToast then v102.props.showDataConsentToast else false;
        end;
        local l_createElement_0 = v6.createElement;
        local v128 = "Frame";
        local v129 = {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            [v6.Change.AbsoluteSize] = v102.onScreenSizeChanged
        };
        local v130 = {};
        local v131 = false;
        if v102.state.promptType ~= v20.None then
            v131 = v6.createElement(l_Toast_0, {
                duration = if v105 then v34() else v112, 
                toastContent = v102.state.toastContent, 
                show = l_promptType_2
            });
        end;
        v130.Toast = v131;
        v130.EventConnection = v102.props.promptSignal and v6.createElement(l_ExternalEventConnection_0, {
            event = v102.props.promptSignal, 
            callback = v102.promptSignalCallback
        });
        return (l_createElement_0(v128, v129, v130));
    end;
end;
v84.didUpdate = function(v132) --[[ Line: 814 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_GetFFlagSupportGamepadNavInVoiceModals_0 (copy), v11 (copy), l_GuiService_0 (copy)
    if l_GetFFlagSupportGamepadNavInVoiceModals_0() then
        if v132.props.lastInput == v11.Input.Directional then
            local v133 = v132.ref:getValue();
            if v132.state.showPrompt and v133 then
                l_GuiService_0:Select(v133);
            end;
            if not v132.state.showPrompt and v133 then
                l_GuiService_0.SelectedCoreObject = nil;
                return;
            end;
        elseif l_GuiService_0.SelectedCoreObject then
            l_GuiService_0.SelectedCoreObject = nil;
        end;
    end;
end;
v84.didMount = function(v134) --[[ Line: 846 ]] --[[ Name: didMount ]]
    -- upvalues: l_ContextActionService_0 (copy)
    if v134.props.onReadyForSignal then
        v134.props.onReadyForSignal();
    end;
    l_ContextActionService_0:BindCoreAction("CloseVoiceBanPrompt", v134.checkInputStateForClosePrompt, false, Enum.KeyCode.ButtonA);
    l_ContextActionService_0:BindCoreAction("CloseVoiceBanPrompt", v134.checkInputStateForClosePrompt, false, Enum.KeyCode.ButtonB);
end;
v84 = v21.connect(function(v135, _) --[[ Line: 864 ]]
    return {
        showNewContent = v135.getGameInfoShowChatFeatures(), 
        showCheckbox = v135.getDisplayCheckboxInVoiceConsent(), 
        showDataConsentToast = v135.getDisplayCheckboxInVoiceConsent() ~= nil and v135.getDisplayCheckboxInVoiceConsent()
    };
end)(v84);
local function v140(v137) --[[ Line: 874 ]] --[[ Name: WrappedVoiceChatPromptFrame ]]
    -- upvalues: l_useStyle_0 (copy), l_GetFFlagSupportGamepadNavInVoiceModals_0 (copy), l_useLastInput_0 (copy), v6 (copy), v84 (ref), v8 (copy)
    local v138 = l_useStyle_0();
    local v139 = if l_GetFFlagSupportGamepadNavInVoiceModals_0() then l_useLastInput_0() else nil;
    return v6.createElement(v84, v8.Dictionary.join(v137, {
        appStyle = v138, 
        lastInput = if l_GetFFlagSupportGamepadNavInVoiceModals_0() then v139 else nil
    }));
end;
return function(v141) --[[ Line: 885 ]]
    -- upvalues: v9 (copy), v6 (copy), v140 (copy)
    return v9({
        v6.createElement(v140, v141)
    });
end;