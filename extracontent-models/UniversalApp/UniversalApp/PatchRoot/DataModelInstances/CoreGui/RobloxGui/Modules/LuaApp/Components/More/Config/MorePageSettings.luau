local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local l_Images_0 = require(l_CorePackages_0.Packages.UIBlox).App.ImageSet.Images;
local v5 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v7 = require(l_Modules_0.LuaApp.AppPage);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v9 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v10 = require(l_Modules_0.LuaApp.buildCreatorWebNavUrl);
local v11 = require(l_Modules_0.LuaApp.Components.NumericalBadge);
local v12 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local l_VRConstants_0 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility).VRConstants;
local l_getAppChatCommunitiesVisualConfig_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Utils.getAppChatCommunitiesVisualConfig;
local l_getFFlagCommunitiesUseVisualConfigUtil_0 = v5.getFFlagCommunitiesUseVisualConfigUtil;
local l_GetFFlagUseCommunitiesTranslation_0 = v5.GetFFlagUseCommunitiesTranslation;
local v17 = game:DefineFastFlag("LuaAppsEnableParentalControlsTab", false);
local v18 = require(l_Modules_0.LuaApp.Flags.FFlagFetchUserNameOnCloseAccountInfo);
local l_GetFStringPlatformEventUrl_0 = v5.GetFStringPlatformEventUrl;
local v20 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableGUACControlTOSPPLinks);
local v21 = game:DefineFastString("LuobuCJVAboutUSCorpUrlOverride", "https://roblox.qq.com/?webview=true0409");
local l_GetFFlagEnableGateNotificationPreferencesTab_0 = v5.GetFFlagEnableGateNotificationPreferencesTab;
local v23 = game:DefineFastFlag("RenameSettingsTabsSentenceCase", false);
local v24 = game:DefineFastString("GiftCardSourceParam", "more-page");
local v25 = require(l_Modules_0.LuaApp.Flags.FFlagAddRMTile);
local l_FFlagEnableBlackbird_0 = v5.FFlagEnableBlackbird;
local l_FFlagEnableBlackbirdOnMorePage_0 = v5.FFlagEnableBlackbirdOnMorePage;
local l_GetFStringBlackbirdUrl_0 = v5.GetFStringBlackbirdUrl;
local v29 = game:DefineFastString("LearnPlaceURI", "roblox://experiences/start?placeId=92498145666402");
local v30 = game:DefineFastString("RMPlaceURI", "roblox://experiences/start?placeId=119524072047648");
local v31 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local l_FFlagCreateConnectionsHub_0 = v5.FFlagCreateConnectionsHub;
local l_GetFFlagEnableCommunityListExperimentation_0 = v5.GetFFlagEnableCommunityListExperimentation;
local l_FFlagConnectionsToFriendsRename_0 = v5.FFlagConnectionsToFriendsRename;
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local l_CommunityListExperimentation_0 = require(l_CorePackages_0.Workspace.Packages.Groups).Experiments.CommunityListExperimentation;
local v37 = {
    VRFTUX = "VRFTUX", 
    Catalog = "Catalog", 
    BuildersClub = "BuildersClub", 
    DevSubs = "DevSubs", 
    Trades = "Trades", 
    Profile = "Profile", 
    TencentNoticeCenter = "TencentNoticeCenter", 
    TencentHelp = "TencentHelp", 
    UserInfo = "UserInfo", 
    Friends = "Friends", 
    Groups = "Groups", 
    Inventory = "Inventory", 
    Messages = "Messages", 
    CreateGames = "CreateGames", 
    Blog = "Blog", 
    GiftCards = "GiftCards", 
    Redeem = "Redeem", 
    OfficialStore = "OfficialStore", 
    Settings = "Settings", 
    AdjustScreen = "AdjustScreen", 
    SafetySupport = "SafetySupport", 
    About = "About", 
    Help = "Help", 
    LoginCode = "Login Code", 
    ReportLogs = "Report Logs", 
    LogOut = "LogOut", 
    TheHunt = "TheHunt", 
    About_AboutUs = "About_AboutUs", 
    About_AboutUs_CJV = "About_AboutUs_CJV", 
    About_Careers = "About_Careers", 
    About_Parents = "About_Parents", 
    About_Terms = "About_Terms", 
    About_Privacy = "About_Privacy", 
    About_PrivacyGuidelinesChildren = "About_PrivacyGuidelinesChildren", 
    About_LuobuRiderTerms = "About_LuobuRiderTerms", 
    About_LuobuThirdPartyDataUse = "About_LuobuThirdPartyDataUse", 
    About_AppInformation = "About_AppInformation", 
    About_AboutSection = "About_AboutSection", 
    About_TermsOfService = "About_TermsOfService", 
    About_LicensingSection = "About_LicensingSection", 
    About_VersionSection = "About_VersionSection", 
    SafetySupport_ReportAppeals = "SafetySupport_ReportAppeals", 
    SafetySupport_Help = "SafetySupport_Help", 
    Settings_AccountInfo = "Settings_AccountInfo", 
    Settings_Security = "Settings_Security", 
    Settings_Privacy = "Settings_Privacy", 
    Settings_ParentalControls = "Settings_ParentalControls", 
    Settings_Billing = "Settings_Billing", 
    Settings_Subscriptions = "Settings_Subscriptions", 
    Settings_Notifications = "Settings_Notifications", 
    Settings_Accessibility = "Settings_Accessibility", 
    Settings_Tencent_Reputation = "Settings_Tencent_Reputation", 
    Settings_Cross_Play = "Settings_Cross_Play", 
    Settings_SwitchProfileSection = "Settings_SwitchProfileSection", 
    Settings_AccountSettingsSection = "Settings_AccountSettingsSection", 
    Settings_AccountSettingsInfo = "Settings_AccountSettingsInfo", 
    Settings_DeviceSettingsSection = "Settings_DeviceSettingsSection"
};
local v38 = {
    Content = "Content", 
    Navigation = "Navigation", 
    Action = "Action"
};
local v39 = {
    Catalog = "Catalog", 
    Games = "Games", 
    Groups = "Groups", 
    Library = "Library", 
    Players = "Players"
};
local v40 = l_getAppChatCommunitiesVisualConfig_0();
local v41 = string.lower(l_UserInputService_0:GetPlatform().Name);
local v42 = l_getAppFeaturePolicies_0().getGiftCardSourceRefOverride();
local v43 = if v42 ~= "" then v42 else v41;
local v44 = {
    [v37.VRFTUX] = "CommonUI.Features.Label.VRFTUX", 
    [v37.Catalog] = "Feature.Avatar.Action.Marketplace", 
    [v37.BuildersClub] = "CommonUI.Features.Label.Premium", 
    [v37.DevSubs] = "CommonUI.Features.Label.DevSubs", 
    [v37.Trades] = "CommonUI.Features.Label.Trades", 
    [v37.Profile] = "CommonUI.Features.Label.Profile", 
    [v37.TencentHelp] = "CommonUI.Features.Label.Help", 
    [v37.TencentNoticeCenter] = "CommonUI.Features.Label.TencentNotice", 
    [v37.Friends] = l_FFlagConnectionsToFriendsRename_0 and "CommonUI.Features.Label.Friends" or "CommonUI.Features.Label.Connections", 
    [v37.Groups] = if l_getFFlagCommunitiesUseVisualConfigUtil_0() then v40.label else l_GetFFlagUseCommunitiesTranslation_0() and "CommonUI.Features.Label.Groups" or "CommonUI.Features.Label.sGroups", 
    [v37.Inventory] = "CommonUI.Features.Label.Inventory", 
    [v37.Messages] = "CommonUI.Features.Label.Messages", 
    [v37.CreateGames] = "CommonUI.Features.Label.CreateGames", 
    [v37.TheHunt] = "CommonUI.Features.Label.TheHunt", 
    [v37.Blog] = "CommonUI.Features.Label.Blog", 
    [v37.GiftCards] = "CommonUI.Features.Label.GiftCards", 
    [v37.Redeem] = "CommonUI.Features.Label.Redeem", 
    [v37.OfficialStore] = "CommonUI.Features.Label.OfficialStore", 
    [v37.Settings] = "CommonUI.Features.Label.Settings", 
    [v37.AdjustScreen] = "CommonUI.Features.Label.AdjustScreen", 
    [v37.About] = "CommonUI.Features.Label.About", 
    [v37.SafetySupport] = "CommonUI.Features.Label.HelpAndSafety", 
    [v37.SafetySupport_ReportAppeals] = "Feature.AppealsPortal.Label.ReportAndAppeals", 
    [v37.Help] = "CommonUI.Features.Label.Help", 
    [v37.LoginCode] = "Authentication.CrossDevice.Heading.QuickLogin", 
    [v37.LogOut] = "Application.Logout.Action.Logout", 
    [v37.ReportLogs] = "CommonUI.Features.Label.ReportLogs", 
    [v37.About_AboutUs] = "CommonUI.Features.Label.AboutUs", 
    [v37.About_AboutUs_CJV] = "CommonUI.Features.Label.AboutUs", 
    [v37.About_Careers] = "CommonUI.Features.Label.Careers", 
    [v37.About_Parents] = "CommonUI.Features.Label.Parents", 
    [v37.About_Terms] = "CommonUI.Features.Label.Terms", 
    [v37.About_Privacy] = "CommonUI.Features.Label.Privacy", 
    [v37.About_PrivacyGuidelinesChildren] = "CommonUI.Features.Label.PrivacyGuidelinesChildren", 
    [v37.About_LuobuRiderTerms] = "CommonUI.Features.Label.LuobuRiderTerms", 
    [v37.About_LuobuThirdPartyDataUse] = "CommonUI.Features.Label.LuobuThirdPartyDataUse", 
    [v37.About_AppInformation] = "CommonUI.Features.Label.AppInformation", 
    [v37.About_AboutSection] = "CommonUI.Features.Label.About", 
    [v37.About_TermsOfService] = "CommonUI.Features.Label.TermsOfService", 
    [v37.About_LicensingSection] = "CommonUI.Features.Label.Licensing", 
    [v37.About_VersionSection] = "CommonUI.Features.Label.Version", 
    [v37.Settings_AccountInfo] = v23 and "Feature.AccountSettings.Heading.Tab.AccountInfoV2" or "Feature.AccountSettings.Heading.Tab.AccountInfo", 
    [v37.Settings_Security] = "Feature.AccountSettings.Heading.Tab.Security", 
    [v37.Settings_Privacy] = "Feature.AccountSettings.Heading.Tab.PrivacyContentRestrictions", 
    [v37.Settings_ParentalControls] = v23 and "Feature.AccountSettings.Heading.Tab.ParentalControlsV2" or "Feature.AccountSettings.Heading.Tab.ParentalControls", 
    [v37.Settings_Billing] = l_getAppFeaturePolicies_0().getRenamePaymentsToSpendingTab() and "Feature.AccountSettings.Heading.Tab.Spending" or v23 and "Feature.AccountSettings.Heading.Tab.BillingV2" or "Feature.AccountSettings.Heading.Tab.Billing", 
    [v37.Settings_Subscriptions] = "Feature.AccountSettings.Heading.Tab.Subscriptions", 
    [v37.Settings_Notifications] = "Feature.AccountSettings.Heading.Tab.Notifications", 
    [v37.Settings_Accessibility] = v23 and "Feature.Accessibility.Heading.DevicePreferencesV2" or "Feature.Accessibility.Heading.DevicePreferences", 
    [v37.Settings_Tencent_Reputation] = "Feature.AccountSettings.Label.TencentReputation", 
    [v37.Settings_SwitchProfileSection] = "Feature.Settings.Heading.SwitchProfile", 
    [v37.Settings_AccountSettingsSection] = "Feature.Settings.Heading.AccountSettings"
};
local v45 = {
    [v37.VRFTUX] = l_Images_0["icons/menu/vrheadset_large"], 
    [v37.Catalog] = l_Images_0["icons/menu/shop_large"], 
    [v37.BuildersClub] = l_Images_0["icons/status/premium_large"], 
    [v37.DevSubs] = l_Images_0["icons/status/player/developer"], 
    [v37.Trades] = l_Images_0["icons/menu/trade"], 
    [v37.Profile] = l_Images_0["icons/actions/friend_sort/my_profile"], 
    [v37.TencentHelp] = l_Images_0["icons/menu/help_large"], 
    [v37.TencentNoticeCenter] = l_Images_0["icons/menu/events_large"], 
    [v37.Friends] = l_Images_0["icons/menu/friends_large"], 
    [v37.Groups] = if l_getFFlagCommunitiesUseVisualConfigUtil_0() then l_Images_0[v40.iconLarge] else l_Images_0["icons/menu/groups_large"], 
    [v37.Inventory] = l_Images_0["icons/menu/inventory_large"], 
    [v37.Messages] = l_Images_0["icons/menu/messages_large"], 
    [v37.CreateGames] = l_Images_0["icons/menu/create_large"], 
    [v37.TheHunt] = l_Images_0["icons/menu/events_large"], 
    [v37.Blog] = l_Images_0["icons/menu/blog_large"], 
    [v37.GiftCards] = l_Images_0["icons/menu/giftcard_large"], 
    [v37.Redeem] = l_Images_0["icons/menu/wallet"], 
    [v37.OfficialStore] = l_Images_0["icons/menu/officialstore_large"], 
    [v37.Settings] = l_Images_0["icons/menu/settings_large"], 
    [v37.AdjustScreen] = l_Images_0["icons/menu/adjust/scale"], 
    [v37.About] = l_Images_0["icons/menu/about_large"], 
    [v37.SafetySupport] = l_Images_0["icons/menu/protection"], 
    [v37.Help] = l_Images_0["icons/menu/help_large"], 
    [v37.LoginCode] = l_Images_0["icons/graphic/lock_xxlarge"], 
    [v37.ReportLogs] = l_Images_0["icons/menu/giftcard_large"]
};
local v46 = {
    [v37.Catalog] = v9.static.catalog(), 
    [v37.BuildersClub] = v9.static.buildersClub(), 
    [v37.Trades] = v9.static.trades(), 
    [v37.Profile] = v9.static.profile(), 
    [v37.Friends] = v9.static.friends(), 
    [v37.Groups] = v9.static.groups(), 
    [v37.Inventory] = v9.static.inventory(), 
    [v37.Messages] = v9.static.messages(), 
    [v37.CreateGames] = v10({
        utm_content = "more_page"
    }), 
    [v37.TheHunt] = if l_GetFStringPlatformEventUrl_0() ~= "" then v9.fromString(l_GetFStringPlatformEventUrl_0())() else v9.static.help(), 
    [v37.Blog] = v9.static.blog(), 
    [v37.OfficialStore] = v9.static.amazonStore(), 
    [v37.GiftCards] = v9.static.giftCards(), 
    [v37.GiftCards] = v9.static.giftCards(v43 .. "-" .. v24), 
    [v37.Redeem] = v9.static.redeem(), 
    [v37.Help] = v9.static.help(), 
    [v37.SafetySupport_ReportAppeals] = v9.static.appealsPortal.main({
        source = "app-help-safety"
    }), 
    [v37.About_AboutUs] = v9.static.about.us(), 
    [v37.About_AboutUs_CJV] = v21 ~= "" and v9.fromString(v21)() or v9.static.about.us(), 
    [v37.About_Careers] = v9.static.about.careers(), 
    [v37.About_Parents] = v9.static.about.parents(), 
    [v37.About_Terms] = v9.static.about.terms({
        useGameQQUrls = true
    }), 
    [v37.About_Privacy] = v9.static.about.privacy({
        useGameQQUrls = true
    }), 
    [v37.About_PrivacyGuidelinesChildren] = v9.static.tencent.childrenPrivacyGuide(), 
    [v37.About_LuobuRiderTerms] = v9.static.tencent.luobuRiderTerms(), 
    [v37.About_LuobuThirdPartyDataUse] = v9.static.tencent.luobuThirdPartyDataUse(), 
    [v37.Settings_AccountInfo] = v9.static.settings.account(), 
    [v37.Settings_Security] = v9.static.settings.security(), 
    [v37.Settings_Privacy] = v9.static.settings.privacy(), 
    [v37.Settings_ParentalControls] = v9.static.settings.parentalControls(), 
    [v37.Settings_Billing] = v9.static.settings.billing(), 
    [v37.Settings_Subscriptions] = v9.static.settings.subscriptions(), 
    [v37.Settings_Notifications] = v9.static.settings.notifications(), 
    [v37.Settings_Tencent_Reputation] = v9.static.tencent.reputationInfo()
};
local function v50(v47, v48, v49) --[[ Line: 287 ]]
    -- upvalues: v7 (copy), v44 (copy), v46 (copy)
    if v47 then
        return {
            page = v48 or v7.GenericWebPage, 
            titleKey = v44[v47], 
            url = v46[v47], 
            fallbackToExternalBrowser = v49
        };
    else
        return {};
    end;
end;
local v61 = {
    [v37.VRFTUX] = {
        itemType = v37.VRFTUX, 
        textKey = v44[v37.VRFTUX], 
        icon = v45[v37.VRFTUX], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v7.ExperienceDetail, 
            url = l_VRConstants_0.FTUX.UniverseId
        }
    }, 
    [v37.Catalog] = {
        itemType = v37.Catalog, 
        textKey = v44[v37.Catalog], 
        icon = v45[v37.Catalog], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = l_AvatarScreen_0.Catalog
        }
    }, 
    [v37.BuildersClub] = {
        itemType = v37.BuildersClub, 
        textKey = v44[v37.BuildersClub], 
        icon = v45[v37.BuildersClub], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v7.BuildersClub
        }
    }, 
    [v37.DevSubs] = {
        itemType = v37.DevSubs, 
        textKey = v44[v37.DevSubs], 
        icon = v45[v37.DevSubs], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v7.DevSubs
        }
    }, 
    [v37.Trades] = {
        itemType = v37.Trades, 
        textKey = v44[v37.Trades], 
        icon = v45[v37.Trades], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.Trades)
    }, 
    [v37.Profile] = {
        itemType = v37.Profile, 
        textKey = v44[v37.Profile], 
        icon = v45[v37.Profile], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        urlGenerator = function(v51) --[[ Line: 355 ]] --[[ Name: urlGenerator ]]
            return v51;
        end, 
        context = {
            page = v7.ProfilePlatform
        }
    }, 
    [v37.Friends] = {
        itemType = v37.Friends, 
        textKey = v44[v37.Friends], 
        icon = v45[v37.Friends], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeComponent = v11, 
        badgeCount = 0, 
        urlGenerator = function(v52) --[[ Line: 371 ]] --[[ Name: urlGenerator ]]
            -- upvalues: v9 (copy)
            return v52 and v9.user.friends({
                userId = v52
            }) or nil;
        end, 
        getSearchParams = function() --[[ Line: 374 ]] --[[ Name: getSearchParams ]]
            -- upvalues: v39 (copy)
            return {
                searchType = v39.Players
            };
        end, 
        context = {
            page = if l_FFlagCreateConnectionsHub_0 then v7.CoHubMyConnections else v7.ViewFriends
        }
    }, 
    [v37.Groups] = {
        itemType = v37.Groups, 
        textKey = v44[v37.Groups], 
        icon = v45[v37.Groups], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        getSearchParams = function(v53) --[[ Line: 389 ]] --[[ Name: getSearchParams ]]
            -- upvalues: l_FormFactor_0 (copy), v39 (copy)
            if v53 == l_FormFactor_0.WIDE then
                return {
                    searchType = v39.Groups
                };
            else
                return nil;
            end;
        end, 
        context = if l_GetFFlagEnableCommunityListExperimentation_0() and l_CommunityListExperimentation_0.getCommunityListEnabled() then {
            page = v7.Groups
        } else v50(v37.Groups)
    }, 
    [v37.Inventory] = {
        itemType = v37.Inventory, 
        textKey = v44[v37.Inventory], 
        icon = v45[v37.Inventory], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        urlGenerator = function(v54) --[[ Line: 411 ]] --[[ Name: urlGenerator ]]
            -- upvalues: v9 (copy)
            return v54 and v9.user.inventory({
                userId = v54
            }) or nil;
        end, 
        context = v50(v37.Inventory)
    }, 
    [v37.Messages] = {
        itemType = v37.Messages, 
        textKey = v44[v37.Messages], 
        icon = v45[v37.Messages], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeComponent = v11, 
        badgeCount = 0, 
        context = v50(v37.Messages)
    }, 
    [v37.CreateGames] = {
        itemType = v37.CreateGames, 
        textKey = v44[v37.CreateGames], 
        icon = v45[v37.CreateGames], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.CreateGames), 
        shouldOpenInExternalBrowser = true
    }, 
    [v37.TencentHelp] = {
        itemType = v37.TencentHelp, 
        textKey = v44[v37.Help], 
        icon = v45[v37.Help], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v7.TencentHelp, 
            titleKey = v44[v37.Help]
        }
    }, 
    [v37.TencentNoticeCenter] = {
        itemType = v37.TencentNoticeCenter, 
        textKey = v44[v37.TencentNoticeCenter], 
        icon = v45[v37.TencentNoticeCenter], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v7.TencentNoticeCenter
        }
    }, 
    [v37.TheHunt] = {
        itemType = v37.TheHunt, 
        textKey = v44[v37.TheHunt], 
        icon = v45[v37.TheHunt], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.TheHunt)
    }, 
    [v37.Blog] = {
        itemType = v37.Blog, 
        textKey = v44[v37.Blog], 
        icon = v45[v37.Blog], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.Blog, nil, true)
    }, 
    [v37.GiftCards] = {
        itemType = v37.GiftCards, 
        textKey = v44[v37.GiftCards], 
        icon = v45[v37.GiftCards], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.GiftCards, nil, true), 
        shouldOpenInExternalBrowser = true
    }, 
    [v37.Redeem] = {
        itemType = v37.Redeem, 
        textKey = v44[v37.Redeem], 
        icon = v45[v37.Redeem], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.Redeem)
    }, 
    [v37.OfficialStore] = {
        itemType = v37.OfficialStore, 
        textKey = v44[v37.OfficialStore], 
        icon = v45[v37.OfficialStore], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.OfficialStore, nil, true)
    }, 
    [v37.Settings] = {
        itemType = v37.Settings, 
        textKey = v44[v37.Settings], 
        icon = v45[v37.Settings], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeComponent = v11, 
        badgeCount = 0, 
        context = {
            page = v7.Settings
        }
    }, 
    [v37.AdjustScreen] = {
        itemType = v37.AdjustScreen, 
        textKey = v44[v37.AdjustScreen], 
        icon = v45[v37.AdjustScreen], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v7.AdjustScreen
        }
    }, 
    [v37.About] = {
        itemType = v37.About, 
        textKey = v44[v37.About], 
        icon = v45[v37.About], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v7.About
        }
    }, 
    [v37.SafetySupport] = {
        itemType = v37.SafetySupport, 
        textKey = v44[v37.SafetySupport], 
        icon = v45[v37.SafetySupport], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v7.SafetySupport
        }
    }, 
    [v37.ReportLogs] = {
        itemType = v37.ReportLogs, 
        textKey = v44[v37.ReportLogs], 
        icon = v45[v37.ReportLogs], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {}
    }, 
    [v37.Help] = {
        itemType = v37.Help, 
        textKey = v44[v37.Help], 
        icon = v45[v37.Help], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.Help, nil, true), 
        shouldOpenInExternalBrowser = true
    }, 
    [v37.LoginCode] = {
        itemType = v37.LoginCode, 
        textKey = v44[v37.LoginCode], 
        icon = v45[v37.LoginCode], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v7.CrossDeviceLogin
        }
    }, 
    [v37.LogOut] = {
        itemType = v37.LogOut, 
        textKey = v44[v37.LogOut], 
        textXAlignment = Enum.TextXAlignment.Center, 
        badgeCount = 0, 
        context = {
            page = v7.LogoutConfirmation
        }
    }, 
    [v37.UserInfo] = {
        itemType = v37.UserInfo
    }, 
    [v37.Settings_Cross_Play] = {
        itemType = v37.Settings_Cross_Play
    }, 
    [v37.SafetySupport_ReportAppeals] = {
        itemType = v37.SafetySupport_ReportAppeals, 
        textKey = v44[v37.SafetySupport_ReportAppeals], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.SafetySupport_ReportAppeals)
    }, 
    [v37.SafetySupport_Help] = {
        itemType = v37.SafetySupport_Help, 
        textKey = v44[v37.Help], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.Help), 
        shouldOpenInExternalBrowser = true
    }, 
    [v37.About_AboutUs] = {
        itemType = v37.About_AboutUs, 
        textKey = v44[v37.About_AboutUs], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.About_AboutUs, nil, true), 
        shouldOpenInExternalBrowser = true
    }, 
    [v37.About_AboutUs_CJV] = {
        itemType = v37.About_AboutUs_CJV, 
        textKey = v44[v37.About_AboutUs], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.About_AboutUs_CJV)
    }, 
    [v37.About_Careers] = {
        itemType = v37.About_Careers, 
        textKey = v44[v37.About_Careers], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.About_Careers, nil, true), 
        shouldOpenInExternalBrowser = true
    }, 
    [v37.About_Parents] = {
        itemType = v37.About_Parents, 
        textKey = v44[v37.About_Parents], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.About_Parents, nil, true), 
        shouldOpenInExternalBrowser = true
    }, 
    [v37.About_Terms] = {
        itemType = v37.About_Terms, 
        textKey = v44[v37.About_Terms], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.About_Terms, nil, true), 
        shouldOpenInExternalBrowser = true, 
        urlGenerator = v20() and function(_, v56) --[[ Line: 636 ]]
            -- upvalues: v46 (copy), v37 (copy)
            local v57 = nil;
            if v56 then
                v57 = v56.getTermsOfUseLink();
            end;
            if v57 == nil or v57 == "" then
                v57 = v46[v37.About_Terms];
            end;
            return v57;
        end or nil
    }, 
    [v37.About_Privacy] = {
        itemType = v37.About_Privacy, 
        textKey = v44[v37.About_Privacy], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.About_Privacy, nil, true), 
        shouldOpenInExternalBrowser = true, 
        urlGenerator = v20() and function(_, v59) --[[ Line: 656 ]]
            -- upvalues: v46 (copy), v37 (copy)
            local v60 = nil;
            if v59 then
                v60 = v59.getPrivacyPolicyLink();
            end;
            if v60 == nil or v60 == "" then
                v60 = v46[v37.About_Privacy];
            end;
            return v60;
        end or nil
    }, 
    [v37.About_PrivacyGuidelinesChildren] = {
        itemType = v37.About_PrivacyGuidelinesChildren, 
        textKey = v44[v37.About_PrivacyGuidelinesChildren], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.About_PrivacyGuidelinesChildren)
    }, 
    [v37.About_LuobuRiderTerms] = {
        itemType = v37.About_LuobuRiderTerms, 
        textKey = v44[v37.About_LuobuRiderTerms], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.About_LuobuRiderTerms)
    }, 
    [v37.About_LuobuThirdPartyDataUse] = {
        itemType = v37.About_LuobuThirdPartyDataUse, 
        textKey = v44[v37.About_LuobuThirdPartyDataUse], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.About_LuobuThirdPartyDataUse)
    }, 
    [v37.About_AppInformation] = {
        itemType = v37.About_AppInformation, 
        textKey = v44[v37.About_AppInformation], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v7.AppInformation
        }
    }, 
    [v37.About_VersionSection] = {
        itemType = v37.About_VersionSection, 
        textKey = v44[v37.About_VersionSection]
    }, 
    [v37.Settings_AccountInfo] = {
        itemType = v37.Settings_AccountInfo, 
        textKey = v44[v37.Settings_AccountInfo], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeComponent = v11, 
        badgeCount = 0, 
        context = if v18 then v50(v37.Settings_AccountInfo, v7.AccountInfo) else v50(v37.Settings_AccountInfo, v7.SettingsSubPage)
    }, 
    [v37.Settings_Security] = {
        itemType = v37.Settings_Security, 
        textKey = v44[v37.Settings_Security], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.Settings_Security, v7.SettingsSubPage)
    }, 
    [v37.Settings_Privacy] = {
        itemType = v37.Settings_Privacy, 
        textKey = v44[v37.Settings_Privacy], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.Settings_Privacy, v7.SettingsSubPage)
    }, 
    [v37.Settings_ParentalControls] = {
        itemType = v37.Settings_ParentalControls, 
        textKey = v44[v37.Settings_ParentalControls], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.Settings_ParentalControls, v7.SettingsSubPage)
    }, 
    [v37.Settings_Billing] = {
        itemType = v37.Settings_Billing, 
        textKey = v44[v37.Settings_Billing], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.Settings_Billing, v7.SettingsSubPage)
    }, 
    [v37.Settings_Subscriptions] = {
        itemType = v37.Settings_Subscriptions, 
        textKey = v44[v37.Settings_Subscriptions], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.Settings_Subscriptions, v7.SettingsSubPage)
    }, 
    [v37.Settings_Notifications] = {
        itemType = v37.Settings_Notifications, 
        textKey = v44[v37.Settings_Notifications], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v50(v37.Settings_Notifications, v7.SettingsSubPage)
    }, 
    [v37.Settings_Accessibility] = {
        itemType = v37.Settings_Accessibility, 
        textKey = v44[v37.Settings_Accessibility], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v7.Accessibility
        }
    }, 
    [v37.Settings_Tencent_Reputation] = {
        itemType = v37.Settings_Tencent_Reputation, 
        textKey = v44[v37.Settings_Tencent_Reputation], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v3.Dictionary.join({
            notificationType = v12.SDK_OPEN_URL
        }, (v50(v37.Settings_Tencent_Reputation, v7.SettingsSubPage)))
    }, 
    [v37.Settings_SwitchProfileSection] = {
        itemType = v37.Settings_SwitchProfileSection, 
        textKey = v44[v37.Settings_SwitchProfileSection]
    }, 
    [v37.Settings_AccountSettingsSection] = {
        itemType = v37.Settings_AccountSettingsSection, 
        textKey = v44[v37.Settings_AccountSettingsSection]
    }, 
    [v37.Settings_AccountSettingsInfo] = {
        itemType = v37.Settings_AccountSettingsInfo
    }, 
    [v37.Settings_DeviceSettingsSection] = {
        itemType = v37.Settings_DeviceSettingsSection
    }, 
    [v37.About_AboutSection] = {
        itemType = v37.About_AboutSection, 
        textKey = v44[v37.About_AboutSection]
    }, 
    [v37.About_TermsOfService] = {
        itemType = v37.About_TermsOfService, 
        textKey = v44[v37.About_TermsOfService], 
        rightImage = l_Images_0["icons/navigation/externallink_medium"], 
        context = {
            url = v46[v37.About_Terms]
        }
    }, 
    [v37.About_LicensingSection] = {
        itemType = v37.About_LicensingSection, 
        textKey = v44[v37.About_LicensingSection]
    }
};
v37.Learn = "Learn";
v44[v37.Learn] = "CommonUI.Features.Label.Learn";
v45[v37.Learn] = l_Images_0["icons/menu/education"];
v61[v37.Learn] = {
    itemType = v37.Learn, 
    textKey = v44[v37.Learn], 
    icon = v45[v37.Learn], 
    rightImage = "LuaApp/icons/navigation/pushRight_small", 
    badgeCount = 0, 
    context = {
        appURI = v29
    }
};
if l_FFlagEnableBlackbird_0 and l_FFlagEnableBlackbirdOnMorePage_0 then
    v37.Blackbird = "Blackbird";
    v44[v37.Blackbird] = "CommonUI.Features.Label.X";
    v45[v37.Blackbird] = l_Images_0["icons/status/oof_xlarge"];
    v46[v37.Blackbird] = if l_GetFStringBlackbirdUrl_0() ~= "" then v9.fromString(l_GetFStringBlackbirdUrl_0())() else nil;
    v61[v37.Blackbird] = {
        itemType = v37.Blackbird, 
        textKey = v44[v37.Blackbird], 
        icon = v45[v37.Blackbird], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v7.Blackbird
        }
    };
end;
if v25 then
    v37.RM = "RM";
    v44[v37.RM] = "CommonUI.Features.Label.RM";
    v45[v37.RM] = l_Images_0["icons/brands/moments_large"];
    v61[v37.RM] = {
        itemType = v37.RM, 
        textKey = v44[v37.RM], 
        icon = v45[v37.RM], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            appURI = v30
        }
    };
end;
local function v63(v62) --[[ Line: 858 ]]
    -- upvalues: v31 (copy)
    if v31 then
        return v62 and type(v62) == "table";
    else
        return v62 ~= false;
    end;
end;
return {
    ItemType = v37, 
    ItemInfo = v61, 
    SectionType = v38, 
    GetItemsInPage = function(v64, _, _, v67, v68, _, _, _, _, _) --[[ Line: 870 ]] --[[ Name: GetItemsInPage ]]
        -- upvalues: v17 (copy), l_GetFFlagEnableGateNotificationPreferencesTab_0 (copy), v7 (copy), v38 (copy), v61 (copy), v37 (copy), v3 (copy), v31 (copy), v63 (copy), l_Images_0 (copy)
        if v17 then
            v68 = true;
        end;
        local v74 = not l_GetFFlagEnableGateNotificationPreferencesTab_0() or type(v67) == "table" and v67.enableNotificationPreferencesTab;
        local v75 = false;
        if type(v67) == "table" and v67.hideBillingTab ~= nil then
            v75 = v67.hideBillingTab;
        end;
        local v76 = {
            [v7.SimplifiedMore] = {
                {
                    type = v38.Navigation, 
                    contents = {
                        v61[v37.About_Terms]
                    }
                }, 
                {
                    type = v38.Action, 
                    contents = {
                        v61[v37.LogOut]
                    }
                }
            }, 
            [v7.About] = {
                {
                    type = v38.Navigation, 
                    contents = v3.List.filter({
                        v61[v37.About_AboutUs], 
                        if v31 then v61[v37.Blog] else false, 
                        if v31 then v61[v37.CreateGames] else false, 
                        v61[v37.About_Careers], 
                        v61[v37.About_Parents], 
                        if v31 then nil else v61[v37.About_Terms], 
                        if v31 then nil else v61[v37.About_Privacy], 
                        v61[v37.About_AppInformation]
                    }, v63)
                }
            }, 
            [v7.SafetySupport] = {
                {
                    type = v38.Navigation, 
                    contents = if v31 then v3.List.filter({
                        v61[v37.SafetySupport_Help], 
                        v61[v37.SafetySupport_ReportAppeals], 
                        v61[v37.About], 
                        v61[v37.About_Terms], 
                        v61[v37.About_Privacy]
                    }, v63) else {
                        v61[v37.SafetySupport_Help], 
                        v61[v37.SafetySupport_ReportAppeals]
                    }
                }
            }, 
            [v7.CJVAbout] = {
                {
                    type = v38.Navigation, 
                    contents = v3.List.filter({
                        v61[v37.About_AboutUs_CJV], 
                        v61[v37.About_Careers], 
                        v61[v37.About_Terms], 
                        v61[v37.About_Privacy], 
                        v61[v37.About_PrivacyGuidelinesChildren], 
                        v61[v37.About_LuobuRiderTerms], 
                        v61[v37.About_LuobuThirdPartyDataUse], 
                        v61[v37.About_AppInformation]
                    }, v63)
                }
            }, 
            [v7.Settings] = {
                {
                    type = v38.Navigation, 
                    contents = v3.List.filter({
                        v61[v37.Settings_AccountInfo], 
                        v61[v37.Settings_Security], 
                        v61[v37.Settings_Privacy], 
                        v68 and v61[v37.Settings_ParentalControls] or false, 
                        not v75 and (v61[v37.Settings_Billing] or false), 
                        v61[v37.Settings_Subscriptions], 
                        v74 and v61[v37.Settings_Notifications] or false, 
                        v61[v37.Settings_Accessibility]
                    }, v63)
                }
            }, 
            [v7.CJVSettings] = {
                {
                    type = v38.Navigation, 
                    contents = v3.List.filter({
                        v61[v37.Settings_AccountInfo], 
                        v61[v37.Settings_Security], 
                        v61[v37.Settings_Privacy], 
                        false
                    }, v63)
                }
            }, 
            [v7.TenFootSettings] = {
                {
                    type = v38.Content, 
                    contents = {
                        {
                            itemInfo = v61[v37.Settings_SwitchProfileSection]
                        }, 
                        {
                            itemInfo = v61[v37.Settings_AccountSettingsSection], 
                            subItems = {
                                v61[v37.Settings_AccountSettingsInfo]
                            }
                        }, 
                        {
                            itemInfo = v61[v37.Settings_DeviceSettingsSection]
                        }
                    }
                }
            }, 
            [v7.TenFootAbout] = {
                {
                    type = v38.Content, 
                    contents = {
                        {
                            itemInfo = v61[v37.About_AboutSection], 
                            subItems = {
                                v61[v37.About_TermsOfService], 
                                v3.Dictionary.join(v61[v37.About_Privacy], {
                                    rightImage = l_Images_0["icons/navigation/externallink_medium"]
                                })
                            }
                        }, 
                        {
                            itemInfo = v61[v37.About_LicensingSection]
                        }, 
                        {
                            itemInfo = v61[v37.About_VersionSection]
                        }
                    }
                }
            }
        };
        local v77 = v76[v7.SimplifiedMore];
        if v76[v64] ~= nil then
            v77 = v76[v64];
        end;
        return v77;
    end
};