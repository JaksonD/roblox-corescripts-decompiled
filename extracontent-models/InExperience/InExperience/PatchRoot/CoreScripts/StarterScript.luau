local l_CorePackages_0 = game:GetService("CorePackages");
local l_ScriptContext_0 = game:GetService("ScriptContext");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_VRService_0 = game:GetService("VRService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Modules_0 = l_RobloxGui_0:WaitForChild("Modules");
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/CoreScriptErrorReporter", l_RobloxGui_0);
local v9 = require(l_CorePackages_0.Packages.Roact);
local v10 = require(l_CorePackages_0.Packages.Scheduler);
local v11 = require(l_CorePackages_0.Workspace.Packages.CachedPolicyService);
local v12 = require(l_RobloxGui_0.Modules.Flags.FFlagUseRoactGlobalConfigInCoreScripts);
local v13 = require(l_RobloxGui_0.Modules.Flags.GetFFlagScreenshotHudApi);
local v14 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteMenuIXP);
local v15 = require(l_Modules_0.Settings.Pages.ShareGame.NewInviteMenuExperimentManager);
local v16 = require(l_Modules_0.Flags.GetFFlagEnableSoundSessionTelemetry);
local l_GetFFlagReportAnythingAnnotationIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagReportAnythingAnnotationIXP;
local l_TrustAndSafetyIXPManager_0 = require(l_CorePackages_0.Workspace.Packages.TrustAndSafetyIxp).TrustAndSafetyIXPManager;
local v19 = require(l_Modules_0.Experiment.GetCoreScriptsLayers);
local v20 = require(l_RobloxGui_0.Modules.Flags.GetFFlagRtMessaging);
local v21 = require(l_RobloxGui_0.Modules.Common.Flags.GetFFlagContactListClientEnabled);
local v22 = game:DefineFastFlag("AddPublishAssetPrompt6", false);
local l_isCharacterNameHandlerEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isCharacterNameHandlerEnabled;
local l_GetFFlagEnableSocialContextToast_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableSocialContextToast;
local l_GetFFlagEnableAppChatInExperience_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience;
local l_GetFFlagChromeCentralizedConfiguration_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagChromeCentralizedConfiguration;
local l_GetFFlagEnableCrossExpVoice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExpVoice;
local l_FStringReactSchedulingContext_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FStringReactSchedulingContext;
local v29 = game:DefineFastFlag("LuaAppEnableToastNotificationsCoreScripts4", false);
local v30 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceUserAgency3);
local v31 = require(l_RobloxGui_0.Modules.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification);
game:DefineFastFlag("MoodsEmoteFix3", false);
local v32 = game:DefineFastFlag("EnableSendCameraAccessAnalytics", false);
local v33 = game:DefineFastFlag("EnableExperienceNotificationPrompts2", false);
local v34 = game:DefineFastFlag("EnablePremiumSponsoredExperienceReporting", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableCancelSubscriptionApp");
local v36 = game:DefineFastFlag("EnableCancelSubscriptionAppLua", false);
local l_game_EngineFeature_1 = game:GetEngineFeature("AudioFocusManagement");
local v38 = game:DefineFastFlag("EnableExperienceGenericChallengeRenderingOnLoadingScript", false);
local l_game_EngineFeature_2 = game:GetEngineFeature("EnableRobloxCommerce");
local v40 = game:DefineFastFlag("EnableLinkSharingEvent", false);
local l_game_EngineFeature_3 = game:GetEngineFeature("PlayerFeedbackEnabled");
local l_FFlagLuaAppInExperienceDetailsPrompt_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppInExperienceDetailsPrompt;
local v43 = game:DefineFastFlag("EnableSystemScrim", false);
local v44 = game:DefineFastFlag("EnableCorescriptsProfiler", false);
local v45 = game:DefineFastFlag("CoreScriptsProfilerTelemetryContext", false);
local v46 = game:DefineFastFlag("LuaAppEnableEnhancedVideoScripts3", false);
local v47 = game:DefineFastFlag("LuaAppEnableInExperienceClickoutScripts", false);
local v48 = game:DefineFastFlag("SelfieFrontendConsoleDesktop2", false) and game:GetEngineFeature("EnableSelfieQRCode");
local v49 = require(l_CorePackages_0.Packages.UIBlox);
local l_UIBloxInGameConfig_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).UIBloxInGameConfig;
v49.init(l_UIBloxInGameConfig_0);
local l_FFlagTopBarRefactor_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarRefactor;
require(l_CorePackages_0.Workspace.Packages.ExperimentCacheManager).ExperimentCacheManager.default:initialize();
if require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagReactTelemetryEnabled then
    require(l_CorePackages_0.Packages.ReactTelemetry).customFields.context = "in_experience";
end;
if game:DefineFastFlag("LuaAppUseAppHttpStoreInExperience", false) then
    require(l_CorePackages_0.Workspace.Packages.HttpStore).Instance._create({});
end;
local v52 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetReactSchedulerIXPConfig();
if v52 then
    v10.unstable_setSchedulerFlags(v52);
end;
local l_FFlagEnableAEGIS2CommsFAEUpsell_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableAEGIS2CommsFAEUpsell;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
if game:GetEngineFeature("SoundServiceControlsDefaultListenerLocation") then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/DefaultListenerLocation", script.Parent);
end;
if l_GetFFlagEnableAppChatInExperience_0() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/AppChatMain", l_RobloxGui_0);
end;
if l_GetFFlagEnableCrossExpVoice_0() then
    require(l_CorePackages_0.Workspace.Packages.CrossExperienceVoice).IXPManager.default:initialize();
end;
local _ = require(l_CorePackages_0.Workspace.Packages.InExperienceSessionization);
local v56 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatCoreScriptSupport();
if require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled() then
    local v57 = require(l_CorePackages_0.Workspace.Packages.ExpChat);
    v57.GlobalFlags.AvatarChatEnabled = v56;
    v57.GlobalFlags.ChromeEnabled = true;
elseif v56 then
    require(l_CorePackages_0.Workspace.Packages.ExpChat).GlobalFlags.AvatarChatEnabled = true;
end;
if require(l_RobloxGui_0.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount)() then
    require(l_CorePackages_0.Workspace.Packages.ExpChat).GlobalFlags.DoNotPromptCameraPermissionsOnMount = true;
end;
if require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagJoinWithoutMicPermissions() then
    require(l_CorePackages_0.Workspace.Packages.ExpChat).GlobalFlags.JoinWithoutMicPermissions = true;
end;
if require(l_RobloxGui_0.Modules.Flags.getFFlagEnableAlwaysAvailableCamera)() then
    require(l_CorePackages_0.Workspace.Packages.ExpChat).GlobalFlags.EnableAlwaysAvailableCamera = true;
end;
if require(l_RobloxGui_0.Modules.Flags.getFFlagRenderVoiceBubbleAfterAsyncInit)() then
    require(l_CorePackages_0.Workspace.Packages.ExpChat).GlobalFlags.RenderVoiceBubbleAfterAsyncInit = true;
end;
if require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagShowLikelySpeakingBubbles() then
    require(l_CorePackages_0.Workspace.Packages.ExpChat).GlobalFlags.ShowLikelySpeakingBubbles = true;
end;
local v58 = game:DefineFastFlag("InExperienceInterventionApp", false);
if v12 and l_RunService_0:IsStudio() then
    v9.setGlobalConfig({
        propValidation = true, 
        elementTracing = true
    });
end;
local l_UIBlox_0 = require(l_CorePackages_0.Packages.InGameMenuDependencies).UIBlox;
if l_UIBlox_0 ~= v49 then
    l_UIBlox_0.init(l_UIBloxInGameConfig_0);
end;
local l_Folder_0 = Instance.new("Folder");
l_Folder_0.Name = "Sounds";
l_Folder_0.Parent = l_RobloxGui_0;
local function v64(v61) --[[ Line: 209 ]] --[[ Name: safeRequire ]]
    local l_status_0, l_result_0 = pcall(require, v61);
    if l_status_0 then
        return l_result_0;
    else
        warn("Failure to Start CoreScript module " .. v61.Name .. ".\n" .. l_result_0);
        return;
    end;
end;
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/NotificationScript2", l_RobloxGui_0);
if l_GetFFlagChromeCentralizedConfiguration_0() then
    coroutine.wrap(v64)(l_Modules_0.Chrome.ConfigureChrome);
end;
coroutine.wrap(v64)(l_Modules_0.SelfieView);
coroutine.wrap(v64)(l_Modules_0.TopBar);
if require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableSideSheet then
    coroutine.wrap(v64)(l_Modules_0.InExperienceSideSheet);
end;
if l_FFlagTopBarRefactor_0 then
    local v65 = coroutine.wrap(v64)(l_CorePackages_0.Workspace.Packages.InExperienceOverlay);
    if v65 then
        v65.createOverlay();
    end;
end;
if game:GetEngineFeature("LuobuModerationStatus") then
    coroutine.wrap(function() --[[ Line: 246 ]]
        -- upvalues: l_Modules_0 (copy)
        local l_Watermark_0 = l_Modules_0.Watermark;
        local l_status_1, l_result_1 = pcall(require, l_Watermark_0);
        if l_status_1 then
            return;
        else
            warn("Failure to Start CoreScript module " .. l_Watermark_0.Name .. ".\n" .. l_result_1);
            return;
        end;
    end)();
end;
if v58 then
    coroutine.wrap(v64)(l_CorePackages_0.Workspace.Packages.InExperienceIntervention);
end;
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/MainBotChatScript2", l_RobloxGui_0);
if game:GetEngineFeature("ProximityPrompts") then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ProximityPrompt", l_RobloxGui_0);
end;
if game:GetEngineFeature("ValidateUGCBodyAPIFeature") then
    require(l_Modules_0.Server.UGCValidation.UGCValidationFunctionInstaller)();
end;
coroutine.wrap(function() --[[ Line: 267 ]]
    -- upvalues: l_ScriptContext_0 (copy), l_RobloxGui_0 (copy)
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ScreenTimeInGame", l_RobloxGui_0);
end)();
coroutine.wrap(function() --[[ Line: 271 ]]
    -- upvalues: v11 (copy), l_Modules_0 (copy)
    if v11:IsSubjectToChinaPolicies() then
        if not game:IsLoaded() then
            game.Loaded:Wait();
        end;
        local l_LuobuWarningToast_0 = l_Modules_0.LuobuWarningToast;
        local l_status_2, l_result_2 = pcall(require, l_LuobuWarningToast_0);
        if l_status_2 then
            return;
        else
            warn("Failure to Start CoreScript module " .. l_LuobuWarningToast_0.Name .. ".\n" .. l_result_2);
        end;
    end;
end)();
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/PerformanceStatsManagerScript", l_RobloxGui_0);
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/PlayerRagdoll", l_RobloxGui_0);
coroutine.wrap(v64)(l_RobloxGui_0.Modules.ChatSelector);
coroutine.wrap(v64)(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
local v72 = nil;
local l_status_3, l_result_3 = pcall(function() --[[ Line: 292 ]]
    return UserSettings():IsUserFeatureEnabled("UserRoactBubbleChatBeta");
end);
v72 = l_status_3 and l_result_3;
if game:GetEngineFeature("EnableBubbleChatFromChatService") or v72 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/PlayerBillboards", l_RobloxGui_0);
end;
coroutine.wrap(function() --[[ Line: 303 ]]
    -- upvalues: l_CorePackages_0 (copy)
    local l_PurchasePrompt_0 = l_CorePackages_0.Workspace.Packages.PurchasePrompt;
    local l_status_4, l_result_4 = pcall(require, l_PurchasePrompt_0);
    local v78;
    if l_status_4 then
        v78 = l_result_4;
    else
        warn("Failure to Start CoreScript module " .. l_PurchasePrompt_0.Name .. ".\n" .. l_result_4);
        v78 = nil;
    end;
    if v78 then
        v78.mountPurchasePrompt();
    end;
end)();
if v22 then
    coroutine.wrap(v64)(l_Modules_0.PublishAssetPrompt);
end;
coroutine.wrap(v64)(l_Modules_0.ExperienceEvents.ExperienceEventsApp);
if l_game_EngineFeature_3 then
    coroutine.wrap(v64)(l_Modules_0.PlayerFeedback);
end;
if game:GetEngineFeature("GroupServiceJoinPromptEngineAPIEnabled") then
    coroutine.wrap(v64)(l_Modules_0.Groups.GroupsApp);
end;
coroutine.wrap(v64)(l_Modules_0.AvatarGeneration.SelfieConsent);
if v48 then
    coroutine.wrap(v64)(l_Modules_0.AvatarGeneration.SelfieQr);
end;
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/BlockPlayerPrompt", l_RobloxGui_0);
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/FriendPlayerPrompt", l_RobloxGui_0);
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/AvatarContextMenu", l_RobloxGui_0);
coroutine.wrap(v64)(l_RobloxGui_0.Modules.BackpackScript);
coroutine.wrap(v64)(l_RobloxGui_0.Modules.KeyboardUINavigation);
coroutine.wrap(v64)(l_RobloxGui_0.Modules.EmotesMenu.EmotesMenuMaster);
coroutine.wrap(v64)(l_RobloxGui_0.Modules.Captures.CapturesApp);
coroutine.wrap(v64)(l_Modules_0.AvatarEditorPrompts);
if require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagVirtualCursorModularization then
    coroutine.wrap(v64)(l_CorePackages_0.Workspace.Packages.VirtualCursorModular);
else
    coroutine.wrap(v64)(l_CorePackages_0.Workspace.Packages.VirtualCursor);
end;
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/VehicleHud", l_RobloxGui_0);
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/InviteToGamePrompt", l_RobloxGui_0);
if if game:GetEngineFeature("TouchScreenEnabled") then l_UserInputService_0.TouchScreenEnabled else l_UserInputService_0.TouchEnabled then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ContextActionTouch", l_RobloxGui_0);
    l_RobloxGui_0:WaitForChild("ControlFrame");
    l_RobloxGui_0.ControlFrame:WaitForChild("BottomLeftControl");
    l_RobloxGui_0.ControlFrame.BottomLeftControl.Visible = false;
end;
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/InspectAndBuy", l_RobloxGui_0);
coroutine.wrap(function() --[[ Line: 381 ]]
    -- upvalues: l_VRService_0 (copy), l_RobloxGui_0 (copy)
    if not l_VRService_0.VREnabled then
        l_VRService_0:GetPropertyChangedSignal("VREnabled"):Wait();
    end;
    local l_VRAvatarHeightScaling_0 = l_RobloxGui_0.Modules.VR.VRAvatarHeightScaling;
    local l_status_5, l_result_5 = pcall(require, l_VRAvatarHeightScaling_0);
    if not l_status_5 then
        warn("Failure to Start CoreScript module " .. l_VRAvatarHeightScaling_0.Name .. ".\n" .. l_result_5);
    end;
    l_VRAvatarHeightScaling_0 = l_RobloxGui_0.Modules.VR.VirtualKeyboard;
    l_status_5, l_result_5 = pcall(require, l_VRAvatarHeightScaling_0);
    if not l_status_5 then
        warn("Failure to Start CoreScript module " .. l_VRAvatarHeightScaling_0.Name .. ".\n" .. l_result_5);
    end;
    l_VRAvatarHeightScaling_0 = l_RobloxGui_0.Modules.VR.UserGui;
    l_status_5, l_result_5 = pcall(require, l_VRAvatarHeightScaling_0);
    if l_status_5 then
        return;
    else
        warn("Failure to Start CoreScript module " .. l_VRAvatarHeightScaling_0.Name .. ".\n" .. l_result_5);
        return;
    end;
end)();
coroutine.wrap(v64)(l_RobloxGui_0.Modules.VR.VRAvatarGestures.VRAvatarGesturesClient);
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/NetworkPause", l_RobloxGui_0);
if v13() and not v11:IsSubjectToChinaPolicies() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ScreenshotHud", l_RobloxGui_0);
end;
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/MicrophoneDevicePermissionsLoggingInitializer", l_RobloxGui_0);
if game:GetEngineFeature("VoiceChatSupported") then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/VoiceDefaultChannel", l_RobloxGui_0);
end;
coroutine.wrap(function() --[[ Line: 404 ]]
    -- upvalues: l_CorePackages_0 (copy), l_LocalPlayer_0 (ref), v19 (copy), v14 (copy), v15 (copy), l_GetFFlagReportAnythingAnnotationIXP_0 (copy), l_TrustAndSafetyIXPManager_0 (copy)
    require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper:InitializeAsync(l_LocalPlayer_0.UserId, v19());
    if v14() then
        v15.default:initialize();
    end;
    if l_GetFFlagReportAnythingAnnotationIXP_0() then
        l_TrustAndSafetyIXPManager_0.default:initialize();
    end;
end)();
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ExperienceChatMain", l_RobloxGui_0);
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ChatEmoteUsage", script.Parent);
if v29 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ToastNotificationGUI", script.Parent);
end;
if v20() then
    game:GetService("RtMessagingService");
end;
if game:GetEngineFeature("FacialAnimationStreaming2") then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/FacialAnimationStreaming", script.Parent);
end;
if v56 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/FaceChatSelfieView", l_RobloxGui_0);
end;
if game:GetEngineFeature("NewMoodAnimationTypeApiEnabled") and game:GetFastFlag("MoodsEmoteFix3") then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/AvatarMood", script.Parent);
end;
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/PortalTeleportGUI", l_RobloxGui_0);
coroutine.wrap(function() --[[ Line: 443 ]]
    -- upvalues: l_CorePackages_0 (copy)
    local l_AdsEudsa_0 = l_CorePackages_0.Workspace.Packages.AdsEudsa;
    local l_status_6, l_result_6 = pcall(require, l_AdsEudsa_0);
    local v85;
    if l_status_6 then
        v85 = l_result_6;
    else
        warn("Failure to Start CoreScript module " .. l_AdsEudsa_0.Name .. ".\n" .. l_result_6);
        v85 = nil;
    end;
    if v85 and v85.starterScript then
        v85.starterScript();
    end;
end)();
if v34 then
    coroutine.wrap(function() --[[ Line: 453 ]]
        -- upvalues: l_CorePackages_0 (copy)
        local l_PremiumSponsoredExperienceReporting_0 = l_CorePackages_0.Workspace.Packages.PremiumSponsoredExperienceReporting;
        local l_status_7, l_result_7 = pcall(require, l_PremiumSponsoredExperienceReporting_0);
        local v89;
        if l_status_7 then
            v89 = l_result_7;
        else
            warn("Failure to Start CoreScript module " .. l_PremiumSponsoredExperienceReporting_0.Name .. ".\n" .. l_result_7);
            v89 = nil;
        end;
        if v89 and v89.starterScript then
            v89.starterScript();
        end;
    end)();
end;
if game:GetEngineFeature("EnableAdGuiInteractivityControlRefactor") then
    coroutine.wrap(function() --[[ Line: 463 ]]
        -- upvalues: l_CorePackages_0 (copy)
        local l_AdGuiInteractivity_0 = l_CorePackages_0.Workspace.Packages.AdGuiInteractivity;
        local l_status_8, l_result_8 = pcall(require, l_AdGuiInteractivity_0);
        local v93;
        if l_status_8 then
            v93 = l_result_8;
        else
            warn("Failure to Start CoreScript module " .. l_AdGuiInteractivity_0.Name .. ".\n" .. l_result_8);
            v93 = nil;
        end;
        if v93 and v93.starterScript then
            v93.starterScript();
        end;
    end)();
end;
if v46 then
    coroutine.wrap(function() --[[ Line: 473 ]]
        -- upvalues: l_CorePackages_0 (copy)
        local l_EnhancedVideo_0 = l_CorePackages_0.Workspace.Packages.EnhancedVideo;
        local l_status_9, l_result_9 = pcall(require, l_EnhancedVideo_0);
        local v97;
        if l_status_9 then
            v97 = l_result_9;
        else
            warn("Failure to Start CoreScript module " .. l_EnhancedVideo_0.Name .. ".\n" .. l_result_9);
            v97 = nil;
        end;
        if v97 and v97.starterScript then
            v97.starterScript();
        end;
    end)();
end;
if v47 then
    coroutine.wrap(function() --[[ Line: 483 ]]
        -- upvalues: l_CorePackages_0 (copy)
        local l_InExperienceClickout_0 = l_CorePackages_0.Workspace.Packages.InExperienceClickout;
        local l_status_10, l_result_10 = pcall(require, l_InExperienceClickout_0);
        local v101;
        if l_status_10 then
            v101 = l_result_10;
        else
            warn("Failure to Start CoreScript module " .. l_InExperienceClickout_0.Name .. ".\n" .. l_result_10);
            v101 = nil;
        end;
        if v101 and v101.starterScript then
            v101.starterScript();
        end;
    end)();
end;
if game:GetEngineFeature("EnableLuaAdPlayer") then
    local l_AdPlayer_0 = l_CorePackages_0.Workspace.Packages.AdPlayer;
    local l_status_11, l_result_11 = pcall(require, l_AdPlayer_0);
    local v105;
    if l_status_11 then
        v105 = l_result_11;
    else
        warn("Failure to Start CoreScript module " .. l_AdPlayer_0.Name .. ".\n" .. l_result_11);
        v105 = nil;
    end;
    v105.init();
end;
if game:GetEngineFeature("EnableVoiceAttention") then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/VoiceAttention", script.Parent);
end;
if v16() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/SoundTelemetry", script.Parent);
end;
coroutine.wrap(v64)(l_Modules_0.ApolloClient);
if v21() then
    coroutine.wrap(v64)(l_Modules_0.ContactList);
end;
if l_isCharacterNameHandlerEnabled_0() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/CharacterNameHandler", script.Parent);
end;
if v30() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/VoiceUserAgency", l_RobloxGui_0);
end;
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/CoreScriptsGlobalEffects", script.Parent);
require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager.init();
if l_GetFFlagEnableSocialContextToast_0() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/SocialContextToast", l_RobloxGui_0);
end;
if v31() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/GameInviteModalGUI", script.Parent);
end;
if v33 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ExperienceNotifications", script.Parent);
end;
require(l_CorePackages_0.Workspace.Packages.Achievements).InExpAchievementManager.new():startUp();
if require(l_RobloxGui_0.Modules.Common.Flags.GetFFlagPlayerViewRemoteEnabled)() then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/PlayerView", l_RobloxGui_0);
end;
if v32 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/SendCameraAccessAnalytics", l_RobloxGui_0);
end;
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/BulkPurchaseApp", l_RobloxGui_0);
if l_game_EngineFeature_1 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/ExperienceAudioFocusBinder", l_RobloxGui_0);
end;
if l_game_EngineFeature_0 and v36 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/CancelSubscriptionApp", l_RobloxGui_0);
end;
if l_game_EngineFeature_2 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/CommercePurchaseApp", l_RobloxGui_0);
end;
if v43 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/SystemScrim", l_RobloxGui_0);
end;
l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/CoreGuiEnableAnalytics", l_RobloxGui_0);
if v40 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/OpenShareSheetWithLink", l_RobloxGui_0);
end;
if l_FFlagLuaAppInExperienceDetailsPrompt_0 then
    l_ScriptContext_0:AddCoreScriptLocal("CoreScripts/InExperienceDetailsPrompt", l_RobloxGui_0);
end;
if not v38 then
    coroutine.wrap(function() --[[ Line: 581 ]]
        -- upvalues: l_CorePackages_0 (copy)
        require(l_CorePackages_0.Workspace.Packages.GenericChallenges).Middleware.InitExperienceChallengeInterceptor();
    end)();
end;
local v106 = require(l_Modules_0.Common.ReactPerfTracker);
if v106 then
    local v107 = v106.new();
    task.delay(5, function() --[[ Line: 592 ]]
        -- upvalues: v107 (copy)
        v107:start();
    end);
end;
local v108 = game:DefineFastInt("ReactSchedulingTrackerStartUpDelayMs", 5000) / 1000;
local v109 = require(l_Modules_0.Common.ReactSchedulingTracker);
task.delay(v108, function() --[[ Line: 602 ]]
    -- upvalues: v109 (copy)
    v109:start();
end);
local v110 = require(l_Modules_0.Common.CorescriptMemoryTracker)(l_FStringReactSchedulingContext_0);
if v110 then
    v110:start();
end;
if game:GetEngineFeature("RecordingServicePlaybackApiLua") then
    coroutine.wrap(v64)(l_CorePackages_0.Workspace.Packages.ExperienceStateReplay);
end;
if l_FFlagEnableAEGIS2CommsFAEUpsell_0 then
    coroutine.wrap(function() --[[ Line: 617 ]]
        -- upvalues: l_CorePackages_0 (copy)
        local l_SocialUpsell_0 = l_CorePackages_0.Workspace.Packages.SocialUpsell;
        local l_status_12, l_result_12 = pcall(require, l_SocialUpsell_0);
        local v114;
        if l_status_12 then
            v114 = l_result_12;
        else
            warn("Failure to Start CoreScript module " .. l_SocialUpsell_0.Name .. ".\n" .. l_result_12);
            v114 = nil;
        end;
        if v114 then
            v114.Overlay.initializeInExpOverlay();
        end;
    end)();
end;
coroutine.wrap(function() --[[ Line: 625 ]]
    -- upvalues: l_CorePackages_0 (copy), l_GuiService_0 (copy)
    local l_Display_0 = l_CorePackages_0.Workspace.Packages.Display;
    local l_status_13, l_result_13 = pcall(require, l_Display_0);
    local v118;
    if l_status_13 then
        v118 = l_result_13;
    else
        warn("Failure to Start CoreScript module " .. l_Display_0.Name .. ".\n" .. l_result_13);
        v118 = nil;
    end;
    l_GuiService_0:GetPropertyChangedSignal("TopbarInset"):Connect(function() --[[ Line: 627 ]]
        -- upvalues: v118 (copy), l_GuiService_0 (ref)
        v118.GetDisplayStore().setTopBarHeight(l_GuiService_0.TopbarInset.Height);
    end);
end)();
if v44 then
    local l_CoreScriptsProfilerTelemetry_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsProfiler).CoreScriptsProfilerTelemetry;
    if l_CoreScriptsProfilerTelemetry_0 then
        local v120 = nil;
        if v45 then
            v120 = l_FStringReactSchedulingContext_0;
        end;
        l_CoreScriptsProfilerTelemetry_0(v120):start();
    end;
end;