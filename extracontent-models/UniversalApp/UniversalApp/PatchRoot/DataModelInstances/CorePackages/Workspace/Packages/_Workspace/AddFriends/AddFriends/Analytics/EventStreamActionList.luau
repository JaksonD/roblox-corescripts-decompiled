local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local v1 = require(l_Parent_0.Dash);
local l_Enums_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local l_Contexts_0 = l_Enums_0.Contexts;
local v5 = require(script.Parent.EventNames);
local l_FFlagAddFriendsPYMKPresenceAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsPYMKPresenceAnalytics;
local function v8(v7) --[[ Line: 23 ]]
    if v7 then
        return (tostring(v7));
    else
        return nil;
    end;
end;
return {
    [v5.PageLoad] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.PageLoad, 
        formatRulesForAdditionalInfo = {
            recommendationCount = v1.identity, 
            status = v1.identity
        }
    }, 
    [v5.AddFriendsPageLoadingTime] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.LoadingTime, 
        formatRulesForAdditionalInfo = {
            loadingTime = v1.identity, 
            status = v1.identity
        }
    }, 
    [v5.UserSearchClick] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            action = "peopleSearchBar"
        }
    }, 
    [v5.CIBtnClick] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            action = "connectWithFriends"
        }
    }, 
    [v5.QRCodeBtnClick] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            action = "shareProfileQRCode"
        }
    }, 
    [v5.CIBtnImpression] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.UserSeen, 
        additionalInfo = {
            action = "connectWithFriends"
        }
    }, 
    [v5.QRCodeBtnImpression] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.UserSeen, 
        additionalInfo = {
            action = "shareProfileQRCode"
        }
    }, 
    [v5.RequestFriendshipBtnClick] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            action = "requestFriendship"
        }, 
        formatRulesForAdditionalInfo = {
            namespace = v1.identity, 
            targetUserId = v1.identity, 
            absolutePosition = v1.identity, 
            rank = v1.identity, 
            contextType = v1.identity, 
            entityType = v1.identity, 
            presence = if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then v8 else nil
        }
    }, 
    [v5.AcceptFriendshipBtnClick] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            action = "acceptFriendship"
        }, 
        formatRulesForAdditionalInfo = {
            namespace = v1.identity, 
            targetUserId = v1.identity, 
            absolutePosition = v1.identity, 
            rank = v1.identity, 
            contextType = v1.identity, 
            entityType = v1.identity, 
            presence = if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then v8 else nil
        }
    }, 
    [v5.DeclineFriendshipBtnClick] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            action = "declineFriendship"
        }, 
        formatRulesForAdditionalInfo = {
            namespace = v1.identity, 
            targetUserId = v1.identity, 
            absolutePosition = v1.identity, 
            rank = v1.identity, 
            contextType = v1.identity, 
            entityType = v1.identity, 
            presence = if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then v8 else nil
        }
    }, 
    [v5.PlayerTileClick] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            action = "userTileClick"
        }, 
        formatRulesForAdditionalInfo = {
            namespace = v1.identity, 
            targetUserId = v1.identity, 
            absolutePosition = v1.identity, 
            rank = v1.identity, 
            contextType = v1.identity, 
            entityType = v1.identity, 
            friendStatus = v1.identity, 
            presence = if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then v8 else nil
        }
    }, 
    [v5.IgnoreAllBtnClick] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            action = "ignoreAll"
        }
    }, 
    [v5.ShowMoreBtnClick] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            action = "loadMoreUsers"
        }, 
        formatRulesForAdditionalInfo = {
            namespace = v1.identity
        }
    }, 
    [v5.UserTileImpression] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.UserSeen, 
        additionalInfo = {
            action = "userTileImpression"
        }, 
        formatRulesForAdditionalInfo = {
            namespace = v1.identity, 
            targetUserId = v1.identity, 
            absolutePosition = v1.identity, 
            rank = v1.identity, 
            contextType = v1.identity, 
            entityType = v1.identity, 
            friendStatus = v1.identity, 
            rowInSort = v1.identity, 
            presence = if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then v1.identity else nil
        }
    }, 
    [v5.FriendingOSAEducationSubtitleImpression] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.UserSeen, 
        additionalInfo = {
            action = "friendingOSAEducationSubtitle"
        }
    }, 
    [v5.TrustedContactsEducationalBannerClick] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            action = "trustedContactsEducationalBanner"
        }
    }, 
    [v5.TrustedContactsEducationalBannerClose] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            action = "TrustedContactsEducationalBannerClose"
        }
    }, 
    [v5.TrustedContactsEducationalBannerImpression] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.UserSeen, 
        additionalInfo = {
            action = "trustedContactsEducationalBanner"
        }
    }, 
    [v5.PYMKUserPresenceLoad] = if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.LoadingTime, 
        additionalInfo = {
            source = "AddFriendsPYMKUserPresence"
        }
    } else nil
};