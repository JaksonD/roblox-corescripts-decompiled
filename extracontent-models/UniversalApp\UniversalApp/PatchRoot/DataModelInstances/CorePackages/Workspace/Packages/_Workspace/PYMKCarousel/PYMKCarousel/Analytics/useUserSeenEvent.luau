local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Common.Constants);
local v2 = require(l_Parent_0.dependencies);
local l_Parent_1 = l_Parent_0.Parent;
local l_llama_0 = v2.llama;
local l_React_0 = v2.React;
local l_useSelector_0 = v2.Hooks.useSelector;
local l_getDeepValue_0 = v2.SocialLibraries.Dictionary.getDeepValue;
local v8 = require(script.Parent.EventNames);
local v9 = require(script.Parent.getFriendStatus);
local l_RecommendationContextType_0 = v2.RoduxFriends.Enums.RecommendationContextType;
local l_getFFlagPYMKAddFriendsEntry_0 = v2.getFFlagPYMKAddFriendsEntry;
local l_FFlagHomepagePYMKPresenceAnalytics_0 = require(l_Parent_1.SharedFlags).FFlagHomepagePYMKPresenceAnalytics;
return function(v13) --[[ Line: 17 ]]
    -- upvalues: l_React_0 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), v1 (copy), l_FFlagHomepagePYMKPresenceAnalytics_0 (copy), l_getFFlagPYMKAddFriendsEntry_0 (copy), v8 (copy), l_RecommendationContextType_0 (copy), v9 (copy), l_llama_0 (copy)
    local v14 = l_React_0.useRef({});
    local v16 = l_useSelector_0(function(v15) --[[ Line: 19 ]]
        -- upvalues: l_getDeepValue_0 (ref), v1 (ref)
        return l_getDeepValue_0(v15, string.format("%s.Friends.friendshipStatus", v1.RODUX_KEY)) or {};
    end);
    local v18 = l_useSelector_0(function(v17) --[[ Line: 22 ]]
        -- upvalues: l_getDeepValue_0 (ref), v1 (ref)
        return l_getDeepValue_0(v17, string.format("%s.Friends.recommendations.hasIncomingFriendRequest", v1.RODUX_KEY));
    end) or {};
    local v20 = if l_FFlagHomepagePYMKPresenceAnalytics_0 then l_useSelector_0(function(v19) --[[ Line: 30 ]]
        -- upvalues: l_getDeepValue_0 (ref)
        return l_getDeepValue_0(v19, "PYMKCarousel.Presence.byUserId") or {};
    end) else nil;
    return l_React_0.useMemo(function() --[[ Line: 35 ]]
        -- upvalues: v14 (copy), l_getFFlagPYMKAddFriendsEntry_0 (ref), v13 (copy), v8 (ref), l_RecommendationContextType_0 (ref), v9 (ref), v16 (copy), v18 (copy), l_FFlagHomepagePYMKPresenceAnalytics_0 (ref), v20 (copy), l_llama_0 (ref)
        return {
            {
                viewabilityConfig = {
                    itemVisiblePercentThreshold = 50, 
                    waitForInteraction = false
                }, 
                onViewableItemsChanged = function(v21) --[[ Line: 42 ]] --[[ Name: onViewableItemsChanged ]]
                    -- upvalues: v14 (ref), l_getFFlagPYMKAddFriendsEntry_0 (ref), v13 (ref), v8 (ref), l_RecommendationContextType_0 (ref), v9 (ref), v16 (ref), v18 (ref), l_FFlagHomepagePYMKPresenceAnalytics_0 (ref), v20 (ref), l_llama_0 (ref)
                    for _, v23 in pairs(v21.changed) do
                        local l_item_0 = v23.item;
                        local v25 = v14.current or {};
                        local v26 = not v25[l_item_0.id];
                        if l_getFFlagPYMKAddFriendsEntry_0() then
                            v26 = not v25[l_item_0.id] and not l_item_0.isTooltip and not l_item_0.isButtonTile;
                        end;
                        if v26 then
                            v13(v8.UserSeen, {
                                userId = l_item_0.id, 
                                contactId = if l_item_0.recommendationContextType == l_RecommendationContextType_0.Contacts then l_item_0.id else nil, 
                                friendStatus = v9(v16[l_item_0.id], v18[l_item_0.id]), 
                                recommendationContextType = l_item_0.recommendationContextType, 
                                recommendationRank = l_item_0.recommendationRank, 
                                absolutePosition = l_item_0.absolutePosition, 
                                presence = if l_FFlagHomepagePYMKPresenceAnalytics_0 then (v20[l_item_0.id] or {}).userPresenceType else nil
                            });
                            v14.current = l_llama_0.Dictionary.join(v14.current, {
                                [l_item_0.id] = true
                            });
                        end;
                    end;
                end
            }
        };
    end, {
        if l_FFlagHomepagePYMKPresenceAnalytics_0 then v20 else nil
    });
end;