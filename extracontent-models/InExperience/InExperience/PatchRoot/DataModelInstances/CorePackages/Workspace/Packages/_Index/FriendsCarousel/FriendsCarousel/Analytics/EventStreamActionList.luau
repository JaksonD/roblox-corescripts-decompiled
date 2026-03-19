local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(script.Parent.EventNames);
local v3 = require(l_Parent_1.SocialLuaAnalytics);
local l_Enums_0 = v3.Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v7 = require(script.Parent.BtnValues);
local v8 = require(l_Parent_0.Common.Constants);
local v9 = require(script.Parent.formatFriendStatus);
local v10 = require(script.Parent.getUniverseIdFromUser);
local l_formatRecommendationContextType_0 = v3.Analytics.Formatters.formatRecommendationContextType;
local l_formatPresence_0 = v3.Analytics.Formatters.formatPresence;
local v13 = require(l_Parent_0.Flags.getFIntShowFriendRecommendationsLimit);
local function v15(v14) --[[ Line: 20 ]]
    return v14;
end;
return {
    [v2.CarouselLoadedWithUsers] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.FriendsCarouselLoaded, 
        additionalInfo = {
            source = v8.HomepageFriendsCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            friendCount = v15, 
            recommendationCount = v15, 
            recommendationLimit = v13, 
            refreshCount = v15, 
            experimentLayerStatus = v15, 
            fetchedRecommendations = v15, 
            recommendationSessionId = v15
        }
    }, 
    [v2.UserSeen] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.UserSeen, 
        additionalInfo = {
            source = v8.HomepageFriendsCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v15, 
            recommendationContextType = l_formatRecommendationContextType_0, 
            friendStatus = v9, 
            isRecommendation = v15, 
            presence = l_formatPresence_0, 
            recommendationRank = v15, 
            userId = v15, 
            universeId = v10
        }
    }, 
    [v2.UserPressed] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v7.OpenPeopleList, 
            source = v8.HomepageFriendsCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v15, 
            recommendationContextType = l_formatRecommendationContextType_0, 
            friendId = v15, 
            friendStatus = v9, 
            isRecommendation = v15, 
            recommendationRank = v15, 
            universeId = v10, 
            presence = l_formatPresence_0
        }
    }, 
    [v2.RequestFriendship] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v7.RequestFriendship, 
            source = v8.HomepageFriendsCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v15, 
            recommendationContextType = l_formatRecommendationContextType_0, 
            recommendationRank = v15, 
            requestedId = v15
        }
    }, 
    [v2.RevokeFriendRequest] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v7.RevokeFriendRequest, 
            source = v8.HomepageFriendsCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v15, 
            recommendationContextType = l_formatRecommendationContextType_0, 
            recommendationRank = v15, 
            requestedId = v15
        }
    }, 
    [v2.ViewAllFriends] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v7.FriendsLanding, 
            source = v8.HomepageFriendsCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            friendCount = v15, 
            recommendationLimit = v13, 
            recommendationCount = v15
        }
    }, 
    [v2.ViewAddFriends] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v7.AddFriendsButton, 
            absolutePosition = 1, 
            source = v8.HomepageFriendsCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            friendCount = v15, 
            recommendationLimit = v13, 
            recommendationCount = v15, 
            requestCount = v15, 
            showContactImporterModal = v15
        }
    }, 
    [v2.CarouselLoadingTime] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.CarouselLoadingTime, 
        additionalInfo = {
            source = v8.HomepageFriendsCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            carouselFetchingStatus = v15, 
            friendsFetchingStatus = v15, 
            recommendationFetchingStatus = v15, 
            loadingTime = v15, 
            reachedThreshold = v15, 
            loadingThreshold = v15, 
            experimentLayerStatus = v15, 
            isLegacyCarousel = v15
        }
    }, 
    [v2.ContactImporterOnAddFriends] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ContactImporterOnAddFriends, 
        additionalInfo = {
            isLegacyAddFriends = false
        }
    }, 
    [v2.PaginatedFriendsCarouselLoadingTime] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.LoadingTime, 
        formatRulesForAdditionalInfo = {
            status = v15, 
            loadingTime = v15, 
            loadingThreshold = v15, 
            nextPage = v15, 
            fetch = v15
        }, 
        additionalInfo = {
            source = v8.HomepageFriendsCarouselSourceName
        }
    }, 
    [v2.FriendsEndpointLoadingTime] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.LoadingTime, 
        formatRulesForAdditionalInfo = {
            status = v15, 
            loadingTime = v15, 
            loadingThreshold = v15, 
            nextPage = v15, 
            fetch = v15
        }, 
        additionalInfo = {
            source = v8.HomepageFriendsCarouselSourceName
        }
    }, 
    [v2.FriendsCarouselUILoadingTime] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.LoadingTime, 
        formatRulesForAdditionalInfo = {
            status = v15, 
            fetch = v15, 
            loadingTime = v15, 
            loadingThreshold = v15, 
            nextPage = v15
        }, 
        additionalInfo = {
            source = v8.HomepageFriendsCarouselSourceName
        }
    }
};