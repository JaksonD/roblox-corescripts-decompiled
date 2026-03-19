local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Symbol_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Symbol;
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_IXPService_0 = game:GetService("IXPService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v10 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v11 = require(l_CorePackages_0.Packages.Roact);
local v12 = require(l_CorePackages_0.Packages.Cryo);
local v13 = require(l_CorePackages_0.Packages.Otter);
local v14 = require(l_CorePackages_0.Packages.React);
local v15 = require(l_CorePackages_0.Packages.ReactRoblox);
local v16 = require(l_CorePackages_0.Packages.Foundation);
local l_FoundationProvider_0 = v16.FoundationProvider;
local l_Traversal_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).Traversal;
local v19 = require(script.Parent.Components.PortalWithFoundationStylelink);
local v20 = require(script.Parent.InExperienceMenuReact);
local v21 = require(script.Parent.Pages.InExperienceMenuReactPage);
local v22 = require(script.Parent.ReactPageSignal);
local v23 = require(script.Parent.Integrations.Utils);
local v24 = require(l_RobloxGui_0.Modules.Settings.Utility);
local l_VRHub_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRHub;
local v26 = require(l_CorePackages_0.Workspace.Packages.CachedPolicyService);
local v27 = require(l_RobloxGui_0.Modules.Common.PerfUtils);
local l_MouseIconOverrideService_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService;
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local l_SwitchTabHint_0 = require(l_RobloxGui_0.Modules.Settings.Components.TabHeader).SwitchTabHint;
local l_TraversalHistoryMenu_0 = require(l_RobloxGui_0.Modules.Settings.Components.Traversal).TraversalHistoryMenu;
local v32 = require(l_RobloxGui_0.Modules.Settings.Components.MenuBackButton);
local v33 = require(l_RobloxGui_0.Modules.Settings.Components.MenuFrontButton);
local v34 = require(l_RobloxGui_0.Modules.Settings.Components.MenuButtons.MenuButtonsContainer);
local v35 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_CapturesPolicy_0 = require(l_CorePackages_0.Workspace.Packages.CapturesInExperience).CapturesPolicy;
local l_InExperienceCapabilities_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities;
local v40 = require(l_CoreGui_0.RobloxGui.Modules.Settings.getCamMicPermissions);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local l_Stores_0 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon).Stores;
local v43 = require(l_CorePackages_0.Packages.Signals);
local l_createSignal_0 = v43.createSignal;
local l_AppStyleProvider_0 = require(l_CorePackages_0.Packages.UIBlox).App.Style.AppStyleProvider;
local l_Dark_0 = require(l_CorePackages_0.Packages.UIBlox).App.Style.Constants.ThemeName.Dark;
local v47 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local v49 = require(l_CorePackages_0.Workspace.Packages.HelpPage);
local v50 = require(script.Parent.Theme);
local v51 = v50.color("SETTINGS_SHIELD", Color3.new(0.1607843137254902, 0.1607843137254902, 0.1607843137254902));
local v52 = v50.transparency("SETTINGS_SHIELD_TRANSPARENCY", 0.2);
local l_SHIELD_INACTIVE_POSITION_0 = v50.SHIELD_INACTIVE_POSITION;
local v54 = l_Symbol_0.named("SettingsHubCursorOverride");
local v55 = v10 and 32 or v24:IsSmallTouchScreen() and 24 or 26;
local v56 = game:DefineFastInt("CheckLeaveGameUpsellCooldown", 300);
local v57 = game:DefineFastInt("GetServerChannelRetries", 10);
local v58 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v59 = require(script.Parent.Flags);
local v60 = {
    EngineFeatureRbxAnalyticsServiceExposePlaySessionId = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId"), 
    EngineFeatureTeleportHistoryButtons = game:GetEngineFeature("TeleportHistoryButtons"), 
    FFlagRemoveRecordPage = game:DefineFastFlag("RemoveRecordPage", false), 
    FFlagPreventHiddenSwitchPage = game:DefineFastFlag("PreventHiddenSwitchPage", false), 
    FFlagLuaEnableGameInviteModalSettingsHub = game:DefineFastFlag("LuaEnableGameInviteModalSettingsHub", false), 
    FFlagFixDisableTopPaddingError = game:DefineFastFlag("FixDisableTopPaddingError", false), 
    GetFFlagLuaInExperienceCoreScriptsGameInviteUnification = require(l_RobloxGui_0.Modules.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification), 
    FFlagEnableInGameMenuDurationLogger = require(l_RobloxGui_0.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger)(), 
    isNewInGameMenuEnabled = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled), 
    GetFFlagAbuseReportEnableReportSentPage = require(l_RobloxGui_0.Modules.Flags.GetFFlagAbuseReportEnableReportSentPage), 
    GetFFlagMuteButtonRaceConditionFix = require(l_RobloxGui_0.Modules.Flags.GetFFlagMuteButtonRaceConditionFix), 
    GetFFlagRemoveAssetVersionEndpoint = require(l_RobloxGui_0.Modules.Flags.GetFFlagRemoveAssetVersionEndpoint), 
    GetFFlagNewEventIngestPlayerScriptsDimensions = require(l_RobloxGui_0.Modules.Flags.GetFFlagNewEventIngestPlayerScriptsDimensions), 
    GetFFlagReportAbuseMenuEntrypointAnalytics = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagReportAbuseMenuEntrypointAnalytics), 
    GetFFlagEnableLeaveGameUpsellEntrypoint = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagEnableLeaveGameUpsellEntrypoint), 
    GetFStringInExperienceMenuIXPLayer = require(l_RobloxGui_0.Modules.Settings.Flags.GetFStringInExperienceMenuIXPLayer), 
    GetFStringInExperienceMenuIXPVar = require(l_RobloxGui_0.Modules.Settings.Flags.GetFStringInExperienceMenuIXPVar), 
    FFlagRelocateMobileMenuButtons = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagRelocateMobileMenuButtons), 
    FIntRelocateMobileMenuButtonsVariant = require(l_RobloxGui_0.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant), 
    FFlagMenuButtonsMountWithIEM = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagMenuButtonsMountWithIEM), 
    FFlagSpatialUIFixMenuPanelChatExclusive = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagSpatialUIFixMenuPanelChatExclusive), 
    FFlagRemoveLoadingTimeout = require(l_RobloxGui_0.Modules.Flags.FFlagRemoveLoadingTimeout), 
    FFlagAddNextUpContainer = require(l_RobloxGui_0.Modules.Settings.Pages.LeaveGameWithNextUp.Flags.FFlagAddNextUpContainer), 
    FFlagAddNewPlayerListMobileFocusNav = v47.Flags.FFlagAddNewPlayerListMobileFocusNav, 
    ChromeEnabled = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled(), 
    FFlagRespawnChromeShortcutTelemetry = require(l_RobloxGui_0.Modules.Chrome.Flags.FFlagRespawnChromeShortcutTelemetry), 
    FFlagLocalizeVersionLabels = settings():GetFFlag("LocalizeVersionLabels"), 
    isInExperienceUIVREnabled = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled, 
    InExperienceUIVRIXP = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP, 
    FFlagAddSwitchTabHintsToIEM = v58.FFlagAddSwitchTabHintsToIEM, 
    FFlagAvatarChatCoreScriptSupport = v58.GetFFlagAvatarChatCoreScriptSupport(), 
    GetFStringGameInviteMenuLayer = v58.GetFStringGameInviteMenuLayer, 
    GetFFlagEnableAppChatInExperience = v58.GetFFlagEnableAppChatInExperience, 
    GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints = v58.GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints, 
    GetFFlagDisplayServerChannel = v58.GetFFlagDisplayServerChannel, 
    FFlagSettingsHubIndependentBackgroundVisibility = v58.getFFlagSettingsHubIndependentBackgroundVisibility(), 
    GetFFlagPackagifySettingsShowSignal = v58.GetFFlagPackagifySettingsShowSignal, 
    FFlagEnableConsoleExpControls = v58.FFlagEnableConsoleExpControls, 
    FFlagIEMFocusNavToButtons = v58.FFlagIEMFocusNavToButtons, 
    FFlagIEMResumeButtonPressBugfix = v58.FFlagIEMResumeButtonPressBugfix, 
    FFlagAddUILessMode = v58.FFlagAddUILessMode, 
    FIntAddUILessModeVariant = v58.FIntAddUILessModeVariant, 
    FFlagInExperienceReportClosingBugfix = v58.FFlagInExperienceReportClosingBugfix, 
    FFlagEnableSettingsHubUIDelegateRollout = v58.FFlagEnableSettingsHubUIDelegateRollout, 
    FFlagAddIEMProfilePage = v58.FFlagAddIEMProfilePage, 
    FFlagSetUnibarShortcutOnTopBarFocus = require(l_CorePackages_0.Workspace.Packages.Chrome).Flags.FFlagSetUnibarShortcutOnTopBarFocus, 
    FFlagAddTraversalBackButton = l_Traversal_0.Flags.FFlagAddTraversalBackButton, 
    FFlagAddTraversalHistory = l_Traversal_0.Flags.FFlagAddTraversalHistory, 
    FFlagTraversalLeaveArrowDown = l_Traversal_0.Flags.FFlagTraversalLeaveArrowDown, 
    FFlagTraversalPerfFixes = l_Traversal_0.Flags.FFlagTraversalPerfFixes, 
    FFlagCreateInExperienceMenuReact = v59.FFlagCreateInExperienceMenuReact, 
    FFlagFixFocusNavToButtonsWithIEMReact = game:DefineFastFlag("FixFocusNavToButtonsWithIEMReact", false), 
    FFlagEnableSystemScrimInSettingsHub = game:DefineFastFlag("EnableSystemScrimInSettingsHub", false), 
    FFlagHelpPageIXPExposure = v49.Flags.FFlagHelpPageIXPExposure, 
    FStringHelpPageIXPLayer = v49.Flags.FStringHelpPageIXPLayer, 
    FFlagMenuButtonsCheckVisibilityBeforeMount = true, 
    FFlagFixSpatialUICaptures = game:DefineFastFlag("FixSpatialUICaptures", false), 
    FFlagMenuButtonsSkipAnimation = game:DefineFastFlag("MenuButtonsSkipAnimation", false)
};
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_VRService_0 = game:GetService("VRService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_GameSettings_0 = UserSettings().GameSettings;
local l_ExperienceMenuSessionManagerInstance_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceSessionization).ExperienceMenuSessionManagerInstance;
local v74 = nil;
pcall(function() --[[ Line: 191 ]]
    -- upvalues: v74 (ref)
    v74 = game:GetService("PlatformService");
end);
local v75 = nil;
pcall(function() --[[ Line: 194 ]]
    -- upvalues: v75 (ref)
    v75 = game:GetService("PlatformFriendsService");
end);
local v76 = nil;
spawn(function() --[[ Line: 198 ]]
    -- upvalues: v76 (ref), l_RobloxReplicatedStorage_0 (copy)
    v76 = l_RobloxReplicatedStorage_0:WaitForChild("GetServerVersion", 1e999);
end);
local v77 = nil;
if v60.GetFFlagDisplayServerChannel() then
    spawn(function() --[[ Line: 204 ]]
        -- upvalues: v77 (ref), l_RobloxReplicatedStorage_0 (copy)
        v77 = l_RobloxReplicatedStorage_0:WaitForChild("GetServerChannel", 1e999);
    end);
end;
local v78 = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
local v81 = not string.find(l_BaseUrl_0, "www.roblox.com");
local v82 = require(l_RobloxGui_0.Modules.DevConsoleMaster);
local v83 = nil;
local v84 = false;
local v85 = nil;
local v86 = nil;
local v87 = require(l_RobloxGui_0.Modules.Settings.Components.SettingsFullScreenTitleBar);
local v88 = require(l_RobloxGui_0.Modules.SelfView.toggleSelfViewSignal);
local v89 = require(l_RobloxGui_0.Modules.SelfView.publicApi);
local v90 = require(l_RobloxGui_0.Modules.SelfView.selfViewVisibilityUpdatedSignal);
local v91 = require(l_RobloxGui_0.Modules.Settings.Analytics.MenuLeaveGameTelemetryConfig);
local v92 = require(l_RobloxGui_0.Modules.Settings.Analytics.MenuResetCharacterTelemetryConfig);
local v93 = require(l_RobloxGui_0.Modules.Settings.Analytics.MenuResumeTelemetryConfig);
local v94 = require(l_RobloxGui_0.Modules.Settings.Analytics.ReactPageAnalytics);
local l_GameInviteAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteAnalytics;
local v96 = nil;
local v97 = nil;
local v98 = nil;
local v99 = nil;
if v60.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification() then
    v96 = require(l_CorePackages_0.Workspace.Packages.GameInvite);
    v97 = v96.GameInviteModalManager;
    v98 = v96.GameInviteInviteExperimentVariant;
    v99 = v96.GameInviteConstants;
end;
local v100 = require(l_RobloxGui_0.Modules.Captures.CapturesApp);
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v102 = v26:IsSubjectToChinaPolicies();
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v104 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v105 = game:DefineFastFlag("SettingsHubRaceConditionFix", false);
local v106 = game:DefineFastFlag("FixReportButtonCutOff", false);
local l_InExperienceAppChatModal_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).App.InExperienceAppChatModal;
local v108 = if v60.GetFFlagPackagifySettingsShowSignal() then require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal else nil;
local v109 = if v60.GetFFlagPackagifySettingsShowSignal() then require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).SettingsUtility else nil;
local v110 = {
    frequency = 4, 
    dampingRatio = 1
};
local _ = require(l_RobloxGui_0.Modules.Settings.ReactPageFactory);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local v113 = v60.FFlagLocalizeVersionLabels or v102;
local v114 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local function _(v115, v116) --[[ Line: 288 ]] --[[ Name: tryTranslate ]]
    -- upvalues: v114 (copy)
    if not v114 then
        return v116;
    else
        local l_status_0, l_result_0 = pcall(v114.FormatByKey, v114, v115);
        if l_status_0 then
            return l_result_0;
        else
            return v116;
        end;
    end;
end;
local v120 = require(l_RobloxGui_0.Modules.ChatSelector);
local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
local v123 = UDim2.new(0, 0, 0, -l_l_GuiService_0_GuiInset_0.Y);
local v124 = UDim2.new(1, 0, 1, l_l_GuiService_0_GuiInset_0.Y);
local function v129(v125) --[[ Line: 304 ]] --[[ Name: GetCorePackagesLoaded ]]
    local l_CorePackages_1 = game:GetService("CorePackages");
    for _, v128 in pairs(v125) do
        if not l_CorePackages_1:FindFirstChild(v128) then
            return false;
        end;
    end;
    return true;
end;
local function _() --[[ Line: 314 ]] --[[ Name: GetServerVersionBlocking ]]
    -- upvalues: v85 (ref), v76 (ref)
    if v85 then
        return v85;
    else
        if not v76 then
            repeat
                wait();
            until v76;
        end;
        v85 = v76:InvokeServer();
        return v85;
    end;
end;
local function v132() --[[ Line: 327 ]] --[[ Name: GetServerChannelBlocking ]]
    -- upvalues: v86 (ref), v57 (copy), v77 (ref)
    if v86 then
        return v86;
    else
        local l_v57_0 = v57;
        if not v77 then
            repeat
                task.wait();
                l_v57_0 = l_v57_0 - 1;
            until v77 or l_v57_0 == 0;
        end;
        if v77 then
            v86 = v77:InvokeServer();
        else
            warn("GetServerChannelRemote not available");
            v86 = "Unknown";
        end;
        return v86;
    end;
end;
local function _() --[[ Line: 348 ]] --[[ Name: GetPlaceVersionText ]]
    -- upvalues: v60 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy)
    if v60.GetFFlagRemoveAssetVersionEndpoint() then
        return game.PlaceVersion;
    else
        local l_PlaceVersion_0 = game.PlaceVersion;
        pcall(function() --[[ Line: 355 ]]
            -- upvalues: l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref), l_PlaceVersion_0 (ref)
            local l_l_HttpRbxApiService_0_Async_0 = l_HttpRbxApiService_0:GetAsync(string.format("assets/%d/versions", game.PlaceId));
            local l_VersionNumber_0 = l_HttpService_0:JSONDecode(l_l_HttpRbxApiService_0_Async_0)[1].VersionNumber;
            l_PlaceVersion_0 = string.format("%s (Latest: %d)", l_PlaceVersion_0, l_VersionNumber_0);
        end);
        return l_PlaceVersion_0;
    end;
end;
local function v138(v137) --[[ Line: 365 ]] --[[ Name: createReactPage ]]
    -- upvalues: l_Create_0 (copy), v60 (copy)
    return l_Create_0("Frame")({
        Name = "InExperienceMenuPage", 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(0, 0), 
        Visible = not v60.FFlagFixFocusNavToButtonsWithIEMReact and nil, 
        Parent = v137
    });
end;
local function v617() --[[ Line: 376 ]] --[[ Name: CreateSettingsHub ]]
    -- upvalues: v60 (copy), l_RobloxGui_0 (copy), v108 (copy), v24 (copy), v109 (copy), l_createSignal_0 (copy), v104 (copy), l_Stores_0 (copy), l_StarterGui_0 (copy), v88 (copy), v89 (copy), v90 (copy), l_RbxAnalyticsService_0 (copy), v94 (copy), v138 (copy), v50 (copy), l_ContextActionService_0 (copy), l_LocalizationService_0 (copy), l_Localization_0 (copy), v10 (copy), l_Create_0 (copy), v78 (copy), l_UserInputService_0 (copy), l_l_UserInputService_0_Platform_0 (copy), l_default_0 (copy), v40 (copy), v13 (copy), v114 (copy), v105 (copy), l_TelemetryService_0 (copy), v91 (copy), v92 (copy), l_Constants_0 (copy), v93 (copy), v15 (copy), v14 (copy), v34 (copy), v59 (copy), v124 (copy), v123 (copy), l_SHIELD_INACTIVE_POSITION_0 (copy), v52 (copy), v51 (copy), v55 (copy), v113 (copy), v132 (copy), v85 (ref), v76 (ref), l_RunService_0 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy), v26 (copy), l_BaseUrl_0 (copy), v81 (copy), l_StarterPlayer_0 (copy), l_Players_0 (copy), l_GuiService_0 (copy), v11 (copy), v35 (copy), l_IXPService_0 (copy), l_AppStyleProvider_0 (copy), l_Dark_0 (copy), v32 (copy), v33 (copy), l_AppFonts_0 (copy), v110 (copy), l_CorePackages_0 (copy), l_InExperienceAppChatModal_0 (copy), l_InExperienceCapabilities_0 (copy), l_FoundationProvider_0 (copy), v16 (copy), v23 (copy), l_SwitchTabHint_0 (copy), l_isSubjectToDesktopPolicies_0 (copy), v87 (copy), l_VRService_0 (copy), l_GameSettings_0 (copy), v82 (copy), v106 (copy), v12 (copy), l_IXPServiceWrapper_0 (copy), l_ExperienceMenuSessionManagerInstance_0 (copy), l_MouseIconOverrideService_0 (copy), v54 (copy), v56 (copy), l_TweenService_0 (copy), v27 (copy), v83 (ref), v120 (copy), v84 (ref), v98 (ref), v75 (ref), v74 (ref), v97 (ref), v99 (ref), v22 (copy), v129 (copy), l_GameInviteAnalytics_0 (copy), l_CapturesPolicy_0 (copy), l_isSpatial_0 (copy), v100 (copy), v43 (copy), v19 (copy), l_TraversalHistoryMenu_0 (copy), v20 (copy), v21 (copy)
    local v139 = {
        Visible = false, 
        Active = true, 
        Pages = {
            CurrentPage = nil, 
            PageTable = {}
        }, 
        MenuStack = {}, 
        TabHeaders = {}, 
        BottomBarButtons = {}, 
        BottomBarButtonsComponents = {}, 
        ResizedConnection = nil, 
        BackBarVisibleConnection = nil
    };
    if v60.EngineFeatureTeleportHistoryButtons then
        v139.FrontBarVisibleConnection = nil;
    end;
    v139.PreferredTransparencyChangedConnection = nil;
    v139.TabConnection = nil;
    if v60.FFlagAddNextUpContainer then
        v139.LeaveGamePage = require(l_RobloxGui_0.Modules.Settings.Pages.LeaveGameWithNextUp);
    else
        v139.LeaveGamePage = require(l_RobloxGui_0.Modules.Settings.Pages.LeaveGame);
    end;
    v139.LeaveGameUpsellPage = if v60.GetFFlagEnableLeaveGameUpsellEntrypoint() then require(l_RobloxGui_0.Modules.Settings.Pages.LeaveGameUpsell.LeaveGameUpsell) else nil;
    v139.ResetCharacterPage = require(l_RobloxGui_0.Modules.Settings.Pages.ResetCharacter);
    v139.SettingsShowSignal = if v60.GetFFlagPackagifySettingsShowSignal() then v108 else v24:CreateSignal();
    v139.CurrentPageSignal = if v60.GetFFlagPackagifySettingsShowSignal() then v109.CreateSignal() else v24:CreateSignal();
    local v140 = nil;
    local v141 = nil;
    if v60.FFlagTraversalPerfFixes then
        local v142, v143 = l_createSignal_0(false);
        v140 = v142;
        v141 = v143;
        v139.showBottomBarSignal = v140;
        v139.setShowBottomBarSignal = v141;
    end;
    v139.OpenStateChangedCount = 0;
    v139.BottomButtonFrame = nil;
    if v60.FFlagRelocateMobileMenuButtons then
        v139.addMenuKeyBindings = nil;
        v139.removeMenuKeyBindings = nil;
    end;
    v139.hasMicPermissions = false;
    if v60.GetFFlagEnableLeaveGameUpsellEntrypoint() then
        v139.checkedUpsell = false;
        v139.leaveGameUpsellProp = v104.PHONE_UPSELL_VALUE_PROP.None;
        v139.sessionStartTime = os.time();
    end;
    v139.isFetchingMicPermissions = true;
    if v60.FFlagAddUILessMode and v60.FIntAddUILessModeVariant ~= 0 then
        v139.uiLessStore = l_Stores_0.GetUILessStore(false);
    end;
    v139.isMuted = nil;
    v139.lastVoiceRecordingIndicatorTextUpdated = nil;
    if v60.FFlagAvatarChatCoreScriptSupport then
        v139.selfViewOpen = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView);
        v139.toggleSelfViewSignal = v88:connect(function() --[[ Line: 435 ]]
            -- upvalues: v139 (copy)
            v139.selfViewOpen = not v139.selfViewOpen;
        end);
        v139.selfViewOpen = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView) and v89.getSelfViewIsOpenAndVisible();
        v139.selfViewVisibilitySignal = v90:connect(function() --[[ Line: 440 ]]
            -- upvalues: v139 (copy), v89 (ref)
            v139.selfViewOpen = v89.getSelfViewIsOpenAndVisible();
        end);
    end;
    v139.playSessionId = "";
    if v60.EngineFeatureRbxAnalyticsServiceExposePlaySessionId then
        v139.playSessionId = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    v139.reactPageAnalytics = v94.new();
    local v144 = nil;
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    l_BindableEvent_0.Name = "PoppedMenu";
    v139.PoppedMenu = l_BindableEvent_0.Event;
    v139.ReactPage = nil;
    if v60.FFlagCreateInExperienceMenuReact then
        v139.ReactPage = v138();
    end;
    local function _(v146) --[[ Line: 464 ]] --[[ Name: shouldShowHubBar ]]
        -- upvalues: v139 (copy)
        return (v146 or v139.Pages.CurrentPage).ShouldShowBottomBar == true;
    end;
    local function v153(v148) --[[ Line: 469 ]] --[[ Name: setBottomBarSelection ]]
        -- upvalues: v139 (copy), v60 (ref)
        if not v139.BottomButtonFrame and v60.FFlagIEMFocusNavToButtons and not v148 and (not v60.FFlagRelocateMobileMenuButtons or v60.FIntRelocateMobileMenuButtonsVariant == 0 or v60.FIntRelocateMobileMenuButtonsVariant == 2) then
            return;
        else
            if v139.ResumeButton then
                v148.PageNextSelectionDown = v139.ResumeButton;
            end;
            for _, v150 in v148.LastSelectableObjects do
                v139.BottomButtonFrame.SelectionBehaviorUp = Enum.SelectionBehavior.Escape;
                v139.BottomButtonFrame.NextSelectionUp = v150;
                v150.NextSelectionDown = v148.PageNextSelectionDown;
                local l_LeaveGameButton_0 = v139.LeaveGameButton;
                if l_LeaveGameButton_0 then
                    l_LeaveGameButton_0.NextSelectionUp = v150;
                end;
            end;
            if #v148.LastSelectableObjects < 1 then
                v139.BottomButtonFrame.SelectionBehaviorUp = Enum.SelectionBehavior.Stop;
                v139.BottomButtonFrame.NextSelectionUp = nil;
                local l_LeaveGameButton_1 = v139.LeaveGameButton;
                if l_LeaveGameButton_1 then
                    l_LeaveGameButton_1.NextSelectionUp = nil;
                end;
            end;
            return;
        end;
    end;
    local function v156(v154) --[[ Line: 501 ]] --[[ Name: shouldShowBottomBar ]]
        -- upvalues: v139 (copy), v60 (ref), v24 (ref), v50 (ref)
        v154 = v154 or v139.Pages.CurrentPage;
        if (not v60.FFlagRelocateMobileMenuButtons or v60.FIntRelocateMobileMenuButtonsVariant == 0 or v60.FIntRelocateMobileMenuButtonsVariant == 2) and (v24:IsPortrait() or v24:IsSmallTouchScreen()) and not v50.AlwaysShowBottomBar() then
            return false;
        else
            local v155 = false;
            if v154 ~= nil then
                v155 = v154.ShouldShowBottomBar == true;
            end;
            return v155;
        end;
    end;
    local function v161() --[[ Line: 515 ]] --[[ Name: setBottomBarBindings ]]
        -- upvalues: v139 (copy), v60 (ref), l_ContextActionService_0 (ref)
        if not v139.Visible then
            return;
        else
            if not v60.FFlagRelocateMobileMenuButtons or v60.FIntRelocateMobileMenuButtonsVariant == 0 then
                for v157 = 1, #v139.BottomBarButtons do
                    local v158 = v139.BottomBarButtons[v157];
                    local v159 = v158[1];
                    local v160 = v158[2];
                    l_ContextActionService_0:BindCoreAction(v159, v160[1], false, unpack(v160[2]));
                end;
            elseif v139.addMenuKeyBindings then
                v139.addMenuKeyBindings();
            end;
            if v139.BottomButtonFrame then
                v139.BottomButtonFrame.Visible = true;
            end;
            return;
        end;
    end;
    local function v167(v162) --[[ Line: 538 ]] --[[ Name: removeBottomBarBindings ]]
        -- upvalues: v60 (ref), v139 (copy), l_ContextActionService_0 (ref)
        if not v60.FFlagRelocateMobileMenuButtons or v60.FIntRelocateMobileMenuButtonsVariant == 0 then
            for _, v164 in pairs(v139.BottomBarButtons) do
                l_ContextActionService_0:UnbindCoreAction(v164[1]);
            end;
        elseif v139.removeMenuKeyBindings then
            v139.removeMenuKeyBindings();
        end;
        local l_OpenStateChangedCount_0 = v139.OpenStateChangedCount;
        local function v166() --[[ Line: 550 ]]
            -- upvalues: v139 (ref), l_OpenStateChangedCount_0 (copy)
            if v139.OpenStateChangedCount == l_OpenStateChangedCount_0 and v139.BottomButtonFrame then
                v139.BottomButtonFrame.Visible = false;
            end;
        end;
        if v162 then
            delay(v162, v166);
            return;
        else
            if v139.OpenStateChangedCount == l_OpenStateChangedCount_0 and v139.BottomButtonFrame then
                v139.BottomButtonFrame.Visible = false;
            end;
            return;
        end;
    end;
    local function _(v168, v169, v170) --[[ Line: 563 ]] --[[ Name: updateButtonPosition ]]
        -- upvalues: v60 (ref), v139 (copy)
        if not v60.FFlagRelocateMobileMenuButtons or v60.FIntRelocateMobileMenuButtonsVariant == 0 then
            local l_FirstChild_0 = v139.BottomButtonFrame:FindFirstChild(v168 .. "ButtonButton", true);
            if not l_FirstChild_0 then
                return;
            else
                l_FirstChild_0.Position = v169;
                l_FirstChild_0.Size = v170;
            end;
        end;
    end;
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v174 = l_Localization_0.new(l_RobloxLocaleId_0);
    local function v181() --[[ Line: 579 ]] --[[ Name: hideVoiceUx ]]
        -- upvalues: v139 (copy), v10 (ref), v50 (ref), v60 (ref)
        local l_MuteButtonButton_0 = v139.MuteButtonButton;
        if l_MuteButtonButton_0 then
            l_MuteButtonButton_0.Visible = false;
            l_MuteButtonButton_0:Destroy();
        end;
        local v176 = if v10 then UDim2.new(0, 320, 0, 72) else UDim2.new(0, 260, 0, v50.LargeButtonHeight);
        if not v60.FFlagRelocateMobileMenuButtons or v60.FIntRelocateMobileMenuButtonsVariant == 0 then
            local v177 = UDim2.new(0.5, v10 and -160 or -130, 0.5, -25);
            if not v60.FFlagRelocateMobileMenuButtons or v60.FIntRelocateMobileMenuButtonsVariant == 0 then
                local l_FirstChild_1 = v139.BottomButtonFrame:FindFirstChild("LeaveGameButtonButton", true);
                if l_FirstChild_1 then
                    l_FirstChild_1.Position = v177;
                    l_FirstChild_1.Size = v176;
                end;
            end;
            v177 = UDim2.new(0.5, v10 and -550 or -400, 0.5, -25);
            if not v60.FFlagRelocateMobileMenuButtons or v60.FIntRelocateMobileMenuButtonsVariant == 0 then
                local l_FirstChild_2 = v139.BottomButtonFrame:FindFirstChild("ResetCharacterButtonButton", true);
                if l_FirstChild_2 then
                    l_FirstChild_2.Position = v177;
                    l_FirstChild_2.Size = v176;
                end;
            end;
            v177 = UDim2.new(0.5, v10 and 200 or 140, 0.5, -25);
            if not v60.FFlagRelocateMobileMenuButtons or v60.FIntRelocateMobileMenuButtonsVariant == 0 then
                local l_FirstChild_3 = v139.BottomButtonFrame:FindFirstChild("ResumeButtonButton", true);
                if not l_FirstChild_3 then
                    return;
                else
                    l_FirstChild_3.Position = v177;
                    l_FirstChild_3.Size = v176;
                end;
            end;
        end;
    end;
    local function v202(v182, v183, v184, v185, v186, v187, v188, v189) --[[ Line: 595 ]] --[[ Name: addBottomBarButtonOld ]]
        -- upvalues: v60 (ref), v50 (ref), v10 (ref), v139 (copy), v24 (ref), l_Create_0 (ref), v78 (ref), l_UserInputService_0 (ref), l_l_UserInputService_0_Platform_0 (ref)
        if not v60.FFlagRelocateMobileMenuButtons or v60.FIntRelocateMobileMenuButtonsVariant == 0 then
            local v190 = v182 .. "Button";
            local v191 = v182 .. "Text";
            local v192 = UDim2.new(0, 260, 0, v50.LargeButtonHeight);
            if v10 then
                v192 = UDim2.new(0, 320, 0, 72);
            end;
            local l_v139_0 = v139;
            local l_v139_1 = v139;
            local v195, v196 = v24:MakeStyledButton(v182 .. "Button", v183, v192, v187, nil, v139);
            l_v139_0[v190] = v195;
            l_v139_1[v191] = v196;
            l_Create_0("UIListLayout")({
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Parent = v139[v190]
            });
            l_Create_0("UIPadding")({
                PaddingLeft = UDim.new(0.025, 0), 
                Parent = v139[v190]
            });
            v139[v191].Size = UDim2.new(0, 0, 1, 0);
            l_Create_0("UIFlexItem")({
                FlexMode = Enum.UIFlexMode.Grow, 
                Parent = v139[v191]
            });
            v139[v190].Position = v186;
            v139[v190].Parent = v139.BottomButtonFrame;
            if v10 then
                v139[v190].ImageTransparency = 1;
            end;
            v139[v191].FontSize = Enum.FontSize.Size24;
            l_v139_0 = nil;
            if not v78 then
                l_v139_1 = v182 .. "Hint";
                v195 = "";
                v195 = if not not l_UserInputService_0:GetGamepadConnected(Enum.UserInputType.Gamepad1) or l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne then v184 else v185;
                l_v139_0 = l_Create_0("ImageLabel")({
                    Name = l_v139_1, 
                    ZIndex = v139.Shield.ZIndex + 2, 
                    BackgroundTransparency = 1, 
                    Image = v195, 
                    LayoutOrder = -1, 
                    Parent = v139[v190]
                });
                if v195 == v185 then
                    l_v139_0.ImageColor3 = v50.color("WhiteButtonText", Color3.new(1, 1, 1));
                    l_v139_0.ImageTransparency = v50.transparency("WhiteButtonText", 1);
                end;
                l_v139_0.Position = UDim2.new(0, 9, 0.5, 0);
                l_v139_0.Size = UDim2.new(0, 33, 0, 33);
                l_v139_0.AnchorPoint = Vector2.new(0, 0.5);
            end;
            if v10 then
                v139[v191].FontSize = Enum.FontSize.Size36;
            end;
            do
                local l_l_v139_0_0 = l_v139_0;
                l_UserInputService_0.InputBegan:connect(function(v198) --[[ Line: 668 ]]
                    -- upvalues: l_l_v139_0_0 (ref), v184 (copy), v185 (copy)
                    if v198.UserInputType == Enum.UserInputType.Gamepad1 or v198.UserInputType == Enum.UserInputType.Gamepad2 or v198.UserInputType == Enum.UserInputType.Gamepad3 or v198.UserInputType == Enum.UserInputType.Gamepad4 then
                        if l_l_v139_0_0 then
                            l_l_v139_0_0.Image = v184;
                            return;
                        end;
                    elseif v198.UserInputType == Enum.UserInputType.Keyboard and l_l_v139_0_0 then
                        l_l_v139_0_0.Image = v185;
                    end;
                end);
                v139.BottomBarButtons[#v139.BottomBarButtons + 1] = {
                    v190, 
                    {
                        function(_, v200, _) --[[ Line: 691 ]]
                            -- upvalues: v189 (copy)
                            if v200 == Enum.UserInputState.Begin then
                                v189();
                            end;
                        end, 
                        v188
                    }
                };
            end;
        end;
    end;
    local v203 = "";
    if v10 then
        v203 = "@2x";
    end;
    local v204 = nil;
    local v205 = nil;
    local v206 = nil;
    if v60.FFlagEnableConsoleExpControls then
        v204 = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonB);
        v205 = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonX);
        v206 = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonY);
    else
        v204 = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB" .. v203 .. ".png";
        v205 = "rbxasset://textures/ui/Controls/DesignSystem/ButtonX" .. v203 .. ".png";
        v206 = "rbxasset://textures/ui/Controls/DesignSystem/ButtonY" .. v203 .. ".png";
    end;
    local l_l_UserInputService_0_ImageForKeyCode_0 = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonStart);
    local v208 = false;
    local v209 = nil;
    local function v224() --[[ Line: 725 ]] --[[ Name: setupVoiceListeners ]]
        -- upvalues: v208 (ref), v139 (copy), l_default_0 (ref), v40 (ref), v60 (ref), v209 (ref), v13 (ref), v114 (ref), v181 (copy)
        if game:GetEngineFeature("VoiceChatSupported") and not v208 then
            v208 = true;
            local function v222() --[[ Line: 730 ]] --[[ Name: showUI ]]
                -- upvalues: v139 (ref), l_default_0 (ref), v40 (ref), v60 (ref), v209 (ref), v13 (ref), v114 (ref)
                v139.VoiceRecordingText.Visible = true;
                l_default_0:getService().StateChanged:Connect(function(_, v211) --[[ Line: 733 ]]
                    -- upvalues: v139 (ref)
                    if v211 == Enum.VoiceChatState.Joined then
                        v139.VoiceRecordingText.Visible = true;
                    end;
                end);
                l_default_0:SetupParticipantListeners();
                v40(function(v212) --[[ Line: 740 ]]
                    -- upvalues: v139 (ref)
                    v139.hasMicPermissions = v212.hasMicPermissions;
                end, nil, true, "PermissionsButtons.getPermissions");
                if v60.GetFFlagMuteButtonRaceConditionFix() then
                    v209 = l_default_0.muteChanged.Event:Connect(function(v213) --[[ Line: 745 ]]
                        -- upvalues: v139 (ref), v13 (ref), v114 (ref)
                        v139.isMuted = v213;
                        v139.lastVoiceRecordingIndicatorTextUpdated = tick();
                        v139.voiceRecordingIndicatorTextMotor:setGoal(v13.instant(0));
                        if v139.isMuted then
                            local l_VoiceRecordingText_0 = v139.VoiceRecordingText;
                            local v215;
                            if not v114 then
                                v215 = "Mic Off";
                            else
                                local l_status_1, l_result_1 = pcall(v114.FormatByKey, v114, "InGame.CommonUI.Label.MicOff");
                                v215 = if l_status_1 then l_result_1 else "Mic Off";
                            end;
                            l_VoiceRecordingText_0.Text = v215;
                            return;
                        else
                            local l_VoiceRecordingText_1 = v139.VoiceRecordingText;
                            local v219;
                            if not v114 then
                                v219 = "Mic On (recording audio)";
                            else
                                local l_status_2, l_result_2 = pcall(v114.FormatByKey, v114, "InGame.CommonUI.Label.MicOnRecording");
                                v219 = if l_status_2 then l_result_2 else "Mic On (recording audio)";
                            end;
                            l_VoiceRecordingText_1.Text = v219;
                            return;
                        end;
                    end);
                end;
            end;
            local function v223() --[[ Line: 757 ]] --[[ Name: hideUI ]]
                -- upvalues: v139 (ref), v181 (ref), v209 (ref)
                v139.VoiceRecordingText.Visible = false;
                v181();
                if v209 then
                    v209:Disconnect();
                end;
            end;
            if l_default_0.voiceUIVisible then
                v222();
            end;
            l_default_0.showVoiceUI.Event:Connect(v222);
            l_default_0.hideVoiceUI.Event:Connect(v223);
        end;
    end;
    if not v105 then
        v224();
    end;
    local v225 = true;
    local function v229(v226) --[[ Line: 781 ]] --[[ Name: setResetEnabled ]]
        -- upvalues: v225 (ref), v139 (copy)
        v225 = v226;
        if v139.ResetCharacterButton then
            v139.ResetCharacterButton.Selectable = v226;
            v139.ResetCharacterButton.Active = v226;
            v139.ResetCharacterButton.Enabled.Value = v226;
            local l_ResetCharacterHint_0 = v139.ResetCharacterButton:FindFirstChild("ResetCharacterHint");
            if l_ResetCharacterHint_0 then
                l_ResetCharacterHint_0.ImageColor3 = v226 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100);
            end;
            local l_ResetCharacterButtonTextLabel_0 = v139.ResetCharacterButton:FindFirstChild("ResetCharacterButtonTextLabel");
            if l_ResetCharacterButtonTextLabel_0 then
                l_ResetCharacterButtonTextLabel_0.TextColor3 = v226 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100);
            end;
        end;
    end;
    local v230 = nil;
    v139.GetRespawnBehaviour = function(_) --[[ Line: 799 ]] --[[ Name: GetRespawnBehaviour ]]
        -- upvalues: v60 (ref), v139 (copy), v225 (ref), v230 (ref)
        if v60.FFlagRelocateMobileMenuButtons and v60.FIntRelocateMobileMenuButtonsVariant ~= 0 then
            return v139:GetExperienceControlStore().getCanRespawn(false), v139:GetExperienceControlStore().getCustomRespawnCallback(false);
        else
            return v225, v230;
        end;
    end;
    v139.RespawnBehaviourChangedEvent = Instance.new("BindableEvent");
    l_StarterGui_0:RegisterSetCore("ResetButtonCallback", function(v232) --[[ Line: 809 ]]
        -- upvalues: v139 (copy), v60 (ref), v225 (ref), v229 (copy), v230 (ref)
        local v233 = false;
        if typeof(v232) == "Instance" then
            v233 = v232:IsA("BindableEvent");
        end;
        if v233 or type(v232) == "boolean" then
            v139.ResetCharacterPage:SetResetCallback(v232);
        else
            warn("ResetButtonCallback must be set to a BindableEvent or a boolean");
        end;
        local v234 = if v60.FFlagRelocateMobileMenuButtons and v60.FIntRelocateMobileMenuButtonsVariant ~= 0 then v139:GetExperienceControlStore().getCanRespawn(false) else v225;
        if v232 == false then
            if v60.FFlagRelocateMobileMenuButtons and v60.FIntRelocateMobileMenuButtonsVariant ~= 0 then
                v139:GetExperienceControlStore().setCanRespawn(false);
            else
                v229(false);
            end;
        elseif not v234 and (v233 or v232 == true) then
            if v60.FFlagRelocateMobileMenuButtons and v60.FIntRelocateMobileMenuButtonsVariant ~= 0 then
                v139:GetExperienceControlStore().setCanRespawn(true);
            else
                v229(true);
            end;
        end;
        if v233 then
            if v60.FFlagRelocateMobileMenuButtons and v60.FIntRelocateMobileMenuButtonsVariant ~= 0 then
                v139:GetExperienceControlStore().setCustomRespawnCallback(v232);
            else
                v230 = v232;
            end;
        end;
        if v60.FFlagRelocateMobileMenuButtons and v60.FIntRelocateMobileMenuButtonsVariant ~= 0 then
            v139.RespawnBehaviourChangedEvent:Fire(v139:GetExperienceControlStore().getCanRespawn(false), v139:GetExperienceControlStore().getCustomRespawnCallback(false));
            return;
        else
            v139.RespawnBehaviourChangedEvent:Fire(v225, v230);
            return;
        end;
    end);
    l_StarterGui_0:RegisterGetCore("ResetButtonCallback", function() --[[ Line: 844 ]]
        -- upvalues: v139 (copy)
        local l_v139_RespawnBehaviour_0, _ = v139:GetRespawnBehaviour();
        return l_v139_RespawnBehaviour_0;
    end);
    local v237 = nil;
    local v238, v239 = l_createSignal_0(true);
    local v240, v241 = l_createSignal_0(nil);
    v139.GetExperienceControlStore = function(_) --[[ Line: 854 ]] --[[ Name: GetExperienceControlStore ]]
        -- upvalues: v239 (copy), v139 (copy), v238 (copy), v240 (copy), v241 (copy), v60 (ref), v104 (ref), l_TelemetryService_0 (ref), v91 (ref), v92 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), v93 (ref)
        local function v246(v243) --[[ Line: 855 ]]
            -- upvalues: v239 (ref), v139 (ref)
            v239(v243);
            if v139.ResetCharacterButton then
                v139.ResetCharacterButton.Selectable = v243;
                v139.ResetCharacterButton.Active = v243;
                v139.ResetCharacterButton.Enabled.Value = v243;
                local l_ResetCharacterHint_1 = v139.ResetCharacterButton:FindFirstChild("ResetCharacterHint");
                if l_ResetCharacterHint_1 then
                    l_ResetCharacterHint_1.ImageColor3 = v243 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100);
                end;
                local l_ResetCharacterButtonTextLabel_1 = v139.ResetCharacterButton:FindFirstChild("ResetCharacterButtonTextLabel");
                if l_ResetCharacterButtonTextLabel_1 then
                    l_ResetCharacterButtonTextLabel_1.TextColor3 = v243 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100);
                end;
            end;
        end;
        return {
            getCanRespawn = v238, 
            getCustomRespawnCallback = v240, 
            setCanRespawn = v246, 
            setCustomRespawnCallback = v241, 
            onLeaveGame = function(v247) --[[ Line: 877 ]] --[[ Name: onLeaveGame ]]
                -- upvalues: v139 (ref), v60 (ref), v104 (ref), l_TelemetryService_0 (ref), v91 (ref)
                if not v139:GetVisibility() then
                    return;
                else
                    v139:AddToMenuStack(v139.Pages.CurrentPage);
                    v139.HubBar.Visible = false;
                    if v60.GetFFlagEnableLeaveGameUpsellEntrypoint() and v139.leaveGameUpsellProp ~= v104.PHONE_UPSELL_VALUE_PROP.None then
                        v139:SwitchToPage(v139.LeaveGameUpsellPage, false);
                    else
                        v139:SwitchToPage(v139.LeaveGamePage, false, nil, v60.FFlagMenuButtonsSkipAnimation and true or nil);
                    end;
                    l_TelemetryService_0:LogCounter(v91, {
                        customFields = {
                            source = v247
                        }
                    });
                    return;
                end;
            end, 
            onRespawn = function(v248) --[[ Line: 896 ]] --[[ Name: onRespawn ]]
                -- upvalues: v238 (ref), v139 (ref), v60 (ref), l_TelemetryService_0 (ref), v92 (ref)
                if not v238(false) then
                    return;
                else
                    v139:AddToMenuStack(v139.Pages.CurrentPage);
                    v139.HubBar.Visible = false;
                    v139:SwitchToPage(v139.ResetCharacterPage, false, nil, v60.FFlagMenuButtonsSkipAnimation and true or nil);
                    l_TelemetryService_0:LogCounter(v92, {
                        customFields = {
                            source = v248
                        }
                    });
                    return;
                end;
            end, 
            onResume = function(v249) --[[ Line: 911 ]] --[[ Name: onResume ]]
                -- upvalues: v60 (ref), v139 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), l_TelemetryService_0 (ref), v93 (ref)
                if v60.FFlagAddUILessMode then
                    v139:SetVisibility(false, nil, nil, nil, v249);
                else
                    v139:SetVisibility(false);
                end;
                if v60.FFlagAddUILessMode and v60.FIntAddUILessModeVariant ~= 0 and v139.uiLessStore.getUILessModeEnabled(false) then
                    v139.uiLessStore.setUIVisible(false);
                end;
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsResumeGameName, l_Constants_0.AnalyticsMenuActionName, {
                    source = v249, 
                    playsessionid = v139.playSessionId, 
                    universeid = tostring(game.GameId)
                });
                l_TelemetryService_0:LogCounter(v93, {
                    customFields = {
                        source = v249
                    }
                });
            end
        };
    end;
    local v253 = v60.FFlagRelocateMobileMenuButtons and v60.FIntRelocateMobileMenuButtonsVariant ~= 0 and function() --[[ Line: 943 ]]
        -- upvalues: v139 (copy), v15 (ref), v14 (ref), v34 (ref), v59 (ref)
        if v139.BottomButtonFrameRoot then
            return;
        else
            local l_v139_ExperienceControlStore_0 = v139:GetExperienceControlStore();
            v139.BottomButtonFrameRoot = v15.createRoot(v139.BottomButtonFrame);
            v139.BottomButtonFrameRoot:render(v14.createElement(v34, {
                onLeaveGame = l_v139_ExperienceControlStore_0.onLeaveGame, 
                onRespawn = l_v139_ExperienceControlStore_0.onRespawn, 
                onResume = l_v139_ExperienceControlStore_0.onResume, 
                setAddMenuKeyBindings = function(v251) --[[ Line: 955 ]] --[[ Name: setAddMenuKeyBindings ]]
                    -- upvalues: v139 (ref)
                    v139.addMenuKeyBindings = v251;
                end, 
                setRemoveMenuKeyBindings = function(v252) --[[ Line: 959 ]] --[[ Name: setRemoveMenuKeyBindings ]]
                    -- upvalues: v139 (ref)
                    v139.removeMenuKeyBindings = v252;
                end, 
                getVisibility = function() --[[ Line: 963 ]] --[[ Name: getVisibility ]]
                    -- upvalues: v139 (ref)
                    return v139.GetVisibility();
                end, 
                getCanRespawn = l_v139_ExperienceControlStore_0.getCanRespawn, 
                currentPageChangeSignal = if v59.FFlagAddTraversalHistoryReactMenuButtons then v139.CurrentPageSignal else nil
            }));
            return;
        end;
    end or nil;
    local v254 = v60.FFlagRelocateMobileMenuButtons and v60.FIntRelocateMobileMenuButtonsVariant ~= 0 and function() --[[ Line: 973 ]]
        -- upvalues: v139 (copy)
        if v139.BottomButtonFrameRoot then
            v139.BottomButtonFrameRoot:unmount();
            v139.BottomButtonFrameRoot = nil;
        end;
    end or nil;
    local function v355() --[[ Line: 981 ]] --[[ Name: createGui ]]
        -- upvalues: v24 (ref), v139 (copy), l_Create_0 (ref), v124 (ref), v123 (ref), l_RobloxGui_0 (ref), l_SHIELD_INACTIVE_POSITION_0 (ref), v52 (ref), v51 (ref), v55 (ref), v60 (ref), v50 (ref), v10 (ref), v113 (ref), v114 (ref), v132 (ref), v85 (ref), v76 (ref), l_RunService_0 (ref), l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref), v26 (ref), l_BaseUrl_0 (ref), v81 (ref), l_StarterPlayer_0 (ref), l_Players_0 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), v138 (ref), l_GuiService_0 (ref), v40 (ref), l_default_0 (ref), v11 (ref), v35 (ref), l_IXPService_0 (ref), l_AppStyleProvider_0 (ref), l_Dark_0 (ref), v32 (ref), v33 (ref), l_AppFonts_0 (ref), v13 (ref), v110 (ref), l_UserInputService_0 (ref), v237 (ref), v253 (copy), l_CorePackages_0 (ref), l_InExperienceAppChatModal_0 (ref), v167 (copy), v104 (ref), l_InExperienceCapabilities_0 (ref), v202 (copy), v205 (ref), v225 (ref), v174 (copy), v206 (ref), l_l_UserInputService_0_ImageForKeyCode_0 (copy), v204 (ref), v15 (ref), v14 (ref), l_FoundationProvider_0 (ref), v16 (ref), v23 (ref), l_SwitchTabHint_0 (ref), l_isSubjectToDesktopPolicies_0 (ref), v87 (ref)
        local v255 = 0;
        if v24:IsSmallTouchScreen() then
            v255 = 5;
        end;
        v139.ClippingShield = l_Create_0("Frame")({
            Name = "SettingsClippingShield", 
            Size = v124, 
            Position = v123, 
            BorderSizePixel = 0, 
            ClipsDescendants = true, 
            BackgroundTransparency = 1, 
            Visible = true, 
            ZIndex = 2, 
            Parent = l_RobloxGui_0
        });
        v139.CanvasGroup = l_Create_0("CanvasGroup")({
            Name = "CanvasGroup", 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            GroupTransparency = 0, 
            Visible = false, 
            Parent = v139.ClippingShield
        });
        v139.Shield = l_Create_0("ImageButton")({
            Name = "SettingsShield", 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = l_SHIELD_INACTIVE_POSITION_0, 
            BackgroundTransparency = v52, 
            BackgroundColor3 = v51, 
            BorderSizePixel = 0, 
            Visible = false, 
            Active = true, 
            ZIndex = 2, 
            Parent = v139.ClippingShield
        });
        v139.VRShield = l_Create_0("Frame")({
            Name = "VRBackground", 
            Parent = v139.Shield, 
            BackgroundColor3 = v51, 
            BackgroundTransparency = v52, 
            Position = UDim2.new(0, -4, 0, 24), 
            Size = UDim2.new(1, 8, 1, -40), 
            BorderSizePixel = 0, 
            Visible = false
        });
        local l_game_EngineFeature_0 = game:GetEngineFeature("CoreScriptVersionEnabled");
        if l_game_EngineFeature_0 then
            v139.VersionContainer = l_Create_0("ScrollingFrame")({
                Name = "VersionContainer", 
                Parent = v139.Shield, 
                CanvasSize = UDim2.new(0, 0, 0, v55), 
                BackgroundColor3 = v51, 
                BackgroundTransparency = v52, 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, 0, 0, v55), 
                AnchorPoint = Vector2.new(0, 1), 
                BorderSizePixel = 0, 
                AutoLocalize = false, 
                ScrollingDirection = Enum.ScrollingDirection.X, 
                ScrollBarThickness = 0, 
                ZIndex = 5, 
                Visible = false
            });
        else
            v139.VersionContainer = l_Create_0("Frame")({
                Name = "VersionContainer", 
                Parent = v139.Shield, 
                BackgroundColor3 = v51, 
                BackgroundTransparency = v52, 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, 0, 0, v55), 
                AnchorPoint = Vector2.new(0, 1), 
                BorderSizePixel = 0, 
                AutoLocalize = false, 
                ZIndex = 5, 
                Visible = false
            });
        end;
        local v257 = l_Create_0("UIListLayout")({
            Name = "VersionContainer", 
            Parent = v139.VersionContainer, 
            Padding = UDim.new(0, 6), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        });
        local function _(v258) --[[ Line: 1091 ]] --[[ Name: addSizeToLabel ]]
            -- upvalues: l_game_EngineFeature_0 (copy), v55 (ref)
            local v259 = UDim2.new(0.2, -6, 1, 0);
            v258.Size = l_game_EngineFeature_0 and UDim2.new(0, v258.TextBounds.X + 6, 0, v55) or v259;
        end;
        if v60.GetFFlagDisplayServerChannel() then
            v139.ServerChannelLabel = l_Create_0("TextLabel")({
                Name = "ServerChannelLabel", 
                Parent = v139.VersionContainer, 
                LayoutOrder = 3, 
                BackgroundTransparency = 1, 
                TextColor3 = Color3.new(1, 1, 1), 
                TextSize = v50.textSize(v10 and 28 or v24:IsSmallTouchScreen() and 14 or 20), 
                Text = "Server Channel: ...", 
                Font = v50.font(Enum.Font.SourceSans, "SettingsHub"), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 5
            });
            spawn(function() --[[ Line: 1110 ]]
                -- upvalues: v113 (ref), v114 (ref), v139 (ref), v132 (ref), l_game_EngineFeature_0 (copy), v55 (ref)
                local v261 = "Server Channel: ";
                if v113 then
                    if not v114 then
                        v261 = "Server Channel: ";
                    else
                        local l_status_3, l_result_3 = pcall(v114.FormatByKey, v114, "InGame.HelpMenu.Label.ServerChannel");
                        v261 = if l_status_3 then l_result_3 else "Server Channel: ";
                    end;
                end;
                v139.ServerChannelLabel.Text = v261 .. v132();
                local l_ServerChannelLabel_0 = v139.ServerChannelLabel;
                local v265 = UDim2.new(0.2, -6, 1, 0);
                l_ServerChannelLabel_0.Size = l_game_EngineFeature_0 and UDim2.new(0, l_ServerChannelLabel_0.TextBounds.X + 6, 0, v55) or v265;
                v139.ServerChannelLabel.TextScaled = not (l_game_EngineFeature_0 or v139.ServerChannelLabel.TextFits);
            end);
        end;
        v139.ServerVersionLabel = l_Create_0("TextLabel")({
            Name = "ServerVersionLabel", 
            Parent = v139.VersionContainer, 
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            TextColor3 = Color3.new(1, 1, 1), 
            TextSize = v50.textSize(v10 and 28 or v24:IsSmallTouchScreen() and 14 or 20), 
            Text = "Server Version: ...", 
            Font = v50.font(Enum.Font.SourceSans, "SettingsHub"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 5
        });
        spawn(function() --[[ Line: 1134 ]]
            -- upvalues: v113 (ref), v114 (ref), v139 (ref), v85 (ref), v76 (ref), l_game_EngineFeature_0 (copy), v55 (ref)
            local v266 = "Server Version: ";
            if v113 then
                if not v114 then
                    v266 = "Server Version: ";
                else
                    local l_status_4, l_result_4 = pcall(v114.FormatByKey, v114, "InGame.HelpMenu.Label.ServerVersion");
                    v266 = if l_status_4 then l_result_4 else "Server Version: ";
                end;
            end;
            local l_ServerVersionLabel_0 = v139.ServerVersionLabel;
            local l_v266_0 = v266;
            local v271;
            if v85 then
                v271 = v85;
            else
                if not v76 then
                    repeat
                        wait();
                    until v76;
                end;
                v85 = v76:InvokeServer();
                v271 = v85;
            end;
            l_ServerVersionLabel_0.Text = l_v266_0 .. v271;
            l_ServerVersionLabel_0 = v139.ServerVersionLabel;
            local v272 = UDim2.new(0.2, -6, 1, 0);
            l_ServerVersionLabel_0.Size = l_game_EngineFeature_0 and UDim2.new(0, l_ServerVersionLabel_0.TextBounds.X + 6, 0, v55) or v272;
            v139.ServerVersionLabel.TextScaled = not (l_game_EngineFeature_0 or v139.ServerVersionLabel.TextFits);
        end);
        local v273 = "Client Version: ";
        if v113 then
            if not v114 then
                v273 = "Client Version: ";
            else
                local l_status_5, l_result_5 = pcall(v114.FormatByKey, v114, "InGame.HelpMenu.Label.ClientVersion");
                v273 = if l_status_5 then l_result_5 else "Client Version: ";
            end;
        end;
        local l_l_RunService_0_RobloxVersion_0 = l_RunService_0:GetRobloxVersion();
        local l_status_6, l_result_6 = pcall(function() --[[ Line: 1150 ]]
            -- upvalues: l_RunService_0 (ref)
            return l_RunService_0.ClientGitHash;
        end);
        if l_status_6 then
            l_l_RunService_0_RobloxVersion_0 = string.format("%s (%.6s)", l_l_RunService_0_RobloxVersion_0, l_result_6);
        end;
        v139.ClientVersionLabel = l_Create_0("TextLabel")({
            Name = "ClientVersionLabel", 
            Parent = v139.VersionContainer, 
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            TextColor3 = Color3.new(1, 1, 1), 
            TextSize = v50.textSize(v10 and 28 or v24:IsSmallTouchScreen() and 14 or 20), 
            Text = v273 .. l_l_RunService_0_RobloxVersion_0, 
            Font = v50.font(Enum.Font.SourceSans, "SettingsHub"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 5
        });
        local l_ClientVersionLabel_0 = v139.ClientVersionLabel;
        local v280 = UDim2.new(0.2, -6, 1, 0);
        l_ClientVersionLabel_0.Size = l_game_EngineFeature_0 and UDim2.new(0, l_ClientVersionLabel_0.TextBounds.X + 6, 0, v55) or v280;
        v139.ClientVersionLabel.TextScaled = not (l_game_EngineFeature_0 or v139.ClientVersionLabel.TextFits);
        v139.PlaceVersionLabel = l_Create_0("TextLabel")({
            Name = "PlaceVersionLabel", 
            Parent = v139.VersionContainer, 
            BackgroundTransparency = 1, 
            LayoutOrder = 3, 
            TextColor3 = Color3.new(1, 1, 1), 
            TextSize = v50.textSize(v10 and 28 or v24:IsSmallTouchScreen() and 14 or 20), 
            Text = "Place Version: ...", 
            Font = v50.font(Enum.Font.SourceSans, "SettingsHub"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 5
        });
        l_ClientVersionLabel_0 = function() --[[ Line: 1187 ]] --[[ Name: setPlaceVersionText ]]
            -- upvalues: v113 (ref), v114 (ref), v139 (ref), v60 (ref), l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref), l_game_EngineFeature_0 (copy), v55 (ref)
            local v281 = "Place Version: ";
            if v113 then
                if not v114 then
                    v281 = "Place Version: ";
                else
                    local l_status_7, l_result_7 = pcall(v114.FormatByKey, v114, "InGame.HelpMenu.Label.PlaceVersion");
                    v281 = if l_status_7 then l_result_7 else "Place Version: ";
                end;
            end;
            local l_PlaceVersionLabel_0 = v139.PlaceVersionLabel;
            local l_v281_0 = v281;
            local v286;
            if v60.GetFFlagRemoveAssetVersionEndpoint() then
                v286 = game.PlaceVersion;
            else
                local l_PlaceVersion_1 = game.PlaceVersion;
                do
                    local l_l_PlaceVersion_1_0 = l_PlaceVersion_1;
                    pcall(function() --[[ Line: 355 ]]
                        -- upvalues: l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref), l_l_PlaceVersion_1_0 (ref)
                        local l_l_HttpRbxApiService_0_Async_1 = l_HttpRbxApiService_0:GetAsync(string.format("assets/%d/versions", game.PlaceId));
                        local l_VersionNumber_1 = l_HttpService_0:JSONDecode(l_l_HttpRbxApiService_0_Async_1)[1].VersionNumber;
                        l_l_PlaceVersion_1_0 = string.format("%s (Latest: %d)", l_l_PlaceVersion_1_0, l_VersionNumber_1);
                    end);
                    v286 = l_l_PlaceVersion_1_0;
                end;
            end;
            l_PlaceVersionLabel_0.Text = l_v281_0 .. v286;
            l_PlaceVersionLabel_0 = v139.PlaceVersionLabel;
            local v291 = UDim2.new(0.2, -6, 1, 0);
            l_PlaceVersionLabel_0.Size = l_game_EngineFeature_0 and UDim2.new(0, l_PlaceVersionLabel_0.TextBounds.X + 6, 0, v55) or v291;
            v139.PlaceVersionLabel.TextScaled = not (l_game_EngineFeature_0 or v139.PlaceVersionLabel.TextFits);
        end;
        game:GetPropertyChangedSignal("PlaceVersion"):Connect(l_ClientVersionLabel_0);
        spawn(l_ClientVersionLabel_0);
        if not v26:IsSubjectToChinaPolicies() then
            v139.EnvironmentLabel = l_Create_0("TextLabel")({
                Name = "EnvironmentLabel", 
                Parent = v139.VersionContainer, 
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 1, 
                TextColor3 = Color3.new(1, 1, 1), 
                LayoutOrder = 4, 
                TextSize = v50.textSize(v10 and 28 or v24:IsSmallTouchScreen() and 14 or 20), 
                Text = l_BaseUrl_0, 
                Font = v50.font(Enum.Font.SourceSans, "SettingsHub"), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 5, 
                Visible = v81
            });
            local l_EnvironmentLabel_0 = v139.EnvironmentLabel;
            local v293 = UDim2.new(0.2, -6, 1, 0);
            l_EnvironmentLabel_0.Size = l_game_EngineFeature_0 and UDim2.new(0, l_EnvironmentLabel_0.TextBounds.X + 6, 0, v55) or v293;
            v139.EnvironmentLabel.TextScaled = not (l_game_EngineFeature_0 or v139.EnvironmentLabel.TextFits);
        end;
        if game:GetEngineFeature("GetPlaySessionIdEnabled") then
            local l_game_PlaySessionId_0 = game:GetPlaySessionId();
            if l_game_PlaySessionId_0 ~= "" then
                local v295 = "PlaySessionId: " .. l_game_PlaySessionId_0;
                if v114 then
                    v295 = v114:FormatByKey("InGame.HelpMenu.Label.PlaySessionId", {
                        RBX_STR = l_game_PlaySessionId_0
                    });
                end;
                v139.PlaySessionIdLabel = l_Create_0("TextLabel")({
                    Name = "PlaySessionIdLabel", 
                    Parent = v139.VersionContainer, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 5, 
                    TextColor3 = Color3.new(1, 1, 1), 
                    TextSize = v50.textSize(v10 and 28 or v24:IsSmallTouchScreen() and 14 or 20), 
                    Text = v295, 
                    Font = v50.font(Enum.Font.SourceSans, "SettingsHub"), 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    ZIndex = 5
                });
                local l_PlaySessionIdLabel_0 = v139.PlaySessionIdLabel;
                local v297 = UDim2.new(0.2, -6, 1, 0);
                l_PlaySessionIdLabel_0.Size = l_game_EngineFeature_0 and UDim2.new(0, l_PlaySessionIdLabel_0.TextBounds.X + 6, 0, v55) or v297;
                v139.PlaySessionIdLabel.TextScaled = not v139.PlaySessionIdLabel.TextFits;
            end;
        end;
        local function v311() --[[ Line: 1249 ]] --[[ Name: getOverridesPlayerScripts ]]
            -- upvalues: l_StarterPlayer_0 (ref), v60 (ref), v113 (ref), v114 (ref)
            local v298 = l_StarterPlayer_0:WaitForChild("StarterPlayerScripts", v60.FFlagRemoveLoadingTimeout and 1e999 or nil);
            local l_PlayerScriptsLoader_0 = v298:FindFirstChild("PlayerScriptsLoader");
            local l_PlayerModule_0 = v298:FindFirstChild("PlayerModule");
            if l_PlayerModule_0 and l_PlayerScriptsLoader_0 and not l_PlayerModule_0.Archivable then
                if l_PlayerScriptsLoader_0.Archivable then
                    if v113 then
                        if not v114 then
                            return "Possibly Custom";
                        else
                            local l_status_8, l_result_8 = pcall(v114.FormatByKey, v114, "InGame.CommonUI.Label.PossiblyCustom");
                            if l_status_8 then
                                return l_result_8;
                            else
                                return "Possibly Custom";
                            end;
                        end;
                    else
                        return "Possibly Custom";
                    end;
                elseif v113 then
                    if not v114 then
                        return "Default";
                    else
                        local l_status_9, l_result_9 = pcall(v114.FormatByKey, v114, "InGame.CommonUI.Label.Default");
                        if l_status_9 then
                            return l_result_9;
                        else
                            return "Default";
                        end;
                    end;
                else
                    return "Default";
                end;
            else
                local l_CameraScript_0 = v298:FindFirstChild("CameraScript");
                local l_ControlScript_0 = v298:FindFirstChild("ControlScript");
                if l_CameraScript_0 or l_ControlScript_0 then
                    if v113 then
                        if not v114 then
                            return "Custom Old";
                        else
                            local l_status_10, l_result_10 = pcall(v114.FormatByKey, v114, "InGame.CommonUI.Label.CustomOld");
                            if l_status_10 then
                                return l_result_10;
                            else
                                return "Custom Old";
                            end;
                        end;
                    else
                        return "Custom Old";
                    end;
                elseif v113 then
                    if not v114 then
                        return "Custom";
                    else
                        local l_status_11, l_result_11 = pcall(v114.FormatByKey, v114, "InGame.CommonUI.Label.Custom");
                        if l_status_11 then
                            return l_result_11;
                        else
                            return "Custom";
                        end;
                    end;
                else
                    return "Custom";
                end;
            end;
        end;
        v139.OverridesPlayerScriptsLabel = l_Create_0("TextLabel")({
            Name = "OverridesPlayerScriptsLabel", 
            Parent = v139.VersionContainer, 
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            TextColor3 = Color3.new(1, 1, 1), 
            LayoutOrder = 5, 
            TextSize = v50.textSize(v10 and 28 or v24:IsSmallTouchScreen() and 14 or 20), 
            Text = "PlayerScripts: ", 
            Font = v50.font(Enum.Font.SourceSans, "SettingsHub"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 5, 
            Visible = false
        });
        spawn(function() --[[ Line: 1302 ]]
            -- upvalues: l_RobloxGui_0 (ref), l_Players_0 (ref), v113 (ref), v114 (ref), v311 (copy), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), v60 (ref), v139 (ref), v81 (ref), l_game_EngineFeature_0 (copy), v55 (ref)
            local v312 = require(l_RobloxGui_0.Modules.PlayerPermissionsModule);
            if not l_Players_0.LocalPlayer then
                l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
            end;
            local v313 = "PlayerScripts: ";
            if v113 then
                if not v114 then
                    v313 = "PlayerScripts: ";
                else
                    local l_status_12, l_result_12 = pcall(v114.FormatByKey, v114, "InGame.HelpMenu.Label.PlayerScripts");
                    v313 = if l_status_12 then l_result_12 else "PlayerScripts: ";
                end;
            end;
            local v316 = v311();
            l_RbxAnalyticsService_0:setRBXEventStream(l_Constants_0.AnalyticsTargetName, "player_scripts_status", "player_scripts_status_action", {
                defaultPlayerScripts = v316 == "Default", 
                placeID = tostring(game.PlaceId), 
                rawValue = if v60.GetFFlagNewEventIngestPlayerScriptsDimensions() then v316 else nil, 
                context = v60.GetFFlagNewEventIngestPlayerScriptsDimensions() and "IGMv1" or nil
            });
            v139.OverridesPlayerScriptsLabel.Text = v313 .. v316;
            v139.OverridesPlayerScriptsLabel.Visible = v81 or v312.IsPlayerAdminAsync(l_Players_0.LocalPlayer);
            local l_OverridesPlayerScriptsLabel_0 = v139.OverridesPlayerScriptsLabel;
            local v318 = UDim2.new(0.2, -6, 1, 0);
            l_OverridesPlayerScriptsLabel_0.Size = l_game_EngineFeature_0 and UDim2.new(0, l_OverridesPlayerScriptsLabel_0.TextBounds.X + 6, 0, v55) or v318;
            v139.OverridesPlayerScriptsLabel.TextScaled = not (l_game_EngineFeature_0 or v139.OverridesPlayerScriptsLabel.TextFits);
        end);
        if l_game_EngineFeature_0 then
            local v319 = "Client CoreScript Version: ";
            if v113 then
                if not v114 then
                    v319 = "Client CoreScript Version: ";
                else
                    local l_status_13, l_result_13 = pcall(v114.FormatByKey, v114, "InGame.HelpMenu.Label.ClientCoreScriptVersion");
                    v319 = if l_status_13 then l_result_13 else "Client CoreScript Version: ";
                end;
            end;
            v139.CoreScriptVersionLabel = l_Create_0("TextLabel")({
                Name = "CoreScriptVersionLabel", 
                Parent = v139.VersionContainer, 
                LayoutOrder = 6, 
                BackgroundTransparency = 1, 
                TextColor3 = Color3.new(1, 1, 1), 
                TextSize = v50.textSize(v10 and 28 or v24:IsSmallTouchScreen() and 14 or 20), 
                Text = v319 .. l_RunService_0:GetCoreScriptVersion(), 
                Font = v50.font(Enum.Font.SourceSans, "SettingsHub"), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 5
            });
            local l_CoreScriptVersionLabel_0 = v139.CoreScriptVersionLabel;
            local v323 = UDim2.new(0.2, -6, 1, 0);
            l_CoreScriptVersionLabel_0.Size = l_game_EngineFeature_0 and UDim2.new(0, l_CoreScriptVersionLabel_0.TextBounds.X + 6, 0, v55) or v323;
            l_CoreScriptVersionLabel_0 = v139.VersionContainer;
            local l_l_CoreScriptVersionLabel_0_0 = l_CoreScriptVersionLabel_0 --[[ copy: 12 -> 22 ]];
            v257:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 1349 ]]
                -- upvalues: l_l_CoreScriptVersionLabel_0_0 (copy), v257 (copy), v55 (ref)
                l_l_CoreScriptVersionLabel_0_0.CanvasSize = UDim2.new(0, v257.AbsoluteContentSize.X, 0, v55);
            end);
        end;
        v139.Modal = l_Create_0("TextButton")({
            Name = "Modal", 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, -1), 
            Size = UDim2.new(1, 0, 1, 0), 
            Modal = true, 
            Text = "", 
            Parent = v139.Shield, 
            Selectable = false
        });
        if v50.EnableDarkenBackground then
            if v60.FFlagSettingsHubIndependentBackgroundVisibility then
                v139.DarkenBackground = l_Create_0("ImageButton")({
                    Name = "DarkenBackground", 
                    ZIndex = v139.Shield.ZIndex - 1, 
                    BackgroundTransparency = 1, 
                    BackgroundColor3 = if v60.isInExperienceUIVREnabled then v139.SettingsUIDelegate:getDarkBackgroundTheme().Color else v50.color("DarkenBackground"), 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Parent = v139.ClippingShield, 
                    AutoButtonColor = false, 
                    Visible = false
                });
            else
                v139.DarkenBackground = l_Create_0("Frame")({
                    Name = "DarkenBackground", 
                    ZIndex = v139.Shield.ZIndex - 1, 
                    BackgroundTransparency = 1, 
                    BackgroundColor3 = v50.color("DarkenBackground"), 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Parent = v139.ClippingShield
                });
            end;
        end;
        local v325 = v50.MenuContainerPosition(v139.SettingsUIDelegate);
        v139.MenuContainer = l_Create_0("ImageButton")({
            Name = "MenuContainer", 
            ZIndex = v139.Shield.ZIndex, 
            BackgroundTransparency = v50.transparency("MenuContainer", 1), 
            BackgroundColor3 = v50.color("MenuContainer"), 
            Position = v325.Position, 
            Size = v325.Size, 
            AnchorPoint = v325.AnchorPoint, 
            AutomaticSize = v325.AutomaticSize, 
            Parent = v139.Shield
        });
        if v60.FFlagCreateInExperienceMenuReact then
            v139.ReactPage.Parent = v139.MenuContainer;
        else
            v139.ReactPage = v138(v139.MenuContainer);
        end;
        v139.Page = l_Create_0("Frame")({
            Name = "Page", 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Parent = v139.MenuContainer
        });
        local l_Page_0 = v139.Page;
        v139.MenuContainerPadding = l_Create_0("UIPadding")({
            Parent = l_Page_0
        });
        if not v10 then
            local _ = l_GuiService_0:GetGuiInset().Y;
            v139.MenuContainerPadding.PaddingTop = UDim.new(0, 0);
        end;
        local v328 = v50.HubPadding();
        v139.MenuContainer.AutoButtonColor = false;
        v139.MenuContainerPadding.PaddingLeft = v328.PaddingLeft;
        v139.MenuContainerPadding.PaddingRight = v328.PaddingRight;
        v139.MenuContainerPadding.PaddingBottom = v328.PaddingBottom;
        v139.MenuContainerPadding.PaddingTop = v328.PaddingTop;
        l_Create_0("UICorner")({
            CornerRadius = v50.MenuContainerCornerRadius, 
            Parent = v139.MenuContainer
        });
        if v50.EnableVerticalBottomBar then
            v139.MainColumn = l_Create_0("Frame")({
                Name = "MainColumn", 
                BackgroundTransparency = 1, 
                Position = v325.Position, 
                Size = v325.Size, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Parent = v139.MenuContainer
            });
            l_Page_0 = v139.MainColumn;
            v139.VerticalMenuDivider = l_Create_0("Frame")({
                Name = "VerticalMenuDivider", 
                BackgroundTransparency = v50.transparency("Divider"), 
                BackgroundColor3 = v50.color("Divider"), 
                Size = UDim2.new(0, 1, 1, -100), 
                Visible = true, 
                Parent = v139.MenuContainer
            });
            v139.VerticalMenu = l_Create_0("Frame")({
                Name = "VerticalMenu", 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, v50.VerticalMenuWidth, 0, 100), 
                Visible = false, 
                Parent = v139.MenuContainer
            });
            l_Create_0("UIListLayout")({
                Name = "MenuListLayout", 
                Padding = UDim.new(0, 10), 
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Parent = v139.VerticalMenu
            });
            v139.MenuListLayout = l_Create_0("UIListLayout")({
                Name = "MenuListLayout", 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Parent = v139.MenuContainer
            });
        end;
        v40(function(v329) --[[ Line: 1502 ]]
            -- upvalues: v139 (ref)
            v139.hasMicPermissions = v329.hasMicPermissions;
            v139.isFetchingMicPermissions = false;
        end, nil, true);
        v139.SettingsShowSignal:connect(function(v330) --[[ Line: 1508 ]]
            -- upvalues: l_default_0 (ref), v139 (ref)
            if v330 then
                if l_default_0:IsSeamlessVoice() and not l_default_0.voiceUIVisible then
                    l_default_0.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("shown", l_default_0:GetConnectDisconnectButtonAnalyticsData(true));
                elseif l_default_0:IsSeamlessVoice() and l_default_0.voiceUIVisible then
                    l_default_0.Analytics:reportLeaveVoiceButtonEvent("shown", l_default_0:GetConnectDisconnectButtonAnalyticsData(true));
                end;
                if l_default_0:UserVoiceEnabled() and v139.isFetchingMicPermissions then
                    return;
                elseif not (l_default_0:UserOnlyEligibleForVoice() or l_default_0:UserVoiceEnabled() and not v139.hasMicPermissions) then
                    return;
                end;
            end;
        end);
        v139.MenuListLayout = l_Create_0("UIListLayout")({
            Name = "MenuListLayout", 
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Parent = l_Page_0
        });
        v139.HubBar = l_Create_0("ImageLabel")({
            Name = "HubBar", 
            BackgroundColor3 = v50.color("HubBarContainer"), 
            BackgroundTransparency = v50.transparency("HubBarContainerTransparency"), 
            ZIndex = v139.Shield.ZIndex + 1, 
            BorderSizePixel = 0, 
            AnchorPoint = Vector2.new(0.5, 0), 
            LayoutOrder = 0, 
            Parent = l_Page_0
        });
        l_Create_0("Frame")({
            BackgroundColor3 = v50.color("Divider"), 
            BackgroundTransparency = v50.transparency("Divider"), 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            Parent = v139.HubBar
        });
        v139.HubBarListLayout = l_Create_0("UIListLayout")({
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Parent = v139.HubBar
        });
        if not v60.FFlagAddTraversalBackButton then
            if v60.EngineFeatureTeleportHistoryButtons then
                v139.BackBarRef = v11.createRef();
                v139.FrontBarRef = v11.createRef();
                v139.BackBar = v11.createElement(v35.Provider, {
                    value = l_IXPService_0
                }, {
                    AppStyleProvider = v11.createElement(l_AppStyleProvider_0, {
                        style = {
                            themeName = l_Dark_0
                        }
                    }, {
                        ButtonsFrame = v11.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            LayoutOrder = -1, 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            Size = UDim2.new(1, 0, 0, 0)
                        }, {
                            BackButton = v11.createElement(v32, {
                                BackBarRef = v139.BackBarRef, 
                                HubBar = v139.HubBar, 
                                LayoutOrder = 1
                            }), 
                            FrontButton = v11.createElement(v33, {
                                FrontBarRef = v139.FrontBarRef, 
                                HubBar = v139.HubBar, 
                                LayoutOrder = 2
                            })
                        })
                    })
                });
                v11.mount(v139.BackBar, l_Page_0, "BackBar");
            else
                v139.BackBarRef = v11.createRef();
                v139.BackBar = v11.createElement(v35.Provider, {
                    value = l_IXPService_0
                }, {
                    AppStyleProvider = v11.createElement(l_AppStyleProvider_0, {
                        style = {
                            themeName = l_Dark_0
                        }
                    }, {
                        BackButton = v11.createElement(v32, {
                            BackBarRef = v139.BackBarRef, 
                            HubBar = v139.HubBar
                        })
                    })
                });
                v11.mount(v139.BackBar, l_Page_0, "BackBar");
            end;
        end;
        if v24:IsSmallTouchScreen() then
            v139.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 100, 0, 50);
            v139.HubBar.Position = UDim2.new(0.5, 0, 0, 6);
        elseif v10 then
            v139.HubBar.Size = UDim2.new(0, 1200, 0, 100);
            v139.HubBar.Position = UDim2.new(0.5, 0, 0.1, 0);
        else
            v139.HubBar.Size = UDim2.new(0, 800, 0, 60);
            v139.HubBar.Position = UDim2.new(0.5, 0, 0.1, 0);
        end;
        v139.VoiceRecordingIndicatorFrame = if not v60.FFlagAvatarChatCoreScriptSupport then l_Create_0("Frame")({
            Size = if v60.ChromeEnabled then UDim2.new(1, 0, 0, 100) else UDim2.fromOffset(0, 100), 
            Position = UDim2.new(0, 0, 0, 0), 
            Parent = v139.HubBar, 
            BackgroundTransparency = 1
        }) else nil;
        v139.VoiceRecordingText = l_Create_0("TextLabel")({
            Parent = v139.VoiceRecordingIndicatorFrame, 
            Text = "", 
            Visible = false, 
            Position = UDim2.new(0, 60, 0, 0), 
            TextSize = 12, 
            Font = l_AppFonts_0.default:getMedium(), 
            Size = UDim2.fromScale(1, 1), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextColor3 = Color3.fromRGB(255, 255, 255), 
            BackgroundTransparency = 1
        });
        if v24:IsSmallTouchScreen() then
            v139.VoiceRecordingText.Size = UDim2.fromScale(1, 1);
            v139.VoiceRecordingText.AnchorPoint = Vector2.new(0, 0);
            if v60.ChromeEnabled then
                v139.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right;
                v139.VoiceRecordingText.Position = UDim2.new(0, 0, 0, -60);
            else
                v139.VoiceRecordingText.Position = UDim2.new(0, 60, 0, -60);
            end;
        elseif v10 then
            v139.VoiceRecordingText.AnchorPoint = Vector2.new(0, 1);
            if v60.ChromeEnabled then
                v139.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right;
                v139.VoiceRecordingText.Size = UDim2.new(1, 0, 0, 100);
                v139.VoiceRecordingText.Position = UDim2.new(0, 0, 0.1, 0);
            else
                v139.VoiceRecordingText.Size = UDim2.new(0, 1200, 0, 100);
                v139.VoiceRecordingText.Position = UDim2.new(0.5, 0, 0.1, 0);
            end;
        else
            v139.VoiceRecordingText.AnchorPoint = Vector2.new(0, 1);
            if v60.ChromeEnabled then
                v139.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right;
                v139.VoiceRecordingText.Size = UDim2.new(1, 0, 0, 60);
                v139.VoiceRecordingText.Position = UDim2.new(0, 0, 0.1, 0);
            else
                v139.VoiceRecordingText.Size = UDim2.new(0, 800, 0, 60);
                v139.VoiceRecordingText.Position = UDim2.new(0.5, 0, 0.1, 0);
            end;
        end;
        v139.voiceRecordingIndicatorTextMotor = v13.createSingleMotor(0);
        v139.voiceRecordingIndicatorTextMotor:onStep(function(v331) --[[ Line: 1692 ]]
            -- upvalues: v139 (ref)
            v139.VoiceRecordingText.TextTransparency = v331;
        end);
        spawn(function() --[[ Line: 1696 ]]
            -- upvalues: l_RunService_0 (ref), v139 (ref), v13 (ref), v110 (ref)
            l_RunService_0:BindToRenderStep("VoiceRecordingIndicator", 1, function() --[[ Line: 1697 ]]
                -- upvalues: v139 (ref), v13 (ref), v110 (ref)
                if v139.isMuted ~= nil and v139.lastVoiceRecordingIndicatorTextUpdated ~= nil and tick() - v139.lastVoiceRecordingIndicatorTextUpdated >= 5 and v139.isMuted then
                    v139.voiceRecordingIndicatorTextMotor:setGoal(v13.spring(1, v110));
                    v139.voiceRecordingIndicatorTextMotor:start();
                end;
            end);
        end);
        v139.PageViewClipper = l_Create_0("Frame")({
            Name = "PageViewClipper", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(v139.HubBar.Size.X.Scale, v139.HubBar.Size.X.Offset, 1, -v139.HubBar.Size.Y.Offset - v139.HubBar.Position.Y.Offset - v255), 
            Position = UDim2.new(v139.HubBar.Position.X.Scale, v139.HubBar.Position.X.Offset, v139.HubBar.Position.Y.Scale, v139.HubBar.Position.Y.Offset + v139.HubBar.Size.Y.Offset + 1), 
            AnchorPoint = Vector2.new(0.5, 0), 
            ClipsDescendants = true, 
            LayoutOrder = 1, 
            Parent = l_Page_0; 
            l_Create_0("ImageButton")({
                Name = "InputCapture", 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                Image = ""
            })
        });
        if v60.FFlagEnableConsoleExpControls and v60.ChromeEnabled then
            v139.PageViewPadding = l_Create_0("UIPadding")({
                Parent = v139.PageViewClipper
            });
            local v332 = require(l_RobloxGui_0.Modules.Chrome.Service);
            local l_v332_0 = v332 --[[ copy: 14 -> 21 ]];
            v332:onShortcutBarChanged():connect(function() --[[ Line: 1738 ]]
                -- upvalues: v24 (ref), l_v332_0 (copy), v139 (ref), v50 (ref)
                if v24:IsSmallTouchScreen() and l_v332_0:getCurrentShortcutBar():get() ~= nil then
                    v139.PageViewPadding.PaddingBottom = UDim.new(0, v50.ExtraPageBottomPaddingMobile);
                    return;
                else
                    v139.PageViewPadding.PaddingBottom = UDim.new(0, 0);
                    return;
                end;
            end);
        end;
        v139.PageView = l_Create_0("ScrollingFrame")({
            Name = "PageView", 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 2), 
            Size = UDim2.new(1, 0, 1, -20), 
            CanvasSize = UDim2.new(1, 0, 1, 0), 
            ZIndex = v139.Shield.ZIndex, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Selectable = false, 
            ScrollBarThickness = v50.DefaultScrollBarThickness, 
            Parent = v139.PageViewClipper
        });
        v139.PageView.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar;
        v139.lastPageViewCanvasPosition = v139.PageView.CanvasPosition;
        v139.handelPageViewScroll = function() --[[ Line: 1765 ]]
            -- upvalues: v139 (ref)
            local v334 = math.clamp(v139.lastPageViewCanvasPosition.Y, 0, v139.PageView.MaxCanvasPosition.Y);
            local v335 = math.clamp(v139.PageView.CanvasPosition.Y, 0, v139.PageView.MaxCanvasPosition.Y);
            local v336 = v334 - v335;
            if math.abs(v336) > 5 then
                if v336 < 0 then
                    v139:animateOutBottomBar();
                else
                    v139:animateInBottomBar();
                end;
                v139.lastPageViewCanvasPosition = Vector2.new(v139.PageView.CanvasPosition.x, v335);
            end;
        end;
        v139.pageViewScrollChangeCon = nil;
        if v50.UseStickyBar() then
            v139.PageView.AutomaticCanvasSize = Enum.AutomaticSize.Y;
            if v24:IsPortrait() == false then
                v139.defaultPageViewClipperSize = nil;
                v139.showStickyBottomBar = true;
                v139.pageViewScrollChangeCon = v139.PageView:GetPropertyChangedSignal("CanvasPosition"):connect(v139.handelPageViewScroll);
            end;
        end;
        v139.PageViewInnerFrame = l_Create_0("Frame")({
            Name = "PageViewInnerFrame", 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            ZIndex = v139.Shield.ZIndex, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Selectable = false, 
            Parent = v139.PageView, 
            LayoutOrder = 1
        });
        l_Create_0("UIPadding")({
            PaddingTop = UDim.new(0, 5), 
            Parent = v139.PageViewInnerFrame
        });
        v139.InnerCanvasGroupShow = l_Create_0("CanvasGroup")({
            Name = "InnerCanvasGroupShow", 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            GroupTransparency = 0, 
            Visible = false, 
            Parent = v139.PageViewInnerFrame
        });
        v139.InnerCanvasGroupHide = l_Create_0("CanvasGroup")({
            Name = "InnerCanvasGroupHide", 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            GroupTransparency = 0, 
            Visible = false, 
            Parent = v139.PageViewInnerFrame
        });
        if v50.UseStickyBar() then
            v139.PageView.AutomaticCanvasSize = Enum.AutomaticSize.Y;
            l_Create_0("UIListLayout")({
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Parent = v139.PageView
            });
            v139.PageViewInnerFrame.AutomaticSize = Enum.AutomaticSize.Y;
            v139.PageViewInnerFrame.ClipsDescendants = false;
        end;
        if l_UserInputService_0.MouseEnabled then
            v139.PageViewClipper.Size = UDim2.new(v139.HubBar.Size.X.Scale, v139.HubBar.Size.X.Offset, 0.5, -(v139.HubBar.Position.Y.Offset - v139.HubBar.Size.Y.Offset));
        end;
        v139.BottomButtonFrame = l_Create_0("Frame")({
            Name = "BottomButtonFrame", 
            Size = v139.HubBar.Size, 
            Position = UDim2.new(0.5, -v139.HubBar.Size.X.Offset / 2, 1 - v139.HubBar.Position.Y.Scale - v139.HubBar.Size.Y.Scale, -v139.HubBar.Position.Y.Offset - v139.HubBar.Size.Y.Offset), 
            ZIndex = v139.Shield.ZIndex + 1, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Parent = l_Page_0, 
            Selectable = not v60.FFlagIEMFocusNavToButtons and nil, 
            SelectionGroup = v60.FFlagIEMFocusNavToButtons and true or nil, 
            SelectionBehaviorLeft = if v60.FFlagIEMFocusNavToButtons then Enum.SelectionBehavior.Stop else nil, 
            SelectionBehaviorRight = if v60.FFlagIEMFocusNavToButtons then Enum.SelectionBehavior.Stop else nil, 
            SelectionBehaviorDown = if v60.FFlagIEMFocusNavToButtons then Enum.SelectionBehavior.Stop else nil
        });
        if v60.FFlagTraversalPerfFixes then
            v139.BottomButtonFrame:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 1866 ]]
                -- upvalues: v139 (ref)
                v139.setShowBottomBarSignal(v139.BottomButtonFrame.Visible);
            end);
        end;
        local function v338(v337) --[[ Line: 1871 ]]
            -- upvalues: v60 (ref), v237 (ref), v139 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), l_GuiService_0 (ref)
            if v60.FFlagAddUILessMode then
                v237(false, nil, nil, nil, v337);
            else
                v237(false);
            end;
            if v60.FFlagAddUILessMode and v60.FIntAddUILessModeVariant ~= 0 and v139.uiLessStore.getUILessModeEnabled(false) then
                v139.uiLessStore.setUIVisible(false);
            end;
            l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsResumeGameName, l_Constants_0.AnalyticsMenuActionName, {
                source = v337, 
                playsessionid = v139.playSessionId, 
                universeid = tostring(game.GameId)
            });
            if v60.FFlagIEMResumeButtonPressBugfix then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
        end;
        if not v60.FFlagMenuButtonsMountWithIEM and v60.FFlagRelocateMobileMenuButtons and (v60.FIntRelocateMobileMenuButtonsVariant == 1 or v60.FIntRelocateMobileMenuButtonsVariant == 3 or v60.FIntRelocateMobileMenuButtonsVariant == 2 and not v24:IsSmallTouchScreen()) then
            v253();
        end;
        if not v60.FFlagRelocateMobileMenuButtons or v60.FIntRelocateMobileMenuButtonsVariant == 0 or v60.FIntRelocateMobileMenuButtonsVariant == 2 and v24:IsSmallTouchScreen() then
            v139.BottomButtonFrame.Size = UDim2.new(1, 0, 0, 80);
        end;
        v139.MenuListLayout = l_Create_0("UIListLayout")({
            Padding = UDim.new(0, 12), 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Parent = v139.BottomButtonFrame
        });
        if v60.FFlagEnableSystemScrimInSettingsHub then
            local v339 = require(l_CorePackages_0.Workspace.Packages.SystemScrim).SystemScrimSignalStore(false);
            v339.backgroundScrimActivated.Event:Connect(function() --[[ Line: 1920 ]]
                -- upvalues: v60 (ref), v139 (ref), l_Constants_0 (ref), v338 (copy)
                if v60.FFlagRelocateMobileMenuButtons and v60.FIntRelocateMobileMenuButtonsVariant ~= 0 then
                    v139:GetExperienceControlStore().onResume(l_Constants_0.AnalyticsResumeShieldSource);
                    return;
                else
                    v338(l_Constants_0.AnalyticsResumeShieldSource);
                    return;
                end;
            end);
            local l_v339_0 = v339 --[[ copy: 15 -> 20 ]];
            v139.Shield:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 1928 ]]
                -- upvalues: l_v339_0 (copy), v139 (ref)
                l_v339_0.setTransparency(1);
                l_v339_0.setAutoDismiss(true);
                l_v339_0.setVisibility(v139.Shield.Visible);
            end);
        end;
        v139.Shield.Activated:Connect(function() --[[ Line: 1935 ]]
            -- upvalues: v60 (ref), v139 (ref), l_Constants_0 (ref), v338 (copy)
            if v60.FFlagRelocateMobileMenuButtons and v60.FIntRelocateMobileMenuButtonsVariant ~= 0 then
                v139:GetExperienceControlStore().onResume(l_Constants_0.AnalyticsResumeShieldSource);
                return;
            else
                v338(l_Constants_0.AnalyticsResumeShieldSource);
                return;
            end;
        end);
        if v60.FFlagSettingsHubIndependentBackgroundVisibility then
            v139.DarkenBackground.Activated:Connect(function() --[[ Line: 1945 ]]
                -- upvalues: v60 (ref), v139 (ref), l_Constants_0 (ref), v338 (copy), l_InExperienceAppChatModal_0 (ref)
                if v60.FFlagRelocateMobileMenuButtons and v60.FIntRelocateMobileMenuButtonsVariant ~= 0 then
                    v139:GetExperienceControlStore().onResume(l_Constants_0.AnalyticsResumeShieldSource);
                else
                    v338(l_Constants_0.AnalyticsResumeShieldSource);
                end;
                l_InExperienceAppChatModal_0.default:setVisible(false);
            end);
        end;
        if not v60.FFlagRelocateMobileMenuButtons or v60.FIntRelocateMobileMenuButtonsVariant == 0 then
            local function v341() --[[ Line: 1956 ]]
                -- upvalues: v60 (ref), v139 (ref), v167 (ref), v104 (ref)
                if v60.FFlagPreventHiddenSwitchPage and v139:GetVisibility() == false then
                    return;
                else
                    v139:AddToMenuStack(v139.Pages.CurrentPage);
                    v139.HubBar.Visible = false;
                    v167();
                    if v60.GetFFlagEnableLeaveGameUpsellEntrypoint() and v139.leaveGameUpsellProp ~= v104.PHONE_UPSELL_VALUE_PROP.None then
                        v139:SwitchToPage(v139.LeaveGameUpsellPage, nil, 1, true);
                        return;
                    else
                        v139:SwitchToPage(v139.LeaveGamePage, nil, 1, true);
                        return;
                    end;
                end;
            end;
            if l_InExperienceCapabilities_0.canNavigateHome then
                v202("LeaveGame", "Leave", v205, "rbxasset://textures/ui/Settings/Help/LeaveIcon.png", UDim2.new(0.5, v10 and -160 or -130, 0.5, -25), v341, {
                    Enum.KeyCode.L, 
                    if v60.FFlagEnableConsoleExpControls and v60.ChromeEnabled then nil else Enum.KeyCode.ButtonX
                }, v341);
            end;
            local function v342() --[[ Line: 1980 ]]
                -- upvalues: v225 (ref), v139 (ref), v167 (ref)
                if v225 then
                    v139:AddToMenuStack(v139.Pages.CurrentPage);
                    v139.HubBar.Visible = false;
                    v167();
                    v139:SwitchToPage(v139.ResetCharacterPage, nil, 1, true);
                end;
            end;
            local v343 = v174:Format(l_Constants_0.RespawnLocalizedKey);
            v202("ResetCharacter", v343, v206, "rbxasset://textures/ui/Settings/Help/ResetIcon.png", UDim2.new(0.5, v10 and -550 or -400, 0.5, -25), v342, {
                Enum.KeyCode.R, 
                if v60.FFlagEnableConsoleExpControls and v60.ChromeEnabled then nil else Enum.KeyCode.ButtonY
            }, v342);
            local function v344() --[[ Line: 1996 ]]
                -- upvalues: v338 (copy), l_Constants_0 (ref)
                v338(l_Constants_0.AnalyticsResumeButtonSource);
            end;
            local function v345() --[[ Line: 1999 ]]
                -- upvalues: v338 (copy), l_Constants_0 (ref)
                v338(l_Constants_0.AnalyticsResumeGamepadSource);
            end;
            v202("Resume", "Resume", if v60.FFlagEnableConsoleExpControls then l_l_UserInputService_0_ImageForKeyCode_0 else v204, "rbxasset://textures/ui/Settings/Help/EscapeIcon.png", UDim2.new(0.5, v10 and 200 or 140, 0.5, -25), v344, if v60.FFlagEnableConsoleExpControls and v60.ChromeEnabled then {} else {
                Enum.KeyCode.ButtonB, 
                Enum.KeyCode.ButtonStart
            }, v345);
        end;
        if v60.FFlagAddSwitchTabHintsToIEM then
            local function v348(v346) --[[ Line: 2009 ]] --[[ Name: MountSwitchTabHint ]]
                -- upvalues: l_Create_0 (ref), v15 (ref), v14 (ref), l_FoundationProvider_0 (ref), v16 (ref), v23 (ref), l_SwitchTabHint_0 (ref)
                local v347 = l_Create_0("Frame")({
                    Name = "SwitchTabHintContainer", 
                    Size = UDim2.fromScale(0, 1), 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    LayoutOrder = v346.layoutOrder, 
                    Parent = v346.parent
                });
                v15.createRoot(v347):render(v14.createElement(v14.Fragment, nil, v14.createElement("UIListLayout", {
                    Name = "SwitchTabHintCenterAlign", 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), v14.createElement(l_FoundationProvider_0, {
                    theme = v16.Enums.Theme.Dark, 
                    device = v23.getDeviceType()
                }, {
                    ["SwitchTabHint" .. v346.keycode.Name] = v14.createElement(l_SwitchTabHint_0, {
                        keycode = v346.keycode
                    })
                })));
            end;
            v139.TabHeaderContainer = l_Create_0("Frame")({
                Name = "TabHeaderContainer", 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                Parent = v139.HubBar
            });
            v139.TabHeaderContainerListLayout = l_Create_0("UIListLayout")({
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalFlex = Enum.UIFlexAlignment.Fill, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Parent = v139.TabHeaderContainer
            });
            v348({
                keycode = Enum.KeyCode.ButtonL1, 
                parent = v139.TabHeaderContainer, 
                layoutOrder = -999
            });
            v348({
                keycode = Enum.KeyCode.ButtonR1, 
                parent = v139.TabHeaderContainer, 
                layoutOrder = 999
            });
        end;
        v139.HubBarContainer = l_Create_0("ImageLabel")({
            Name = "HubBarContainer", 
            ZIndex = v139.Shield.ZIndex + 2, 
            BorderSizePixel = 0, 
            BackgroundColor3 = v50.color("HubBarContainer"), 
            BackgroundTransparency = v50.transparency("HubBarContainerTransparency"), 
            Size = if v50.ShowHomeButton then UDim2.new(1, -70, 1, 0) else UDim2.new(1, 0, 1, 0), 
            Position = if v50.ShowHomeButton then UDim2.new(0, 70, 0, 0) else UDim2.new(0, 0, 0, 0), 
            Parent = if v60.FFlagAddSwitchTabHintsToIEM then v139.TabHeaderContainer else v139.HubBar
        });
        v139.HubBar.ImageTransparency = 1;
        v139.HubBarListLayout.Parent = v139.HubBarContainer;
        if v50.ShowHomeButton then
            v139.HubBarHomeButton = l_Create_0("ImageButton")({
                Name = "HubBarHomeButton", 
                ZIndex = v139.Shield.ZIndex + 2, 
                BorderSizePixel = 0, 
                AutoButtonColor = false, 
                BackgroundColor3 = v50.color("HubBarHomeButton"), 
                BackgroundTransparency = v50.transparency("HubBarHomeButtonTransparency"), 
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                Parent = v139.HubBar
            });
            l_Create_0("UICorner")({
                CornerRadius = v50.DefaultCornerRadius, 
                Parent = v139.HubBarHomeButton
            });
            v139.HubBarHomeButtonAspectRatio = l_Create_0("UIAspectRatioConstraint")({
                AspectRatio = 1, 
                DominantAxis = Enum.DominantAxis.Height, 
                Parent = v139.HubBarHomeButton
            });
            v139.HubBarHomeButtonIcon = l_Create_0("ImageLabel")({
                Name = "HubBarHomeButtonIcon", 
                ZIndex = v139.Shield.ZIndex + 3, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/Settings/MenuBarIcons/HomeTab.png", 
                Size = UDim2.new(0.7, 0, 0.7, 0), 
                Position = UDim2.new(0.16, 0, 0.18, 0), 
                Parent = v139.HubBarHomeButton
            });
            v139.HubBarHomeButton:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 2119 ]]
                -- upvalues: v139 (ref)
                local v349 = v139.HubBarHomeButton.AbsoluteSize.X + 10;
                v139.HubBarContainer.Size = UDim2.new(1, -v349, 1, 0);
                v139.HubBarContainer.Position = UDim2.new(0, v349, 0, 0);
            end);
            v139.HubBarHomeButton.MouseEnter:Connect(function() --[[ Line: 2124 ]]
                -- upvalues: v139 (ref), v50 (ref)
                v139.HubBarHomeButton.BackgroundColor3 = v50.color("HubBarHomeButtonHover");
                v139.HubBarHomeButton.BackgroundTransparency = v50.transparency("HubBarHomeButtonTransparencyHover");
            end);
            v139.HubBarHomeButton.MouseLeave:Connect(function() --[[ Line: 2128 ]]
                -- upvalues: v139 (ref), v50 (ref)
                v139.HubBarHomeButton.BackgroundColor3 = v50.color("HubBarHomeButton");
                v139.HubBarHomeButton.BackgroundTransparency = v50.transparency("HubBarHomeButtonTransparency");
            end);
            local function v350() --[[ Line: 2133 ]]
                -- upvalues: v139 (ref), v167 (ref)
                v139:AddToMenuStack(v139.Pages.CurrentPage);
                v139.HubBar.Visible = false;
                v167();
                v139:SwitchToPage(v139.LeaveGameToHomePage, nil, 1, true);
            end;
            v139.HubBarHomeButton.Activated:Connect(v350);
        end;
        if l_isSubjectToDesktopPolicies_0() then
            v139.FullScreenTitleBar = v87.mount({}, v139.Shield, "FullScreenTitleBar");
        end;
        local function v351() --[[ Line: 2148 ]] --[[ Name: cameraViewportChanged ]]
            -- upvalues: v50 (ref), v24 (ref)
            v50.viewportResized();
            v24:FireOnResized();
        end;
        local v352 = nil;
        local function v354(v353) --[[ Line: 2154 ]] --[[ Name: onWorkspaceChanged ]]
            -- upvalues: v50 (ref), v24 (ref), v352 (ref), v351 (copy)
            if v353 == "CurrentCamera" then
                v50.viewportResized();
                v24:FireOnResized();
                if v352 then
                    v352:disconnect();
                end;
                v352 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(v351);
            end;
        end;
        v50.viewportResized();
        v24:FireOnResized();
        if v352 then
            v352:disconnect();
        end;
        v352 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(v351);
        workspace.Changed:Connect(v354);
    end;
    local function v362() --[[ Line: 2166 ]] --[[ Name: resizeBottomBarButtons ]]
        -- upvalues: v139 (copy), v60 (ref)
        local l_X_0 = v139.BottomButtonFrame.AbsoluteSize.X;
        local v357 = #v139.BottomBarButtons;
        if v357 == 4 then
            l_X_0 = l_X_0 - 48 - 12;
            v357 = v357 - 1;
        end;
        local v358 = (l_X_0 - (v357 - 1) * 12 - 12) / v357;
        if v60.isInExperienceUIVREnabled then
            v358 = v139.SettingsUIDelegate:getBottomButtonSize(v358);
        end;
        for v359 = 1, #v139.BottomBarButtons do
            local v360 = v139.BottomBarButtons[v359];
            local v361 = v360[1];
            if v361 ~= "MuteButtonButton" then
                v139[v361].Size = UDim2.fromOffset(v358, v139[v360[1]].Size.Y.Offset);
            end;
        end;
    end;
    local function v382() --[[ Line: 2189 ]] --[[ Name: onScreenSizeChanged ]]
        -- upvalues: v139 (copy), v60 (ref), v24 (ref), v50 (ref), v253 (copy), v254 (copy), l_RobloxGui_0 (ref), v10 (ref), l_VRService_0 (ref), l_RunService_0 (ref), v156 (copy), v161 (copy), v153 (copy), v167 (copy), v362 (copy)
        local function _() --[[ Line: 2190 ]] --[[ Name: getBackBarVisible ]]
            -- upvalues: v139 (ref)
            if not v139.BackBarRef:getValue() then
                return false;
            else
                return v139.BackBarRef:getValue().Visible;
            end;
        end;
        local function _() --[[ Line: 2197 ]] --[[ Name: getFrontBarVisible ]]
            -- upvalues: v139 (ref)
            if not v139.FrontBarRef:getValue() then
                return false;
            else
                return v139.FrontBarRef:getValue().Visible;
            end;
        end;
        if v60.FFlagRelocateMobileMenuButtons and v60.FIntRelocateMobileMenuButtonsVariant == 2 and v139.Visible then
            if not v24:IsPortrait() and not v24:IsSmallTouchScreen() or v50.AlwaysShowBottomBar() then
                if not v139.BottomButtonFrameRoot then
                    v253();
                end;
                if v139.PlayersPage then
                    v139.PlayersPage:UnmountMenuButtonsContainer();
                end;
            else
                if v139.BottomButtonFrameRoot then
                    v254();
                end;
                if v139.PlayersPage then
                    v139.PlayersPage:CreateMenuButtonsContainer();
                end;
            end;
        end;
        local v365 = v50.MenuContainerPosition(v139.SettingsUIDelegate);
        local v366 = 600;
        local v367 = nil;
        v367 = if v60.isInExperienceUIVREnabled then v139.SettingsUIDelegate:getFullScreenSize() else l_RobloxGui_0.AbsoluteSize.y;
        local v368 = 0.050000000000000044 * v367;
        local v369 = v24:IsPortrait();
        if v10 then
            v366 = 800;
            v368 = 0.07 * v367;
        elseif v24:IsSmallTouchScreen() then
            v368 = math.min(10, 0.010000000000000009 * v367);
        elseif v60.isInExperienceUIVREnabled and l_VRService_0.VREnabled then
            v368 = 0;
        end;
        if v60.FFlagAddNextUpContainer and v139.Pages.CurrentPage and v139.Pages.CurrentPage.DisableTopPadding and v139.Pages.CurrentPage.MaintainVerticalSize then
            v366 = v366 + v139.HubBar.AbsoluteSize.Y;
        end;
        v139.MenuContainer.Size = v365.Size;
        v139.MenuContainer.Position = v365.Position;
        v139.MenuContainer.AnchorPoint = v365.AnchorPoint;
        local l_Offset_0 = v139.HubBar.Size.Y.Offset;
        local v371 = v368 * 2 + l_Offset_0 * 2;
        local v372 = 0;
        if not v60.FFlagAddTraversalBackButton then
            if not not v139.BackBarRef:getValue() and v139.BackBarRef:getValue().Visible and v139.BackBarRef:getValue() then
                v372 = v139.BackBarRef:getValue().Size.Y.Offset;
            end;
            if v60.EngineFeatureTeleportHistoryButtons and not not v139.FrontBarRef:getValue() and v139.FrontBarRef:getValue().Visible and v139.FrontBarRef:getValue() then
                v372 = v372 + v139.FrontBarRef:getValue().Size.Y.Offset;
            end;
        end;
        if v50.EnableVerticalBottomBar then
            v139.VerticalMenu.Visible = false;
            v139.VerticalMenuDivider.Visible = false;
            for v373 = 1, #v139.BottomBarButtonsComponents do
                v139.BottomBarButtonsComponents[v373].Parent = v139.BottomButtonFrame;
            end;
        end;
        if v369 then
            v139.HubBar.Position = UDim2.new(0.5, 0, 0, 10);
            v139.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 40, 0, 54);
        elseif v10 then
            v139.HubBar.Size = UDim2.new(0, 1200, 0, 100);
        elseif v24:IsSmallTouchScreen() then
            if v50.EnableVerticalBottomBar then
                v139.VerticalMenu.Visible = true;
                v139.VerticalMenuDivider.Visible = true;
                for v374 = 1, #v139.BottomBarButtonsComponents do
                    v139.BottomBarButtonsComponents[v374].Parent = v139.VerticalMenu;
                end;
                v139.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 60 - v50.VerticalMenuWidth, 0, 52);
            else
                v139.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 60, 0, 52);
            end;
        elseif v60.isInExperienceUIVREnabled then
            v139.HubBar.Size = UDim2.new(0, v139.SettingsUIDelegate:getHubBarSize(), 0, 60);
        else
            v139.HubBar.Size = UDim2.new(0, 800, 0, 60);
        end;
        l_Offset_0 = if not v50.AlwaysShowBottomBar() then v139.HubBar.Size.Y.Offset else v139.HubBar.Size.Y.Offset + v139.BottomButtonFrame.Size.Y.Offset;
        v371 = v368 * 2 + ((not v60.FFlagFixDisableTopPaddingError or v139.Pages.CurrentPage ~= nil) and v139.Pages.CurrentPage.DisableTopPadding and 0 or l_Offset_0);
        if not v60.FFlagAddTraversalBackButton then
            v372 = if not not v139.BackBarRef:getValue() and v139.BackBarRef:getValue().Visible and v139.BackBarRef:getValue() then v139.BackBarRef:getValue().Size.Y.Offset else 0;
            if v60.EngineFeatureTeleportHistoryButtons and not not v139.FrontBarRef:getValue() and v139.FrontBarRef:getValue().Visible and v139.FrontBarRef:getValue() then
                v372 = v372 + v139.FrontBarRef:getValue().Size.Y.Offset;
            end;
        end;
        if not v60.FFlagAddNextUpContainer then
            l_RunService_0.Heartbeat:wait();
        end;
        if v156() then
            v161();
            if v60.FFlagIEMFocusNavToButtons then
                v153(v139.Pages.CurrentPage);
            end;
        else
            v167();
        end;
        if v60.isInExperienceUIVREnabled then
            v371 = v371 + v139.SettingsUIDelegate:getMenuContainerExtraSpace();
        end;
        local v375 = v367 - v371 - v372;
        if v60.FFlagRelocateMobileMenuButtons and (v60.FIntRelocateMobileMenuButtonsVariant == 1 or v60.FIntRelocateMobileMenuButtonsVariant == 3) and v24:IsSmallTouchScreen() then
            v375 = v375 - v50.ExtraHubBottomPaddingMobile;
        end;
        local v376 = nil;
        if not v369 then
            if v366 < v375 then
                v376 = v366;
                v139.HubBar.Position = UDim2.new(v139.HubBar.Position.X.Scale, v139.HubBar.Position.X.Offset, 0.5, -v366 / 2 - v139.HubBar.Size.Y.Offset);
                if v139.BottomButtonFrame then
                    v139.BottomButtonFrame.Position = UDim2.new(v139.BottomButtonFrame.Position.X.Scale, v139.BottomButtonFrame.Position.X.Offset, 0.5, v366 / 2);
                end;
            elseif v375 < 150 then
                v376 = 150;
                v139.HubBar.Position = UDim2.new(v139.HubBar.Position.X.Scale, v139.HubBar.Position.X.Offset, 0.5, -75 - v139.HubBar.Size.Y.Offset);
                if v139.BottomButtonFrame then
                    v139.BottomButtonFrame.Position = UDim2.new(v139.BottomButtonFrame.Position.X.Scale, v139.BottomButtonFrame.Position.X.Offset, 0.5, 75);
                end;
            else
                v376 = v375;
                v139.HubBar.Position = UDim2.new(v139.HubBar.Position.X.Scale, v139.HubBar.Position.X.Offset, 0, v368);
                if v139.BottomButtonFrame then
                    v139.BottomButtonFrame.Position = UDim2.new(v139.BottomButtonFrame.Position.X.Scale, v139.BottomButtonFrame.Position.X.Offset, 1, -(v368 + l_Offset_0));
                end;
            end;
        else
            v376 = v375;
        end;
        local v377 = nil;
        v377 = if not v10 then if v24:IsSmallTouchScreen() then if v60.FFlagRelocateMobileMenuButtons and (not (v60.FIntRelocateMobileMenuButtonsVariant ~= 1) or v60.FIntRelocateMobileMenuButtonsVariant == 3) then UDim2.new(0, v139.HubBar.AbsoluteSize.X, 0, v376 + 0 + 0 - v139.BottomButtonFrame.Size.Y.Offset) else UDim2.new(0, v139.HubBar.AbsoluteSize.X, 0, v376 + 0 + 0) else UDim2.new(0, v139.HubBar.AbsoluteSize.X, 0, v376) else UDim2.new(0, v139.HubBar.AbsoluteSize.X, 0, v376);
        if v60.FFlagRelocateMobileMenuButtons and v60.FIntRelocateMobileMenuButtonsVariant ~= 0 and v139.BottomButtonFrame then
            v139.BottomButtonFrame.Size = UDim2.new(0, v139.HubBar.Size.X.Offset, 0, v139.HubBar.Size.Y.Offset);
        end;
        if v60.FFlagAddNextUpContainer and v139.Pages.CurrentPage and v139.Pages.CurrentPage.ShrinkwrapPageViewClipper and not v24:IsSmallTouchScreen() then
            local l_Size_0 = v139.Pages.CurrentPage:GetSize();
            v377 = UDim2.new(v377.X.Scale, v377.X.Offset, v377.Y.Scale, (math.min(l_Size_0.Y - v139.PageView.Size.Y.Offset, v376)));
        end;
        local v379 = v50.HubPadding();
        local v380 = v379.PaddingLeft.Offset + v379.PaddingRight.Offset;
        local v381 = v379.PaddingTop.Offset + v379.PaddingBottom.Offset;
        v139.ReactPage.Size = UDim2.new(0, v139.HubBar.AbsoluteSize.X + v380, 0, v376 + l_Offset_0 + v381);
        v139.PageViewClipper.Size = v377;
        v139.defaultPageViewClipperSize = v377;
        if not v369 then
            v139.PageViewClipper.Position = UDim2.new(v139.PageViewClipper.Position.X.Scale, v139.PageViewClipper.Position.X.Offset, 0.5, -v376 / 2);
        else
            v139.PageViewClipper.Position = UDim2.new(0.5, 0, 0, v139.HubBar.Position.Y.Offset + v139.HubBar.AbsoluteSize.Y);
        end;
        if v139.VerticalMenu then
            v139.VerticalMenuDivider.Size = UDim2.new(0, 1, 0, v376 + v139.HubBar.Size.Y.Offset);
            v139.VerticalMenu.Size = UDim2.new(0, v50.VerticalMenuWidth, 0, v376 + v139.HubBar.Size.Y.Offset);
        end;
        if v50.UseStickyBar() then
            v139.resetPageViewClipperSize = true;
            v139.showStickyBottomBar = true;
            if v139.pageViewScrollChangeCon then
                v139.pageViewScrollChangeCon:disconnect();
                v139.pageViewScrollChangeCon = nil;
            end;
            if not v369 then
                v139.pageViewScrollChangeCon = v139.PageView:GetPropertyChangedSignal("CanvasPosition"):connect(v139.handelPageViewScroll);
            end;
            v362();
        end;
    end;
    local function _() --[[ Line: 2499 ]] --[[ Name: onPreferredTransparencyChanged ]]
        -- upvalues: v139 (copy), v50 (ref), l_GuiService_0 (ref)
        v139.MenuContainer.BackgroundTransparency = v50.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency;
    end;
    local function v387(v384, v385, _) --[[ Line: 2503 ]] --[[ Name: toggleQuickProfilerFromHotkey ]]
        -- upvalues: l_UserInputService_0 (ref), l_GameSettings_0 (ref)
        if not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) and not l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightControl) then
            return;
        else
            if v384 == "Show Quick Profiler" and v385 and v385 == Enum.UserInputState.Begin then
                l_GameSettings_0.PerformanceStatsVisible = not l_GameSettings_0.PerformanceStatsVisible;
            end;
            return;
        end;
    end;
    local function v391(v388, v389, _) --[[ Line: 2519 ]] --[[ Name: toggleDevConsole ]]
        -- upvalues: v82 (ref)
        if v388 == "Open Dev Console" and v389 and v389 == Enum.UserInputState.Begin then
            v82:ToggleVisibility();
        end;
    end;
    local l_v10_0 = v10;
    local v393 = {
        [Enum.UserInputType.Gamepad1] = true, 
        [Enum.UserInputType.Gamepad2] = true, 
        [Enum.UserInputType.Gamepad3] = true, 
        [Enum.UserInputType.Gamepad4] = true, 
        [Enum.KeyCode.Left] = true, 
        [Enum.KeyCode.Right] = true, 
        [Enum.KeyCode.Up] = true, 
        [Enum.KeyCode.Down] = true, 
        [Enum.KeyCode.Tab] = true, 
        [Enum.UserInputType.Touch] = false, 
        [Enum.UserInputType.MouseButton1] = false, 
        [Enum.UserInputType.MouseButton2] = false
    };
    l_UserInputService_0.InputBegan:connect(function(v394) --[[ Line: 2545 ]]
        -- upvalues: v393 (copy), l_v10_0 (ref)
        if v394.UserInputType and v393[v394.UserInputType] ~= nil then
            l_v10_0 = v393[v394.UserInputType];
            return;
        else
            if v394.KeyCode and v393[v394.KeyCode] then
                l_v10_0 = v393[v394.KeyCode];
            end;
            return;
        end;
    end);
    l_UserInputService_0.InputChanged:connect(function(v395) --[[ Line: 2552 ]]
        -- upvalues: l_v10_0 (ref)
        if v395.KeyCode == Enum.KeyCode.Thumbstick1 or v395.KeyCode == Enum.KeyCode.Thumbstick2 then
            if v395.Position.magnitude >= 0.25 then
                l_v10_0 = true;
                return;
            end;
        elseif v395.UserInputType == Enum.UserInputType.Touch or v395.UserInputType == Enum.UserInputType.MouseMovement then
            l_v10_0 = false;
        end;
    end);
    local v396 = nil;
    local function v404(v397, v398) --[[ Line: 2564 ]]
        -- upvalues: v60 (ref), v139 (copy), v396 (ref)
        if v60.FFlagInExperienceReportClosingBugfix and not v139.HubBar.Visible then
            return;
        else
            local v399 = v396(v139.Pages.CurrentPage);
            if v399 < 0 then
                return;
            else
                local v400 = v399 + v397;
                if v398 then
                    if #v139.TabHeaders < v400 then
                        v400 = 1;
                    elseif v400 < 1 then
                        v400 = #v139.TabHeaders;
                    end;
                end;
                local v401 = v139.TabHeaders[v400];
                if v401 then
                    for v402, _ in pairs(v139.Pages.PageTable) do
                        if v402:GetTabHeader() == v401 then
                            v139:SwitchToPage(v402, true, v397);
                            return;
                        end;
                    end;
                end;
                return;
            end;
        end;
    end;
    local function v409(_, v406, v407) --[[ Line: 2591 ]]
        -- upvalues: v404 (copy)
        if v406 ~= Enum.UserInputState.Begin then
            return;
        else
            local v408 = 0;
            if v407.KeyCode == Enum.KeyCode.ButtonR1 then
                v408 = 1;
            elseif v407.KeyCode == Enum.KeyCode.ButtonL1 then
                v408 = -1;
            end;
            v404(v408, true);
            return;
        end;
    end;
    local function v412(v410) --[[ Line: 2604 ]]
        -- upvalues: l_UserInputService_0 (ref), v404 (copy)
        if v410.KeyCode == Enum.KeyCode.Tab then
            local v411 = 0;
            v411 = (not not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift)) and -1 or 1;
            v404(v411, true);
        end;
    end;
    local function v417(_, v414, v415) --[[ Line: 2617 ]]
        -- upvalues: v139 (copy)
        if v414 ~= Enum.UserInputState.Begin then
            return;
        else
            local v416 = 0;
            if v415.KeyCode == Enum.KeyCode.PageUp then
                v416 = -100;
            elseif v415.KeyCode == Enum.KeyCode.PageDown then
                v416 = 100;
            end;
            v139:ScrollPixels(v416);
            return;
        end;
    end;
    if v60.isInExperienceUIVREnabled or v60.FFlagEnableSettingsHubUIDelegateRollout then
        v139.SettingsUIDelegate = require(l_RobloxGui_0.Modules.Settings.SettingsUIDelegate).new(v139);
    end;
    v355();
    if v105 then
        v224();
    end;
    v396 = function(v418) --[[ Line: 2641 ]] --[[ Name: GetHeaderPosition ]]
        -- upvalues: v139 (copy)
        local l_v418_TabHeader_0 = v418:GetTabHeader();
        if not l_v418_TabHeader_0 then
            return -1;
        else
            for v420, v421 in pairs(v139.TabHeaders) do
                if v421 == l_v418_TabHeader_0 then
                    return v420;
                end;
            end;
            return -1;
        end;
    end;
    local v422 = nil;
    v422 = function(v423, v424) --[[ Line: 2655 ]]
        -- upvalues: v422 (ref)
        if v424:IsA("GuiObject") then
            v424.ZIndex = v423;
            local l_v424_Children_0 = v424:GetChildren();
            for v426 = 1, #l_v424_Children_0 do
                v422(v423, l_v424_Children_0[v426]);
            end;
        end;
    end;
    local function v431(v427, v428) --[[ Line: 2665 ]] --[[ Name: AddHeader ]]
        -- upvalues: v139 (copy), v422 (ref)
        if not v427 then
            return;
        else
            table.insert(v139.TabHeaders, v427);
            v428.TabPosition = #v139.TabHeaders;
            local v429 = 1 / #v139.TabHeaders;
            for v430 = 1, #v139.TabHeaders do
                v139.TabHeaders[v430].Size = UDim2.new(v429, 0, 1, 0);
            end;
            v422(3, v427);
            v427.Parent = v139.HubBarContainer;
            return;
        end;
    end;
    local function v437(v432) --[[ Line: 2681 ]] --[[ Name: RemoveHeader ]]
        -- upvalues: v139 (copy)
        local v433 = nil;
        for v434 = 1, #v139.TabHeaders do
            if v139.TabHeaders[v434] == v432 then
                v433 = v434;
                table.remove(v139.TabHeaders, v434);
                break;
            end;
        end;
        if v433 then
            for v435 = v433, #v139.TabHeaders do
                local v436 = v139.TabHeaders[v435];
                v436.Position = UDim2.new(v436.Position.X.Scale, v436.Position.X.Offset - v432.AbsoluteSize.X, v436.Position.Y.Scale, v436.Position.Y.Offset);
            end;
        end;
        v432.Parent = nil;
    end;
    v139.AddPage = function(_, v439) --[[ Line: 2704 ]] --[[ Name: AddPage ]]
        -- upvalues: v139 (copy), v431 (copy), v60 (ref), v153 (copy)
        v139.Pages.PageTable[v439] = true;
        v431(v439:GetTabHeader(), v439);
        v439.Page.Position = UDim2.new(v439.TabPosition - 1, 0, 0, 0);
        if v60.FFlagIEMFocusNavToButtons then
            v439.LastSelectableObjectsUpdated:connect(function() --[[ Line: 2709 ]]
                -- upvalues: v153 (ref), v439 (copy)
                v153(v439);
            end);
        end;
    end;
    v139.RemovePage = function(_, v441) --[[ Line: 2715 ]] --[[ Name: RemovePage ]]
        -- upvalues: v139 (copy), v437 (copy), v60 (ref)
        v139.Pages.PageTable[v441] = nil;
        v437(v441:GetTabHeader());
        if v60.FFlagIEMFocusNavToButtons then
            v441.LastSelectableObjectsUpdated:disconnect();
        end;
    end;
    v139.bottomBarAnimating = false;
    v139.defaultPageViewClipperSize = v139.PageViewClipper.Size;
    v139.showStickyBottomBar = true;
    v139.resetPageViewClipperSize = false;
    animateBottomBarComplete = function() --[[ Line: 2728 ]] --[[ Name: animateBottomBarComplete ]]
        -- upvalues: v139 (copy)
        if v139.resetPageViewClipperSize then
            v139.PageViewClipper.Size = v139.defaultPageViewClipperSize;
            v139.resetPageViewClipperSize = false;
        end;
        v139.bottomBarAnimating = false;
    end;
    v139.animateInBottomBar = function(_) --[[ Line: 2737 ]] --[[ Name: animateInBottomBar ]]
        -- upvalues: v139 (copy)
        if v139.bottomBarAnimating or v139.showStickyBottomBar == true then
            return;
        else
            v139.bottomBarAnimating = true;
            v139.showStickyBottomBar = true;
            v139.resetPageViewClipperSize = false;
            local v443 = UDim2.new(v139.defaultPageViewClipperSize.X.Scale, v139.defaultPageViewClipperSize.X.Offset, v139.defaultPageViewClipperSize.Y.Scale, v139.defaultPageViewClipperSize.Y.Offset);
            v139.PageViewClipper:TweenSize(v443, Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, 0.3, true, animateBottomBarComplete);
            return;
        end;
    end;
    v139.animateOutBottomBar = function(_) --[[ Line: 2765 ]] --[[ Name: animateOutBottomBar ]]
        -- upvalues: v139 (copy)
        if v139.bottomBarAnimating or v139.showStickyBottomBar == false then
            return;
        else
            v139.bottomBarAnimating = true;
            v139.showStickyBottomBar = false;
            v139.resetPageViewClipperSize = false;
            local v445 = UDim2.new(v139.defaultPageViewClipperSize.X.Scale, v139.defaultPageViewClipperSize.X.Offset, v139.defaultPageViewClipperSize.Y.Scale, v139.defaultPageViewClipperSize.Y.Offset + 80);
            v139.PageViewClipper:TweenSize(v445, Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, 0.3, true, animateBottomBarComplete);
            return;
        end;
    end;
    v139.HideBar = function(_) --[[ Line: 2793 ]] --[[ Name: HideBar ]]
        -- upvalues: v139 (copy), v167 (copy)
        v139.HubBar.Visible = false;
        v139.PageViewClipper.Visible = false;
        if v139.BottomButtonFrame then
            v167();
        end;
    end;
    v139.ShowBar = function(_) --[[ Line: 2801 ]] --[[ Name: ShowBar ]]
        -- upvalues: v139 (copy), v156 (copy), v161 (copy), v60 (ref), v153 (copy)
        v139.HubBar.Visible = true;
        v139.PageViewClipper.Visible = true;
        if v139.BottomButtonFrame and v156() then
            v161();
            if v60.FFlagIEMFocusNavToButtons then
                v153(v139.Pages.CurrentPage);
            end;
        end;
    end;
    v139.ScrollPixels = function(_, v449) --[[ Line: 2812 ]] --[[ Name: ScrollPixels ]]
        -- upvalues: v139 (copy)
        local l_Y_1 = v139.PageView.CanvasPosition.Y;
        local v451 = v139.PageView.CanvasSize.Y.Offset - v139.PageViewClipper.AbsoluteSize.y;
        local v452 = math.max(0, (math.min(l_Y_1 + v449, v451)));
        v139.PageView.CanvasPosition = Vector2.new(0, v452);
    end;
    v139.ScrollToFrame = function(_, v454, v455) --[[ Line: 2820 ]] --[[ Name: ScrollToFrame ]]
        -- upvalues: l_v10_0 (ref), v139 (copy), l_Constants_0 (ref)
        if l_v10_0 or v455 then
            local v456 = v454.AbsolutePosition.y - v139.Pages.CurrentPage.Page.AbsolutePosition.y;
            local v457 = v456 + v454.AbsoluteSize.y;
            if v456 < v139.PageView.CanvasPosition.y then
                v139.PageView.CanvasPosition = Vector2.new(0, v456);
                return;
            elseif v139.Pages.CurrentPage.Page.Name == l_Constants_0.PeoplePageKey and v457 - v139.PageView.CanvasPosition.y > v139.PageView.AbsoluteSize.Y - l_Constants_0.PeoplePageScrollBuffer then
                v139.PageView.CanvasPosition = Vector2.new(0, v457 - v139.PageView.AbsoluteSize.Y + l_Constants_0.PeoplePageScrollBuffer);
                return;
            elseif v457 - v139.PageView.CanvasPosition.y > v139.PageViewClipper.Size.Y.Offset then
                v139.PageView.CanvasPosition = Vector2.new(0, v457 - v139.PageViewClipper.Size.Y.Offset);
            end;
        end;
    end;
    v139.GetFirstPageWithTabHeader = function(_) --[[ Line: 2835 ]] --[[ Name: GetFirstPageWithTabHeader ]]
        -- upvalues: v139 (copy)
        local v459 = nil;
        for v460, _ in pairs(v139.Pages.PageTable) do
            if v460:GetTabHeader() ~= nil and v460.TabPosition == 1 then
                v459 = v460;
                break;
            end;
        end;
        if v459 == nil then
            error("No page with tab header found");
            return nil;
        else
            return v459;
        end;
    end;
    v139.InitInPage = function(_, v463) --[[ Line: 2854 ]] --[[ Name: InitInPage ]]
        -- upvalues: v139 (copy), v60 (ref), v24 (ref), v156 (copy), v161 (copy), v153 (copy), v50 (ref), v144 (ref)
        local l_TabPosition_0 = v463.TabPosition;
        for v465, _ in pairs(v139.Pages.PageTable) do
            if v465 ~= v463 then
                v465:Hide(-1, l_TabPosition_0, true, nil, v139.PageViewInnerFrame);
            end;
        end;
        if (not v60.FFlagRelocateMobileMenuButtons or v60.FIntRelocateMobileMenuButtonsVariant == 0 or v60.FIntRelocateMobileMenuButtonsVariant == 2 and v24:IsSmallTouchScreen()) and v139.BottomButtonFrame then
            if v156(v463) then
                v161();
                if v60.FFlagIEMFocusNavToButtons then
                    v153(v463);
                end;
            else
                v139.BottomButtonFrame.Visible = false;
            end;
            v139.HubBar.Visible = (v463 or v139.Pages.CurrentPage).ShouldShowBottomBar == true;
        end;
        local v467 = v463.IsPageClipped == true;
        v139.PageViewClipper.ClipsDescendants = v467;
        v139.PageView.ClipsDescendants = v467;
        if v50.UseStickyBar() == false then
            v139.PageViewInnerFrame.ClipsDescendants = v467;
        end;
        v139.Pages.CurrentPage = v463;
        v139.Pages.CurrentPage.Active = true;
        v139.CurrentPageSignal:fire(v139.Pages.CurrentPage and v139.Pages.CurrentPage.Page.Name or nil);
        if v50.UseStickyBar() == false then
            local l_Size_1 = v139.Pages.CurrentPage:GetSize();
            v139.PageView.CanvasSize = UDim2.new(0, 0, 0, l_Size_1.Y);
            v144 = v139.Pages.CurrentPage.Page.Changed:connect(function(v469) --[[ Line: 2896 ]]
                -- upvalues: v139 (ref)
                if v469 == "AbsoluteSize" then
                    local l_Size_2 = v139.Pages.CurrentPage:GetSize();
                    v139.PageView.CanvasSize = UDim2.new(0, 0, 0, l_Size_2.Y);
                end;
            end);
        end;
    end;
    v139.SwitchToPage = function(_, v472, v473, v474, v475, _, v477) --[[ Line: 2905 ]] --[[ Name: SwitchToPage ]]
        -- upvalues: v139 (copy), v60 (ref), v106 (ref), v24 (ref), v50 (ref), v156 (copy), l_RobloxGui_0 (ref), v144 (ref), v161 (copy), v153 (copy), v382 (copy), v12 (ref), l_IXPServiceWrapper_0 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), v59 (ref), l_ExperienceMenuSessionManagerInstance_0 (ref)
        if v139.Pages.PageTable[v472] == nil then
            return;
        elseif v60.FFlagPreventHiddenSwitchPage and v139:GetVisibility() == false then
            return;
        else
            if v106 then
                if v472.Page.Name == "ReportAbuseMenuNewContainerPage" then
                    v139.PageViewInnerFrame.UIPadding.PaddingTop = UDim.new(0, 0);
                else
                    v139.PageViewInnerFrame.UIPadding.PaddingTop = UDim.new(0, 5);
                end;
            end;
            local v478 = UDim.new(0, 0);
            local v479 = UDim.new(0, 0);
            local v480 = not (v24:IsPortrait() or v24:IsSmallTouchScreen()) or v50.AlwaysShowBottomBar();
            if v60.FFlagRelocateMobileMenuButtons and (v60.FIntRelocateMobileMenuButtonsVariant == 1 or v60.FIntRelocateMobileMenuButtonsVariant == 3 or v60.FIntRelocateMobileMenuButtonsVariant == 2 and not v24:IsSmallTouchScreen()) then
                v480 = true;
            end;
            if v139.HubBar and not ((v472 or v139.Pages.CurrentPage).ShouldShowBottomBar == true) and not v472.DisableTopPadding then
                v478 = UDim.new(0, v139.HubBar.AbsoluteSize.Y);
            end;
            if v139.BottomButtonFrame and v480 and not v156(v472) and (not v60.FFlagAddNextUpContainer or not v472.ShrinkwrapPageViewClipper) then
                v479 = UDim.new(0, v139.BottomButtonFrame.AbsoluteSize.Y);
            end;
            local v481 = v50.HubPadding();
            v139.MenuContainerPadding.PaddingLeft = v481.PaddingLeft;
            v139.MenuContainerPadding.PaddingRight = v481.PaddingRight;
            v139.MenuContainerPadding.PaddingBottom = v481.PaddingBottom + v479;
            v139.MenuContainerPadding.PaddingTop = v481.PaddingTop + v478;
            local v482 = v50.MenuContainerPosition(v139.SettingsUIDelegate);
            v139.MenuContainer.Position = v482.Position;
            v139.MenuContainer.Size = v482.Size;
            v139.MenuContainer.AnchorPoint = v482.AnchorPoint;
            if v139.VerticalMenu and not v24:IsPortrait() and v24:IsSmallTouchScreen() then
                local v483 = (v472 or v139.Pages.CurrentPage).ShouldShowBottomBar == true;
                v139.VerticalMenu.Visible = v483;
                v139.VerticalMenuDivider.Visible = v483;
                if v483 then
                    v139.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 60 - v50.VerticalMenuWidth, 0, 52);
                else
                    v139.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 60, 0, 52);
                end;
                local l_Size_3 = v139.PageViewClipper.Size;
                v139.PageViewClipper.Size = UDim2.new(l_Size_3.X.Scale, v139.HubBar.Size.X.Offset, l_Size_3.Y.Scale, l_Size_3.Y.Offset);
            elseif v60.FFlagAddNextUpContainer and v472.ShrinkwrapPageViewClipper then
                local l_Size_4 = v139.PageViewClipper.Size;
                local l_v472_Size_0 = v472:GetSize();
                v139.PageViewClipper.Size = UDim2.new(l_Size_4.X.Scale, v139.HubBar.Size.X.Offset, l_Size_4.Y.Scale, l_v472_Size_0.Y);
            end;
            if v474 == nil and v139.Pages.CurrentPage and v139.Pages.CurrentPage.TabHeader and v472 and v472.TabHeader then
                v474 = v139.Pages.CurrentPage.TabHeader.AbsolutePosition.x < v472.TabHeader.AbsolutePosition.x and 1 or -1;
            end;
            if v474 == nil then
                v474 = 1;
            end;
            if v139.Pages.CurrentPage and v144 ~= nil then
                v144:disconnect();
                v139.Pages.CurrentPage.Active = false;
            end;
            local l_TabPosition_1 = v472.TabPosition;
            for v488, _ in pairs(v139.Pages.PageTable) do
                if v488 ~= v472 then
                    v488:Hide(-v474, l_TabPosition_1, v475, nil, v139.PageViewInnerFrame, v488 == v139.Pages.CurrentPage);
                end;
            end;
            if v139.BottomButtonFrame then
                if v156(v472) then
                    v161();
                    if v60.FFlagIEMFocusNavToButtons then
                        v153(v472);
                    end;
                else
                    v139.BottomButtonFrame.Visible = false;
                end;
                v139.HubBar.Visible = (v472 or v139.Pages.CurrentPage).ShouldShowBottomBar == true;
            end;
            local v490 = v472.IsPageClipped == true;
            v139.PageViewClipper.ClipsDescendants = v490;
            v139.PageView.ClipsDescendants = v490;
            v139.PageViewInnerFrame.ClipsDescendants = v490;
            v139.Pages.CurrentPage = v472;
            v139.Pages.CurrentPage:Display(v139.PageViewInnerFrame, v475);
            v139.Pages.CurrentPage.Active = true;
            v139.CurrentPageSignal:fire(v139.Pages.CurrentPage and v139.Pages.CurrentPage.Page.Name or nil);
            if v50.UseStickyBar() == false then
                local l_Size_5 = v139.Pages.CurrentPage:GetSize();
                v139.PageView.CanvasSize = UDim2.new(0, 0, 0, l_Size_5.Y);
                v144 = v139.Pages.CurrentPage.Page.Changed:connect(function(v492) --[[ Line: 3017 ]]
                    -- upvalues: v139 (ref), v60 (ref), v382 (ref)
                    if v492 == "AbsoluteSize" then
                        local l_Size_6 = v139.Pages.CurrentPage:GetSize();
                        v139.PageView.CanvasSize = UDim2.new(0, 0, 0, l_Size_6.Y);
                        if v60.FFlagAddNextUpContainer and v139.Pages.CurrentPage.ShrinkwrapPageViewClipper then
                            v382();
                        end;
                    end;
                end);
                if v139.MenuStack[#v139.MenuStack] ~= v139.Pages.CurrentPage and not v473 then
                    v139.MenuStack[#v139.MenuStack + 1] = v139.Pages.CurrentPage;
                end;
            end;
            if v60.FFlagAddNextUpContainer then
                v382();
            elseif v472.DisableTopPadding then
                v382();
            end;
            local v494 = {
                universeid = tostring(game.GameId)
            };
            if v60.GetFFlagReportAbuseMenuEntrypointAnalytics() and v477 then
                v494 = v12.Dictionary.join(v494, v477);
            end;
            if v60.FFlagRespawnChromeShortcutTelemetry and v494.used_shortcut == nil then
                v494.used_shortcut = false;
            end;
            if v494.playsessionid == nil then
                v494.playsessionid = v139.playSessionId;
            end;
            if v472 then
                if v60.FFlagHelpPageIXPExposure and v139.HelpPage == v472 and not v139.HelpPageIXPFetched then
                    l_IXPServiceWrapper_0:LogUserLayerExposure(v60.FStringHelpPageIXPLayer);
                    v139.HelpPageIXPFetched = true;
                end;
                if v139.GameSettingsPage == v472 then
                    l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, "open_GameSettings_tab", l_Constants_0.AnalyticsMenuActionName, v494);
                    if v59.FFlagIEMSettingsLogExposureIXPFlags and not v139.GameSettingsPageReorderIXPFetched then
                        l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(v60.GetFStringInExperienceMenuIXPLayer());
                        v139.GameSettingsPageReorderIXPFetched = true;
                    end;
                else
                    l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, "open_" .. v472.Page.Name .. "_tab", l_Constants_0.AnalyticsMenuActionName, v494);
                end;
                l_ExperienceMenuSessionManagerInstance_0:MenuSwitchToPage(v472.Page);
                return;
            else
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, "open_unknown_tab", l_Constants_0.AnalyticsMenuActionName, v494);
                l_ExperienceMenuSessionManagerInstance_0:CloseOpenedMenuTab();
                return;
            end;
        end;
    end;
    v139.SetActive = function(_, v496) --[[ Line: 3083 ]] --[[ Name: SetActive ]]
        -- upvalues: v139 (copy)
        v139.Active = v496;
        if v139.Pages.CurrentPage then
            v139.Pages.CurrentPage.Active = v496;
        end;
    end;
    clearMenuStack = function() --[[ Line: 3091 ]] --[[ Name: clearMenuStack ]]
        -- upvalues: v139 (copy)
        while v139.MenuStack and #v139.MenuStack > 0 do
            v139:PopMenu();
        end;
    end;
    setOverrideMouseIconBehavior = function() --[[ Line: 3097 ]] --[[ Name: setOverrideMouseIconBehavior ]]
        -- upvalues: v139 (copy), l_UserInputService_0 (ref), l_VRService_0 (ref), l_MouseIconOverrideService_0 (ref), v54 (ref)
        if not v139.Visible then
            return;
        elseif l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Gamepad1 or l_VRService_0.VREnabled then
            l_MouseIconOverrideService_0.push(v54, Enum.OverrideMouseIconBehavior.ForceHide);
            return;
        else
            l_MouseIconOverrideService_0.push(v54, Enum.OverrideMouseIconBehavior.ForceShow);
            return;
        end;
    end;
    checkLeaveGameUpsell = function() --[[ Line: 3109 ]] --[[ Name: checkLeaveGameUpsell ]]
        -- upvalues: v60 (ref), v139 (copy), v104 (ref), l_default_0 (ref), v56 (ref)
        if not v60.GetFFlagEnableLeaveGameUpsellEntrypoint() then
            return;
        else
            if not v139.sessionStartTime then
                v139.sessionStartTime = os.time();
            end;
            if not v139.sessionStartTime then
                return;
            elseif not v139.checkedUpsell and v139.leaveGameUpsellProp == v104.PHONE_UPSELL_VALUE_PROP.None then
                v139.checkedUpsell = true;
                v139.leaveGameUpsellProp = l_default_0:FetchPhoneVerificationUpsell(v104.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, v139.sessionStartTime, true);
                v139.LeaveGameUpsellPage:SetUpsellProp(v139.leaveGameUpsellProp);
                task.delay(v56, function() --[[ Line: 3130 ]]
                    -- upvalues: v139 (ref)
                    v139.checkedUpsell = false;
                end);
                return;
            else
                if v139.checkedUpsell then
                    local v497 = l_default_0:FetchPhoneVerificationUpsell(v104.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, v139.sessionStartTime, false);
                    if v139.leaveGameUpsellProp ~= v497 then
                        v139.leaveGameUpsellProp = v497;
                        v139.LeaveGameUpsellPage:SetUpsellProp(v139.leaveGameUpsellProp);
                    end;
                end;
                return;
            end;
        end;
    end;
    local v498 = nil;
    if v60.FFlagSettingsHubIndependentBackgroundVisibility then
        v498 = function(v499, v500) --[[ Line: 3145 ]]
            -- upvalues: v139 (copy), l_InExperienceAppChatModal_0 (ref), l_Constants_0 (ref), v60 (ref), v50 (ref), l_TweenService_0 (ref)
            if not v139.DarkenBackground then
                return;
            elseif not v499 and v139.DarkenBackground.Visible and (l_InExperienceAppChatModal_0:getVisible() or v139.Visible) then
                return;
            else
                local v501 = 1;
                local l_Quart_0 = Enum.EasingStyle.Quart;
                local v503 = 0;
                v503 = if l_Constants_0 then l_Constants_0.ShieldCloseAnimationTweenTime else 0.4;
                if v499 then
                    v501 = if v60.isInExperienceUIVREnabled then v139.SettingsUIDelegate:getDarkBackgroundTheme().Transparency else v50.transparency("DarkenBackground");
                    l_Quart_0 = Enum.EasingStyle.Quad;
                    v503 = if l_Constants_0 then l_Constants_0.ShieldOpenAnimationTweenTime else 0.5;
                end;
                if v500 then
                    if v139.DarkenBackgroundTween then
                        v139.DarkenBackgroundTween:Cancel();
                        v139.DarkenBackgroundTween = nil;
                    end;
                    v139.DarkenBackground.BackgroundTransparency = v501;
                else
                    local v504 = TweenInfo.new(v503, l_Quart_0, Enum.EasingDirection.Out);
                    if v139.DarkenBackgroundTween then
                        v139.DarkenBackgroundTween:Cancel();
                    end;
                    v139.DarkenBackgroundTween = l_TweenService_0:Create(v139.DarkenBackground, v504, {
                        BackgroundTransparency = v501
                    });
                    v139.DarkenBackgroundTween:Play();
                end;
                v139.DarkenBackground.Visible = v499;
                return;
            end;
        end;
    end;
    v237 = function(v505, v506, v507, _, v509) --[[ Line: 3192 ]] --[[ Name: setVisibilityInternal ]]
        -- upvalues: v60 (ref), v139 (copy), v27 (ref), l_RobloxGui_0 (ref), v498 (ref), v382 (copy), v24 (ref), v253 (copy), l_GuiService_0 (ref), v50 (ref), l_ExperienceMenuSessionManagerInstance_0 (ref), l_Constants_0 (ref), l_GameSettings_0 (ref), l_TweenService_0 (ref), l_ContextActionService_0 (ref), v409 (copy), v417 (copy), v156 (copy), v161 (copy), v153 (copy), l_UserInputService_0 (ref), v412 (copy), v83 (ref), l_VRService_0 (ref), l_MouseIconOverrideService_0 (ref), v54 (ref), v167 (copy), v120 (ref), l_InExperienceAppChatModal_0 (ref), v84 (ref), v254 (copy), l_SHIELD_INACTIVE_POSITION_0 (ref), l_RbxAnalyticsService_0 (ref)
        local v510 = nil;
        v510 = if v60.isInExperienceUIVREnabled then v506 or not v139.SettingsUIDelegate:isOpenCloseAnimationAllowed() else v506;
        v139.OpenStateChangedCount = v139.OpenStateChangedCount + 1;
        local v511 = v505 ~= v139.Visible;
        v139.Visible = v505;
        if v60.FFlagEnableInGameMenuDurationLogger and v511 and not v505 then
            v27.menuClose();
        end;
        if v139.ResizedConnection then
            v139.ResizedConnection:disconnect();
            v139.ResizedConnection = nil;
        end;
        if v139.BackBarVisibleConnection then
            v139.BackBarVisibleConnection:disconnect();
            v139.BackBarVisibleConnection = nil;
        end;
        if v60.EngineFeatureTeleportHistoryButtons and v139.FrontBarVisibleConnection then
            v139.FrontBarVisibleConnection:disconnect();
            v139.FrontBarVisibleConnection = nil;
        end;
        if v139.PreferredTransparencyChangedConnection then
            v139.PreferredTransparencyChangedConnection:disconnect();
            v139.PreferredTransparencyChangedConnection = nil;
        end;
        v139.Modal.Visible = v139.Visible;
        if v139.TabConnection then
            v139.TabConnection:disconnect();
            v139.TabConnection = nil;
        end;
        local v512 = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
        if v60.FFlagSettingsHubIndependentBackgroundVisibility then
            v498(v139.Visible, v510);
        end;
        if v139.Visible then
            v139.ResizedConnection = l_RobloxGui_0.Changed:connect(function(v513) --[[ Line: 3242 ]]
                -- upvalues: v382 (ref)
                if v513 == "AbsoluteSize" then
                    v382();
                end;
            end);
            if v60.FFlagMenuButtonsMountWithIEM then
                if v60.FFlagRelocateMobileMenuButtons and (v60.FIntRelocateMobileMenuButtonsVariant == 1 or v60.FIntRelocateMobileMenuButtonsVariant == 3 or v60.FIntRelocateMobileMenuButtonsVariant == 2 and not v24:IsSmallTouchScreen()) then
                    v253();
                end;
                if v60.FFlagRelocateMobileMenuButtons and v60.FIntRelocateMobileMenuButtonsVariant == 2 and v24:IsSmallTouchScreen() and v139.PlayersPage then
                    v139.PlayersPage:CreateMenuButtonsContainer();
                end;
            end;
            if not v60.FFlagAddTraversalBackButton then
                if v139.BackBarRef:getValue() then
                    v139.BackBarVisibleConnection = v139.BackBarRef:getValue():GetPropertyChangedSignal("Visible"):connect(function() --[[ Line: 3262 ]]
                        -- upvalues: v382 (ref)
                        v382();
                    end);
                end;
                if v60.EngineFeatureTeleportHistoryButtons and v139.FrontBarRef:getValue() then
                    v139.FrontBarVisibleConnection = v139.FrontBarRef:getValue():GetPropertyChangedSignal("Visible"):connect(function() --[[ Line: 3267 ]]
                        -- upvalues: v382 (ref)
                        v382();
                    end);
                end;
            end;
            v382();
            v139.PreferredTransparencyChangedConnection = l_GuiService_0:GetPropertyChangedSignal("PreferredTransparency"):connect(function() --[[ Line: 3274 ]]
                -- upvalues: v139 (ref), v50 (ref), l_GuiService_0 (ref)
                v139.MenuContainer.BackgroundTransparency = v50.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency;
            end);
            v139.MenuContainer.BackgroundTransparency = v50.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency;
            v139.SettingsShowSignal:fire(v139.Visible);
            l_GuiService_0:SetMenuIsOpen(true, "SettingsHub");
            l_ExperienceMenuSessionManagerInstance_0:OpenExperienceMenu();
            v139.Shield.Visible = v139.Visible;
            l_GuiService_0:CloseInspectMenu();
            if v510 or not v139.Shield:IsDescendantOf(game) then
                v139.Shield.Position = UDim2.new(0, 0, 0, 0);
                if not v60.FFlagSettingsHubIndependentBackgroundVisibility and v139.DarkenBackground then
                    if v139.DarkenBackgroundTween then
                        v139.DarkenBackgroundTween:Cancel();
                        v139.DarkenBackgroundTween = nil;
                    end;
                    v139.DarkenBackground.BackgroundTransparency = v50.transparency("DarkenBackground");
                end;
            else
                local v514 = if l_Constants_0 then l_Constants_0.ShieldOpenAnimationTweenTime else 0.5;
                if l_GameSettings_0.ReducedMotion then
                    if v139.ReducedMotionOpenTween then
                        v139.ReducedMotionOpenTween:Cancel();
                        v139.ReducedMotionOpenTween = nil;
                    end;
                    if v139.ReducedMotionCloseTween then
                        v139.ReducedMotionCloseTween:Cancel();
                        v139.ReducedMotionCloseTween = nil;
                    end;
                    v139.Shield.Parent = v139.CanvasGroup;
                    v139.CanvasGroup.GroupTransparency = 1;
                    v139.CanvasGroup.Visible = true;
                    v139.Shield.Position = UDim2.new(0, 0, 0, 0);
                    local v515 = TweenInfo.new(0.25);
                    local v516 = {
                        GroupTransparency = 0
                    };
                    v139.ReducedMotionOpenTween = l_TweenService_0:Create(v139.CanvasGroup, v515, v516);
                    v139.ReducedMotionOpenTween:Play();
                    v139.ReducedMotionOpenTween.Completed:Connect(function(v517) --[[ Line: 3323 ]]
                        -- upvalues: v139 (ref)
                        if v517 == Enum.PlaybackState.Completed then
                            v139.Shield.Parent = v139.ClippingShield;
                            v139.ReducedMotionOpenTween = nil;
                        end;
                        v139.CanvasGroup.Visible = false;
                    end);
                    if v60.FFlagEnableInGameMenuDurationLogger then
                        v27.menuOpenComplete();
                    end;
                else
                    v139.Shield:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, v514, true, function() --[[ Line: 3342 ]]
                        -- upvalues: v60 (ref), v27 (ref)
                        if v60.FFlagEnableInGameMenuDurationLogger then
                            v27.menuOpenComplete();
                        end;
                    end);
                end;
                if not v60.FFlagSettingsHubIndependentBackgroundVisibility and v139.DarkenBackground then
                    local v518 = TweenInfo.new(v514, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                    if v139.DarkenBackgroundTween then
                        v139.DarkenBackgroundTween:Cancel();
                    end;
                    v139.DarkenBackgroundTween = l_TweenService_0:Create(v139.DarkenBackground, v518, {
                        BackgroundTransparency = v50.transparency("DarkenBackground")
                    });
                    v139.DarkenBackgroundTween:Play();
                end;
            end;
            local function v519() --[[ Line: 3366 ]]

            end;
            if v60.isInExperienceUIVREnabled then
                v519 = function(v520, v521, v522) --[[ Line: 3368 ]]
                    -- upvalues: v139 (ref)
                    if v139.SettingsUIDelegate:isInputEventNeededBySettings(v520, v521, v522) then
                        return Enum.ContextActionResult.Pass;
                    else
                        return nil;
                    end;
                end;
            end;
            l_ContextActionService_0:BindCoreAction("RbxSettingsHubStopCharacter", v519, false, Enum.PlayerActions.CharacterForward, Enum.PlayerActions.CharacterBackward, Enum.PlayerActions.CharacterLeft, Enum.PlayerActions.CharacterRight, Enum.PlayerActions.CharacterJump, Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift, Enum.KeyCode.Tab, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4);
            l_ContextActionService_0:BindCoreAction("RbxSettingsHubSwitchTab", v409, false, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL1);
            l_ContextActionService_0:BindCoreAction("RbxSettingsScrollHotkey", v417, false, Enum.KeyCode.PageUp, Enum.KeyCode.PageDown);
            if v156() then
                v161();
                if v60.FFlagIEMFocusNavToButtons then
                    v153(v139.Pages.CurrentPage);
                end;
            end;
            if v60.ChromeEnabled and v60.FFlagEnableConsoleExpControls then
                require(l_RobloxGui_0.Modules.Chrome.Service):setShortcutBar(require(l_RobloxGui_0.Modules.Chrome.ChromeShared.Unibar.Constants).TILTMENU_SHORTCUTBAR_ID);
            end;
            v139.TabConnection = l_UserInputService_0.InputBegan:connect(v412);
            setOverrideMouseIconBehavior();
            v83 = l_UserInputService_0.LastInputTypeChanged:connect(setOverrideMouseIconBehavior);
            if l_UserInputService_0.MouseEnabled and not l_VRService_0.VREnabled then
                l_MouseIconOverrideService_0.push(v54, Enum.OverrideMouseIconBehavior.ForceShow);
            end;
            v139:CloseReactPage();
            if v507 then
                v167();
                v139:SwitchToPage(v507, nil, 1, true);
            else
                v139:SwitchToPage(v139:GetFirstPageWithTabHeader(), nil, 1, true);
            end;
            if not v60.isInExperienceUIVREnabled or v60.InExperienceUIVRIXP:isMovePanelToCenter() and true or not l_VRService_0.VREnabled then
                if v60.FFlagAddNewPlayerListMobileFocusNav then
                    if v512:GetIsModal() then
                        v512:SetVisibility(false);
                    else
                        v512:HideTemp("SettingsMenu", true);
                    end;
                else
                    v512:HideTemp("SettingsMenu", true);
                end;
                if not v60.isInExperienceUIVREnabled or not v60.InExperienceUIVRIXP:isMovePanelToCenter() or not v60.FFlagSpatialUIFixMenuPanelChatExclusive or not l_VRService_0.VREnabled then
                    v120:HideTemp("SettingsMenu", true);
                end;
                local v523 = require(l_RobloxGui_0.Modules.BackpackScript);
                if v523.IsOpen then
                    v523:OpenClose();
                end;
            end;
            if v60.GetFFlagEnableAppChatInExperience() and l_InExperienceAppChatModal_0:getVisible() then
                v84 = true;
                l_InExperienceAppChatModal_0.default:setVisible(false);
            end;
            if not v60.isInExperienceUIVREnabled then
                local v524 = require(l_RobloxGui_0.Modules.BackpackScript);
                if v524.IsOpen then
                    v524:OpenClose();
                end;
            end;
            v139.GameSettingsPage:OpenSettingsPage();
        else
            v139.CurrentPageSignal:fire("");
            if v60.FFlagMenuButtonsMountWithIEM and v60.FFlagRelocateMobileMenuButtons then
                if v60.FIntRelocateMobileMenuButtonsVariant ~= 0 then
                    v254();
                end;
                if v60.FIntRelocateMobileMenuButtonsVariant == 2 and v139.PlayersPage then
                    v139.PlayersPage:UnmountMenuButtonsContainer();
                end;
            end;
            if v60.ChromeEnabled and v60.FFlagEnableConsoleExpControls then
                local v525 = require(l_RobloxGui_0.Modules.Chrome.Service);
                if v60.FFlagSetUnibarShortcutOnTopBarFocus then
                    v525:setShortcutBar(nil);
                else
                    v525:setShortcutBar(require(l_RobloxGui_0.Modules.Chrome.ChromeShared.Unibar.Constants).UNIBAR_SHORTCUTBAR_ID);
                end;
            end;
            if v60.GetFFlagEnableAppChatInExperience() and v84 then
                v84 = false;
            end;
            if v60.isInExperienceUIVREnabled and v60.InExperienceUIVRIXP:isMovePanelToCenter() then
                v512:HideTemp("SettingsMenu", false);
                if not v60.FFlagSpatialUIFixMenuPanelChatExclusive or not l_VRService_0.VREnabled then
                    v120:HideTemp("SettingsMenu", false);
                end;
            end;
            if v510 then
                v139.Shield.Position = l_SHIELD_INACTIVE_POSITION_0;
                v139.Shield.Visible = v139.Visible;
                v139.SettingsShowSignal:fire(v139.Visible);
                l_GuiService_0:SetMenuIsOpen(false, "SettingsHub");
                l_ExperienceMenuSessionManagerInstance_0:CloseExperienceMenu();
                if v60.FFlagEnableInGameMenuDurationLogger then
                    v27.menuCloseComplete();
                end;
                if not v60.FFlagSettingsHubIndependentBackgroundVisibility and v139.DarkenBackground then
                    if v139.DarkenBackgroundTween then
                        v139.DarkenBackgroundTween:Cancel();
                        v139.DarkenBackgroundTween = nil;
                    end;
                    v139.DarkenBackground.BackgroundTransparency = 1;
                end;
            else
                local v526 = if l_Constants_0 then l_Constants_0.ShieldCloseAnimationTweenTime else 0.4;
                local function v527() --[[ Line: 3520 ]] --[[ Name: handleShieldClose ]]
                    -- upvalues: v60 (ref), v139 (ref), l_GuiService_0 (ref), l_ExperienceMenuSessionManagerInstance_0 (ref), v27 (ref)
                    if not v60.FFlagAddTraversalBackButton then
                        v139.SettingsShowSignal:fire(v139.Visible);
                    end;
                    if not v139.Visible then
                        l_GuiService_0:SetMenuIsOpen(false, "SettingsHub");
                        l_ExperienceMenuSessionManagerInstance_0:CloseExperienceMenu();
                    end;
                    if v60.FFlagEnableInGameMenuDurationLogger then
                        v27.menuCloseComplete();
                    end;
                end;
                if v60.FFlagAddTraversalBackButton then
                    v139.SettingsShowSignal:fire(v139.Visible);
                end;
                if l_GameSettings_0.ReducedMotion then
                    if v139.ReducedMotionOpenTween then
                        v139.ReducedMotionOpenTween:Cancel();
                        v139.ReducedMotionOpenTween = nil;
                    end;
                    if v139.ReducedMotionCloseTween then
                        v139.ReducedMotionCloseTween:Cancel();
                        v139.ReducedMotionCloseTween = nil;
                    end;
                    v139.Shield.Parent = v139.CanvasGroup;
                    v139.CanvasGroup.Visible = true;
                    local v528 = TweenInfo.new(0.25);
                    local v529 = {
                        GroupTransparency = 1
                    };
                    v139.ReducedMotionCloseTween = l_TweenService_0:Create(v139.CanvasGroup, v528, v529);
                    v139.ReducedMotionCloseTween:Play();
                    v139.ReducedMotionCloseTween.Completed:Connect(function(v530) --[[ Line: 3556 ]]
                        -- upvalues: v139 (ref), l_SHIELD_INACTIVE_POSITION_0 (ref)
                        if v530 == Enum.PlaybackState.Completed then
                            v139.Shield.Position = l_SHIELD_INACTIVE_POSITION_0;
                            v139.Shield.Visible = v139.Visible;
                            v139.Shield.Parent = v139.ClippingShield;
                            v139.ReducedMotionCloseTween = nil;
                        end;
                        v139.CanvasGroup.Visible = false;
                    end);
                    v527();
                else
                    if v60.ChromeEnabled and v60.FFlagEnableConsoleExpControls then
                        local v531 = require(l_RobloxGui_0.Modules.Chrome.Service);
                        if v60.FFlagSetUnibarShortcutOnTopBarFocus then
                            v531:setShortcutBar(nil);
                        else
                            v531:setShortcutBar(require(l_RobloxGui_0.Modules.Chrome.ChromeShared.Unibar.Constants).UNIBAR_SHORTCUTBAR_ID);
                        end;
                    end;
                    v139.Shield:TweenPosition(l_SHIELD_INACTIVE_POSITION_0, Enum.EasingDirection.In, Enum.EasingStyle.Quad, v526, true, function() --[[ Line: 3584 ]]
                        -- upvalues: v139 (ref), v527 (copy)
                        v139.Shield.Visible = v139.Visible;
                        v527();
                    end);
                end;
                if not v60.FFlagSettingsHubIndependentBackgroundVisibility and v139.DarkenBackground then
                    local v532 = TweenInfo.new(v526, Enum.EasingStyle.Quart, Enum.EasingDirection.Out);
                    if v139.DarkenBackgroundTween then
                        v139.DarkenBackgroundTween:Cancel();
                    end;
                    v139.DarkenBackgroundTween = l_TweenService_0:Create(v139.DarkenBackground, v532, {
                        BackgroundTransparency = 1
                    });
                    v139.DarkenBackgroundTween:Play();
                end;
            end;
            if v83 then
                v83:disconnect();
            end;
            if v50.UseStickyBar() and v139.pageViewScrollChangeCon then
                v139.pageViewScrollChangeCon:disconnect();
                v139.pageViewScrollChangeCon = nil;
            end;
            if v60.isInExperienceUIVREnabled then
                if not v60.InExperienceUIVRIXP:isMovePanelToCenter() and not l_VRService_0.VREnabled then
                    v512:HideTemp("SettingsMenu", false);
                    v120:HideTemp("SettingsMenu", false);
                end;
            else
                v512:HideTemp("SettingsMenu", false);
                v120:HideTemp("SettingsMenu", false);
            end;
            if not l_VRService_0.VREnabled then
                l_MouseIconOverrideService_0.pop(v54);
            end;
            v139:CloseReactPage();
            clearMenuStack();
            l_ContextActionService_0:UnbindCoreAction("RbxSettingsHubSwitchTab");
            l_ContextActionService_0:UnbindCoreAction("RbxSettingsHubStopCharacter");
            l_ContextActionService_0:UnbindCoreAction("RbxSettingsScrollHotkey");
            v167(0.4);
            l_GuiService_0.SelectedCoreObject = nil;
            v139.GameSettingsPage:CloseSettingsPage();
            if v139.ShareGamePage then
                v139.ShareGamePage:ClearShareInviteLink(v139.ShareGameApp);
            end;
        end;
        local v533 = {
            source = v509, 
            playsessionid = v139.playSessionId, 
            universeid = tostring(game.GameId)
        };
        if v511 then
            if v505 then
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsMenuOpenName, l_Constants_0.AnalyticsMenuActionName, v533);
                if v60.GetFFlagEnableLeaveGameUpsellEntrypoint() then
                    task.spawn(checkLeaveGameUpsell);
                    return;
                end;
            else
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsMenuCloseName, l_Constants_0.AnalyticsMenuActionName, v533);
            end;
        end;
    end;
    v139.SetVisibility = function(_, v535, v536, v537, v538, v539) --[[ Line: 3671 ]] --[[ Name: SetVisibility ]]
        -- upvalues: v139 (copy), v237 (ref)
        if v139.Visible == v535 then
            return;
        else
            v237(v535, v536, v537, v538, v539);
            return;
        end;
    end;
    v139.SetBackgroundVisibility = function(_, v541, v542) --[[ Line: 3677 ]] --[[ Name: SetBackgroundVisibility ]]
        -- upvalues: v139 (copy), v498 (ref)
        if v139.DarkenBackground.Visible == v541 then
            return;
        else
            v498(v541, v542);
            return;
        end;
    end;
    v139.GetVisibility = function(_) --[[ Line: 3683 ]] --[[ Name: GetVisibility ]]
        -- upvalues: v139 (copy)
        return v139.Visible;
    end;
    v139.ToggleVisibility = function(_, v545, v546) --[[ Line: 3687 ]] --[[ Name: ToggleVisibility ]]
        -- upvalues: v237 (ref), v139 (copy)
        v237(not v139.Visible, nil, nil, v545, v546);
    end;
    v139.AddToMenuStack = function(_, v548) --[[ Line: 3691 ]] --[[ Name: AddToMenuStack ]]
        -- upvalues: v139 (copy)
        if v139.MenuStack[#v139.MenuStack] ~= v548 then
            v139.MenuStack[#v139.MenuStack + 1] = v548;
        end;
    end;
    v139.InviteToGame = function(_) --[[ Line: 3697 ]] --[[ Name: InviteToGame ]]
        -- upvalues: v60 (ref), l_IXPServiceWrapper_0 (ref), v98 (ref), v75 (ref), l_UserInputService_0 (ref), v74 (ref), v139 (copy), v97 (ref), v99 (ref), l_RobloxGui_0 (ref)
        local v550 = false;
        if v60.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification() and v60.FFlagLuaEnableGameInviteModalSettingsHub then
            local v551 = v60.GetFStringGameInviteMenuLayer();
            local l_l_IXPServiceWrapper_0_LayerData_0 = l_IXPServiceWrapper_0:GetLayerData(v551);
            l_IXPServiceWrapper_0:LogUserLayerExposure(v551);
            v550 = if l_l_IXPServiceWrapper_0_LayerData_0 then l_l_IXPServiceWrapper_0_LayerData_0.inExperienceGameInviteUXRefresh2023 == v98.UxRefresh or l_l_IXPServiceWrapper_0_LayerData_0.inExperienceGameInviteUXRefresh2023 == v98.InviteLimit else false;
        end;
        if game:GetEngineFeature("PlatformFriendsService") and v75 and v75:IsInviteFriendsEnabled() then
            v75:ShowInviteFriendsUI();
            return;
        else
            if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
                if v74 then
                    v74:PopupGameInviteUI();
                    return;
                end;
            elseif v550 then
                v139:ToggleVisibility();
                v97:openModal({
                    trigger = v99.Triggers.GameMenu
                });
                if v60.FFlagEnableConsoleExpControls and v60.ChromeEnabled then
                    require(l_RobloxGui_0.Modules.Chrome.Service):setShortcutBar(nil);
                    return;
                end;
            else
                v139:AddToMenuStack(v139.Pages.CurrentPage);
                v139:SwitchToPage(v139.ShareGamePage, nil, 1, true);
            end;
            return;
        end;
    end;
    v139.PopMenu = function(_, _, v555, v556) --[[ Line: 3728 ]] --[[ Name: PopMenu ]]
        -- upvalues: v139 (copy), l_BindableEvent_0 (copy), v60 (ref), l_RobloxGui_0 (ref)
        if v139.MenuStack and #v139.MenuStack > 0 then
            local v557 = v139.MenuStack[#v139.MenuStack];
            if type(v557) ~= "table" then
                l_BindableEvent_0:Fire(v557);
            end;
            table.remove(v139.MenuStack, #v139.MenuStack);
            v139:SwitchToPage(v139.MenuStack[#v139.MenuStack], true, 1, v555);
            if #v139.MenuStack == 0 then
                if v60.FFlagAddUILessMode then
                    v139:SetVisibility(false, nil, nil, nil, v556);
                else
                    v139:SetVisibility(false);
                end;
                v139.Pages.CurrentPage:Hide(0, 0, nil, nil, v139.PageViewInnerFrame);
                return;
            elseif v60.ChromeEnabled and v60.FFlagEnableConsoleExpControls then
                require(l_RobloxGui_0.Modules.Chrome.Service):setShortcutBar(require(l_RobloxGui_0.Modules.Chrome.ChromeShared.Unibar.Constants).TILTMENU_SHORTCUTBAR_ID);
                return;
            end;
        else
            v139.MenuStack = {};
            l_BindableEvent_0:Fire();
            if v60.FFlagAddUILessMode then
                v139:ToggleVisibility(nil, v556);
                return;
            else
                v139:ToggleVisibility(v556);
            end;
        end;
    end;
    v139.ShowShield = function(_) --[[ Line: 3762 ]] --[[ Name: ShowShield ]]
        -- upvalues: l_UserInputService_0 (ref), v52 (ref), v139 (copy)
        local v559 = 0;
        v559 = l_UserInputService_0.VREnabled and 1 or v52;
        v139.Shield.BackgroundTransparency = v559;
    end;
    v139.HideShield = function(_) --[[ Line: 3772 ]] --[[ Name: HideShield ]]
        -- upvalues: v139 (copy)
        v139.Shield.BackgroundTransparency = 1;
    end;
    v139.ShowReactPage = function(_) --[[ Line: 3776 ]] --[[ Name: ShowReactPage ]]
        -- upvalues: v139 (copy)
        if v139.reactPage then
            v139.reactPageAnalytics:openPage(v139.reactPage.name);
        end;
        v139.ReactPage.Visible = true;
        v139.Page.Visible = false;
    end;
    v139.HideReactPage = function(_) --[[ Line: 3785 ]] --[[ Name: HideReactPage ]]
        -- upvalues: v139 (copy), v60 (ref)
        if v139.reactPage then
            v139.reactPageAnalytics:closePage(v139.reactPage.name);
        end;
        local v563 = nil;
        if v60.FFlagFixFocusNavToButtonsWithIEMReact then
            v563 = v139.ReactPage.Visible;
        end;
        v139.ReactPage.Visible = false;
        v139.Page.Visible = true;
        if v60.FFlagCreateInExperienceMenuReact and v60.FFlagIEMFocusNavToButtons and v139.Pages.CurrentPage and (not v60.FFlagFixFocusNavToButtonsWithIEMReact or v563 and v139.Visible) then
            v139.Pages.CurrentPage:SelectARow(true);
        end;
    end;
    v139.MountReactPage = function(_) --[[ Line: 3802 ]] --[[ Name: MountReactPage ]]
        -- upvalues: v60 (ref), v22 (ref), v139 (copy), v15 (ref)
        if v60.FFlagCreateInExperienceMenuReact then
            v22(false).setCurrentReactPage(nil);
        end;
        if v139.reactPageRoot then
            v139:UnmountReactPage();
        end;
        v139.reactPageRoot = v15.createRoot(v139.ReactPage);
    end;
    v139.UnmountReactPage = function(_) --[[ Line: 3812 ]] --[[ Name: UnmountReactPage ]]
        -- upvalues: v139 (copy)
        if v139.reactPageRoot then
            v139.reactPageRoot:unmount();
            v139.reactPageRoot = nil;
        end;
    end;
    v139.CloseReactPage = function(_) --[[ Line: 3819 ]] --[[ Name: CloseReactPage ]]
        -- upvalues: v139 (copy)
        v139:HideReactPage();
        v139:UnmountReactPage();
    end;
    v139.SwitchToReactPage = function(_, v568, v569, v570) --[[ Line: 3824 ]] --[[ Name: SwitchToReactPage ]]
        -- upvalues: v60 (ref), v139 (copy)
        if v60.FFlagCreateInExperienceMenuReact and v570 then
            v139:UnmountReactPage();
        elseif v568 then
            v139.reactPage = v568;
            if not v139.reactPageRoot then
                v139:MountReactPage();
            end;
            v139.reactPageRoot:render(v568:createPage(v569));
        end;
        v139:ShowReactPage();
    end;
    v139.GameSettingsPageReorderIXPFetched = false;
    local v571 = nil;
    local v572 = nil;
    local function v578() --[[ Line: 3842 ]] --[[ Name: enableVR ]]
        -- upvalues: l_CorePackages_0 (ref), v139 (copy), v571 (ref)
        local l_VRHub_1 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRHub;
        local l_Panel3D_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).Panel3D;
        local v575 = l_Panel3D_0.Get("SettingsMenu");
        v575:ResizeStuds(4, 4, 250);
        v575:SetType(l_Panel3D_0.Type.Standard);
        v575:SetVisible(false);
        v575:SetCanFade(false);
        v139.ClippingShield.Parent = v575:GetGUI();
        v139.Shield.Parent.ClipsDescendants = false;
        v139.VRShield.Visible = true;
        v139:HideShield();
        v571 = v139.SettingsShowSignal:connect(function(v576) --[[ Line: 3856 ]]
            -- upvalues: v575 (copy), l_VRHub_1 (copy)
            if v576 then
                v575:SetVisible(true);
                l_VRHub_1:FireModuleOpened("SettingsMenu");
                return;
            else
                v575:SetVisible(false);
                l_VRHub_1:FireModuleClosed("SettingsMenu");
                return;
            end;
        end);
        l_VRHub_1.ModuleOpened.Event:connect(function(v577) --[[ Line: 3868 ]]
            -- upvalues: v139 (ref)
            if v577 ~= "SettingsMenu" then
                v139:SetVisibility(false);
            end;
        end);
    end;
    local function v579() --[[ Line: 3874 ]] --[[ Name: disableVR ]]
        -- upvalues: v139 (copy), l_RobloxGui_0 (ref), v571 (ref), v572 (ref), l_CorePackages_0 (ref)
        v139.ClippingShield.Parent = l_RobloxGui_0;
        v139.Shield.Parent.ClipsDescendants = true;
        v139.VRShield.Visible = false;
        v139:ShowShield();
        if v571 then
            v571:disconnect();
            v571 = nil;
        end;
        if v572 then
            v572:disconnect();
            v572 = nil;
        end;
        require(l_CorePackages_0.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetVisible(false);
    end;
    local function _() --[[ Line: 3894 ]] --[[ Name: refreshForSpatialUI ]]
        -- upvalues: v382 (copy), v139 (copy), v50 (ref), l_GuiService_0 (ref), v362 (copy)
        v382();
        v139.MenuContainer.BackgroundTransparency = v50.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency;
        v362();
    end;
    local function v582(v581) --[[ Line: 3900 ]] --[[ Name: OnVREnabled ]]
        -- upvalues: l_UserInputService_0 (ref), v60 (ref), v139 (copy), v382 (copy), v50 (ref), l_GuiService_0 (ref), v362 (copy), v578 (copy), v579 (copy)
        if v581 == "VREnabled" then
            if l_UserInputService_0.VREnabled then
                if v60.isInExperienceUIVREnabled then
                    v139.SettingsUIDelegate:enableVR();
                    v382();
                    v139.MenuContainer.BackgroundTransparency = v50.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency;
                    v362();
                    return;
                else
                    v578();
                    return;
                end;
            elseif v60.isInExperienceUIVREnabled then
                v139.SettingsUIDelegate:disableVR();
                v382();
                v139.MenuContainer.BackgroundTransparency = v50.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency;
                v362();
                return;
            else
                v579();
            end;
        end;
    end;
    l_UserInputService_0.Changed:connect(v582);
    v582("VREnabled");
    v139.ResetCharacterPage:SetHub(v139);
    if l_InExperienceCapabilities_0.canNavigateHome then
        v139.LeaveGamePage:SetHub(v139);
    end;
    if v60.GetFFlagEnableLeaveGameUpsellEntrypoint() then
        v139.LeaveGameUpsellPage:SetHub(v139);
    end;
    v139.GameSettingsPage = require(l_RobloxGui_0.Modules.Settings.Pages.GameSettingsWrapper);
    v139.GameSettingsPage:SetHub(v139);
    v139.ReportAbusePage = require(l_RobloxGui_0.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage);
    v139.ReportAbusePage:SetHub(v139);
    if v60.GetFFlagAbuseReportEnableReportSentPage() then
        v139.ReportSentPage = require(l_RobloxGui_0.Modules.Settings.Pages.ReportSentPage);
        v139.ReportSentPage:SetHub(v139);
    end;
    v139.ReportSentPageV2 = require(l_RobloxGui_0.Modules.Settings.Pages.ReportSentPageV2);
    v139.ReportSentPageV2:SetHub(v139);
    v139.HelpPage = require(l_RobloxGui_0.Modules.Settings.Pages.HelpWrapper);
    v139.HelpPage:SetHub(v139);
    if v60.FFlagHelpPageIXPExposure then
        v139.HelpPageIXPFetched = false;
    end;
    if not v60.FFlagRemoveRecordPage then
        local v583 = not v26:IsSubjectToChinaPolicies();
        if l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows and v583 then
            v139.RecordPage = require(l_RobloxGui_0.Modules.Settings.Pages.Record);
            v139.RecordPage:SetHub(v139);
        end;
    end;
    if l_InExperienceCapabilities_0.canListPeopleInSameServer then
        v139.PlayersPage = require(l_RobloxGui_0.Modules.Settings.Pages.PeopleWrapper);
        v139.PlayersPage:SetHub(v139);
        if not v60.FFlagMenuButtonsMountWithIEM and v60.FFlagRelocateMobileMenuButtons and v60.FIntRelocateMobileMenuButtonsVariant == 2 and v24:IsSmallTouchScreen() then
            v139.PlayersPage:CreateMenuButtonsContainer();
        end;
    end;
    if v60.FFlagAddIEMProfilePage then
        v139.PlayerProfilePage = require(l_RobloxGui_0.Modules.Settings.Pages.PlayerProfile);
    end;
    if l_isSubjectToDesktopPolicies_0() then
        v139.ExitModalPage = require(l_RobloxGui_0.Modules.Settings.Pages.ExitModal);
        v139.ExitModalPage:SetHub(v139);
    end;
    if l_isSubjectToDesktopPolicies_0() and l_InExperienceCapabilities_0.canNavigateHome then
        v139.LeaveGameToHomePage = require(l_RobloxGui_0.Modules.Settings.Pages.LeaveGameToHome);
        v139.LeaveGameToHomePage:SetHub(v139);
    end;
    if not v10 and v129({
        "Roact", 
        "Rodux", 
        "RoactRodux"
    }) then
        local l_CorePackages_2 = game:GetService("CorePackages");
        local l_EventStream_0 = require(l_CorePackages_2.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
        local l_Diag_0 = require(l_CorePackages_2.Workspace.Packages.Analytics).AnalyticsReporters.Diag;
        local v587 = l_EventStream_0.new(l_RbxAnalyticsService_0);
        local v588 = l_GameInviteAnalytics_0.new():withEventStream(v587):withDiag(l_Diag_0.new(l_RbxAnalyticsService_0)):withButtonName(l_GameInviteAnalytics_0.ButtonName.SettingsHub);
        v139.ShareGameApp = require(l_RobloxGui_0.Modules.Settings.ShareGameMaster).createApp(v139.PageViewClipper, v588);
        v139.ShareGamePage = require(l_RobloxGui_0.Modules.Settings.Pages.ShareGamePlaceholderPage);
        v139.ShareGamePage:ConnectHubToApp(v139, v139.ShareGameApp);
        v139:AddPage(v139.ShareGamePage);
    end;
    local v589 = l_CapturesPolicy_0.PolicyImplementation.read();
    local v590 = if v589 then l_CapturesPolicy_0.Mapper(v589).eligibleForCapturesFeature() else false;
    local v591 = v60.isInExperienceUIVREnabled and v60.FFlagFixSpatialUICaptures;
    if v590 and (not v591 or not l_isSpatial_0()) then
        local v592 = require(l_RobloxGui_0.Modules.Settings.Pages.CapturesPageWrapper);
        local function v593() --[[ Line: 4025 ]] --[[ Name: closeSettingsMenu ]]
            -- upvalues: v139 (copy)
            v139:SetVisibility(false, true);
        end;
        v139.CapturesApp = v100;
        v139.CapturesApp.mountMenuPage(v592.Page, v593, v60.ChromeEnabled);
        v139.CapturesPage = v592;
        v139.CapturesPage:ConnectHubToApp(v139, v139.PageViewClipper, v139.CapturesApp);
    end;
    if v139.PlayersPage then
        v139:AddPage(v139.PlayersPage);
    end;
    v139:AddPage(v139.ResetCharacterPage);
    if v139.LeaveGamePage then
        v139:AddPage(v139.LeaveGamePage);
    end;
    if v60.GetFFlagEnableLeaveGameUpsellEntrypoint() and v139.LeaveGameUpsellPage then
        v139:AddPage(v139.LeaveGameUpsellPage);
    end;
    v139:AddPage(v139.GameSettingsPage);
    if v139.CapturesPage then
        v139:AddPage(v139.CapturesPage);
    end;
    if v139.ReportAbusePage then
        v139:AddPage(v139.ReportAbusePage);
    end;
    if v139.ReportSentPage then
        v139:AddPage(v139.ReportSentPage);
    end;
    if v139.ReportSentPageV2 then
        v139:AddPage(v139.ReportSentPageV2);
    end;
    v139:AddPage(v139.HelpPage);
    if not v60.FFlagRemoveRecordPage and v139.RecordPage and not v139.CapturesPage then
        v139:AddPage(v139.RecordPage);
    end;
    if v139.ExitModalPage then
        v139:AddPage(v139.ExitModalPage);
    end;
    if v139.LeaveGameToHomePage then
        v139:AddPage(v139.LeaveGameToHomePage);
    end;
    v139:InitInPage(v139:GetFirstPageWithTabHeader());
    if not v60.isNewInGameMenuEnabled() and (not v60.FFlagAddUILessMode or v60.FIntAddUILessModeVariant == 0) then
        l_ContextActionService_0:BindCoreAction("RBXEscapeMainMenu", function(_, v595, _) --[[ Line: 4086 ]]
            -- upvalues: v60 (ref), v139 (copy), l_Constants_0 (ref)
            if v595 ~= Enum.UserInputState.Begin then
                return;
            elseif v60.FFlagAddUILessMode then
                v139:PopMenu(false, true, l_Constants_0.AnalyticsMenuOpenTypes.Keyboard);
                return;
            else
                v139:PopMenu(false, true);
                return;
            end;
        end, false, Enum.KeyCode.Escape);
    end;
    l_GuiService_0.ShowLeaveConfirmation:connect(function() --[[ Line: 4101 ]]
        -- upvalues: v139 (copy), l_Constants_0 (ref)
        if #v139.MenuStack == 0 then
            v139:SetVisibility(true, nil, nil, nil, l_Constants_0.AnalyticsMenuOpenTypes.GamepadLeaveGame);
            v139:SwitchToPage(v139:GetFirstPageWithTabHeader(), nil, 1);
            return;
        else
            v139:PopMenu(false, true);
            return;
        end;
    end);
    l_ContextActionService_0:BindCoreAction("Open Dev Console", v391, false, Enum.KeyCode.F9);
    l_ContextActionService_0:BindCoreAction("Show Quick Profiler", v387, false, Enum.KeyCode.F7);
    l_UserInputService_0.InputBegan:connect(function(v597) --[[ Line: 4127 ]]
        -- upvalues: v139 (copy), l_GuiService_0 (ref)
        if (v597.KeyCode == Enum.KeyCode.Left or v597.KeyCode == Enum.KeyCode.Right or v597.KeyCode == Enum.KeyCode.Up or v597.KeyCode == Enum.KeyCode.Down) and v139.Visible and v139.Active and v139.Pages.CurrentPage and l_GuiService_0.SelectedCoreObject == nil then
            v139.Pages.CurrentPage:SelectARow();
        end;
    end);
    if v139.ExitModalPage then
        local function v598() --[[ Line: 4141 ]] --[[ Name: showExitModal ]]
            -- upvalues: v139 (copy), v167 (copy)
            v139.HubBar.Visible = false;
            v167();
            if v139:GetVisibility() then
                v139:AddToMenuStack(v139.Pages.CurrentPage);
                v139:SwitchToPage(v139.ExitModalPage, nil, 1, true);
                return;
            else
                v139:SetVisibility(true, nil, v139.ExitModalPage, false);
                return;
            end;
        end;
        local l_v598_0 = v598 --[[ copy: 59 -> 63 ]];
        local function v600() --[[ Line: 4151 ]] --[[ Name: handleNativeExit ]]
            -- upvalues: v139 (copy), v60 (ref), v27 (ref), v254 (copy), l_v598_0 (copy)
            if v139:GetVisibility() and v139.Pages.CurrentPage == v139.ExitModalPage then
                if v60.FFlagEnableInGameMenuDurationLogger then
                    v27.leavingGame();
                end;
                if v60.FFlagRelocateMobileMenuButtons and v60.FIntRelocateMobileMenuButtonsVariant ~= 0 then
                    v254();
                    if v60.FFlagMenuButtonsMountWithIEM and v60.FIntRelocateMobileMenuButtonsVariant == 2 and v139.PlayersPage then
                        v139.PlayersPage:UnmountMenuButtonsContainer();
                    end;
                end;
                v139.ExitModalPage.LeaveAppFunc(true);
                return;
            else
                l_v598_0();
                return;
            end;
        end;
        game:GetService("GuiService").NativeClose:Connect(v600);
        if v139.FullScreenTitleBar then
            v139.FullScreenTitleBar = v87.update(v139.FullScreenTitleBar, {
                onClose = v600
            });
        end;
    end;
    if v60.GetFFlagEnableAppChatInExperience() then
        local v601 = nil;
        do
            local l_v601_0 = v601;
            v139.SettingsShowSignal:connect(function(v603) --[[ Line: 4180 ]]
                -- upvalues: l_v601_0 (ref), l_InExperienceAppChatModal_0 (ref), v139 (copy)
                if v603 then
                    l_v601_0 = l_InExperienceAppChatModal_0.default.visibilitySignal.Event:Connect(function(v604) --[[ Line: 4182 ]]
                        -- upvalues: v139 (ref)
                        if v604 and v139.Visible then
                            v139:SetVisibility(false, true);
                        end;
                    end);
                    return;
                else
                    if l_v601_0 then
                        l_v601_0:Disconnect();
                        l_v601_0 = nil;
                    end;
                    return;
                end;
            end);
        end;
    end;
    if v60.FFlagCreateInExperienceMenuReact then
        v139.InExperienceMenuReact = l_Create_0("Folder")({
            Name = "InExperienceMenuReact", 
            Parent = v139.ClippingShield
        });
        local l_ButtonsContainer_0 = v139.PlayersPage.ButtonsContainer;
        local v606 = if l_ButtonsContainer_0 then l_ButtonsContainer_0:FindFirstChild("LeaveButtonButton", true) else nil;
        local v607 = nil;
        if v60.FFlagAddTraversalHistory then
            v607 = v139.LeaveGameButton;
        end;
        local v608 = nil;
        if v60.FFlagTraversalPerfFixes then
            v608 = function(v609) --[[ Line: 4212 ]]
                -- upvalues: v14 (ref), v139 (copy), v43 (ref), v60 (ref), l_isSpatial_0 (ref), v19 (ref), l_TraversalHistoryMenu_0 (ref)
                local v610, v611 = v14.useState(v609.showSignal(false) and v139.Visible);
                v14.useEffect(function() --[[ Line: 4214 ]]
                    -- upvalues: v43 (ref), v611 (copy), v609 (copy), v139 (ref)
                    local v613 = v43.createEffect(function(v612) --[[ Line: 4215 ]]
                        -- upvalues: v611 (ref), v609 (ref), v139 (ref)
                        v611(v609.showSignal(v612) and v139.Visible);
                    end);
                    local v615 = v139.SettingsShowSignal:connect(function(v614) --[[ Line: 4218 ]]
                        -- upvalues: v611 (ref), v609 (ref)
                        v611(v609.showSignal(false) and v614);
                    end);
                    return function() --[[ Line: 4222 ]]
                        -- upvalues: v613 (copy), v615 (copy)
                        v613();
                        v615:Disconnect();
                    end;
                end, {});
                return v60.FFlagAddTraversalHistory and not (v60.isInExperienceUIVREnabled and l_isSpatial_0()) and v609.parent and v610 and v14.createElement(v19, {
                    parent = v609.parent
                }, {
                    TraversalHistoryMenu = v14.createElement(l_TraversalHistoryMenu_0, {
                        anchorParent = v609.parent, 
                        currentPageChangeSignal = v609.currentPageChangeSignal, 
                        menuSide = v609.menuSide
                    })
                });
            end;
        end;
        v15.createRoot(v139.InExperienceMenuReact):render(v14.createElement(v20, nil, {
            InExperienceMenuReactPage = v14.createElement(v21, {
                onMount = function() --[[ Line: 4244 ]] --[[ Name: onMount ]]
                    -- upvalues: v139 (copy)
                    v139:SwitchToReactPage(nil, nil, true);
                end, 
                onUnmount = function() --[[ Line: 4245 ]] --[[ Name: onUnmount ]]
                    -- upvalues: v139 (copy), v22 (ref)
                    v139:CloseReactPage();
                    v22(false).setCurrentReactPage(nil);
                end, 
                mountTo = v139.ReactPage
            }), 
            TraversalHistoryMenuBottomBar = if v60.FFlagTraversalPerfFixes then v14.createElement(v608, {
                showSignal = v139.showBottomBarSignal, 
                parent = v607, 
                menuSide = v16.Enums.PopoverSide.Top, 
                currentPageChangeSignal = v139.CurrentPageSignal
            }) else v60.FFlagAddTraversalHistory and not (v60.isInExperienceUIVREnabled and l_isSpatial_0()) and v607 and v14.createElement(v19, {
                parent = v607
            }, {
                TraversalHistoryMenu = v14.createElement(l_TraversalHistoryMenu_0, {
                    anchorParent = v607, 
                    idleButtonStateIsDown = true, 
                    currentPageChangeSignal = v139.CurrentPageSignal
                })
            }), 
            TraversalHistoryMenuMobileButton = if v60.FFlagTraversalPerfFixes then v14.createElement(v608, {
                showSignal = v43.createComputed(function(v616) --[[ Line: 4267 ]]
                    -- upvalues: v139 (copy)
                    return not v139.showBottomBarSignal(v616);
                end), 
                parent = v606, 
                menuSide = v16.Enums.PopoverSide.Bottom, 
                currentPageChangeSignal = v139.CurrentPageSignal
            }) else v60.FFlagAddTraversalHistory and not (v60.isInExperienceUIVREnabled and l_isSpatial_0()) and v606 and v14.createElement(v19, {
                parent = v606
            }, {
                TraversalHistoryMenu = v14.createElement(l_TraversalHistoryMenu_0, {
                    anchorParent = v606, 
                    idleButtonStateIsDown = v60.FFlagTraversalLeaveArrowDown and true or false, 
                    currentPageChangeSignal = v139.CurrentPageSignal
                })
            })
        }));
    end;
    return v139;
end;
local v618 = {
    ModuleName = "SettingsMenu", 
    KeepVRTopbarOpen = true, 
    VRIsExclusive = true, 
    VRClosesNonExclusive = true, 
    SetVisibility = nil
};
l_VRHub_0:RegisterModule(v618);
l_VRHub_0.ModuleOpened.Event:connect(function(v619) --[[ Line: 4301 ]]
    -- upvalues: v618 (copy), l_VRHub_0 (copy)
    if v619 ~= v618.ModuleName and l_VRHub_0:GetModule(v619).VRIsExclusive then
        v618:SetVisibility(false);
    end;
end);
local v620 = v617();
v618.GetExperienceControlStore = function(_) --[[ Line: 4312 ]] --[[ Name: GetExperienceControlStore ]]
    -- upvalues: v620 (copy)
    return v620:GetExperienceControlStore();
end;
v618.SetVisibility = function(_, v623, v624, v625, v626, v627) --[[ Line: 4316 ]] --[[ Name: SetVisibility ]]
    -- upvalues: v620 (copy)
    v620:SetVisibility(v623, v624, v625, v626, v627);
end;
v618.SetBackgroundVisibility = function(_, v629, v630) --[[ Line: 4320 ]] --[[ Name: SetBackgroundVisibility ]]
    -- upvalues: v620 (copy)
    v620:SetBackgroundVisibility(v629, v630);
end;
v618.ToggleVisibility = function(_, v632, v633) --[[ Line: 4324 ]] --[[ Name: ToggleVisibility ]]
    -- upvalues: v620 (copy)
    v620:ToggleVisibility(v632, v633);
end;
v618.SwitchToPage = function(_, v635, v636) --[[ Line: 4328 ]] --[[ Name: SwitchToPage ]]
    -- upvalues: v620 (copy)
    v620:SwitchToPage(v635, v636, 1);
end;
if v60.FFlagAddUILessMode and v60.FIntAddUILessModeVariant ~= 0 then
    v618.PopMenu = function(_, v638, v639, v640) --[[ Line: 4333 ]] --[[ Name: PopMenu ]]
        -- upvalues: v620 (copy)
        return v620:PopMenu(v638, v639, v640);
    end;
end;
v618.GetVisibility = function(_) --[[ Line: 4338 ]] --[[ Name: GetVisibility ]]
    -- upvalues: v620 (copy)
    return v620.Visible;
end;
v618.ShowShield = function(_) --[[ Line: 4342 ]] --[[ Name: ShowShield ]]
    -- upvalues: v620 (copy)
    v620:ShowShield();
end;
v618.HideShield = function(_) --[[ Line: 4346 ]] --[[ Name: HideShield ]]
    -- upvalues: v620 (copy)
    v620:HideShield();
end;
v618.GetRespawnBehaviour = function(_) --[[ Line: 4350 ]] --[[ Name: GetRespawnBehaviour ]]
    -- upvalues: v620 (copy)
    return v620:GetRespawnBehaviour();
end;
v618.CloseReactPage = function(_) --[[ Line: 4354 ]] --[[ Name: CloseReactPage ]]
    -- upvalues: v620 (copy)
    v620:CloseReactPage();
end;
v618.SwitchToReactPage = function(_, v647, v648, v649) --[[ Line: 4358 ]] --[[ Name: SwitchToReactPage ]]
    -- upvalues: v620 (copy)
    v620:SwitchToReactPage(v647, v648, v649);
end;
v618.RespawnBehaviourChangedEvent = v620.RespawnBehaviourChangedEvent;
v618.SettingsShowSignal = v620.SettingsShowSignal;
v618.CurrentPageSignal = v620.CurrentPageSignal;
v618.SettingsShowEvent = Instance.new("BindableEvent");
v620.SettingsShowSignal:connect(function(v650) --[[ Line: 4370 ]]
    -- upvalues: v618 (copy)
    v618.SettingsShowEvent:Fire(v650);
end);
v618.Instance = v620;
return v618;