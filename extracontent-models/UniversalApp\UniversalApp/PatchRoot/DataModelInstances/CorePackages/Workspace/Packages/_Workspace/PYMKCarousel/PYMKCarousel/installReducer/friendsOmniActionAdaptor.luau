local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_RoduxFriends_0 = v1.RoduxFriends;
local l_Players_0 = v1.Players;
local l_llama_0 = v1.llama;
local v5 = require(script.Parent.transformOmniRecommendationsToActions);
local _ = require(l_script_FirstAncestor_0.Common.OmniTypes);
local v7 = require(l_script_FirstAncestor_0.Common.Constants);
local l_RecommendationContextType_0 = l_RoduxFriends_0.Enums.RecommendationContextType;
local l_SocialCommon_0 = v1.SocialCommon;
local l_RecommendationSourceEnum_0 = l_SocialCommon_0.Enums.RecommendationSourceEnum;
local l_ContextualInfoTypes_0 = l_SocialCommon_0.Enums.ContextualInfoTypes;
local function _(v12) --[[ Line: 16 ]]
    -- upvalues: l_RecommendationContextType_0 (copy)
    local v13 = l_RecommendationContextType_0.fromRawValue(v12);
    return v13 and v13 ~= l_RecommendationContextType_0.None;
end;
local function v22(v15, v16, v17) --[[ Line: 21 ]]
    -- upvalues: l_RecommendationContextType_0 (copy), l_ContextualInfoTypes_0 (copy), v7 (copy)
    local l_contextType_0 = v15.contextType;
    local v19 = l_RecommendationContextType_0.fromRawValue(l_contextType_0);
    local v20 = if v19 and v19 ~= l_RecommendationContextType_0.None then v15.contextType else v17.contextType;
    local v21 = v17.mutualFriendsCount and tonumber(v17.mutualFriendsCount) or 0;
    if v20 == l_RecommendationContextType_0.MutualFriends.rawValue() and v21 == 0 then
        v20 = l_RecommendationContextType_0.None.rawValue();
    end;
    l_contextType_0 = if v20 == l_ContextualInfoTypes_0.Contacts then {
        avatarImageUrl = v15.AvatarThumbnailUrl, 
        headshotImageUrl = v15.HeadshotThumbnailUrl
    } else nil;
    return {
        id = if v20 == l_ContextualInfoTypes_0.Contacts then v15.ContactId else tostring(v15.userId), 
        contextType = v20, 
        mutualFriendsList = v15.mutualFriendDisplayName, 
        rank = if v17.rank then tonumber(v17.rank) else v16, 
        mutualFriendsCount = v21, 
        hasIncomingFriendRequest = v17.hasPendingFriendRequest == v7.BE_TRUE_VALUE, 
        thumbnailEntities = l_contextType_0, 
        contactId = v15.ContactId, 
        displayName = v15.ContactName
    };
end;
local function v28(v23, v24, v25) --[[ Line: 57 ]]
    -- upvalues: l_Players_0 (copy), l_RoduxFriends_0 (copy), v22 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    assert(l_LocalPlayer_0, "LocalPlayer must be non-nil");
    local v27 = tostring(l_LocalPlayer_0.UserId);
    return l_RoduxFriends_0.Actions.RecommendationCreated({
        baseUserId = v27, 
        recommendedUser = v22(v23, v24, v25)
    });
end;
local function v32(_, v30) --[[ Line: 72 ]]
    -- upvalues: l_llama_0 (copy), l_RoduxFriends_0 (copy), l_RecommendationSourceEnum_0 (copy)
    local v31 = l_llama_0.Dictionary.keys(v30 or {});
    return l_RoduxFriends_0.Actions.RecommendationSourceCreated({
        source = l_RecommendationSourceEnum_0.HomepagePYMKCarousel, 
        recommendationIds = v31
    });
end;
return function(v33) --[[ Line: 84 ]]
    -- upvalues: v5 (copy), v28 (copy), v32 (copy)
    return {
        AddContentMetadata = function(v34) --[[ Line: 86 ]] --[[ Name: AddContentMetadata ]]
            return {
                v34
            };
        end, 
        AddOmniRecommendations = function(v35) --[[ Line: 91 ]] --[[ Name: AddOmniRecommendations ]]
            -- upvalues: v5 (ref), v33 (copy), v28 (ref), v32 (ref)
            return v5(v35.recommendations or {}, v33, v28, v32);
        end
    };
end;