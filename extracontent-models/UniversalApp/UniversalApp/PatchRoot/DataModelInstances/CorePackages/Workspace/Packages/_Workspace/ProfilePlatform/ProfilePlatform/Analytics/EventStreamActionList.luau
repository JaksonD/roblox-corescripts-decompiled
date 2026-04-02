local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.SocialLuaAnalytics);
local v3 = require(script.Parent.AnalyticsConstants);
local l_Enums_0 = v2.Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v7 = require(script.Parent.EventNames);
local v8 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformUseProfileTypeContext);
local l_FFlagEnablePlatformProfileContextualMenuOption_0 = require(l_Parent_0.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption;
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformUseCatalogItemOpenedNewFields);
local l_FFlagTCShareLinkSenderUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkSenderUI;
local l_FFlagProfilePlatformEnableCurrencyTransfer_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer;
local function v14(v13) --[[ Line: 22 ]]
    return v13;
end;
return {
    [v7.ProfilePageLoadedWithData] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.PageLoad, 
        formatRulesForAdditionalInfo = {
            friendStatus = v14, 
            playerPresence = v14, 
            absolutePosition = v14, 
            isHomePageCarousel = v14, 
            isRecommendation = v14, 
            recommendationContextType = v14, 
            recommendationRank = v14, 
            recommendationSessionId = v14, 
            source = v14, 
            profileType = v14, 
            shareLinkId = v14, 
            primaryAction = v14
        }
    }, 
    [v7.ProfilePresenceLoaded] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.PresenceLoaded, 
        formatRulesForAdditionalInfo = {
            presenceType = v14, 
            universeId = v14
        }
    }, 
    [v7.ContextualMenuButtonChat] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.ContextualMenuButtons.Chat, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.ContextualMenuButtonIgnoreFriendRequest] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.ContextualMenuButtons.IgnoreFriendRequest, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.ContextualMenuButtonReport] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.ContextualMenuButtons.Report, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.ContextualMenuButtonUnfriend] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.ContextualMenuButtons.Unfriend, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.ContextualMenuButtonBlock] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.ContextualMenuButtons.Block, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.ContextualMenuButtonSetAlias] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.ContextualMenuButtons.SetAlias, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.ContextualMenuButtonCopyLink] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.ContextualMenuButtons.CopyLink, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.ContextualMenuButtonLeaveCommunity] = {
        context = if v8 then l_Contexts_0.CommunityProfile else l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.ContextualMenuButtons.LeaveCommunity, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.ContextualMenuButtonUnfollow] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.ContextualMenuButtons.Unfollow, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.ContextualMenuButtonRemoveTrustedConnection] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.ContextualMenuButtons.RemoveTrustedConnection, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.ContextualMenuButtonAddTrustedConnection] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.ContextualMenuButtons.AddTrustedConnection, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14, 
            modalVariantOverride = if l_FFlagTCShareLinkSenderUI_0 then v14 else nil
        }
    }, 
    [v7.ContextualMenuButtonAddIncomingTrustedConnection] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.ContextualMenuButtons.AddIncomingTrustedConnection, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.ContextualMenuButtonMakePrimaryCommunity] = {
        context = if v8 then l_Contexts_0.CommunityProfile else l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.ContextualMenuButtons.MakePrimaryCommunity, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.ContextualMenuButtonRemovePrimaryCommunity] = {
        context = if v8 then l_Contexts_0.CommunityProfile else l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.ContextualMenuButtons.RemovePrimaryCommunity, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.ContextualMenuButtonCurrencyTransfer] = if l_FFlagProfilePlatformEnableCurrencyTransfer_0 then {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.ContextualMenuButtons.CurrencyTransfer, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    } else nil, 
    [v7.CTAButtonOpenEditProfilePage] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.CTAButtons.OpenEditProfilePage
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.CTAButtonChat] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.CTAButtons.Chat
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.CTAButtonUnfriend] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.CTAButtons.Unfriend
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.CTAButtonUnblock] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.CTAButtons.Unblock
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.CTAButtonAddFriend] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.CTAButtons.AddFriend
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v14, 
            isHomePageCarousel = v14, 
            isRecommendation = v14, 
            recommendationContextType = v14, 
            recommendationRank = v14, 
            recommendationSessionId = v14, 
            source = v14, 
            contextualInfoType = v14, 
            shareLinkId = v14, 
            profileType = v14
        }
    }, 
    [v7.CTAButtonAddFriendFromContacts] = {
        context = l_Contexts_0.ContactImport, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.CTAButtons.AddFriendFromContacts
        }, 
        formatRulesForAdditionalInfo = {
            shareLinkId = v14
        }
    }, 
    [v7.CTAButtonAcceptFriendRequest] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.CTAButtons.AcceptFriendRequest
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v14, 
            contextualInfoType = v14, 
            isHomePageCarousel = v14, 
            isRecommendation = v14, 
            recommendationContextType = v14, 
            recommendationRank = v14, 
            recommendationSessionId = v14, 
            source = v14, 
            buttonSurface = v14, 
            shareLinkId = v14, 
            profileType = v14
        }
    }, 
    [v7.CTAButtonEditAvatar] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.CTAButtons.EditAvatar
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.CTAButtonEditLook] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.CTAButtons.EditLook
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.CTAButtonShareProfile] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.CTAButtons.ShareProfile
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.CTAButtonShareProfileQRCode] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.CTAButtons.ShareProfileQRCode
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.CTAButtonJoinCommunity] = {
        context = if v8 then l_Contexts_0.CommunityProfile else l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.CTAButtons.JoinCommunity, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.CTAButtonFollow] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.CTAButtons.Follow, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.CTAButtonViewCommunity] = {
        context = if v8 then l_Contexts_0.CommunityProfile else l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.CTAButtons.ViewCommunity, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.CTAButtonViewFullProfile] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.CTAButtons.ViewFullProfile, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.CTAButtonCurrencyTransfer] = if l_FFlagProfilePlatformEnableCurrencyTransfer_0 then {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.CTAButtons.CurrencyTransfer, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    } else nil, 
    [v7.CTAButtonCancelJoinCommunityRequest] = {
        context = if v8 then l_Contexts_0.CommunityProfile else l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.CTAButtons.CancelJoinCommunityRequest, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    }, 
    [v7.FriendsButton] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.Btns.Friends
        }
    }, 
    [v7.FollowersButton] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.Btns.Followers
        }
    }, 
    [v7.FollowingsButton] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.Btns.Following
        }
    }, 
    [v7.MutualFriendsButton] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.Btns.MutualFriends
        }
    }, 
    [v7.ViewPlayerProfileButton] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.Btns.ViewPlayerProfile
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v14, 
            friendStatus = v14, 
            isHomePageCarousel = v14, 
            isRecommendation = v14, 
            recommendationContextType = v14, 
            recommendationRank = v14, 
            recommendationSessionId = v14, 
            source = v14, 
            buttonSurface = v14
        }
    }, 
    [v7.ContextualMenuButton] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.Btns.ContextualMenu
        }
    }, 
    [v7.GameDetailsButton] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.Btns.GameDetails
        }
    }, 
    [v7.EditDisplayNameButton] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.Btns.EditDisplayName
        }, 
        formatRulesForAdditionalInfo = {
            canSetDisplayName = v14
        }
    }, 
    [v7.SetAliasButton] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.Btns.SetAlias
        }
    }, 
    [v7.ProfileClosed] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.Dismissed
    }, 
    [v7.StoreHeaderButton] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.Btns.StoreHeader
        }
    }, 
    [v7.FavoriteExperienceOpened] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.Btns.FavoriteExperience
        }, 
        formatRulesForAdditionalInfo = {
            experienceId = v14, 
            positionInComponent = v14
        }
    }, 
    [v7.FavoriteExperienceSeeAll] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.Btns.FavoriteExperienceSeeAll
        }
    }, 
    [v7.ExperienceOpened] = {
        context = if v8 then l_Contexts_0.CommunityProfile else l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.Btns.Experience
        }, 
        formatRulesForAdditionalInfo = {
            experienceId = v14, 
            positionInComponent = v14
        }
    }, 
    [v7.EventOpened] = {
        context = l_Contexts_0.CommunityProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.Btns.Event
        }, 
        formatRulesForAdditionalInfo = {
            virtualEventId = v14
        }
    }, 
    [v7.EventRSVP] = {
        context = l_Contexts_0.CommunityProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.Btns.EventRSVP
        }, 
        formatRulesForAdditionalInfo = {
            virtualEventId = v14, 
            status = v14
        }
    }, 
    [v7.EventJoined] = {
        context = l_Contexts_0.CommunityProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.Btns.EventJoin
        }, 
        formatRulesForAdditionalInfo = {
            virtualEventId = v14
        }
    }, 
    [v7.CatalogItemOpened] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.Btns.ViewCatalogItem
        }, 
        formatRulesForAdditionalInfo = if v10 then {
            btnContext = v14, 
            btnUnitId = v14, 
            btnSortPosition = v14
        } else {
            itemId = v14, 
            positionInComponent = v14, 
            component = v14
        }
    }, 
    [v7.UsernameCopied] = {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.Btns.Username
        }
    }, 
    [v7.ContextualMenuButtonViewPlatformProfile] = if l_FFlagEnablePlatformProfileContextualMenuOption_0 then {
        context = l_Contexts_0.PlayerProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.ContextualMenuButtons.ViewPlatformProfile, 
            optionType = "CTAType"
        }, 
        formatRulesForAdditionalInfo = {
            buttonSurface = v14
        }
    } else nil
};