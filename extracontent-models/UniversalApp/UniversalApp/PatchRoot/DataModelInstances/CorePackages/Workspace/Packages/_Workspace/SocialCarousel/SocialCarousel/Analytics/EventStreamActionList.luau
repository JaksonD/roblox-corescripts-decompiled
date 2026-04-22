local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.SocialLuaAnalytics);
local l_formatRecommendationContextType_0 = v2.Analytics.Formatters.formatRecommendationContextType;
local l_Enums_0 = v2.Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v7 = require(script.Parent.EventNames);
local v8 = require(l_script_FirstAncestor_0.Common.Constants);
local l_FIntSocialCarouselShowRecsLimit_0 = require(l_script_FirstAncestor_0.Flags).FIntSocialCarouselShowRecsLimit;
local l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddSortDataToSocialCarouselClicks;
local l_FFlagSocialCarouselShareQREnabled_0 = require(l_Parent_0.SharedFlags).FFlagSocialCarouselShareQREnabled;
local function v13(v12) --[[ Line: 17 ]]
    return v12;
end;
return {
    [v7.UserPressed] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v8.ANALYTICS.BTN_VALUES.OPEN_PEOPLE_LIST, 
            contentType = if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v8.ANALYTICS.CONTENT_TYPE else nil, 
            actionType = if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v8.ANALYTICS.ACTION_TYPES.OPEN_PROFILE else nil
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v13, 
            positionInRow = if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v13 else nil, 
            recommendationContextType = l_formatRecommendationContextType_0, 
            friendId = v13, 
            friendStatus = v13, 
            isRecommendation = v13, 
            recommendationRank = v13, 
            universeId = v13, 
            presence = v13, 
            source = v13, 
            interactionUuid = v13
        }
    }, 
    [v7.UserSeen] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.UserSeen, 
        formatRulesForAdditionalInfo = {
            userId = v13, 
            presence = v13, 
            absolutePosition = v13, 
            recommendationRank = v13, 
            friendStatus = v13, 
            recommendationContextType = l_formatRecommendationContextType_0, 
            isRecommendation = v13, 
            source = v13, 
            universeId = v13
        }
    }, 
    [v7.ViewAddFriends] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v8.ANALYTICS.BTN_VALUES.ADD_FRIENDS, 
            absolutePosition = v13, 
            positionInRow = v13, 
            contentType = v8.ANALYTICS.CONTENT_TYPE, 
            actionType = v8.ANALYTICS.ACTION_TYPES.OPEN_ADD_FRIENDS
        }, 
        formatRulesForAdditionalInfo = {
            friendCount = v13, 
            recommendationLimit = l_FIntSocialCarouselShowRecsLimit_0, 
            recommendationCount = v13, 
            requestCount = v13, 
            source = v13, 
            interactionUuid = v13
        }
    }, 
    [v7.ViewAllFriends] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v8.ANALYTICS.BTN_VALUES.VIEW_ALL_FRIENDS
        }, 
        formatRulesForAdditionalInfo = {
            friendCount = v13, 
            recommendationLimit = l_FIntSocialCarouselShowRecsLimit_0, 
            recommendationCount = v13, 
            source = v13
        }
    }, 
    [v7.FriendsCarouselUILoadingTime] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.LoadingTime, 
        formatRulesForAdditionalInfo = {
            status = v13, 
            fetch = v13, 
            loadingTime = v13, 
            loadingThreshold = v13, 
            nextPage = v13, 
            source = v13
        }, 
        additionalInfo = {}
    }, 
    [v7.StartSquadPressed] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v8.ANALYTICS.BTN_VALUES.START_SQUAD
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v13, 
            source = v13
        }
    }, 
    [v7.ShareQRPressed] = if l_FFlagSocialCarouselShareQREnabled_0 then {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v8.ANALYTICS.BTN_VALUES.SHARE_QR
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v13, 
            source = v13
        }
    } else nil, 
    [v7.TilesSeenCollection] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.UserSeenCollection, 
        formatRulesForAdditionalInfo = {
            userId = v13, 
            absolutePosition = v13, 
            presence = v13, 
            recommendationRank = v13, 
            friendStatus = v13, 
            recommendationContextType = v13, 
            isRecommendation = v13, 
            universeId = v13, 
            tileCount = v13, 
            source = v13, 
            sessionEventCount = v13
        }
    }
};