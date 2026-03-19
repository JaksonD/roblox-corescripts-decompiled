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
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local l_CommunityListExperimentation_0 = require(l_CorePackages_0.Workspace.Packages.Groups).Experiments.CommunityListExperimentation;
local v36 = {
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
local v37 = {
    Content = "Content", 
    Navigation = "Navigation", 
    Action = "Action"
};
local v38 = {
    Catalog = "Catalog", 
    Games = "Games", 
    Groups = "Groups", 
    Library = "Library", 
    Players = "Players"
};
local v39 = l_getAppChatCommunitiesVisualConfig_0();
local v40 = string.lower(l_UserInputService_0:GetPlatform().Name);
local v41 = l_getAppFeaturePolicies_0().getGiftCardSourceRefOverride();
local v42 = if v41 ~= "" then v41 else v40;
local v43 = {
    [v36.VRFTUX] = "CommonUI.Features.Label.VRFTUX", 
    [v36.Catalog] = "Feature.Avatar.Action.Marketplace", 
    [v36.BuildersClub] = "CommonUI.Features.Label.Premium", 
    [v36.DevSubs] = "CommonUI.Features.Label.DevSubs", 
    [v36.Trades] = "CommonUI.Features.Label.Trades", 
    [v36.Profile] = "CommonUI.Features.Label.Profile", 
    [v36.TencentHelp] = "CommonUI.Features.Label.Help", 
    [v36.TencentNoticeCenter] = "CommonUI.Features.Label.TencentNotice", 
    [v36.Friends] = "CommonUI.Features.Label.Connections", 
    [v36.Groups] = if l_getFFlagCommunitiesUseVisualConfigUtil_0() then v39.label else l_GetFFlagUseCommunitiesTranslation_0() and "CommonUI.Features.Label.Groups" or "CommonUI.Features.Label.sGroups", 
    [v36.Inventory] = "CommonUI.Features.Label.Inventory", 
    [v36.Messages] = "CommonUI.Features.Label.Messages", 
    [v36.CreateGames] = "CommonUI.Features.Label.CreateGames", 
    [v36.TheHunt] = "CommonUI.Features.Label.TheHunt", 
    [v36.Blog] = "CommonUI.Features.Label.Blog", 
    [v36.GiftCards] = "CommonUI.Features.Label.GiftCards", 
    [v36.Redeem] = "CommonUI.Features.Label.Redeem", 
    [v36.OfficialStore] = "CommonUI.Features.Label.OfficialStore", 
    [v36.Settings] = "CommonUI.Features.Label.Settings", 
    [v36.AdjustScreen] = "CommonUI.Features.Label.AdjustScreen", 
    [v36.About] = "CommonUI.Features.Label.About", 
    [v36.SafetySupport] = "CommonUI.Features.Label.HelpAndSafety", 
    [v36.SafetySupport_ReportAppeals] = "Feature.AppealsPortal.Label.ReportAndAppeals", 
    [v36.Help] = "CommonUI.Features.Label.Help", 
    [v36.LoginCode] = "Authentication.CrossDevice.Heading.QuickLogin", 
    [v36.LogOut] = "Application.Logout.Action.Logout", 
    [v36.ReportLogs] = "CommonUI.Features.Label.ReportLogs", 
    [v36.About_AboutUs] = "CommonUI.Features.Label.AboutUs", 
    [v36.About_AboutUs_CJV] = "CommonUI.Features.Label.AboutUs", 
    [v36.About_Careers] = "CommonUI.Features.Label.Careers", 
    [v36.About_Parents] = "CommonUI.Features.Label.Parents", 
    [v36.About_Terms] = "CommonUI.Features.Label.Terms", 
    [v36.About_Privacy] = "CommonUI.Features.Label.Privacy", 
    [v36.About_PrivacyGuidelinesChildren] = "CommonUI.Features.Label.PrivacyGuidelinesChildren", 
    [v36.About_LuobuRiderTerms] = "CommonUI.Features.Label.LuobuRiderTerms", 
    [v36.About_LuobuThirdPartyDataUse] = "CommonUI.Features.Label.LuobuThirdPartyDataUse", 
    [v36.About_AppInformation] = "CommonUI.Features.Label.AppInformation", 
    [v36.About_AboutSection] = "CommonUI.Features.Label.About", 
    [v36.About_TermsOfService] = "CommonUI.Features.Label.TermsOfService", 
    [v36.About_LicensingSection] = "CommonUI.Features.Label.Licensing", 
    [v36.About_VersionSection] = "CommonUI.Features.Label.Version", 
    [v36.Settings_AccountInfo] = v23 and "Feature.AccountSettings.Heading.Tab.AccountInfoV2" or "Feature.AccountSettings.Heading.Tab.AccountInfo", 
    [v36.Settings_Security] = "Feature.AccountSettings.Heading.Tab.Security", 
    [v36.Settings_Privacy] = "Feature.AccountSettings.Heading.Tab.PrivacyContentRestrictions", 
    [v36.Settings_ParentalControls] = v23 and "Feature.AccountSettings.Heading.Tab.ParentalControlsV2" or "Feature.AccountSettings.Heading.Tab.ParentalControls", 
    [v36.Settings_Billing] = l_getAppFeaturePolicies_0().getRenamePaymentsToSpendingTab() and "Feature.AccountSettings.Heading.Tab.Spending" or v23 and "Feature.AccountSettings.Heading.Tab.BillingV2" or "Feature.AccountSettings.Heading.Tab.Billing", 
    [v36.Settings_Subscriptions] = "Feature.AccountSettings.Heading.Tab.Subscriptions", 
    [v36.Settings_Notifications] = "Feature.AccountSettings.Heading.Tab.Notifications", 
    [v36.Settings_Accessibility] = v23 and "Feature.Accessibility.Heading.DevicePreferencesV2" or "Feature.Accessibility.Heading.DevicePreferences", 
    [v36.Settings_Tencent_Reputation] = "Feature.AccountSettings.Label.TencentReputation", 
    [v36.Settings_SwitchProfileSection] = "Feature.Settings.Heading.SwitchProfile", 
    [v36.Settings_AccountSettingsSection] = "Feature.Settings.Heading.AccountSettings"
};
local v44 = {
    [v36.VRFTUX] = l_Images_0["icons/menu/vrheadset_large"], 
    [v36.Catalog] = l_Images_0["icons/menu/shop_large"], 
    [v36.BuildersClub] = l_Images_0["icons/status/premium_large"], 
    [v36.DevSubs] = l_Images_0["icons/status/player/developer"], 
    [v36.Trades] = l_Images_0["icons/menu/trade"], 
    [v36.Profile] = l_Images_0["icons/actions/friend_sort/my_profile"], 
    [v36.TencentHelp] = l_Images_0["icons/menu/help_large"], 
    [v36.TencentNoticeCenter] = l_Images_0["icons/menu/events_large"], 
    [v36.Friends] = l_Images_0["icons/menu/friends_large"], 
    [v36.Groups] = if l_getFFlagCommunitiesUseVisualConfigUtil_0() then l_Images_0[v39.iconLarge] else l_Images_0["icons/menu/groups_large"], 
    [v36.Inventory] = l_Images_0["icons/menu/inventory_large"], 
    [v36.Messages] = l_Images_0["icons/menu/messages_large"], 
    [v36.CreateGames] = l_Images_0["icons/menu/create_large"], 
    [v36.TheHunt] = l_Images_0["icons/menu/events_large"], 
    [v36.Blog] = l_Images_0["icons/menu/blog_large"], 
    [v36.GiftCards] = l_Images_0["icons/menu/giftcard_large"], 
    [v36.Redeem] = l_Images_0["icons/menu/wallet"], 
    [v36.OfficialStore] = l_Images_0["icons/menu/officialstore_large"], 
    [v36.Settings] = l_Images_0["icons/menu/settings_large"], 
    [v36.AdjustScreen] = l_Images_0["icons/menu/adjust/scale"], 
    [v36.About] = l_Images_0["icons/menu/about_large"], 
    [v36.SafetySupport] = l_Images_0["icons/menu/protection"], 
    [v36.Help] = l_Images_0["icons/menu/help_large"], 
    [v36.LoginCode] = l_Images_0["icons/graphic/lock_xxlarge"], 
    [v36.ReportLogs] = l_Images_0["icons/menu/giftcard_large"]
};
local v45 = {
    [v36.Catalog] = v9.static.catalog(), 
    [v36.BuildersClub] = v9.static.buildersClub(), 
    [v36.Trades] = v9.static.trades(), 
    [v36.Profile] = v9.static.profile(), 
    [v36.Friends] = v9.static.friends(), 
    [v36.Groups] = v9.static.groups(), 
    [v36.Inventory] = v9.static.inventory(), 
    [v36.Messages] = v9.static.messages(), 
    [v36.CreateGames] = v10({
        utm_content = "more_page"
    }), 
    [v36.TheHunt] = if l_GetFStringPlatformEventUrl_0() ~= "" then v9.fromString(l_GetFStringPlatformEventUrl_0())() else v9.static.help(), 
    [v36.Blog] = v9.static.blog(), 
    [v36.OfficialStore] = v9.static.amazonStore(), 
    [v36.GiftCards] = v9.static.giftCards(), 
    [v36.GiftCards] = v9.static.giftCards(v42 .. "-" .. v24), 
    [v36.Redeem] = v9.static.redeem(), 
    [v36.Help] = v9.static.help(), 
    [v36.SafetySupport_ReportAppeals] = v9.static.appealsPortal.main({
        source = "app-help-safety"
    }), 
    [v36.About_AboutUs] = v9.static.about.us(), 
    [v36.About_AboutUs_CJV] = v21 ~= "" and v9.fromString(v21)() or v9.static.about.us(), 
    [v36.About_Careers] = v9.static.about.careers(), 
    [v36.About_Parents] = v9.static.about.parents(), 
    [v36.About_Terms] = v9.static.about.terms({
        useGameQQUrls = true
    }), 
    [v36.About_Privacy] = v9.static.about.privacy({
        useGameQQUrls = true
    }), 
    [v36.About_PrivacyGuidelinesChildren] = v9.static.tencent.childrenPrivacyGuide(), 
    [v36.About_LuobuRiderTerms] = v9.static.tencent.luobuRiderTerms(), 
    [v36.About_LuobuThirdPartyDataUse] = v9.static.tencent.luobuThirdPartyDataUse(), 
    [v36.Settings_AccountInfo] = v9.static.settings.account(), 
    [v36.Settings_Security] = v9.static.settings.security(), 
    [v36.Settings_Privacy] = v9.static.settings.privacy(), 
    [v36.Settings_ParentalControls] = v9.static.settings.parentalControls(), 
    [v36.Settings_Billing] = v9.static.settings.billing(), 
    [v36.Settings_Subscriptions] = v9.static.settings.subscriptions(), 
    [v36.Settings_Notifications] = v9.static.settings.notifications(), 
    [v36.Settings_Tencent_Reputation] = v9.static.tencent.reputationInfo()
};
local function v49(v46, v47, v48) --[[ Line: 284 ]]
    -- upvalues: v7 (copy), v43 (copy), v45 (copy)
    if v46 then
        return {
            page = v47 or v7.GenericWebPage, 
            titleKey = v43[v46], 
            url = v45[v46], 
            fallbackToExternalBrowser = v48
        };
    else
        return {};
    end;
end;
local v60 = {
    [v36.VRFTUX] = {
        itemType = v36.VRFTUX, 
        textKey = v43[v36.VRFTUX], 
        icon = v44[v36.VRFTUX], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v7.ExperienceDetail, 
            url = l_VRConstants_0.FTUX.UniverseId
        }
    }, 
    [v36.Catalog] = {
        itemType = v36.Catalog, 
        textKey = v43[v36.Catalog], 
        icon = v44[v36.Catalog], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = l_AvatarScreen_0.Catalog
        }
    }, 
    [v36.BuildersClub] = {
        itemType = v36.BuildersClub, 
        textKey = v43[v36.BuildersClub], 
        icon = v44[v36.BuildersClub], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v7.BuildersClub
        }
    }, 
    [v36.DevSubs] = {
        itemType = v36.DevSubs, 
        textKey = v43[v36.DevSubs], 
        icon = v44[v36.DevSubs], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v7.DevSubs
        }
    }, 
    [v36.Trades] = {
        itemType = v36.Trades, 
        textKey = v43[v36.Trades], 
        icon = v44[v36.Trades], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.Trades)
    }, 
    [v36.Profile] = {
        itemType = v36.Profile, 
        textKey = v43[v36.Profile], 
        icon = v44[v36.Profile], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        urlGenerator = function(v50) --[[ Line: 352 ]] --[[ Name: urlGenerator ]]
            return v50;
        end, 
        context = {
            page = v7.ProfilePlatform
        }
    }, 
    [v36.Friends] = {
        itemType = v36.Friends, 
        textKey = v43[v36.Friends], 
        icon = v44[v36.Friends], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeComponent = v11, 
        badgeCount = 0, 
        urlGenerator = function(v51) --[[ Line: 368 ]] --[[ Name: urlGenerator ]]
            -- upvalues: v9 (copy)
            return v51 and v9.user.friends({
                userId = v51
            }) or nil;
        end, 
        getSearchParams = function() --[[ Line: 371 ]] --[[ Name: getSearchParams ]]
            -- upvalues: v38 (copy)
            return {
                searchType = v38.Players
            };
        end, 
        context = {
            page = if l_FFlagCreateConnectionsHub_0 then v7.CoHubMyConnections else v7.ViewFriends
        }
    }, 
    [v36.Groups] = {
        itemType = v36.Groups, 
        textKey = v43[v36.Groups], 
        icon = v44[v36.Groups], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        getSearchParams = function(v52) --[[ Line: 386 ]] --[[ Name: getSearchParams ]]
            -- upvalues: l_FormFactor_0 (copy), v38 (copy)
            if v52 == l_FormFactor_0.WIDE then
                return {
                    searchType = v38.Groups
                };
            else
                return nil;
            end;
        end, 
        context = if l_GetFFlagEnableCommunityListExperimentation_0() and l_CommunityListExperimentation_0.getCommunityListEnabled() then {
            page = v7.Groups
        } else v49(v36.Groups)
    }, 
    [v36.Inventory] = {
        itemType = v36.Inventory, 
        textKey = v43[v36.Inventory], 
        icon = v44[v36.Inventory], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        urlGenerator = function(v53) --[[ Line: 408 ]] --[[ Name: urlGenerator ]]
            -- upvalues: v9 (copy)
            return v53 and v9.user.inventory({
                userId = v53
            }) or nil;
        end, 
        context = v49(v36.Inventory)
    }, 
    [v36.Messages] = {
        itemType = v36.Messages, 
        textKey = v43[v36.Messages], 
        icon = v44[v36.Messages], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeComponent = v11, 
        badgeCount = 0, 
        context = v49(v36.Messages)
    }, 
    [v36.CreateGames] = {
        itemType = v36.CreateGames, 
        textKey = v43[v36.CreateGames], 
        icon = v44[v36.CreateGames], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.CreateGames), 
        shouldOpenInExternalBrowser = true
    }, 
    [v36.TencentHelp] = {
        itemType = v36.TencentHelp, 
        textKey = v43[v36.Help], 
        icon = v44[v36.Help], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v7.TencentHelp, 
            titleKey = v43[v36.Help]
        }
    }, 
    [v36.TencentNoticeCenter] = {
        itemType = v36.TencentNoticeCenter, 
        textKey = v43[v36.TencentNoticeCenter], 
        icon = v44[v36.TencentNoticeCenter], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v7.TencentNoticeCenter
        }
    }, 
    [v36.TheHunt] = {
        itemType = v36.TheHunt, 
        textKey = v43[v36.TheHunt], 
        icon = v44[v36.TheHunt], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.TheHunt)
    }, 
    [v36.Blog] = {
        itemType = v36.Blog, 
        textKey = v43[v36.Blog], 
        icon = v44[v36.Blog], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.Blog, nil, true)
    }, 
    [v36.GiftCards] = {
        itemType = v36.GiftCards, 
        textKey = v43[v36.GiftCards], 
        icon = v44[v36.GiftCards], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.GiftCards, nil, true), 
        shouldOpenInExternalBrowser = true
    }, 
    [v36.Redeem] = {
        itemType = v36.Redeem, 
        textKey = v43[v36.Redeem], 
        icon = v44[v36.Redeem], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.Redeem)
    }, 
    [v36.OfficialStore] = {
        itemType = v36.OfficialStore, 
        textKey = v43[v36.OfficialStore], 
        icon = v44[v36.OfficialStore], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.OfficialStore, nil, true)
    }, 
    [v36.Settings] = {
        itemType = v36.Settings, 
        textKey = v43[v36.Settings], 
        icon = v44[v36.Settings], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeComponent = v11, 
        badgeCount = 0, 
        context = {
            page = v7.Settings
        }
    }, 
    [v36.AdjustScreen] = {
        itemType = v36.AdjustScreen, 
        textKey = v43[v36.AdjustScreen], 
        icon = v44[v36.AdjustScreen], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v7.AdjustScreen
        }
    }, 
    [v36.About] = {
        itemType = v36.About, 
        textKey = v43[v36.About], 
        icon = v44[v36.About], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v7.About
        }
    }, 
    [v36.SafetySupport] = {
        itemType = v36.SafetySupport, 
        textKey = v43[v36.SafetySupport], 
        icon = v44[v36.SafetySupport], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v7.SafetySupport
        }
    }, 
    [v36.ReportLogs] = {
        itemType = v36.ReportLogs, 
        textKey = v43[v36.ReportLogs], 
        icon = v44[v36.ReportLogs], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {}
    }, 
    [v36.Help] = {
        itemType = v36.Help, 
        textKey = v43[v36.Help], 
        icon = v44[v36.Help], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.Help, nil, true), 
        shouldOpenInExternalBrowser = true
    }, 
    [v36.LoginCode] = {
        itemType = v36.LoginCode, 
        textKey = v43[v36.LoginCode], 
        icon = v44[v36.LoginCode], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v7.CrossDeviceLogin
        }
    }, 
    [v36.LogOut] = {
        itemType = v36.LogOut, 
        textKey = v43[v36.LogOut], 
        textXAlignment = Enum.TextXAlignment.Center, 
        badgeCount = 0, 
        context = {
            page = v7.LogoutConfirmation
        }
    }, 
    [v36.UserInfo] = {
        itemType = v36.UserInfo
    }, 
    [v36.Settings_Cross_Play] = {
        itemType = v36.Settings_Cross_Play
    }, 
    [v36.SafetySupport_ReportAppeals] = {
        itemType = v36.SafetySupport_ReportAppeals, 
        textKey = v43[v36.SafetySupport_ReportAppeals], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.SafetySupport_ReportAppeals)
    }, 
    [v36.SafetySupport_Help] = {
        itemType = v36.SafetySupport_Help, 
        textKey = v43[v36.Help], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.Help), 
        shouldOpenInExternalBrowser = true
    }, 
    [v36.About_AboutUs] = {
        itemType = v36.About_AboutUs, 
        textKey = v43[v36.About_AboutUs], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.About_AboutUs, nil, true), 
        shouldOpenInExternalBrowser = true
    }, 
    [v36.About_AboutUs_CJV] = {
        itemType = v36.About_AboutUs_CJV, 
        textKey = v43[v36.About_AboutUs], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.About_AboutUs_CJV)
    }, 
    [v36.About_Careers] = {
        itemType = v36.About_Careers, 
        textKey = v43[v36.About_Careers], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.About_Careers, nil, true), 
        shouldOpenInExternalBrowser = true
    }, 
    [v36.About_Parents] = {
        itemType = v36.About_Parents, 
        textKey = v43[v36.About_Parents], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.About_Parents, nil, true), 
        shouldOpenInExternalBrowser = true
    }, 
    [v36.About_Terms] = {
        itemType = v36.About_Terms, 
        textKey = v43[v36.About_Terms], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.About_Terms, nil, true), 
        shouldOpenInExternalBrowser = true, 
        urlGenerator = v20() and function(_, v55) --[[ Line: 633 ]]
            -- upvalues: v45 (copy), v36 (copy)
            local v56 = nil;
            if v55 then
                v56 = v55.getTermsOfUseLink();
            end;
            if v56 == nil or v56 == "" then
                v56 = v45[v36.About_Terms];
            end;
            return v56;
        end or nil
    }, 
    [v36.About_Privacy] = {
        itemType = v36.About_Privacy, 
        textKey = v43[v36.About_Privacy], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.About_Privacy, nil, true), 
        shouldOpenInExternalBrowser = true, 
        urlGenerator = v20() and function(_, v58) --[[ Line: 653 ]]
            -- upvalues: v45 (copy), v36 (copy)
            local v59 = nil;
            if v58 then
                v59 = v58.getPrivacyPolicyLink();
            end;
            if v59 == nil or v59 == "" then
                v59 = v45[v36.About_Privacy];
            end;
            return v59;
        end or nil
    }, 
    [v36.About_PrivacyGuidelinesChildren] = {
        itemType = v36.About_PrivacyGuidelinesChildren, 
        textKey = v43[v36.About_PrivacyGuidelinesChildren], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.About_PrivacyGuidelinesChildren)
    }, 
    [v36.About_LuobuRiderTerms] = {
        itemType = v36.About_LuobuRiderTerms, 
        textKey = v43[v36.About_LuobuRiderTerms], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.About_LuobuRiderTerms)
    }, 
    [v36.About_LuobuThirdPartyDataUse] = {
        itemType = v36.About_LuobuThirdPartyDataUse, 
        textKey = v43[v36.About_LuobuThirdPartyDataUse], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.About_LuobuThirdPartyDataUse)
    }, 
    [v36.About_AppInformation] = {
        itemType = v36.About_AppInformation, 
        textKey = v43[v36.About_AppInformation], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v7.AppInformation
        }
    }, 
    [v36.About_VersionSection] = {
        itemType = v36.About_VersionSection, 
        textKey = v43[v36.About_VersionSection]
    }, 
    [v36.Settings_AccountInfo] = {
        itemType = v36.Settings_AccountInfo, 
        textKey = v43[v36.Settings_AccountInfo], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeComponent = v11, 
        badgeCount = 0, 
        context = if v18 then v49(v36.Settings_AccountInfo, v7.AccountInfo) else v49(v36.Settings_AccountInfo, v7.SettingsSubPage)
    }, 
    [v36.Settings_Security] = {
        itemType = v36.Settings_Security, 
        textKey = v43[v36.Settings_Security], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.Settings_Security, v7.SettingsSubPage)
    }, 
    [v36.Settings_Privacy] = {
        itemType = v36.Settings_Privacy, 
        textKey = v43[v36.Settings_Privacy], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.Settings_Privacy, v7.SettingsSubPage)
    }, 
    [v36.Settings_ParentalControls] = {
        itemType = v36.Settings_ParentalControls, 
        textKey = v43[v36.Settings_ParentalControls], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.Settings_ParentalControls, v7.SettingsSubPage)
    }, 
    [v36.Settings_Billing] = {
        itemType = v36.Settings_Billing, 
        textKey = v43[v36.Settings_Billing], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.Settings_Billing, v7.SettingsSubPage)
    }, 
    [v36.Settings_Subscriptions] = {
        itemType = v36.Settings_Subscriptions, 
        textKey = v43[v36.Settings_Subscriptions], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.Settings_Subscriptions, v7.SettingsSubPage)
    }, 
    [v36.Settings_Notifications] = {
        itemType = v36.Settings_Notifications, 
        textKey = v43[v36.Settings_Notifications], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v49(v36.Settings_Notifications, v7.SettingsSubPage)
    }, 
    [v36.Settings_Accessibility] = {
        itemType = v36.Settings_Accessibility, 
        textKey = v43[v36.Settings_Accessibility], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v7.Accessibility
        }
    }, 
    [v36.Settings_Tencent_Reputation] = {
        itemType = v36.Settings_Tencent_Reputation, 
        textKey = v43[v36.Settings_Tencent_Reputation], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v3.Dictionary.join({
            notificationType = v12.SDK_OPEN_URL
        }, (v49(v36.Settings_Tencent_Reputation, v7.SettingsSubPage)))
    }, 
    [v36.Settings_SwitchProfileSection] = {
        itemType = v36.Settings_SwitchProfileSection, 
        textKey = v43[v36.Settings_SwitchProfileSection]
    }, 
    [v36.Settings_AccountSettingsSection] = {
        itemType = v36.Settings_AccountSettingsSection, 
        textKey = v43[v36.Settings_AccountSettingsSection]
    }, 
    [v36.Settings_AccountSettingsInfo] = {
        itemType = v36.Settings_AccountSettingsInfo
    }, 
    [v36.Settings_DeviceSettingsSection] = {
        itemType = v36.Settings_DeviceSettingsSection
    }, 
    [v36.About_AboutSection] = {
        itemType = v36.About_AboutSection, 
        textKey = v43[v36.About_AboutSection]
    }, 
    [v36.About_TermsOfService] = {
        itemType = v36.About_TermsOfService, 
        textKey = v43[v36.About_TermsOfService], 
        rightImage = l_Images_0["icons/navigation/externallink_medium"], 
        context = {
            url = v45[v36.About_Terms]
        }
    }, 
    [v36.About_LicensingSection] = {
        itemType = v36.About_LicensingSection, 
        textKey = v43[v36.About_LicensingSection]
    }
};
v36.Learn = "Learn";
v43[v36.Learn] = "CommonUI.Features.Label.Learn";
v44[v36.Learn] = l_Images_0["icons/menu/education"];
v60[v36.Learn] = {
    itemType = v36.Learn, 
    textKey = v43[v36.Learn], 
    icon = v44[v36.Learn], 
    rightImage = "LuaApp/icons/navigation/pushRight_small", 
    badgeCount = 0, 
    context = {
        appURI = v29
    }
};
if l_FFlagEnableBlackbird_0 and l_FFlagEnableBlackbirdOnMorePage_0 then
    v36.Blackbird = "Blackbird";
    v43[v36.Blackbird] = "CommonUI.Features.Label.X";
    v44[v36.Blackbird] = l_Images_0["icons/status/oof_xlarge"];
    v45[v36.Blackbird] = if l_GetFStringBlackbirdUrl_0() ~= "" then v9.fromString(l_GetFStringBlackbirdUrl_0())() else nil;
    v60[v36.Blackbird] = {
        itemType = v36.Blackbird, 
        textKey = v43[v36.Blackbird], 
        icon = v44[v36.Blackbird], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v7.Blackbird
        }
    };
end;
if v25 then
    v36.RM = "RM";
    v43[v36.RM] = "CommonUI.Features.Label.RM";
    v44[v36.RM] = l_Images_0["icons/brands/moments_large"];
    v60[v36.RM] = {
        itemType = v36.RM, 
        textKey = v43[v36.RM], 
        icon = v44[v36.RM], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            appURI = v30
        }
    };
end;
local function v62(v61) --[[ Line: 855 ]]
    -- upvalues: v31 (copy)
    if v31 then
        return v61 and type(v61) == "table";
    else
        return v61 ~= false;
    end;
end;
return {
    ItemType = v36, 
    ItemInfo = v60, 
    SectionType = v37, 
    GetItemsInPage = function(v63, _, _, v66, v67, _, _, _, _, _) --[[ Line: 867 ]] --[[ Name: GetItemsInPage ]]
        -- upvalues: v17 (copy), l_GetFFlagEnableGateNotificationPreferencesTab_0 (copy), v7 (copy), v37 (copy), v60 (copy), v36 (copy), v3 (copy), v31 (copy), v62 (copy), l_Images_0 (copy)
        if v17 then
            v67 = true;
        end;
        local v73 = not l_GetFFlagEnableGateNotificationPreferencesTab_0() or type(v66) == "table" and v66.enableNotificationPreferencesTab;
        local v74 = false;
        if type(v66) == "table" and v66.hideBillingTab ~= nil then
            v74 = v66.hideBillingTab;
        end;
        local v75 = {
            [v7.SimplifiedMore] = {
                {
                    type = v37.Navigation, 
                    contents = {
                        v60[v36.About_Terms]
                    }
                }, 
                {
                    type = v37.Action, 
                    contents = {
                        v60[v36.LogOut]
                    }
                }
            }, 
            [v7.About] = {
                {
                    type = v37.Navigation, 
                    contents = v3.List.filter({
                        v60[v36.About_AboutUs], 
                        if v31 then v60[v36.Blog] else false, 
                        if v31 then v60[v36.CreateGames] else false, 
                        v60[v36.About_Careers], 
                        v60[v36.About_Parents], 
                        if v31 then nil else v60[v36.About_Terms], 
                        if v31 then nil else v60[v36.About_Privacy], 
                        v60[v36.About_AppInformation]
                    }, v62)
                }
            }, 
            [v7.SafetySupport] = {
                {
                    type = v37.Navigation, 
                    contents = if v31 then v3.List.filter({
                        v60[v36.SafetySupport_Help], 
                        v60[v36.SafetySupport_ReportAppeals], 
                        v60[v36.About], 
                        v60[v36.About_Terms], 
                        v60[v36.About_Privacy]
                    }, v62) else {
                        v60[v36.SafetySupport_Help], 
                        v60[v36.SafetySupport_ReportAppeals]
                    }
                }
            }, 
            [v7.CJVAbout] = {
                {
                    type = v37.Navigation, 
                    contents = v3.List.filter({
                        v60[v36.About_AboutUs_CJV], 
                        v60[v36.About_Careers], 
                        v60[v36.About_Terms], 
                        v60[v36.About_Privacy], 
                        v60[v36.About_PrivacyGuidelinesChildren], 
                        v60[v36.About_LuobuRiderTerms], 
                        v60[v36.About_LuobuThirdPartyDataUse], 
                        v60[v36.About_AppInformation]
                    }, v62)
                }
            }, 
            [v7.Settings] = {
                {
                    type = v37.Navigation, 
                    contents = v3.List.filter({
                        v60[v36.Settings_AccountInfo], 
                        v60[v36.Settings_Security], 
                        v60[v36.Settings_Privacy], 
                        v67 and v60[v36.Settings_ParentalControls] or false, 
                        not v74 and (v60[v36.Settings_Billing] or false), 
                        v60[v36.Settings_Subscriptions], 
                        v73 and v60[v36.Settings_Notifications] or false, 
                        v60[v36.Settings_Accessibility]
                    }, v62)
                }
            }, 
            [v7.CJVSettings] = {
                {
                    type = v37.Navigation, 
                    contents = v3.List.filter({
                        v60[v36.Settings_AccountInfo], 
                        v60[v36.Settings_Security], 
                        v60[v36.Settings_Privacy], 
                        false
                    }, v62)
                }
            }, 
            [v7.TenFootSettings] = {
                {
                    type = v37.Content, 
                    contents = {
                        {
                            itemInfo = v60[v36.Settings_SwitchProfileSection]
                        }, 
                        {
                            itemInfo = v60[v36.Settings_AccountSettingsSection], 
                            subItems = {
                                v60[v36.Settings_AccountSettingsInfo]
                            }
                        }, 
                        {
                            itemInfo = v60[v36.Settings_DeviceSettingsSection]
                        }
                    }
                }
            }, 
            [v7.TenFootAbout] = {
                {
                    type = v37.Content, 
                    contents = {
                        {
                            itemInfo = v60[v36.About_AboutSection], 
                            subItems = {
                                v60[v36.About_TermsOfService], 
                                v3.Dictionary.join(v60[v36.About_Privacy], {
                                    rightImage = l_Images_0["icons/navigation/externallink_medium"]
                                })
                            }
                        }, 
                        {
                            itemInfo = v60[v36.About_LicensingSection]
                        }, 
                        {
                            itemInfo = v60[v36.About_VersionSection]
                        }
                    }
                }
            }
        };
        local v76 = v75[v7.SimplifiedMore];
        if v75[v63] ~= nil then
            v76 = v75[v63];
        end;
        return v76;
    end
};