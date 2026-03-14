local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_NetworkingFriends_0 = v1.NetworkingFriends;
local l_RoduxFriends_0 = v1.RoduxFriends;
local l_llama_0 = v1.llama;
local l_RecommendationSourceEnum_0 = v1.SocialCommon.Enums.RecommendationSourceEnum;
return function() --[[ Line: 10 ]]
    -- upvalues: l_NetworkingFriends_0 (copy), l_llama_0 (copy), l_RoduxFriends_0 (copy), l_RecommendationSourceEnum_0 (copy)
    return {
        [l_NetworkingFriends_0.GetFriendRecommendationsFromUserId.Succeeded.name] = function(v6) --[[ Line: 12 ]]
            -- upvalues: l_llama_0 (ref), l_RoduxFriends_0 (ref), l_RecommendationSourceEnum_0 (ref)
            local v7 = v6.responseBody.data or {};
            local v9 = l_llama_0.List.map(v7, function(v8) --[[ Line: 15 ]]
                return v8.id;
            end);
            return {
                v6, 
                (l_RoduxFriends_0.Actions.RecommendationSourceCreated({
                    source = l_RecommendationSourceEnum_0.HomepageFriendsCarousel, 
                    recommendationIds = v9
                }))
            };
        end
    };
end;