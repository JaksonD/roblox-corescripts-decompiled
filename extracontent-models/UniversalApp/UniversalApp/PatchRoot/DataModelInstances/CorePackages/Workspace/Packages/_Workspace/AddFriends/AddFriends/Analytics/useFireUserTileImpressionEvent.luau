local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local v1 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_EntityTypes_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.EntityTypes;
local l_getRecommendationContextualInfoType_0 = require(l_Parent_0.SocialCommon).Utils.getRecommendationContextualInfoType;
local v5 = require(script.Parent.EventNames);
local v6 = require(script.Parent.useFireAnalyticsEvent);
local v7 = require(l_Parent_0.AddFriendsState);
local l_RecommendationContextType_0 = v7.RoduxFriends.Enums.RecommendationContextType;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_AddFriendsSelector_0 = v7.AddFriendsSelector;
local l_FFlagAddFriendsPYMKPresenceAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsPYMKPresenceAnalytics;
return function(v12, v13, v14) --[[ Line: 26 ]]
    -- upvalues: v6 (copy), l_FFlagAddFriendsPYMKPresenceAnalytics_0 (copy), l_useSelector_0 (copy), l_AddFriendsSelector_0 (copy), v1 (copy), l_RecommendationContextType_0 (copy), l_getRecommendationContextualInfoType_0 (copy), l_EntityTypes_0 (copy), v5 (copy), l_dependencyArray_0 (copy)
    local v15 = v6();
    local v17 = if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then l_useSelector_0(function(v16) --[[ Line: 29 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref)
        return l_AddFriendsSelector_0(v16, "Presence.byUserId") or {};
    end) else nil;
    return v1.useCallback(function(v18) --[[ Line: 35 ]]
        -- upvalues: l_FFlagAddFriendsPYMKPresenceAnalytics_0 (ref), v12 (copy), v17 (copy), l_RecommendationContextType_0 (ref), l_getRecommendationContextualInfoType_0 (ref), l_EntityTypes_0 (ref), v13 (copy), v15 (copy), v5 (ref), v14 (copy)
        local v19 = "";
        local v20 = "";
        local v21 = "";
        local v22 = "";
        local v23 = "";
        local v24 = "";
        local v25 = l_FFlagAddFriendsPYMKPresenceAnalytics_0 and "" or nil;
        for _, v27 in ipairs(v18) do
            local v28 = v12[v27];
            if v28 then
                local v29 = if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then (v17 and v17[v28.id] or {}).userPresenceType else nil;
                local v30 = v28.contextType and v28.contextType == l_RecommendationContextType_0.Contacts;
                v19 = v19 .. (v28.id or v28.entityId or "") .. ",";
                v20 = v20 .. v27 .. ",";
                v21 = v21 .. (v28.rank or "") .. ",";
                v22 = v22 .. (l_getRecommendationContextualInfoType_0(v28) or "") .. ",";
                v23 = v23 .. (if v30 then l_EntityTypes_0.Contact else "") .. ",";
                v24 = v24 .. math.floor((v27 - 1) / v13) + 1 .. ",";
                if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then
                    v25 = v25 .. (v29 and tostring(v29) or "") .. ",";
                else
                    v25 = nil;
                end;
            end;
        end;
        v15(v5.UserTileImpression, {
            namespace = v14, 
            targetUserId = v19, 
            absolutePosition = v20, 
            rank = v21, 
            contextType = v22, 
            entityType = v23, 
            rowInSort = v24, 
            presence = if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then v25 else nil
        });
    end, l_dependencyArray_0(v15, v12, v13, v14, if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then v17 else nil));
end;