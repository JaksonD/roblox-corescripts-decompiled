local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagEnableNewBackpack_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack;
local v4 = if l_FFlagEnableNewBackpack_0 then require(l_CorePackages_0.Workspace.Packages.System).Features else nil;
local l_Symbol_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Symbol;
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_IXPService_0 = game:GetService("IXPService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_game_EngineFeature_0 = game:GetEngineFeature("DeprecateOldGuiObjectProperties");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v13 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v14 = require(l_CorePackages_0.Packages.Roact);
local v15 = require(l_CorePackages_0.Packages.Cryo);
local v16 = require(l_CorePackages_0.Packages.Otter);
local v17 = require(l_CorePackages_0.Packages.React);
local v18 = require(l_CorePackages_0.Packages.ReactRoblox);
local v19 = require(l_CorePackages_0.Packages.Foundation);
local l_FoundationProvider_0 = v19.FoundationProvider;
local l_Traversal_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).Traversal;
local v22 = require(script.Parent.Components.PortalWithFoundationStylelink);
local v23 = require(script.Parent.InExperienceMenuReact);
local v24 = require(script.Parent.Pages.InExperienceMenuReactPage);
local v25 = require(script.Parent.ReactPageSignal);
local v26 = require(script.Parent.Integrations.Utils);
local v27 = require(l_RobloxGui_0.Modules.Settings.Utility);
local l_VRHub_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRHub;
local v29 = require(l_CorePackages_0.Workspace.Packages.CachedPolicyService);
local v30 = require(l_RobloxGui_0.Modules.Common.PerfUtils);
local l_MouseIconOverrideService_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService;
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local l_SwitchTabHint_0 = require(l_RobloxGui_0.Modules.Settings.Components.TabHeader).SwitchTabHint;
local l_TraversalHistoryMenu_0 = require(l_RobloxGui_0.Modules.Settings.Components.Traversal).TraversalHistoryMenu;
local v35 = require(l_RobloxGui_0.Modules.Settings.Components.MenuBackButton);
local v36 = require(l_RobloxGui_0.Modules.Settings.Components.MenuFrontButton);
local v37 = require(l_RobloxGui_0.Modules.Settings.Components.MenuButtons.MenuButtonsContainer);
local v38 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_CapturesPolicy_0 = require(l_CorePackages_0.Workspace.Packages.CapturesInExperience).CapturesPolicy;
local l_InExperienceCapabilities_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities;
local v43 = require(l_CoreGui_0.RobloxGui.Modules.Settings.getCamMicPermissions);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local l_Stores_0 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon).Stores;
local v46 = require(l_CorePackages_0.Packages.Signals);
local l_createSignal_0 = v46.createSignal;
local l_AppStyleProvider_0 = require(l_CorePackages_0.Packages.UIBlox).App.Style.AppStyleProvider;
local l_Dark_0 = require(l_CorePackages_0.Packages.UIBlox).App.Style.Constants.ThemeName.Dark;
local v50 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local v52 = require(l_CorePackages_0.Workspace.Packages.HelpPage);
local v53 = require(script.Parent.Theme);
local v54 = v53.color("SETTINGS_SHIELD", Color3.new(0.1607843137254902, 0.1607843137254902, 0.1607843137254902));
local v55 = v53.transparency("SETTINGS_SHIELD_TRANSPARENCY", 0.2);
local l_SHIELD_INACTIVE_POSITION_0 = v53.SHIELD_INACTIVE_POSITION;
local v57 = l_Symbol_0.named("SettingsHubCursorOverride");
local v58 = v13 and 32 or v27:IsSmallTouchScreen() and 24 or 26;
local v59 = game:DefineFastInt("CheckLeaveGameUpsellCooldown", 300);
local v60 = game:DefineFastInt("GetServerChannelRetries", 10);
local v61 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v62 = require(script.Parent.Flags);
local v63 = {
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
    FFlagAddNewPlayerListMobileFocusNav = v50.Flags.FFlagAddNewPlayerListMobileFocusNav, 
    ChromeEnabled = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled(), 
    FFlagRespawnChromeShortcutTelemetry = require(l_RobloxGui_0.Modules.Chrome.Flags.FFlagRespawnChromeShortcutTelemetry), 
    FFlagLocalizeVersionLabels = settings():GetFFlag("LocalizeVersionLabels"), 
    isInExperienceUIVREnabled = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled, 
    InExperienceUIVRIXP = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP, 
    FFlagAddSwitchTabHintsToIEM = v61.FFlagAddSwitchTabHintsToIEM, 
    GetFStringGameInviteMenuLayer = v61.GetFStringGameInviteMenuLayer, 
    GetFFlagEnableAppChatInExperience = v61.GetFFlagEnableAppChatInExperience, 
    GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints = v61.GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints, 
    GetFFlagDisplayServerChannel = v61.GetFFlagDisplayServerChannel, 
    FFlagSettingsHubIndependentBackgroundVisibility = v61.getFFlagSettingsHubIndependentBackgroundVisibility(), 
    GetFFlagPackagifySettingsShowSignal = v61.GetFFlagPackagifySettingsShowSignal, 
    FFlagEnableConsoleExpControls = v61.FFlagEnableConsoleExpControls, 
    FFlagIEMFocusNavToButtons = v61.FFlagIEMFocusNavToButtons, 
    FFlagIEMTabFocusNav = v61.FFlagIEMTabFocusNav, 
    FFlagIEMFocusNavSupportNewButtons = v62.FFlagIEMFocusNavSupportNewButtons, 
    FFlagIEMResumeButtonPressBugfix = v61.FFlagIEMResumeButtonPressBugfix, 
    FFlagAddUILessMode = v61.FFlagAddUILessMode, 
    FIntAddUILessModeVariant = v61.FIntAddUILessModeVariant, 
    FFlagInExperienceReportClosingBugfix = v61.FFlagInExperienceReportClosingBugfix, 
    FFlagEnableSettingsHubUIDelegateRollout = v61.FFlagEnableSettingsHubUIDelegateRollout, 
    FFlagAddIEMProfilePage = v61.FFlagAddIEMProfilePage, 
    FFlagSetUnibarShortcutOnTopBarFocus = require(l_CorePackages_0.Workspace.Packages.Chrome).Flags.FFlagSetUnibarShortcutOnTopBarFocus, 
    FFlagAddTraversalBackButton = l_Traversal_0.Flags.FFlagAddTraversalBackButton, 
    FFlagAddTraversalHistory = l_Traversal_0.Flags.FFlagAddTraversalHistory, 
    FFlagTraversalLeaveArrowDown = l_Traversal_0.Flags.FFlagTraversalLeaveArrowDown, 
    FFlagTraversalPerfFixes = l_Traversal_0.Flags.FFlagTraversalPerfFixes, 
    FFlagCreateInExperienceMenuReact = v62.FFlagCreateInExperienceMenuReact, 
    FFlagFixFocusNavToButtonsWithIEMReact = game:DefineFastFlag("FixFocusNavToButtonsWithIEMReact", false), 
    FFlagEnableSystemScrimInSettingsHub = game:DefineFastFlag("EnableSystemScrimInSettingsHub", false), 
    FFlagHelpPageIXPExposure = v52.Flags.FFlagHelpPageIXPExposure, 
    FStringHelpPageIXPLayer = v52.Flags.FStringHelpPageIXPLayer, 
    FFlagMenuButtonsCheckVisibilityBeforeMount = true, 
    FFlagFixSpatialUICaptures = game:DefineFastFlag("FixSpatialUICaptures", false), 
    FFlagMenuButtonsSkipAnimation = game:DefineFastFlag("MenuButtonsSkipAnimation", false), 
    FFlagAddAbilityToDisableIGMScroll = v61.FFlagAddAbilityToDisableIGMScroll
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
local v77 = nil;
pcall(function() --[[ Line: 197 ]]
    -- upvalues: v77 (ref)
    v77 = game:GetService("PlatformService");
end);
local v78 = nil;
pcall(function() --[[ Line: 200 ]]
    -- upvalues: v78 (ref)
    v78 = game:GetService("PlatformFriendsService");
end);
local v79 = nil;
spawn(function() --[[ Line: 204 ]]
    -- upvalues: v79 (ref), l_RobloxReplicatedStorage_0 (copy)
    v79 = l_RobloxReplicatedStorage_0:WaitForChild("GetServerVersion", 1e999);
end);
local v80 = nil;
if v63.GetFFlagDisplayServerChannel() then
    spawn(function() --[[ Line: 210 ]]
        -- upvalues: v80 (ref), l_RobloxReplicatedStorage_0 (copy)
        v80 = l_RobloxReplicatedStorage_0:WaitForChild("GetServerChannel", 1e999);
    end);
end;
local v81 = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
local v84 = not string.find(l_BaseUrl_0, "www.roblox.com");
local v85 = require(l_RobloxGui_0.Modules.DevConsoleMaster);
local v86 = nil;
local v87 = false;
local v88 = nil;
local v89 = nil;
local v90 = require(l_RobloxGui_0.Modules.Settings.Components.SettingsFullScreenTitleBar);
local v91 = require(l_RobloxGui_0.Modules.Settings.Analytics.MenuLeaveGameTelemetryConfig);
local v92 = require(l_RobloxGui_0.Modules.Settings.Analytics.MenuResetCharacterTelemetryConfig);
local v93 = require(l_RobloxGui_0.Modules.Settings.Analytics.MenuResumeTelemetryConfig);
local v94 = require(l_RobloxGui_0.Modules.Settings.Analytics.ReactPageAnalytics);
local l_GameInviteAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteAnalytics;
local v96 = nil;
local v97 = nil;
local v98 = nil;
local v99 = nil;
if v63.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification() then
    v96 = require(l_CorePackages_0.Workspace.Packages.GameInvite);
    v97 = v96.GameInviteModalManager;
    v98 = v96.GameInviteInviteExperimentVariant;
    v99 = v96.GameInviteConstants;
end;
local v100 = require(l_RobloxGui_0.Modules.Captures.CapturesApp);
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v102 = v29:IsSubjectToChinaPolicies();
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v104 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v105 = game:DefineFastFlag("SettingsHubRaceConditionFix", false);
local v106 = game:DefineFastFlag("FixReportButtonCutOff", false);
local l_InExperienceAppChatModal_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).App.InExperienceAppChatModal;
local v108 = if v63.GetFFlagPackagifySettingsShowSignal() then require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal else nil;
local v109 = if v63.GetFFlagPackagifySettingsShowSignal() then require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).SettingsUtility else nil;
local v110 = {
    frequency = 4, 
    dampingRatio = 1
};
local _ = require(l_RobloxGui_0.Modules.Settings.ReactPageFactory);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local v113 = v63.FFlagLocalizeVersionLabels or v102;
local v114 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local function _(v115, v116) --[[ Line: 291 ]] --[[ Name: tryTranslate ]]
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
local function v129(v125) --[[ Line: 307 ]] --[[ Name: GetCorePackagesLoaded ]]
    local l_CorePackages_1 = game:GetService("CorePackages");
    for _, v128 in pairs(v125) do
        if not l_CorePackages_1:FindFirstChild(v128) then
            return false;
        end;
    end;
    return true;
end;
local function _() --[[ Line: 317 ]] --[[ Name: GetServerVersionBlocking ]]
    -- upvalues: v88 (ref), v79 (ref)
    if v88 then
        return v88;
    else
        if not v79 then
            repeat
                wait();
            until v79;
        end;
        v88 = v79:InvokeServer();
        return v88;
    end;
end;
local function v132() --[[ Line: 330 ]] --[[ Name: GetServerChannelBlocking ]]
    -- upvalues: v89 (ref), v60 (copy), v80 (ref)
    if v89 then
        return v89;
    else
        local l_v60_0 = v60;
        if not v80 then
            repeat
                task.wait();
                l_v60_0 = l_v60_0 - 1;
            until v80 or l_v60_0 == 0;
        end;
        if v80 then
            v89 = v80:InvokeServer();
        else
            warn("GetServerChannelRemote not available");
            v89 = "Unknown";
        end;
        return v89;
    end;
end;
local function _() --[[ Line: 351 ]] --[[ Name: GetPlaceVersionText ]]
    -- upvalues: v63 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy)
    if v63.GetFFlagRemoveAssetVersionEndpoint() then
        return game.PlaceVersion;
    else
        local l_PlaceVersion_0 = game.PlaceVersion;
        pcall(function() --[[ Line: 358 ]]
            -- upvalues: l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref), l_PlaceVersion_0 (ref)
            local l_l_HttpRbxApiService_0_Async_0 = l_HttpRbxApiService_0:GetAsync(string.format("assets/%d/versions", game.PlaceId));
            local l_VersionNumber_0 = l_HttpService_0:JSONDecode(l_l_HttpRbxApiService_0_Async_0)[1].VersionNumber;
            l_PlaceVersion_0 = string.format("%s (Latest: %d)", l_PlaceVersion_0, l_VersionNumber_0);
        end);
        return l_PlaceVersion_0;
    end;
end;
local function v138(v137) --[[ Line: 368 ]] --[[ Name: createReactPage ]]
    -- upvalues: l_Create_0 (copy), v63 (copy)
    return l_Create_0("Frame")({
        Name = "InExperienceMenuPage", 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(0, 0), 
        Visible = not v63.FFlagFixFocusNavToButtonsWithIEMReact and nil, 
        Parent = v137
    });
end;
local function v664() --[[ Line: 379 ]] --[[ Name: CreateSettingsHub ]]
    -- upvalues: v63 (copy), l_RobloxGui_0 (copy), v108 (copy), v27 (copy), v109 (copy), l_createSignal_0 (copy), v104 (copy), l_Stores_0 (copy), l_RbxAnalyticsService_0 (copy), v94 (copy), v138 (copy), v53 (copy), l_ContextActionService_0 (copy), l_LocalizationService_0 (copy), l_Localization_0 (copy), v13 (copy), l_Create_0 (copy), v81 (copy), l_UserInputService_0 (copy), l_l_UserInputService_0_Platform_0 (copy), l_default_0 (copy), v43 (copy), v16 (copy), v114 (copy), v105 (copy), l_StarterGui_0 (copy), l_TelemetryService_0 (copy), v91 (copy), v92 (copy), l_Constants_0 (copy), v93 (copy), v18 (copy), v17 (copy), v37 (copy), v62 (copy), v124 (copy), v123 (copy), l_SHIELD_INACTIVE_POSITION_0 (copy), v55 (copy), v54 (copy), v58 (copy), v113 (copy), v132 (copy), v88 (ref), v79 (ref), l_RunService_0 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy), v29 (copy), l_BaseUrl_0 (copy), v84 (copy), l_StarterPlayer_0 (copy), l_Players_0 (copy), l_GuiService_0 (copy), v14 (copy), v38 (copy), l_IXPService_0 (copy), l_AppStyleProvider_0 (copy), l_Dark_0 (copy), v35 (copy), v36 (copy), l_AppFonts_0 (copy), v110 (copy), l_CorePackages_0 (copy), l_InExperienceAppChatModal_0 (copy), l_InExperienceCapabilities_0 (copy), l_FoundationProvider_0 (copy), v19 (copy), v26 (copy), l_SwitchTabHint_0 (copy), l_isSubjectToDesktopPolicies_0 (copy), v90 (copy), l_VRService_0 (copy), l_GameSettings_0 (copy), v85 (copy), l_game_EngineFeature_0 (copy), v106 (copy), v15 (copy), l_IXPServiceWrapper_0 (copy), l_ExperienceMenuSessionManagerInstance_0 (copy), l_MouseIconOverrideService_0 (copy), v57 (copy), v59 (copy), l_TweenService_0 (copy), v30 (copy), v86 (ref), v120 (copy), l_FFlagEnableNewBackpack_0 (copy), v4 (copy), v87 (ref), v98 (ref), v78 (ref), v77 (ref), v97 (ref), v99 (ref), v25 (copy), v129 (copy), l_GameInviteAnalytics_0 (copy), l_CapturesPolicy_0 (copy), l_isSpatial_0 (copy), v100 (copy), v46 (copy), v22 (copy), l_TraversalHistoryMenu_0 (copy), v23 (copy), v24 (copy)
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
    if v63.EngineFeatureTeleportHistoryButtons then
        v139.FrontBarVisibleConnection = nil;
    end;
    v139.PreferredTransparencyChangedConnection = nil;
    v139.TabConnection = nil;
    if v63.FFlagAddNextUpContainer then
        v139.LeaveGamePage = require(l_RobloxGui_0.Modules.Settings.Pages.LeaveGameWithNextUp);
    else
        v139.LeaveGamePage = require(l_RobloxGui_0.Modules.Settings.Pages.LeaveGame);
    end;
    v139.LeaveGameUpsellPage = if v63.GetFFlagEnableLeaveGameUpsellEntrypoint() then require(l_RobloxGui_0.Modules.Settings.Pages.LeaveGameUpsell.LeaveGameUpsell) else nil;
    v139.ResetCharacterPage = require(l_RobloxGui_0.Modules.Settings.Pages.ResetCharacter);
    v139.SettingsShowSignal = if v63.GetFFlagPackagifySettingsShowSignal() then v108 else v27:CreateSignal();
    v139.CurrentPageSignal = if v63.GetFFlagPackagifySettingsShowSignal() then v109.CreateSignal() else v27:CreateSignal();
    local v140 = nil;
    local v141 = nil;
    if v63.FFlagTraversalPerfFixes then
        local v142, v143 = l_createSignal_0(false);
        v140 = v142;
        v141 = v143;
        v139.showBottomBarSignal = v140;
        v139.setShowBottomBarSignal = v141;
    end;
    v139.OpenStateChangedCount = 0;
    v139.BottomButtonFrame = nil;
    if v63.FFlagRelocateMobileMenuButtons then
        v139.addMenuKeyBindings = nil;
        v139.removeMenuKeyBindings = nil;
    end;
    if v63.FFlagIEMFocusNavSupportNewButtons then
        v139.ResumeMenuButton = nil;
    end;
    v139.hasMicPermissions = false;
    if v63.GetFFlagEnableLeaveGameUpsellEntrypoint() then
        v139.checkedUpsell = false;
        v139.leaveGameUpsellProp = v104.PHONE_UPSELL_VALUE_PROP.None;
        v139.sessionStartTime = os.time();
    end;
    v139.isFetchingMicPermissions = true;
    if v63.FFlagAddUILessMode and v63.FIntAddUILessModeVariant ~= 0 then
        v139.uiLessStore = l_Stores_0.GetUILessStore(false);
    end;
    v139.isMuted = nil;
    v139.lastVoiceRecordingIndicatorTextUpdated = nil;
    v139.playSessionId = "";
    if v63.EngineFeatureRbxAnalyticsServiceExposePlaySessionId then
        v139.playSessionId = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    v139.reactPageAnalytics = v94.new();
    local v144 = nil;
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    l_BindableEvent_0.Name = "PoppedMenu";
    v139.PoppedMenu = l_BindableEvent_0.Event;
    v139.ReactPage = nil;
    if v63.FFlagCreateInExperienceMenuReact then
        v139.ReactPage = v138();
    end;
    local function _(v146) --[[ Line: 454 ]] --[[ Name: shouldShowHubBar ]]
        -- upvalues: v139 (copy)
        return (v146 or v139.Pages.CurrentPage).ShouldShowBottomBar == true;
    end;
    local _ = function(v148) --[[ Line: 459 ]] --[[ Name: setTabHeaderSelection ]]
        -- upvalues: v63 (ref)
        if not v63.FFlagIEMTabFocusNav then
            return;
        else
            local l_v148_TabHeader_0 = v148:GetTabHeader();
            if not l_v148_TabHeader_0 then
                return;
            else
                for _, v151 in v148.FirstSelectableObjects do
                    v151.NextSelectionUp = l_v148_TabHeader_0;
                    l_v148_TabHeader_0.NextSelectionDown = v151;
                end;
                return;
            end;
        end;
    end;
    local _ = function() --[[ Line: 473 ]] --[[ Name: updateTabHeaderWrapping ]]
        -- upvalues: v63 (ref), v139 (copy)
        if not v63.FFlagIEMTabFocusNav then
            return;
        else
            for _, v154 in v139.TabHeaders do
                v154.NextSelectionLeft = nil;
                v154.NextSelectionRight = nil;
            end;
            local v155 = #v139.TabHeaders;
            if v155 < 2 then
                return;
            else
                v139.TabHeaders[1].NextSelectionLeft = v139.TabHeaders[v155];
                v139.TabHeaders[v155].NextSelectionRight = v139.TabHeaders[1];
                return;
            end;
        end;
    end;
    local function v173(v157) --[[ Line: 485 ]] --[[ Name: setBottomBarSelection ]]
        -- upvalues: v139 (copy), v63 (ref)
        if not v139.BottomButtonFrame and v63.FFlagIEMFocusNavToButtons and not v157 and (not v63.FFlagRelocateMobileMenuButtons or v63.FIntRelocateMobileMenuButtonsVariant == 0 or v63.FIntRelocateMobileMenuButtonsVariant == 2) then
            return;
        else
            if v139.ResumeButton then
                v157.PageNextSelectionDown = v139.ResumeButton;
            elseif v63.FFlagIEMFocusNavSupportNewButtons and v63.FIntRelocateMobileMenuButtonsVariant == 2 and v139.ResumeMenuButton then
                v157.PageNextSelectionDown = v139.ResumeMenuButton;
            end;
            if v63.FFlagIEMTabFocusNav and v139.BottomButtonFrame then
                local l_v157_TabHeader_0 = v157:GetTabHeader();
                local v159 = v139.ResumeButton or v139.ResumeMenuButton;
                if v159 then
                    for v160, _ in pairs(v139.Pages.PageTable) do
                        local l_v160_TabHeader_0 = v160:GetTabHeader();
                        if l_v160_TabHeader_0 then
                            l_v160_TabHeader_0.NextSelectionUp = v159;
                        end;
                    end;
                end;
                for _, v164 in v139.BottomButtonFrame:GetDescendants() do
                    if v164:IsA("GuiObject") and v164.Selectable then
                        v164.NextSelectionDown = l_v157_TabHeader_0;
                    end;
                end;
            end;
            for _, v166 in v157.LastSelectableObjects do
                v139.BottomButtonFrame.SelectionBehaviorUp = Enum.SelectionBehavior.Escape;
                v139.BottomButtonFrame.NextSelectionUp = v166;
                v166.NextSelectionDown = v157.PageNextSelectionDown;
                local l_LeaveGameButton_0 = v139.LeaveGameButton;
                if l_LeaveGameButton_0 then
                    l_LeaveGameButton_0.NextSelectionUp = v166;
                end;
                if v63.FFlagIEMFocusNavSupportNewButtons and v63.FIntRelocateMobileMenuButtonsVariant == 2 then
                    for _, v169 in v139.BottomButtonFrame:GetDescendants() do
                        if v169:IsA("GuiObject") and v169.Selectable then
                            v169.NextSelectionUp = v166;
                        end;
                    end;
                end;
            end;
            if #v157.LastSelectableObjects < 1 then
                v139.BottomButtonFrame.SelectionBehaviorUp = Enum.SelectionBehavior.Stop;
                v139.BottomButtonFrame.NextSelectionUp = nil;
                local l_LeaveGameButton_1 = v139.LeaveGameButton;
                if l_LeaveGameButton_1 then
                    l_LeaveGameButton_1.NextSelectionUp = nil;
                end;
                if v63.FFlagIEMFocusNavSupportNewButtons and v63.FIntRelocateMobileMenuButtonsVariant == 2 then
                    for _, v172 in v139.BottomButtonFrame:GetDescendants() do
                        if v172:IsA("GuiObject") and v172.Selectable then
                            v172.NextSelectionUp = if v63.FFlagIEMTabFocusNav then v157:GetTabHeader() else nil;
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
    local function v176(v174) --[[ Line: 554 ]] --[[ Name: shouldShowBottomBar ]]
        -- upvalues: v139 (copy), v63 (ref), v27 (ref), v53 (ref)
        v174 = v174 or v139.Pages.CurrentPage;
        if (not v63.FFlagRelocateMobileMenuButtons or v63.FIntRelocateMobileMenuButtonsVariant == 0 or v63.FIntRelocateMobileMenuButtonsVariant == 2) and (v27:IsPortrait() or v27:IsSmallTouchScreen()) and not v53.AlwaysShowBottomBar() then
            return false;
        else
            local v175 = false;
            if v174 ~= nil then
                v175 = v174.ShouldShowBottomBar == true;
            end;
            return v175;
        end;
    end;
    local function _(v177) --[[ Line: 568 ]] --[[ Name: shouldDisableDefaultScroll ]]
        -- upvalues: v139 (copy)
        v177 = v177 or v139.Pages.CurrentPage;
        local v178 = false;
        if v177 ~= nil then
            v178 = v177.ShouldDisableDefaultScroll == true;
        end;
        return v178;
    end;
    local function v184() --[[ Line: 573 ]] --[[ Name: setBottomBarBindings ]]
        -- upvalues: v139 (copy), v63 (ref), l_ContextActionService_0 (ref)
        if not v139.Visible then
            return;
        else
            if not v63.FFlagRelocateMobileMenuButtons or v63.FIntRelocateMobileMenuButtonsVariant == 0 then
                for v180 = 1, #v139.BottomBarButtons do
                    local v181 = v139.BottomBarButtons[v180];
                    local v182 = v181[1];
                    local v183 = v181[2];
                    l_ContextActionService_0:BindCoreAction(v182, v183[1], false, unpack(v183[2]));
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
    local function v190(v185) --[[ Line: 596 ]] --[[ Name: removeBottomBarBindings ]]
        -- upvalues: v63 (ref), v139 (copy), l_ContextActionService_0 (ref)
        if not v63.FFlagRelocateMobileMenuButtons or v63.FIntRelocateMobileMenuButtonsVariant == 0 then
            for _, v187 in pairs(v139.BottomBarButtons) do
                l_ContextActionService_0:UnbindCoreAction(v187[1]);
            end;
        elseif v139.removeMenuKeyBindings then
            v139.removeMenuKeyBindings();
        end;
        local l_OpenStateChangedCount_0 = v139.OpenStateChangedCount;
        local function v189() --[[ Line: 608 ]]
            -- upvalues: v139 (ref), l_OpenStateChangedCount_0 (copy)
            if v139.OpenStateChangedCount == l_OpenStateChangedCount_0 and v139.BottomButtonFrame then
                v139.BottomButtonFrame.Visible = false;
            end;
        end;
        if v185 then
            delay(v185, v189);
            return;
        else
            if v139.OpenStateChangedCount == l_OpenStateChangedCount_0 and v139.BottomButtonFrame then
                v139.BottomButtonFrame.Visible = false;
            end;
            return;
        end;
    end;
    local function _(v191, v192, v193) --[[ Line: 621 ]] --[[ Name: updateButtonPosition ]]
        -- upvalues: v63 (ref), v139 (copy)
        if not v63.FFlagRelocateMobileMenuButtons or v63.FIntRelocateMobileMenuButtonsVariant == 0 then
            local l_FirstChild_0 = v139.BottomButtonFrame:FindFirstChild(v191 .. "ButtonButton", true);
            if not l_FirstChild_0 then
                return;
            else
                l_FirstChild_0.Position = v192;
                l_FirstChild_0.Size = v193;
            end;
        end;
    end;
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v197 = l_Localization_0.new(l_RobloxLocaleId_0);
    local function v204() --[[ Line: 637 ]] --[[ Name: hideVoiceUx ]]
        -- upvalues: v139 (copy), v13 (ref), v53 (ref), v63 (ref)
        local l_MuteButtonButton_0 = v139.MuteButtonButton;
        if l_MuteButtonButton_0 then
            l_MuteButtonButton_0.Visible = false;
            l_MuteButtonButton_0:Destroy();
        end;
        local v199 = if v13 then UDim2.new(0, 320, 0, 72) else UDim2.new(0, 260, 0, v53.LargeButtonHeight);
        if not v63.FFlagRelocateMobileMenuButtons or v63.FIntRelocateMobileMenuButtonsVariant == 0 then
            local v200 = UDim2.new(0.5, v13 and -160 or -130, 0.5, -25);
            if not v63.FFlagRelocateMobileMenuButtons or v63.FIntRelocateMobileMenuButtonsVariant == 0 then
                local l_FirstChild_1 = v139.BottomButtonFrame:FindFirstChild("LeaveGameButtonButton", true);
                if l_FirstChild_1 then
                    l_FirstChild_1.Position = v200;
                    l_FirstChild_1.Size = v199;
                end;
            end;
            v200 = UDim2.new(0.5, v13 and -550 or -400, 0.5, -25);
            if not v63.FFlagRelocateMobileMenuButtons or v63.FIntRelocateMobileMenuButtonsVariant == 0 then
                local l_FirstChild_2 = v139.BottomButtonFrame:FindFirstChild("ResetCharacterButtonButton", true);
                if l_FirstChild_2 then
                    l_FirstChild_2.Position = v200;
                    l_FirstChild_2.Size = v199;
                end;
            end;
            v200 = UDim2.new(0.5, v13 and 200 or 140, 0.5, -25);
            if not v63.FFlagRelocateMobileMenuButtons or v63.FIntRelocateMobileMenuButtonsVariant == 0 then
                local l_FirstChild_3 = v139.BottomButtonFrame:FindFirstChild("ResumeButtonButton", true);
                if not l_FirstChild_3 then
                    return;
                else
                    l_FirstChild_3.Position = v200;
                    l_FirstChild_3.Size = v199;
                end;
            end;
        end;
    end;
    local function v225(v205, v206, v207, v208, v209, v210, v211, v212) --[[ Line: 653 ]] --[[ Name: addBottomBarButtonOld ]]
        -- upvalues: v63 (ref), v53 (ref), v13 (ref), v139 (copy), v27 (ref), l_Create_0 (ref), v81 (ref), l_UserInputService_0 (ref), l_l_UserInputService_0_Platform_0 (ref)
        if not v63.FFlagRelocateMobileMenuButtons or v63.FIntRelocateMobileMenuButtonsVariant == 0 then
            local v213 = v205 .. "Button";
            local v214 = v205 .. "Text";
            local v215 = UDim2.new(0, 260, 0, v53.LargeButtonHeight);
            if v13 then
                v215 = UDim2.new(0, 320, 0, 72);
            end;
            local l_v139_0 = v139;
            local l_v139_1 = v139;
            local v218, v219 = v27:MakeStyledButton(v205 .. "Button", v206, v215, v210, nil, v139);
            l_v139_0[v213] = v218;
            l_v139_1[v214] = v219;
            l_Create_0("UIListLayout")({
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Parent = v139[v213]
            });
            l_Create_0("UIPadding")({
                PaddingLeft = UDim.new(0.025, 0), 
                Parent = v139[v213]
            });
            v139[v214].Size = UDim2.new(0, 0, 1, 0);
            l_Create_0("UIFlexItem")({
                FlexMode = Enum.UIFlexMode.Grow, 
                Parent = v139[v214]
            });
            v139[v213].Position = v209;
            v139[v213].Parent = v139.BottomButtonFrame;
            if v13 then
                v139[v213].ImageTransparency = 1;
            end;
            v139[v214].FontSize = Enum.FontSize.Size24;
            l_v139_0 = nil;
            if not v81 then
                l_v139_1 = v205 .. "Hint";
                v218 = "";
                v218 = if not not l_UserInputService_0:GetGamepadConnected(Enum.UserInputType.Gamepad1) or l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne then v207 else v208;
                l_v139_0 = l_Create_0("ImageLabel")({
                    Name = l_v139_1, 
                    ZIndex = v139.Shield.ZIndex + 2, 
                    BackgroundTransparency = 1, 
                    Image = v218, 
                    LayoutOrder = -1, 
                    Parent = v139[v213]
                });
                if v218 == v208 then
                    l_v139_0.ImageColor3 = v53.color("WhiteButtonText", Color3.new(1, 1, 1));
                    l_v139_0.ImageTransparency = v53.transparency("WhiteButtonText", 1);
                end;
                l_v139_0.Position = UDim2.new(0, 9, 0.5, 0);
                l_v139_0.Size = UDim2.new(0, 33, 0, 33);
                l_v139_0.AnchorPoint = Vector2.new(0, 0.5);
            end;
            if v13 then
                v139[v214].FontSize = Enum.FontSize.Size36;
            end;
            do
                local l_l_v139_0_0 = l_v139_0;
                l_UserInputService_0.InputBegan:connect(function(v221) --[[ Line: 726 ]]
                    -- upvalues: l_l_v139_0_0 (ref), v207 (copy), v208 (copy)
                    if v221.UserInputType == Enum.UserInputType.Gamepad1 or v221.UserInputType == Enum.UserInputType.Gamepad2 or v221.UserInputType == Enum.UserInputType.Gamepad3 or v221.UserInputType == Enum.UserInputType.Gamepad4 then
                        if l_l_v139_0_0 then
                            l_l_v139_0_0.Image = v207;
                            return;
                        end;
                    elseif v221.UserInputType == Enum.UserInputType.Keyboard and l_l_v139_0_0 then
                        l_l_v139_0_0.Image = v208;
                    end;
                end);
                v139.BottomBarButtons[#v139.BottomBarButtons + 1] = {
                    v213, 
                    {
                        function(_, v223, _) --[[ Line: 749 ]]
                            -- upvalues: v212 (copy)
                            if v223 == Enum.UserInputState.Begin then
                                v212();
                            end;
                        end, 
                        v211
                    }
                };
            end;
        end;
    end;
    local v226 = "";
    if v13 then
        v226 = "@2x";
    end;
    local v227 = nil;
    local v228 = nil;
    local v229 = nil;
    if v63.FFlagEnableConsoleExpControls then
        v227 = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonB);
        v228 = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonX);
        v229 = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonY);
    else
        v227 = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB" .. v226 .. ".png";
        v228 = "rbxasset://textures/ui/Controls/DesignSystem/ButtonX" .. v226 .. ".png";
        v229 = "rbxasset://textures/ui/Controls/DesignSystem/ButtonY" .. v226 .. ".png";
    end;
    local l_l_UserInputService_0_ImageForKeyCode_0 = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonStart);
    local v231 = false;
    local v232 = nil;
    local function v247() --[[ Line: 783 ]] --[[ Name: setupVoiceListeners ]]
        -- upvalues: v231 (ref), v139 (copy), l_default_0 (ref), v43 (ref), v63 (ref), v232 (ref), v16 (ref), v114 (ref), v204 (copy)
        if game:GetEngineFeature("VoiceChatSupported") and not v231 then
            v231 = true;
            local function v245() --[[ Line: 788 ]] --[[ Name: showUI ]]
                -- upvalues: v139 (ref), l_default_0 (ref), v43 (ref), v63 (ref), v232 (ref), v16 (ref), v114 (ref)
                v139.VoiceRecordingText.Visible = true;
                l_default_0:getService().StateChanged:Connect(function(_, v234) --[[ Line: 791 ]]
                    -- upvalues: v139 (ref)
                    if v234 == Enum.VoiceChatState.Joined then
                        v139.VoiceRecordingText.Visible = true;
                    end;
                end);
                l_default_0:SetupParticipantListeners();
                v43(function(v235) --[[ Line: 798 ]]
                    -- upvalues: v139 (ref)
                    v139.hasMicPermissions = v235.hasMicPermissions;
                end, nil, true, "PermissionsButtons.getPermissions");
                if v63.GetFFlagMuteButtonRaceConditionFix() then
                    v232 = l_default_0.muteChanged.Event:Connect(function(v236) --[[ Line: 803 ]]
                        -- upvalues: v139 (ref), v16 (ref), v114 (ref)
                        v139.isMuted = v236;
                        v139.lastVoiceRecordingIndicatorTextUpdated = tick();
                        v139.voiceRecordingIndicatorTextMotor:setGoal(v16.instant(0));
                        if v139.isMuted then
                            local l_VoiceRecordingText_0 = v139.VoiceRecordingText;
                            local v238;
                            if not v114 then
                                v238 = "Mic Off";
                            else
                                local l_status_1, l_result_1 = pcall(v114.FormatByKey, v114, "InGame.CommonUI.Label.MicOff");
                                v238 = if l_status_1 then l_result_1 else "Mic Off";
                            end;
                            l_VoiceRecordingText_0.Text = v238;
                            return;
                        else
                            local l_VoiceRecordingText_1 = v139.VoiceRecordingText;
                            local v242;
                            if not v114 then
                                v242 = "Mic On (recording audio)";
                            else
                                local l_status_2, l_result_2 = pcall(v114.FormatByKey, v114, "InGame.CommonUI.Label.MicOnRecording");
                                v242 = if l_status_2 then l_result_2 else "Mic On (recording audio)";
                            end;
                            l_VoiceRecordingText_1.Text = v242;
                            return;
                        end;
                    end);
                end;
            end;
            local function v246() --[[ Line: 815 ]] --[[ Name: hideUI ]]
                -- upvalues: v139 (ref), v204 (ref), v232 (ref)
                v139.VoiceRecordingText.Visible = false;
                v204();
                if v232 then
                    v232:Disconnect();
                end;
            end;
            if l_default_0.voiceUIVisible then
                v245();
            end;
            l_default_0.showVoiceUI.Event:Connect(v245);
            l_default_0.hideVoiceUI.Event:Connect(v246);
        end;
    end;
    if not v105 then
        v247();
    end;
    local v248 = true;
    local function v252(v249) --[[ Line: 839 ]] --[[ Name: setResetEnabled ]]
        -- upvalues: v248 (ref), v139 (copy)
        v248 = v249;
        if v139.ResetCharacterButton then
            v139.ResetCharacterButton.Selectable = v249;
            v139.ResetCharacterButton.Active = v249;
            v139.ResetCharacterButton.Enabled.Value = v249;
            local l_ResetCharacterHint_0 = v139.ResetCharacterButton:FindFirstChild("ResetCharacterHint");
            if l_ResetCharacterHint_0 then
                l_ResetCharacterHint_0.ImageColor3 = v249 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100);
            end;
            local l_ResetCharacterButtonTextLabel_0 = v139.ResetCharacterButton:FindFirstChild("ResetCharacterButtonTextLabel");
            if l_ResetCharacterButtonTextLabel_0 then
                l_ResetCharacterButtonTextLabel_0.TextColor3 = v249 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100);
            end;
        end;
    end;
    local v253 = nil;
    v139.GetRespawnBehaviour = function(_) --[[ Line: 857 ]] --[[ Name: GetRespawnBehaviour ]]
        -- upvalues: v63 (ref), v139 (copy), v248 (ref), v253 (ref)
        if v63.FFlagRelocateMobileMenuButtons and v63.FIntRelocateMobileMenuButtonsVariant ~= 0 then
            return v139:GetExperienceControlStore().getCanRespawn(false), v139:GetExperienceControlStore().getCustomRespawnCallback(false);
        else
            return v248, v253;
        end;
    end;
    v139.RespawnBehaviourChangedEvent = Instance.new("BindableEvent");
    l_StarterGui_0:RegisterSetCore("ResetButtonCallback", function(v255) --[[ Line: 867 ]]
        -- upvalues: v139 (copy), v63 (ref), v248 (ref), v252 (copy), v253 (ref)
        local v256 = false;
        if typeof(v255) == "Instance" then
            v256 = v255:IsA("BindableEvent");
        end;
        if v256 or type(v255) == "boolean" then
            v139.ResetCharacterPage:SetResetCallback(v255);
        else
            warn("ResetButtonCallback must be set to a BindableEvent or a boolean");
        end;
        local v257 = if v63.FFlagRelocateMobileMenuButtons and v63.FIntRelocateMobileMenuButtonsVariant ~= 0 then v139:GetExperienceControlStore().getCanRespawn(false) else v248;
        if v255 == false then
            if v63.FFlagRelocateMobileMenuButtons and v63.FIntRelocateMobileMenuButtonsVariant ~= 0 then
                v139:GetExperienceControlStore().setCanRespawn(false);
            else
                v252(false);
            end;
        elseif not v257 and (v256 or v255 == true) then
            if v63.FFlagRelocateMobileMenuButtons and v63.FIntRelocateMobileMenuButtonsVariant ~= 0 then
                v139:GetExperienceControlStore().setCanRespawn(true);
            else
                v252(true);
            end;
        end;
        if v256 then
            if v63.FFlagRelocateMobileMenuButtons and v63.FIntRelocateMobileMenuButtonsVariant ~= 0 then
                v139:GetExperienceControlStore().setCustomRespawnCallback(v255);
            else
                v253 = v255;
            end;
        end;
        if v63.FFlagRelocateMobileMenuButtons and v63.FIntRelocateMobileMenuButtonsVariant ~= 0 then
            v139.RespawnBehaviourChangedEvent:Fire(v139:GetExperienceControlStore().getCanRespawn(false), v139:GetExperienceControlStore().getCustomRespawnCallback(false));
            return;
        else
            v139.RespawnBehaviourChangedEvent:Fire(v248, v253);
            return;
        end;
    end);
    l_StarterGui_0:RegisterGetCore("ResetButtonCallback", function() --[[ Line: 902 ]]
        -- upvalues: v139 (copy)
        local l_v139_RespawnBehaviour_0, _ = v139:GetRespawnBehaviour();
        return l_v139_RespawnBehaviour_0;
    end);
    local v260 = nil;
    local v261, v262 = l_createSignal_0(true);
    local v263, v264 = l_createSignal_0(nil);
    v139.GetExperienceControlStore = function(_) --[[ Line: 912 ]] --[[ Name: GetExperienceControlStore ]]
        -- upvalues: v262 (copy), v139 (copy), v261 (copy), v263 (copy), v264 (copy), v63 (ref), v104 (ref), l_TelemetryService_0 (ref), v91 (ref), v92 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), v93 (ref)
        local function v269(v266) --[[ Line: 913 ]]
            -- upvalues: v262 (ref), v139 (ref)
            v262(v266);
            if v139.ResetCharacterButton then
                v139.ResetCharacterButton.Selectable = v266;
                v139.ResetCharacterButton.Active = v266;
                v139.ResetCharacterButton.Enabled.Value = v266;
                local l_ResetCharacterHint_1 = v139.ResetCharacterButton:FindFirstChild("ResetCharacterHint");
                if l_ResetCharacterHint_1 then
                    l_ResetCharacterHint_1.ImageColor3 = v266 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100);
                end;
                local l_ResetCharacterButtonTextLabel_1 = v139.ResetCharacterButton:FindFirstChild("ResetCharacterButtonTextLabel");
                if l_ResetCharacterButtonTextLabel_1 then
                    l_ResetCharacterButtonTextLabel_1.TextColor3 = v266 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100);
                end;
            end;
        end;
        return {
            getCanRespawn = v261, 
            getCustomRespawnCallback = v263, 
            setCanRespawn = v269, 
            setCustomRespawnCallback = v264, 
            onLeaveGame = function(v270) --[[ Line: 935 ]] --[[ Name: onLeaveGame ]]
                -- upvalues: v139 (ref), v63 (ref), v104 (ref), l_TelemetryService_0 (ref), v91 (ref)
                if not v139:GetVisibility() then
                    return;
                else
                    v139:AddToMenuStack(v139.Pages.CurrentPage);
                    v139.HubBar.Visible = false;
                    if v63.GetFFlagEnableLeaveGameUpsellEntrypoint() and v139.leaveGameUpsellProp ~= v104.PHONE_UPSELL_VALUE_PROP.None then
                        v139:SwitchToPage(v139.LeaveGameUpsellPage, false);
                    else
                        v139:SwitchToPage(v139.LeaveGamePage, false, nil, v63.FFlagMenuButtonsSkipAnimation and true or nil);
                    end;
                    l_TelemetryService_0:LogCounter(v91, {
                        customFields = {
                            source = v270
                        }
                    });
                    return;
                end;
            end, 
            onRespawn = function(v271) --[[ Line: 954 ]] --[[ Name: onRespawn ]]
                -- upvalues: v261 (ref), v139 (ref), v63 (ref), l_TelemetryService_0 (ref), v92 (ref)
                if not v261(false) then
                    return;
                else
                    v139:AddToMenuStack(v139.Pages.CurrentPage);
                    v139.HubBar.Visible = false;
                    v139:SwitchToPage(v139.ResetCharacterPage, false, nil, v63.FFlagMenuButtonsSkipAnimation and true or nil);
                    l_TelemetryService_0:LogCounter(v92, {
                        customFields = {
                            source = v271
                        }
                    });
                    return;
                end;
            end, 
            onResume = function(v272) --[[ Line: 969 ]] --[[ Name: onResume ]]
                -- upvalues: v63 (ref), v139 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), l_TelemetryService_0 (ref), v93 (ref)
                if v63.FFlagAddUILessMode then
                    v139:SetVisibility(false, nil, nil, nil, v272);
                else
                    v139:SetVisibility(false);
                end;
                if v63.FFlagAddUILessMode and v63.FIntAddUILessModeVariant ~= 0 and v139.uiLessStore.getUILessModeEnabled(false) then
                    v139.uiLessStore.setUIVisible(false);
                end;
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsResumeGameName, l_Constants_0.AnalyticsMenuActionName, {
                    source = v272, 
                    playsessionid = v139.playSessionId, 
                    universeid = tostring(game.GameId)
                });
                l_TelemetryService_0:LogCounter(v93, {
                    customFields = {
                        source = v272
                    }
                });
            end
        };
    end;
    local v277 = v63.FFlagRelocateMobileMenuButtons and v63.FIntRelocateMobileMenuButtonsVariant ~= 0 and function() --[[ Line: 1001 ]]
        -- upvalues: v139 (copy), v18 (ref), v17 (ref), v37 (ref), v62 (ref), v63 (ref)
        if v139.BottomButtonFrameRoot then
            return;
        else
            local l_v139_ExperienceControlStore_0 = v139:GetExperienceControlStore();
            v139.BottomButtonFrameRoot = v18.createRoot(v139.BottomButtonFrame);
            v139.BottomButtonFrameRoot:render(v17.createElement(v37, {
                onLeaveGame = l_v139_ExperienceControlStore_0.onLeaveGame, 
                onRespawn = l_v139_ExperienceControlStore_0.onRespawn, 
                onResume = l_v139_ExperienceControlStore_0.onResume, 
                setAddMenuKeyBindings = function(v274) --[[ Line: 1013 ]] --[[ Name: setAddMenuKeyBindings ]]
                    -- upvalues: v139 (ref)
                    v139.addMenuKeyBindings = v274;
                end, 
                setRemoveMenuKeyBindings = function(v275) --[[ Line: 1017 ]] --[[ Name: setRemoveMenuKeyBindings ]]
                    -- upvalues: v139 (ref)
                    v139.removeMenuKeyBindings = v275;
                end, 
                getVisibility = function() --[[ Line: 1021 ]] --[[ Name: getVisibility ]]
                    -- upvalues: v139 (ref)
                    return v139.GetVisibility();
                end, 
                getCanRespawn = l_v139_ExperienceControlStore_0.getCanRespawn, 
                currentPageChangeSignal = if v62.FFlagAddTraversalHistoryReactMenuButtons then v139.CurrentPageSignal else nil, 
                setResumeMenuButton = v63.FFlagIEMFocusNavSupportNewButtons and function(v276) --[[ Line: 1026 ]]
                    -- upvalues: v139 (ref)
                    v139.ResumeMenuButton = v276;
                end or nil
            }));
            return;
        end;
    end or nil;
    local v278 = v63.FFlagRelocateMobileMenuButtons and v63.FIntRelocateMobileMenuButtonsVariant ~= 0 and function() --[[ Line: 1034 ]]
        -- upvalues: v139 (copy)
        if v139.BottomButtonFrameRoot then
            v139.BottomButtonFrameRoot:unmount();
            v139.BottomButtonFrameRoot = nil;
        end;
    end or nil;
    local function v379() --[[ Line: 1042 ]] --[[ Name: createGui ]]
        -- upvalues: v27 (ref), v139 (copy), l_Create_0 (ref), v124 (ref), v123 (ref), l_RobloxGui_0 (ref), l_SHIELD_INACTIVE_POSITION_0 (ref), v55 (ref), v54 (ref), v58 (ref), v63 (ref), v53 (ref), v13 (ref), v113 (ref), v114 (ref), v132 (ref), v88 (ref), v79 (ref), l_RunService_0 (ref), l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref), v29 (ref), l_BaseUrl_0 (ref), v84 (ref), l_StarterPlayer_0 (ref), l_Players_0 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), v138 (ref), l_GuiService_0 (ref), v43 (ref), l_default_0 (ref), v14 (ref), v38 (ref), l_IXPService_0 (ref), l_AppStyleProvider_0 (ref), l_Dark_0 (ref), v35 (ref), v36 (ref), l_AppFonts_0 (ref), v16 (ref), v110 (ref), l_UserInputService_0 (ref), v260 (ref), v277 (copy), l_CorePackages_0 (ref), l_InExperienceAppChatModal_0 (ref), v190 (copy), v104 (ref), l_InExperienceCapabilities_0 (ref), v225 (copy), v228 (ref), v248 (ref), v197 (copy), v229 (ref), l_l_UserInputService_0_ImageForKeyCode_0 (copy), v227 (ref), v18 (ref), v17 (ref), l_FoundationProvider_0 (ref), v19 (ref), v26 (ref), l_SwitchTabHint_0 (ref), l_isSubjectToDesktopPolicies_0 (ref), v90 (ref)
        local v279 = 0;
        if v27:IsSmallTouchScreen() then
            v279 = 5;
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
            BackgroundTransparency = v55, 
            BackgroundColor3 = v54, 
            BorderSizePixel = 0, 
            Visible = false, 
            Active = true, 
            ZIndex = 2, 
            Parent = v139.ClippingShield
        });
        v139.VRShield = l_Create_0("Frame")({
            Name = "VRBackground", 
            Parent = v139.Shield, 
            BackgroundColor3 = v54, 
            BackgroundTransparency = v55, 
            Position = UDim2.new(0, -4, 0, 24), 
            Size = UDim2.new(1, 8, 1, -40), 
            BorderSizePixel = 0, 
            Visible = false
        });
        local l_game_EngineFeature_1 = game:GetEngineFeature("CoreScriptVersionEnabled");
        if l_game_EngineFeature_1 then
            v139.VersionContainer = l_Create_0("ScrollingFrame")({
                Name = "VersionContainer", 
                Parent = v139.Shield, 
                CanvasSize = UDim2.new(0, 0, 0, v58), 
                BackgroundColor3 = v54, 
                BackgroundTransparency = v55, 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, 0, 0, v58), 
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
                BackgroundColor3 = v54, 
                BackgroundTransparency = v55, 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, 0, 0, v58), 
                AnchorPoint = Vector2.new(0, 1), 
                BorderSizePixel = 0, 
                AutoLocalize = false, 
                ZIndex = 5, 
                Visible = false
            });
        end;
        local v281 = l_Create_0("UIListLayout")({
            Name = "VersionContainer", 
            Parent = v139.VersionContainer, 
            Padding = UDim.new(0, 6), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        });
        local function _(v282) --[[ Line: 1152 ]] --[[ Name: addSizeToLabel ]]
            -- upvalues: l_game_EngineFeature_1 (copy), v58 (ref)
            local v283 = UDim2.new(0.2, -6, 1, 0);
            v282.Size = l_game_EngineFeature_1 and UDim2.new(0, v282.TextBounds.X + 6, 0, v58) or v283;
        end;
        if v63.GetFFlagDisplayServerChannel() then
            v139.ServerChannelLabel = l_Create_0("TextLabel")({
                Name = "ServerChannelLabel", 
                Parent = v139.VersionContainer, 
                LayoutOrder = 3, 
                BackgroundTransparency = 1, 
                TextColor3 = Color3.new(1, 1, 1), 
                TextSize = v53.textSize(v13 and 28 or v27:IsSmallTouchScreen() and 14 or 20), 
                Text = "Server Channel: ...", 
                Font = v53.font(Enum.Font.SourceSans, "SettingsHub"), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 5
            });
            spawn(function() --[[ Line: 1171 ]]
                -- upvalues: v113 (ref), v114 (ref), v139 (ref), v132 (ref), l_game_EngineFeature_1 (copy), v58 (ref)
                local v285 = "Server Channel: ";
                if v113 then
                    if not v114 then
                        v285 = "Server Channel: ";
                    else
                        local l_status_3, l_result_3 = pcall(v114.FormatByKey, v114, "InGame.HelpMenu.Label.ServerChannel");
                        v285 = if l_status_3 then l_result_3 else "Server Channel: ";
                    end;
                end;
                v139.ServerChannelLabel.Text = v285 .. v132();
                local l_ServerChannelLabel_0 = v139.ServerChannelLabel;
                local v289 = UDim2.new(0.2, -6, 1, 0);
                l_ServerChannelLabel_0.Size = l_game_EngineFeature_1 and UDim2.new(0, l_ServerChannelLabel_0.TextBounds.X + 6, 0, v58) or v289;
                v139.ServerChannelLabel.TextScaled = not (l_game_EngineFeature_1 or v139.ServerChannelLabel.TextFits);
            end);
        end;
        v139.ServerVersionLabel = l_Create_0("TextLabel")({
            Name = "ServerVersionLabel", 
            Parent = v139.VersionContainer, 
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            TextColor3 = Color3.new(1, 1, 1), 
            TextSize = v53.textSize(v13 and 28 or v27:IsSmallTouchScreen() and 14 or 20), 
            Text = "Server Version: ...", 
            Font = v53.font(Enum.Font.SourceSans, "SettingsHub"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 5
        });
        spawn(function() --[[ Line: 1195 ]]
            -- upvalues: v113 (ref), v114 (ref), v139 (ref), v88 (ref), v79 (ref), l_game_EngineFeature_1 (copy), v58 (ref)
            local v290 = "Server Version: ";
            if v113 then
                if not v114 then
                    v290 = "Server Version: ";
                else
                    local l_status_4, l_result_4 = pcall(v114.FormatByKey, v114, "InGame.HelpMenu.Label.ServerVersion");
                    v290 = if l_status_4 then l_result_4 else "Server Version: ";
                end;
            end;
            local l_ServerVersionLabel_0 = v139.ServerVersionLabel;
            local l_v290_0 = v290;
            local v295;
            if v88 then
                v295 = v88;
            else
                if not v79 then
                    repeat
                        wait();
                    until v79;
                end;
                v88 = v79:InvokeServer();
                v295 = v88;
            end;
            l_ServerVersionLabel_0.Text = l_v290_0 .. v295;
            l_ServerVersionLabel_0 = v139.ServerVersionLabel;
            local v296 = UDim2.new(0.2, -6, 1, 0);
            l_ServerVersionLabel_0.Size = l_game_EngineFeature_1 and UDim2.new(0, l_ServerVersionLabel_0.TextBounds.X + 6, 0, v58) or v296;
            v139.ServerVersionLabel.TextScaled = not (l_game_EngineFeature_1 or v139.ServerVersionLabel.TextFits);
        end);
        local v297 = "Client Version: ";
        if v113 then
            if not v114 then
                v297 = "Client Version: ";
            else
                local l_status_5, l_result_5 = pcall(v114.FormatByKey, v114, "InGame.HelpMenu.Label.ClientVersion");
                v297 = if l_status_5 then l_result_5 else "Client Version: ";
            end;
        end;
        local l_l_RunService_0_RobloxVersion_0 = l_RunService_0:GetRobloxVersion();
        local l_status_6, l_result_6 = pcall(function() --[[ Line: 1211 ]]
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
            TextSize = v53.textSize(v13 and 28 or v27:IsSmallTouchScreen() and 14 or 20), 
            Text = v297 .. l_l_RunService_0_RobloxVersion_0, 
            Font = v53.font(Enum.Font.SourceSans, "SettingsHub"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 5
        });
        local l_ClientVersionLabel_0 = v139.ClientVersionLabel;
        local v304 = UDim2.new(0.2, -6, 1, 0);
        l_ClientVersionLabel_0.Size = l_game_EngineFeature_1 and UDim2.new(0, l_ClientVersionLabel_0.TextBounds.X + 6, 0, v58) or v304;
        v139.ClientVersionLabel.TextScaled = not (l_game_EngineFeature_1 or v139.ClientVersionLabel.TextFits);
        v139.PlaceVersionLabel = l_Create_0("TextLabel")({
            Name = "PlaceVersionLabel", 
            Parent = v139.VersionContainer, 
            BackgroundTransparency = 1, 
            LayoutOrder = 3, 
            TextColor3 = Color3.new(1, 1, 1), 
            TextSize = v53.textSize(v13 and 28 or v27:IsSmallTouchScreen() and 14 or 20), 
            Text = "Place Version: ...", 
            Font = v53.font(Enum.Font.SourceSans, "SettingsHub"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 5
        });
        l_ClientVersionLabel_0 = function() --[[ Line: 1248 ]] --[[ Name: setPlaceVersionText ]]
            -- upvalues: v113 (ref), v114 (ref), v139 (ref), v63 (ref), l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref), l_game_EngineFeature_1 (copy), v58 (ref)
            local v305 = "Place Version: ";
            if v113 then
                if not v114 then
                    v305 = "Place Version: ";
                else
                    local l_status_7, l_result_7 = pcall(v114.FormatByKey, v114, "InGame.HelpMenu.Label.PlaceVersion");
                    v305 = if l_status_7 then l_result_7 else "Place Version: ";
                end;
            end;
            local l_PlaceVersionLabel_0 = v139.PlaceVersionLabel;
            local l_v305_0 = v305;
            local v310;
            if v63.GetFFlagRemoveAssetVersionEndpoint() then
                v310 = game.PlaceVersion;
            else
                local l_PlaceVersion_1 = game.PlaceVersion;
                do
                    local l_l_PlaceVersion_1_0 = l_PlaceVersion_1;
                    pcall(function() --[[ Line: 358 ]]
                        -- upvalues: l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref), l_l_PlaceVersion_1_0 (ref)
                        local l_l_HttpRbxApiService_0_Async_1 = l_HttpRbxApiService_0:GetAsync(string.format("assets/%d/versions", game.PlaceId));
                        local l_VersionNumber_1 = l_HttpService_0:JSONDecode(l_l_HttpRbxApiService_0_Async_1)[1].VersionNumber;
                        l_l_PlaceVersion_1_0 = string.format("%s (Latest: %d)", l_l_PlaceVersion_1_0, l_VersionNumber_1);
                    end);
                    v310 = l_l_PlaceVersion_1_0;
                end;
            end;
            l_PlaceVersionLabel_0.Text = l_v305_0 .. v310;
            l_PlaceVersionLabel_0 = v139.PlaceVersionLabel;
            local v315 = UDim2.new(0.2, -6, 1, 0);
            l_PlaceVersionLabel_0.Size = l_game_EngineFeature_1 and UDim2.new(0, l_PlaceVersionLabel_0.TextBounds.X + 6, 0, v58) or v315;
            v139.PlaceVersionLabel.TextScaled = not (l_game_EngineFeature_1 or v139.PlaceVersionLabel.TextFits);
        end;
        game:GetPropertyChangedSignal("PlaceVersion"):Connect(l_ClientVersionLabel_0);
        spawn(l_ClientVersionLabel_0);
        if not v29:IsSubjectToChinaPolicies() then
            v139.EnvironmentLabel = l_Create_0("TextLabel")({
                Name = "EnvironmentLabel", 
                Parent = v139.VersionContainer, 
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 1, 
                TextColor3 = Color3.new(1, 1, 1), 
                LayoutOrder = 4, 
                TextSize = v53.textSize(v13 and 28 or v27:IsSmallTouchScreen() and 14 or 20), 
                Text = l_BaseUrl_0, 
                Font = v53.font(Enum.Font.SourceSans, "SettingsHub"), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 5, 
                Visible = v84
            });
            local l_EnvironmentLabel_0 = v139.EnvironmentLabel;
            local v317 = UDim2.new(0.2, -6, 1, 0);
            l_EnvironmentLabel_0.Size = l_game_EngineFeature_1 and UDim2.new(0, l_EnvironmentLabel_0.TextBounds.X + 6, 0, v58) or v317;
            v139.EnvironmentLabel.TextScaled = not (l_game_EngineFeature_1 or v139.EnvironmentLabel.TextFits);
        end;
        if game:GetEngineFeature("GetPlaySessionIdEnabled") then
            local l_game_PlaySessionId_0 = game:GetPlaySessionId();
            if l_game_PlaySessionId_0 ~= "" then
                local v319 = "PlaySessionId: " .. l_game_PlaySessionId_0;
                if v114 then
                    v319 = v114:FormatByKey("InGame.HelpMenu.Label.PlaySessionId", {
                        RBX_STR = l_game_PlaySessionId_0
                    });
                end;
                v139.PlaySessionIdLabel = l_Create_0("TextLabel")({
                    Name = "PlaySessionIdLabel", 
                    Parent = v139.VersionContainer, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 5, 
                    TextColor3 = Color3.new(1, 1, 1), 
                    TextSize = v53.textSize(v13 and 28 or v27:IsSmallTouchScreen() and 14 or 20), 
                    Text = v319, 
                    Font = v53.font(Enum.Font.SourceSans, "SettingsHub"), 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    ZIndex = 5
                });
                local l_PlaySessionIdLabel_0 = v139.PlaySessionIdLabel;
                local v321 = UDim2.new(0.2, -6, 1, 0);
                l_PlaySessionIdLabel_0.Size = l_game_EngineFeature_1 and UDim2.new(0, l_PlaySessionIdLabel_0.TextBounds.X + 6, 0, v58) or v321;
                v139.PlaySessionIdLabel.TextScaled = not v139.PlaySessionIdLabel.TextFits;
            end;
        end;
        local function v335() --[[ Line: 1310 ]] --[[ Name: getOverridesPlayerScripts ]]
            -- upvalues: l_StarterPlayer_0 (ref), v63 (ref), v113 (ref), v114 (ref)
            local v322 = l_StarterPlayer_0:WaitForChild("StarterPlayerScripts", v63.FFlagRemoveLoadingTimeout and 1e999 or nil);
            local l_PlayerScriptsLoader_0 = v322:FindFirstChild("PlayerScriptsLoader");
            local l_PlayerModule_0 = v322:FindFirstChild("PlayerModule");
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
                local l_CameraScript_0 = v322:FindFirstChild("CameraScript");
                local l_ControlScript_0 = v322:FindFirstChild("ControlScript");
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
            TextSize = v53.textSize(v13 and 28 or v27:IsSmallTouchScreen() and 14 or 20), 
            Text = "PlayerScripts: ", 
            Font = v53.font(Enum.Font.SourceSans, "SettingsHub"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 5, 
            Visible = false
        });
        spawn(function() --[[ Line: 1363 ]]
            -- upvalues: l_RobloxGui_0 (ref), l_Players_0 (ref), v113 (ref), v114 (ref), v335 (copy), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), v63 (ref), v139 (ref), v84 (ref), l_game_EngineFeature_1 (copy), v58 (ref)
            local v336 = require(l_RobloxGui_0.Modules.PlayerPermissionsModule);
            if not l_Players_0.LocalPlayer then
                l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
            end;
            local v337 = "PlayerScripts: ";
            if v113 then
                if not v114 then
                    v337 = "PlayerScripts: ";
                else
                    local l_status_12, l_result_12 = pcall(v114.FormatByKey, v114, "InGame.HelpMenu.Label.PlayerScripts");
                    v337 = if l_status_12 then l_result_12 else "PlayerScripts: ";
                end;
            end;
            local v340 = v335();
            l_RbxAnalyticsService_0:setRBXEventStream(l_Constants_0.AnalyticsTargetName, "player_scripts_status", "player_scripts_status_action", {
                defaultPlayerScripts = v340 == "Default", 
                placeID = tostring(game.PlaceId), 
                rawValue = if v63.GetFFlagNewEventIngestPlayerScriptsDimensions() then v340 else nil, 
                context = v63.GetFFlagNewEventIngestPlayerScriptsDimensions() and "IGMv1" or nil
            });
            v139.OverridesPlayerScriptsLabel.Text = v337 .. v340;
            v139.OverridesPlayerScriptsLabel.Visible = v84 or v336.IsPlayerAdminAsync(l_Players_0.LocalPlayer);
            local l_OverridesPlayerScriptsLabel_0 = v139.OverridesPlayerScriptsLabel;
            local v342 = UDim2.new(0.2, -6, 1, 0);
            l_OverridesPlayerScriptsLabel_0.Size = l_game_EngineFeature_1 and UDim2.new(0, l_OverridesPlayerScriptsLabel_0.TextBounds.X + 6, 0, v58) or v342;
            v139.OverridesPlayerScriptsLabel.TextScaled = not (l_game_EngineFeature_1 or v139.OverridesPlayerScriptsLabel.TextFits);
        end);
        if l_game_EngineFeature_1 then
            local v343 = "Client CoreScript Version: ";
            if v113 then
                if not v114 then
                    v343 = "Client CoreScript Version: ";
                else
                    local l_status_13, l_result_13 = pcall(v114.FormatByKey, v114, "InGame.HelpMenu.Label.ClientCoreScriptVersion");
                    v343 = if l_status_13 then l_result_13 else "Client CoreScript Version: ";
                end;
            end;
            v139.CoreScriptVersionLabel = l_Create_0("TextLabel")({
                Name = "CoreScriptVersionLabel", 
                Parent = v139.VersionContainer, 
                LayoutOrder = 6, 
                BackgroundTransparency = 1, 
                TextColor3 = Color3.new(1, 1, 1), 
                TextSize = v53.textSize(v13 and 28 or v27:IsSmallTouchScreen() and 14 or 20), 
                Text = v343 .. l_RunService_0:GetCoreScriptVersion(), 
                Font = v53.font(Enum.Font.SourceSans, "SettingsHub"), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 5
            });
            local l_CoreScriptVersionLabel_0 = v139.CoreScriptVersionLabel;
            local v347 = UDim2.new(0.2, -6, 1, 0);
            l_CoreScriptVersionLabel_0.Size = l_game_EngineFeature_1 and UDim2.new(0, l_CoreScriptVersionLabel_0.TextBounds.X + 6, 0, v58) or v347;
            l_CoreScriptVersionLabel_0 = v139.VersionContainer;
            local l_l_CoreScriptVersionLabel_0_0 = l_CoreScriptVersionLabel_0 --[[ copy: 12 -> 22 ]];
            v281:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 1410 ]]
                -- upvalues: l_l_CoreScriptVersionLabel_0_0 (copy), v281 (copy), v58 (ref)
                l_l_CoreScriptVersionLabel_0_0.CanvasSize = UDim2.new(0, v281.AbsoluteContentSize.X, 0, v58);
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
        if v53.EnableDarkenBackground then
            if v63.FFlagSettingsHubIndependentBackgroundVisibility then
                v139.DarkenBackground = l_Create_0("ImageButton")({
                    Name = "DarkenBackground", 
                    ZIndex = v139.Shield.ZIndex - 1, 
                    BackgroundTransparency = 1, 
                    BackgroundColor3 = if v63.isInExperienceUIVREnabled then v139.SettingsUIDelegate:getDarkBackgroundTheme().Color else v53.color("DarkenBackground"), 
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
                    BackgroundColor3 = v53.color("DarkenBackground"), 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Parent = v139.ClippingShield
                });
            end;
        end;
        local v349 = v53.MenuContainerPosition(v139.SettingsUIDelegate);
        v139.MenuContainer = l_Create_0("ImageButton")({
            Name = "MenuContainer", 
            ZIndex = v139.Shield.ZIndex, 
            BackgroundTransparency = v53.transparency("MenuContainer", 1), 
            BackgroundColor3 = v53.color("MenuContainer"), 
            Position = v349.Position, 
            Size = v349.Size, 
            AnchorPoint = v349.AnchorPoint, 
            AutomaticSize = v349.AutomaticSize, 
            Parent = v139.Shield
        });
        if v63.FFlagCreateInExperienceMenuReact then
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
        if not v13 then
            local _ = l_GuiService_0:GetGuiInset().Y;
            v139.MenuContainerPadding.PaddingTop = UDim.new(0, 0);
        end;
        local v352 = v53.HubPadding();
        v139.MenuContainer.AutoButtonColor = false;
        v139.MenuContainerPadding.PaddingLeft = v352.PaddingLeft;
        v139.MenuContainerPadding.PaddingRight = v352.PaddingRight;
        v139.MenuContainerPadding.PaddingBottom = v352.PaddingBottom;
        v139.MenuContainerPadding.PaddingTop = v352.PaddingTop;
        l_Create_0("UICorner")({
            CornerRadius = v53.MenuContainerCornerRadius, 
            Parent = v139.MenuContainer
        });
        if v53.EnableVerticalBottomBar then
            v139.MainColumn = l_Create_0("Frame")({
                Name = "MainColumn", 
                BackgroundTransparency = 1, 
                Position = v349.Position, 
                Size = v349.Size, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Parent = v139.MenuContainer
            });
            l_Page_0 = v139.MainColumn;
            v139.VerticalMenuDivider = l_Create_0("Frame")({
                Name = "VerticalMenuDivider", 
                BackgroundTransparency = v53.transparency("Divider"), 
                BackgroundColor3 = v53.color("Divider"), 
                Size = UDim2.new(0, 1, 1, -100), 
                Visible = true, 
                Parent = v139.MenuContainer
            });
            v139.VerticalMenu = l_Create_0("Frame")({
                Name = "VerticalMenu", 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, v53.VerticalMenuWidth, 0, 100), 
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
        v43(function(v353) --[[ Line: 1563 ]]
            -- upvalues: v139 (ref)
            v139.hasMicPermissions = v353.hasMicPermissions;
            v139.isFetchingMicPermissions = false;
        end, nil, true);
        v139.SettingsShowSignal:connect(function(v354) --[[ Line: 1569 ]]
            -- upvalues: l_default_0 (ref), v139 (ref)
            if v354 then
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
            BackgroundColor3 = v53.color("HubBarContainer"), 
            BackgroundTransparency = v53.transparency("HubBarContainerTransparency"), 
            ZIndex = v139.Shield.ZIndex + 1, 
            BorderSizePixel = 0, 
            AnchorPoint = Vector2.new(0.5, 0), 
            LayoutOrder = 0, 
            Parent = l_Page_0
        });
        l_Create_0("Frame")({
            BackgroundColor3 = v53.color("Divider"), 
            BackgroundTransparency = v53.transparency("Divider"), 
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
        if not v63.FFlagAddTraversalBackButton then
            if v63.EngineFeatureTeleportHistoryButtons then
                v139.BackBarRef = v14.createRef();
                v139.FrontBarRef = v14.createRef();
                v139.BackBar = v14.createElement(v38.Provider, {
                    value = l_IXPService_0
                }, {
                    AppStyleProvider = v14.createElement(l_AppStyleProvider_0, {
                        style = {
                            themeName = l_Dark_0
                        }
                    }, {
                        ButtonsFrame = v14.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            LayoutOrder = -1, 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            Size = UDim2.new(1, 0, 0, 0)
                        }, {
                            BackButton = v14.createElement(v35, {
                                BackBarRef = v139.BackBarRef, 
                                HubBar = v139.HubBar, 
                                LayoutOrder = 1
                            }), 
                            FrontButton = v14.createElement(v36, {
                                FrontBarRef = v139.FrontBarRef, 
                                HubBar = v139.HubBar, 
                                LayoutOrder = 2
                            })
                        })
                    })
                });
                v14.mount(v139.BackBar, l_Page_0, "BackBar");
            else
                v139.BackBarRef = v14.createRef();
                v139.BackBar = v14.createElement(v38.Provider, {
                    value = l_IXPService_0
                }, {
                    AppStyleProvider = v14.createElement(l_AppStyleProvider_0, {
                        style = {
                            themeName = l_Dark_0
                        }
                    }, {
                        BackButton = v14.createElement(v35, {
                            BackBarRef = v139.BackBarRef, 
                            HubBar = v139.HubBar
                        })
                    })
                });
                v14.mount(v139.BackBar, l_Page_0, "BackBar");
            end;
        end;
        if v27:IsSmallTouchScreen() then
            v139.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 100, 0, 50);
            v139.HubBar.Position = UDim2.new(0.5, 0, 0, 6);
        elseif v13 then
            v139.HubBar.Size = UDim2.new(0, 1200, 0, 100);
            v139.HubBar.Position = UDim2.new(0.5, 0, 0.1, 0);
        else
            v139.HubBar.Size = UDim2.new(0, 800, 0, 60);
            v139.HubBar.Position = UDim2.new(0.5, 0, 0.1, 0);
        end;
        v139.VoiceRecordingIndicatorFrame = l_Create_0("Frame")({
            Size = if v63.ChromeEnabled then UDim2.new(1, 0, 0, 100) else UDim2.fromOffset(0, 100), 
            Position = UDim2.new(0, 0, 0, 0), 
            Parent = v139.HubBar, 
            BackgroundTransparency = 1
        });
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
        if v27:IsSmallTouchScreen() then
            v139.VoiceRecordingText.Size = UDim2.fromScale(1, 1);
            v139.VoiceRecordingText.AnchorPoint = Vector2.new(0, 0);
            if v63.ChromeEnabled then
                v139.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right;
                v139.VoiceRecordingText.Position = UDim2.new(0, 0, 0, -60);
            else
                v139.VoiceRecordingText.Position = UDim2.new(0, 60, 0, -60);
            end;
        elseif v13 then
            v139.VoiceRecordingText.AnchorPoint = Vector2.new(0, 1);
            if v63.ChromeEnabled then
                v139.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right;
                v139.VoiceRecordingText.Size = UDim2.new(1, 0, 0, 100);
                v139.VoiceRecordingText.Position = UDim2.new(0, 0, 0.1, 0);
            else
                v139.VoiceRecordingText.Size = UDim2.new(0, 1200, 0, 100);
                v139.VoiceRecordingText.Position = UDim2.new(0.5, 0, 0.1, 0);
            end;
        else
            v139.VoiceRecordingText.AnchorPoint = Vector2.new(0, 1);
            if v63.ChromeEnabled then
                v139.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right;
                v139.VoiceRecordingText.Size = UDim2.new(1, 0, 0, 60);
                v139.VoiceRecordingText.Position = UDim2.new(0, 0, 0.1, 0);
            else
                v139.VoiceRecordingText.Size = UDim2.new(0, 800, 0, 60);
                v139.VoiceRecordingText.Position = UDim2.new(0.5, 0, 0.1, 0);
            end;
        end;
        v139.voiceRecordingIndicatorTextMotor = v16.createSingleMotor(0);
        v139.voiceRecordingIndicatorTextMotor:onStep(function(v355) --[[ Line: 1753 ]]
            -- upvalues: v139 (ref)
            v139.VoiceRecordingText.TextTransparency = v355;
        end);
        spawn(function() --[[ Line: 1757 ]]
            -- upvalues: l_RunService_0 (ref), v139 (ref), v16 (ref), v110 (ref)
            l_RunService_0:BindToRenderStep("VoiceRecordingIndicator", 1, function() --[[ Line: 1758 ]]
                -- upvalues: v139 (ref), v16 (ref), v110 (ref)
                if v139.isMuted ~= nil and v139.lastVoiceRecordingIndicatorTextUpdated ~= nil and tick() - v139.lastVoiceRecordingIndicatorTextUpdated >= 5 and v139.isMuted then
                    v139.voiceRecordingIndicatorTextMotor:setGoal(v16.spring(1, v110));
                    v139.voiceRecordingIndicatorTextMotor:start();
                end;
            end);
        end);
        v139.PageViewClipper = l_Create_0("Frame")({
            Name = "PageViewClipper", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(v139.HubBar.Size.X.Scale, v139.HubBar.Size.X.Offset, 1, -v139.HubBar.Size.Y.Offset - v139.HubBar.Position.Y.Offset - v279), 
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
        if v63.FFlagEnableConsoleExpControls and v63.ChromeEnabled then
            v139.PageViewPadding = l_Create_0("UIPadding")({
                Parent = v139.PageViewClipper
            });
            local v356 = require(l_RobloxGui_0.Modules.Chrome.Service);
            local l_v356_0 = v356 --[[ copy: 14 -> 21 ]];
            v356:onShortcutBarChanged():connect(function() --[[ Line: 1799 ]]
                -- upvalues: v27 (ref), l_v356_0 (copy), v139 (ref), v53 (ref)
                if v27:IsSmallTouchScreen() and l_v356_0:getCurrentShortcutBar():get() ~= nil then
                    v139.PageViewPadding.PaddingBottom = UDim.new(0, v53.ExtraPageBottomPaddingMobile);
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
            ScrollBarThickness = v53.DefaultScrollBarThickness, 
            Parent = v139.PageViewClipper
        });
        v139.PageView.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar;
        v139.lastPageViewCanvasPosition = v139.PageView.CanvasPosition;
        v139.handelPageViewScroll = function() --[[ Line: 1826 ]]
            -- upvalues: v139 (ref)
            local v358 = math.clamp(v139.lastPageViewCanvasPosition.Y, 0, v139.PageView.MaxCanvasPosition.Y);
            local v359 = math.clamp(v139.PageView.CanvasPosition.Y, 0, v139.PageView.MaxCanvasPosition.Y);
            local v360 = v358 - v359;
            if math.abs(v360) > 5 then
                if v360 < 0 then
                    v139:animateOutBottomBar();
                else
                    v139:animateInBottomBar();
                end;
                v139.lastPageViewCanvasPosition = Vector2.new(v139.PageView.CanvasPosition.x, v359);
            end;
        end;
        v139.pageViewScrollChangeCon = nil;
        if v53.UseStickyBar() then
            v139.PageView.AutomaticCanvasSize = Enum.AutomaticSize.Y;
            if v27:IsPortrait() == false then
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
        if v53.UseStickyBar() then
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
            Selectable = not v63.FFlagIEMFocusNavToButtons and nil, 
            SelectionGroup = v63.FFlagIEMFocusNavToButtons and true or nil, 
            SelectionBehaviorLeft = if v63.FFlagIEMFocusNavToButtons then Enum.SelectionBehavior.Stop else nil, 
            SelectionBehaviorRight = if v63.FFlagIEMFocusNavToButtons then Enum.SelectionBehavior.Stop else nil, 
            SelectionBehaviorDown = if v63.FFlagIEMFocusNavToButtons then Enum.SelectionBehavior.Stop else nil
        });
        if v63.FFlagTraversalPerfFixes then
            v139.BottomButtonFrame:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 1927 ]]
                -- upvalues: v139 (ref)
                v139.setShowBottomBarSignal(v139.BottomButtonFrame.Visible);
            end);
        end;
        local function v362(v361) --[[ Line: 1932 ]]
            -- upvalues: v63 (ref), v260 (ref), v139 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), l_GuiService_0 (ref)
            if v63.FFlagAddUILessMode then
                v260(false, nil, nil, nil, v361);
            else
                v260(false);
            end;
            if v63.FFlagAddUILessMode and v63.FIntAddUILessModeVariant ~= 0 and v139.uiLessStore.getUILessModeEnabled(false) then
                v139.uiLessStore.setUIVisible(false);
            end;
            l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsResumeGameName, l_Constants_0.AnalyticsMenuActionName, {
                source = v361, 
                playsessionid = v139.playSessionId, 
                universeid = tostring(game.GameId)
            });
            if v63.FFlagIEMResumeButtonPressBugfix then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
        end;
        if not v63.FFlagMenuButtonsMountWithIEM and v63.FFlagRelocateMobileMenuButtons and (v63.FIntRelocateMobileMenuButtonsVariant == 1 or v63.FIntRelocateMobileMenuButtonsVariant == 3 or v63.FIntRelocateMobileMenuButtonsVariant == 2 and not v27:IsSmallTouchScreen()) then
            v277();
        end;
        if not v63.FFlagRelocateMobileMenuButtons or v63.FIntRelocateMobileMenuButtonsVariant == 0 or v63.FIntRelocateMobileMenuButtonsVariant == 2 and v27:IsSmallTouchScreen() then
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
        if v63.FFlagEnableSystemScrimInSettingsHub then
            local v363 = require(l_CorePackages_0.Workspace.Packages.SystemScrim).SystemScrimSignalStore(false);
            v363.backgroundScrimActivated.Event:Connect(function() --[[ Line: 1981 ]]
                -- upvalues: v63 (ref), v139 (ref), l_Constants_0 (ref), v362 (copy)
                if v63.FFlagRelocateMobileMenuButtons and v63.FIntRelocateMobileMenuButtonsVariant ~= 0 then
                    v139:GetExperienceControlStore().onResume(l_Constants_0.AnalyticsResumeShieldSource);
                    return;
                else
                    v362(l_Constants_0.AnalyticsResumeShieldSource);
                    return;
                end;
            end);
            local l_v363_0 = v363 --[[ copy: 15 -> 20 ]];
            v139.Shield:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 1989 ]]
                -- upvalues: l_v363_0 (copy), v139 (ref)
                l_v363_0.setTransparency(1);
                l_v363_0.setAutoDismiss(true);
                l_v363_0.setVisibility(v139.Shield.Visible);
            end);
        end;
        v139.Shield.Activated:Connect(function() --[[ Line: 1996 ]]
            -- upvalues: v63 (ref), v139 (ref), l_Constants_0 (ref), v362 (copy)
            if v63.FFlagRelocateMobileMenuButtons and v63.FIntRelocateMobileMenuButtonsVariant ~= 0 then
                v139:GetExperienceControlStore().onResume(l_Constants_0.AnalyticsResumeShieldSource);
                return;
            else
                v362(l_Constants_0.AnalyticsResumeShieldSource);
                return;
            end;
        end);
        if v63.FFlagSettingsHubIndependentBackgroundVisibility then
            v139.DarkenBackground.Activated:Connect(function() --[[ Line: 2006 ]]
                -- upvalues: v63 (ref), v139 (ref), l_Constants_0 (ref), v362 (copy), l_InExperienceAppChatModal_0 (ref)
                if v63.FFlagRelocateMobileMenuButtons and v63.FIntRelocateMobileMenuButtonsVariant ~= 0 then
                    v139:GetExperienceControlStore().onResume(l_Constants_0.AnalyticsResumeShieldSource);
                else
                    v362(l_Constants_0.AnalyticsResumeShieldSource);
                end;
                l_InExperienceAppChatModal_0.default:setVisible(false);
            end);
        end;
        if not v63.FFlagRelocateMobileMenuButtons or v63.FIntRelocateMobileMenuButtonsVariant == 0 then
            local function v365() --[[ Line: 2017 ]]
                -- upvalues: v63 (ref), v139 (ref), v190 (ref), v104 (ref)
                if v63.FFlagPreventHiddenSwitchPage and v139:GetVisibility() == false then
                    return;
                else
                    v139:AddToMenuStack(v139.Pages.CurrentPage);
                    v139.HubBar.Visible = false;
                    v190();
                    if v63.GetFFlagEnableLeaveGameUpsellEntrypoint() and v139.leaveGameUpsellProp ~= v104.PHONE_UPSELL_VALUE_PROP.None then
                        v139:SwitchToPage(v139.LeaveGameUpsellPage, nil, 1, true);
                        return;
                    else
                        v139:SwitchToPage(v139.LeaveGamePage, nil, 1, true);
                        return;
                    end;
                end;
            end;
            if l_InExperienceCapabilities_0.canNavigateHome then
                v225("LeaveGame", "Leave", v228, "rbxasset://textures/ui/Settings/Help/LeaveIcon.png", UDim2.new(0.5, v13 and -160 or -130, 0.5, -25), v365, {
                    Enum.KeyCode.L, 
                    if v63.FFlagEnableConsoleExpControls and v63.ChromeEnabled then nil else Enum.KeyCode.ButtonX
                }, v365);
            end;
            local function v366() --[[ Line: 2041 ]]
                -- upvalues: v248 (ref), v139 (ref), v190 (ref)
                if v248 then
                    v139:AddToMenuStack(v139.Pages.CurrentPage);
                    v139.HubBar.Visible = false;
                    v190();
                    v139:SwitchToPage(v139.ResetCharacterPage, nil, 1, true);
                end;
            end;
            local v367 = v197:Format(l_Constants_0.RespawnLocalizedKey);
            v225("ResetCharacter", v367, v229, "rbxasset://textures/ui/Settings/Help/ResetIcon.png", UDim2.new(0.5, v13 and -550 or -400, 0.5, -25), v366, {
                Enum.KeyCode.R, 
                if v63.FFlagEnableConsoleExpControls and v63.ChromeEnabled then nil else Enum.KeyCode.ButtonY
            }, v366);
            local function v368() --[[ Line: 2057 ]]
                -- upvalues: v362 (copy), l_Constants_0 (ref)
                v362(l_Constants_0.AnalyticsResumeButtonSource);
            end;
            local function v369() --[[ Line: 2060 ]]
                -- upvalues: v362 (copy), l_Constants_0 (ref)
                v362(l_Constants_0.AnalyticsResumeGamepadSource);
            end;
            v225("Resume", "Resume", if v63.FFlagEnableConsoleExpControls then l_l_UserInputService_0_ImageForKeyCode_0 else v227, "rbxasset://textures/ui/Settings/Help/EscapeIcon.png", UDim2.new(0.5, v13 and 200 or 140, 0.5, -25), v368, if v63.FFlagEnableConsoleExpControls and v63.ChromeEnabled then {} else {
                Enum.KeyCode.ButtonB, 
                Enum.KeyCode.ButtonStart
            }, v369);
        end;
        if v63.FFlagAddSwitchTabHintsToIEM then
            local function v372(v370) --[[ Line: 2070 ]] --[[ Name: MountSwitchTabHint ]]
                -- upvalues: l_Create_0 (ref), v18 (ref), v17 (ref), l_FoundationProvider_0 (ref), v19 (ref), v26 (ref), l_SwitchTabHint_0 (ref)
                local v371 = l_Create_0("Frame")({
                    Name = "SwitchTabHintContainer", 
                    Size = UDim2.fromScale(0, 1), 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    LayoutOrder = v370.layoutOrder, 
                    Parent = v370.parent
                });
                v18.createRoot(v371):render(v17.createElement(v17.Fragment, nil, v17.createElement("UIListLayout", {
                    Name = "SwitchTabHintCenterAlign", 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), v17.createElement(l_FoundationProvider_0, {
                    theme = v19.Enums.Theme.Dark, 
                    device = v26.getDeviceType()
                }, {
                    ["SwitchTabHint" .. v370.keycode.Name] = v17.createElement(l_SwitchTabHint_0, {
                        keycode = v370.keycode
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
            v372({
                keycode = Enum.KeyCode.ButtonL1, 
                parent = v139.TabHeaderContainer, 
                layoutOrder = -999
            });
            v372({
                keycode = Enum.KeyCode.ButtonR1, 
                parent = v139.TabHeaderContainer, 
                layoutOrder = 999
            });
        end;
        v139.HubBarContainer = l_Create_0("ImageLabel")({
            Name = "HubBarContainer", 
            ZIndex = v139.Shield.ZIndex + 2, 
            BorderSizePixel = 0, 
            BackgroundColor3 = v53.color("HubBarContainer"), 
            BackgroundTransparency = v53.transparency("HubBarContainerTransparency"), 
            Size = if v53.ShowHomeButton then UDim2.new(1, -70, 1, 0) else UDim2.new(1, 0, 1, 0), 
            Position = if v53.ShowHomeButton then UDim2.new(0, 70, 0, 0) else UDim2.new(0, 0, 0, 0), 
            Parent = if v63.FFlagAddSwitchTabHintsToIEM then v139.TabHeaderContainer else v139.HubBar, 
            Selectable = not v63.FFlagIEMTabFocusNav and nil, 
            SelectionGroup = v63.FFlagIEMTabFocusNav and true or nil, 
            SelectionBehaviorUp = if v63.FFlagIEMTabFocusNav then Enum.SelectionBehavior.Stop else nil, 
            SelectionBehaviorLeft = if v63.FFlagIEMTabFocusNav then Enum.SelectionBehavior.Stop else nil, 
            SelectionBehaviorRight = if v63.FFlagIEMTabFocusNav then Enum.SelectionBehavior.Stop else nil
        });
        v139.HubBar.ImageTransparency = 1;
        v139.HubBarListLayout.Parent = v139.HubBarContainer;
        if v53.ShowHomeButton then
            v139.HubBarHomeButton = l_Create_0("ImageButton")({
                Name = "HubBarHomeButton", 
                ZIndex = v139.Shield.ZIndex + 2, 
                BorderSizePixel = 0, 
                AutoButtonColor = false, 
                BackgroundColor3 = v53.color("HubBarHomeButton"), 
                BackgroundTransparency = v53.transparency("HubBarHomeButtonTransparency"), 
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                Parent = v139.HubBar
            });
            l_Create_0("UICorner")({
                CornerRadius = v53.DefaultCornerRadius, 
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
            v139.HubBarHomeButton:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 2185 ]]
                -- upvalues: v139 (ref)
                local v373 = v139.HubBarHomeButton.AbsoluteSize.X + 10;
                v139.HubBarContainer.Size = UDim2.new(1, -v373, 1, 0);
                v139.HubBarContainer.Position = UDim2.new(0, v373, 0, 0);
            end);
            v139.HubBarHomeButton.MouseEnter:Connect(function() --[[ Line: 2190 ]]
                -- upvalues: v139 (ref), v53 (ref)
                v139.HubBarHomeButton.BackgroundColor3 = v53.color("HubBarHomeButtonHover");
                v139.HubBarHomeButton.BackgroundTransparency = v53.transparency("HubBarHomeButtonTransparencyHover");
            end);
            v139.HubBarHomeButton.MouseLeave:Connect(function() --[[ Line: 2194 ]]
                -- upvalues: v139 (ref), v53 (ref)
                v139.HubBarHomeButton.BackgroundColor3 = v53.color("HubBarHomeButton");
                v139.HubBarHomeButton.BackgroundTransparency = v53.transparency("HubBarHomeButtonTransparency");
            end);
            local function v374() --[[ Line: 2199 ]]
                -- upvalues: v139 (ref), v190 (ref)
                v139:AddToMenuStack(v139.Pages.CurrentPage);
                v139.HubBar.Visible = false;
                v190();
                v139:SwitchToPage(v139.LeaveGameToHomePage, nil, 1, true);
            end;
            v139.HubBarHomeButton.Activated:Connect(v374);
        end;
        if l_isSubjectToDesktopPolicies_0() then
            v139.FullScreenTitleBar = v90.mount({}, v139.Shield, "FullScreenTitleBar");
        end;
        local function v375() --[[ Line: 2214 ]] --[[ Name: cameraViewportChanged ]]
            -- upvalues: v53 (ref), v27 (ref)
            v53.viewportResized();
            v27:FireOnResized();
        end;
        local v376 = nil;
        local function v378(v377) --[[ Line: 2220 ]] --[[ Name: onWorkspaceChanged ]]
            -- upvalues: v53 (ref), v27 (ref), v376 (ref), v375 (copy)
            if v377 == "CurrentCamera" then
                v53.viewportResized();
                v27:FireOnResized();
                if v376 then
                    v376:disconnect();
                end;
                v376 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(v375);
            end;
        end;
        v53.viewportResized();
        v27:FireOnResized();
        if v376 then
            v376:disconnect();
        end;
        v376 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(v375);
        workspace.Changed:Connect(v378);
    end;
    local function v386() --[[ Line: 2232 ]] --[[ Name: resizeBottomBarButtons ]]
        -- upvalues: v139 (copy), v63 (ref)
        local l_X_0 = v139.BottomButtonFrame.AbsoluteSize.X;
        local v381 = #v139.BottomBarButtons;
        if v381 == 4 then
            l_X_0 = l_X_0 - 48 - 12;
            v381 = v381 - 1;
        end;
        local v382 = (l_X_0 - (v381 - 1) * 12 - 12) / v381;
        if v63.isInExperienceUIVREnabled then
            v382 = v139.SettingsUIDelegate:getBottomButtonSize(v382);
        end;
        for v383 = 1, #v139.BottomBarButtons do
            local v384 = v139.BottomBarButtons[v383];
            local v385 = v384[1];
            if v385 ~= "MuteButtonButton" then
                v139[v385].Size = UDim2.fromOffset(v382, v139[v384[1]].Size.Y.Offset);
            end;
        end;
    end;
    local function v406() --[[ Line: 2255 ]] --[[ Name: onScreenSizeChanged ]]
        -- upvalues: v139 (copy), v63 (ref), v27 (ref), v53 (ref), v277 (copy), v278 (copy), l_RobloxGui_0 (ref), v13 (ref), l_VRService_0 (ref), l_RunService_0 (ref), v176 (copy), v184 (copy), v173 (copy), v190 (copy), v386 (copy)
        local function _() --[[ Line: 2256 ]] --[[ Name: getBackBarVisible ]]
            -- upvalues: v139 (ref)
            if not v139.BackBarRef:getValue() then
                return false;
            else
                return v139.BackBarRef:getValue().Visible;
            end;
        end;
        local function _() --[[ Line: 2263 ]] --[[ Name: getFrontBarVisible ]]
            -- upvalues: v139 (ref)
            if not v139.FrontBarRef:getValue() then
                return false;
            else
                return v139.FrontBarRef:getValue().Visible;
            end;
        end;
        if v63.FFlagRelocateMobileMenuButtons and v63.FIntRelocateMobileMenuButtonsVariant == 2 and v139.Visible then
            if not v27:IsPortrait() and not v27:IsSmallTouchScreen() or v53.AlwaysShowBottomBar() then
                if not v139.BottomButtonFrameRoot then
                    v277();
                end;
                if v139.PlayersPage then
                    v139.PlayersPage:UnmountMenuButtonsContainer();
                end;
            else
                if v139.BottomButtonFrameRoot then
                    v278();
                end;
                if v139.PlayersPage then
                    v139.PlayersPage:CreateMenuButtonsContainer();
                end;
            end;
        end;
        local v389 = v53.MenuContainerPosition(v139.SettingsUIDelegate);
        local v390 = 600;
        local v391 = nil;
        v391 = if v63.isInExperienceUIVREnabled then v139.SettingsUIDelegate:getFullScreenSize() else l_RobloxGui_0.AbsoluteSize.y;
        local v392 = 0.050000000000000044 * v391;
        local v393 = v27:IsPortrait();
        if v13 then
            v390 = 800;
            v392 = 0.07 * v391;
        elseif v27:IsSmallTouchScreen() then
            v392 = math.min(10, 0.010000000000000009 * v391);
        elseif v63.isInExperienceUIVREnabled and l_VRService_0.VREnabled then
            v392 = 0;
        end;
        if v63.FFlagAddNextUpContainer and v139.Pages.CurrentPage and v139.Pages.CurrentPage.DisableTopPadding and v139.Pages.CurrentPage.MaintainVerticalSize then
            v390 = v390 + v139.HubBar.AbsoluteSize.Y;
        end;
        v139.MenuContainer.Size = v389.Size;
        v139.MenuContainer.Position = v389.Position;
        v139.MenuContainer.AnchorPoint = v389.AnchorPoint;
        local l_Offset_0 = v139.HubBar.Size.Y.Offset;
        local v395 = v392 * 2 + l_Offset_0 * 2;
        local v396 = 0;
        if not v63.FFlagAddTraversalBackButton then
            if not not v139.BackBarRef:getValue() and v139.BackBarRef:getValue().Visible and v139.BackBarRef:getValue() then
                v396 = v139.BackBarRef:getValue().Size.Y.Offset;
            end;
            if v63.EngineFeatureTeleportHistoryButtons and not not v139.FrontBarRef:getValue() and v139.FrontBarRef:getValue().Visible and v139.FrontBarRef:getValue() then
                v396 = v396 + v139.FrontBarRef:getValue().Size.Y.Offset;
            end;
        end;
        if v53.EnableVerticalBottomBar then
            v139.VerticalMenu.Visible = false;
            v139.VerticalMenuDivider.Visible = false;
            for v397 = 1, #v139.BottomBarButtonsComponents do
                v139.BottomBarButtonsComponents[v397].Parent = v139.BottomButtonFrame;
            end;
        end;
        if v393 then
            v139.HubBar.Position = UDim2.new(0.5, 0, 0, 10);
            v139.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 40, 0, 54);
        elseif v13 then
            v139.HubBar.Size = UDim2.new(0, 1200, 0, 100);
        elseif v27:IsSmallTouchScreen() then
            if v53.EnableVerticalBottomBar then
                v139.VerticalMenu.Visible = true;
                v139.VerticalMenuDivider.Visible = true;
                for v398 = 1, #v139.BottomBarButtonsComponents do
                    v139.BottomBarButtonsComponents[v398].Parent = v139.VerticalMenu;
                end;
                v139.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 60 - v53.VerticalMenuWidth, 0, 52);
            else
                v139.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 60, 0, 52);
            end;
        elseif v63.isInExperienceUIVREnabled then
            v139.HubBar.Size = UDim2.new(0, v139.SettingsUIDelegate:getHubBarSize(), 0, 60);
        else
            v139.HubBar.Size = UDim2.new(0, 800, 0, 60);
        end;
        l_Offset_0 = if not v53.AlwaysShowBottomBar() then v139.HubBar.Size.Y.Offset else v139.HubBar.Size.Y.Offset + v139.BottomButtonFrame.Size.Y.Offset;
        v395 = v392 * 2 + ((not v63.FFlagFixDisableTopPaddingError or v139.Pages.CurrentPage ~= nil) and v139.Pages.CurrentPage.DisableTopPadding and 0 or l_Offset_0);
        if not v63.FFlagAddTraversalBackButton then
            v396 = if not not v139.BackBarRef:getValue() and v139.BackBarRef:getValue().Visible and v139.BackBarRef:getValue() then v139.BackBarRef:getValue().Size.Y.Offset else 0;
            if v63.EngineFeatureTeleportHistoryButtons and not not v139.FrontBarRef:getValue() and v139.FrontBarRef:getValue().Visible and v139.FrontBarRef:getValue() then
                v396 = v396 + v139.FrontBarRef:getValue().Size.Y.Offset;
            end;
        end;
        if not v63.FFlagAddNextUpContainer then
            l_RunService_0.Heartbeat:wait();
        end;
        if v176() then
            v184();
            if v63.FFlagIEMFocusNavToButtons then
                v173(v139.Pages.CurrentPage);
            end;
        else
            v190();
        end;
        if v63.isInExperienceUIVREnabled then
            v395 = v395 + v139.SettingsUIDelegate:getMenuContainerExtraSpace();
        end;
        local v399 = v391 - v395 - v396;
        if v63.FFlagRelocateMobileMenuButtons and (v63.FIntRelocateMobileMenuButtonsVariant == 1 or v63.FIntRelocateMobileMenuButtonsVariant == 3) and v27:IsSmallTouchScreen() then
            v399 = v399 - v53.ExtraHubBottomPaddingMobile;
        end;
        local v400 = nil;
        if not v393 then
            if v390 < v399 then
                v400 = v390;
                v139.HubBar.Position = UDim2.new(v139.HubBar.Position.X.Scale, v139.HubBar.Position.X.Offset, 0.5, -v390 / 2 - v139.HubBar.Size.Y.Offset);
                if v139.BottomButtonFrame then
                    v139.BottomButtonFrame.Position = UDim2.new(v139.BottomButtonFrame.Position.X.Scale, v139.BottomButtonFrame.Position.X.Offset, 0.5, v390 / 2);
                end;
            elseif v399 < 150 then
                v400 = 150;
                v139.HubBar.Position = UDim2.new(v139.HubBar.Position.X.Scale, v139.HubBar.Position.X.Offset, 0.5, -75 - v139.HubBar.Size.Y.Offset);
                if v139.BottomButtonFrame then
                    v139.BottomButtonFrame.Position = UDim2.new(v139.BottomButtonFrame.Position.X.Scale, v139.BottomButtonFrame.Position.X.Offset, 0.5, 75);
                end;
            else
                v400 = v399;
                v139.HubBar.Position = UDim2.new(v139.HubBar.Position.X.Scale, v139.HubBar.Position.X.Offset, 0, v392);
                if v139.BottomButtonFrame then
                    v139.BottomButtonFrame.Position = UDim2.new(v139.BottomButtonFrame.Position.X.Scale, v139.BottomButtonFrame.Position.X.Offset, 1, -(v392 + l_Offset_0));
                end;
            end;
        else
            v400 = v399;
        end;
        local v401 = nil;
        v401 = if not v13 then if v27:IsSmallTouchScreen() then if v63.FFlagRelocateMobileMenuButtons and (not (v63.FIntRelocateMobileMenuButtonsVariant ~= 1) or v63.FIntRelocateMobileMenuButtonsVariant == 3) then UDim2.new(0, v139.HubBar.AbsoluteSize.X, 0, v400 + 0 + 0 - v139.BottomButtonFrame.Size.Y.Offset) else UDim2.new(0, v139.HubBar.AbsoluteSize.X, 0, v400 + 0 + 0) else UDim2.new(0, v139.HubBar.AbsoluteSize.X, 0, v400) else UDim2.new(0, v139.HubBar.AbsoluteSize.X, 0, v400);
        if v63.FFlagRelocateMobileMenuButtons and v63.FIntRelocateMobileMenuButtonsVariant ~= 0 and v139.BottomButtonFrame then
            v139.BottomButtonFrame.Size = UDim2.new(0, v139.HubBar.Size.X.Offset, 0, v139.HubBar.Size.Y.Offset);
        end;
        if v63.FFlagAddNextUpContainer and v139.Pages.CurrentPage and v139.Pages.CurrentPage.ShrinkwrapPageViewClipper and not v27:IsSmallTouchScreen() then
            local l_Size_0 = v139.Pages.CurrentPage:GetSize();
            v401 = UDim2.new(v401.X.Scale, v401.X.Offset, v401.Y.Scale, (math.min(l_Size_0.Y - v139.PageView.Size.Y.Offset, v400)));
        end;
        local v403 = v53.HubPadding();
        local v404 = v403.PaddingLeft.Offset + v403.PaddingRight.Offset;
        local v405 = v403.PaddingTop.Offset + v403.PaddingBottom.Offset;
        v139.ReactPage.Size = UDim2.new(0, v139.HubBar.AbsoluteSize.X + v404, 0, v400 + l_Offset_0 + v405);
        v139.PageViewClipper.Size = v401;
        v139.defaultPageViewClipperSize = v401;
        if not v393 then
            v139.PageViewClipper.Position = UDim2.new(v139.PageViewClipper.Position.X.Scale, v139.PageViewClipper.Position.X.Offset, 0.5, -v400 / 2);
        else
            v139.PageViewClipper.Position = UDim2.new(0.5, 0, 0, v139.HubBar.Position.Y.Offset + v139.HubBar.AbsoluteSize.Y);
        end;
        if v139.VerticalMenu then
            v139.VerticalMenuDivider.Size = UDim2.new(0, 1, 0, v400 + v139.HubBar.Size.Y.Offset);
            v139.VerticalMenu.Size = UDim2.new(0, v53.VerticalMenuWidth, 0, v400 + v139.HubBar.Size.Y.Offset);
        end;
        if v53.UseStickyBar() then
            v139.resetPageViewClipperSize = true;
            v139.showStickyBottomBar = true;
            if v139.pageViewScrollChangeCon then
                v139.pageViewScrollChangeCon:disconnect();
                v139.pageViewScrollChangeCon = nil;
            end;
            if not v393 then
                v139.pageViewScrollChangeCon = v139.PageView:GetPropertyChangedSignal("CanvasPosition"):connect(v139.handelPageViewScroll);
            end;
            v386();
        end;
    end;
    local function _() --[[ Line: 2565 ]] --[[ Name: onPreferredTransparencyChanged ]]
        -- upvalues: v139 (copy), v53 (ref), l_GuiService_0 (ref)
        v139.MenuContainer.BackgroundTransparency = v53.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency;
    end;
    local function v411(v408, v409, _) --[[ Line: 2569 ]] --[[ Name: toggleQuickProfilerFromHotkey ]]
        -- upvalues: l_UserInputService_0 (ref), l_GameSettings_0 (ref)
        if not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) and not l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightControl) then
            return;
        else
            if v408 == "Show Quick Profiler" and v409 and v409 == Enum.UserInputState.Begin then
                l_GameSettings_0.PerformanceStatsVisible = not l_GameSettings_0.PerformanceStatsVisible;
            end;
            return;
        end;
    end;
    local function v415(v412, v413, _) --[[ Line: 2585 ]] --[[ Name: toggleDevConsole ]]
        -- upvalues: v85 (ref)
        if v412 == "Open Dev Console" and v413 and v413 == Enum.UserInputState.Begin then
            v85:ToggleVisibility();
        end;
    end;
    local l_v13_0 = v13;
    local v417 = {
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
    l_UserInputService_0.InputBegan:connect(function(v418) --[[ Line: 2611 ]]
        -- upvalues: v417 (copy), l_v13_0 (ref)
        if v418.UserInputType and v417[v418.UserInputType] ~= nil then
            l_v13_0 = v417[v418.UserInputType];
            return;
        else
            if v418.KeyCode and v417[v418.KeyCode] then
                l_v13_0 = v417[v418.KeyCode];
            end;
            return;
        end;
    end);
    l_UserInputService_0.InputChanged:connect(function(v419) --[[ Line: 2618 ]]
        -- upvalues: l_v13_0 (ref)
        if v419.KeyCode == Enum.KeyCode.Thumbstick1 or v419.KeyCode == Enum.KeyCode.Thumbstick2 then
            if v419.Position.magnitude >= 0.25 then
                l_v13_0 = true;
                return;
            end;
        elseif v419.UserInputType == Enum.UserInputType.Touch or v419.UserInputType == Enum.UserInputType.MouseMovement then
            l_v13_0 = false;
        end;
    end);
    local v420 = nil;
    local function v428(v421, v422) --[[ Line: 2630 ]]
        -- upvalues: v63 (ref), v139 (copy), v420 (ref)
        if v63.FFlagInExperienceReportClosingBugfix and not v139.HubBar.Visible then
            return;
        else
            local v423 = v420(v139.Pages.CurrentPage);
            if v423 < 0 then
                return;
            else
                local v424 = v423 + v421;
                if v422 then
                    if #v139.TabHeaders < v424 then
                        v424 = 1;
                    elseif v424 < 1 then
                        v424 = #v139.TabHeaders;
                    end;
                end;
                local v425 = v139.TabHeaders[v424];
                if v425 then
                    for v426, _ in pairs(v139.Pages.PageTable) do
                        if v426:GetTabHeader() == v425 then
                            v139:SwitchToPage(v426, true, v421);
                            return;
                        end;
                    end;
                end;
                return;
            end;
        end;
    end;
    local function v433(_, v430, v431) --[[ Line: 2657 ]]
        -- upvalues: v428 (copy)
        if v430 ~= Enum.UserInputState.Begin then
            return;
        else
            local v432 = 0;
            if v431.KeyCode == Enum.KeyCode.ButtonR1 then
                v432 = 1;
            elseif v431.KeyCode == Enum.KeyCode.ButtonL1 then
                v432 = -1;
            end;
            v428(v432, true);
            return;
        end;
    end;
    local function v436(v434) --[[ Line: 2670 ]]
        -- upvalues: l_UserInputService_0 (ref), v428 (copy)
        if v434.KeyCode == Enum.KeyCode.Tab then
            local v435 = 0;
            v435 = (not not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift)) and -1 or 1;
            v428(v435, true);
        end;
    end;
    local function v441(_, v438, v439) --[[ Line: 2683 ]]
        -- upvalues: v139 (copy)
        if v438 ~= Enum.UserInputState.Begin then
            return;
        else
            local v440 = 0;
            if v439.KeyCode == Enum.KeyCode.PageUp then
                v440 = -100;
            elseif v439.KeyCode == Enum.KeyCode.PageDown then
                v440 = 100;
            end;
            v139:ScrollPixels(v440);
            return;
        end;
    end;
    if v63.isInExperienceUIVREnabled or v63.FFlagEnableSettingsHubUIDelegateRollout then
        v139.SettingsUIDelegate = require(l_RobloxGui_0.Modules.Settings.SettingsUIDelegate).new(v139);
    end;
    v379();
    if v105 then
        v247();
    end;
    v420 = function(v442) --[[ Line: 2707 ]] --[[ Name: GetHeaderPosition ]]
        -- upvalues: v139 (copy)
        local l_v442_TabHeader_0 = v442:GetTabHeader();
        if not l_v442_TabHeader_0 then
            return -1;
        else
            for v444, v445 in pairs(v139.TabHeaders) do
                if v445 == l_v442_TabHeader_0 then
                    return v444;
                end;
            end;
            return -1;
        end;
    end;
    local v446 = nil;
    v446 = function(v447, v448) --[[ Line: 2721 ]]
        -- upvalues: v446 (ref)
        if v448:IsA("GuiObject") then
            v448.ZIndex = v447;
            local l_v448_Children_0 = v448:GetChildren();
            for v450 = 1, #l_v448_Children_0 do
                v446(v447, l_v448_Children_0[v450]);
            end;
        end;
    end;
    local function v455(v451, v452) --[[ Line: 2731 ]] --[[ Name: AddHeader ]]
        -- upvalues: v139 (copy), v446 (ref)
        if not v451 then
            return;
        else
            table.insert(v139.TabHeaders, v451);
            v452.TabPosition = #v139.TabHeaders;
            local v453 = 1 / #v139.TabHeaders;
            for v454 = 1, #v139.TabHeaders do
                v139.TabHeaders[v454].Size = UDim2.new(v453, 0, 1, 0);
            end;
            v446(3, v451);
            v451.Parent = v139.HubBarContainer;
            return;
        end;
    end;
    local function v461(v456) --[[ Line: 2747 ]] --[[ Name: RemoveHeader ]]
        -- upvalues: v139 (copy)
        local v457 = nil;
        for v458 = 1, #v139.TabHeaders do
            if v139.TabHeaders[v458] == v456 then
                v457 = v458;
                table.remove(v139.TabHeaders, v458);
                break;
            end;
        end;
        if v457 then
            for v459 = v457, #v139.TabHeaders do
                local v460 = v139.TabHeaders[v459];
                v460.Position = UDim2.new(v460.Position.X.Scale, v460.Position.X.Offset - v456.AbsoluteSize.X, v460.Position.Y.Scale, v460.Position.Y.Offset);
            end;
        end;
        v456.Parent = nil;
    end;
    v139.AddPage = function(_, v463) --[[ Line: 2770 ]] --[[ Name: AddPage ]]
        -- upvalues: v139 (copy), v455 (copy), v63 (ref), v173 (copy)
        v139.Pages.PageTable[v463] = true;
        v455(v463:GetTabHeader(), v463);
        v463.Page.Position = UDim2.new(v463.TabPosition - 1, 0, 0, 0);
        if v63.FFlagIEMFocusNavToButtons then
            v463.LastSelectableObjectsUpdated:connect(function() --[[ Line: 2775 ]]
                -- upvalues: v173 (ref), v463 (copy)
                v173(v463);
            end);
        end;
        if v63.FFlagIEMTabFocusNav then
            if v63.FFlagIEMTabFocusNav then
                local l_v463_TabHeader_0 = v463:GetTabHeader();
                if l_v463_TabHeader_0 then
                    for _, v466 in v463.FirstSelectableObjects do
                        v466.NextSelectionUp = l_v463_TabHeader_0;
                        l_v463_TabHeader_0.NextSelectionDown = v466;
                    end;
                end;
            end;
            if v63.FFlagIEMTabFocusNav then
                for _, v468 in v139.TabHeaders do
                    v468.NextSelectionLeft = nil;
                    v468.NextSelectionRight = nil;
                end;
                local v469 = #v139.TabHeaders;
                if v469 >= 2 then
                    v139.TabHeaders[1].NextSelectionLeft = v139.TabHeaders[v469];
                    v139.TabHeaders[v469].NextSelectionRight = v139.TabHeaders[1];
                end;
            end;
            v463.FirstSelectableObjectsUpdated:connect(function() --[[ Line: 2782 ]]
                -- upvalues: v463 (copy), v63 (ref)
                local l_v463_0 = v463;
                if not v63.FFlagIEMTabFocusNav then
                    return;
                else
                    local l_l_v463_0_TabHeader_0 = l_v463_0:GetTabHeader();
                    if not l_l_v463_0_TabHeader_0 then
                        return;
                    else
                        for _, v473 in l_v463_0.FirstSelectableObjects do
                            v473.NextSelectionUp = l_l_v463_0_TabHeader_0;
                            l_l_v463_0_TabHeader_0.NextSelectionDown = v473;
                        end;
                        return;
                    end;
                end;
            end);
        end;
    end;
    v139.RemovePage = function(_, v475) --[[ Line: 2788 ]] --[[ Name: RemovePage ]]
        -- upvalues: v139 (copy), v461 (copy), v63 (ref)
        v139.Pages.PageTable[v475] = nil;
        v461(v475:GetTabHeader());
        if v63.FFlagIEMFocusNavToButtons then
            v475.LastSelectableObjectsUpdated:disconnect();
        end;
        if v63.FFlagIEMTabFocusNav then
            v475.FirstSelectableObjectsUpdated:disconnect();
            if not v63.FFlagIEMTabFocusNav then
                return;
            else
                for _, v477 in v139.TabHeaders do
                    v477.NextSelectionLeft = nil;
                    v477.NextSelectionRight = nil;
                end;
                local v478 = #v139.TabHeaders;
                if v478 < 2 then
                    return;
                else
                    v139.TabHeaders[1].NextSelectionLeft = v139.TabHeaders[v478];
                    v139.TabHeaders[v478].NextSelectionRight = v139.TabHeaders[1];
                end;
            end;
        end;
    end;
    v139.bottomBarAnimating = false;
    v139.defaultPageViewClipperSize = v139.PageViewClipper.Size;
    v139.showStickyBottomBar = true;
    v139.resetPageViewClipperSize = false;
    animateBottomBarComplete = function() --[[ Line: 2805 ]] --[[ Name: animateBottomBarComplete ]]
        -- upvalues: v139 (copy)
        if v139.resetPageViewClipperSize then
            v139.PageViewClipper.Size = v139.defaultPageViewClipperSize;
            v139.resetPageViewClipperSize = false;
        end;
        v139.bottomBarAnimating = false;
    end;
    v139.animateInBottomBar = function(_) --[[ Line: 2814 ]] --[[ Name: animateInBottomBar ]]
        -- upvalues: v139 (copy), l_game_EngineFeature_0 (ref)
        if v139.bottomBarAnimating or v139.showStickyBottomBar == true then
            return;
        else
            v139.bottomBarAnimating = true;
            v139.showStickyBottomBar = true;
            v139.resetPageViewClipperSize = false;
            local v480 = UDim2.new(v139.defaultPageViewClipperSize.X.Scale, v139.defaultPageViewClipperSize.X.Offset, v139.defaultPageViewClipperSize.Y.Scale, v139.defaultPageViewClipperSize.Y.Offset);
            if l_game_EngineFeature_0 then
                v139.PageViewClipper:TweenSizeInternal(v480, Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, 0.3, true, animateBottomBarComplete);
                return;
            else
                v139.PageViewClipper:TweenSize(v480, Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, 0.3, true, animateBottomBarComplete);
                return;
            end;
        end;
    end;
    v139.animateOutBottomBar = function(_) --[[ Line: 2853 ]] --[[ Name: animateOutBottomBar ]]
        -- upvalues: v139 (copy), l_game_EngineFeature_0 (ref)
        if v139.bottomBarAnimating or v139.showStickyBottomBar == false then
            return;
        else
            v139.bottomBarAnimating = true;
            v139.showStickyBottomBar = false;
            v139.resetPageViewClipperSize = false;
            local v482 = UDim2.new(v139.defaultPageViewClipperSize.X.Scale, v139.defaultPageViewClipperSize.X.Offset, v139.defaultPageViewClipperSize.Y.Scale, v139.defaultPageViewClipperSize.Y.Offset + 80);
            if l_game_EngineFeature_0 then
                v139.PageViewClipper:TweenSizeInternal(v482, Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, 0.3, true, animateBottomBarComplete);
                return;
            else
                v139.PageViewClipper:TweenSize(v482, Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, 0.3, true, animateBottomBarComplete);
                return;
            end;
        end;
    end;
    v139.HideBar = function(_) --[[ Line: 2892 ]] --[[ Name: HideBar ]]
        -- upvalues: v139 (copy), v190 (copy)
        v139.HubBar.Visible = false;
        v139.PageViewClipper.Visible = false;
        if v139.BottomButtonFrame then
            v190();
        end;
    end;
    v139.ShowBar = function(_) --[[ Line: 2900 ]] --[[ Name: ShowBar ]]
        -- upvalues: v139 (copy), v176 (copy), v184 (copy), v63 (ref), v173 (copy)
        v139.HubBar.Visible = true;
        v139.PageViewClipper.Visible = true;
        if v139.BottomButtonFrame and v176() then
            v184();
            if v63.FFlagIEMFocusNavToButtons then
                v173(v139.Pages.CurrentPage);
            end;
        end;
    end;
    v139.ScrollPixels = function(_, v486) --[[ Line: 2911 ]] --[[ Name: ScrollPixels ]]
        -- upvalues: v139 (copy)
        local l_Y_1 = v139.PageView.CanvasPosition.Y;
        local v488 = v139.PageView.CanvasSize.Y.Offset - v139.PageViewClipper.AbsoluteSize.y;
        local v489 = math.max(0, (math.min(l_Y_1 + v486, v488)));
        v139.PageView.CanvasPosition = Vector2.new(0, v489);
    end;
    v139.ScrollToFrame = function(_, v491, v492) --[[ Line: 2919 ]] --[[ Name: ScrollToFrame ]]
        -- upvalues: l_v13_0 (ref), v139 (copy), l_Constants_0 (ref)
        if l_v13_0 or v492 then
            local v493 = v491.AbsolutePosition.y - v139.Pages.CurrentPage.Page.AbsolutePosition.y;
            local v494 = v493 + v491.AbsoluteSize.y;
            if v493 < v139.PageView.CanvasPosition.y then
                v139.PageView.CanvasPosition = Vector2.new(0, v493);
                return;
            elseif v139.Pages.CurrentPage.Page.Name == l_Constants_0.PeoplePageKey and v494 - v139.PageView.CanvasPosition.y > v139.PageView.AbsoluteSize.Y - l_Constants_0.PeoplePageScrollBuffer then
                v139.PageView.CanvasPosition = Vector2.new(0, v494 - v139.PageView.AbsoluteSize.Y + l_Constants_0.PeoplePageScrollBuffer);
                return;
            elseif v494 - v139.PageView.CanvasPosition.y > v139.PageViewClipper.Size.Y.Offset then
                v139.PageView.CanvasPosition = Vector2.new(0, v494 - v139.PageViewClipper.Size.Y.Offset);
            end;
        end;
    end;
    v139.GetFirstPageWithTabHeader = function(_) --[[ Line: 2934 ]] --[[ Name: GetFirstPageWithTabHeader ]]
        -- upvalues: v139 (copy)
        local v496 = nil;
        for v497, _ in pairs(v139.Pages.PageTable) do
            if v497:GetTabHeader() ~= nil and v497.TabPosition == 1 then
                v496 = v497;
                break;
            end;
        end;
        if v496 == nil then
            error("No page with tab header found");
            return nil;
        else
            return v496;
        end;
    end;
    v139.InitInPage = function(_, v500) --[[ Line: 2953 ]] --[[ Name: InitInPage ]]
        -- upvalues: v139 (copy), v63 (ref), v27 (ref), v176 (copy), v184 (copy), v173 (copy), v53 (ref), v144 (ref)
        local l_TabPosition_0 = v500.TabPosition;
        for v502, _ in pairs(v139.Pages.PageTable) do
            if v502 ~= v500 then
                v502:Hide(-1, l_TabPosition_0, true, nil, v139.PageViewInnerFrame);
            end;
        end;
        if (not v63.FFlagRelocateMobileMenuButtons or v63.FIntRelocateMobileMenuButtonsVariant == 0 or v63.FIntRelocateMobileMenuButtonsVariant == 2 and v27:IsSmallTouchScreen()) and v139.BottomButtonFrame then
            if v176(v500) then
                v184();
                if v63.FFlagIEMFocusNavToButtons then
                    v173(v500);
                end;
            else
                v139.BottomButtonFrame.Visible = false;
            end;
            v139.HubBar.Visible = (v500 or v139.Pages.CurrentPage).ShouldShowBottomBar == true;
        end;
        local v504 = v500.IsPageClipped == true;
        v139.PageViewClipper.ClipsDescendants = v504;
        v139.PageView.ClipsDescendants = v504;
        if v53.UseStickyBar() == false then
            v139.PageViewInnerFrame.ClipsDescendants = v504;
        end;
        v139.Pages.CurrentPage = v500;
        v139.Pages.CurrentPage.Active = true;
        v139.CurrentPageSignal:fire(v139.Pages.CurrentPage and v139.Pages.CurrentPage.Page.Name or nil);
        if v53.UseStickyBar() == false then
            local l_Size_1 = v139.Pages.CurrentPage:GetSize();
            v139.PageView.CanvasSize = UDim2.new(0, 0, 0, l_Size_1.Y);
            v144 = v139.Pages.CurrentPage.Page.Changed:connect(function(v506) --[[ Line: 2995 ]]
                -- upvalues: v139 (ref)
                if v506 == "AbsoluteSize" then
                    local l_Size_2 = v139.Pages.CurrentPage:GetSize();
                    v139.PageView.CanvasSize = UDim2.new(0, 0, 0, l_Size_2.Y);
                end;
            end);
        end;
    end;
    v139.SwitchToPage = function(_, v509, v510, v511, v512, _, v514) --[[ Line: 3004 ]] --[[ Name: SwitchToPage ]]
        -- upvalues: v139 (copy), v63 (ref), v106 (ref), v27 (ref), v53 (ref), v176 (copy), l_RobloxGui_0 (ref), v144 (ref), v184 (copy), v173 (copy), v406 (copy), v15 (ref), l_IXPServiceWrapper_0 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), v62 (ref), l_ExperienceMenuSessionManagerInstance_0 (ref)
        if v139.Pages.PageTable[v509] == nil then
            return;
        elseif v63.FFlagPreventHiddenSwitchPage and v139:GetVisibility() == false then
            return;
        else
            if v106 then
                if v509.Page.Name == "ReportAbuseMenuNewContainerPage" then
                    v139.PageViewInnerFrame.UIPadding.PaddingTop = UDim.new(0, 0);
                else
                    v139.PageViewInnerFrame.UIPadding.PaddingTop = UDim.new(0, 5);
                end;
            end;
            local v515 = UDim.new(0, 0);
            local v516 = UDim.new(0, 0);
            local v517 = not (v27:IsPortrait() or v27:IsSmallTouchScreen()) or v53.AlwaysShowBottomBar();
            if v63.FFlagRelocateMobileMenuButtons and (v63.FIntRelocateMobileMenuButtonsVariant == 1 or v63.FIntRelocateMobileMenuButtonsVariant == 3 or v63.FIntRelocateMobileMenuButtonsVariant == 2 and not v27:IsSmallTouchScreen()) then
                v517 = true;
            end;
            if v139.HubBar and not ((v509 or v139.Pages.CurrentPage).ShouldShowBottomBar == true) and not v509.DisableTopPadding then
                v515 = UDim.new(0, v139.HubBar.AbsoluteSize.Y);
            end;
            if v139.BottomButtonFrame and v517 and not v176(v509) and (not v63.FFlagAddNextUpContainer or not v509.ShrinkwrapPageViewClipper) then
                v516 = UDim.new(0, v139.BottomButtonFrame.AbsoluteSize.Y);
            end;
            local v518 = v53.HubPadding();
            v139.MenuContainerPadding.PaddingLeft = v518.PaddingLeft;
            v139.MenuContainerPadding.PaddingRight = v518.PaddingRight;
            v139.MenuContainerPadding.PaddingBottom = v518.PaddingBottom + v516;
            v139.MenuContainerPadding.PaddingTop = v518.PaddingTop + v515;
            local v519 = v53.MenuContainerPosition(v139.SettingsUIDelegate);
            v139.MenuContainer.Position = v519.Position;
            v139.MenuContainer.Size = v519.Size;
            v139.MenuContainer.AnchorPoint = v519.AnchorPoint;
            if v139.VerticalMenu and not v27:IsPortrait() and v27:IsSmallTouchScreen() then
                local v520 = (v509 or v139.Pages.CurrentPage).ShouldShowBottomBar == true;
                v139.VerticalMenu.Visible = v520;
                v139.VerticalMenuDivider.Visible = v520;
                if v520 then
                    v139.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 60 - v53.VerticalMenuWidth, 0, 52);
                else
                    v139.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 60, 0, 52);
                end;
                local l_Size_3 = v139.PageViewClipper.Size;
                v139.PageViewClipper.Size = UDim2.new(l_Size_3.X.Scale, v139.HubBar.Size.X.Offset, l_Size_3.Y.Scale, l_Size_3.Y.Offset);
            elseif v63.FFlagAddNextUpContainer and v509.ShrinkwrapPageViewClipper then
                local l_Size_4 = v139.PageViewClipper.Size;
                local l_v509_Size_0 = v509:GetSize();
                v139.PageViewClipper.Size = UDim2.new(l_Size_4.X.Scale, v139.HubBar.Size.X.Offset, l_Size_4.Y.Scale, l_v509_Size_0.Y);
            end;
            if v511 == nil and v139.Pages.CurrentPage and v139.Pages.CurrentPage.TabHeader and v509 and v509.TabHeader then
                v511 = v139.Pages.CurrentPage.TabHeader.AbsolutePosition.x < v509.TabHeader.AbsolutePosition.x and 1 or -1;
            end;
            if v511 == nil then
                v511 = 1;
            end;
            if v139.Pages.CurrentPage and v144 ~= nil then
                v144:disconnect();
                v139.Pages.CurrentPage.Active = false;
            end;
            local l_TabPosition_1 = v509.TabPosition;
            for v525, _ in pairs(v139.Pages.PageTable) do
                if v525 ~= v509 then
                    v525:Hide(-v511, l_TabPosition_1, v512, nil, v139.PageViewInnerFrame, v525 == v139.Pages.CurrentPage);
                end;
            end;
            if v139.BottomButtonFrame then
                if v176(v509) then
                    v184();
                    if v63.FFlagIEMFocusNavToButtons then
                        v173(v509);
                    end;
                else
                    v139.BottomButtonFrame.Visible = false;
                end;
                v139.HubBar.Visible = (v509 or v139.Pages.CurrentPage).ShouldShowBottomBar == true;
            end;
            if v63.FFlagIEMTabFocusNav and v63.FFlagIEMTabFocusNav then
                local l_v509_TabHeader_0 = v509:GetTabHeader();
                if l_v509_TabHeader_0 then
                    for _, v529 in v509.FirstSelectableObjects do
                        v529.NextSelectionUp = l_v509_TabHeader_0;
                        l_v509_TabHeader_0.NextSelectionDown = v529;
                    end;
                end;
            end;
            local v530 = v509.IsPageClipped == true;
            v139.PageViewClipper.ClipsDescendants = v530;
            v139.PageView.ClipsDescendants = v530;
            v139.PageViewInnerFrame.ClipsDescendants = v530;
            v139.Pages.CurrentPage = v509;
            v139.Pages.CurrentPage:Display(v139.PageViewInnerFrame, v512);
            v139.Pages.CurrentPage.Active = true;
            v139.CurrentPageSignal:fire(v139.Pages.CurrentPage and v139.Pages.CurrentPage.Page.Name or nil);
            if v63.FFlagAddAbilityToDisableIGMScroll then
                local v531 = nil or v139.Pages.CurrentPage;
                local v532 = false;
                if v531 ~= nil then
                    v532 = v531.ShouldDisableDefaultScroll == true;
                end;
                if v532 then
                    v139.PageView.ScrollBarThickness = 0;
                    v139.PageView.ScrollingEnabled = false;
                    v139.PageView.CanvasPosition = Vector2.new(0, 0);
                    v139.PageView.CanvasSize = UDim2.new(1, 0, 1, 0);
                else
                    v139.PageView.ScrollBarThickness = v53.DefaultScrollBarThickness;
                    v139.PageView.ScrollingEnabled = true;
                end;
            end;
            if v53.UseStickyBar() == false then
                if v63.FFlagAddAbilityToDisableIGMScroll then
                    local v533 = nil or v139.Pages.CurrentPage;
                    local v534 = false;
                    if v533 ~= nil then
                        v534 = v533.ShouldDisableDefaultScroll == true;
                    end;
                    if not v534 then
                        v534 = v139.Pages.CurrentPage:GetSize();
                        v139.PageView.CanvasSize = UDim2.new(0, 0, 0, v534.Y);
                    end;
                else
                    local l_Size_5 = v139.Pages.CurrentPage:GetSize();
                    v139.PageView.CanvasSize = UDim2.new(0, 0, 0, l_Size_5.Y);
                end;
                v144 = v139.Pages.CurrentPage.Page.Changed:connect(function(v536) --[[ Line: 3139 ]]
                    -- upvalues: v63 (ref), v139 (ref), v406 (ref)
                    local v537 = false;
                    if v536 == "AbsoluteSize" then
                        if v63.FFlagAddAbilityToDisableIGMScroll then
                            local v538 = nil or v139.Pages.CurrentPage;
                            local v539 = false;
                            if v538 ~= nil then
                                v539 = v538.ShouldDisableDefaultScroll == true;
                            end;
                            v537 = v539;
                        end;
                        if not v537 then
                            local l_Size_6 = v139.Pages.CurrentPage:GetSize();
                            v139.PageView.CanvasSize = UDim2.new(0, 0, 0, l_Size_6.Y);
                            if v63.FFlagAddNextUpContainer and v139.Pages.CurrentPage.ShrinkwrapPageViewClipper then
                                v406();
                            end;
                        end;
                    end;
                    v537 = false;
                end);
                if v139.MenuStack[#v139.MenuStack] ~= v139.Pages.CurrentPage and not v510 then
                    v139.MenuStack[#v139.MenuStack + 1] = v139.Pages.CurrentPage;
                end;
            end;
            if v63.FFlagAddNextUpContainer then
                v406();
            elseif v509.DisableTopPadding then
                v406();
            end;
            local v541 = {
                universeid = tostring(game.GameId)
            };
            if v63.GetFFlagReportAbuseMenuEntrypointAnalytics() and v514 then
                v541 = v15.Dictionary.join(v541, v514);
            end;
            if v63.FFlagRespawnChromeShortcutTelemetry and v541.used_shortcut == nil then
                v541.used_shortcut = false;
            end;
            if v541.playsessionid == nil then
                v541.playsessionid = v139.playSessionId;
            end;
            if v509 then
                if v63.FFlagHelpPageIXPExposure and v139.HelpPage == v509 and not v139.HelpPageIXPFetched then
                    l_IXPServiceWrapper_0:LogUserLayerExposure(v63.FStringHelpPageIXPLayer);
                    v139.HelpPageIXPFetched = true;
                end;
                if v139.GameSettingsPage == v509 then
                    l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, "open_GameSettings_tab", l_Constants_0.AnalyticsMenuActionName, v541);
                    if v62.FFlagIEMSettingsLogExposureIXPFlags and not v139.GameSettingsPageReorderIXPFetched then
                        l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(v63.GetFStringInExperienceMenuIXPLayer());
                        v139.GameSettingsPageReorderIXPFetched = true;
                    end;
                else
                    l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, "open_" .. v509.Page.Name .. "_tab", l_Constants_0.AnalyticsMenuActionName, v541);
                end;
                l_ExperienceMenuSessionManagerInstance_0:MenuSwitchToPage(v509.Page);
                return;
            else
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, "open_unknown_tab", l_Constants_0.AnalyticsMenuActionName, v541);
                l_ExperienceMenuSessionManagerInstance_0:CloseOpenedMenuTab();
                return;
            end;
        end;
    end;
    v139.SetActive = function(_, v543) --[[ Line: 3205 ]] --[[ Name: SetActive ]]
        -- upvalues: v139 (copy)
        v139.Active = v543;
        if v139.Pages.CurrentPage then
            v139.Pages.CurrentPage.Active = v543;
        end;
    end;
    clearMenuStack = function() --[[ Line: 3213 ]] --[[ Name: clearMenuStack ]]
        -- upvalues: v139 (copy)
        while v139.MenuStack and #v139.MenuStack > 0 do
            v139:PopMenu();
        end;
    end;
    setOverrideMouseIconBehavior = function() --[[ Line: 3219 ]] --[[ Name: setOverrideMouseIconBehavior ]]
        -- upvalues: v139 (copy), l_UserInputService_0 (ref), l_VRService_0 (ref), l_MouseIconOverrideService_0 (ref), v57 (ref)
        if not v139.Visible then
            return;
        elseif l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Gamepad1 or l_VRService_0.VREnabled then
            l_MouseIconOverrideService_0.push(v57, Enum.OverrideMouseIconBehavior.ForceHide);
            return;
        else
            l_MouseIconOverrideService_0.push(v57, Enum.OverrideMouseIconBehavior.ForceShow);
            return;
        end;
    end;
    checkLeaveGameUpsell = function() --[[ Line: 3231 ]] --[[ Name: checkLeaveGameUpsell ]]
        -- upvalues: v63 (ref), v139 (copy), v104 (ref), l_default_0 (ref), v59 (ref)
        if not v63.GetFFlagEnableLeaveGameUpsellEntrypoint() then
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
                task.delay(v59, function() --[[ Line: 3252 ]]
                    -- upvalues: v139 (ref)
                    v139.checkedUpsell = false;
                end);
                return;
            else
                if v139.checkedUpsell then
                    local v544 = l_default_0:FetchPhoneVerificationUpsell(v104.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, v139.sessionStartTime, false);
                    if v139.leaveGameUpsellProp ~= v544 then
                        v139.leaveGameUpsellProp = v544;
                        v139.LeaveGameUpsellPage:SetUpsellProp(v139.leaveGameUpsellProp);
                    end;
                end;
                return;
            end;
        end;
    end;
    local v545 = nil;
    if v63.FFlagSettingsHubIndependentBackgroundVisibility then
        v545 = function(v546, v547) --[[ Line: 3267 ]]
            -- upvalues: v139 (copy), l_InExperienceAppChatModal_0 (ref), l_Constants_0 (ref), v63 (ref), v53 (ref), l_TweenService_0 (ref)
            if not v139.DarkenBackground then
                return;
            elseif not v546 and v139.DarkenBackground.Visible and (l_InExperienceAppChatModal_0:getVisible() or v139.Visible) then
                return;
            else
                local v548 = 1;
                local l_Quart_0 = Enum.EasingStyle.Quart;
                local v550 = 0;
                v550 = if l_Constants_0 then l_Constants_0.ShieldCloseAnimationTweenTime else 0.4;
                if v546 then
                    v548 = if v63.isInExperienceUIVREnabled then v139.SettingsUIDelegate:getDarkBackgroundTheme().Transparency else v53.transparency("DarkenBackground");
                    l_Quart_0 = Enum.EasingStyle.Quad;
                    v550 = if l_Constants_0 then l_Constants_0.ShieldOpenAnimationTweenTime else 0.5;
                end;
                if v547 then
                    if v139.DarkenBackgroundTween then
                        v139.DarkenBackgroundTween:Cancel();
                        v139.DarkenBackgroundTween = nil;
                    end;
                    v139.DarkenBackground.BackgroundTransparency = v548;
                else
                    local v551 = TweenInfo.new(v550, l_Quart_0, Enum.EasingDirection.Out);
                    if v139.DarkenBackgroundTween then
                        v139.DarkenBackgroundTween:Cancel();
                    end;
                    v139.DarkenBackgroundTween = l_TweenService_0:Create(v139.DarkenBackground, v551, {
                        BackgroundTransparency = v548
                    });
                    v139.DarkenBackgroundTween:Play();
                end;
                v139.DarkenBackground.Visible = v546;
                return;
            end;
        end;
    end;
    v260 = function(v552, v553, v554, _, v556) --[[ Line: 3314 ]] --[[ Name: setVisibilityInternal ]]
        -- upvalues: v63 (ref), v139 (copy), v30 (ref), l_RobloxGui_0 (ref), v545 (ref), v406 (copy), v27 (ref), v277 (copy), l_GuiService_0 (ref), v53 (ref), l_ExperienceMenuSessionManagerInstance_0 (ref), l_Constants_0 (ref), l_GameSettings_0 (ref), l_TweenService_0 (ref), l_game_EngineFeature_0 (ref), l_ContextActionService_0 (ref), v433 (copy), v441 (copy), v176 (copy), v184 (copy), v173 (copy), l_UserInputService_0 (ref), v436 (copy), v86 (ref), l_VRService_0 (ref), l_MouseIconOverrideService_0 (ref), v57 (ref), v190 (copy), v120 (ref), l_FFlagEnableNewBackpack_0 (ref), v4 (ref), l_InExperienceAppChatModal_0 (ref), v87 (ref), v278 (copy), l_SHIELD_INACTIVE_POSITION_0 (ref), l_RbxAnalyticsService_0 (ref)
        local v557 = nil;
        v557 = if v63.isInExperienceUIVREnabled then v553 or not v139.SettingsUIDelegate:isOpenCloseAnimationAllowed() else v553;
        v139.OpenStateChangedCount = v139.OpenStateChangedCount + 1;
        local v558 = v552 ~= v139.Visible;
        v139.Visible = v552;
        if v63.FFlagEnableInGameMenuDurationLogger and v558 and not v552 then
            v30.menuClose();
        end;
        if v139.ResizedConnection then
            v139.ResizedConnection:disconnect();
            v139.ResizedConnection = nil;
        end;
        if v139.BackBarVisibleConnection then
            v139.BackBarVisibleConnection:disconnect();
            v139.BackBarVisibleConnection = nil;
        end;
        if v63.EngineFeatureTeleportHistoryButtons and v139.FrontBarVisibleConnection then
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
        local v559 = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
        if v63.FFlagSettingsHubIndependentBackgroundVisibility then
            v545(v139.Visible, v557);
        end;
        if v139.Visible then
            v139.ResizedConnection = l_RobloxGui_0.Changed:connect(function(v560) --[[ Line: 3364 ]]
                -- upvalues: v406 (ref)
                if v560 == "AbsoluteSize" then
                    v406();
                end;
            end);
            if v63.FFlagMenuButtonsMountWithIEM then
                if v63.FFlagRelocateMobileMenuButtons and (v63.FIntRelocateMobileMenuButtonsVariant == 1 or v63.FIntRelocateMobileMenuButtonsVariant == 3 or v63.FIntRelocateMobileMenuButtonsVariant == 2 and not v27:IsSmallTouchScreen()) then
                    v277();
                end;
                if v63.FFlagRelocateMobileMenuButtons and v63.FIntRelocateMobileMenuButtonsVariant == 2 and v27:IsSmallTouchScreen() and v139.PlayersPage then
                    v139.PlayersPage:CreateMenuButtonsContainer();
                end;
            end;
            if not v63.FFlagAddTraversalBackButton then
                if v139.BackBarRef:getValue() then
                    v139.BackBarVisibleConnection = v139.BackBarRef:getValue():GetPropertyChangedSignal("Visible"):connect(function() --[[ Line: 3384 ]]
                        -- upvalues: v406 (ref)
                        v406();
                    end);
                end;
                if v63.EngineFeatureTeleportHistoryButtons and v139.FrontBarRef:getValue() then
                    v139.FrontBarVisibleConnection = v139.FrontBarRef:getValue():GetPropertyChangedSignal("Visible"):connect(function() --[[ Line: 3389 ]]
                        -- upvalues: v406 (ref)
                        v406();
                    end);
                end;
            end;
            v406();
            v139.PreferredTransparencyChangedConnection = l_GuiService_0:GetPropertyChangedSignal("PreferredTransparency"):connect(function() --[[ Line: 3396 ]]
                -- upvalues: v139 (ref), v53 (ref), l_GuiService_0 (ref)
                v139.MenuContainer.BackgroundTransparency = v53.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency;
            end);
            v139.MenuContainer.BackgroundTransparency = v53.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency;
            v139.SettingsShowSignal:fire(v139.Visible);
            l_GuiService_0:SetMenuIsOpen(true, "SettingsHub");
            l_ExperienceMenuSessionManagerInstance_0:OpenExperienceMenu();
            v139.Shield.Visible = v139.Visible;
            l_GuiService_0:CloseInspectMenu();
            if v557 or not v139.Shield:IsDescendantOf(game) then
                v139.Shield.Position = UDim2.new(0, 0, 0, 0);
                if not v63.FFlagSettingsHubIndependentBackgroundVisibility and v139.DarkenBackground then
                    if v139.DarkenBackgroundTween then
                        v139.DarkenBackgroundTween:Cancel();
                        v139.DarkenBackgroundTween = nil;
                    end;
                    v139.DarkenBackground.BackgroundTransparency = v53.transparency("DarkenBackground");
                end;
            else
                local v561 = if l_Constants_0 then l_Constants_0.ShieldOpenAnimationTweenTime else 0.5;
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
                    local v562 = TweenInfo.new(0.25);
                    local v563 = {
                        GroupTransparency = 0
                    };
                    v139.ReducedMotionOpenTween = l_TweenService_0:Create(v139.CanvasGroup, v562, v563);
                    v139.ReducedMotionOpenTween:Play();
                    v139.ReducedMotionOpenTween.Completed:Connect(function(v564) --[[ Line: 3445 ]]
                        -- upvalues: v139 (ref)
                        if v564 == Enum.PlaybackState.Completed then
                            v139.Shield.Parent = v139.ClippingShield;
                            v139.ReducedMotionOpenTween = nil;
                        end;
                        v139.CanvasGroup.Visible = false;
                    end);
                    if v63.FFlagEnableInGameMenuDurationLogger then
                        v30.menuOpenComplete();
                    end;
                elseif l_game_EngineFeature_0 then
                    v139.Shield:TweenPositionInternal(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, v561, true, function() --[[ Line: 3465 ]]
                        -- upvalues: v63 (ref), v30 (ref)
                        if v63.FFlagEnableInGameMenuDurationLogger then
                            v30.menuOpenComplete();
                        end;
                    end);
                else
                    v139.Shield:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, v561, true, function() --[[ Line: 3478 ]]
                        -- upvalues: v63 (ref), v30 (ref)
                        if v63.FFlagEnableInGameMenuDurationLogger then
                            v30.menuOpenComplete();
                        end;
                    end);
                end;
                if not v63.FFlagSettingsHubIndependentBackgroundVisibility and v139.DarkenBackground then
                    local v565 = TweenInfo.new(v561, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                    if v139.DarkenBackgroundTween then
                        v139.DarkenBackgroundTween:Cancel();
                    end;
                    v139.DarkenBackgroundTween = l_TweenService_0:Create(v139.DarkenBackground, v565, {
                        BackgroundTransparency = v53.transparency("DarkenBackground")
                    });
                    v139.DarkenBackgroundTween:Play();
                end;
            end;
            local function v566() --[[ Line: 3503 ]]

            end;
            if v63.isInExperienceUIVREnabled then
                v566 = function(v567, v568, v569) --[[ Line: 3505 ]]
                    -- upvalues: v139 (ref)
                    if v139.SettingsUIDelegate:isInputEventNeededBySettings(v567, v568, v569) then
                        return Enum.ContextActionResult.Pass;
                    else
                        return nil;
                    end;
                end;
            end;
            l_ContextActionService_0:BindCoreAction("RbxSettingsHubStopCharacter", v566, false, Enum.PlayerActions.CharacterForward, Enum.PlayerActions.CharacterBackward, Enum.PlayerActions.CharacterLeft, Enum.PlayerActions.CharacterRight, Enum.PlayerActions.CharacterJump, Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift, Enum.KeyCode.Tab, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4);
            l_ContextActionService_0:BindCoreAction("RbxSettingsHubSwitchTab", v433, false, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL1);
            l_ContextActionService_0:BindCoreAction("RbxSettingsScrollHotkey", v441, false, Enum.KeyCode.PageUp, Enum.KeyCode.PageDown);
            if v176() then
                v184();
                if v63.FFlagIEMFocusNavToButtons then
                    v173(v139.Pages.CurrentPage);
                end;
            end;
            if v63.ChromeEnabled and v63.FFlagEnableConsoleExpControls then
                require(l_RobloxGui_0.Modules.Chrome.Service):setShortcutBar(require(l_RobloxGui_0.Modules.Chrome.ChromeShared.Unibar.Constants).TILTMENU_SHORTCUTBAR_ID);
            end;
            v139.TabConnection = l_UserInputService_0.InputBegan:connect(v436);
            setOverrideMouseIconBehavior();
            v86 = l_UserInputService_0.LastInputTypeChanged:connect(setOverrideMouseIconBehavior);
            if l_UserInputService_0.MouseEnabled and not l_VRService_0.VREnabled then
                l_MouseIconOverrideService_0.push(v57, Enum.OverrideMouseIconBehavior.ForceShow);
            end;
            v139:CloseReactPage();
            if v554 then
                v190();
                v139:SwitchToPage(v554, nil, 1, true);
            else
                v139:SwitchToPage(v139:GetFirstPageWithTabHeader(), nil, 1, true);
            end;
            if not v63.isInExperienceUIVREnabled or v63.InExperienceUIVRIXP:isMovePanelToCenter() and true or not l_VRService_0.VREnabled then
                if v63.FFlagAddNewPlayerListMobileFocusNav then
                    if v559:GetIsModal() then
                        v559:SetVisibility(false);
                    else
                        v559:HideTemp("SettingsMenu", true);
                    end;
                else
                    v559:HideTemp("SettingsMenu", true);
                end;
                if not v63.isInExperienceUIVREnabled or not v63.InExperienceUIVRIXP:isMovePanelToCenter() or not v63.FFlagSpatialUIFixMenuPanelChatExclusive or not l_VRService_0.VREnabled then
                    v120:HideTemp("SettingsMenu", true);
                end;
                if l_FFlagEnableNewBackpack_0 then
                    v4.setVisibility(v4.FeatureName.Backpack, false);
                else
                    local v570 = require(l_RobloxGui_0.Modules.BackpackScript);
                    if v570.IsOpen then
                        v570:OpenClose();
                    end;
                end;
            end;
            if v63.GetFFlagEnableAppChatInExperience() and l_InExperienceAppChatModal_0:getVisible() then
                v87 = true;
                l_InExperienceAppChatModal_0.default:setVisible(false);
            end;
            if not v63.isInExperienceUIVREnabled then
                if l_FFlagEnableNewBackpack_0 then
                    v4.setVisibility(v4.FeatureName.Backpack, false);
                else
                    local v571 = require(l_RobloxGui_0.Modules.BackpackScript);
                    if v571.IsOpen then
                        v571:OpenClose();
                    end;
                end;
            end;
            v139.GameSettingsPage:OpenSettingsPage();
        else
            v139.CurrentPageSignal:fire("");
            if v63.FFlagMenuButtonsMountWithIEM and v63.FFlagRelocateMobileMenuButtons then
                if v63.FIntRelocateMobileMenuButtonsVariant ~= 0 then
                    v278();
                end;
                if v63.FIntRelocateMobileMenuButtonsVariant == 2 and v139.PlayersPage then
                    v139.PlayersPage:UnmountMenuButtonsContainer();
                end;
            end;
            if v63.ChromeEnabled and v63.FFlagEnableConsoleExpControls then
                local v572 = require(l_RobloxGui_0.Modules.Chrome.Service);
                if v63.FFlagSetUnibarShortcutOnTopBarFocus then
                    v572:setShortcutBar(nil);
                else
                    v572:setShortcutBar(require(l_RobloxGui_0.Modules.Chrome.ChromeShared.Unibar.Constants).UNIBAR_SHORTCUTBAR_ID);
                end;
            end;
            if v63.GetFFlagEnableAppChatInExperience() and v87 then
                v87 = false;
            end;
            if v63.isInExperienceUIVREnabled and v63.InExperienceUIVRIXP:isMovePanelToCenter() then
                v559:HideTemp("SettingsMenu", false);
                if not v63.FFlagSpatialUIFixMenuPanelChatExclusive or not l_VRService_0.VREnabled then
                    v120:HideTemp("SettingsMenu", false);
                end;
            end;
            if v557 then
                v139.Shield.Position = l_SHIELD_INACTIVE_POSITION_0;
                v139.Shield.Visible = v139.Visible;
                v139.SettingsShowSignal:fire(v139.Visible);
                l_GuiService_0:SetMenuIsOpen(false, "SettingsHub");
                l_ExperienceMenuSessionManagerInstance_0:CloseExperienceMenu();
                if v63.FFlagEnableInGameMenuDurationLogger then
                    v30.menuCloseComplete();
                end;
                if not v63.FFlagSettingsHubIndependentBackgroundVisibility and v139.DarkenBackground then
                    if v139.DarkenBackgroundTween then
                        v139.DarkenBackgroundTween:Cancel();
                        v139.DarkenBackgroundTween = nil;
                    end;
                    v139.DarkenBackground.BackgroundTransparency = 1;
                end;
            else
                local v573 = if l_Constants_0 then l_Constants_0.ShieldCloseAnimationTweenTime else 0.4;
                local function v574() --[[ Line: 3665 ]] --[[ Name: handleShieldClose ]]
                    -- upvalues: v63 (ref), v139 (ref), l_GuiService_0 (ref), l_ExperienceMenuSessionManagerInstance_0 (ref), v30 (ref)
                    if not v63.FFlagAddTraversalBackButton then
                        v139.SettingsShowSignal:fire(v139.Visible);
                    end;
                    if not v139.Visible then
                        l_GuiService_0:SetMenuIsOpen(false, "SettingsHub");
                        l_ExperienceMenuSessionManagerInstance_0:CloseExperienceMenu();
                    end;
                    if v63.FFlagEnableInGameMenuDurationLogger then
                        v30.menuCloseComplete();
                    end;
                end;
                if v63.FFlagAddTraversalBackButton then
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
                    local v575 = TweenInfo.new(0.25);
                    local v576 = {
                        GroupTransparency = 1
                    };
                    v139.ReducedMotionCloseTween = l_TweenService_0:Create(v139.CanvasGroup, v575, v576);
                    v139.ReducedMotionCloseTween:Play();
                    v139.ReducedMotionCloseTween.Completed:Connect(function(v577) --[[ Line: 3701 ]]
                        -- upvalues: v139 (ref), l_SHIELD_INACTIVE_POSITION_0 (ref)
                        if v577 == Enum.PlaybackState.Completed then
                            v139.Shield.Position = l_SHIELD_INACTIVE_POSITION_0;
                            v139.Shield.Visible = v139.Visible;
                            v139.Shield.Parent = v139.ClippingShield;
                            v139.ReducedMotionCloseTween = nil;
                        end;
                        v139.CanvasGroup.Visible = false;
                    end);
                    v574();
                else
                    if v63.ChromeEnabled and v63.FFlagEnableConsoleExpControls then
                        local v578 = require(l_RobloxGui_0.Modules.Chrome.Service);
                        if v63.FFlagSetUnibarShortcutOnTopBarFocus then
                            v578:setShortcutBar(nil);
                        else
                            v578:setShortcutBar(require(l_RobloxGui_0.Modules.Chrome.ChromeShared.Unibar.Constants).UNIBAR_SHORTCUTBAR_ID);
                        end;
                    end;
                    if l_game_EngineFeature_0 then
                        v139.Shield:TweenPositionInternal(l_SHIELD_INACTIVE_POSITION_0, Enum.EasingDirection.In, Enum.EasingStyle.Quad, v573, true, function() --[[ Line: 3730 ]]
                            -- upvalues: v139 (ref), v574 (copy)
                            v139.Shield.Visible = v139.Visible;
                            v574();
                        end);
                    else
                        v139.Shield:TweenPosition(l_SHIELD_INACTIVE_POSITION_0, Enum.EasingDirection.In, Enum.EasingStyle.Quad, v573, true, function() --[[ Line: 3742 ]]
                            -- upvalues: v139 (ref), v574 (copy)
                            v139.Shield.Visible = v139.Visible;
                            v574();
                        end);
                    end;
                end;
                if not v63.FFlagSettingsHubIndependentBackgroundVisibility and v139.DarkenBackground then
                    local v579 = TweenInfo.new(v573, Enum.EasingStyle.Quart, Enum.EasingDirection.Out);
                    if v139.DarkenBackgroundTween then
                        v139.DarkenBackgroundTween:Cancel();
                    end;
                    v139.DarkenBackgroundTween = l_TweenService_0:Create(v139.DarkenBackground, v579, {
                        BackgroundTransparency = 1
                    });
                    v139.DarkenBackgroundTween:Play();
                end;
            end;
            if v86 then
                v86:disconnect();
            end;
            if v53.UseStickyBar() and v139.pageViewScrollChangeCon then
                v139.pageViewScrollChangeCon:disconnect();
                v139.pageViewScrollChangeCon = nil;
            end;
            if v63.isInExperienceUIVREnabled then
                if not v63.InExperienceUIVRIXP:isMovePanelToCenter() and not l_VRService_0.VREnabled then
                    v559:HideTemp("SettingsMenu", false);
                    v120:HideTemp("SettingsMenu", false);
                end;
            else
                v559:HideTemp("SettingsMenu", false);
                v120:HideTemp("SettingsMenu", false);
            end;
            if not l_VRService_0.VREnabled then
                l_MouseIconOverrideService_0.pop(v57);
            end;
            v139:CloseReactPage();
            clearMenuStack();
            l_ContextActionService_0:UnbindCoreAction("RbxSettingsHubSwitchTab");
            l_ContextActionService_0:UnbindCoreAction("RbxSettingsHubStopCharacter");
            l_ContextActionService_0:UnbindCoreAction("RbxSettingsScrollHotkey");
            v190(0.4);
            l_GuiService_0.SelectedCoreObject = nil;
            v139.GameSettingsPage:CloseSettingsPage();
            if v139.ShareGamePage then
                v139.ShareGamePage:ClearShareInviteLink(v139.ShareGameApp);
            end;
        end;
        local v580 = {
            source = v556, 
            playsessionid = v139.playSessionId, 
            universeid = tostring(game.GameId)
        };
        if v558 then
            if v552 then
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsMenuOpenName, l_Constants_0.AnalyticsMenuActionName, v580);
                if v63.GetFFlagEnableLeaveGameUpsellEntrypoint() then
                    task.spawn(checkLeaveGameUpsell);
                    return;
                end;
            else
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsMenuCloseName, l_Constants_0.AnalyticsMenuActionName, v580);
            end;
        end;
    end;
    v139.SetVisibility = function(_, v582, v583, v584, v585, v586) --[[ Line: 3830 ]] --[[ Name: SetVisibility ]]
        -- upvalues: v139 (copy), v260 (ref)
        if v139.Visible == v582 then
            return;
        else
            v260(v582, v583, v584, v585, v586);
            return;
        end;
    end;
    v139.SetBackgroundVisibility = function(_, v588, v589) --[[ Line: 3836 ]] --[[ Name: SetBackgroundVisibility ]]
        -- upvalues: v139 (copy), v545 (ref)
        if v139.DarkenBackground.Visible == v588 then
            return;
        else
            v545(v588, v589);
            return;
        end;
    end;
    v139.GetVisibility = function(_) --[[ Line: 3842 ]] --[[ Name: GetVisibility ]]
        -- upvalues: v139 (copy)
        return v139.Visible;
    end;
    v139.ToggleVisibility = function(_, v592, v593) --[[ Line: 3846 ]] --[[ Name: ToggleVisibility ]]
        -- upvalues: v260 (ref), v139 (copy)
        v260(not v139.Visible, nil, nil, v592, v593);
    end;
    v139.AddToMenuStack = function(_, v595) --[[ Line: 3850 ]] --[[ Name: AddToMenuStack ]]
        -- upvalues: v139 (copy)
        if v139.MenuStack[#v139.MenuStack] ~= v595 then
            v139.MenuStack[#v139.MenuStack + 1] = v595;
        end;
    end;
    v139.InviteToGame = function(_) --[[ Line: 3856 ]] --[[ Name: InviteToGame ]]
        -- upvalues: v63 (ref), l_IXPServiceWrapper_0 (ref), v98 (ref), v78 (ref), l_UserInputService_0 (ref), v77 (ref), v139 (copy), v97 (ref), v99 (ref), l_RobloxGui_0 (ref)
        local v597 = false;
        if v63.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification() and v63.FFlagLuaEnableGameInviteModalSettingsHub then
            local v598 = v63.GetFStringGameInviteMenuLayer();
            local l_l_IXPServiceWrapper_0_LayerData_0 = l_IXPServiceWrapper_0:GetLayerData(v598);
            l_IXPServiceWrapper_0:LogUserLayerExposure(v598);
            v597 = if l_l_IXPServiceWrapper_0_LayerData_0 then l_l_IXPServiceWrapper_0_LayerData_0.inExperienceGameInviteUXRefresh2023 == v98.UxRefresh or l_l_IXPServiceWrapper_0_LayerData_0.inExperienceGameInviteUXRefresh2023 == v98.InviteLimit else false;
        end;
        if game:GetEngineFeature("PlatformFriendsService") and v78 and v78:IsInviteFriendsEnabled() then
            v78:ShowInviteFriendsUI();
            return;
        else
            if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
                if v77 then
                    v77:PopupGameInviteUI();
                    return;
                end;
            elseif v597 then
                v139:ToggleVisibility();
                v97:openModal({
                    trigger = v99.Triggers.GameMenu
                });
                if v63.FFlagEnableConsoleExpControls and v63.ChromeEnabled then
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
    v139.PopMenu = function(_, _, v602, v603) --[[ Line: 3887 ]] --[[ Name: PopMenu ]]
        -- upvalues: v139 (copy), l_BindableEvent_0 (copy), v63 (ref), l_RobloxGui_0 (ref)
        if v139.MenuStack and #v139.MenuStack > 0 then
            local v604 = v139.MenuStack[#v139.MenuStack];
            if type(v604) ~= "table" then
                l_BindableEvent_0:Fire(v604);
            end;
            table.remove(v139.MenuStack, #v139.MenuStack);
            v139:SwitchToPage(v139.MenuStack[#v139.MenuStack], true, 1, v602);
            if #v139.MenuStack == 0 then
                if v63.FFlagAddUILessMode then
                    v139:SetVisibility(false, nil, nil, nil, v603);
                else
                    v139:SetVisibility(false);
                end;
                v139.Pages.CurrentPage:Hide(0, 0, nil, nil, v139.PageViewInnerFrame);
                return;
            elseif v63.ChromeEnabled and v63.FFlagEnableConsoleExpControls then
                require(l_RobloxGui_0.Modules.Chrome.Service):setShortcutBar(require(l_RobloxGui_0.Modules.Chrome.ChromeShared.Unibar.Constants).TILTMENU_SHORTCUTBAR_ID);
                return;
            end;
        else
            v139.MenuStack = {};
            l_BindableEvent_0:Fire();
            if v63.FFlagAddUILessMode then
                v139:ToggleVisibility(nil, v603);
                return;
            else
                v139:ToggleVisibility(v603);
            end;
        end;
    end;
    v139.ShowShield = function(_) --[[ Line: 3921 ]] --[[ Name: ShowShield ]]
        -- upvalues: l_UserInputService_0 (ref), v55 (ref), v139 (copy)
        local v606 = 0;
        v606 = l_UserInputService_0.VREnabled and 1 or v55;
        v139.Shield.BackgroundTransparency = v606;
    end;
    v139.HideShield = function(_) --[[ Line: 3931 ]] --[[ Name: HideShield ]]
        -- upvalues: v139 (copy)
        v139.Shield.BackgroundTransparency = 1;
    end;
    v139.ShowReactPage = function(_) --[[ Line: 3935 ]] --[[ Name: ShowReactPage ]]
        -- upvalues: v139 (copy)
        if v139.reactPage then
            v139.reactPageAnalytics:openPage(v139.reactPage.name);
        end;
        v139.ReactPage.Visible = true;
        v139.Page.Visible = false;
    end;
    v139.HideReactPage = function(_) --[[ Line: 3944 ]] --[[ Name: HideReactPage ]]
        -- upvalues: v139 (copy), v63 (ref)
        if v139.reactPage then
            v139.reactPageAnalytics:closePage(v139.reactPage.name);
        end;
        local v610 = nil;
        if v63.FFlagFixFocusNavToButtonsWithIEMReact then
            v610 = v139.ReactPage.Visible;
        end;
        v139.ReactPage.Visible = false;
        v139.Page.Visible = true;
        if v63.FFlagCreateInExperienceMenuReact and v63.FFlagIEMFocusNavToButtons and v139.Pages.CurrentPage and (not v63.FFlagFixFocusNavToButtonsWithIEMReact or v610 and v139.Visible) then
            v139.Pages.CurrentPage:SelectARow(true);
        end;
    end;
    v139.MountReactPage = function(_) --[[ Line: 3961 ]] --[[ Name: MountReactPage ]]
        -- upvalues: v63 (ref), v25 (ref), v139 (copy), v18 (ref)
        if v63.FFlagCreateInExperienceMenuReact then
            v25(false).setCurrentReactPage(nil);
        end;
        if v139.reactPageRoot then
            v139:UnmountReactPage();
        end;
        v139.reactPageRoot = v18.createRoot(v139.ReactPage);
    end;
    v139.UnmountReactPage = function(_) --[[ Line: 3971 ]] --[[ Name: UnmountReactPage ]]
        -- upvalues: v139 (copy)
        if v139.reactPageRoot then
            v139.reactPageRoot:unmount();
            v139.reactPageRoot = nil;
        end;
    end;
    v139.CloseReactPage = function(_) --[[ Line: 3978 ]] --[[ Name: CloseReactPage ]]
        -- upvalues: v139 (copy)
        v139:HideReactPage();
        v139:UnmountReactPage();
    end;
    v139.SwitchToReactPage = function(_, v615, v616, v617) --[[ Line: 3983 ]] --[[ Name: SwitchToReactPage ]]
        -- upvalues: v63 (ref), v139 (copy)
        if v63.FFlagCreateInExperienceMenuReact and v617 then
            v139:UnmountReactPage();
        elseif v615 then
            v139.reactPage = v615;
            if not v139.reactPageRoot then
                v139:MountReactPage();
            end;
            v139.reactPageRoot:render(v615:createPage(v616));
        end;
        v139:ShowReactPage();
    end;
    v139.GameSettingsPageReorderIXPFetched = false;
    local v618 = nil;
    local v619 = nil;
    local function v625() --[[ Line: 4001 ]] --[[ Name: enableVR ]]
        -- upvalues: l_CorePackages_0 (ref), v139 (copy), v618 (ref)
        local l_VRHub_1 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRHub;
        local l_Panel3D_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).Panel3D;
        local v622 = l_Panel3D_0.Get("SettingsMenu");
        v622:ResizeStuds(4, 4, 250);
        v622:SetType(l_Panel3D_0.Type.Standard);
        v622:SetVisible(false);
        v622:SetCanFade(false);
        v139.ClippingShield.Parent = v622:GetGUI();
        v139.Shield.Parent.ClipsDescendants = false;
        v139.VRShield.Visible = true;
        v139:HideShield();
        v618 = v139.SettingsShowSignal:connect(function(v623) --[[ Line: 4015 ]]
            -- upvalues: v622 (copy), l_VRHub_1 (copy)
            if v623 then
                v622:SetVisible(true);
                l_VRHub_1:FireModuleOpened("SettingsMenu");
                return;
            else
                v622:SetVisible(false);
                l_VRHub_1:FireModuleClosed("SettingsMenu");
                return;
            end;
        end);
        l_VRHub_1.ModuleOpened.Event:connect(function(v624) --[[ Line: 4027 ]]
            -- upvalues: v139 (ref)
            if v624 ~= "SettingsMenu" then
                v139:SetVisibility(false);
            end;
        end);
    end;
    local function v626() --[[ Line: 4033 ]] --[[ Name: disableVR ]]
        -- upvalues: v139 (copy), l_RobloxGui_0 (ref), v618 (ref), v619 (ref), l_CorePackages_0 (ref)
        v139.ClippingShield.Parent = l_RobloxGui_0;
        v139.Shield.Parent.ClipsDescendants = true;
        v139.VRShield.Visible = false;
        v139:ShowShield();
        if v618 then
            v618:disconnect();
            v618 = nil;
        end;
        if v619 then
            v619:disconnect();
            v619 = nil;
        end;
        require(l_CorePackages_0.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetVisible(false);
    end;
    local function _() --[[ Line: 4053 ]] --[[ Name: refreshForSpatialUI ]]
        -- upvalues: v406 (copy), v139 (copy), v53 (ref), l_GuiService_0 (ref), v386 (copy)
        v406();
        v139.MenuContainer.BackgroundTransparency = v53.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency;
        v386();
    end;
    local function v629(v628) --[[ Line: 4059 ]] --[[ Name: OnVREnabled ]]
        -- upvalues: l_UserInputService_0 (ref), v63 (ref), v139 (copy), v406 (copy), v53 (ref), l_GuiService_0 (ref), v386 (copy), v625 (copy), v626 (copy)
        if v628 == "VREnabled" then
            if l_UserInputService_0.VREnabled then
                if v63.isInExperienceUIVREnabled then
                    v139.SettingsUIDelegate:enableVR();
                    v406();
                    v139.MenuContainer.BackgroundTransparency = v53.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency;
                    v386();
                    return;
                else
                    v625();
                    return;
                end;
            elseif v63.isInExperienceUIVREnabled then
                v139.SettingsUIDelegate:disableVR();
                v406();
                v139.MenuContainer.BackgroundTransparency = v53.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency;
                v386();
                return;
            else
                v626();
            end;
        end;
    end;
    l_UserInputService_0.Changed:connect(v629);
    v629("VREnabled");
    v139.ResetCharacterPage:SetHub(v139);
    if l_InExperienceCapabilities_0.canNavigateHome then
        v139.LeaveGamePage:SetHub(v139);
    end;
    if v63.GetFFlagEnableLeaveGameUpsellEntrypoint() then
        v139.LeaveGameUpsellPage:SetHub(v139);
    end;
    v139.GameSettingsPage = require(l_RobloxGui_0.Modules.Settings.Pages.GameSettingsWrapper);
    v139.GameSettingsPage:SetHub(v139);
    v139.ReportAbusePage = require(l_RobloxGui_0.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage);
    v139.ReportAbusePage:SetHub(v139);
    if v63.GetFFlagAbuseReportEnableReportSentPage() then
        v139.ReportSentPage = require(l_RobloxGui_0.Modules.Settings.Pages.ReportSentPage);
        v139.ReportSentPage:SetHub(v139);
    end;
    v139.ReportSentPageV2 = require(l_RobloxGui_0.Modules.Settings.Pages.ReportSentPageV2);
    v139.ReportSentPageV2:SetHub(v139);
    v139.HelpPage = require(l_RobloxGui_0.Modules.Settings.Pages.HelpWrapper);
    v139.HelpPage:SetHub(v139);
    if v63.FFlagHelpPageIXPExposure then
        v139.HelpPageIXPFetched = false;
    end;
    if not v63.FFlagRemoveRecordPage then
        local v630 = not v29:IsSubjectToChinaPolicies();
        if l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows and v630 then
            v139.RecordPage = require(l_RobloxGui_0.Modules.Settings.Pages.Record);
            v139.RecordPage:SetHub(v139);
        end;
    end;
    if l_InExperienceCapabilities_0.canListPeopleInSameServer then
        v139.PlayersPage = require(l_RobloxGui_0.Modules.Settings.Pages.PeopleWrapper);
        v139.PlayersPage:SetHub(v139);
        if not v63.FFlagMenuButtonsMountWithIEM and v63.FFlagRelocateMobileMenuButtons and v63.FIntRelocateMobileMenuButtonsVariant == 2 and v27:IsSmallTouchScreen() then
            v139.PlayersPage:CreateMenuButtonsContainer();
        end;
    end;
    if v63.FFlagAddIEMProfilePage then
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
    if not v13 and v129({
        "Roact", 
        "Rodux", 
        "RoactRodux"
    }) then
        local l_CorePackages_2 = game:GetService("CorePackages");
        local l_EventStream_0 = require(l_CorePackages_2.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
        local l_Diag_0 = require(l_CorePackages_2.Workspace.Packages.Analytics).AnalyticsReporters.Diag;
        local v634 = l_EventStream_0.new(l_RbxAnalyticsService_0);
        local v635 = l_GameInviteAnalytics_0.new():withEventStream(v634):withDiag(l_Diag_0.new(l_RbxAnalyticsService_0)):withButtonName(l_GameInviteAnalytics_0.ButtonName.SettingsHub);
        v139.ShareGameApp = require(l_RobloxGui_0.Modules.Settings.ShareGameMaster).createApp(v139.PageViewClipper, v635);
        v139.ShareGamePage = require(l_RobloxGui_0.Modules.Settings.Pages.ShareGamePlaceholderPage);
        v139.ShareGamePage:ConnectHubToApp(v139, v139.ShareGameApp);
        v139:AddPage(v139.ShareGamePage);
    end;
    local v636 = l_CapturesPolicy_0.PolicyImplementation.read();
    local v637 = if v636 then l_CapturesPolicy_0.Mapper(v636).eligibleForCapturesFeature() else false;
    local v638 = v63.isInExperienceUIVREnabled and v63.FFlagFixSpatialUICaptures;
    if v637 and (not v638 or not l_isSpatial_0()) then
        local v639 = require(l_RobloxGui_0.Modules.Settings.Pages.CapturesPageWrapper);
        local function v640() --[[ Line: 4184 ]] --[[ Name: closeSettingsMenu ]]
            -- upvalues: v139 (copy)
            v139:SetVisibility(false, true);
        end;
        v139.CapturesApp = v100;
        v139.CapturesApp.mountMenuPage(v639.Page, v640, v63.ChromeEnabled);
        v139.CapturesPage = v639;
        v139.CapturesPage:ConnectHubToApp(v139, v139.PageViewClipper, v139.CapturesApp);
    end;
    if v139.PlayersPage then
        v139:AddPage(v139.PlayersPage);
    end;
    v139:AddPage(v139.ResetCharacterPage);
    if v139.LeaveGamePage then
        v139:AddPage(v139.LeaveGamePage);
    end;
    if v63.GetFFlagEnableLeaveGameUpsellEntrypoint() and v139.LeaveGameUpsellPage then
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
    if not v63.FFlagRemoveRecordPage and v139.RecordPage and not v139.CapturesPage then
        v139:AddPage(v139.RecordPage);
    end;
    if v139.ExitModalPage then
        v139:AddPage(v139.ExitModalPage);
    end;
    if v139.LeaveGameToHomePage then
        v139:AddPage(v139.LeaveGameToHomePage);
    end;
    v139:InitInPage(v139:GetFirstPageWithTabHeader());
    if not v63.isNewInGameMenuEnabled() and (not v63.FFlagAddUILessMode or v63.FIntAddUILessModeVariant == 0) then
        l_ContextActionService_0:BindCoreAction("RBXEscapeMainMenu", function(_, v642, _) --[[ Line: 4245 ]]
            -- upvalues: v63 (ref), v139 (copy), l_Constants_0 (ref)
            if v642 ~= Enum.UserInputState.Begin then
                return;
            elseif v63.FFlagAddUILessMode then
                v139:PopMenu(false, true, l_Constants_0.AnalyticsMenuOpenTypes.Keyboard);
                return;
            else
                v139:PopMenu(false, true);
                return;
            end;
        end, false, Enum.KeyCode.Escape);
    end;
    l_GuiService_0.ShowLeaveConfirmation:connect(function() --[[ Line: 4260 ]]
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
    l_ContextActionService_0:BindCoreAction("Open Dev Console", v415, false, Enum.KeyCode.F9);
    l_ContextActionService_0:BindCoreAction("Show Quick Profiler", v411, false, Enum.KeyCode.F7);
    l_UserInputService_0.InputBegan:connect(function(v644) --[[ Line: 4286 ]]
        -- upvalues: v139 (copy), l_GuiService_0 (ref)
        if (v644.KeyCode == Enum.KeyCode.Left or v644.KeyCode == Enum.KeyCode.Right or v644.KeyCode == Enum.KeyCode.Up or v644.KeyCode == Enum.KeyCode.Down) and v139.Visible and v139.Active and v139.Pages.CurrentPage and l_GuiService_0.SelectedCoreObject == nil then
            v139.Pages.CurrentPage:SelectARow();
        end;
    end);
    if v139.ExitModalPage then
        local function v645() --[[ Line: 4300 ]] --[[ Name: showExitModal ]]
            -- upvalues: v139 (copy), v190 (copy)
            v139.HubBar.Visible = false;
            v190();
            if v139:GetVisibility() then
                v139:AddToMenuStack(v139.Pages.CurrentPage);
                v139:SwitchToPage(v139.ExitModalPage, nil, 1, true);
                return;
            else
                v139:SetVisibility(true, nil, v139.ExitModalPage, false);
                return;
            end;
        end;
        local l_v645_0 = v645 --[[ copy: 62 -> 66 ]];
        local function v647() --[[ Line: 4310 ]] --[[ Name: handleNativeExit ]]
            -- upvalues: v139 (copy), v63 (ref), v30 (ref), v278 (copy), l_v645_0 (copy)
            if v139:GetVisibility() and v139.Pages.CurrentPage == v139.ExitModalPage then
                if v63.FFlagEnableInGameMenuDurationLogger then
                    v30.leavingGame();
                end;
                if v63.FFlagRelocateMobileMenuButtons and v63.FIntRelocateMobileMenuButtonsVariant ~= 0 then
                    v278();
                    if v63.FFlagMenuButtonsMountWithIEM and v63.FIntRelocateMobileMenuButtonsVariant == 2 and v139.PlayersPage then
                        v139.PlayersPage:UnmountMenuButtonsContainer();
                    end;
                end;
                v139.ExitModalPage.LeaveAppFunc(true);
                return;
            else
                l_v645_0();
                return;
            end;
        end;
        game:GetService("GuiService").NativeClose:Connect(v647);
        if v139.FullScreenTitleBar then
            v139.FullScreenTitleBar = v90.update(v139.FullScreenTitleBar, {
                onClose = v647
            });
        end;
    end;
    if v63.GetFFlagEnableAppChatInExperience() then
        local v648 = nil;
        do
            local l_v648_0 = v648;
            v139.SettingsShowSignal:connect(function(v650) --[[ Line: 4339 ]]
                -- upvalues: l_v648_0 (ref), l_InExperienceAppChatModal_0 (ref), v139 (copy)
                if v650 then
                    l_v648_0 = l_InExperienceAppChatModal_0.default.visibilitySignal.Event:Connect(function(v651) --[[ Line: 4341 ]]
                        -- upvalues: v139 (ref)
                        if v651 and v139.Visible then
                            v139:SetVisibility(false, true);
                        end;
                    end);
                    return;
                else
                    if l_v648_0 then
                        l_v648_0:Disconnect();
                        l_v648_0 = nil;
                    end;
                    return;
                end;
            end);
        end;
    end;
    if v63.FFlagCreateInExperienceMenuReact then
        v139.InExperienceMenuReact = l_Create_0("Folder")({
            Name = "InExperienceMenuReact", 
            Parent = v139.ClippingShield
        });
        local l_ButtonsContainer_0 = v139.PlayersPage.ButtonsContainer;
        local v653 = if l_ButtonsContainer_0 then l_ButtonsContainer_0:FindFirstChild("LeaveButtonButton", true) else nil;
        local v654 = nil;
        if v63.FFlagAddTraversalHistory then
            v654 = v139.LeaveGameButton;
        end;
        local v655 = nil;
        if v63.FFlagTraversalPerfFixes then
            v655 = function(v656) --[[ Line: 4371 ]]
                -- upvalues: v17 (ref), v139 (copy), v46 (ref), v63 (ref), l_isSpatial_0 (ref), v22 (ref), l_TraversalHistoryMenu_0 (ref)
                local v657, v658 = v17.useState(v656.showSignal(false) and v139.Visible);
                v17.useEffect(function() --[[ Line: 4373 ]]
                    -- upvalues: v46 (ref), v658 (copy), v656 (copy), v139 (ref)
                    local v660 = v46.createEffect(function(v659) --[[ Line: 4374 ]]
                        -- upvalues: v658 (ref), v656 (ref), v139 (ref)
                        v658(v656.showSignal(v659) and v139.Visible);
                    end);
                    local v662 = v139.SettingsShowSignal:connect(function(v661) --[[ Line: 4377 ]]
                        -- upvalues: v658 (ref), v656 (ref)
                        v658(v656.showSignal(false) and v661);
                    end);
                    return function() --[[ Line: 4381 ]]
                        -- upvalues: v660 (copy), v662 (copy)
                        v660();
                        v662:Disconnect();
                    end;
                end, {});
                return v63.FFlagAddTraversalHistory and not (v63.isInExperienceUIVREnabled and l_isSpatial_0()) and v656.parent and v657 and v17.createElement(v22, {
                    parent = v656.parent
                }, {
                    TraversalHistoryMenu = v17.createElement(l_TraversalHistoryMenu_0, {
                        anchorParent = v656.parent, 
                        currentPageChangeSignal = v656.currentPageChangeSignal, 
                        menuSide = v656.menuSide
                    })
                });
            end;
        end;
        v18.createRoot(v139.InExperienceMenuReact):render(v17.createElement(v23, nil, {
            InExperienceMenuReactPage = v17.createElement(v24, {
                onMount = function() --[[ Line: 4403 ]] --[[ Name: onMount ]]
                    -- upvalues: v139 (copy)
                    v139:SwitchToReactPage(nil, nil, true);
                end, 
                onUnmount = function() --[[ Line: 4404 ]] --[[ Name: onUnmount ]]
                    -- upvalues: v139 (copy), v25 (ref)
                    v139:CloseReactPage();
                    v25(false).setCurrentReactPage(nil);
                end, 
                mountTo = v139.ReactPage
            }), 
            TraversalHistoryMenuBottomBar = if v63.FFlagTraversalPerfFixes then v17.createElement(v655, {
                showSignal = v139.showBottomBarSignal, 
                parent = v654, 
                menuSide = v19.Enums.PopoverSide.Top, 
                currentPageChangeSignal = v139.CurrentPageSignal
            }) else v63.FFlagAddTraversalHistory and not (v63.isInExperienceUIVREnabled and l_isSpatial_0()) and v654 and v17.createElement(v22, {
                parent = v654
            }, {
                TraversalHistoryMenu = v17.createElement(l_TraversalHistoryMenu_0, {
                    anchorParent = v654, 
                    idleButtonStateIsDown = true, 
                    currentPageChangeSignal = v139.CurrentPageSignal
                })
            }), 
            TraversalHistoryMenuMobileButton = if v63.FFlagTraversalPerfFixes then v17.createElement(v655, {
                showSignal = v46.createComputed(function(v663) --[[ Line: 4426 ]]
                    -- upvalues: v139 (copy)
                    return not v139.showBottomBarSignal(v663);
                end), 
                parent = v653, 
                menuSide = v19.Enums.PopoverSide.Bottom, 
                currentPageChangeSignal = v139.CurrentPageSignal
            }) else v63.FFlagAddTraversalHistory and not (v63.isInExperienceUIVREnabled and l_isSpatial_0()) and v653 and v17.createElement(v22, {
                parent = v653
            }, {
                TraversalHistoryMenu = v17.createElement(l_TraversalHistoryMenu_0, {
                    anchorParent = v653, 
                    idleButtonStateIsDown = v63.FFlagTraversalLeaveArrowDown and true or false, 
                    currentPageChangeSignal = v139.CurrentPageSignal
                })
            })
        }));
    end;
    return v139;
end;
local v665 = {
    ModuleName = "SettingsMenu", 
    KeepVRTopbarOpen = true, 
    VRIsExclusive = true, 
    VRClosesNonExclusive = true, 
    SetVisibility = nil
};
l_VRHub_0:RegisterModule(v665);
l_VRHub_0.ModuleOpened.Event:connect(function(v666) --[[ Line: 4460 ]]
    -- upvalues: v665 (copy), l_VRHub_0 (copy)
    if v666 ~= v665.ModuleName and l_VRHub_0:GetModule(v666).VRIsExclusive then
        v665:SetVisibility(false);
    end;
end);
local v667 = v664();
v665.GetExperienceControlStore = function(_) --[[ Line: 4471 ]] --[[ Name: GetExperienceControlStore ]]
    -- upvalues: v667 (copy)
    return v667:GetExperienceControlStore();
end;
v665.SetVisibility = function(_, v670, v671, v672, v673, v674) --[[ Line: 4475 ]] --[[ Name: SetVisibility ]]
    -- upvalues: v667 (copy)
    v667:SetVisibility(v670, v671, v672, v673, v674);
end;
v665.SetBackgroundVisibility = function(_, v676, v677) --[[ Line: 4479 ]] --[[ Name: SetBackgroundVisibility ]]
    -- upvalues: v667 (copy)
    v667:SetBackgroundVisibility(v676, v677);
end;
v665.ToggleVisibility = function(_, v679, v680) --[[ Line: 4483 ]] --[[ Name: ToggleVisibility ]]
    -- upvalues: v667 (copy)
    v667:ToggleVisibility(v679, v680);
end;
v665.SwitchToPage = function(_, v682, v683) --[[ Line: 4487 ]] --[[ Name: SwitchToPage ]]
    -- upvalues: v667 (copy)
    v667:SwitchToPage(v682, v683, 1);
end;
if v63.FFlagAddUILessMode and v63.FIntAddUILessModeVariant ~= 0 then
    v665.PopMenu = function(_, v685, v686, v687) --[[ Line: 4492 ]] --[[ Name: PopMenu ]]
        -- upvalues: v667 (copy)
        return v667:PopMenu(v685, v686, v687);
    end;
end;
v665.GetVisibility = function(_) --[[ Line: 4497 ]] --[[ Name: GetVisibility ]]
    -- upvalues: v667 (copy)
    return v667.Visible;
end;
v665.ShowShield = function(_) --[[ Line: 4501 ]] --[[ Name: ShowShield ]]
    -- upvalues: v667 (copy)
    v667:ShowShield();
end;
v665.HideShield = function(_) --[[ Line: 4505 ]] --[[ Name: HideShield ]]
    -- upvalues: v667 (copy)
    v667:HideShield();
end;
v665.GetRespawnBehaviour = function(_) --[[ Line: 4509 ]] --[[ Name: GetRespawnBehaviour ]]
    -- upvalues: v667 (copy)
    return v667:GetRespawnBehaviour();
end;
v665.CloseReactPage = function(_) --[[ Line: 4513 ]] --[[ Name: CloseReactPage ]]
    -- upvalues: v667 (copy)
    v667:CloseReactPage();
end;
v665.SwitchToReactPage = function(_, v694, v695, v696) --[[ Line: 4517 ]] --[[ Name: SwitchToReactPage ]]
    -- upvalues: v667 (copy)
    v667:SwitchToReactPage(v694, v695, v696);
end;
v665.RespawnBehaviourChangedEvent = v667.RespawnBehaviourChangedEvent;
v665.SettingsShowSignal = v667.SettingsShowSignal;
v665.CurrentPageSignal = v667.CurrentPageSignal;
v665.SettingsShowEvent = Instance.new("BindableEvent");
v667.SettingsShowSignal:connect(function(v697) --[[ Line: 4529 ]]
    -- upvalues: v665 (copy)
    v665.SettingsShowEvent:Fire(v697);
end);
v665.Instance = v667;
return v665;