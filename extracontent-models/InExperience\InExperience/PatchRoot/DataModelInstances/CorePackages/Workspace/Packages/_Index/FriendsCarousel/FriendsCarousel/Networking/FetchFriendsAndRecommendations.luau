local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_0.dependencies);
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
local l_NetworkingFriends_0 = v3.NetworkingFriends;
local l_NetworkingAliases_0 = v3.NetworkingAliases;
local l_RoduxFriends_0 = v3.RoduxFriends;
local l_RoduxAnalytics_0 = v3.RoduxAnalytics;
local l_Promise_0 = v3.Promise;
local l_Dash_0 = v3.Dash;
local v11 = require(l_Parent_0.Utils.showRecommendations);
local l_EventNames_0 = require(l_Parent_0.Analytics).EventNames;
local l_Analytics_0 = require(l_Parent_0.Analytics).Analytics;
local v14 = require(l_Parent_0.Analytics.FetchNames);
local l_RetrievalStatus_0 = require(l_Parent_1.UIBlox).App.Loading.Enum.RetrievalStatus;
local v16 = require(l_Parent_0.Common.UserSorts);
local l_RECOMMENDATION_SESSION_ID_KEY_0 = require(l_Parent_0.Common.Constants).RECOMMENDATION_SESSION_ID_KEY;
local l_SocialCommon_0 = v3.SocialCommon;
local l_RecommendationSourceEnum_0 = l_SocialCommon_0.Enums.RecommendationSourceEnum;
local l_ContextualInfoTypes_0 = l_SocialCommon_0.Enums.ContextualInfoTypes;
local l_Timers_0 = require(l_Parent_1.SocialLuaAnalytics).Analytics.Timing.Timers;
local v22 = v3.logger:new("FriendsCarousel/" .. script.Name);
local l_isSubjectToDesktopPolicies_0 = v3.isSubjectToDesktopPolicies;
local l_FFlagEnableRecommendationsForPCGDK_0 = require(l_Parent_1.SharedFlags).FFlagEnableRecommendationsForPCGDK;
local l_FFlagFixIsConsoleCheckForSocialCarousel_0 = require(l_Parent_1.SharedFlags).FFlagFixIsConsoleCheckForSocialCarousel;
local function v27(v26) --[[ Line: 40 ]]
    -- upvalues: v11 (copy), l_isSubjectToDesktopPolicies_0 (copy), l_FFlagEnableRecommendationsForPCGDK_0 (copy), l_ThirdPartyUserService_0 (copy), l_FFlagFixIsConsoleCheckForSocialCarousel_0 (copy), l_UserInputService_0 (copy)
    return v11(v26) and not l_isSubjectToDesktopPolicies_0() or v11(v26) and l_FFlagEnableRecommendationsForPCGDK_0 and l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:HaveActiveUser() or v11(v26) and l_FFlagFixIsConsoleCheckForSocialCarousel_0 and l_UserInputService_0.PreferredInput == Enum.PreferredInput.Gamepad;
end;
local v28 = 0;
return function(v29) --[[ Line: 58 ]]
    -- upvalues: l_Analytics_0 (copy), l_Timers_0 (copy), l_NetworkingFriends_0 (copy), v16 (copy), v28 (ref), l_Dash_0 (copy), l_EventNames_0 (copy), l_RetrievalStatus_0 (copy), v14 (copy), l_NetworkingAliases_0 (copy), l_Promise_0 (copy), v22 (copy), v27 (copy), l_ContextualInfoTypes_0 (copy), l_RoduxFriends_0 (copy), l_RecommendationSourceEnum_0 (copy), l_RoduxAnalytics_0 (copy), l_RECOMMENDATION_SESSION_ID_KEY_0 (copy)
    return function(v30) --[[ Line: 59 ]]
        -- upvalues: l_Analytics_0 (ref), l_Timers_0 (ref), l_NetworkingFriends_0 (ref), v16 (ref), v28 (ref), v29 (copy), l_Dash_0 (ref), l_EventNames_0 (ref), l_RetrievalStatus_0 (ref), v14 (ref), l_NetworkingAliases_0 (ref), l_Promise_0 (ref), v22 (ref), v27 (ref), l_ContextualInfoTypes_0 (ref), l_RoduxFriends_0 (ref), l_RecommendationSourceEnum_0 (ref), l_RoduxAnalytics_0 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref)
        local v31 = tostring(v30:getState().LocalUserId);
        local l_fireAnalyticsEvent_0 = l_Analytics_0({
            infoForAllEvents = {
                uid = v31
            }
        }).fireAnalyticsEvent;
        local v33 = l_Timers_0();
        local v34 = v33.start();
        return v30:dispatch(l_NetworkingFriends_0.GetFriendsFromUserId.API(v31, {
            userSort = v16.StatusFrequents
        })):andThen(function(v35) --[[ Line: 73 ]]
            -- upvalues: v28 (ref), v29 (ref), l_Dash_0 (ref), v33 (copy), v34 (copy), l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), l_RetrievalStatus_0 (ref), v14 (ref), v30 (copy), l_NetworkingAliases_0 (ref), l_Promise_0 (ref), v22 (ref), v27 (ref), l_NetworkingFriends_0 (ref), v31 (copy), l_ContextualInfoTypes_0 (ref), l_RoduxFriends_0 (ref), l_RecommendationSourceEnum_0 (ref), l_RoduxAnalytics_0 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref)
            local l_data_0 = v35.responseBody.data;
            local v37 = l_data_0 and #l_data_0 or 0;
            v28 = if v29 and v29.refresh then v28 + 1 else v28;
            local v39 = if l_data_0 then l_Dash_0.map(l_data_0, function(v38) --[[ Line: 78 ]]
                return v38.id;
            end) else {};
            local v40 = v33.stop(v34);
            l_fireAnalyticsEvent_0(l_EventNames_0.FriendsEndpointLoadingTime, {
                status = l_RetrievalStatus_0.Done.rawValue(), 
                loadingTime = v40, 
                fetch = v14.OldAllFriends
            });
            v30:dispatch(l_NetworkingAliases_0.GetTagsFromUserIds.API(v39)):andThen(function() --[[ Line: 93 ]]
                -- upvalues: l_Promise_0 (ref)
                return l_Promise_0.resolve();
            end):catch(function(v41) --[[ Line: 96 ]]
                -- upvalues: v22 (ref)
                v22:info((("GetTagsFromUserIds failed: %*"):format(v41)));
            end);
            if v27(v37) then
                v30:dispatch(l_NetworkingFriends_0.GetFriendRecommendationsFromUserId.API({
                    targetUserId = v31
                })):andThen(function(v42) --[[ Line: 105 ]]
                    -- upvalues: l_Dash_0 (ref), l_ContextualInfoTypes_0 (ref), v30 (ref), l_RoduxFriends_0 (ref), l_RecommendationSourceEnum_0 (ref), l_RoduxAnalytics_0 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref), l_Promise_0 (ref), l_fireAnalyticsEvent_0 (ref), l_EventNames_0 (ref), v37 (copy), v28 (ref)
                    local l_data_1 = v42.responseBody.data;
                    local v45 = l_Dash_0.map(l_data_1, function(v44) --[[ Line: 107 ]]
                        -- upvalues: l_ContextualInfoTypes_0 (ref)
                        if v44.contextType == l_ContextualInfoTypes_0.Contacts then
                            return v44.contactId;
                        else
                            return v44.id;
                        end;
                    end);
                    v30:dispatch(l_RoduxFriends_0.Actions.RecommendationSourceCreated({
                        source = l_RecommendationSourceEnum_0.HomepageFriendsCarousel, 
                        recommendationIds = v45
                    }));
                    local l_recommendationRequestId_0 = v42.responseBody.recommendationRequestId;
                    v30:dispatch(l_RoduxAnalytics_0.Actions.SessionIdUpdated({
                        sessionKey = l_RECOMMENDATION_SESSION_ID_KEY_0, 
                        sessionId = l_recommendationRequestId_0
                    }));
                    return l_Promise_0.resolve(v42):andThen(function(v47) --[[ Line: 123 ]]
                        -- upvalues: l_fireAnalyticsEvent_0 (ref), l_EventNames_0 (ref), v37 (ref), v28 (ref)
                        if l_fireAnalyticsEvent_0 then
                            local l_data_2 = v47.responseBody.data;
                            local v49 = l_data_2 and #l_data_2 or 0;
                            local l_recommendationRequestId_1 = v47.responseBody.recommendationRequestId;
                            l_fireAnalyticsEvent_0(l_EventNames_0.CarouselLoadedWithUsers, {
                                friendCount = v37, 
                                recommendationCount = v49, 
                                recommendationLimit = true, 
                                refreshCount = v28, 
                                fetchedRecommendations = true, 
                                recommendationSessionId = l_recommendationRequestId_1
                            });
                        end;
                    end);
                end):catch(function(v51) --[[ Line: 141 ]]
                    -- upvalues: v22 (ref)
                    v22:info((("GetFriendRecommendationsFromUserId failed: %*"):format(v51)));
                end);
            elseif l_fireAnalyticsEvent_0 then
                l_fireAnalyticsEvent_0(l_EventNames_0.CarouselLoadedWithUsers, {
                    friendCount = v37, 
                    recommendationCount = 0, 
                    recommendationLimit = true, 
                    refreshCount = v28, 
                    fetchedRecommendations = false
                });
            end;
            return l_Promise_0.resolve(l_data_0);
        end);
    end;
end;