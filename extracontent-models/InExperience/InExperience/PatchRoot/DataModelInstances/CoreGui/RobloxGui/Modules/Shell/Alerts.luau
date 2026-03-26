local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Shell_0 = l_CoreGui_0:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_FFlagAppShellMigrateLocales_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAppShellMigrateLocales;
return {
    Default = {
        Title = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.AlertOccurredTitle") else l_LocalizedStrings_0:LocalizedString("AlertOccurredTitle"), 
        Msg = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.DefaultAlertPhrase") else l_LocalizedStrings_0:LocalizedString("DefaultAlertPhrase"), 
        Id = 0
    }, 
    UnlockedUGC = {
        Title = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.UnlockedUGCTitle") else l_LocalizedStrings_0:LocalizedString("UnlockedUGCTitle"), 
        Msg = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.UnlockedUGCPhrase") else l_LocalizedStrings_0:LocalizedString("UnlockedUGCPhrase"), 
        Id = 101
    }, 
    LostConnection = {
        Controller = {
            Title = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ControllerLostConnectionTitle") else l_LocalizedStrings_0:LocalizedString("ControllerLostConnectionTitle"), 
            Msg = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ControllerLostConnectionPhrase") else l_LocalizedStrings_0:LocalizedString("ControllerLostConnectionPhrase"), 
            Id = 201
        }, 
        ActiveUser = {
            Title = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ActiveUserLostConnectionTitle") else l_LocalizedStrings_0:LocalizedString("ActiveUserLostConnectionTitle"), 
            Msg = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ActiveUserLostConnectionPhrase") else l_LocalizedStrings_0:LocalizedString("ActiveUserLostConnectionPhrase"), 
            Id = 202
        }
    }, 
    PlayMyPlaceMoreGames = {
        Title = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.PlayMyPlaceMoreGamesTitle") else l_LocalizedStrings_0:LocalizedString("PlayMyPlaceMoreGamesTitle"), 
        Msg = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.PlayMyPlaceMoreGamesPhrase") else l_LocalizedStrings_0:LocalizedString("PlayMyPlaceMoreGamesPhrase"), 
        Id = 301
    }, 
    CrossPlatformPlayWelcome = {
        Title = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.CPPWelcomeTitle") else l_LocalizedStrings_0:LocalizedString("CPPWelcomeTitle"), 
        Msg = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.CPPWelcomePhrase") else l_LocalizedStrings_0:LocalizedString("CPPWelcomePhrase"), 
        Id = 401
    }, 
    Reauthentication = {
        [0] = {
            Title = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.AlertOccurredTitle") else l_LocalizedStrings_0:LocalizedString("AlertOccurredTitle"), 
            Msg = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthUnknownPhrase") else l_LocalizedStrings_0:LocalizedString("ReauthUnknownPhrase"), 
            Id = 1001
        }, 
        [1] = {
            Title = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthSignedOutTitle") else l_LocalizedStrings_0:LocalizedString("ReauthSignedOutTitle"), 
            Msg = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthSignedOutPhrase") else l_LocalizedStrings_0:LocalizedString("ReauthSignedOutPhrase"), 
            Id = 1002
        }, 
        [2] = {
            Title = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthRemovedTitle") else l_LocalizedStrings_0:LocalizedString("ReauthRemovedTitle"), 
            Msg = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthRemovedPhrase") else l_LocalizedStrings_0:LocalizedString("ReauthRemovedPhrase"), 
            Id = 1003
        }, 
        [3] = {
            Title = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthSignedOutTitle") else l_LocalizedStrings_0:LocalizedString("ReauthSignedOutTitle"), 
            Msg = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthInvalidSessionPhrase") else l_LocalizedStrings_0:LocalizedString("ReauthInvalidSessionPhrase"), 
            Id = 1004
        }, 
        [4] = {
            Title = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthUnlinkTitle") else l_LocalizedStrings_0:LocalizedString("ReauthUnlinkTitle"), 
            Msg = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthUnlinkPhrase") else l_LocalizedStrings_0:LocalizedString("ReauthUnlinkPhrase"), 
            Id = 1005
        }, 
        [5] = {
            Title = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthRemovedTitle") else l_LocalizedStrings_0:LocalizedString("ReauthRemovedTitle"), 
            Msg = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthRemovedPhrase") else l_LocalizedStrings_0:LocalizedString("ReauthRemovedPhrase"), 
            Id = 1006
        }, 
        [6] = {
            Title = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthRemovedTitle") else l_LocalizedStrings_0:LocalizedString("ReauthRemovedTitle"), 
            Msg = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthRemovedPhrase") else l_LocalizedStrings_0:LocalizedString("ReauthRemovedPhrase"), 
            Id = 1007
        }, 
        [7] = {
            Title = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthRemovedTitle") else l_LocalizedStrings_0:LocalizedString("ReauthRemovedTitle"), 
            Msg = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthRemovedPhrase") else l_LocalizedStrings_0:LocalizedString("ReauthRemovedPhrase"), 
            Id = 1008
        }
    }, 
    SignOut = {
        [0] = {
            Title = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.AlertOccurredTitle") else l_LocalizedStrings_0:LocalizedString("AlertOccurredTitle"), 
            Msg = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthUnknownPhrase") else l_LocalizedStrings_0:LocalizedString("ReauthUnknownPhrase"), 
            Id = 1001
        }, 
        [1] = {
            Title = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthSignedOutTitle") else l_LocalizedStrings_0:LocalizedString("ReauthSignedOutTitle"), 
            Msg = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthSignedOutPhrase") else l_LocalizedStrings_0:LocalizedString("ReauthSignedOutPhrase"), 
            Id = 1002
        }, 
        [2] = {
            Title = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthSignedOutTitle") else l_LocalizedStrings_0:LocalizedString("ReauthSignedOutTitle"), 
            Msg = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthInvalidSessionPhrase") else l_LocalizedStrings_0:LocalizedString("ReauthInvalidSessionPhrase"), 
            Id = 1003
        }, 
        [3] = {
            Title = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthUnlinkTitle") else l_LocalizedStrings_0:LocalizedString("ReauthUnlinkTitle"), 
            Msg = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthUnlinkPhrase") else l_LocalizedStrings_0:LocalizedString("ReauthUnlinkPhrase"), 
            Id = 1004
        }, 
        [4] = {
            Title = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthRemovedTitle") else l_LocalizedStrings_0:LocalizedString("ReauthRemovedTitle"), 
            Msg = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthRemovedPhrase") else l_LocalizedStrings_0:LocalizedString("ReauthRemovedPhrase"), 
            Id = 1005
        }, 
        [5] = {
            Title = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthRemovedTitle") else l_LocalizedStrings_0:LocalizedString("ReauthRemovedTitle"), 
            Msg = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthRemovedPhrase") else l_LocalizedStrings_0:LocalizedString("ReauthRemovedPhrase"), 
            Id = 1006
        }, 
        [6] = nil, 
        [7] = {
            Title = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthMaintenanceTitle") else l_LocalizedStrings_0:LocalizedString("ReauthMaintenanceTitle"), 
            Msg = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.ReauthMaintenancePhrase") else l_LocalizedStrings_0:LocalizedString("ReauthMaintenancePhrase"), 
            Id = 1007
        }
    }, 
    PlatformLink = {
        Title = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.PlatformLinkInfoTitle") else l_LocalizedStrings_0:LocalizedString("PlatformLinkInfoTitle"), 
        Msg = if l_FFlagAppShellMigrateLocales_0 then l_LocalizedStrings_0:LocStringUA("Xbox.Old.PlatformLinkInfoMessage") else l_LocalizedStrings_0:LocalizedString("PlatformLinkInfoMessage"), 
        Id = 1201
    }
};