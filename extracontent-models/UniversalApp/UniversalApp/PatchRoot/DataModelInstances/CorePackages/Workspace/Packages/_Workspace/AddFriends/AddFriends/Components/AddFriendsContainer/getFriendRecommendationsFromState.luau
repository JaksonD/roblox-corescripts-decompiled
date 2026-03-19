local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local v1 = require(l_Parent_0.llama);
local l_RecommendationSourceEnum_0 = require(l_Parent_0.SocialCommon).Enums.RecommendationSourceEnum;
local v3 = require(l_Parent_0.AddFriendsState);
local l_AddFriendsSelector_0 = v3.AddFriendsSelector;
local l_RoduxFriends_0 = v3.RoduxFriends;
local l_RecommendationContextType_0 = l_RoduxFriends_0.Enums.RecommendationContextType;
local l_EntityType_0 = require(l_Parent_0.UserList).Enums.EntityType;
local l_FFlagAddFriendsRenderTileRefactor_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsRenderTileRefactor;
return function(v9) --[[ Line: 20 ]]
    -- upvalues: l_RoduxFriends_0 (copy), l_RecommendationSourceEnum_0 (copy), v1 (copy), l_AddFriendsSelector_0 (copy), l_FFlagAddFriendsRenderTileRefactor_0 (copy), l_RecommendationContextType_0 (copy), l_EntityType_0 (copy)
    local l_LocalUserId_0 = v9.LocalUserId;
    local v11 = l_RoduxFriends_0.Selectors.getRecommendationIdsBySource(v9)(l_RecommendationSourceEnum_0.AddFriendsPage);
    local v12 = l_RoduxFriends_0.Selectors.getSortedByRankRecommendationIds(v9)(l_LocalUserId_0, v11);
    local function v17(v13) --[[ Line: 28 ]]
        -- upvalues: v1 (ref), l_AddFriendsSelector_0 (ref), v9 (copy), l_LocalUserId_0 (copy), l_FFlagAddFriendsRenderTileRefactor_0 (ref), l_RecommendationContextType_0 (ref), l_EntityType_0 (ref)
        local v14 = v1.Dictionary.join(l_AddFriendsSelector_0(v9, "Users.byUserId.%s", v13), l_AddFriendsSelector_0(v9, "Friends.recommendations.byUserId.%s.%s", l_LocalUserId_0, v13), {
            isRecommendation = true
        });
        if l_FFlagAddFriendsRenderTileRefactor_0 then
            local v15 = l_AddFriendsSelector_0(v9, "Friends.recommendations.byUserId.%s.%s", l_LocalUserId_0, v13);
            local v16 = v15.contextType == l_RecommendationContextType_0.Contacts;
            return v1.Dictionary.join({
                id = v13
            }, if v16 then {
                type = l_EntityType_0.Contact, 
                entityId = v13, 
                entityDisplayName = v15.entityDisplayName, 
                thumbnailEntities = v15.thumbnailEntities
            } else {});
        else
            return v14;
        end;
    end;
    return (v1.List.map(v12, v17));
end;