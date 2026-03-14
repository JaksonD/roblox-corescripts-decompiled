local l_Parent_0 = script:FindFirstAncestor("FlyoutSidePanel").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.BuilderIcons);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v5 = require(script.Parent.Parent.Constants);
local l_FAVORITES_URI_0 = v5.FAVORITES_URI;
local l_CONTINUE_PLAYING_URI_0 = v5.CONTINUE_PLAYING_URI;
local v8 = require(l_Parent_0.SharedFlags);
local l_GetFStringPlatformEventUrl_0 = v8.GetFStringPlatformEventUrl;
local v10 = game:DefineFastString("FlyoutMomentsPlaceURI", "roblox://experiences/start?placeId=119524072047648");
local v11 = game:DefineFastString("FlyoutLearnPlaceURI", "roblox://experiences/start?placeId=92498145666402");
local l_FFlagCreateConnectionsHub_0 = v8.FFlagCreateConnectionsHub;
local l_FFlagEnableBlackbird_0 = v8.FFlagEnableBlackbird;
local l_FFlagEnableBlackbirdOnFlyoutMenu_0 = v8.FFlagEnableBlackbirdOnFlyoutMenu;
local v15 = {
    Favorites = "Favorites", 
    ContinuePlaying = "ContinuePlaying", 
    Inventory = "Inventory", 
    Connections = "Connections", 
    Communities = "Communities", 
    Messages = "Messages", 
    Settings = "Settings", 
    HelpAndSafety = "HelpAndSafety", 
    Moments = "Moments", 
    Charts = "Charts", 
    Learn = "Learn", 
    Premium = "Premium", 
    GiftCards = "GiftCards", 
    Redeem = "Redeem", 
    Events = "Events", 
    RobuxPill = "RobuxPill", 
    QuickSignin = "QuickSignin", 
    ReportLogs = "ReportLogs", 
    Profile = "Profile"
};
local v16 = {
    [v15.Premium] = "BuildersClub", 
    [v15.Connections] = "Friends", 
    [v15.Moments] = "RM", 
    [v15.Communities] = "Groups", 
    [v15.HelpAndSafety] = "SafetySupport", 
    [v15.Events] = "TheHunt", 
    [v15.QuickSignin] = "Login Code"
};
local v17 = {
    [v15.Favorites] = "Feature.Catalog.Label.Favorites", 
    [v15.ContinuePlaying] = "Feature.FlyoutSidePanel.Action.ContinuePlaying", 
    [v15.Inventory] = "CommonUI.Features.Label.Inventory", 
    [v15.Connections] = "CommonUI.Features.Label.Connections", 
    [v15.Communities] = "CommonUI.Features.Label.Groups", 
    [v15.Messages] = "CommonUI.Features.Label.Messages", 
    [v15.Settings] = "CommonUI.Features.Label.Settings", 
    [v15.HelpAndSafety] = "CommonUI.Features.Label.HelpAndSafety", 
    [v15.Moments] = "CommonUI.Features.Label.RM", 
    [v15.Charts] = "CommonUI.Features.Label.Charts", 
    [v15.Learn] = "CommonUI.Features.Label.Learn", 
    [v15.Premium] = "CommonUI.Features.Label.Premium", 
    [v15.GiftCards] = "CommonUI.Features.Label.GiftCards", 
    [v15.Redeem] = "CommonUI.Features.Label.Redeem", 
    [v15.Events] = "CommonUI.Features.Label.TheHunt"
};
local v20 = {
    [v15.Favorites] = {
        itemType = v15.Favorites, 
        textKey = v17[v15.Favorites], 
        icon = v2.Icon.Bookmark, 
        context = {
            appUri = l_FAVORITES_URI_0
        }
    }, 
    [v15.ContinuePlaying] = {
        itemType = v15.ContinuePlaying, 
        textKey = v17[v15.ContinuePlaying], 
        icon = v2.Icon.ClockSpinReverse, 
        context = {
            appUri = l_CONTINUE_PLAYING_URI_0
        }
    }, 
    [v15.Inventory] = {
        itemType = v15.Inventory, 
        textKey = v17[v15.Inventory], 
        icon = v2.Icon.Backpack, 
        context = {
            urlGenerator = function(v18) --[[ Line: 106 ]] --[[ Name: urlGenerator ]]
                -- upvalues: l_UrlBuilder_0 (copy)
                return v18 and l_UrlBuilder_0.user.inventory({
                    userId = v18
                }) or nil;
            end
        }
    }, 
    [v15.Connections] = {
        itemType = v15.Connections, 
        textKey = v17[v15.Connections], 
        icon = v2.Icon.TwoPeople, 
        context = {
            appPage = if l_FFlagCreateConnectionsHub_0 then l_AppPage_0.CoHubMyConnections else l_AppPage_0.ViewFriends
        }
    }, 
    [v15.Communities] = {
        itemType = v15.Communities, 
        textKey = v17[v15.Communities], 
        icon = v2.Icon.ThreePeople, 
        context = {
            url = l_UrlBuilder_0.static.groups()
        }
    }, 
    [v15.Messages] = {
        itemType = v15.Messages, 
        textKey = v17[v15.Messages], 
        icon = v2.Icon.Envelope, 
        context = {
            url = l_UrlBuilder_0.static.messages()
        }
    }, 
    [v15.Settings] = {
        itemType = v15.Settings, 
        textKey = v17[v15.Settings], 
        icon = v2.Icon.Gear, 
        context = {
            appPage = l_AppPage_0.Settings
        }
    }, 
    [v15.HelpAndSafety] = {
        itemType = v15.HelpAndSafety, 
        textKey = v17[v15.HelpAndSafety], 
        icon = v2.Icon.ShieldLock, 
        context = {
            appPage = l_AppPage_0.SafetySupport
        }
    }, 
    [v15.Moments] = {
        itemType = v15.Moments, 
        textKey = v17[v15.Moments], 
        icon = v2.Icon.Moments, 
        context = {
            appUri = v10
        }
    }, 
    [v15.Charts] = {
        itemType = v15.Charts, 
        textKey = v17[v15.Charts], 
        icon = v2.Icon.ChartThreeVerticalBars, 
        context = {}
    }, 
    [v15.Learn] = {
        itemType = v15.Learn, 
        textKey = v17[v15.Learn], 
        icon = v2.Icon.PersonGraduate, 
        context = {
            appUri = v11
        }
    }, 
    [v15.Premium] = {
        itemType = v15.Premium, 
        textKey = v17[v15.Premium], 
        icon = v2.Icon.Premium, 
        context = {
            appPage = l_AppPage_0.BuildersClub
        }
    }, 
    [v15.GiftCards] = {
        itemType = v15.GiftCards, 
        textKey = v17[v15.GiftCards], 
        icon = v2.Icon.GiftCard, 
        context = {
            urlGenerator = function(v19) --[[ Line: 186 ]] --[[ Name: urlGenerator ]]
                -- upvalues: l_UrlBuilder_0 (copy)
                return l_UrlBuilder_0.static.giftCards(v19);
            end
        }
    }, 
    [v15.Redeem] = {
        itemType = v15.Redeem, 
        textKey = v17[v15.Redeem], 
        icon = v2.Icon.Wallet, 
        context = {
            url = l_UrlBuilder_0.static.redeem()
        }
    }, 
    [v15.Events] = {
        itemType = v15.Events, 
        textKey = v17[v15.Events], 
        icon = v2.Icon.CalendarStar, 
        context = {
            url = if l_GetFStringPlatformEventUrl_0() ~= "" then l_UrlBuilder_0.fromString(l_GetFStringPlatformEventUrl_0())() else l_UrlBuilder_0.static.help()
        }
    }
};
if l_FFlagEnableBlackbird_0 and l_FFlagEnableBlackbirdOnFlyoutMenu_0 then
    v15.Blackbird = "Blackbird";
    v16[v15.Blackbird] = "Blackbird";
    v17[v15.Blackbird] = "CommonUI.Features.Label.X";
    v20[v15.Blackbird] = {
        itemType = v15.Blackbird, 
        textKey = v17[v15.Blackbird], 
        icon = v1.Enums.IconName.PaperAirplane, 
        context = {
            appPage = l_AppPage_0.Blackbird
        }
    };
end;
return {
    ItemType = v15, 
    ItemTextKey = v17, 
    ItemInfo = v20, 
    EventNameMappings = v16
};