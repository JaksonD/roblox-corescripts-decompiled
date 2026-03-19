local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Dash_0 = v1.Dash;
local l_RoduxFriends_0 = v1.RoduxFriends;
local l_RoduxUsers_0 = v1.RoduxUsers;
local l_SocialCommon_0 = v1.SocialCommon;
local l_Recommendation_0 = l_RoduxFriends_0.Models.Recommendation;
local l_RecommendationContextType_0 = l_RoduxFriends_0.Enums.RecommendationContextType;
local l_User_0 = l_RoduxUsers_0.Models.User;
local l_RecommendationSourceEnum_0 = l_SocialCommon_0.Enums.RecommendationSourceEnum;
local l_RECOMMENDATION_SESSION_ID_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RECOMMENDATION_SESSION_ID_KEY;
local l_PresenceType_0 = require(l_script_FirstAncestor_0.installReducer.RoduxPresence).Enums.PresenceType;
local l_HomepagePYMKCarousel_0 = l_RecommendationSourceEnum_0.HomepagePYMKCarousel;
local v13 = {
    longName = "1_longName", 
    noContext = "2_noContext", 
    mutualContextPlural = "3_mutualContextPlural", 
    mutualContextSingle = "4_mutualContextSingle", 
    mutualContextNone = "5_mutualContextNone", 
    frequentContext = "6_frequentContext", 
    pendingFriendRequest = "7_pendingFriendRequest", 
    incomingFriendRequest = "8_incomingFriendRequest", 
    contact = "9_contact"
};
local v15 = l_Dash_0.map(l_Dash_0.values(v13), function(v14) --[[ Line: 32 ]]
    return {
        id = v14
    };
end);
local v16 = {
    ScreenSize = Vector2.new(1920, 1080), 
    TopBar = {
        topBarHeight = 10
    }, 
    GlobalGuiInset = {
        bottom = 10
    }, 
    LocalUserId = "123456", 
    PYMKCarousel = {
        NetworkStatus = {}, 
        Users = {
            byUserId = {
                [v13.longName] = l_User_0.mock({
                    displayName = "Very Long Display Name"
                }), 
                [v13.noContext] = l_User_0.mock(), 
                [v13.mutualContextPlural] = l_User_0.mock(), 
                [v13.mutualContextSingle] = l_User_0.mock(), 
                [v13.mutualContextNone] = l_User_0.mock(), 
                [v13.frequentContext] = l_User_0.mock(), 
                [v13.pendingFriendRequest] = l_User_0.mock(), 
                [v13.incomingFriendRequest] = l_User_0.mock(), 
                [v13.contact] = l_User_0.mock()
            }
        }, 
        Friends = {
            recommendations = {
                bySource = {
                    [l_HomepagePYMKCarousel_0] = {
                        [v13.longName] = true, 
                        [v13.noContext] = true, 
                        [v13.mutualContextPlural] = true, 
                        [v13.mutualContextSingle] = true, 
                        [v13.mutualContextNone] = true, 
                        [v13.frequentContext] = true, 
                        [v13.pendingFriendRequest] = true, 
                        [v13.incomingFriendRequest] = true, 
                        [v13.contact] = true
                    }
                }, 
                byUserId = {
                    ["123456"] = {
                        [v13.longName] = l_Recommendation_0.mock({
                            id = v13.longName, 
                            rank = 5
                        }), 
                        [v13.noContext] = l_Recommendation_0.mock({
                            id = v13.noContext, 
                            contextType = l_RecommendationContextType_0.None, 
                            rank = 6
                        }), 
                        [v13.mutualContextPlural] = l_Recommendation_0.mock({
                            id = v13.mutualContextPlural, 
                            contextType = l_RecommendationContextType_0.MutualFriends, 
                            mutualFriendsList = {
                                "111", 
                                "222", 
                                "333"
                            }, 
                            rank = 10
                        }), 
                        [v13.mutualContextSingle] = l_Recommendation_0.mock({
                            id = v13.mutualContextSingle, 
                            contextType = l_RecommendationContextType_0.MutualFriends, 
                            mutualFriendsList = {
                                "111"
                            }, 
                            rank = 12
                        }), 
                        [v13.mutualContextNone] = l_Recommendation_0.mock({
                            id = v13.mutualContextNone, 
                            contextType = l_RecommendationContextType_0.MutualFriends, 
                            mutualFriendsList = {}, 
                            rank = 1
                        }), 
                        [v13.frequentContext] = l_Recommendation_0.mock({
                            id = v13.frequentContext, 
                            contextType = l_RecommendationContextType_0.Frequents, 
                            mutualFriendsList = {}, 
                            rank = 0
                        }), 
                        [v13.pendingFriendRequest] = l_Recommendation_0.mock({
                            id = v13.pendingFriendRequest, 
                            rank = 70
                        }), 
                        [v13.incomingFriendRequest] = l_Recommendation_0.mock({
                            id = v13.incomingFriendRequest, 
                            rank = 71
                        }), 
                        [v13.contact] = l_Recommendation_0.new({
                            id = v13.contact, 
                            rank = 80, 
                            contextType = l_RecommendationContextType_0.Contacts, 
                            entityId = "contact_entity_1", 
                            entityDisplayName = "Contact Display Name", 
                            thumbnailEntities = {
                                avatarImageUrl = "https://example.com/contact-avatar.png", 
                                headshotImageUrl = ""
                            }
                        })
                    }
                }, 
                hasIncomingFriendRequest = {
                    [v13.incomingFriendRequest] = true
                }
            }, 
            friendshipStatus = {
                [v13.pendingFriendRequest] = Enum.FriendStatus.FriendRequestSent
            }
        }, 
        Analytics = {
            bySessionKey = {
                [l_RECOMMENDATION_SESSION_ID_KEY_0] = "mockedRecommendationSessionId"
            }
        }, 
        Presence = {
            byUserId = {
                [v13.noContext] = {
                    userPresenceType = l_PresenceType_0.Online
                }
            }
        }
    }
};
return {
    recommendationIds = v13, 
    state = v16, 
    recommendationIdsList = v15
};