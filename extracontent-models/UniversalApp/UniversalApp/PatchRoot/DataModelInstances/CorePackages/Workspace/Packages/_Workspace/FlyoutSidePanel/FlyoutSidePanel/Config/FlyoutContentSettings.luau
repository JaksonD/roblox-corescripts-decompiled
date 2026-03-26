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
local l_FFlagConnectionsToFriendsRename_0 = v8.FFlagConnectionsToFriendsRename;
local v16 = {
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
local v17 = {
    [v16.Premium] = "BuildersClub", 
    [v16.Connections] = "Friends", 
    [v16.Moments] = "RM", 
    [v16.Communities] = "Groups", 
    [v16.HelpAndSafety] = "SafetySupport", 
    [v16.Events] = "TheHunt", 
    [v16.QuickSignin] = "Login Code"
};
local v18 = {
    [v16.Favorites] = "Feature.Catalog.Label.Favorites", 
    [v16.ContinuePlaying] = "Feature.FlyoutSidePanel.Action.ContinuePlaying", 
    [v16.Inventory] = "CommonUI.Features.Label.Inventory", 
    [v16.Connections] = l_FFlagConnectionsToFriendsRename_0 and "CommonUI.Features.Label.Friends" or "CommonUI.Features.Label.Connections", 
    [v16.Communities] = "CommonUI.Features.Label.Groups", 
    [v16.Messages] = "CommonUI.Features.Label.Messages", 
    [v16.Settings] = "CommonUI.Features.Label.Settings", 
    [v16.HelpAndSafety] = "CommonUI.Features.Label.HelpAndSafety", 
    [v16.Moments] = "CommonUI.Features.Label.RM", 
    [v16.Charts] = "CommonUI.Features.Label.Charts", 
    [v16.Learn] = "CommonUI.Features.Label.Learn", 
    [v16.Premium] = "CommonUI.Features.Label.Premium", 
    [v16.GiftCards] = "CommonUI.Features.Label.GiftCards", 
    [v16.Redeem] = "CommonUI.Features.Label.Redeem", 
    [v16.Events] = "CommonUI.Features.Label.TheHunt"
};
local v21 = {
    [v16.Favorites] = {
        itemType = v16.Favorites, 
        textKey = v18[v16.Favorites], 
        icon = v2.Icon.Bookmark, 
        context = {
            appUri = l_FAVORITES_URI_0
        }
    }, 
    [v16.ContinuePlaying] = {
        itemType = v16.ContinuePlaying, 
        textKey = v18[v16.ContinuePlaying], 
        icon = v2.Icon.ClockSpinReverse, 
        context = {
            appUri = l_CONTINUE_PLAYING_URI_0
        }
    }, 
    [v16.Inventory] = {
        itemType = v16.Inventory, 
        textKey = v18[v16.Inventory], 
        icon = v2.Icon.Backpack, 
        context = {
            urlGenerator = function(v19) --[[ Line: 109 ]] --[[ Name: urlGenerator ]]
                -- upvalues: l_UrlBuilder_0 (copy)
                return v19 and l_UrlBuilder_0.user.inventory({
                    userId = v19
                }) or nil;
            end
        }
    }, 
    [v16.Connections] = {
        itemType = v16.Connections, 
        textKey = v18[v16.Connections], 
        icon = v2.Icon.TwoPeople, 
        context = {
            appPage = if l_FFlagCreateConnectionsHub_0 then l_AppPage_0.CoHubMyConnections else l_AppPage_0.ViewFriends
        }
    }, 
    [v16.Communities] = {
        itemType = v16.Communities, 
        textKey = v18[v16.Communities], 
        icon = v2.Icon.ThreePeople, 
        context = {
            url = l_UrlBuilder_0.static.groups()
        }
    }, 
    [v16.Messages] = {
        itemType = v16.Messages, 
        textKey = v18[v16.Messages], 
        icon = v2.Icon.Envelope, 
        context = {
            url = l_UrlBuilder_0.static.messages()
        }
    }, 
    [v16.Settings] = {
        itemType = v16.Settings, 
        textKey = v18[v16.Settings], 
        icon = v2.Icon.Gear, 
        context = {
            appPage = l_AppPage_0.Settings
        }
    }, 
    [v16.HelpAndSafety] = {
        itemType = v16.HelpAndSafety, 
        textKey = v18[v16.HelpAndSafety], 
        icon = v2.Icon.ShieldLock, 
        context = {
            appPage = l_AppPage_0.SafetySupport
        }
    }, 
    [v16.Moments] = {
        itemType = v16.Moments, 
        textKey = v18[v16.Moments], 
        icon = v2.Icon.Moments, 
        context = {
            appUri = v10
        }
    }, 
    [v16.Charts] = {
        itemType = v16.Charts, 
        textKey = v18[v16.Charts], 
        icon = v2.Icon.ChartThreeVerticalBars, 
        context = {}
    }, 
    [v16.Learn] = {
        itemType = v16.Learn, 
        textKey = v18[v16.Learn], 
        icon = v2.Icon.PersonGraduate, 
        context = {
            appUri = v11
        }
    }, 
    [v16.Premium] = {
        itemType = v16.Premium, 
        textKey = v18[v16.Premium], 
        icon = v2.Icon.Premium, 
        context = {
            appPage = l_AppPage_0.BuildersClub
        }
    }, 
    [v16.GiftCards] = {
        itemType = v16.GiftCards, 
        textKey = v18[v16.GiftCards], 
        icon = v2.Icon.GiftCard, 
        context = {
            urlGenerator = function(v20) --[[ Line: 189 ]] --[[ Name: urlGenerator ]]
                -- upvalues: l_UrlBuilder_0 (copy)
                return l_UrlBuilder_0.static.giftCards(v20);
            end
        }
    }, 
    [v16.Redeem] = {
        itemType = v16.Redeem, 
        textKey = v18[v16.Redeem], 
        icon = v2.Icon.Wallet, 
        context = {
            url = l_UrlBuilder_0.static.redeem()
        }
    }, 
    [v16.Events] = {
        itemType = v16.Events, 
        textKey = v18[v16.Events], 
        icon = v2.Icon.CalendarStar, 
        context = {
            url = if l_GetFStringPlatformEventUrl_0() ~= "" then l_UrlBuilder_0.fromString(l_GetFStringPlatformEventUrl_0())() else l_UrlBuilder_0.static.help()
        }
    }
};
if l_FFlagEnableBlackbird_0 and l_FFlagEnableBlackbirdOnFlyoutMenu_0 then
    v16.Blackbird = "Blackbird";
    v17[v16.Blackbird] = "Blackbird";
    v18[v16.Blackbird] = "CommonUI.Features.Label.X";
    v21[v16.Blackbird] = {
        itemType = v16.Blackbird, 
        textKey = v18[v16.Blackbird], 
        icon = v1.Enums.IconName.PaperAirplane, 
        context = {
            appPage = l_AppPage_0.Blackbird
        }
    };
end;
return {
    ItemType = v16, 
    ItemTextKey = v18, 
    ItemInfo = v21, 
    EventNameMappings = v17
};