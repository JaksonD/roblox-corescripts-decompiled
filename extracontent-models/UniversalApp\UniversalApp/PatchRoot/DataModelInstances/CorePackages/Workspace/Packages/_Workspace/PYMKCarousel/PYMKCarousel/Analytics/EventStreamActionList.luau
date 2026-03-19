local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(script.Parent.EventNames);
local v4 = require(l_Parent_1.SocialLuaAnalytics);
local l_Enums_0 = v4.Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v8 = require(script.Parent.BtnValues);
local v9 = require(l_Parent_0.Common.Constants);
local l_formatRecommendationContextType_0 = v4.Analytics.Formatters.formatRecommendationContextType;
local l_getFFlagPYMKAddFriendsEntry_0 = v1.getFFlagPYMKAddFriendsEntry;
local l_FFlagHomepagePYMKPresenceAnalytics_0 = require(l_Parent_1.SharedFlags).FFlagHomepagePYMKPresenceAnalytics;
local l_FFlagLuaAppPymkFriendRequestSchemaFields_0 = require(l_Parent_1.SharedFlags).FFlagLuaAppPymkFriendRequestSchemaFields;
local function v15(v14) --[[ Line: 19 ]]
    return v14;
end;
local function v17(v16) --[[ Line: 23 ]]
    if v16 then
        return (tostring(v16));
    else
        return nil;
    end;
end;
local v18 = {
    [v3.CarouselLoadedWithUsers] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.FriendsCarouselLoaded, 
        additionalInfo = {
            source = v9.HomepagePYMKCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            recommendationCount = v15, 
            recommendationLimit = nil, 
            refreshCount = v15
        }
    }, 
    [v3.PYMKCarouselLoadingTime] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.LoadingTime, 
        additionalInfo = {
            source = v9.HomepagePYMKCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            loadingTime = v15
        }
    }, 
    [v3.UserSeen] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.UserSeen, 
        additionalInfo = {
            source = v9.HomepagePYMKCarouselSourceName, 
            isRecommendation = true
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v15, 
            recommendationContextType = l_formatRecommendationContextType_0, 
            friendStatus = v15, 
            recommendationRank = v15, 
            userId = v15, 
            contactId = v15, 
            presence = if l_FFlagHomepagePYMKPresenceAnalytics_0 then v17 else nil
        }
    }, 
    [v3.UserPressed] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            source = v9.HomepagePYMKCarouselSourceName, 
            isRecommendation = true, 
            btn = v8.OpenPeopleList, 
            contentType = "User", 
            actionType = "OpenProfile"
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v15, 
            positionInRow = v15, 
            recommendationContextType = l_formatRecommendationContextType_0, 
            recommendationId = v15, 
            friendStatus = v15, 
            recommendationRank = v15, 
            contactId = v15, 
            presence = if l_FFlagHomepagePYMKPresenceAnalytics_0 then v17 else nil, 
            interactionUuid = v15
        }
    }, 
    [v3.RequestFriendship] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v8.RequestFriendship, 
            source = v9.HomepagePYMKCarouselSourceName, 
            contentType = l_FFlagLuaAppPymkFriendRequestSchemaFields_0 and "User" or nil, 
            actionType = l_FFlagLuaAppPymkFriendRequestSchemaFields_0 and "RequestFriendship" or nil
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v15, 
            positionInRow = v15, 
            recommendationContextType = l_formatRecommendationContextType_0, 
            recommendationRank = v15, 
            requestedId = v15, 
            contactId = v15, 
            presence = if l_FFlagHomepagePYMKPresenceAnalytics_0 then v17 else nil, 
            interactionUuid = v15
        }
    }, 
    [v3.AcceptFriendship] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v8.AcceptFriendship, 
            source = v9.HomepagePYMKCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v15, 
            recommendationContextType = l_formatRecommendationContextType_0, 
            recommendationRank = v15, 
            requestedId = v15, 
            presence = if l_FFlagHomepagePYMKPresenceAnalytics_0 then v17 else nil
        }
    }, 
    [v3.PYMKUserPresenceLoad] = if l_FFlagHomepagePYMKPresenceAnalytics_0 then {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.LoadingTime, 
        additionalInfo = {
            source = "HomepagePYMKUserPresence"
        }, 
        formatRulesForAdditionalInfo = {
            loadingTime = v15
        }
    } else nil
};
if l_getFFlagPYMKAddFriendsEntry_0() then
    local v19 = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            source = v9.HomepagePYMKCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            btn = v15
        }
    };
    v18[v3.CarouselGenericTileClicked] = v19;
end;
return v18;