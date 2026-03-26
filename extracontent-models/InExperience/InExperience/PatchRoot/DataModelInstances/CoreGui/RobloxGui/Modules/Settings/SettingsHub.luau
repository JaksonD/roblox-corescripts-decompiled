local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Symbol_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Symbol;
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_IXPService_0 = game:GetService("IXPService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_game_EngineFeature_0 = game:GetEngineFeature("DeprecateOldGuiObjectProperties");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v11 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v12 = require(l_CorePackages_0.Packages.Roact);
local v13 = require(l_CorePackages_0.Packages.Cryo);
local v14 = require(l_CorePackages_0.Packages.Otter);
local v15 = require(l_CorePackages_0.Packages.React);
local v16 = require(l_CorePackages_0.Packages.ReactRoblox);
local v17 = require(l_CorePackages_0.Packages.Foundation);
local l_FoundationProvider_0 = v17.FoundationProvider;
local l_Traversal_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).Traversal;
local v20 = require(script.Parent.Components.PortalWithFoundationStylelink);
local v21 = require(script.Parent.InExperienceMenuReact);
local v22 = require(script.Parent.Pages.InExperienceMenuReactPage);
local v23 = require(script.Parent.ReactPageSignal);
local v24 = require(script.Parent.Integrations.Utils);
local v25 = require(l_RobloxGui_0.Modules.Settings.Utility);
local l_VRHub_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRHub;
local v27 = require(l_CorePackages_0.Workspace.Packages.CachedPolicyService);
local v28 = require(l_RobloxGui_0.Modules.Common.PerfUtils);
local l_MouseIconOverrideService_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService;
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local l_SwitchTabHint_0 = require(l_RobloxGui_0.Modules.Settings.Components.TabHeader).SwitchTabHint;
local l_TraversalHistoryMenu_0 = require(l_RobloxGui_0.Modules.Settings.Components.Traversal).TraversalHistoryMenu;
local v33 = require(l_RobloxGui_0.Modules.Settings.Components.MenuBackButton);
local v34 = require(l_RobloxGui_0.Modules.Settings.Components.MenuFrontButton);
local v35 = require(l_RobloxGui_0.Modules.Settings.Components.MenuButtons.MenuButtonsContainer);
local v36 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_CapturesPolicy_0 = require(l_CorePackages_0.Workspace.Packages.CapturesInExperience).CapturesPolicy;
local l_InExperienceCapabilities_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities;
local v41 = require(l_CoreGui_0.RobloxGui.Modules.Settings.getCamMicPermissions);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local l_Stores_0 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon).Stores;
local v44 = require(l_CorePackages_0.Packages.Signals);
local l_createSignal_0 = v44.createSignal;
local l_AppStyleProvider_0 = require(l_CorePackages_0.Packages.UIBlox).App.Style.AppStyleProvider;
local l_Dark_0 = require(l_CorePackages_0.Packages.UIBlox).App.Style.Constants.ThemeName.Dark;
local v48 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local v50 = require(l_CorePackages_0.Workspace.Packages.HelpPage);
local v51 = require(script.Parent.Theme);
local v52 = v51.color("SETTINGS_SHIELD", Color3.new(0.1607843137254902, 0.1607843137254902, 0.1607843137254902));
local v53 = v51.transparency("SETTINGS_SHIELD_TRANSPARENCY", 0.2);
local l_SHIELD_INACTIVE_POSITION_0 = v51.SHIELD_INACTIVE_POSITION;
local v55 = l_Symbol_0.named("SettingsHubCursorOverride");
local v56 = v11 and 32 or v25:IsSmallTouchScreen() and 24 or 26;
local v57 = game:DefineFastInt("CheckLeaveGameUpsellCooldown", 300);
local v58 = game:DefineFastInt("GetServerChannelRetries", 10);
local v59 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v60 = require(script.Parent.Flags);
local v61 = {
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
    FFlagAddNewPlayerListMobileFocusNav = v48.Flags.FFlagAddNewPlayerListMobileFocusNav, 
    ChromeEnabled = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled(), 
    FFlagRespawnChromeShortcutTelemetry = require(l_RobloxGui_0.Modules.Chrome.Flags.FFlagRespawnChromeShortcutTelemetry), 
    FFlagLocalizeVersionLabels = settings():GetFFlag("LocalizeVersionLabels"), 
    isInExperienceUIVREnabled = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled, 
    InExperienceUIVRIXP = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP, 
    FFlagAddSwitchTabHintsToIEM = v59.FFlagAddSwitchTabHintsToIEM, 
    FFlagAvatarChatCoreScriptSupport = v59.GetFFlagAvatarChatCoreScriptSupport(), 
    GetFStringGameInviteMenuLayer = v59.GetFStringGameInviteMenuLayer, 
    GetFFlagEnableAppChatInExperience = v59.GetFFlagEnableAppChatInExperience, 
    GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints = v59.GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints, 
    GetFFlagDisplayServerChannel = v59.GetFFlagDisplayServerChannel, 
    FFlagSettingsHubIndependentBackgroundVisibility = v59.getFFlagSettingsHubIndependentBackgroundVisibility(), 
    GetFFlagPackagifySettingsShowSignal = v59.GetFFlagPackagifySettingsShowSignal, 
    FFlagEnableConsoleExpControls = v59.FFlagEnableConsoleExpControls, 
    FFlagIEMFocusNavToButtons = v59.FFlagIEMFocusNavToButtons, 
    FFlagIEMResumeButtonPressBugfix = v59.FFlagIEMResumeButtonPressBugfix, 
    FFlagAddUILessMode = v59.FFlagAddUILessMode, 
    FIntAddUILessModeVariant = v59.FIntAddUILessModeVariant, 
    FFlagInExperienceReportClosingBugfix = v59.FFlagInExperienceReportClosingBugfix, 
    FFlagEnableSettingsHubUIDelegateRollout = v59.FFlagEnableSettingsHubUIDelegateRollout, 
    FFlagAddIEMProfilePage = v59.FFlagAddIEMProfilePage, 
    FFlagSetUnibarShortcutOnTopBarFocus = require(l_CorePackages_0.Workspace.Packages.Chrome).Flags.FFlagSetUnibarShortcutOnTopBarFocus, 
    FFlagAddTraversalBackButton = l_Traversal_0.Flags.FFlagAddTraversalBackButton, 
    FFlagAddTraversalHistory = l_Traversal_0.Flags.FFlagAddTraversalHistory, 
    FFlagTraversalLeaveArrowDown = l_Traversal_0.Flags.FFlagTraversalLeaveArrowDown, 
    FFlagTraversalPerfFixes = l_Traversal_0.Flags.FFlagTraversalPerfFixes, 
    FFlagCreateInExperienceMenuReact = v60.FFlagCreateInExperienceMenuReact, 
    FFlagFixFocusNavToButtonsWithIEMReact = game:DefineFastFlag("FixFocusNavToButtonsWithIEMReact", false), 
    FFlagEnableSystemScrimInSettingsHub = game:DefineFastFlag("EnableSystemScrimInSettingsHub", false), 
    FFlagHelpPageIXPExposure = v50.Flags.FFlagHelpPageIXPExposure, 
    FStringHelpPageIXPLayer = v50.Flags.FStringHelpPageIXPLayer, 
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
local v75 = nil;
pcall(function() --[[ Line: 193 ]]
    -- upvalues: v75 (ref)
    v75 = game:GetService("PlatformService");
end);
local v76 = nil;
pcall(function() --[[ Line: 196 ]]
    -- upvalues: v76 (ref)
    v76 = game:GetService("PlatformFriendsService");
end);
local v77 = nil;
spawn(function() --[[ Line: 200 ]]
    -- upvalues: v77 (ref), l_RobloxReplicatedStorage_0 (copy)
    v77 = l_RobloxReplicatedStorage_0:WaitForChild("GetServerVersion", 1e999);
end);
local v78 = nil;
if v61.GetFFlagDisplayServerChannel() then
    spawn(function() --[[ Line: 206 ]]
        -- upvalues: v78 (ref), l_RobloxReplicatedStorage_0 (copy)
        v78 = l_RobloxReplicatedStorage_0:WaitForChild("GetServerChannel", 1e999);
    end);
end;
local v79 = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
local v82 = not string.find(l_BaseUrl_0, "www.roblox.com");
local v83 = require(l_RobloxGui_0.Modules.DevConsoleMaster);
local v84 = nil;
local v85 = false;
local v86 = nil;
local v87 = nil;
local v88 = require(l_RobloxGui_0.Modules.Settings.Components.SettingsFullScreenTitleBar);
local v89 = require(l_RobloxGui_0.Modules.SelfView.toggleSelfViewSignal);
local v90 = require(l_RobloxGui_0.Modules.SelfView.publicApi);
local v91 = require(l_RobloxGui_0.Modules.SelfView.selfViewVisibilityUpdatedSignal);
local v92 = require(l_RobloxGui_0.Modules.Settings.Analytics.MenuLeaveGameTelemetryConfig);
local v93 = require(l_RobloxGui_0.Modules.Settings.Analytics.MenuResetCharacterTelemetryConfig);
local v94 = require(l_RobloxGui_0.Modules.Settings.Analytics.MenuResumeTelemetryConfig);
local v95 = require(l_RobloxGui_0.Modules.Settings.Analytics.ReactPageAnalytics);
local l_GameInviteAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteAnalytics;
local v97 = nil;
local v98 = nil;
local v99 = nil;
local v100 = nil;
if v61.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification() then
    v97 = require(l_CorePackages_0.Workspace.Packages.GameInvite);
    v98 = v97.GameInviteModalManager;
    v99 = v97.GameInviteInviteExperimentVariant;
    v100 = v97.GameInviteConstants;
end;
local v101 = require(l_RobloxGui_0.Modules.Captures.CapturesApp);
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v103 = v27:IsSubjectToChinaPolicies();
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v105 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v106 = game:DefineFastFlag("SettingsHubRaceConditionFix", false);
local v107 = game:DefineFastFlag("FixReportButtonCutOff", false);
local l_InExperienceAppChatModal_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).App.InExperienceAppChatModal;
local v109 = if v61.GetFFlagPackagifySettingsShowSignal() then require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal else nil;
local v110 = if v61.GetFFlagPackagifySettingsShowSignal() then require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).SettingsUtility else nil;
local v111 = {
    frequency = 4, 
    dampingRatio = 1
};
local _ = require(l_RobloxGui_0.Modules.Settings.ReactPageFactory);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local v114 = v61.FFlagLocalizeVersionLabels or v103;
local v115 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local function _(v116, v117) --[[ Line: 290 ]] --[[ Name: tryTranslate ]]
    -- upvalues: v115 (copy)
    if not v115 then
        return v117;
    else
        local l_status_0, l_result_0 = pcall(v115.FormatByKey, v115, v116);
        if l_status_0 then
            return l_result_0;
        else
            return v117;
        end;
    end;
end;
local v121 = require(l_RobloxGui_0.Modules.ChatSelector);
local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
local v124 = UDim2.new(0, 0, 0, -l_l_GuiService_0_GuiInset_0.Y);
local v125 = UDim2.new(1, 0, 1, l_l_GuiService_0_GuiInset_0.Y);
local function v130(v126) --[[ Line: 306 ]] --[[ Name: GetCorePackagesLoaded ]]
    local l_CorePackages_1 = game:GetService("CorePackages");
    for _, v129 in pairs(v126) do
        if not l_CorePackages_1:FindFirstChild(v129) then
            return false;
        end;
    end;
    return true;
end;
local function _() --[[ Line: 316 ]] --[[ Name: GetServerVersionBlocking ]]
    -- upvalues: v86 (ref), v77 (ref)
    if v86 then
        return v86;
    else
        if not v77 then
            repeat
                wait();
            until v77;
        end;
        v86 = v77:InvokeServer();
        return v86;
    end;
end;
local function v133() --[[ Line: 329 ]] --[[ Name: GetServerChannelBlocking ]]
    -- upvalues: v87 (ref), v58 (copy), v78 (ref)
    if v87 then
        return v87;
    else
        local l_v58_0 = v58;
        if not v78 then
            repeat
                task.wait();
                l_v58_0 = l_v58_0 - 1;
            until v78 or l_v58_0 == 0;
        end;
        if v78 then
            v87 = v78:InvokeServer();
        else
            warn("GetServerChannelRemote not available");
            v87 = "Unknown";
        end;
        return v87;
    end;
end;
local function _() --[[ Line: 350 ]] --[[ Name: GetPlaceVersionText ]]
    -- upvalues: v61 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy)
    if v61.GetFFlagRemoveAssetVersionEndpoint() then
        return game.PlaceVersion;
    else
        local l_PlaceVersion_0 = game.PlaceVersion;
        pcall(function() --[[ Line: 357 ]]
            -- upvalues: l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref), l_PlaceVersion_0 (ref)
            local l_l_HttpRbxApiService_0_Async_0 = l_HttpRbxApiService_0:GetAsync(string.format("assets/%d/versions", game.PlaceId));
            local l_VersionNumber_0 = l_HttpService_0:JSONDecode(l_l_HttpRbxApiService_0_Async_0)[1].VersionNumber;
            l_PlaceVersion_0 = string.format("%s (Latest: %d)", l_PlaceVersion_0, l_VersionNumber_0);
        end);
        return l_PlaceVersion_0;
    end;
end;
local function v139(v138) --[[ Line: 367 ]] --[[ Name: createReactPage ]]
    -- upvalues: l_Create_0 (copy), v61 (copy)
    return l_Create_0("Frame")({
        Name = "InExperienceMenuPage", 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(0, 0), 
        Visible = not v61.FFlagFixFocusNavToButtonsWithIEMReact and nil, 
        Parent = v138
    });
end;
local function v618() --[[ Line: 378 ]] --[[ Name: CreateSettingsHub ]]
    -- upvalues: v61 (copy), l_RobloxGui_0 (copy), v109 (copy), v25 (copy), v110 (copy), l_createSignal_0 (copy), v105 (copy), l_Stores_0 (copy), l_StarterGui_0 (copy), v89 (copy), v90 (copy), v91 (copy), l_RbxAnalyticsService_0 (copy), v95 (copy), v139 (copy), v51 (copy), l_ContextActionService_0 (copy), l_LocalizationService_0 (copy), l_Localization_0 (copy), v11 (copy), l_Create_0 (copy), v79 (copy), l_UserInputService_0 (copy), l_l_UserInputService_0_Platform_0 (copy), l_default_0 (copy), v41 (copy), v14 (copy), v115 (copy), v106 (copy), l_TelemetryService_0 (copy), v92 (copy), v93 (copy), l_Constants_0 (copy), v94 (copy), v16 (copy), v15 (copy), v35 (copy), v60 (copy), v125 (copy), v124 (copy), l_SHIELD_INACTIVE_POSITION_0 (copy), v53 (copy), v52 (copy), v56 (copy), v114 (copy), v133 (copy), v86 (ref), v77 (ref), l_RunService_0 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy), v27 (copy), l_BaseUrl_0 (copy), v82 (copy), l_StarterPlayer_0 (copy), l_Players_0 (copy), l_GuiService_0 (copy), v12 (copy), v36 (copy), l_IXPService_0 (copy), l_AppStyleProvider_0 (copy), l_Dark_0 (copy), v33 (copy), v34 (copy), l_AppFonts_0 (copy), v111 (copy), l_CorePackages_0 (copy), l_InExperienceAppChatModal_0 (copy), l_InExperienceCapabilities_0 (copy), l_FoundationProvider_0 (copy), v17 (copy), v24 (copy), l_SwitchTabHint_0 (copy), l_isSubjectToDesktopPolicies_0 (copy), v88 (copy), l_VRService_0 (copy), l_GameSettings_0 (copy), v83 (copy), l_game_EngineFeature_0 (copy), v107 (copy), v13 (copy), l_IXPServiceWrapper_0 (copy), l_ExperienceMenuSessionManagerInstance_0 (copy), l_MouseIconOverrideService_0 (copy), v55 (copy), v57 (copy), l_TweenService_0 (copy), v28 (copy), v84 (ref), v121 (copy), v85 (ref), v99 (ref), v76 (ref), v75 (ref), v98 (ref), v100 (ref), v23 (copy), v130 (copy), l_GameInviteAnalytics_0 (copy), l_CapturesPolicy_0 (copy), l_isSpatial_0 (copy), v101 (copy), v44 (copy), v20 (copy), l_TraversalHistoryMenu_0 (copy), v21 (copy), v22 (copy)
    local v140 = {
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
    if v61.EngineFeatureTeleportHistoryButtons then
        v140.FrontBarVisibleConnection = nil;
    end;
    v140.PreferredTransparencyChangedConnection = nil;
    v140.TabConnection = nil;
    if v61.FFlagAddNextUpContainer then
        v140.LeaveGamePage = require(l_RobloxGui_0.Modules.Settings.Pages.LeaveGameWithNextUp);
    else
        v140.LeaveGamePage = require(l_RobloxGui_0.Modules.Settings.Pages.LeaveGame);
    end;
    v140.LeaveGameUpsellPage = if v61.GetFFlagEnableLeaveGameUpsellEntrypoint() then require(l_RobloxGui_0.Modules.Settings.Pages.LeaveGameUpsell.LeaveGameUpsell) else nil;
    v140.ResetCharacterPage = require(l_RobloxGui_0.Modules.Settings.Pages.ResetCharacter);
    v140.SettingsShowSignal = if v61.GetFFlagPackagifySettingsShowSignal() then v109 else v25:CreateSignal();
    v140.CurrentPageSignal = if v61.GetFFlagPackagifySettingsShowSignal() then v110.CreateSignal() else v25:CreateSignal();
    local v141 = nil;
    local v142 = nil;
    if v61.FFlagTraversalPerfFixes then
        local v143, v144 = l_createSignal_0(false);
        v141 = v143;
        v142 = v144;
        v140.showBottomBarSignal = v141;
        v140.setShowBottomBarSignal = v142;
    end;
    v140.OpenStateChangedCount = 0;
    v140.BottomButtonFrame = nil;
    if v61.FFlagRelocateMobileMenuButtons then
        v140.addMenuKeyBindings = nil;
        v140.removeMenuKeyBindings = nil;
    end;
    v140.hasMicPermissions = false;
    if v61.GetFFlagEnableLeaveGameUpsellEntrypoint() then
        v140.checkedUpsell = false;
        v140.leaveGameUpsellProp = v105.PHONE_UPSELL_VALUE_PROP.None;
        v140.sessionStartTime = os.time();
    end;
    v140.isFetchingMicPermissions = true;
    if v61.FFlagAddUILessMode and v61.FIntAddUILessModeVariant ~= 0 then
        v140.uiLessStore = l_Stores_0.GetUILessStore(false);
    end;
    v140.isMuted = nil;
    v140.lastVoiceRecordingIndicatorTextUpdated = nil;
    if v61.FFlagAvatarChatCoreScriptSupport then
        v140.selfViewOpen = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView);
        v140.toggleSelfViewSignal = v89:connect(function() --[[ Line: 437 ]]
            -- upvalues: v140 (copy)
            v140.selfViewOpen = not v140.selfViewOpen;
        end);
        v140.selfViewOpen = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView) and v90.getSelfViewIsOpenAndVisible();
        v140.selfViewVisibilitySignal = v91:connect(function() --[[ Line: 442 ]]
            -- upvalues: v140 (copy), v90 (ref)
            v140.selfViewOpen = v90.getSelfViewIsOpenAndVisible();
        end);
    end;
    v140.playSessionId = "";
    if v61.EngineFeatureRbxAnalyticsServiceExposePlaySessionId then
        v140.playSessionId = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    v140.reactPageAnalytics = v95.new();
    local v145 = nil;
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    l_BindableEvent_0.Name = "PoppedMenu";
    v140.PoppedMenu = l_BindableEvent_0.Event;
    v140.ReactPage = nil;
    if v61.FFlagCreateInExperienceMenuReact then
        v140.ReactPage = v139();
    end;
    local function _(v147) --[[ Line: 466 ]] --[[ Name: shouldShowHubBar ]]
        -- upvalues: v140 (copy)
        return (v147 or v140.Pages.CurrentPage).ShouldShowBottomBar == true;
    end;
    local function v154(v149) --[[ Line: 471 ]] --[[ Name: setBottomBarSelection ]]
        -- upvalues: v140 (copy), v61 (ref)
        if not v140.BottomButtonFrame and v61.FFlagIEMFocusNavToButtons and not v149 and (not v61.FFlagRelocateMobileMenuButtons or v61.FIntRelocateMobileMenuButtonsVariant == 0 or v61.FIntRelocateMobileMenuButtonsVariant == 2) then
            return;
        else
            if v140.ResumeButton then
                v149.PageNextSelectionDown = v140.ResumeButton;
            end;
            for _, v151 in v149.LastSelectableObjects do
                v140.BottomButtonFrame.SelectionBehaviorUp = Enum.SelectionBehavior.Escape;
                v140.BottomButtonFrame.NextSelectionUp = v151;
                v151.NextSelectionDown = v149.PageNextSelectionDown;
                local l_LeaveGameButton_0 = v140.LeaveGameButton;
                if l_LeaveGameButton_0 then
                    l_LeaveGameButton_0.NextSelectionUp = v151;
                end;
            end;
            if #v149.LastSelectableObjects < 1 then
                v140.BottomButtonFrame.SelectionBehaviorUp = Enum.SelectionBehavior.Stop;
                v140.BottomButtonFrame.NextSelectionUp = nil;
                local l_LeaveGameButton_1 = v140.LeaveGameButton;
                if l_LeaveGameButton_1 then
                    l_LeaveGameButton_1.NextSelectionUp = nil;
                end;
            end;
            return;
        end;
    end;
    local function v157(v155) --[[ Line: 503 ]] --[[ Name: shouldShowBottomBar ]]
        -- upvalues: v140 (copy), v61 (ref), v25 (ref), v51 (ref)
        v155 = v155 or v140.Pages.CurrentPage;
        if (not v61.FFlagRelocateMobileMenuButtons or v61.FIntRelocateMobileMenuButtonsVariant == 0 or v61.FIntRelocateMobileMenuButtonsVariant == 2) and (v25:IsPortrait() or v25:IsSmallTouchScreen()) and not v51.AlwaysShowBottomBar() then
            return false;
        else
            local v156 = false;
            if v155 ~= nil then
                v156 = v155.ShouldShowBottomBar == true;
            end;
            return v156;
        end;
    end;
    local function v162() --[[ Line: 517 ]] --[[ Name: setBottomBarBindings ]]
        -- upvalues: v140 (copy), v61 (ref), l_ContextActionService_0 (ref)
        if not v140.Visible then
            return;
        else
            if not v61.FFlagRelocateMobileMenuButtons or v61.FIntRelocateMobileMenuButtonsVariant == 0 then
                for v158 = 1, #v140.BottomBarButtons do
                    local v159 = v140.BottomBarButtons[v158];
                    local v160 = v159[1];
                    local v161 = v159[2];
                    l_ContextActionService_0:BindCoreAction(v160, v161[1], false, unpack(v161[2]));
                end;
            elseif v140.addMenuKeyBindings then
                v140.addMenuKeyBindings();
            end;
            if v140.BottomButtonFrame then
                v140.BottomButtonFrame.Visible = true;
            end;
            return;
        end;
    end;
    local function v168(v163) --[[ Line: 540 ]] --[[ Name: removeBottomBarBindings ]]
        -- upvalues: v61 (ref), v140 (copy), l_ContextActionService_0 (ref)
        if not v61.FFlagRelocateMobileMenuButtons or v61.FIntRelocateMobileMenuButtonsVariant == 0 then
            for _, v165 in pairs(v140.BottomBarButtons) do
                l_ContextActionService_0:UnbindCoreAction(v165[1]);
            end;
        elseif v140.removeMenuKeyBindings then
            v140.removeMenuKeyBindings();
        end;
        local l_OpenStateChangedCount_0 = v140.OpenStateChangedCount;
        local function v167() --[[ Line: 552 ]]
            -- upvalues: v140 (ref), l_OpenStateChangedCount_0 (copy)
            if v140.OpenStateChangedCount == l_OpenStateChangedCount_0 and v140.BottomButtonFrame then
                v140.BottomButtonFrame.Visible = false;
            end;
        end;
        if v163 then
            delay(v163, v167);
            return;
        else
            if v140.OpenStateChangedCount == l_OpenStateChangedCount_0 and v140.BottomButtonFrame then
                v140.BottomButtonFrame.Visible = false;
            end;
            return;
        end;
    end;
    local function _(v169, v170, v171) --[[ Line: 565 ]] --[[ Name: updateButtonPosition ]]
        -- upvalues: v61 (ref), v140 (copy)
        if not v61.FFlagRelocateMobileMenuButtons or v61.FIntRelocateMobileMenuButtonsVariant == 0 then
            local l_FirstChild_0 = v140.BottomButtonFrame:FindFirstChild(v169 .. "ButtonButton", true);
            if not l_FirstChild_0 then
                return;
            else
                l_FirstChild_0.Position = v170;
                l_FirstChild_0.Size = v171;
            end;
        end;
    end;
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v175 = l_Localization_0.new(l_RobloxLocaleId_0);
    local function v182() --[[ Line: 581 ]] --[[ Name: hideVoiceUx ]]
        -- upvalues: v140 (copy), v11 (ref), v51 (ref), v61 (ref)
        local l_MuteButtonButton_0 = v140.MuteButtonButton;
        if l_MuteButtonButton_0 then
            l_MuteButtonButton_0.Visible = false;
            l_MuteButtonButton_0:Destroy();
        end;
        local v177 = if v11 then UDim2.new(0, 320, 0, 72) else UDim2.new(0, 260, 0, v51.LargeButtonHeight);
        if not v61.FFlagRelocateMobileMenuButtons or v61.FIntRelocateMobileMenuButtonsVariant == 0 then
            local v178 = UDim2.new(0.5, v11 and -160 or -130, 0.5, -25);
            if not v61.FFlagRelocateMobileMenuButtons or v61.FIntRelocateMobileMenuButtonsVariant == 0 then
                local l_FirstChild_1 = v140.BottomButtonFrame:FindFirstChild("LeaveGameButtonButton", true);
                if l_FirstChild_1 then
                    l_FirstChild_1.Position = v178;
                    l_FirstChild_1.Size = v177;
                end;
            end;
            v178 = UDim2.new(0.5, v11 and -550 or -400, 0.5, -25);
            if not v61.FFlagRelocateMobileMenuButtons or v61.FIntRelocateMobileMenuButtonsVariant == 0 then
                local l_FirstChild_2 = v140.BottomButtonFrame:FindFirstChild("ResetCharacterButtonButton", true);
                if l_FirstChild_2 then
                    l_FirstChild_2.Position = v178;
                    l_FirstChild_2.Size = v177;
                end;
            end;
            v178 = UDim2.new(0.5, v11 and 200 or 140, 0.5, -25);
            if not v61.FFlagRelocateMobileMenuButtons or v61.FIntRelocateMobileMenuButtonsVariant == 0 then
                local l_FirstChild_3 = v140.BottomButtonFrame:FindFirstChild("ResumeButtonButton", true);
                if not l_FirstChild_3 then
                    return;
                else
                    l_FirstChild_3.Position = v178;
                    l_FirstChild_3.Size = v177;
                end;
            end;
        end;
    end;
    local function v203(v183, v184, v185, v186, v187, v188, v189, v190) --[[ Line: 597 ]] --[[ Name: addBottomBarButtonOld ]]
        -- upvalues: v61 (ref), v51 (ref), v11 (ref), v140 (copy), v25 (ref), l_Create_0 (ref), v79 (ref), l_UserInputService_0 (ref), l_l_UserInputService_0_Platform_0 (ref)
        if not v61.FFlagRelocateMobileMenuButtons or v61.FIntRelocateMobileMenuButtonsVariant == 0 then
            local v191 = v183 .. "Button";
            local v192 = v183 .. "Text";
            local v193 = UDim2.new(0, 260, 0, v51.LargeButtonHeight);
            if v11 then
                v193 = UDim2.new(0, 320, 0, 72);
            end;
            local l_v140_0 = v140;
            local l_v140_1 = v140;
            local v196, v197 = v25:MakeStyledButton(v183 .. "Button", v184, v193, v188, nil, v140);
            l_v140_0[v191] = v196;
            l_v140_1[v192] = v197;
            l_Create_0("UIListLayout")({
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Parent = v140[v191]
            });
            l_Create_0("UIPadding")({
                PaddingLeft = UDim.new(0.025, 0), 
                Parent = v140[v191]
            });
            v140[v192].Size = UDim2.new(0, 0, 1, 0);
            l_Create_0("UIFlexItem")({
                FlexMode = Enum.UIFlexMode.Grow, 
                Parent = v140[v192]
            });
            v140[v191].Position = v187;
            v140[v191].Parent = v140.BottomButtonFrame;
            if v11 then
                v140[v191].ImageTransparency = 1;
            end;
            v140[v192].FontSize = Enum.FontSize.Size24;
            l_v140_0 = nil;
            if not v79 then
                l_v140_1 = v183 .. "Hint";
                v196 = "";
                v196 = if not not l_UserInputService_0:GetGamepadConnected(Enum.UserInputType.Gamepad1) or l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne then v185 else v186;
                l_v140_0 = l_Create_0("ImageLabel")({
                    Name = l_v140_1, 
                    ZIndex = v140.Shield.ZIndex + 2, 
                    BackgroundTransparency = 1, 
                    Image = v196, 
                    LayoutOrder = -1, 
                    Parent = v140[v191]
                });
                if v196 == v186 then
                    l_v140_0.ImageColor3 = v51.color("WhiteButtonText", Color3.new(1, 1, 1));
                    l_v140_0.ImageTransparency = v51.transparency("WhiteButtonText", 1);
                end;
                l_v140_0.Position = UDim2.new(0, 9, 0.5, 0);
                l_v140_0.Size = UDim2.new(0, 33, 0, 33);
                l_v140_0.AnchorPoint = Vector2.new(0, 0.5);
            end;
            if v11 then
                v140[v192].FontSize = Enum.FontSize.Size36;
            end;
            do
                local l_l_v140_0_0 = l_v140_0;
                l_UserInputService_0.InputBegan:connect(function(v199) --[[ Line: 670 ]]
                    -- upvalues: l_l_v140_0_0 (ref), v185 (copy), v186 (copy)
                    if v199.UserInputType == Enum.UserInputType.Gamepad1 or v199.UserInputType == Enum.UserInputType.Gamepad2 or v199.UserInputType == Enum.UserInputType.Gamepad3 or v199.UserInputType == Enum.UserInputType.Gamepad4 then
                        if l_l_v140_0_0 then
                            l_l_v140_0_0.Image = v185;
                            return;
                        end;
                    elseif v199.UserInputType == Enum.UserInputType.Keyboard and l_l_v140_0_0 then
                        l_l_v140_0_0.Image = v186;
                    end;
                end);
                v140.BottomBarButtons[#v140.BottomBarButtons + 1] = {
                    v191, 
                    {
                        function(_, v201, _) --[[ Line: 693 ]]
                            -- upvalues: v190 (copy)
                            if v201 == Enum.UserInputState.Begin then
                                v190();
                            end;
                        end, 
                        v189
                    }
                };
            end;
        end;
    end;
    local v204 = "";
    if v11 then
        v204 = "@2x";
    end;
    local v205 = nil;
    local v206 = nil;
    local v207 = nil;
    if v61.FFlagEnableConsoleExpControls then
        v205 = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonB);
        v206 = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonX);
        v207 = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonY);
    else
        v205 = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB" .. v204 .. ".png";
        v206 = "rbxasset://textures/ui/Controls/DesignSystem/ButtonX" .. v204 .. ".png";
        v207 = "rbxasset://textures/ui/Controls/DesignSystem/ButtonY" .. v204 .. ".png";
    end;
    local l_l_UserInputService_0_ImageForKeyCode_0 = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonStart);
    local v209 = false;
    local v210 = nil;
    local function v225() --[[ Line: 727 ]] --[[ Name: setupVoiceListeners ]]
        -- upvalues: v209 (ref), v140 (copy), l_default_0 (ref), v41 (ref), v61 (ref), v210 (ref), v14 (ref), v115 (ref), v182 (copy)
        if game:GetEngineFeature("VoiceChatSupported") and not v209 then
            v209 = true;
            local function v223() --[[ Line: 732 ]] --[[ Name: showUI ]]
                -- upvalues: v140 (ref), l_default_0 (ref), v41 (ref), v61 (ref), v210 (ref), v14 (ref), v115 (ref)
                v140.VoiceRecordingText.Visible = true;
                l_default_0:getService().StateChanged:Connect(function(_, v212) --[[ Line: 735 ]]
                    -- upvalues: v140 (ref)
                    if v212 == Enum.VoiceChatState.Joined then
                        v140.VoiceRecordingText.Visible = true;
                    end;
                end);
                l_default_0:SetupParticipantListeners();
                v41(function(v213) --[[ Line: 742 ]]
                    -- upvalues: v140 (ref)
                    v140.hasMicPermissions = v213.hasMicPermissions;
                end, nil, true, "PermissionsButtons.getPermissions");
                if v61.GetFFlagMuteButtonRaceConditionFix() then
                    v210 = l_default_0.muteChanged.Event:Connect(function(v214) --[[ Line: 747 ]]
                        -- upvalues: v140 (ref), v14 (ref), v115 (ref)
                        v140.isMuted = v214;
                        v140.lastVoiceRecordingIndicatorTextUpdated = tick();
                        v140.voiceRecordingIndicatorTextMotor:setGoal(v14.instant(0));
                        if v140.isMuted then
                            local l_VoiceRecordingText_0 = v140.VoiceRecordingText;
                            local v216;
                            if not v115 then
                                v216 = "Mic Off";
                            else
                                local l_status_1, l_result_1 = pcall(v115.FormatByKey, v115, "InGame.CommonUI.Label.MicOff");
                                v216 = if l_status_1 then l_result_1 else "Mic Off";
                            end;
                            l_VoiceRecordingText_0.Text = v216;
                            return;
                        else
                            local l_VoiceRecordingText_1 = v140.VoiceRecordingText;
                            local v220;
                            if not v115 then
                                v220 = "Mic On (recording audio)";
                            else
                                local l_status_2, l_result_2 = pcall(v115.FormatByKey, v115, "InGame.CommonUI.Label.MicOnRecording");
                                v220 = if l_status_2 then l_result_2 else "Mic On (recording audio)";
                            end;
                            l_VoiceRecordingText_1.Text = v220;
                            return;
                        end;
                    end);
                end;
            end;
            local function v224() --[[ Line: 759 ]] --[[ Name: hideUI ]]
                -- upvalues: v140 (ref), v182 (ref), v210 (ref)
                v140.VoiceRecordingText.Visible = false;
                v182();
                if v210 then
                    v210:Disconnect();
                end;
            end;
            if l_default_0.voiceUIVisible then
                v223();
            end;
            l_default_0.showVoiceUI.Event:Connect(v223);
            l_default_0.hideVoiceUI.Event:Connect(v224);
        end;
    end;
    if not v106 then
        v225();
    end;
    local v226 = true;
    local function v230(v227) --[[ Line: 783 ]] --[[ Name: setResetEnabled ]]
        -- upvalues: v226 (ref), v140 (copy)
        v226 = v227;
        if v140.ResetCharacterButton then
            v140.ResetCharacterButton.Selectable = v227;
            v140.ResetCharacterButton.Active = v227;
            v140.ResetCharacterButton.Enabled.Value = v227;
            local l_ResetCharacterHint_0 = v140.ResetCharacterButton:FindFirstChild("ResetCharacterHint");
            if l_ResetCharacterHint_0 then
                l_ResetCharacterHint_0.ImageColor3 = v227 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100);
            end;
            local l_ResetCharacterButtonTextLabel_0 = v140.ResetCharacterButton:FindFirstChild("ResetCharacterButtonTextLabel");
            if l_ResetCharacterButtonTextLabel_0 then
                l_ResetCharacterButtonTextLabel_0.TextColor3 = v227 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100);
            end;
        end;
    end;
    local v231 = nil;
    v140.GetRespawnBehaviour = function(_) --[[ Line: 801 ]] --[[ Name: GetRespawnBehaviour ]]
        -- upvalues: v61 (ref), v140 (copy), v226 (ref), v231 (ref)
        if v61.FFlagRelocateMobileMenuButtons and v61.FIntRelocateMobileMenuButtonsVariant ~= 0 then
            return v140:GetExperienceControlStore().getCanRespawn(false), v140:GetExperienceControlStore().getCustomRespawnCallback(false);
        else
            return v226, v231;
        end;
    end;
    v140.RespawnBehaviourChangedEvent = Instance.new("BindableEvent");
    l_StarterGui_0:RegisterSetCore("ResetButtonCallback", function(v233) --[[ Line: 811 ]]
        -- upvalues: v140 (copy), v61 (ref), v226 (ref), v230 (copy), v231 (ref)
        local v234 = false;
        if typeof(v233) == "Instance" then
            v234 = v233:IsA("BindableEvent");
        end;
        if v234 or type(v233) == "boolean" then
            v140.ResetCharacterPage:SetResetCallback(v233);
        else
            warn("ResetButtonCallback must be set to a BindableEvent or a boolean");
        end;
        local v235 = if v61.FFlagRelocateMobileMenuButtons and v61.FIntRelocateMobileMenuButtonsVariant ~= 0 then v140:GetExperienceControlStore().getCanRespawn(false) else v226;
        if v233 == false then
            if v61.FFlagRelocateMobileMenuButtons and v61.FIntRelocateMobileMenuButtonsVariant ~= 0 then
                v140:GetExperienceControlStore().setCanRespawn(false);
            else
                v230(false);
            end;
        elseif not v235 and (v234 or v233 == true) then
            if v61.FFlagRelocateMobileMenuButtons and v61.FIntRelocateMobileMenuButtonsVariant ~= 0 then
                v140:GetExperienceControlStore().setCanRespawn(true);
            else
                v230(true);
            end;
        end;
        if v234 then
            if v61.FFlagRelocateMobileMenuButtons and v61.FIntRelocateMobileMenuButtonsVariant ~= 0 then
                v140:GetExperienceControlStore().setCustomRespawnCallback(v233);
            else
                v231 = v233;
            end;
        end;
        if v61.FFlagRelocateMobileMenuButtons and v61.FIntRelocateMobileMenuButtonsVariant ~= 0 then
            v140.RespawnBehaviourChangedEvent:Fire(v140:GetExperienceControlStore().getCanRespawn(false), v140:GetExperienceControlStore().getCustomRespawnCallback(false));
            return;
        else
            v140.RespawnBehaviourChangedEvent:Fire(v226, v231);
            return;
        end;
    end);
    l_StarterGui_0:RegisterGetCore("ResetButtonCallback", function() --[[ Line: 846 ]]
        -- upvalues: v140 (copy)
        local l_v140_RespawnBehaviour_0, _ = v140:GetRespawnBehaviour();
        return l_v140_RespawnBehaviour_0;
    end);
    local v238 = nil;
    local v239, v240 = l_createSignal_0(true);
    local v241, v242 = l_createSignal_0(nil);
    v140.GetExperienceControlStore = function(_) --[[ Line: 856 ]] --[[ Name: GetExperienceControlStore ]]
        -- upvalues: v240 (copy), v140 (copy), v239 (copy), v241 (copy), v242 (copy), v61 (ref), v105 (ref), l_TelemetryService_0 (ref), v92 (ref), v93 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), v94 (ref)
        local function v247(v244) --[[ Line: 857 ]]
            -- upvalues: v240 (ref), v140 (ref)
            v240(v244);
            if v140.ResetCharacterButton then
                v140.ResetCharacterButton.Selectable = v244;
                v140.ResetCharacterButton.Active = v244;
                v140.ResetCharacterButton.Enabled.Value = v244;
                local l_ResetCharacterHint_1 = v140.ResetCharacterButton:FindFirstChild("ResetCharacterHint");
                if l_ResetCharacterHint_1 then
                    l_ResetCharacterHint_1.ImageColor3 = v244 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100);
                end;
                local l_ResetCharacterButtonTextLabel_1 = v140.ResetCharacterButton:FindFirstChild("ResetCharacterButtonTextLabel");
                if l_ResetCharacterButtonTextLabel_1 then
                    l_ResetCharacterButtonTextLabel_1.TextColor3 = v244 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100);
                end;
            end;
        end;
        return {
            getCanRespawn = v239, 
            getCustomRespawnCallback = v241, 
            setCanRespawn = v247, 
            setCustomRespawnCallback = v242, 
            onLeaveGame = function(v248) --[[ Line: 879 ]] --[[ Name: onLeaveGame ]]
                -- upvalues: v140 (ref), v61 (ref), v105 (ref), l_TelemetryService_0 (ref), v92 (ref)
                if not v140:GetVisibility() then
                    return;
                else
                    v140:AddToMenuStack(v140.Pages.CurrentPage);
                    v140.HubBar.Visible = false;
                    if v61.GetFFlagEnableLeaveGameUpsellEntrypoint() and v140.leaveGameUpsellProp ~= v105.PHONE_UPSELL_VALUE_PROP.None then
                        v140:SwitchToPage(v140.LeaveGameUpsellPage, false);
                    else
                        v140:SwitchToPage(v140.LeaveGamePage, false, nil, v61.FFlagMenuButtonsSkipAnimation and true or nil);
                    end;
                    l_TelemetryService_0:LogCounter(v92, {
                        customFields = {
                            source = v248
                        }
                    });
                    return;
                end;
            end, 
            onRespawn = function(v249) --[[ Line: 898 ]] --[[ Name: onRespawn ]]
                -- upvalues: v239 (ref), v140 (ref), v61 (ref), l_TelemetryService_0 (ref), v93 (ref)
                if not v239(false) then
                    return;
                else
                    v140:AddToMenuStack(v140.Pages.CurrentPage);
                    v140.HubBar.Visible = false;
                    v140:SwitchToPage(v140.ResetCharacterPage, false, nil, v61.FFlagMenuButtonsSkipAnimation and true or nil);
                    l_TelemetryService_0:LogCounter(v93, {
                        customFields = {
                            source = v249
                        }
                    });
                    return;
                end;
            end, 
            onResume = function(v250) --[[ Line: 913 ]] --[[ Name: onResume ]]
                -- upvalues: v61 (ref), v140 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), l_TelemetryService_0 (ref), v94 (ref)
                if v61.FFlagAddUILessMode then
                    v140:SetVisibility(false, nil, nil, nil, v250);
                else
                    v140:SetVisibility(false);
                end;
                if v61.FFlagAddUILessMode and v61.FIntAddUILessModeVariant ~= 0 and v140.uiLessStore.getUILessModeEnabled(false) then
                    v140.uiLessStore.setUIVisible(false);
                end;
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsResumeGameName, l_Constants_0.AnalyticsMenuActionName, {
                    source = v250, 
                    playsessionid = v140.playSessionId, 
                    universeid = tostring(game.GameId)
                });
                l_TelemetryService_0:LogCounter(v94, {
                    customFields = {
                        source = v250
                    }
                });
            end
        };
    end;
    local v254 = v61.FFlagRelocateMobileMenuButtons and v61.FIntRelocateMobileMenuButtonsVariant ~= 0 and function() --[[ Line: 945 ]]
        -- upvalues: v140 (copy), v16 (ref), v15 (ref), v35 (ref), v60 (ref)
        if v140.BottomButtonFrameRoot then
            return;
        else
            local l_v140_ExperienceControlStore_0 = v140:GetExperienceControlStore();
            v140.BottomButtonFrameRoot = v16.createRoot(v140.BottomButtonFrame);
            v140.BottomButtonFrameRoot:render(v15.createElement(v35, {
                onLeaveGame = l_v140_ExperienceControlStore_0.onLeaveGame, 
                onRespawn = l_v140_ExperienceControlStore_0.onRespawn, 
                onResume = l_v140_ExperienceControlStore_0.onResume, 
                setAddMenuKeyBindings = function(v252) --[[ Line: 957 ]] --[[ Name: setAddMenuKeyBindings ]]
                    -- upvalues: v140 (ref)
                    v140.addMenuKeyBindings = v252;
                end, 
                setRemoveMenuKeyBindings = function(v253) --[[ Line: 961 ]] --[[ Name: setRemoveMenuKeyBindings ]]
                    -- upvalues: v140 (ref)
                    v140.removeMenuKeyBindings = v253;
                end, 
                getVisibility = function() --[[ Line: 965 ]] --[[ Name: getVisibility ]]
                    -- upvalues: v140 (ref)
                    return v140.GetVisibility();
                end, 
                getCanRespawn = l_v140_ExperienceControlStore_0.getCanRespawn, 
                currentPageChangeSignal = if v60.FFlagAddTraversalHistoryReactMenuButtons then v140.CurrentPageSignal else nil
            }));
            return;
        end;
    end or nil;
    local v255 = v61.FFlagRelocateMobileMenuButtons and v61.FIntRelocateMobileMenuButtonsVariant ~= 0 and function() --[[ Line: 975 ]]
        -- upvalues: v140 (copy)
        if v140.BottomButtonFrameRoot then
            v140.BottomButtonFrameRoot:unmount();
            v140.BottomButtonFrameRoot = nil;
        end;
    end or nil;
    local function v356() --[[ Line: 983 ]] --[[ Name: createGui ]]
        -- upvalues: v25 (ref), v140 (copy), l_Create_0 (ref), v125 (ref), v124 (ref), l_RobloxGui_0 (ref), l_SHIELD_INACTIVE_POSITION_0 (ref), v53 (ref), v52 (ref), v56 (ref), v61 (ref), v51 (ref), v11 (ref), v114 (ref), v115 (ref), v133 (ref), v86 (ref), v77 (ref), l_RunService_0 (ref), l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref), v27 (ref), l_BaseUrl_0 (ref), v82 (ref), l_StarterPlayer_0 (ref), l_Players_0 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), v139 (ref), l_GuiService_0 (ref), v41 (ref), l_default_0 (ref), v12 (ref), v36 (ref), l_IXPService_0 (ref), l_AppStyleProvider_0 (ref), l_Dark_0 (ref), v33 (ref), v34 (ref), l_AppFonts_0 (ref), v14 (ref), v111 (ref), l_UserInputService_0 (ref), v238 (ref), v254 (copy), l_CorePackages_0 (ref), l_InExperienceAppChatModal_0 (ref), v168 (copy), v105 (ref), l_InExperienceCapabilities_0 (ref), v203 (copy), v206 (ref), v226 (ref), v175 (copy), v207 (ref), l_l_UserInputService_0_ImageForKeyCode_0 (copy), v205 (ref), v16 (ref), v15 (ref), l_FoundationProvider_0 (ref), v17 (ref), v24 (ref), l_SwitchTabHint_0 (ref), l_isSubjectToDesktopPolicies_0 (ref), v88 (ref)
        local v256 = 0;
        if v25:IsSmallTouchScreen() then
            v256 = 5;
        end;
        v140.ClippingShield = l_Create_0("Frame")({
            Name = "SettingsClippingShield", 
            Size = v125, 
            Position = v124, 
            BorderSizePixel = 0, 
            ClipsDescendants = true, 
            BackgroundTransparency = 1, 
            Visible = true, 
            ZIndex = 2, 
            Parent = l_RobloxGui_0
        });
        v140.CanvasGroup = l_Create_0("CanvasGroup")({
            Name = "CanvasGroup", 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            GroupTransparency = 0, 
            Visible = false, 
            Parent = v140.ClippingShield
        });
        v140.Shield = l_Create_0("ImageButton")({
            Name = "SettingsShield", 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = l_SHIELD_INACTIVE_POSITION_0, 
            BackgroundTransparency = v53, 
            BackgroundColor3 = v52, 
            BorderSizePixel = 0, 
            Visible = false, 
            Active = true, 
            ZIndex = 2, 
            Parent = v140.ClippingShield
        });
        v140.VRShield = l_Create_0("Frame")({
            Name = "VRBackground", 
            Parent = v140.Shield, 
            BackgroundColor3 = v52, 
            BackgroundTransparency = v53, 
            Position = UDim2.new(0, -4, 0, 24), 
            Size = UDim2.new(1, 8, 1, -40), 
            BorderSizePixel = 0, 
            Visible = false
        });
        local l_game_EngineFeature_1 = game:GetEngineFeature("CoreScriptVersionEnabled");
        if l_game_EngineFeature_1 then
            v140.VersionContainer = l_Create_0("ScrollingFrame")({
                Name = "VersionContainer", 
                Parent = v140.Shield, 
                CanvasSize = UDim2.new(0, 0, 0, v56), 
                BackgroundColor3 = v52, 
                BackgroundTransparency = v53, 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, 0, 0, v56), 
                AnchorPoint = Vector2.new(0, 1), 
                BorderSizePixel = 0, 
                AutoLocalize = false, 
                ScrollingDirection = Enum.ScrollingDirection.X, 
                ScrollBarThickness = 0, 
                ZIndex = 5, 
                Visible = false
            });
        else
            v140.VersionContainer = l_Create_0("Frame")({
                Name = "VersionContainer", 
                Parent = v140.Shield, 
                BackgroundColor3 = v52, 
                BackgroundTransparency = v53, 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, 0, 0, v56), 
                AnchorPoint = Vector2.new(0, 1), 
                BorderSizePixel = 0, 
                AutoLocalize = false, 
                ZIndex = 5, 
                Visible = false
            });
        end;
        local v258 = l_Create_0("UIListLayout")({
            Name = "VersionContainer", 
            Parent = v140.VersionContainer, 
            Padding = UDim.new(0, 6), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        });
        local function _(v259) --[[ Line: 1093 ]] --[[ Name: addSizeToLabel ]]
            -- upvalues: l_game_EngineFeature_1 (copy), v56 (ref)
            local v260 = UDim2.new(0.2, -6, 1, 0);
            v259.Size = l_game_EngineFeature_1 and UDim2.new(0, v259.TextBounds.X + 6, 0, v56) or v260;
        end;
        if v61.GetFFlagDisplayServerChannel() then
            v140.ServerChannelLabel = l_Create_0("TextLabel")({
                Name = "ServerChannelLabel", 
                Parent = v140.VersionContainer, 
                LayoutOrder = 3, 
                BackgroundTransparency = 1, 
                TextColor3 = Color3.new(1, 1, 1), 
                TextSize = v51.textSize(v11 and 28 or v25:IsSmallTouchScreen() and 14 or 20), 
                Text = "Server Channel: ...", 
                Font = v51.font(Enum.Font.SourceSans, "SettingsHub"), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 5
            });
            spawn(function() --[[ Line: 1112 ]]
                -- upvalues: v114 (ref), v115 (ref), v140 (ref), v133 (ref), l_game_EngineFeature_1 (copy), v56 (ref)
                local v262 = "Server Channel: ";
                if v114 then
                    if not v115 then
                        v262 = "Server Channel: ";
                    else
                        local l_status_3, l_result_3 = pcall(v115.FormatByKey, v115, "InGame.HelpMenu.Label.ServerChannel");
                        v262 = if l_status_3 then l_result_3 else "Server Channel: ";
                    end;
                end;
                v140.ServerChannelLabel.Text = v262 .. v133();
                local l_ServerChannelLabel_0 = v140.ServerChannelLabel;
                local v266 = UDim2.new(0.2, -6, 1, 0);
                l_ServerChannelLabel_0.Size = l_game_EngineFeature_1 and UDim2.new(0, l_ServerChannelLabel_0.TextBounds.X + 6, 0, v56) or v266;
                v140.ServerChannelLabel.TextScaled = not (l_game_EngineFeature_1 or v140.ServerChannelLabel.TextFits);
            end);
        end;
        v140.ServerVersionLabel = l_Create_0("TextLabel")({
            Name = "ServerVersionLabel", 
            Parent = v140.VersionContainer, 
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            TextColor3 = Color3.new(1, 1, 1), 
            TextSize = v51.textSize(v11 and 28 or v25:IsSmallTouchScreen() and 14 or 20), 
            Text = "Server Version: ...", 
            Font = v51.font(Enum.Font.SourceSans, "SettingsHub"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 5
        });
        spawn(function() --[[ Line: 1136 ]]
            -- upvalues: v114 (ref), v115 (ref), v140 (ref), v86 (ref), v77 (ref), l_game_EngineFeature_1 (copy), v56 (ref)
            local v267 = "Server Version: ";
            if v114 then
                if not v115 then
                    v267 = "Server Version: ";
                else
                    local l_status_4, l_result_4 = pcall(v115.FormatByKey, v115, "InGame.HelpMenu.Label.ServerVersion");
                    v267 = if l_status_4 then l_result_4 else "Server Version: ";
                end;
            end;
            local l_ServerVersionLabel_0 = v140.ServerVersionLabel;
            local l_v267_0 = v267;
            local v272;
            if v86 then
                v272 = v86;
            else
                if not v77 then
                    repeat
                        wait();
                    until v77;
                end;
                v86 = v77:InvokeServer();
                v272 = v86;
            end;
            l_ServerVersionLabel_0.Text = l_v267_0 .. v272;
            l_ServerVersionLabel_0 = v140.ServerVersionLabel;
            local v273 = UDim2.new(0.2, -6, 1, 0);
            l_ServerVersionLabel_0.Size = l_game_EngineFeature_1 and UDim2.new(0, l_ServerVersionLabel_0.TextBounds.X + 6, 0, v56) or v273;
            v140.ServerVersionLabel.TextScaled = not (l_game_EngineFeature_1 or v140.ServerVersionLabel.TextFits);
        end);
        local v274 = "Client Version: ";
        if v114 then
            if not v115 then
                v274 = "Client Version: ";
            else
                local l_status_5, l_result_5 = pcall(v115.FormatByKey, v115, "InGame.HelpMenu.Label.ClientVersion");
                v274 = if l_status_5 then l_result_5 else "Client Version: ";
            end;
        end;
        local l_l_RunService_0_RobloxVersion_0 = l_RunService_0:GetRobloxVersion();
        local l_status_6, l_result_6 = pcall(function() --[[ Line: 1152 ]]
            -- upvalues: l_RunService_0 (ref)
            return l_RunService_0.ClientGitHash;
        end);
        if l_status_6 then
            l_l_RunService_0_RobloxVersion_0 = string.format("%s (%.6s)", l_l_RunService_0_RobloxVersion_0, l_result_6);
        end;
        v140.ClientVersionLabel = l_Create_0("TextLabel")({
            Name = "ClientVersionLabel", 
            Parent = v140.VersionContainer, 
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            TextColor3 = Color3.new(1, 1, 1), 
            TextSize = v51.textSize(v11 and 28 or v25:IsSmallTouchScreen() and 14 or 20), 
            Text = v274 .. l_l_RunService_0_RobloxVersion_0, 
            Font = v51.font(Enum.Font.SourceSans, "SettingsHub"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 5
        });
        local l_ClientVersionLabel_0 = v140.ClientVersionLabel;
        local v281 = UDim2.new(0.2, -6, 1, 0);
        l_ClientVersionLabel_0.Size = l_game_EngineFeature_1 and UDim2.new(0, l_ClientVersionLabel_0.TextBounds.X + 6, 0, v56) or v281;
        v140.ClientVersionLabel.TextScaled = not (l_game_EngineFeature_1 or v140.ClientVersionLabel.TextFits);
        v140.PlaceVersionLabel = l_Create_0("TextLabel")({
            Name = "PlaceVersionLabel", 
            Parent = v140.VersionContainer, 
            BackgroundTransparency = 1, 
            LayoutOrder = 3, 
            TextColor3 = Color3.new(1, 1, 1), 
            TextSize = v51.textSize(v11 and 28 or v25:IsSmallTouchScreen() and 14 or 20), 
            Text = "Place Version: ...", 
            Font = v51.font(Enum.Font.SourceSans, "SettingsHub"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 5
        });
        l_ClientVersionLabel_0 = function() --[[ Line: 1189 ]] --[[ Name: setPlaceVersionText ]]
            -- upvalues: v114 (ref), v115 (ref), v140 (ref), v61 (ref), l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref), l_game_EngineFeature_1 (copy), v56 (ref)
            local v282 = "Place Version: ";
            if v114 then
                if not v115 then
                    v282 = "Place Version: ";
                else
                    local l_status_7, l_result_7 = pcall(v115.FormatByKey, v115, "InGame.HelpMenu.Label.PlaceVersion");
                    v282 = if l_status_7 then l_result_7 else "Place Version: ";
                end;
            end;
            local l_PlaceVersionLabel_0 = v140.PlaceVersionLabel;
            local l_v282_0 = v282;
            local v287;
            if v61.GetFFlagRemoveAssetVersionEndpoint() then
                v287 = game.PlaceVersion;
            else
                local l_PlaceVersion_1 = game.PlaceVersion;
                do
                    local l_l_PlaceVersion_1_0 = l_PlaceVersion_1;
                    pcall(function() --[[ Line: 357 ]]
                        -- upvalues: l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref), l_l_PlaceVersion_1_0 (ref)
                        local l_l_HttpRbxApiService_0_Async_1 = l_HttpRbxApiService_0:GetAsync(string.format("assets/%d/versions", game.PlaceId));
                        local l_VersionNumber_1 = l_HttpService_0:JSONDecode(l_l_HttpRbxApiService_0_Async_1)[1].VersionNumber;
                        l_l_PlaceVersion_1_0 = string.format("%s (Latest: %d)", l_l_PlaceVersion_1_0, l_VersionNumber_1);
                    end);
                    v287 = l_l_PlaceVersion_1_0;
                end;
            end;
            l_PlaceVersionLabel_0.Text = l_v282_0 .. v287;
            l_PlaceVersionLabel_0 = v140.PlaceVersionLabel;
            local v292 = UDim2.new(0.2, -6, 1, 0);
            l_PlaceVersionLabel_0.Size = l_game_EngineFeature_1 and UDim2.new(0, l_PlaceVersionLabel_0.TextBounds.X + 6, 0, v56) or v292;
            v140.PlaceVersionLabel.TextScaled = not (l_game_EngineFeature_1 or v140.PlaceVersionLabel.TextFits);
        end;
        game:GetPropertyChangedSignal("PlaceVersion"):Connect(l_ClientVersionLabel_0);
        spawn(l_ClientVersionLabel_0);
        if not v27:IsSubjectToChinaPolicies() then
            v140.EnvironmentLabel = l_Create_0("TextLabel")({
                Name = "EnvironmentLabel", 
                Parent = v140.VersionContainer, 
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 1, 
                TextColor3 = Color3.new(1, 1, 1), 
                LayoutOrder = 4, 
                TextSize = v51.textSize(v11 and 28 or v25:IsSmallTouchScreen() and 14 or 20), 
                Text = l_BaseUrl_0, 
                Font = v51.font(Enum.Font.SourceSans, "SettingsHub"), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 5, 
                Visible = v82
            });
            local l_EnvironmentLabel_0 = v140.EnvironmentLabel;
            local v294 = UDim2.new(0.2, -6, 1, 0);
            l_EnvironmentLabel_0.Size = l_game_EngineFeature_1 and UDim2.new(0, l_EnvironmentLabel_0.TextBounds.X + 6, 0, v56) or v294;
            v140.EnvironmentLabel.TextScaled = not (l_game_EngineFeature_1 or v140.EnvironmentLabel.TextFits);
        end;
        if game:GetEngineFeature("GetPlaySessionIdEnabled") then
            local l_game_PlaySessionId_0 = game:GetPlaySessionId();
            if l_game_PlaySessionId_0 ~= "" then
                local v296 = "PlaySessionId: " .. l_game_PlaySessionId_0;
                if v115 then
                    v296 = v115:FormatByKey("InGame.HelpMenu.Label.PlaySessionId", {
                        RBX_STR = l_game_PlaySessionId_0
                    });
                end;
                v140.PlaySessionIdLabel = l_Create_0("TextLabel")({
                    Name = "PlaySessionIdLabel", 
                    Parent = v140.VersionContainer, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 5, 
                    TextColor3 = Color3.new(1, 1, 1), 
                    TextSize = v51.textSize(v11 and 28 or v25:IsSmallTouchScreen() and 14 or 20), 
                    Text = v296, 
                    Font = v51.font(Enum.Font.SourceSans, "SettingsHub"), 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    ZIndex = 5
                });
                local l_PlaySessionIdLabel_0 = v140.PlaySessionIdLabel;
                local v298 = UDim2.new(0.2, -6, 1, 0);
                l_PlaySessionIdLabel_0.Size = l_game_EngineFeature_1 and UDim2.new(0, l_PlaySessionIdLabel_0.TextBounds.X + 6, 0, v56) or v298;
                v140.PlaySessionIdLabel.TextScaled = not v140.PlaySessionIdLabel.TextFits;
            end;
        end;
        local function v312() --[[ Line: 1251 ]] --[[ Name: getOverridesPlayerScripts ]]
            -- upvalues: l_StarterPlayer_0 (ref), v61 (ref), v114 (ref), v115 (ref)
            local v299 = l_StarterPlayer_0:WaitForChild("StarterPlayerScripts", v61.FFlagRemoveLoadingTimeout and 1e999 or nil);
            local l_PlayerScriptsLoader_0 = v299:FindFirstChild("PlayerScriptsLoader");
            local l_PlayerModule_0 = v299:FindFirstChild("PlayerModule");
            if l_PlayerModule_0 and l_PlayerScriptsLoader_0 and not l_PlayerModule_0.Archivable then
                if l_PlayerScriptsLoader_0.Archivable then
                    if v114 then
                        if not v115 then
                            return "Possibly Custom";
                        else
                            local l_status_8, l_result_8 = pcall(v115.FormatByKey, v115, "InGame.CommonUI.Label.PossiblyCustom");
                            if l_status_8 then
                                return l_result_8;
                            else
                                return "Possibly Custom";
                            end;
                        end;
                    else
                        return "Possibly Custom";
                    end;
                elseif v114 then
                    if not v115 then
                        return "Default";
                    else
                        local l_status_9, l_result_9 = pcall(v115.FormatByKey, v115, "InGame.CommonUI.Label.Default");
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
                local l_CameraScript_0 = v299:FindFirstChild("CameraScript");
                local l_ControlScript_0 = v299:FindFirstChild("ControlScript");
                if l_CameraScript_0 or l_ControlScript_0 then
                    if v114 then
                        if not v115 then
                            return "Custom Old";
                        else
                            local l_status_10, l_result_10 = pcall(v115.FormatByKey, v115, "InGame.CommonUI.Label.CustomOld");
                            if l_status_10 then
                                return l_result_10;
                            else
                                return "Custom Old";
                            end;
                        end;
                    else
                        return "Custom Old";
                    end;
                elseif v114 then
                    if not v115 then
                        return "Custom";
                    else
                        local l_status_11, l_result_11 = pcall(v115.FormatByKey, v115, "InGame.CommonUI.Label.Custom");
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
        v140.OverridesPlayerScriptsLabel = l_Create_0("TextLabel")({
            Name = "OverridesPlayerScriptsLabel", 
            Parent = v140.VersionContainer, 
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            TextColor3 = Color3.new(1, 1, 1), 
            LayoutOrder = 5, 
            TextSize = v51.textSize(v11 and 28 or v25:IsSmallTouchScreen() and 14 or 20), 
            Text = "PlayerScripts: ", 
            Font = v51.font(Enum.Font.SourceSans, "SettingsHub"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 5, 
            Visible = false
        });
        spawn(function() --[[ Line: 1304 ]]
            -- upvalues: l_RobloxGui_0 (ref), l_Players_0 (ref), v114 (ref), v115 (ref), v312 (copy), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), v61 (ref), v140 (ref), v82 (ref), l_game_EngineFeature_1 (copy), v56 (ref)
            local v313 = require(l_RobloxGui_0.Modules.PlayerPermissionsModule);
            if not l_Players_0.LocalPlayer then
                l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
            end;
            local v314 = "PlayerScripts: ";
            if v114 then
                if not v115 then
                    v314 = "PlayerScripts: ";
                else
                    local l_status_12, l_result_12 = pcall(v115.FormatByKey, v115, "InGame.HelpMenu.Label.PlayerScripts");
                    v314 = if l_status_12 then l_result_12 else "PlayerScripts: ";
                end;
            end;
            local v317 = v312();
            l_RbxAnalyticsService_0:setRBXEventStream(l_Constants_0.AnalyticsTargetName, "player_scripts_status", "player_scripts_status_action", {
                defaultPlayerScripts = v317 == "Default", 
                placeID = tostring(game.PlaceId), 
                rawValue = if v61.GetFFlagNewEventIngestPlayerScriptsDimensions() then v317 else nil, 
                context = v61.GetFFlagNewEventIngestPlayerScriptsDimensions() and "IGMv1" or nil
            });
            v140.OverridesPlayerScriptsLabel.Text = v314 .. v317;
            v140.OverridesPlayerScriptsLabel.Visible = v82 or v313.IsPlayerAdminAsync(l_Players_0.LocalPlayer);
            local l_OverridesPlayerScriptsLabel_0 = v140.OverridesPlayerScriptsLabel;
            local v319 = UDim2.new(0.2, -6, 1, 0);
            l_OverridesPlayerScriptsLabel_0.Size = l_game_EngineFeature_1 and UDim2.new(0, l_OverridesPlayerScriptsLabel_0.TextBounds.X + 6, 0, v56) or v319;
            v140.OverridesPlayerScriptsLabel.TextScaled = not (l_game_EngineFeature_1 or v140.OverridesPlayerScriptsLabel.TextFits);
        end);
        if l_game_EngineFeature_1 then
            local v320 = "Client CoreScript Version: ";
            if v114 then
                if not v115 then
                    v320 = "Client CoreScript Version: ";
                else
                    local l_status_13, l_result_13 = pcall(v115.FormatByKey, v115, "InGame.HelpMenu.Label.ClientCoreScriptVersion");
                    v320 = if l_status_13 then l_result_13 else "Client CoreScript Version: ";
                end;
            end;
            v140.CoreScriptVersionLabel = l_Create_0("TextLabel")({
                Name = "CoreScriptVersionLabel", 
                Parent = v140.VersionContainer, 
                LayoutOrder = 6, 
                BackgroundTransparency = 1, 
                TextColor3 = Color3.new(1, 1, 1), 
                TextSize = v51.textSize(v11 and 28 or v25:IsSmallTouchScreen() and 14 or 20), 
                Text = v320 .. l_RunService_0:GetCoreScriptVersion(), 
                Font = v51.font(Enum.Font.SourceSans, "SettingsHub"), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 5
            });
            local l_CoreScriptVersionLabel_0 = v140.CoreScriptVersionLabel;
            local v324 = UDim2.new(0.2, -6, 1, 0);
            l_CoreScriptVersionLabel_0.Size = l_game_EngineFeature_1 and UDim2.new(0, l_CoreScriptVersionLabel_0.TextBounds.X + 6, 0, v56) or v324;
            l_CoreScriptVersionLabel_0 = v140.VersionContainer;
            local l_l_CoreScriptVersionLabel_0_0 = l_CoreScriptVersionLabel_0 --[[ copy: 12 -> 22 ]];
            v258:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 1351 ]]
                -- upvalues: l_l_CoreScriptVersionLabel_0_0 (copy), v258 (copy), v56 (ref)
                l_l_CoreScriptVersionLabel_0_0.CanvasSize = UDim2.new(0, v258.AbsoluteContentSize.X, 0, v56);
            end);
        end;
        v140.Modal = l_Create_0("TextButton")({
            Name = "Modal", 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, -1), 
            Size = UDim2.new(1, 0, 1, 0), 
            Modal = true, 
            Text = "", 
            Parent = v140.Shield, 
            Selectable = false
        });
        if v51.EnableDarkenBackground then
            if v61.FFlagSettingsHubIndependentBackgroundVisibility then
                v140.DarkenBackground = l_Create_0("ImageButton")({
                    Name = "DarkenBackground", 
                    ZIndex = v140.Shield.ZIndex - 1, 
                    BackgroundTransparency = 1, 
                    BackgroundColor3 = if v61.isInExperienceUIVREnabled then v140.SettingsUIDelegate:getDarkBackgroundTheme().Color else v51.color("DarkenBackground"), 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Parent = v140.ClippingShield, 
                    AutoButtonColor = false, 
                    Visible = false
                });
            else
                v140.DarkenBackground = l_Create_0("Frame")({
                    Name = "DarkenBackground", 
                    ZIndex = v140.Shield.ZIndex - 1, 
                    BackgroundTransparency = 1, 
                    BackgroundColor3 = v51.color("DarkenBackground"), 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Parent = v140.ClippingShield
                });
            end;
        end;
        local v326 = v51.MenuContainerPosition(v140.SettingsUIDelegate);
        v140.MenuContainer = l_Create_0("ImageButton")({
            Name = "MenuContainer", 
            ZIndex = v140.Shield.ZIndex, 
            BackgroundTransparency = v51.transparency("MenuContainer", 1), 
            BackgroundColor3 = v51.color("MenuContainer"), 
            Position = v326.Position, 
            Size = v326.Size, 
            AnchorPoint = v326.AnchorPoint, 
            AutomaticSize = v326.AutomaticSize, 
            Parent = v140.Shield
        });
        if v61.FFlagCreateInExperienceMenuReact then
            v140.ReactPage.Parent = v140.MenuContainer;
        else
            v140.ReactPage = v139(v140.MenuContainer);
        end;
        v140.Page = l_Create_0("Frame")({
            Name = "Page", 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Parent = v140.MenuContainer
        });
        local l_Page_0 = v140.Page;
        v140.MenuContainerPadding = l_Create_0("UIPadding")({
            Parent = l_Page_0
        });
        if not v11 then
            local _ = l_GuiService_0:GetGuiInset().Y;
            v140.MenuContainerPadding.PaddingTop = UDim.new(0, 0);
        end;
        local v329 = v51.HubPadding();
        v140.MenuContainer.AutoButtonColor = false;
        v140.MenuContainerPadding.PaddingLeft = v329.PaddingLeft;
        v140.MenuContainerPadding.PaddingRight = v329.PaddingRight;
        v140.MenuContainerPadding.PaddingBottom = v329.PaddingBottom;
        v140.MenuContainerPadding.PaddingTop = v329.PaddingTop;
        l_Create_0("UICorner")({
            CornerRadius = v51.MenuContainerCornerRadius, 
            Parent = v140.MenuContainer
        });
        if v51.EnableVerticalBottomBar then
            v140.MainColumn = l_Create_0("Frame")({
                Name = "MainColumn", 
                BackgroundTransparency = 1, 
                Position = v326.Position, 
                Size = v326.Size, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Parent = v140.MenuContainer
            });
            l_Page_0 = v140.MainColumn;
            v140.VerticalMenuDivider = l_Create_0("Frame")({
                Name = "VerticalMenuDivider", 
                BackgroundTransparency = v51.transparency("Divider"), 
                BackgroundColor3 = v51.color("Divider"), 
                Size = UDim2.new(0, 1, 1, -100), 
                Visible = true, 
                Parent = v140.MenuContainer
            });
            v140.VerticalMenu = l_Create_0("Frame")({
                Name = "VerticalMenu", 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, v51.VerticalMenuWidth, 0, 100), 
                Visible = false, 
                Parent = v140.MenuContainer
            });
            l_Create_0("UIListLayout")({
                Name = "MenuListLayout", 
                Padding = UDim.new(0, 10), 
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Parent = v140.VerticalMenu
            });
            v140.MenuListLayout = l_Create_0("UIListLayout")({
                Name = "MenuListLayout", 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Parent = v140.MenuContainer
            });
        end;
        v41(function(v330) --[[ Line: 1504 ]]
            -- upvalues: v140 (ref)
            v140.hasMicPermissions = v330.hasMicPermissions;
            v140.isFetchingMicPermissions = false;
        end, nil, true);
        v140.SettingsShowSignal:connect(function(v331) --[[ Line: 1510 ]]
            -- upvalues: l_default_0 (ref), v140 (ref)
            if v331 then
                if l_default_0:IsSeamlessVoice() and not l_default_0.voiceUIVisible then
                    l_default_0.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("shown", l_default_0:GetConnectDisconnectButtonAnalyticsData(true));
                elseif l_default_0:IsSeamlessVoice() and l_default_0.voiceUIVisible then
                    l_default_0.Analytics:reportLeaveVoiceButtonEvent("shown", l_default_0:GetConnectDisconnectButtonAnalyticsData(true));
                end;
                if l_default_0:UserVoiceEnabled() and v140.isFetchingMicPermissions then
                    return;
                elseif not (l_default_0:UserOnlyEligibleForVoice() or l_default_0:UserVoiceEnabled() and not v140.hasMicPermissions) then
                    return;
                end;
            end;
        end);
        v140.MenuListLayout = l_Create_0("UIListLayout")({
            Name = "MenuListLayout", 
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Parent = l_Page_0
        });
        v140.HubBar = l_Create_0("ImageLabel")({
            Name = "HubBar", 
            BackgroundColor3 = v51.color("HubBarContainer"), 
            BackgroundTransparency = v51.transparency("HubBarContainerTransparency"), 
            ZIndex = v140.Shield.ZIndex + 1, 
            BorderSizePixel = 0, 
            AnchorPoint = Vector2.new(0.5, 0), 
            LayoutOrder = 0, 
            Parent = l_Page_0
        });
        l_Create_0("Frame")({
            BackgroundColor3 = v51.color("Divider"), 
            BackgroundTransparency = v51.transparency("Divider"), 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            Parent = v140.HubBar
        });
        v140.HubBarListLayout = l_Create_0("UIListLayout")({
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Parent = v140.HubBar
        });
        if not v61.FFlagAddTraversalBackButton then
            if v61.EngineFeatureTeleportHistoryButtons then
                v140.BackBarRef = v12.createRef();
                v140.FrontBarRef = v12.createRef();
                v140.BackBar = v12.createElement(v36.Provider, {
                    value = l_IXPService_0
                }, {
                    AppStyleProvider = v12.createElement(l_AppStyleProvider_0, {
                        style = {
                            themeName = l_Dark_0
                        }
                    }, {
                        ButtonsFrame = v12.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            LayoutOrder = -1, 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            Size = UDim2.new(1, 0, 0, 0)
                        }, {
                            BackButton = v12.createElement(v33, {
                                BackBarRef = v140.BackBarRef, 
                                HubBar = v140.HubBar, 
                                LayoutOrder = 1
                            }), 
                            FrontButton = v12.createElement(v34, {
                                FrontBarRef = v140.FrontBarRef, 
                                HubBar = v140.HubBar, 
                                LayoutOrder = 2
                            })
                        })
                    })
                });
                v12.mount(v140.BackBar, l_Page_0, "BackBar");
            else
                v140.BackBarRef = v12.createRef();
                v140.BackBar = v12.createElement(v36.Provider, {
                    value = l_IXPService_0
                }, {
                    AppStyleProvider = v12.createElement(l_AppStyleProvider_0, {
                        style = {
                            themeName = l_Dark_0
                        }
                    }, {
                        BackButton = v12.createElement(v33, {
                            BackBarRef = v140.BackBarRef, 
                            HubBar = v140.HubBar
                        })
                    })
                });
                v12.mount(v140.BackBar, l_Page_0, "BackBar");
            end;
        end;
        if v25:IsSmallTouchScreen() then
            v140.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 100, 0, 50);
            v140.HubBar.Position = UDim2.new(0.5, 0, 0, 6);
        elseif v11 then
            v140.HubBar.Size = UDim2.new(0, 1200, 0, 100);
            v140.HubBar.Position = UDim2.new(0.5, 0, 0.1, 0);
        else
            v140.HubBar.Size = UDim2.new(0, 800, 0, 60);
            v140.HubBar.Position = UDim2.new(0.5, 0, 0.1, 0);
        end;
        v140.VoiceRecordingIndicatorFrame = if not v61.FFlagAvatarChatCoreScriptSupport then l_Create_0("Frame")({
            Size = if v61.ChromeEnabled then UDim2.new(1, 0, 0, 100) else UDim2.fromOffset(0, 100), 
            Position = UDim2.new(0, 0, 0, 0), 
            Parent = v140.HubBar, 
            BackgroundTransparency = 1
        }) else nil;
        v140.VoiceRecordingText = l_Create_0("TextLabel")({
            Parent = v140.VoiceRecordingIndicatorFrame, 
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
        if v25:IsSmallTouchScreen() then
            v140.VoiceRecordingText.Size = UDim2.fromScale(1, 1);
            v140.VoiceRecordingText.AnchorPoint = Vector2.new(0, 0);
            if v61.ChromeEnabled then
                v140.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right;
                v140.VoiceRecordingText.Position = UDim2.new(0, 0, 0, -60);
            else
                v140.VoiceRecordingText.Position = UDim2.new(0, 60, 0, -60);
            end;
        elseif v11 then
            v140.VoiceRecordingText.AnchorPoint = Vector2.new(0, 1);
            if v61.ChromeEnabled then
                v140.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right;
                v140.VoiceRecordingText.Size = UDim2.new(1, 0, 0, 100);
                v140.VoiceRecordingText.Position = UDim2.new(0, 0, 0.1, 0);
            else
                v140.VoiceRecordingText.Size = UDim2.new(0, 1200, 0, 100);
                v140.VoiceRecordingText.Position = UDim2.new(0.5, 0, 0.1, 0);
            end;
        else
            v140.VoiceRecordingText.AnchorPoint = Vector2.new(0, 1);
            if v61.ChromeEnabled then
                v140.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right;
                v140.VoiceRecordingText.Size = UDim2.new(1, 0, 0, 60);
                v140.VoiceRecordingText.Position = UDim2.new(0, 0, 0.1, 0);
            else
                v140.VoiceRecordingText.Size = UDim2.new(0, 800, 0, 60);
                v140.VoiceRecordingText.Position = UDim2.new(0.5, 0, 0.1, 0);
            end;
        end;
        v140.voiceRecordingIndicatorTextMotor = v14.createSingleMotor(0);
        v140.voiceRecordingIndicatorTextMotor:onStep(function(v332) --[[ Line: 1694 ]]
            -- upvalues: v140 (ref)
            v140.VoiceRecordingText.TextTransparency = v332;
        end);
        spawn(function() --[[ Line: 1698 ]]
            -- upvalues: l_RunService_0 (ref), v140 (ref), v14 (ref), v111 (ref)
            l_RunService_0:BindToRenderStep("VoiceRecordingIndicator", 1, function() --[[ Line: 1699 ]]
                -- upvalues: v140 (ref), v14 (ref), v111 (ref)
                if v140.isMuted ~= nil and v140.lastVoiceRecordingIndicatorTextUpdated ~= nil and tick() - v140.lastVoiceRecordingIndicatorTextUpdated >= 5 and v140.isMuted then
                    v140.voiceRecordingIndicatorTextMotor:setGoal(v14.spring(1, v111));
                    v140.voiceRecordingIndicatorTextMotor:start();
                end;
            end);
        end);
        v140.PageViewClipper = l_Create_0("Frame")({
            Name = "PageViewClipper", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(v140.HubBar.Size.X.Scale, v140.HubBar.Size.X.Offset, 1, -v140.HubBar.Size.Y.Offset - v140.HubBar.Position.Y.Offset - v256), 
            Position = UDim2.new(v140.HubBar.Position.X.Scale, v140.HubBar.Position.X.Offset, v140.HubBar.Position.Y.Scale, v140.HubBar.Position.Y.Offset + v140.HubBar.Size.Y.Offset + 1), 
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
        if v61.FFlagEnableConsoleExpControls and v61.ChromeEnabled then
            v140.PageViewPadding = l_Create_0("UIPadding")({
                Parent = v140.PageViewClipper
            });
            local v333 = require(l_RobloxGui_0.Modules.Chrome.Service);
            local l_v333_0 = v333 --[[ copy: 14 -> 21 ]];
            v333:onShortcutBarChanged():connect(function() --[[ Line: 1740 ]]
                -- upvalues: v25 (ref), l_v333_0 (copy), v140 (ref), v51 (ref)
                if v25:IsSmallTouchScreen() and l_v333_0:getCurrentShortcutBar():get() ~= nil then
                    v140.PageViewPadding.PaddingBottom = UDim.new(0, v51.ExtraPageBottomPaddingMobile);
                    return;
                else
                    v140.PageViewPadding.PaddingBottom = UDim.new(0, 0);
                    return;
                end;
            end);
        end;
        v140.PageView = l_Create_0("ScrollingFrame")({
            Name = "PageView", 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 2), 
            Size = UDim2.new(1, 0, 1, -20), 
            CanvasSize = UDim2.new(1, 0, 1, 0), 
            ZIndex = v140.Shield.ZIndex, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Selectable = false, 
            ScrollBarThickness = v51.DefaultScrollBarThickness, 
            Parent = v140.PageViewClipper
        });
        v140.PageView.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar;
        v140.lastPageViewCanvasPosition = v140.PageView.CanvasPosition;
        v140.handelPageViewScroll = function() --[[ Line: 1767 ]]
            -- upvalues: v140 (ref)
            local v335 = math.clamp(v140.lastPageViewCanvasPosition.Y, 0, v140.PageView.MaxCanvasPosition.Y);
            local v336 = math.clamp(v140.PageView.CanvasPosition.Y, 0, v140.PageView.MaxCanvasPosition.Y);
            local v337 = v335 - v336;
            if math.abs(v337) > 5 then
                if v337 < 0 then
                    v140:animateOutBottomBar();
                else
                    v140:animateInBottomBar();
                end;
                v140.lastPageViewCanvasPosition = Vector2.new(v140.PageView.CanvasPosition.x, v336);
            end;
        end;
        v140.pageViewScrollChangeCon = nil;
        if v51.UseStickyBar() then
            v140.PageView.AutomaticCanvasSize = Enum.AutomaticSize.Y;
            if v25:IsPortrait() == false then
                v140.defaultPageViewClipperSize = nil;
                v140.showStickyBottomBar = true;
                v140.pageViewScrollChangeCon = v140.PageView:GetPropertyChangedSignal("CanvasPosition"):connect(v140.handelPageViewScroll);
            end;
        end;
        v140.PageViewInnerFrame = l_Create_0("Frame")({
            Name = "PageViewInnerFrame", 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            ZIndex = v140.Shield.ZIndex, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Selectable = false, 
            Parent = v140.PageView, 
            LayoutOrder = 1
        });
        l_Create_0("UIPadding")({
            PaddingTop = UDim.new(0, 5), 
            Parent = v140.PageViewInnerFrame
        });
        v140.InnerCanvasGroupShow = l_Create_0("CanvasGroup")({
            Name = "InnerCanvasGroupShow", 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            GroupTransparency = 0, 
            Visible = false, 
            Parent = v140.PageViewInnerFrame
        });
        v140.InnerCanvasGroupHide = l_Create_0("CanvasGroup")({
            Name = "InnerCanvasGroupHide", 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            GroupTransparency = 0, 
            Visible = false, 
            Parent = v140.PageViewInnerFrame
        });
        if v51.UseStickyBar() then
            v140.PageView.AutomaticCanvasSize = Enum.AutomaticSize.Y;
            l_Create_0("UIListLayout")({
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Parent = v140.PageView
            });
            v140.PageViewInnerFrame.AutomaticSize = Enum.AutomaticSize.Y;
            v140.PageViewInnerFrame.ClipsDescendants = false;
        end;
        if l_UserInputService_0.MouseEnabled then
            v140.PageViewClipper.Size = UDim2.new(v140.HubBar.Size.X.Scale, v140.HubBar.Size.X.Offset, 0.5, -(v140.HubBar.Position.Y.Offset - v140.HubBar.Size.Y.Offset));
        end;
        v140.BottomButtonFrame = l_Create_0("Frame")({
            Name = "BottomButtonFrame", 
            Size = v140.HubBar.Size, 
            Position = UDim2.new(0.5, -v140.HubBar.Size.X.Offset / 2, 1 - v140.HubBar.Position.Y.Scale - v140.HubBar.Size.Y.Scale, -v140.HubBar.Position.Y.Offset - v140.HubBar.Size.Y.Offset), 
            ZIndex = v140.Shield.ZIndex + 1, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Parent = l_Page_0, 
            Selectable = not v61.FFlagIEMFocusNavToButtons and nil, 
            SelectionGroup = v61.FFlagIEMFocusNavToButtons and true or nil, 
            SelectionBehaviorLeft = if v61.FFlagIEMFocusNavToButtons then Enum.SelectionBehavior.Stop else nil, 
            SelectionBehaviorRight = if v61.FFlagIEMFocusNavToButtons then Enum.SelectionBehavior.Stop else nil, 
            SelectionBehaviorDown = if v61.FFlagIEMFocusNavToButtons then Enum.SelectionBehavior.Stop else nil
        });
        if v61.FFlagTraversalPerfFixes then
            v140.BottomButtonFrame:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 1868 ]]
                -- upvalues: v140 (ref)
                v140.setShowBottomBarSignal(v140.BottomButtonFrame.Visible);
            end);
        end;
        local function v339(v338) --[[ Line: 1873 ]]
            -- upvalues: v61 (ref), v238 (ref), v140 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), l_GuiService_0 (ref)
            if v61.FFlagAddUILessMode then
                v238(false, nil, nil, nil, v338);
            else
                v238(false);
            end;
            if v61.FFlagAddUILessMode and v61.FIntAddUILessModeVariant ~= 0 and v140.uiLessStore.getUILessModeEnabled(false) then
                v140.uiLessStore.setUIVisible(false);
            end;
            l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsResumeGameName, l_Constants_0.AnalyticsMenuActionName, {
                source = v338, 
                playsessionid = v140.playSessionId, 
                universeid = tostring(game.GameId)
            });
            if v61.FFlagIEMResumeButtonPressBugfix then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
        end;
        if not v61.FFlagMenuButtonsMountWithIEM and v61.FFlagRelocateMobileMenuButtons and (v61.FIntRelocateMobileMenuButtonsVariant == 1 or v61.FIntRelocateMobileMenuButtonsVariant == 3 or v61.FIntRelocateMobileMenuButtonsVariant == 2 and not v25:IsSmallTouchScreen()) then
            v254();
        end;
        if not v61.FFlagRelocateMobileMenuButtons or v61.FIntRelocateMobileMenuButtonsVariant == 0 or v61.FIntRelocateMobileMenuButtonsVariant == 2 and v25:IsSmallTouchScreen() then
            v140.BottomButtonFrame.Size = UDim2.new(1, 0, 0, 80);
        end;
        v140.MenuListLayout = l_Create_0("UIListLayout")({
            Padding = UDim.new(0, 12), 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Parent = v140.BottomButtonFrame
        });
        if v61.FFlagEnableSystemScrimInSettingsHub then
            local v340 = require(l_CorePackages_0.Workspace.Packages.SystemScrim).SystemScrimSignalStore(false);
            v340.backgroundScrimActivated.Event:Connect(function() --[[ Line: 1922 ]]
                -- upvalues: v61 (ref), v140 (ref), l_Constants_0 (ref), v339 (copy)
                if v61.FFlagRelocateMobileMenuButtons and v61.FIntRelocateMobileMenuButtonsVariant ~= 0 then
                    v140:GetExperienceControlStore().onResume(l_Constants_0.AnalyticsResumeShieldSource);
                    return;
                else
                    v339(l_Constants_0.AnalyticsResumeShieldSource);
                    return;
                end;
            end);
            local l_v340_0 = v340 --[[ copy: 15 -> 20 ]];
            v140.Shield:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 1930 ]]
                -- upvalues: l_v340_0 (copy), v140 (ref)
                l_v340_0.setTransparency(1);
                l_v340_0.setAutoDismiss(true);
                l_v340_0.setVisibility(v140.Shield.Visible);
            end);
        end;
        v140.Shield.Activated:Connect(function() --[[ Line: 1937 ]]
            -- upvalues: v61 (ref), v140 (ref), l_Constants_0 (ref), v339 (copy)
            if v61.FFlagRelocateMobileMenuButtons and v61.FIntRelocateMobileMenuButtonsVariant ~= 0 then
                v140:GetExperienceControlStore().onResume(l_Constants_0.AnalyticsResumeShieldSource);
                return;
            else
                v339(l_Constants_0.AnalyticsResumeShieldSource);
                return;
            end;
        end);
        if v61.FFlagSettingsHubIndependentBackgroundVisibility then
            v140.DarkenBackground.Activated:Connect(function() --[[ Line: 1947 ]]
                -- upvalues: v61 (ref), v140 (ref), l_Constants_0 (ref), v339 (copy), l_InExperienceAppChatModal_0 (ref)
                if v61.FFlagRelocateMobileMenuButtons and v61.FIntRelocateMobileMenuButtonsVariant ~= 0 then
                    v140:GetExperienceControlStore().onResume(l_Constants_0.AnalyticsResumeShieldSource);
                else
                    v339(l_Constants_0.AnalyticsResumeShieldSource);
                end;
                l_InExperienceAppChatModal_0.default:setVisible(false);
            end);
        end;
        if not v61.FFlagRelocateMobileMenuButtons or v61.FIntRelocateMobileMenuButtonsVariant == 0 then
            local function v342() --[[ Line: 1958 ]]
                -- upvalues: v61 (ref), v140 (ref), v168 (ref), v105 (ref)
                if v61.FFlagPreventHiddenSwitchPage and v140:GetVisibility() == false then
                    return;
                else
                    v140:AddToMenuStack(v140.Pages.CurrentPage);
                    v140.HubBar.Visible = false;
                    v168();
                    if v61.GetFFlagEnableLeaveGameUpsellEntrypoint() and v140.leaveGameUpsellProp ~= v105.PHONE_UPSELL_VALUE_PROP.None then
                        v140:SwitchToPage(v140.LeaveGameUpsellPage, nil, 1, true);
                        return;
                    else
                        v140:SwitchToPage(v140.LeaveGamePage, nil, 1, true);
                        return;
                    end;
                end;
            end;
            if l_InExperienceCapabilities_0.canNavigateHome then
                v203("LeaveGame", "Leave", v206, "rbxasset://textures/ui/Settings/Help/LeaveIcon.png", UDim2.new(0.5, v11 and -160 or -130, 0.5, -25), v342, {
                    Enum.KeyCode.L, 
                    if v61.FFlagEnableConsoleExpControls and v61.ChromeEnabled then nil else Enum.KeyCode.ButtonX
                }, v342);
            end;
            local function v343() --[[ Line: 1982 ]]
                -- upvalues: v226 (ref), v140 (ref), v168 (ref)
                if v226 then
                    v140:AddToMenuStack(v140.Pages.CurrentPage);
                    v140.HubBar.Visible = false;
                    v168();
                    v140:SwitchToPage(v140.ResetCharacterPage, nil, 1, true);
                end;
            end;
            local v344 = v175:Format(l_Constants_0.RespawnLocalizedKey);
            v203("ResetCharacter", v344, v207, "rbxasset://textures/ui/Settings/Help/ResetIcon.png", UDim2.new(0.5, v11 and -550 or -400, 0.5, -25), v343, {
                Enum.KeyCode.R, 
                if v61.FFlagEnableConsoleExpControls and v61.ChromeEnabled then nil else Enum.KeyCode.ButtonY
            }, v343);
            local function v345() --[[ Line: 1998 ]]
                -- upvalues: v339 (copy), l_Constants_0 (ref)
                v339(l_Constants_0.AnalyticsResumeButtonSource);
            end;
            local function v346() --[[ Line: 2001 ]]
                -- upvalues: v339 (copy), l_Constants_0 (ref)
                v339(l_Constants_0.AnalyticsResumeGamepadSource);
            end;
            v203("Resume", "Resume", if v61.FFlagEnableConsoleExpControls then l_l_UserInputService_0_ImageForKeyCode_0 else v205, "rbxasset://textures/ui/Settings/Help/EscapeIcon.png", UDim2.new(0.5, v11 and 200 or 140, 0.5, -25), v345, if v61.FFlagEnableConsoleExpControls and v61.ChromeEnabled then {} else {
                Enum.KeyCode.ButtonB, 
                Enum.KeyCode.ButtonStart
            }, v346);
        end;
        if v61.FFlagAddSwitchTabHintsToIEM then
            local function v349(v347) --[[ Line: 2011 ]] --[[ Name: MountSwitchTabHint ]]
                -- upvalues: l_Create_0 (ref), v16 (ref), v15 (ref), l_FoundationProvider_0 (ref), v17 (ref), v24 (ref), l_SwitchTabHint_0 (ref)
                local v348 = l_Create_0("Frame")({
                    Name = "SwitchTabHintContainer", 
                    Size = UDim2.fromScale(0, 1), 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    LayoutOrder = v347.layoutOrder, 
                    Parent = v347.parent
                });
                v16.createRoot(v348):render(v15.createElement(v15.Fragment, nil, v15.createElement("UIListLayout", {
                    Name = "SwitchTabHintCenterAlign", 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), v15.createElement(l_FoundationProvider_0, {
                    theme = v17.Enums.Theme.Dark, 
                    device = v24.getDeviceType()
                }, {
                    ["SwitchTabHint" .. v347.keycode.Name] = v15.createElement(l_SwitchTabHint_0, {
                        keycode = v347.keycode
                    })
                })));
            end;
            v140.TabHeaderContainer = l_Create_0("Frame")({
                Name = "TabHeaderContainer", 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                Parent = v140.HubBar
            });
            v140.TabHeaderContainerListLayout = l_Create_0("UIListLayout")({
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalFlex = Enum.UIFlexAlignment.Fill, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Parent = v140.TabHeaderContainer
            });
            v349({
                keycode = Enum.KeyCode.ButtonL1, 
                parent = v140.TabHeaderContainer, 
                layoutOrder = -999
            });
            v349({
                keycode = Enum.KeyCode.ButtonR1, 
                parent = v140.TabHeaderContainer, 
                layoutOrder = 999
            });
        end;
        v140.HubBarContainer = l_Create_0("ImageLabel")({
            Name = "HubBarContainer", 
            ZIndex = v140.Shield.ZIndex + 2, 
            BorderSizePixel = 0, 
            BackgroundColor3 = v51.color("HubBarContainer"), 
            BackgroundTransparency = v51.transparency("HubBarContainerTransparency"), 
            Size = if v51.ShowHomeButton then UDim2.new(1, -70, 1, 0) else UDim2.new(1, 0, 1, 0), 
            Position = if v51.ShowHomeButton then UDim2.new(0, 70, 0, 0) else UDim2.new(0, 0, 0, 0), 
            Parent = if v61.FFlagAddSwitchTabHintsToIEM then v140.TabHeaderContainer else v140.HubBar
        });
        v140.HubBar.ImageTransparency = 1;
        v140.HubBarListLayout.Parent = v140.HubBarContainer;
        if v51.ShowHomeButton then
            v140.HubBarHomeButton = l_Create_0("ImageButton")({
                Name = "HubBarHomeButton", 
                ZIndex = v140.Shield.ZIndex + 2, 
                BorderSizePixel = 0, 
                AutoButtonColor = false, 
                BackgroundColor3 = v51.color("HubBarHomeButton"), 
                BackgroundTransparency = v51.transparency("HubBarHomeButtonTransparency"), 
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                Parent = v140.HubBar
            });
            l_Create_0("UICorner")({
                CornerRadius = v51.DefaultCornerRadius, 
                Parent = v140.HubBarHomeButton
            });
            v140.HubBarHomeButtonAspectRatio = l_Create_0("UIAspectRatioConstraint")({
                AspectRatio = 1, 
                DominantAxis = Enum.DominantAxis.Height, 
                Parent = v140.HubBarHomeButton
            });
            v140.HubBarHomeButtonIcon = l_Create_0("ImageLabel")({
                Name = "HubBarHomeButtonIcon", 
                ZIndex = v140.Shield.ZIndex + 3, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/Settings/MenuBarIcons/HomeTab.png", 
                Size = UDim2.new(0.7, 0, 0.7, 0), 
                Position = UDim2.new(0.16, 0, 0.18, 0), 
                Parent = v140.HubBarHomeButton
            });
            v140.HubBarHomeButton:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 2121 ]]
                -- upvalues: v140 (ref)
                local v350 = v140.HubBarHomeButton.AbsoluteSize.X + 10;
                v140.HubBarContainer.Size = UDim2.new(1, -v350, 1, 0);
                v140.HubBarContainer.Position = UDim2.new(0, v350, 0, 0);
            end);
            v140.HubBarHomeButton.MouseEnter:Connect(function() --[[ Line: 2126 ]]
                -- upvalues: v140 (ref), v51 (ref)
                v140.HubBarHomeButton.BackgroundColor3 = v51.color("HubBarHomeButtonHover");
                v140.HubBarHomeButton.BackgroundTransparency = v51.transparency("HubBarHomeButtonTransparencyHover");
            end);
            v140.HubBarHomeButton.MouseLeave:Connect(function() --[[ Line: 2130 ]]
                -- upvalues: v140 (ref), v51 (ref)
                v140.HubBarHomeButton.BackgroundColor3 = v51.color("HubBarHomeButton");
                v140.HubBarHomeButton.BackgroundTransparency = v51.transparency("HubBarHomeButtonTransparency");
            end);
            local function v351() --[[ Line: 2135 ]]
                -- upvalues: v140 (ref), v168 (ref)
                v140:AddToMenuStack(v140.Pages.CurrentPage);
                v140.HubBar.Visible = false;
                v168();
                v140:SwitchToPage(v140.LeaveGameToHomePage, nil, 1, true);
            end;
            v140.HubBarHomeButton.Activated:Connect(v351);
        end;
        if l_isSubjectToDesktopPolicies_0() then
            v140.FullScreenTitleBar = v88.mount({}, v140.Shield, "FullScreenTitleBar");
        end;
        local function v352() --[[ Line: 2150 ]] --[[ Name: cameraViewportChanged ]]
            -- upvalues: v51 (ref), v25 (ref)
            v51.viewportResized();
            v25:FireOnResized();
        end;
        local v353 = nil;
        local function v355(v354) --[[ Line: 2156 ]] --[[ Name: onWorkspaceChanged ]]
            -- upvalues: v51 (ref), v25 (ref), v353 (ref), v352 (copy)
            if v354 == "CurrentCamera" then
                v51.viewportResized();
                v25:FireOnResized();
                if v353 then
                    v353:disconnect();
                end;
                v353 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(v352);
            end;
        end;
        v51.viewportResized();
        v25:FireOnResized();
        if v353 then
            v353:disconnect();
        end;
        v353 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(v352);
        workspace.Changed:Connect(v355);
    end;
    local function v363() --[[ Line: 2168 ]] --[[ Name: resizeBottomBarButtons ]]
        -- upvalues: v140 (copy), v61 (ref)
        local l_X_0 = v140.BottomButtonFrame.AbsoluteSize.X;
        local v358 = #v140.BottomBarButtons;
        if v358 == 4 then
            l_X_0 = l_X_0 - 48 - 12;
            v358 = v358 - 1;
        end;
        local v359 = (l_X_0 - (v358 - 1) * 12 - 12) / v358;
        if v61.isInExperienceUIVREnabled then
            v359 = v140.SettingsUIDelegate:getBottomButtonSize(v359);
        end;
        for v360 = 1, #v140.BottomBarButtons do
            local v361 = v140.BottomBarButtons[v360];
            local v362 = v361[1];
            if v362 ~= "MuteButtonButton" then
                v140[v362].Size = UDim2.fromOffset(v359, v140[v361[1]].Size.Y.Offset);
            end;
        end;
    end;
    local function v383() --[[ Line: 2191 ]] --[[ Name: onScreenSizeChanged ]]
        -- upvalues: v140 (copy), v61 (ref), v25 (ref), v51 (ref), v254 (copy), v255 (copy), l_RobloxGui_0 (ref), v11 (ref), l_VRService_0 (ref), l_RunService_0 (ref), v157 (copy), v162 (copy), v154 (copy), v168 (copy), v363 (copy)
        local function _() --[[ Line: 2192 ]] --[[ Name: getBackBarVisible ]]
            -- upvalues: v140 (ref)
            if not v140.BackBarRef:getValue() then
                return false;
            else
                return v140.BackBarRef:getValue().Visible;
            end;
        end;
        local function _() --[[ Line: 2199 ]] --[[ Name: getFrontBarVisible ]]
            -- upvalues: v140 (ref)
            if not v140.FrontBarRef:getValue() then
                return false;
            else
                return v140.FrontBarRef:getValue().Visible;
            end;
        end;
        if v61.FFlagRelocateMobileMenuButtons and v61.FIntRelocateMobileMenuButtonsVariant == 2 and v140.Visible then
            if not v25:IsPortrait() and not v25:IsSmallTouchScreen() or v51.AlwaysShowBottomBar() then
                if not v140.BottomButtonFrameRoot then
                    v254();
                end;
                if v140.PlayersPage then
                    v140.PlayersPage:UnmountMenuButtonsContainer();
                end;
            else
                if v140.BottomButtonFrameRoot then
                    v255();
                end;
                if v140.PlayersPage then
                    v140.PlayersPage:CreateMenuButtonsContainer();
                end;
            end;
        end;
        local v366 = v51.MenuContainerPosition(v140.SettingsUIDelegate);
        local v367 = 600;
        local v368 = nil;
        v368 = if v61.isInExperienceUIVREnabled then v140.SettingsUIDelegate:getFullScreenSize() else l_RobloxGui_0.AbsoluteSize.y;
        local v369 = 0.050000000000000044 * v368;
        local v370 = v25:IsPortrait();
        if v11 then
            v367 = 800;
            v369 = 0.07 * v368;
        elseif v25:IsSmallTouchScreen() then
            v369 = math.min(10, 0.010000000000000009 * v368);
        elseif v61.isInExperienceUIVREnabled and l_VRService_0.VREnabled then
            v369 = 0;
        end;
        if v61.FFlagAddNextUpContainer and v140.Pages.CurrentPage and v140.Pages.CurrentPage.DisableTopPadding and v140.Pages.CurrentPage.MaintainVerticalSize then
            v367 = v367 + v140.HubBar.AbsoluteSize.Y;
        end;
        v140.MenuContainer.Size = v366.Size;
        v140.MenuContainer.Position = v366.Position;
        v140.MenuContainer.AnchorPoint = v366.AnchorPoint;
        local l_Offset_0 = v140.HubBar.Size.Y.Offset;
        local v372 = v369 * 2 + l_Offset_0 * 2;
        local v373 = 0;
        if not v61.FFlagAddTraversalBackButton then
            if not not v140.BackBarRef:getValue() and v140.BackBarRef:getValue().Visible and v140.BackBarRef:getValue() then
                v373 = v140.BackBarRef:getValue().Size.Y.Offset;
            end;
            if v61.EngineFeatureTeleportHistoryButtons and not not v140.FrontBarRef:getValue() and v140.FrontBarRef:getValue().Visible and v140.FrontBarRef:getValue() then
                v373 = v373 + v140.FrontBarRef:getValue().Size.Y.Offset;
            end;
        end;
        if v51.EnableVerticalBottomBar then
            v140.VerticalMenu.Visible = false;
            v140.VerticalMenuDivider.Visible = false;
            for v374 = 1, #v140.BottomBarButtonsComponents do
                v140.BottomBarButtonsComponents[v374].Parent = v140.BottomButtonFrame;
            end;
        end;
        if v370 then
            v140.HubBar.Position = UDim2.new(0.5, 0, 0, 10);
            v140.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 40, 0, 54);
        elseif v11 then
            v140.HubBar.Size = UDim2.new(0, 1200, 0, 100);
        elseif v25:IsSmallTouchScreen() then
            if v51.EnableVerticalBottomBar then
                v140.VerticalMenu.Visible = true;
                v140.VerticalMenuDivider.Visible = true;
                for v375 = 1, #v140.BottomBarButtonsComponents do
                    v140.BottomBarButtonsComponents[v375].Parent = v140.VerticalMenu;
                end;
                v140.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 60 - v51.VerticalMenuWidth, 0, 52);
            else
                v140.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 60, 0, 52);
            end;
        elseif v61.isInExperienceUIVREnabled then
            v140.HubBar.Size = UDim2.new(0, v140.SettingsUIDelegate:getHubBarSize(), 0, 60);
        else
            v140.HubBar.Size = UDim2.new(0, 800, 0, 60);
        end;
        l_Offset_0 = if not v51.AlwaysShowBottomBar() then v140.HubBar.Size.Y.Offset else v140.HubBar.Size.Y.Offset + v140.BottomButtonFrame.Size.Y.Offset;
        v372 = v369 * 2 + ((not v61.FFlagFixDisableTopPaddingError or v140.Pages.CurrentPage ~= nil) and v140.Pages.CurrentPage.DisableTopPadding and 0 or l_Offset_0);
        if not v61.FFlagAddTraversalBackButton then
            v373 = if not not v140.BackBarRef:getValue() and v140.BackBarRef:getValue().Visible and v140.BackBarRef:getValue() then v140.BackBarRef:getValue().Size.Y.Offset else 0;
            if v61.EngineFeatureTeleportHistoryButtons and not not v140.FrontBarRef:getValue() and v140.FrontBarRef:getValue().Visible and v140.FrontBarRef:getValue() then
                v373 = v373 + v140.FrontBarRef:getValue().Size.Y.Offset;
            end;
        end;
        if not v61.FFlagAddNextUpContainer then
            l_RunService_0.Heartbeat:wait();
        end;
        if v157() then
            v162();
            if v61.FFlagIEMFocusNavToButtons then
                v154(v140.Pages.CurrentPage);
            end;
        else
            v168();
        end;
        if v61.isInExperienceUIVREnabled then
            v372 = v372 + v140.SettingsUIDelegate:getMenuContainerExtraSpace();
        end;
        local v376 = v368 - v372 - v373;
        if v61.FFlagRelocateMobileMenuButtons and (v61.FIntRelocateMobileMenuButtonsVariant == 1 or v61.FIntRelocateMobileMenuButtonsVariant == 3) and v25:IsSmallTouchScreen() then
            v376 = v376 - v51.ExtraHubBottomPaddingMobile;
        end;
        local v377 = nil;
        if not v370 then
            if v367 < v376 then
                v377 = v367;
                v140.HubBar.Position = UDim2.new(v140.HubBar.Position.X.Scale, v140.HubBar.Position.X.Offset, 0.5, -v367 / 2 - v140.HubBar.Size.Y.Offset);
                if v140.BottomButtonFrame then
                    v140.BottomButtonFrame.Position = UDim2.new(v140.BottomButtonFrame.Position.X.Scale, v140.BottomButtonFrame.Position.X.Offset, 0.5, v367 / 2);
                end;
            elseif v376 < 150 then
                v377 = 150;
                v140.HubBar.Position = UDim2.new(v140.HubBar.Position.X.Scale, v140.HubBar.Position.X.Offset, 0.5, -75 - v140.HubBar.Size.Y.Offset);
                if v140.BottomButtonFrame then
                    v140.BottomButtonFrame.Position = UDim2.new(v140.BottomButtonFrame.Position.X.Scale, v140.BottomButtonFrame.Position.X.Offset, 0.5, 75);
                end;
            else
                v377 = v376;
                v140.HubBar.Position = UDim2.new(v140.HubBar.Position.X.Scale, v140.HubBar.Position.X.Offset, 0, v369);
                if v140.BottomButtonFrame then
                    v140.BottomButtonFrame.Position = UDim2.new(v140.BottomButtonFrame.Position.X.Scale, v140.BottomButtonFrame.Position.X.Offset, 1, -(v369 + l_Offset_0));
                end;
            end;
        else
            v377 = v376;
        end;
        local v378 = nil;
        v378 = if not v11 then if v25:IsSmallTouchScreen() then if v61.FFlagRelocateMobileMenuButtons and (not (v61.FIntRelocateMobileMenuButtonsVariant ~= 1) or v61.FIntRelocateMobileMenuButtonsVariant == 3) then UDim2.new(0, v140.HubBar.AbsoluteSize.X, 0, v377 + 0 + 0 - v140.BottomButtonFrame.Size.Y.Offset) else UDim2.new(0, v140.HubBar.AbsoluteSize.X, 0, v377 + 0 + 0) else UDim2.new(0, v140.HubBar.AbsoluteSize.X, 0, v377) else UDim2.new(0, v140.HubBar.AbsoluteSize.X, 0, v377);
        if v61.FFlagRelocateMobileMenuButtons and v61.FIntRelocateMobileMenuButtonsVariant ~= 0 and v140.BottomButtonFrame then
            v140.BottomButtonFrame.Size = UDim2.new(0, v140.HubBar.Size.X.Offset, 0, v140.HubBar.Size.Y.Offset);
        end;
        if v61.FFlagAddNextUpContainer and v140.Pages.CurrentPage and v140.Pages.CurrentPage.ShrinkwrapPageViewClipper and not v25:IsSmallTouchScreen() then
            local l_Size_0 = v140.Pages.CurrentPage:GetSize();
            v378 = UDim2.new(v378.X.Scale, v378.X.Offset, v378.Y.Scale, (math.min(l_Size_0.Y - v140.PageView.Size.Y.Offset, v377)));
        end;
        local v380 = v51.HubPadding();
        local v381 = v380.PaddingLeft.Offset + v380.PaddingRight.Offset;
        local v382 = v380.PaddingTop.Offset + v380.PaddingBottom.Offset;
        v140.ReactPage.Size = UDim2.new(0, v140.HubBar.AbsoluteSize.X + v381, 0, v377 + l_Offset_0 + v382);
        v140.PageViewClipper.Size = v378;
        v140.defaultPageViewClipperSize = v378;
        if not v370 then
            v140.PageViewClipper.Position = UDim2.new(v140.PageViewClipper.Position.X.Scale, v140.PageViewClipper.Position.X.Offset, 0.5, -v377 / 2);
        else
            v140.PageViewClipper.Position = UDim2.new(0.5, 0, 0, v140.HubBar.Position.Y.Offset + v140.HubBar.AbsoluteSize.Y);
        end;
        if v140.VerticalMenu then
            v140.VerticalMenuDivider.Size = UDim2.new(0, 1, 0, v377 + v140.HubBar.Size.Y.Offset);
            v140.VerticalMenu.Size = UDim2.new(0, v51.VerticalMenuWidth, 0, v377 + v140.HubBar.Size.Y.Offset);
        end;
        if v51.UseStickyBar() then
            v140.resetPageViewClipperSize = true;
            v140.showStickyBottomBar = true;
            if v140.pageViewScrollChangeCon then
                v140.pageViewScrollChangeCon:disconnect();
                v140.pageViewScrollChangeCon = nil;
            end;
            if not v370 then
                v140.pageViewScrollChangeCon = v140.PageView:GetPropertyChangedSignal("CanvasPosition"):connect(v140.handelPageViewScroll);
            end;
            v363();
        end;
    end;
    local function _() --[[ Line: 2501 ]] --[[ Name: onPreferredTransparencyChanged ]]
        -- upvalues: v140 (copy), v51 (ref), l_GuiService_0 (ref)
        v140.MenuContainer.BackgroundTransparency = v51.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency;
    end;
    local function v388(v385, v386, _) --[[ Line: 2505 ]] --[[ Name: toggleQuickProfilerFromHotkey ]]
        -- upvalues: l_UserInputService_0 (ref), l_GameSettings_0 (ref)
        if not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) and not l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightControl) then
            return;
        else
            if v385 == "Show Quick Profiler" and v386 and v386 == Enum.UserInputState.Begin then
                l_GameSettings_0.PerformanceStatsVisible = not l_GameSettings_0.PerformanceStatsVisible;
            end;
            return;
        end;
    end;
    local function v392(v389, v390, _) --[[ Line: 2521 ]] --[[ Name: toggleDevConsole ]]
        -- upvalues: v83 (ref)
        if v389 == "Open Dev Console" and v390 and v390 == Enum.UserInputState.Begin then
            v83:ToggleVisibility();
        end;
    end;
    local l_v11_0 = v11;
    local v394 = {
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
    l_UserInputService_0.InputBegan:connect(function(v395) --[[ Line: 2547 ]]
        -- upvalues: v394 (copy), l_v11_0 (ref)
        if v395.UserInputType and v394[v395.UserInputType] ~= nil then
            l_v11_0 = v394[v395.UserInputType];
            return;
        else
            if v395.KeyCode and v394[v395.KeyCode] then
                l_v11_0 = v394[v395.KeyCode];
            end;
            return;
        end;
    end);
    l_UserInputService_0.InputChanged:connect(function(v396) --[[ Line: 2554 ]]
        -- upvalues: l_v11_0 (ref)
        if v396.KeyCode == Enum.KeyCode.Thumbstick1 or v396.KeyCode == Enum.KeyCode.Thumbstick2 then
            if v396.Position.magnitude >= 0.25 then
                l_v11_0 = true;
                return;
            end;
        elseif v396.UserInputType == Enum.UserInputType.Touch or v396.UserInputType == Enum.UserInputType.MouseMovement then
            l_v11_0 = false;
        end;
    end);
    local v397 = nil;
    local function v405(v398, v399) --[[ Line: 2566 ]]
        -- upvalues: v61 (ref), v140 (copy), v397 (ref)
        if v61.FFlagInExperienceReportClosingBugfix and not v140.HubBar.Visible then
            return;
        else
            local v400 = v397(v140.Pages.CurrentPage);
            if v400 < 0 then
                return;
            else
                local v401 = v400 + v398;
                if v399 then
                    if #v140.TabHeaders < v401 then
                        v401 = 1;
                    elseif v401 < 1 then
                        v401 = #v140.TabHeaders;
                    end;
                end;
                local v402 = v140.TabHeaders[v401];
                if v402 then
                    for v403, _ in pairs(v140.Pages.PageTable) do
                        if v403:GetTabHeader() == v402 then
                            v140:SwitchToPage(v403, true, v398);
                            return;
                        end;
                    end;
                end;
                return;
            end;
        end;
    end;
    local function v410(_, v407, v408) --[[ Line: 2593 ]]
        -- upvalues: v405 (copy)
        if v407 ~= Enum.UserInputState.Begin then
            return;
        else
            local v409 = 0;
            if v408.KeyCode == Enum.KeyCode.ButtonR1 then
                v409 = 1;
            elseif v408.KeyCode == Enum.KeyCode.ButtonL1 then
                v409 = -1;
            end;
            v405(v409, true);
            return;
        end;
    end;
    local function v413(v411) --[[ Line: 2606 ]]
        -- upvalues: l_UserInputService_0 (ref), v405 (copy)
        if v411.KeyCode == Enum.KeyCode.Tab then
            local v412 = 0;
            v412 = (not not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift)) and -1 or 1;
            v405(v412, true);
        end;
    end;
    local function v418(_, v415, v416) --[[ Line: 2619 ]]
        -- upvalues: v140 (copy)
        if v415 ~= Enum.UserInputState.Begin then
            return;
        else
            local v417 = 0;
            if v416.KeyCode == Enum.KeyCode.PageUp then
                v417 = -100;
            elseif v416.KeyCode == Enum.KeyCode.PageDown then
                v417 = 100;
            end;
            v140:ScrollPixels(v417);
            return;
        end;
    end;
    if v61.isInExperienceUIVREnabled or v61.FFlagEnableSettingsHubUIDelegateRollout then
        v140.SettingsUIDelegate = require(l_RobloxGui_0.Modules.Settings.SettingsUIDelegate).new(v140);
    end;
    v356();
    if v106 then
        v225();
    end;
    v397 = function(v419) --[[ Line: 2643 ]] --[[ Name: GetHeaderPosition ]]
        -- upvalues: v140 (copy)
        local l_v419_TabHeader_0 = v419:GetTabHeader();
        if not l_v419_TabHeader_0 then
            return -1;
        else
            for v421, v422 in pairs(v140.TabHeaders) do
                if v422 == l_v419_TabHeader_0 then
                    return v421;
                end;
            end;
            return -1;
        end;
    end;
    local v423 = nil;
    v423 = function(v424, v425) --[[ Line: 2657 ]]
        -- upvalues: v423 (ref)
        if v425:IsA("GuiObject") then
            v425.ZIndex = v424;
            local l_v425_Children_0 = v425:GetChildren();
            for v427 = 1, #l_v425_Children_0 do
                v423(v424, l_v425_Children_0[v427]);
            end;
        end;
    end;
    local function v432(v428, v429) --[[ Line: 2667 ]] --[[ Name: AddHeader ]]
        -- upvalues: v140 (copy), v423 (ref)
        if not v428 then
            return;
        else
            table.insert(v140.TabHeaders, v428);
            v429.TabPosition = #v140.TabHeaders;
            local v430 = 1 / #v140.TabHeaders;
            for v431 = 1, #v140.TabHeaders do
                v140.TabHeaders[v431].Size = UDim2.new(v430, 0, 1, 0);
            end;
            v423(3, v428);
            v428.Parent = v140.HubBarContainer;
            return;
        end;
    end;
    local function v438(v433) --[[ Line: 2683 ]] --[[ Name: RemoveHeader ]]
        -- upvalues: v140 (copy)
        local v434 = nil;
        for v435 = 1, #v140.TabHeaders do
            if v140.TabHeaders[v435] == v433 then
                v434 = v435;
                table.remove(v140.TabHeaders, v435);
                break;
            end;
        end;
        if v434 then
            for v436 = v434, #v140.TabHeaders do
                local v437 = v140.TabHeaders[v436];
                v437.Position = UDim2.new(v437.Position.X.Scale, v437.Position.X.Offset - v433.AbsoluteSize.X, v437.Position.Y.Scale, v437.Position.Y.Offset);
            end;
        end;
        v433.Parent = nil;
    end;
    v140.AddPage = function(_, v440) --[[ Line: 2706 ]] --[[ Name: AddPage ]]
        -- upvalues: v140 (copy), v432 (copy), v61 (ref), v154 (copy)
        v140.Pages.PageTable[v440] = true;
        v432(v440:GetTabHeader(), v440);
        v440.Page.Position = UDim2.new(v440.TabPosition - 1, 0, 0, 0);
        if v61.FFlagIEMFocusNavToButtons then
            v440.LastSelectableObjectsUpdated:connect(function() --[[ Line: 2711 ]]
                -- upvalues: v154 (ref), v440 (copy)
                v154(v440);
            end);
        end;
    end;
    v140.RemovePage = function(_, v442) --[[ Line: 2717 ]] --[[ Name: RemovePage ]]
        -- upvalues: v140 (copy), v438 (copy), v61 (ref)
        v140.Pages.PageTable[v442] = nil;
        v438(v442:GetTabHeader());
        if v61.FFlagIEMFocusNavToButtons then
            v442.LastSelectableObjectsUpdated:disconnect();
        end;
    end;
    v140.bottomBarAnimating = false;
    v140.defaultPageViewClipperSize = v140.PageViewClipper.Size;
    v140.showStickyBottomBar = true;
    v140.resetPageViewClipperSize = false;
    animateBottomBarComplete = function() --[[ Line: 2730 ]] --[[ Name: animateBottomBarComplete ]]
        -- upvalues: v140 (copy)
        if v140.resetPageViewClipperSize then
            v140.PageViewClipper.Size = v140.defaultPageViewClipperSize;
            v140.resetPageViewClipperSize = false;
        end;
        v140.bottomBarAnimating = false;
    end;
    v140.animateInBottomBar = function(_) --[[ Line: 2739 ]] --[[ Name: animateInBottomBar ]]
        -- upvalues: v140 (copy), l_game_EngineFeature_0 (ref)
        if v140.bottomBarAnimating or v140.showStickyBottomBar == true then
            return;
        else
            v140.bottomBarAnimating = true;
            v140.showStickyBottomBar = true;
            v140.resetPageViewClipperSize = false;
            local v444 = UDim2.new(v140.defaultPageViewClipperSize.X.Scale, v140.defaultPageViewClipperSize.X.Offset, v140.defaultPageViewClipperSize.Y.Scale, v140.defaultPageViewClipperSize.Y.Offset);
            if l_game_EngineFeature_0 then
                v140.PageViewClipper:TweenSizeInternal(v444, Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, 0.3, true, animateBottomBarComplete);
                return;
            else
                v140.PageViewClipper:TweenSize(v444, Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, 0.3, true, animateBottomBarComplete);
                return;
            end;
        end;
    end;
    v140.animateOutBottomBar = function(_) --[[ Line: 2778 ]] --[[ Name: animateOutBottomBar ]]
        -- upvalues: v140 (copy), l_game_EngineFeature_0 (ref)
        if v140.bottomBarAnimating or v140.showStickyBottomBar == false then
            return;
        else
            v140.bottomBarAnimating = true;
            v140.showStickyBottomBar = false;
            v140.resetPageViewClipperSize = false;
            local v446 = UDim2.new(v140.defaultPageViewClipperSize.X.Scale, v140.defaultPageViewClipperSize.X.Offset, v140.defaultPageViewClipperSize.Y.Scale, v140.defaultPageViewClipperSize.Y.Offset + 80);
            if l_game_EngineFeature_0 then
                v140.PageViewClipper:TweenSizeInternal(v446, Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, 0.3, true, animateBottomBarComplete);
                return;
            else
                v140.PageViewClipper:TweenSize(v446, Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, 0.3, true, animateBottomBarComplete);
                return;
            end;
        end;
    end;
    v140.HideBar = function(_) --[[ Line: 2817 ]] --[[ Name: HideBar ]]
        -- upvalues: v140 (copy), v168 (copy)
        v140.HubBar.Visible = false;
        v140.PageViewClipper.Visible = false;
        if v140.BottomButtonFrame then
            v168();
        end;
    end;
    v140.ShowBar = function(_) --[[ Line: 2825 ]] --[[ Name: ShowBar ]]
        -- upvalues: v140 (copy), v157 (copy), v162 (copy), v61 (ref), v154 (copy)
        v140.HubBar.Visible = true;
        v140.PageViewClipper.Visible = true;
        if v140.BottomButtonFrame and v157() then
            v162();
            if v61.FFlagIEMFocusNavToButtons then
                v154(v140.Pages.CurrentPage);
            end;
        end;
    end;
    v140.ScrollPixels = function(_, v450) --[[ Line: 2836 ]] --[[ Name: ScrollPixels ]]
        -- upvalues: v140 (copy)
        local l_Y_1 = v140.PageView.CanvasPosition.Y;
        local v452 = v140.PageView.CanvasSize.Y.Offset - v140.PageViewClipper.AbsoluteSize.y;
        local v453 = math.max(0, (math.min(l_Y_1 + v450, v452)));
        v140.PageView.CanvasPosition = Vector2.new(0, v453);
    end;
    v140.ScrollToFrame = function(_, v455, v456) --[[ Line: 2844 ]] --[[ Name: ScrollToFrame ]]
        -- upvalues: l_v11_0 (ref), v140 (copy), l_Constants_0 (ref)
        if l_v11_0 or v456 then
            local v457 = v455.AbsolutePosition.y - v140.Pages.CurrentPage.Page.AbsolutePosition.y;
            local v458 = v457 + v455.AbsoluteSize.y;
            if v457 < v140.PageView.CanvasPosition.y then
                v140.PageView.CanvasPosition = Vector2.new(0, v457);
                return;
            elseif v140.Pages.CurrentPage.Page.Name == l_Constants_0.PeoplePageKey and v458 - v140.PageView.CanvasPosition.y > v140.PageView.AbsoluteSize.Y - l_Constants_0.PeoplePageScrollBuffer then
                v140.PageView.CanvasPosition = Vector2.new(0, v458 - v140.PageView.AbsoluteSize.Y + l_Constants_0.PeoplePageScrollBuffer);
                return;
            elseif v458 - v140.PageView.CanvasPosition.y > v140.PageViewClipper.Size.Y.Offset then
                v140.PageView.CanvasPosition = Vector2.new(0, v458 - v140.PageViewClipper.Size.Y.Offset);
            end;
        end;
    end;
    v140.GetFirstPageWithTabHeader = function(_) --[[ Line: 2859 ]] --[[ Name: GetFirstPageWithTabHeader ]]
        -- upvalues: v140 (copy)
        local v460 = nil;
        for v461, _ in pairs(v140.Pages.PageTable) do
            if v461:GetTabHeader() ~= nil and v461.TabPosition == 1 then
                v460 = v461;
                break;
            end;
        end;
        if v460 == nil then
            error("No page with tab header found");
            return nil;
        else
            return v460;
        end;
    end;
    v140.InitInPage = function(_, v464) --[[ Line: 2878 ]] --[[ Name: InitInPage ]]
        -- upvalues: v140 (copy), v61 (ref), v25 (ref), v157 (copy), v162 (copy), v154 (copy), v51 (ref), v145 (ref)
        local l_TabPosition_0 = v464.TabPosition;
        for v466, _ in pairs(v140.Pages.PageTable) do
            if v466 ~= v464 then
                v466:Hide(-1, l_TabPosition_0, true, nil, v140.PageViewInnerFrame);
            end;
        end;
        if (not v61.FFlagRelocateMobileMenuButtons or v61.FIntRelocateMobileMenuButtonsVariant == 0 or v61.FIntRelocateMobileMenuButtonsVariant == 2 and v25:IsSmallTouchScreen()) and v140.BottomButtonFrame then
            if v157(v464) then
                v162();
                if v61.FFlagIEMFocusNavToButtons then
                    v154(v464);
                end;
            else
                v140.BottomButtonFrame.Visible = false;
            end;
            v140.HubBar.Visible = (v464 or v140.Pages.CurrentPage).ShouldShowBottomBar == true;
        end;
        local v468 = v464.IsPageClipped == true;
        v140.PageViewClipper.ClipsDescendants = v468;
        v140.PageView.ClipsDescendants = v468;
        if v51.UseStickyBar() == false then
            v140.PageViewInnerFrame.ClipsDescendants = v468;
        end;
        v140.Pages.CurrentPage = v464;
        v140.Pages.CurrentPage.Active = true;
        v140.CurrentPageSignal:fire(v140.Pages.CurrentPage and v140.Pages.CurrentPage.Page.Name or nil);
        if v51.UseStickyBar() == false then
            local l_Size_1 = v140.Pages.CurrentPage:GetSize();
            v140.PageView.CanvasSize = UDim2.new(0, 0, 0, l_Size_1.Y);
            v145 = v140.Pages.CurrentPage.Page.Changed:connect(function(v470) --[[ Line: 2920 ]]
                -- upvalues: v140 (ref)
                if v470 == "AbsoluteSize" then
                    local l_Size_2 = v140.Pages.CurrentPage:GetSize();
                    v140.PageView.CanvasSize = UDim2.new(0, 0, 0, l_Size_2.Y);
                end;
            end);
        end;
    end;
    v140.SwitchToPage = function(_, v473, v474, v475, v476, _, v478) --[[ Line: 2929 ]] --[[ Name: SwitchToPage ]]
        -- upvalues: v140 (copy), v61 (ref), v107 (ref), v25 (ref), v51 (ref), v157 (copy), l_RobloxGui_0 (ref), v145 (ref), v162 (copy), v154 (copy), v383 (copy), v13 (ref), l_IXPServiceWrapper_0 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), v60 (ref), l_ExperienceMenuSessionManagerInstance_0 (ref)
        if v140.Pages.PageTable[v473] == nil then
            return;
        elseif v61.FFlagPreventHiddenSwitchPage and v140:GetVisibility() == false then
            return;
        else
            if v107 then
                if v473.Page.Name == "ReportAbuseMenuNewContainerPage" then
                    v140.PageViewInnerFrame.UIPadding.PaddingTop = UDim.new(0, 0);
                else
                    v140.PageViewInnerFrame.UIPadding.PaddingTop = UDim.new(0, 5);
                end;
            end;
            local v479 = UDim.new(0, 0);
            local v480 = UDim.new(0, 0);
            local v481 = not (v25:IsPortrait() or v25:IsSmallTouchScreen()) or v51.AlwaysShowBottomBar();
            if v61.FFlagRelocateMobileMenuButtons and (v61.FIntRelocateMobileMenuButtonsVariant == 1 or v61.FIntRelocateMobileMenuButtonsVariant == 3 or v61.FIntRelocateMobileMenuButtonsVariant == 2 and not v25:IsSmallTouchScreen()) then
                v481 = true;
            end;
            if v140.HubBar and not ((v473 or v140.Pages.CurrentPage).ShouldShowBottomBar == true) and not v473.DisableTopPadding then
                v479 = UDim.new(0, v140.HubBar.AbsoluteSize.Y);
            end;
            if v140.BottomButtonFrame and v481 and not v157(v473) and (not v61.FFlagAddNextUpContainer or not v473.ShrinkwrapPageViewClipper) then
                v480 = UDim.new(0, v140.BottomButtonFrame.AbsoluteSize.Y);
            end;
            local v482 = v51.HubPadding();
            v140.MenuContainerPadding.PaddingLeft = v482.PaddingLeft;
            v140.MenuContainerPadding.PaddingRight = v482.PaddingRight;
            v140.MenuContainerPadding.PaddingBottom = v482.PaddingBottom + v480;
            v140.MenuContainerPadding.PaddingTop = v482.PaddingTop + v479;
            local v483 = v51.MenuContainerPosition(v140.SettingsUIDelegate);
            v140.MenuContainer.Position = v483.Position;
            v140.MenuContainer.Size = v483.Size;
            v140.MenuContainer.AnchorPoint = v483.AnchorPoint;
            if v140.VerticalMenu and not v25:IsPortrait() and v25:IsSmallTouchScreen() then
                local v484 = (v473 or v140.Pages.CurrentPage).ShouldShowBottomBar == true;
                v140.VerticalMenu.Visible = v484;
                v140.VerticalMenuDivider.Visible = v484;
                if v484 then
                    v140.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 60 - v51.VerticalMenuWidth, 0, 52);
                else
                    v140.HubBar.Size = UDim2.new(0, l_RobloxGui_0.AbsoluteSize.X - 60, 0, 52);
                end;
                local l_Size_3 = v140.PageViewClipper.Size;
                v140.PageViewClipper.Size = UDim2.new(l_Size_3.X.Scale, v140.HubBar.Size.X.Offset, l_Size_3.Y.Scale, l_Size_3.Y.Offset);
            elseif v61.FFlagAddNextUpContainer and v473.ShrinkwrapPageViewClipper then
                local l_Size_4 = v140.PageViewClipper.Size;
                local l_v473_Size_0 = v473:GetSize();
                v140.PageViewClipper.Size = UDim2.new(l_Size_4.X.Scale, v140.HubBar.Size.X.Offset, l_Size_4.Y.Scale, l_v473_Size_0.Y);
            end;
            if v475 == nil and v140.Pages.CurrentPage and v140.Pages.CurrentPage.TabHeader and v473 and v473.TabHeader then
                v475 = v140.Pages.CurrentPage.TabHeader.AbsolutePosition.x < v473.TabHeader.AbsolutePosition.x and 1 or -1;
            end;
            if v475 == nil then
                v475 = 1;
            end;
            if v140.Pages.CurrentPage and v145 ~= nil then
                v145:disconnect();
                v140.Pages.CurrentPage.Active = false;
            end;
            local l_TabPosition_1 = v473.TabPosition;
            for v489, _ in pairs(v140.Pages.PageTable) do
                if v489 ~= v473 then
                    v489:Hide(-v475, l_TabPosition_1, v476, nil, v140.PageViewInnerFrame, v489 == v140.Pages.CurrentPage);
                end;
            end;
            if v140.BottomButtonFrame then
                if v157(v473) then
                    v162();
                    if v61.FFlagIEMFocusNavToButtons then
                        v154(v473);
                    end;
                else
                    v140.BottomButtonFrame.Visible = false;
                end;
                v140.HubBar.Visible = (v473 or v140.Pages.CurrentPage).ShouldShowBottomBar == true;
            end;
            local v491 = v473.IsPageClipped == true;
            v140.PageViewClipper.ClipsDescendants = v491;
            v140.PageView.ClipsDescendants = v491;
            v140.PageViewInnerFrame.ClipsDescendants = v491;
            v140.Pages.CurrentPage = v473;
            v140.Pages.CurrentPage:Display(v140.PageViewInnerFrame, v476);
            v140.Pages.CurrentPage.Active = true;
            v140.CurrentPageSignal:fire(v140.Pages.CurrentPage and v140.Pages.CurrentPage.Page.Name or nil);
            if v51.UseStickyBar() == false then
                local l_Size_5 = v140.Pages.CurrentPage:GetSize();
                v140.PageView.CanvasSize = UDim2.new(0, 0, 0, l_Size_5.Y);
                v145 = v140.Pages.CurrentPage.Page.Changed:connect(function(v493) --[[ Line: 3041 ]]
                    -- upvalues: v140 (ref), v61 (ref), v383 (ref)
                    if v493 == "AbsoluteSize" then
                        local l_Size_6 = v140.Pages.CurrentPage:GetSize();
                        v140.PageView.CanvasSize = UDim2.new(0, 0, 0, l_Size_6.Y);
                        if v61.FFlagAddNextUpContainer and v140.Pages.CurrentPage.ShrinkwrapPageViewClipper then
                            v383();
                        end;
                    end;
                end);
                if v140.MenuStack[#v140.MenuStack] ~= v140.Pages.CurrentPage and not v474 then
                    v140.MenuStack[#v140.MenuStack + 1] = v140.Pages.CurrentPage;
                end;
            end;
            if v61.FFlagAddNextUpContainer then
                v383();
            elseif v473.DisableTopPadding then
                v383();
            end;
            local v495 = {
                universeid = tostring(game.GameId)
            };
            if v61.GetFFlagReportAbuseMenuEntrypointAnalytics() and v478 then
                v495 = v13.Dictionary.join(v495, v478);
            end;
            if v61.FFlagRespawnChromeShortcutTelemetry and v495.used_shortcut == nil then
                v495.used_shortcut = false;
            end;
            if v495.playsessionid == nil then
                v495.playsessionid = v140.playSessionId;
            end;
            if v473 then
                if v61.FFlagHelpPageIXPExposure and v140.HelpPage == v473 and not v140.HelpPageIXPFetched then
                    l_IXPServiceWrapper_0:LogUserLayerExposure(v61.FStringHelpPageIXPLayer);
                    v140.HelpPageIXPFetched = true;
                end;
                if v140.GameSettingsPage == v473 then
                    l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, "open_GameSettings_tab", l_Constants_0.AnalyticsMenuActionName, v495);
                    if v60.FFlagIEMSettingsLogExposureIXPFlags and not v140.GameSettingsPageReorderIXPFetched then
                        l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(v61.GetFStringInExperienceMenuIXPLayer());
                        v140.GameSettingsPageReorderIXPFetched = true;
                    end;
                else
                    l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, "open_" .. v473.Page.Name .. "_tab", l_Constants_0.AnalyticsMenuActionName, v495);
                end;
                l_ExperienceMenuSessionManagerInstance_0:MenuSwitchToPage(v473.Page);
                return;
            else
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, "open_unknown_tab", l_Constants_0.AnalyticsMenuActionName, v495);
                l_ExperienceMenuSessionManagerInstance_0:CloseOpenedMenuTab();
                return;
            end;
        end;
    end;
    v140.SetActive = function(_, v497) --[[ Line: 3107 ]] --[[ Name: SetActive ]]
        -- upvalues: v140 (copy)
        v140.Active = v497;
        if v140.Pages.CurrentPage then
            v140.Pages.CurrentPage.Active = v497;
        end;
    end;
    clearMenuStack = function() --[[ Line: 3115 ]] --[[ Name: clearMenuStack ]]
        -- upvalues: v140 (copy)
        while v140.MenuStack and #v140.MenuStack > 0 do
            v140:PopMenu();
        end;
    end;
    setOverrideMouseIconBehavior = function() --[[ Line: 3121 ]] --[[ Name: setOverrideMouseIconBehavior ]]
        -- upvalues: v140 (copy), l_UserInputService_0 (ref), l_VRService_0 (ref), l_MouseIconOverrideService_0 (ref), v55 (ref)
        if not v140.Visible then
            return;
        elseif l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Gamepad1 or l_VRService_0.VREnabled then
            l_MouseIconOverrideService_0.push(v55, Enum.OverrideMouseIconBehavior.ForceHide);
            return;
        else
            l_MouseIconOverrideService_0.push(v55, Enum.OverrideMouseIconBehavior.ForceShow);
            return;
        end;
    end;
    checkLeaveGameUpsell = function() --[[ Line: 3133 ]] --[[ Name: checkLeaveGameUpsell ]]
        -- upvalues: v61 (ref), v140 (copy), v105 (ref), l_default_0 (ref), v57 (ref)
        if not v61.GetFFlagEnableLeaveGameUpsellEntrypoint() then
            return;
        else
            if not v140.sessionStartTime then
                v140.sessionStartTime = os.time();
            end;
            if not v140.sessionStartTime then
                return;
            elseif not v140.checkedUpsell and v140.leaveGameUpsellProp == v105.PHONE_UPSELL_VALUE_PROP.None then
                v140.checkedUpsell = true;
                v140.leaveGameUpsellProp = l_default_0:FetchPhoneVerificationUpsell(v105.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, v140.sessionStartTime, true);
                v140.LeaveGameUpsellPage:SetUpsellProp(v140.leaveGameUpsellProp);
                task.delay(v57, function() --[[ Line: 3154 ]]
                    -- upvalues: v140 (ref)
                    v140.checkedUpsell = false;
                end);
                return;
            else
                if v140.checkedUpsell then
                    local v498 = l_default_0:FetchPhoneVerificationUpsell(v105.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, v140.sessionStartTime, false);
                    if v140.leaveGameUpsellProp ~= v498 then
                        v140.leaveGameUpsellProp = v498;
                        v140.LeaveGameUpsellPage:SetUpsellProp(v140.leaveGameUpsellProp);
                    end;
                end;
                return;
            end;
        end;
    end;
    local v499 = nil;
    if v61.FFlagSettingsHubIndependentBackgroundVisibility then
        v499 = function(v500, v501) --[[ Line: 3169 ]]
            -- upvalues: v140 (copy), l_InExperienceAppChatModal_0 (ref), l_Constants_0 (ref), v61 (ref), v51 (ref), l_TweenService_0 (ref)
            if not v140.DarkenBackground then
                return;
            elseif not v500 and v140.DarkenBackground.Visible and (l_InExperienceAppChatModal_0:getVisible() or v140.Visible) then
                return;
            else
                local v502 = 1;
                local l_Quart_0 = Enum.EasingStyle.Quart;
                local v504 = 0;
                v504 = if l_Constants_0 then l_Constants_0.ShieldCloseAnimationTweenTime else 0.4;
                if v500 then
                    v502 = if v61.isInExperienceUIVREnabled then v140.SettingsUIDelegate:getDarkBackgroundTheme().Transparency else v51.transparency("DarkenBackground");
                    l_Quart_0 = Enum.EasingStyle.Quad;
                    v504 = if l_Constants_0 then l_Constants_0.ShieldOpenAnimationTweenTime else 0.5;
                end;
                if v501 then
                    if v140.DarkenBackgroundTween then
                        v140.DarkenBackgroundTween:Cancel();
                        v140.DarkenBackgroundTween = nil;
                    end;
                    v140.DarkenBackground.BackgroundTransparency = v502;
                else
                    local v505 = TweenInfo.new(v504, l_Quart_0, Enum.EasingDirection.Out);
                    if v140.DarkenBackgroundTween then
                        v140.DarkenBackgroundTween:Cancel();
                    end;
                    v140.DarkenBackgroundTween = l_TweenService_0:Create(v140.DarkenBackground, v505, {
                        BackgroundTransparency = v502
                    });
                    v140.DarkenBackgroundTween:Play();
                end;
                v140.DarkenBackground.Visible = v500;
                return;
            end;
        end;
    end;
    v238 = function(v506, v507, v508, _, v510) --[[ Line: 3216 ]] --[[ Name: setVisibilityInternal ]]
        -- upvalues: v61 (ref), v140 (copy), v28 (ref), l_RobloxGui_0 (ref), v499 (ref), v383 (copy), v25 (ref), v254 (copy), l_GuiService_0 (ref), v51 (ref), l_ExperienceMenuSessionManagerInstance_0 (ref), l_Constants_0 (ref), l_GameSettings_0 (ref), l_TweenService_0 (ref), l_game_EngineFeature_0 (ref), l_ContextActionService_0 (ref), v410 (copy), v418 (copy), v157 (copy), v162 (copy), v154 (copy), l_UserInputService_0 (ref), v413 (copy), v84 (ref), l_VRService_0 (ref), l_MouseIconOverrideService_0 (ref), v55 (ref), v168 (copy), v121 (ref), l_InExperienceAppChatModal_0 (ref), v85 (ref), v255 (copy), l_SHIELD_INACTIVE_POSITION_0 (ref), l_RbxAnalyticsService_0 (ref)
        local v511 = nil;
        v511 = if v61.isInExperienceUIVREnabled then v507 or not v140.SettingsUIDelegate:isOpenCloseAnimationAllowed() else v507;
        v140.OpenStateChangedCount = v140.OpenStateChangedCount + 1;
        local v512 = v506 ~= v140.Visible;
        v140.Visible = v506;
        if v61.FFlagEnableInGameMenuDurationLogger and v512 and not v506 then
            v28.menuClose();
        end;
        if v140.ResizedConnection then
            v140.ResizedConnection:disconnect();
            v140.ResizedConnection = nil;
        end;
        if v140.BackBarVisibleConnection then
            v140.BackBarVisibleConnection:disconnect();
            v140.BackBarVisibleConnection = nil;
        end;
        if v61.EngineFeatureTeleportHistoryButtons and v140.FrontBarVisibleConnection then
            v140.FrontBarVisibleConnection:disconnect();
            v140.FrontBarVisibleConnection = nil;
        end;
        if v140.PreferredTransparencyChangedConnection then
            v140.PreferredTransparencyChangedConnection:disconnect();
            v140.PreferredTransparencyChangedConnection = nil;
        end;
        v140.Modal.Visible = v140.Visible;
        if v140.TabConnection then
            v140.TabConnection:disconnect();
            v140.TabConnection = nil;
        end;
        local v513 = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
        if v61.FFlagSettingsHubIndependentBackgroundVisibility then
            v499(v140.Visible, v511);
        end;
        if v140.Visible then
            v140.ResizedConnection = l_RobloxGui_0.Changed:connect(function(v514) --[[ Line: 3266 ]]
                -- upvalues: v383 (ref)
                if v514 == "AbsoluteSize" then
                    v383();
                end;
            end);
            if v61.FFlagMenuButtonsMountWithIEM then
                if v61.FFlagRelocateMobileMenuButtons and (v61.FIntRelocateMobileMenuButtonsVariant == 1 or v61.FIntRelocateMobileMenuButtonsVariant == 3 or v61.FIntRelocateMobileMenuButtonsVariant == 2 and not v25:IsSmallTouchScreen()) then
                    v254();
                end;
                if v61.FFlagRelocateMobileMenuButtons and v61.FIntRelocateMobileMenuButtonsVariant == 2 and v25:IsSmallTouchScreen() and v140.PlayersPage then
                    v140.PlayersPage:CreateMenuButtonsContainer();
                end;
            end;
            if not v61.FFlagAddTraversalBackButton then
                if v140.BackBarRef:getValue() then
                    v140.BackBarVisibleConnection = v140.BackBarRef:getValue():GetPropertyChangedSignal("Visible"):connect(function() --[[ Line: 3286 ]]
                        -- upvalues: v383 (ref)
                        v383();
                    end);
                end;
                if v61.EngineFeatureTeleportHistoryButtons and v140.FrontBarRef:getValue() then
                    v140.FrontBarVisibleConnection = v140.FrontBarRef:getValue():GetPropertyChangedSignal("Visible"):connect(function() --[[ Line: 3291 ]]
                        -- upvalues: v383 (ref)
                        v383();
                    end);
                end;
            end;
            v383();
            v140.PreferredTransparencyChangedConnection = l_GuiService_0:GetPropertyChangedSignal("PreferredTransparency"):connect(function() --[[ Line: 3298 ]]
                -- upvalues: v140 (ref), v51 (ref), l_GuiService_0 (ref)
                v140.MenuContainer.BackgroundTransparency = v51.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency;
            end);
            v140.MenuContainer.BackgroundTransparency = v51.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency;
            v140.SettingsShowSignal:fire(v140.Visible);
            l_GuiService_0:SetMenuIsOpen(true, "SettingsHub");
            l_ExperienceMenuSessionManagerInstance_0:OpenExperienceMenu();
            v140.Shield.Visible = v140.Visible;
            l_GuiService_0:CloseInspectMenu();
            if v511 or not v140.Shield:IsDescendantOf(game) then
                v140.Shield.Position = UDim2.new(0, 0, 0, 0);
                if not v61.FFlagSettingsHubIndependentBackgroundVisibility and v140.DarkenBackground then
                    if v140.DarkenBackgroundTween then
                        v140.DarkenBackgroundTween:Cancel();
                        v140.DarkenBackgroundTween = nil;
                    end;
                    v140.DarkenBackground.BackgroundTransparency = v51.transparency("DarkenBackground");
                end;
            else
                local v515 = if l_Constants_0 then l_Constants_0.ShieldOpenAnimationTweenTime else 0.5;
                if l_GameSettings_0.ReducedMotion then
                    if v140.ReducedMotionOpenTween then
                        v140.ReducedMotionOpenTween:Cancel();
                        v140.ReducedMotionOpenTween = nil;
                    end;
                    if v140.ReducedMotionCloseTween then
                        v140.ReducedMotionCloseTween:Cancel();
                        v140.ReducedMotionCloseTween = nil;
                    end;
                    v140.Shield.Parent = v140.CanvasGroup;
                    v140.CanvasGroup.GroupTransparency = 1;
                    v140.CanvasGroup.Visible = true;
                    v140.Shield.Position = UDim2.new(0, 0, 0, 0);
                    local v516 = TweenInfo.new(0.25);
                    local v517 = {
                        GroupTransparency = 0
                    };
                    v140.ReducedMotionOpenTween = l_TweenService_0:Create(v140.CanvasGroup, v516, v517);
                    v140.ReducedMotionOpenTween:Play();
                    v140.ReducedMotionOpenTween.Completed:Connect(function(v518) --[[ Line: 3347 ]]
                        -- upvalues: v140 (ref)
                        if v518 == Enum.PlaybackState.Completed then
                            v140.Shield.Parent = v140.ClippingShield;
                            v140.ReducedMotionOpenTween = nil;
                        end;
                        v140.CanvasGroup.Visible = false;
                    end);
                    if v61.FFlagEnableInGameMenuDurationLogger then
                        v28.menuOpenComplete();
                    end;
                elseif l_game_EngineFeature_0 then
                    v140.Shield:TweenPositionInternal(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, v515, true, function() --[[ Line: 3367 ]]
                        -- upvalues: v61 (ref), v28 (ref)
                        if v61.FFlagEnableInGameMenuDurationLogger then
                            v28.menuOpenComplete();
                        end;
                    end);
                else
                    v140.Shield:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, v515, true, function() --[[ Line: 3380 ]]
                        -- upvalues: v61 (ref), v28 (ref)
                        if v61.FFlagEnableInGameMenuDurationLogger then
                            v28.menuOpenComplete();
                        end;
                    end);
                end;
                if not v61.FFlagSettingsHubIndependentBackgroundVisibility and v140.DarkenBackground then
                    local v519 = TweenInfo.new(v515, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                    if v140.DarkenBackgroundTween then
                        v140.DarkenBackgroundTween:Cancel();
                    end;
                    v140.DarkenBackgroundTween = l_TweenService_0:Create(v140.DarkenBackground, v519, {
                        BackgroundTransparency = v51.transparency("DarkenBackground")
                    });
                    v140.DarkenBackgroundTween:Play();
                end;
            end;
            local function v520() --[[ Line: 3405 ]]

            end;
            if v61.isInExperienceUIVREnabled then
                v520 = function(v521, v522, v523) --[[ Line: 3407 ]]
                    -- upvalues: v140 (ref)
                    if v140.SettingsUIDelegate:isInputEventNeededBySettings(v521, v522, v523) then
                        return Enum.ContextActionResult.Pass;
                    else
                        return nil;
                    end;
                end;
            end;
            l_ContextActionService_0:BindCoreAction("RbxSettingsHubStopCharacter", v520, false, Enum.PlayerActions.CharacterForward, Enum.PlayerActions.CharacterBackward, Enum.PlayerActions.CharacterLeft, Enum.PlayerActions.CharacterRight, Enum.PlayerActions.CharacterJump, Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift, Enum.KeyCode.Tab, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4);
            l_ContextActionService_0:BindCoreAction("RbxSettingsHubSwitchTab", v410, false, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL1);
            l_ContextActionService_0:BindCoreAction("RbxSettingsScrollHotkey", v418, false, Enum.KeyCode.PageUp, Enum.KeyCode.PageDown);
            if v157() then
                v162();
                if v61.FFlagIEMFocusNavToButtons then
                    v154(v140.Pages.CurrentPage);
                end;
            end;
            if v61.ChromeEnabled and v61.FFlagEnableConsoleExpControls then
                require(l_RobloxGui_0.Modules.Chrome.Service):setShortcutBar(require(l_RobloxGui_0.Modules.Chrome.ChromeShared.Unibar.Constants).TILTMENU_SHORTCUTBAR_ID);
            end;
            v140.TabConnection = l_UserInputService_0.InputBegan:connect(v413);
            setOverrideMouseIconBehavior();
            v84 = l_UserInputService_0.LastInputTypeChanged:connect(setOverrideMouseIconBehavior);
            if l_UserInputService_0.MouseEnabled and not l_VRService_0.VREnabled then
                l_MouseIconOverrideService_0.push(v55, Enum.OverrideMouseIconBehavior.ForceShow);
            end;
            v140:CloseReactPage();
            if v508 then
                v168();
                v140:SwitchToPage(v508, nil, 1, true);
            else
                v140:SwitchToPage(v140:GetFirstPageWithTabHeader(), nil, 1, true);
            end;
            if not v61.isInExperienceUIVREnabled or v61.InExperienceUIVRIXP:isMovePanelToCenter() and true or not l_VRService_0.VREnabled then
                if v61.FFlagAddNewPlayerListMobileFocusNav then
                    if v513:GetIsModal() then
                        v513:SetVisibility(false);
                    else
                        v513:HideTemp("SettingsMenu", true);
                    end;
                else
                    v513:HideTemp("SettingsMenu", true);
                end;
                if not v61.isInExperienceUIVREnabled or not v61.InExperienceUIVRIXP:isMovePanelToCenter() or not v61.FFlagSpatialUIFixMenuPanelChatExclusive or not l_VRService_0.VREnabled then
                    v121:HideTemp("SettingsMenu", true);
                end;
                local v524 = require(l_RobloxGui_0.Modules.BackpackScript);
                if v524.IsOpen then
                    v524:OpenClose();
                end;
            end;
            if v61.GetFFlagEnableAppChatInExperience() and l_InExperienceAppChatModal_0:getVisible() then
                v85 = true;
                l_InExperienceAppChatModal_0.default:setVisible(false);
            end;
            if not v61.isInExperienceUIVREnabled then
                local v525 = require(l_RobloxGui_0.Modules.BackpackScript);
                if v525.IsOpen then
                    v525:OpenClose();
                end;
            end;
            v140.GameSettingsPage:OpenSettingsPage();
        else
            v140.CurrentPageSignal:fire("");
            if v61.FFlagMenuButtonsMountWithIEM and v61.FFlagRelocateMobileMenuButtons then
                if v61.FIntRelocateMobileMenuButtonsVariant ~= 0 then
                    v255();
                end;
                if v61.FIntRelocateMobileMenuButtonsVariant == 2 and v140.PlayersPage then
                    v140.PlayersPage:UnmountMenuButtonsContainer();
                end;
            end;
            if v61.ChromeEnabled and v61.FFlagEnableConsoleExpControls then
                local v526 = require(l_RobloxGui_0.Modules.Chrome.Service);
                if v61.FFlagSetUnibarShortcutOnTopBarFocus then
                    v526:setShortcutBar(nil);
                else
                    v526:setShortcutBar(require(l_RobloxGui_0.Modules.Chrome.ChromeShared.Unibar.Constants).UNIBAR_SHORTCUTBAR_ID);
                end;
            end;
            if v61.GetFFlagEnableAppChatInExperience() and v85 then
                v85 = false;
            end;
            if v61.isInExperienceUIVREnabled and v61.InExperienceUIVRIXP:isMovePanelToCenter() then
                v513:HideTemp("SettingsMenu", false);
                if not v61.FFlagSpatialUIFixMenuPanelChatExclusive or not l_VRService_0.VREnabled then
                    v121:HideTemp("SettingsMenu", false);
                end;
            end;
            if v511 then
                v140.Shield.Position = l_SHIELD_INACTIVE_POSITION_0;
                v140.Shield.Visible = v140.Visible;
                v140.SettingsShowSignal:fire(v140.Visible);
                l_GuiService_0:SetMenuIsOpen(false, "SettingsHub");
                l_ExperienceMenuSessionManagerInstance_0:CloseExperienceMenu();
                if v61.FFlagEnableInGameMenuDurationLogger then
                    v28.menuCloseComplete();
                end;
                if not v61.FFlagSettingsHubIndependentBackgroundVisibility and v140.DarkenBackground then
                    if v140.DarkenBackgroundTween then
                        v140.DarkenBackgroundTween:Cancel();
                        v140.DarkenBackgroundTween = nil;
                    end;
                    v140.DarkenBackground.BackgroundTransparency = 1;
                end;
            else
                local v527 = if l_Constants_0 then l_Constants_0.ShieldCloseAnimationTweenTime else 0.4;
                local function v528() --[[ Line: 3559 ]] --[[ Name: handleShieldClose ]]
                    -- upvalues: v61 (ref), v140 (ref), l_GuiService_0 (ref), l_ExperienceMenuSessionManagerInstance_0 (ref), v28 (ref)
                    if not v61.FFlagAddTraversalBackButton then
                        v140.SettingsShowSignal:fire(v140.Visible);
                    end;
                    if not v140.Visible then
                        l_GuiService_0:SetMenuIsOpen(false, "SettingsHub");
                        l_ExperienceMenuSessionManagerInstance_0:CloseExperienceMenu();
                    end;
                    if v61.FFlagEnableInGameMenuDurationLogger then
                        v28.menuCloseComplete();
                    end;
                end;
                if v61.FFlagAddTraversalBackButton then
                    v140.SettingsShowSignal:fire(v140.Visible);
                end;
                if l_GameSettings_0.ReducedMotion then
                    if v140.ReducedMotionOpenTween then
                        v140.ReducedMotionOpenTween:Cancel();
                        v140.ReducedMotionOpenTween = nil;
                    end;
                    if v140.ReducedMotionCloseTween then
                        v140.ReducedMotionCloseTween:Cancel();
                        v140.ReducedMotionCloseTween = nil;
                    end;
                    v140.Shield.Parent = v140.CanvasGroup;
                    v140.CanvasGroup.Visible = true;
                    local v529 = TweenInfo.new(0.25);
                    local v530 = {
                        GroupTransparency = 1
                    };
                    v140.ReducedMotionCloseTween = l_TweenService_0:Create(v140.CanvasGroup, v529, v530);
                    v140.ReducedMotionCloseTween:Play();
                    v140.ReducedMotionCloseTween.Completed:Connect(function(v531) --[[ Line: 3595 ]]
                        -- upvalues: v140 (ref), l_SHIELD_INACTIVE_POSITION_0 (ref)
                        if v531 == Enum.PlaybackState.Completed then
                            v140.Shield.Position = l_SHIELD_INACTIVE_POSITION_0;
                            v140.Shield.Visible = v140.Visible;
                            v140.Shield.Parent = v140.ClippingShield;
                            v140.ReducedMotionCloseTween = nil;
                        end;
                        v140.CanvasGroup.Visible = false;
                    end);
                    v528();
                else
                    if v61.ChromeEnabled and v61.FFlagEnableConsoleExpControls then
                        local v532 = require(l_RobloxGui_0.Modules.Chrome.Service);
                        if v61.FFlagSetUnibarShortcutOnTopBarFocus then
                            v532:setShortcutBar(nil);
                        else
                            v532:setShortcutBar(require(l_RobloxGui_0.Modules.Chrome.ChromeShared.Unibar.Constants).UNIBAR_SHORTCUTBAR_ID);
                        end;
                    end;
                    if l_game_EngineFeature_0 then
                        v140.Shield:TweenPositionInternal(l_SHIELD_INACTIVE_POSITION_0, Enum.EasingDirection.In, Enum.EasingStyle.Quad, v527, true, function() --[[ Line: 3624 ]]
                            -- upvalues: v140 (ref), v528 (copy)
                            v140.Shield.Visible = v140.Visible;
                            v528();
                        end);
                    else
                        v140.Shield:TweenPosition(l_SHIELD_INACTIVE_POSITION_0, Enum.EasingDirection.In, Enum.EasingStyle.Quad, v527, true, function() --[[ Line: 3636 ]]
                            -- upvalues: v140 (ref), v528 (copy)
                            v140.Shield.Visible = v140.Visible;
                            v528();
                        end);
                    end;
                end;
                if not v61.FFlagSettingsHubIndependentBackgroundVisibility and v140.DarkenBackground then
                    local v533 = TweenInfo.new(v527, Enum.EasingStyle.Quart, Enum.EasingDirection.Out);
                    if v140.DarkenBackgroundTween then
                        v140.DarkenBackgroundTween:Cancel();
                    end;
                    v140.DarkenBackgroundTween = l_TweenService_0:Create(v140.DarkenBackground, v533, {
                        BackgroundTransparency = 1
                    });
                    v140.DarkenBackgroundTween:Play();
                end;
            end;
            if v84 then
                v84:disconnect();
            end;
            if v51.UseStickyBar() and v140.pageViewScrollChangeCon then
                v140.pageViewScrollChangeCon:disconnect();
                v140.pageViewScrollChangeCon = nil;
            end;
            if v61.isInExperienceUIVREnabled then
                if not v61.InExperienceUIVRIXP:isMovePanelToCenter() and not l_VRService_0.VREnabled then
                    v513:HideTemp("SettingsMenu", false);
                    v121:HideTemp("SettingsMenu", false);
                end;
            else
                v513:HideTemp("SettingsMenu", false);
                v121:HideTemp("SettingsMenu", false);
            end;
            if not l_VRService_0.VREnabled then
                l_MouseIconOverrideService_0.pop(v55);
            end;
            v140:CloseReactPage();
            clearMenuStack();
            l_ContextActionService_0:UnbindCoreAction("RbxSettingsHubSwitchTab");
            l_ContextActionService_0:UnbindCoreAction("RbxSettingsHubStopCharacter");
            l_ContextActionService_0:UnbindCoreAction("RbxSettingsScrollHotkey");
            v168(0.4);
            l_GuiService_0.SelectedCoreObject = nil;
            v140.GameSettingsPage:CloseSettingsPage();
            if v140.ShareGamePage then
                v140.ShareGamePage:ClearShareInviteLink(v140.ShareGameApp);
            end;
        end;
        local v534 = {
            source = v510, 
            playsessionid = v140.playSessionId, 
            universeid = tostring(game.GameId)
        };
        if v512 then
            if v506 then
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsMenuOpenName, l_Constants_0.AnalyticsMenuActionName, v534);
                if v61.GetFFlagEnableLeaveGameUpsellEntrypoint() then
                    task.spawn(checkLeaveGameUpsell);
                    return;
                end;
            else
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsMenuCloseName, l_Constants_0.AnalyticsMenuActionName, v534);
            end;
        end;
    end;
    v140.SetVisibility = function(_, v536, v537, v538, v539, v540) --[[ Line: 3724 ]] --[[ Name: SetVisibility ]]
        -- upvalues: v140 (copy), v238 (ref)
        if v140.Visible == v536 then
            return;
        else
            v238(v536, v537, v538, v539, v540);
            return;
        end;
    end;
    v140.SetBackgroundVisibility = function(_, v542, v543) --[[ Line: 3730 ]] --[[ Name: SetBackgroundVisibility ]]
        -- upvalues: v140 (copy), v499 (ref)
        if v140.DarkenBackground.Visible == v542 then
            return;
        else
            v499(v542, v543);
            return;
        end;
    end;
    v140.GetVisibility = function(_) --[[ Line: 3736 ]] --[[ Name: GetVisibility ]]
        -- upvalues: v140 (copy)
        return v140.Visible;
    end;
    v140.ToggleVisibility = function(_, v546, v547) --[[ Line: 3740 ]] --[[ Name: ToggleVisibility ]]
        -- upvalues: v238 (ref), v140 (copy)
        v238(not v140.Visible, nil, nil, v546, v547);
    end;
    v140.AddToMenuStack = function(_, v549) --[[ Line: 3744 ]] --[[ Name: AddToMenuStack ]]
        -- upvalues: v140 (copy)
        if v140.MenuStack[#v140.MenuStack] ~= v549 then
            v140.MenuStack[#v140.MenuStack + 1] = v549;
        end;
    end;
    v140.InviteToGame = function(_) --[[ Line: 3750 ]] --[[ Name: InviteToGame ]]
        -- upvalues: v61 (ref), l_IXPServiceWrapper_0 (ref), v99 (ref), v76 (ref), l_UserInputService_0 (ref), v75 (ref), v140 (copy), v98 (ref), v100 (ref), l_RobloxGui_0 (ref)
        local v551 = false;
        if v61.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification() and v61.FFlagLuaEnableGameInviteModalSettingsHub then
            local v552 = v61.GetFStringGameInviteMenuLayer();
            local l_l_IXPServiceWrapper_0_LayerData_0 = l_IXPServiceWrapper_0:GetLayerData(v552);
            l_IXPServiceWrapper_0:LogUserLayerExposure(v552);
            v551 = if l_l_IXPServiceWrapper_0_LayerData_0 then l_l_IXPServiceWrapper_0_LayerData_0.inExperienceGameInviteUXRefresh2023 == v99.UxRefresh or l_l_IXPServiceWrapper_0_LayerData_0.inExperienceGameInviteUXRefresh2023 == v99.InviteLimit else false;
        end;
        if game:GetEngineFeature("PlatformFriendsService") and v76 and v76:IsInviteFriendsEnabled() then
            v76:ShowInviteFriendsUI();
            return;
        else
            if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
                if v75 then
                    v75:PopupGameInviteUI();
                    return;
                end;
            elseif v551 then
                v140:ToggleVisibility();
                v98:openModal({
                    trigger = v100.Triggers.GameMenu
                });
                if v61.FFlagEnableConsoleExpControls and v61.ChromeEnabled then
                    require(l_RobloxGui_0.Modules.Chrome.Service):setShortcutBar(nil);
                    return;
                end;
            else
                v140:AddToMenuStack(v140.Pages.CurrentPage);
                v140:SwitchToPage(v140.ShareGamePage, nil, 1, true);
            end;
            return;
        end;
    end;
    v140.PopMenu = function(_, _, v556, v557) --[[ Line: 3781 ]] --[[ Name: PopMenu ]]
        -- upvalues: v140 (copy), l_BindableEvent_0 (copy), v61 (ref), l_RobloxGui_0 (ref)
        if v140.MenuStack and #v140.MenuStack > 0 then
            local v558 = v140.MenuStack[#v140.MenuStack];
            if type(v558) ~= "table" then
                l_BindableEvent_0:Fire(v558);
            end;
            table.remove(v140.MenuStack, #v140.MenuStack);
            v140:SwitchToPage(v140.MenuStack[#v140.MenuStack], true, 1, v556);
            if #v140.MenuStack == 0 then
                if v61.FFlagAddUILessMode then
                    v140:SetVisibility(false, nil, nil, nil, v557);
                else
                    v140:SetVisibility(false);
                end;
                v140.Pages.CurrentPage:Hide(0, 0, nil, nil, v140.PageViewInnerFrame);
                return;
            elseif v61.ChromeEnabled and v61.FFlagEnableConsoleExpControls then
                require(l_RobloxGui_0.Modules.Chrome.Service):setShortcutBar(require(l_RobloxGui_0.Modules.Chrome.ChromeShared.Unibar.Constants).TILTMENU_SHORTCUTBAR_ID);
                return;
            end;
        else
            v140.MenuStack = {};
            l_BindableEvent_0:Fire();
            if v61.FFlagAddUILessMode then
                v140:ToggleVisibility(nil, v557);
                return;
            else
                v140:ToggleVisibility(v557);
            end;
        end;
    end;
    v140.ShowShield = function(_) --[[ Line: 3815 ]] --[[ Name: ShowShield ]]
        -- upvalues: l_UserInputService_0 (ref), v53 (ref), v140 (copy)
        local v560 = 0;
        v560 = l_UserInputService_0.VREnabled and 1 or v53;
        v140.Shield.BackgroundTransparency = v560;
    end;
    v140.HideShield = function(_) --[[ Line: 3825 ]] --[[ Name: HideShield ]]
        -- upvalues: v140 (copy)
        v140.Shield.BackgroundTransparency = 1;
    end;
    v140.ShowReactPage = function(_) --[[ Line: 3829 ]] --[[ Name: ShowReactPage ]]
        -- upvalues: v140 (copy)
        if v140.reactPage then
            v140.reactPageAnalytics:openPage(v140.reactPage.name);
        end;
        v140.ReactPage.Visible = true;
        v140.Page.Visible = false;
    end;
    v140.HideReactPage = function(_) --[[ Line: 3838 ]] --[[ Name: HideReactPage ]]
        -- upvalues: v140 (copy), v61 (ref)
        if v140.reactPage then
            v140.reactPageAnalytics:closePage(v140.reactPage.name);
        end;
        local v564 = nil;
        if v61.FFlagFixFocusNavToButtonsWithIEMReact then
            v564 = v140.ReactPage.Visible;
        end;
        v140.ReactPage.Visible = false;
        v140.Page.Visible = true;
        if v61.FFlagCreateInExperienceMenuReact and v61.FFlagIEMFocusNavToButtons and v140.Pages.CurrentPage and (not v61.FFlagFixFocusNavToButtonsWithIEMReact or v564 and v140.Visible) then
            v140.Pages.CurrentPage:SelectARow(true);
        end;
    end;
    v140.MountReactPage = function(_) --[[ Line: 3855 ]] --[[ Name: MountReactPage ]]
        -- upvalues: v61 (ref), v23 (ref), v140 (copy), v16 (ref)
        if v61.FFlagCreateInExperienceMenuReact then
            v23(false).setCurrentReactPage(nil);
        end;
        if v140.reactPageRoot then
            v140:UnmountReactPage();
        end;
        v140.reactPageRoot = v16.createRoot(v140.ReactPage);
    end;
    v140.UnmountReactPage = function(_) --[[ Line: 3865 ]] --[[ Name: UnmountReactPage ]]
        -- upvalues: v140 (copy)
        if v140.reactPageRoot then
            v140.reactPageRoot:unmount();
            v140.reactPageRoot = nil;
        end;
    end;
    v140.CloseReactPage = function(_) --[[ Line: 3872 ]] --[[ Name: CloseReactPage ]]
        -- upvalues: v140 (copy)
        v140:HideReactPage();
        v140:UnmountReactPage();
    end;
    v140.SwitchToReactPage = function(_, v569, v570, v571) --[[ Line: 3877 ]] --[[ Name: SwitchToReactPage ]]
        -- upvalues: v61 (ref), v140 (copy)
        if v61.FFlagCreateInExperienceMenuReact and v571 then
            v140:UnmountReactPage();
        elseif v569 then
            v140.reactPage = v569;
            if not v140.reactPageRoot then
                v140:MountReactPage();
            end;
            v140.reactPageRoot:render(v569:createPage(v570));
        end;
        v140:ShowReactPage();
    end;
    v140.GameSettingsPageReorderIXPFetched = false;
    local v572 = nil;
    local v573 = nil;
    local function v579() --[[ Line: 3895 ]] --[[ Name: enableVR ]]
        -- upvalues: l_CorePackages_0 (ref), v140 (copy), v572 (ref)
        local l_VRHub_1 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRHub;
        local l_Panel3D_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).Panel3D;
        local v576 = l_Panel3D_0.Get("SettingsMenu");
        v576:ResizeStuds(4, 4, 250);
        v576:SetType(l_Panel3D_0.Type.Standard);
        v576:SetVisible(false);
        v576:SetCanFade(false);
        v140.ClippingShield.Parent = v576:GetGUI();
        v140.Shield.Parent.ClipsDescendants = false;
        v140.VRShield.Visible = true;
        v140:HideShield();
        v572 = v140.SettingsShowSignal:connect(function(v577) --[[ Line: 3909 ]]
            -- upvalues: v576 (copy), l_VRHub_1 (copy)
            if v577 then
                v576:SetVisible(true);
                l_VRHub_1:FireModuleOpened("SettingsMenu");
                return;
            else
                v576:SetVisible(false);
                l_VRHub_1:FireModuleClosed("SettingsMenu");
                return;
            end;
        end);
        l_VRHub_1.ModuleOpened.Event:connect(function(v578) --[[ Line: 3921 ]]
            -- upvalues: v140 (ref)
            if v578 ~= "SettingsMenu" then
                v140:SetVisibility(false);
            end;
        end);
    end;
    local function v580() --[[ Line: 3927 ]] --[[ Name: disableVR ]]
        -- upvalues: v140 (copy), l_RobloxGui_0 (ref), v572 (ref), v573 (ref), l_CorePackages_0 (ref)
        v140.ClippingShield.Parent = l_RobloxGui_0;
        v140.Shield.Parent.ClipsDescendants = true;
        v140.VRShield.Visible = false;
        v140:ShowShield();
        if v572 then
            v572:disconnect();
            v572 = nil;
        end;
        if v573 then
            v573:disconnect();
            v573 = nil;
        end;
        require(l_CorePackages_0.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetVisible(false);
    end;
    local function _() --[[ Line: 3947 ]] --[[ Name: refreshForSpatialUI ]]
        -- upvalues: v383 (copy), v140 (copy), v51 (ref), l_GuiService_0 (ref), v363 (copy)
        v383();
        v140.MenuContainer.BackgroundTransparency = v51.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency;
        v363();
    end;
    local function v583(v582) --[[ Line: 3953 ]] --[[ Name: OnVREnabled ]]
        -- upvalues: l_UserInputService_0 (ref), v61 (ref), v140 (copy), v383 (copy), v51 (ref), l_GuiService_0 (ref), v363 (copy), v579 (copy), v580 (copy)
        if v582 == "VREnabled" then
            if l_UserInputService_0.VREnabled then
                if v61.isInExperienceUIVREnabled then
                    v140.SettingsUIDelegate:enableVR();
                    v383();
                    v140.MenuContainer.BackgroundTransparency = v51.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency;
                    v363();
                    return;
                else
                    v579();
                    return;
                end;
            elseif v61.isInExperienceUIVREnabled then
                v140.SettingsUIDelegate:disableVR();
                v383();
                v140.MenuContainer.BackgroundTransparency = v51.transparency("MenuContainer", 1) * l_GuiService_0.PreferredTransparency;
                v363();
                return;
            else
                v580();
            end;
        end;
    end;
    l_UserInputService_0.Changed:connect(v583);
    v583("VREnabled");
    v140.ResetCharacterPage:SetHub(v140);
    if l_InExperienceCapabilities_0.canNavigateHome then
        v140.LeaveGamePage:SetHub(v140);
    end;
    if v61.GetFFlagEnableLeaveGameUpsellEntrypoint() then
        v140.LeaveGameUpsellPage:SetHub(v140);
    end;
    v140.GameSettingsPage = require(l_RobloxGui_0.Modules.Settings.Pages.GameSettingsWrapper);
    v140.GameSettingsPage:SetHub(v140);
    v140.ReportAbusePage = require(l_RobloxGui_0.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage);
    v140.ReportAbusePage:SetHub(v140);
    if v61.GetFFlagAbuseReportEnableReportSentPage() then
        v140.ReportSentPage = require(l_RobloxGui_0.Modules.Settings.Pages.ReportSentPage);
        v140.ReportSentPage:SetHub(v140);
    end;
    v140.ReportSentPageV2 = require(l_RobloxGui_0.Modules.Settings.Pages.ReportSentPageV2);
    v140.ReportSentPageV2:SetHub(v140);
    v140.HelpPage = require(l_RobloxGui_0.Modules.Settings.Pages.HelpWrapper);
    v140.HelpPage:SetHub(v140);
    if v61.FFlagHelpPageIXPExposure then
        v140.HelpPageIXPFetched = false;
    end;
    if not v61.FFlagRemoveRecordPage then
        local v584 = not v27:IsSubjectToChinaPolicies();
        if l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows and v584 then
            v140.RecordPage = require(l_RobloxGui_0.Modules.Settings.Pages.Record);
            v140.RecordPage:SetHub(v140);
        end;
    end;
    if l_InExperienceCapabilities_0.canListPeopleInSameServer then
        v140.PlayersPage = require(l_RobloxGui_0.Modules.Settings.Pages.PeopleWrapper);
        v140.PlayersPage:SetHub(v140);
        if not v61.FFlagMenuButtonsMountWithIEM and v61.FFlagRelocateMobileMenuButtons and v61.FIntRelocateMobileMenuButtonsVariant == 2 and v25:IsSmallTouchScreen() then
            v140.PlayersPage:CreateMenuButtonsContainer();
        end;
    end;
    if v61.FFlagAddIEMProfilePage then
        v140.PlayerProfilePage = require(l_RobloxGui_0.Modules.Settings.Pages.PlayerProfile);
    end;
    if l_isSubjectToDesktopPolicies_0() then
        v140.ExitModalPage = require(l_RobloxGui_0.Modules.Settings.Pages.ExitModal);
        v140.ExitModalPage:SetHub(v140);
    end;
    if l_isSubjectToDesktopPolicies_0() and l_InExperienceCapabilities_0.canNavigateHome then
        v140.LeaveGameToHomePage = require(l_RobloxGui_0.Modules.Settings.Pages.LeaveGameToHome);
        v140.LeaveGameToHomePage:SetHub(v140);
    end;
    if not v11 and v130({
        "Roact", 
        "Rodux", 
        "RoactRodux"
    }) then
        local l_CorePackages_2 = game:GetService("CorePackages");
        local l_EventStream_0 = require(l_CorePackages_2.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
        local l_Diag_0 = require(l_CorePackages_2.Workspace.Packages.Analytics).AnalyticsReporters.Diag;
        local v588 = l_EventStream_0.new(l_RbxAnalyticsService_0);
        local v589 = l_GameInviteAnalytics_0.new():withEventStream(v588):withDiag(l_Diag_0.new(l_RbxAnalyticsService_0)):withButtonName(l_GameInviteAnalytics_0.ButtonName.SettingsHub);
        v140.ShareGameApp = require(l_RobloxGui_0.Modules.Settings.ShareGameMaster).createApp(v140.PageViewClipper, v589);
        v140.ShareGamePage = require(l_RobloxGui_0.Modules.Settings.Pages.ShareGamePlaceholderPage);
        v140.ShareGamePage:ConnectHubToApp(v140, v140.ShareGameApp);
        v140:AddPage(v140.ShareGamePage);
    end;
    local v590 = l_CapturesPolicy_0.PolicyImplementation.read();
    local v591 = if v590 then l_CapturesPolicy_0.Mapper(v590).eligibleForCapturesFeature() else false;
    local v592 = v61.isInExperienceUIVREnabled and v61.FFlagFixSpatialUICaptures;
    if v591 and (not v592 or not l_isSpatial_0()) then
        local v593 = require(l_RobloxGui_0.Modules.Settings.Pages.CapturesPageWrapper);
        local function v594() --[[ Line: 4078 ]] --[[ Name: closeSettingsMenu ]]
            -- upvalues: v140 (copy)
            v140:SetVisibility(false, true);
        end;
        v140.CapturesApp = v101;
        v140.CapturesApp.mountMenuPage(v593.Page, v594, v61.ChromeEnabled);
        v140.CapturesPage = v593;
        v140.CapturesPage:ConnectHubToApp(v140, v140.PageViewClipper, v140.CapturesApp);
    end;
    if v140.PlayersPage then
        v140:AddPage(v140.PlayersPage);
    end;
    v140:AddPage(v140.ResetCharacterPage);
    if v140.LeaveGamePage then
        v140:AddPage(v140.LeaveGamePage);
    end;
    if v61.GetFFlagEnableLeaveGameUpsellEntrypoint() and v140.LeaveGameUpsellPage then
        v140:AddPage(v140.LeaveGameUpsellPage);
    end;
    v140:AddPage(v140.GameSettingsPage);
    if v140.CapturesPage then
        v140:AddPage(v140.CapturesPage);
    end;
    if v140.ReportAbusePage then
        v140:AddPage(v140.ReportAbusePage);
    end;
    if v140.ReportSentPage then
        v140:AddPage(v140.ReportSentPage);
    end;
    if v140.ReportSentPageV2 then
        v140:AddPage(v140.ReportSentPageV2);
    end;
    v140:AddPage(v140.HelpPage);
    if not v61.FFlagRemoveRecordPage and v140.RecordPage and not v140.CapturesPage then
        v140:AddPage(v140.RecordPage);
    end;
    if v140.ExitModalPage then
        v140:AddPage(v140.ExitModalPage);
    end;
    if v140.LeaveGameToHomePage then
        v140:AddPage(v140.LeaveGameToHomePage);
    end;
    v140:InitInPage(v140:GetFirstPageWithTabHeader());
    if not v61.isNewInGameMenuEnabled() and (not v61.FFlagAddUILessMode or v61.FIntAddUILessModeVariant == 0) then
        l_ContextActionService_0:BindCoreAction("RBXEscapeMainMenu", function(_, v596, _) --[[ Line: 4139 ]]
            -- upvalues: v61 (ref), v140 (copy), l_Constants_0 (ref)
            if v596 ~= Enum.UserInputState.Begin then
                return;
            elseif v61.FFlagAddUILessMode then
                v140:PopMenu(false, true, l_Constants_0.AnalyticsMenuOpenTypes.Keyboard);
                return;
            else
                v140:PopMenu(false, true);
                return;
            end;
        end, false, Enum.KeyCode.Escape);
    end;
    l_GuiService_0.ShowLeaveConfirmation:connect(function() --[[ Line: 4154 ]]
        -- upvalues: v140 (copy), l_Constants_0 (ref)
        if #v140.MenuStack == 0 then
            v140:SetVisibility(true, nil, nil, nil, l_Constants_0.AnalyticsMenuOpenTypes.GamepadLeaveGame);
            v140:SwitchToPage(v140:GetFirstPageWithTabHeader(), nil, 1);
            return;
        else
            v140:PopMenu(false, true);
            return;
        end;
    end);
    l_ContextActionService_0:BindCoreAction("Open Dev Console", v392, false, Enum.KeyCode.F9);
    l_ContextActionService_0:BindCoreAction("Show Quick Profiler", v388, false, Enum.KeyCode.F7);
    l_UserInputService_0.InputBegan:connect(function(v598) --[[ Line: 4180 ]]
        -- upvalues: v140 (copy), l_GuiService_0 (ref)
        if (v598.KeyCode == Enum.KeyCode.Left or v598.KeyCode == Enum.KeyCode.Right or v598.KeyCode == Enum.KeyCode.Up or v598.KeyCode == Enum.KeyCode.Down) and v140.Visible and v140.Active and v140.Pages.CurrentPage and l_GuiService_0.SelectedCoreObject == nil then
            v140.Pages.CurrentPage:SelectARow();
        end;
    end);
    if v140.ExitModalPage then
        local function v599() --[[ Line: 4194 ]] --[[ Name: showExitModal ]]
            -- upvalues: v140 (copy), v168 (copy)
            v140.HubBar.Visible = false;
            v168();
            if v140:GetVisibility() then
                v140:AddToMenuStack(v140.Pages.CurrentPage);
                v140:SwitchToPage(v140.ExitModalPage, nil, 1, true);
                return;
            else
                v140:SetVisibility(true, nil, v140.ExitModalPage, false);
                return;
            end;
        end;
        local l_v599_0 = v599 --[[ copy: 59 -> 63 ]];
        local function v601() --[[ Line: 4204 ]] --[[ Name: handleNativeExit ]]
            -- upvalues: v140 (copy), v61 (ref), v28 (ref), v255 (copy), l_v599_0 (copy)
            if v140:GetVisibility() and v140.Pages.CurrentPage == v140.ExitModalPage then
                if v61.FFlagEnableInGameMenuDurationLogger then
                    v28.leavingGame();
                end;
                if v61.FFlagRelocateMobileMenuButtons and v61.FIntRelocateMobileMenuButtonsVariant ~= 0 then
                    v255();
                    if v61.FFlagMenuButtonsMountWithIEM and v61.FIntRelocateMobileMenuButtonsVariant == 2 and v140.PlayersPage then
                        v140.PlayersPage:UnmountMenuButtonsContainer();
                    end;
                end;
                v140.ExitModalPage.LeaveAppFunc(true);
                return;
            else
                l_v599_0();
                return;
            end;
        end;
        game:GetService("GuiService").NativeClose:Connect(v601);
        if v140.FullScreenTitleBar then
            v140.FullScreenTitleBar = v88.update(v140.FullScreenTitleBar, {
                onClose = v601
            });
        end;
    end;
    if v61.GetFFlagEnableAppChatInExperience() then
        local v602 = nil;
        do
            local l_v602_0 = v602;
            v140.SettingsShowSignal:connect(function(v604) --[[ Line: 4233 ]]
                -- upvalues: l_v602_0 (ref), l_InExperienceAppChatModal_0 (ref), v140 (copy)
                if v604 then
                    l_v602_0 = l_InExperienceAppChatModal_0.default.visibilitySignal.Event:Connect(function(v605) --[[ Line: 4235 ]]
                        -- upvalues: v140 (ref)
                        if v605 and v140.Visible then
                            v140:SetVisibility(false, true);
                        end;
                    end);
                    return;
                else
                    if l_v602_0 then
                        l_v602_0:Disconnect();
                        l_v602_0 = nil;
                    end;
                    return;
                end;
            end);
        end;
    end;
    if v61.FFlagCreateInExperienceMenuReact then
        v140.InExperienceMenuReact = l_Create_0("Folder")({
            Name = "InExperienceMenuReact", 
            Parent = v140.ClippingShield
        });
        local l_ButtonsContainer_0 = v140.PlayersPage.ButtonsContainer;
        local v607 = if l_ButtonsContainer_0 then l_ButtonsContainer_0:FindFirstChild("LeaveButtonButton", true) else nil;
        local v608 = nil;
        if v61.FFlagAddTraversalHistory then
            v608 = v140.LeaveGameButton;
        end;
        local v609 = nil;
        if v61.FFlagTraversalPerfFixes then
            v609 = function(v610) --[[ Line: 4265 ]]
                -- upvalues: v15 (ref), v140 (copy), v44 (ref), v61 (ref), l_isSpatial_0 (ref), v20 (ref), l_TraversalHistoryMenu_0 (ref)
                local v611, v612 = v15.useState(v610.showSignal(false) and v140.Visible);
                v15.useEffect(function() --[[ Line: 4267 ]]
                    -- upvalues: v44 (ref), v612 (copy), v610 (copy), v140 (ref)
                    local v614 = v44.createEffect(function(v613) --[[ Line: 4268 ]]
                        -- upvalues: v612 (ref), v610 (ref), v140 (ref)
                        v612(v610.showSignal(v613) and v140.Visible);
                    end);
                    local v616 = v140.SettingsShowSignal:connect(function(v615) --[[ Line: 4271 ]]
                        -- upvalues: v612 (ref), v610 (ref)
                        v612(v610.showSignal(false) and v615);
                    end);
                    return function() --[[ Line: 4275 ]]
                        -- upvalues: v614 (copy), v616 (copy)
                        v614();
                        v616:Disconnect();
                    end;
                end, {});
                return v61.FFlagAddTraversalHistory and not (v61.isInExperienceUIVREnabled and l_isSpatial_0()) and v610.parent and v611 and v15.createElement(v20, {
                    parent = v610.parent
                }, {
                    TraversalHistoryMenu = v15.createElement(l_TraversalHistoryMenu_0, {
                        anchorParent = v610.parent, 
                        currentPageChangeSignal = v610.currentPageChangeSignal, 
                        menuSide = v610.menuSide
                    })
                });
            end;
        end;
        v16.createRoot(v140.InExperienceMenuReact):render(v15.createElement(v21, nil, {
            InExperienceMenuReactPage = v15.createElement(v22, {
                onMount = function() --[[ Line: 4297 ]] --[[ Name: onMount ]]
                    -- upvalues: v140 (copy)
                    v140:SwitchToReactPage(nil, nil, true);
                end, 
                onUnmount = function() --[[ Line: 4298 ]] --[[ Name: onUnmount ]]
                    -- upvalues: v140 (copy), v23 (ref)
                    v140:CloseReactPage();
                    v23(false).setCurrentReactPage(nil);
                end, 
                mountTo = v140.ReactPage
            }), 
            TraversalHistoryMenuBottomBar = if v61.FFlagTraversalPerfFixes then v15.createElement(v609, {
                showSignal = v140.showBottomBarSignal, 
                parent = v608, 
                menuSide = v17.Enums.PopoverSide.Top, 
                currentPageChangeSignal = v140.CurrentPageSignal
            }) else v61.FFlagAddTraversalHistory and not (v61.isInExperienceUIVREnabled and l_isSpatial_0()) and v608 and v15.createElement(v20, {
                parent = v608
            }, {
                TraversalHistoryMenu = v15.createElement(l_TraversalHistoryMenu_0, {
                    anchorParent = v608, 
                    idleButtonStateIsDown = true, 
                    currentPageChangeSignal = v140.CurrentPageSignal
                })
            }), 
            TraversalHistoryMenuMobileButton = if v61.FFlagTraversalPerfFixes then v15.createElement(v609, {
                showSignal = v44.createComputed(function(v617) --[[ Line: 4320 ]]
                    -- upvalues: v140 (copy)
                    return not v140.showBottomBarSignal(v617);
                end), 
                parent = v607, 
                menuSide = v17.Enums.PopoverSide.Bottom, 
                currentPageChangeSignal = v140.CurrentPageSignal
            }) else v61.FFlagAddTraversalHistory and not (v61.isInExperienceUIVREnabled and l_isSpatial_0()) and v607 and v15.createElement(v20, {
                parent = v607
            }, {
                TraversalHistoryMenu = v15.createElement(l_TraversalHistoryMenu_0, {
                    anchorParent = v607, 
                    idleButtonStateIsDown = v61.FFlagTraversalLeaveArrowDown and true or false, 
                    currentPageChangeSignal = v140.CurrentPageSignal
                })
            })
        }));
    end;
    return v140;
end;
local v619 = {
    ModuleName = "SettingsMenu", 
    KeepVRTopbarOpen = true, 
    VRIsExclusive = true, 
    VRClosesNonExclusive = true, 
    SetVisibility = nil
};
l_VRHub_0:RegisterModule(v619);
l_VRHub_0.ModuleOpened.Event:connect(function(v620) --[[ Line: 4354 ]]
    -- upvalues: v619 (copy), l_VRHub_0 (copy)
    if v620 ~= v619.ModuleName and l_VRHub_0:GetModule(v620).VRIsExclusive then
        v619:SetVisibility(false);
    end;
end);
local v621 = v618();
v619.GetExperienceControlStore = function(_) --[[ Line: 4365 ]] --[[ Name: GetExperienceControlStore ]]
    -- upvalues: v621 (copy)
    return v621:GetExperienceControlStore();
end;
v619.SetVisibility = function(_, v624, v625, v626, v627, v628) --[[ Line: 4369 ]] --[[ Name: SetVisibility ]]
    -- upvalues: v621 (copy)
    v621:SetVisibility(v624, v625, v626, v627, v628);
end;
v619.SetBackgroundVisibility = function(_, v630, v631) --[[ Line: 4373 ]] --[[ Name: SetBackgroundVisibility ]]
    -- upvalues: v621 (copy)
    v621:SetBackgroundVisibility(v630, v631);
end;
v619.ToggleVisibility = function(_, v633, v634) --[[ Line: 4377 ]] --[[ Name: ToggleVisibility ]]
    -- upvalues: v621 (copy)
    v621:ToggleVisibility(v633, v634);
end;
v619.SwitchToPage = function(_, v636, v637) --[[ Line: 4381 ]] --[[ Name: SwitchToPage ]]
    -- upvalues: v621 (copy)
    v621:SwitchToPage(v636, v637, 1);
end;
if v61.FFlagAddUILessMode and v61.FIntAddUILessModeVariant ~= 0 then
    v619.PopMenu = function(_, v639, v640, v641) --[[ Line: 4386 ]] --[[ Name: PopMenu ]]
        -- upvalues: v621 (copy)
        return v621:PopMenu(v639, v640, v641);
    end;
end;
v619.GetVisibility = function(_) --[[ Line: 4391 ]] --[[ Name: GetVisibility ]]
    -- upvalues: v621 (copy)
    return v621.Visible;
end;
v619.ShowShield = function(_) --[[ Line: 4395 ]] --[[ Name: ShowShield ]]
    -- upvalues: v621 (copy)
    v621:ShowShield();
end;
v619.HideShield = function(_) --[[ Line: 4399 ]] --[[ Name: HideShield ]]
    -- upvalues: v621 (copy)
    v621:HideShield();
end;
v619.GetRespawnBehaviour = function(_) --[[ Line: 4403 ]] --[[ Name: GetRespawnBehaviour ]]
    -- upvalues: v621 (copy)
    return v621:GetRespawnBehaviour();
end;
v619.CloseReactPage = function(_) --[[ Line: 4407 ]] --[[ Name: CloseReactPage ]]
    -- upvalues: v621 (copy)
    v621:CloseReactPage();
end;
v619.SwitchToReactPage = function(_, v648, v649, v650) --[[ Line: 4411 ]] --[[ Name: SwitchToReactPage ]]
    -- upvalues: v621 (copy)
    v621:SwitchToReactPage(v648, v649, v650);
end;
v619.RespawnBehaviourChangedEvent = v621.RespawnBehaviourChangedEvent;
v619.SettingsShowSignal = v621.SettingsShowSignal;
v619.CurrentPageSignal = v621.CurrentPageSignal;
v619.SettingsShowEvent = Instance.new("BindableEvent");
v621.SettingsShowSignal:connect(function(v651) --[[ Line: 4423 ]]
    -- upvalues: v619 (copy)
    v619.SettingsShowEvent:Fire(v651);
end);
v619.Instance = v621;
return v619;