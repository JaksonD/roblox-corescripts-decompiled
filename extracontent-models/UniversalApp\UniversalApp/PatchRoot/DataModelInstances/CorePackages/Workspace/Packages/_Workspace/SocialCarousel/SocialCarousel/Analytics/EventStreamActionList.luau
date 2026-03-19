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
local function v12(v11) --[[ Line: 16 ]]
    return v11;
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
            absolutePosition = v12, 
            positionInRow = if l_FFlagLuaAppAddSortDataToSocialCarouselClicks_0 then v12 else nil, 
            recommendationContextType = l_formatRecommendationContextType_0, 
            friendId = v12, 
            friendStatus = v12, 
            isRecommendation = v12, 
            recommendationRank = v12, 
            universeId = v12, 
            presence = v12, 
            source = v12, 
            interactionUuid = v12
        }
    }, 
    [v7.UserSeen] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.UserSeen, 
        formatRulesForAdditionalInfo = {
            userId = v12, 
            presence = v12, 
            absolutePosition = v12, 
            recommendationRank = v12, 
            friendStatus = v12, 
            recommendationContextType = l_formatRecommendationContextType_0, 
            isRecommendation = v12, 
            source = v12, 
            universeId = v12
        }
    }, 
    [v7.ViewAddFriends] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v8.ANALYTICS.BTN_VALUES.ADD_FRIENDS, 
            absolutePosition = v12, 
            positionInRow = v12, 
            contentType = v8.ANALYTICS.CONTENT_TYPE, 
            actionType = v8.ANALYTICS.ACTION_TYPES.OPEN_ADD_FRIENDS
        }, 
        formatRulesForAdditionalInfo = {
            friendCount = v12, 
            recommendationLimit = l_FIntSocialCarouselShowRecsLimit_0, 
            recommendationCount = v12, 
            requestCount = v12, 
            source = v12, 
            interactionUuid = v12
        }
    }, 
    [v7.ViewAllFriends] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v8.ANALYTICS.BTN_VALUES.VIEW_ALL_FRIENDS
        }, 
        formatRulesForAdditionalInfo = {
            friendCount = v12, 
            recommendationLimit = l_FIntSocialCarouselShowRecsLimit_0, 
            recommendationCount = v12, 
            source = v12
        }
    }, 
    [v7.FriendsCarouselUILoadingTime] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.LoadingTime, 
        formatRulesForAdditionalInfo = {
            status = v12, 
            fetch = v12, 
            loadingTime = v12, 
            loadingThreshold = v12, 
            nextPage = v12, 
            source = v12
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
            absolutePosition = v12, 
            source = v12
        }
    }, 
    [v7.TilesSeenCollection] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.UserSeenCollection, 
        formatRulesForAdditionalInfo = {
            userId = v12, 
            absolutePosition = v12, 
            presence = v12, 
            recommendationRank = v12, 
            friendStatus = v12, 
            recommendationContextType = v12, 
            isRecommendation = v12, 
            universeId = v12, 
            tileCount = v12, 
            source = v12, 
            sessionEventCount = v12
        }
    }
};