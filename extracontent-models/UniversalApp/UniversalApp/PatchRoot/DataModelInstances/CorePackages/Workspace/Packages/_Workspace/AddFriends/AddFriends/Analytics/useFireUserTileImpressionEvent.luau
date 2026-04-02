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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v13, v14, v15) --[[ Line: 29 ]]
    -- upvalues: v6 (copy), l_FFlagAddFriendsPYMKPresenceAnalytics_0 (copy), l_useSelector_0 (copy), l_AddFriendsSelector_0 (copy), v1 (copy), l_RecommendationContextType_0 (copy), l_getRecommendationContextualInfoType_0 (copy), l_EntityTypes_0 (copy), v5 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v16 = v6();
    local v18 = if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then l_useSelector_0(function(v17) --[[ Line: 32 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref)
        return l_AddFriendsSelector_0(v17, "Presence.byUserId") or {};
    end) else nil;
    return v1.useCallback(function(v19) --[[ Line: 38 ]]
        -- upvalues: l_FFlagAddFriendsPYMKPresenceAnalytics_0 (ref), v13 (copy), v18 (copy), l_RecommendationContextType_0 (ref), l_getRecommendationContextualInfoType_0 (ref), l_EntityTypes_0 (ref), v14 (copy), v16 (copy), v5 (ref), v15 (copy)
        local v20 = "";
        local v21 = "";
        local v22 = "";
        local v23 = "";
        local v24 = "";
        local v25 = "";
        local v26 = l_FFlagAddFriendsPYMKPresenceAnalytics_0 and "" or nil;
        for _, v28 in ipairs(v19) do
            local v29 = v13[v28];
            if v29 then
                local v30 = if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then (v18 and v18[v29.id] or {}).userPresenceType else nil;
                local v31 = v29.contextType and v29.contextType == l_RecommendationContextType_0.Contacts;
                v20 = v20 .. (v29.id or v29.entityId or "") .. ",";
                v21 = v21 .. v28 .. ",";
                v22 = v22 .. (v29.rank or "") .. ",";
                v23 = v23 .. (l_getRecommendationContextualInfoType_0(v29) or "") .. ",";
                v24 = v24 .. (if v31 then l_EntityTypes_0.Contact else "") .. ",";
                v25 = v25 .. math.floor((v28 - 1) / v14) + 1 .. ",";
                if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then
                    v26 = v26 .. (v30 and tostring(v30) or "") .. ",";
                else
                    v26 = nil;
                end;
            end;
        end;
        v16(v5.UserTileImpression, {
            namespace = v15, 
            targetUserId = v20, 
            absolutePosition = v21, 
            rank = v22, 
            contextType = v23, 
            entityType = v24, 
            rowInSort = v25, 
            presence = if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then v26 else nil
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v16, 
        v13, 
        v14, 
        v15, 
        if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then v18 else nil
    } else l_dependencyArray_0(v16, v13, v14, v15, if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then v18 else nil));
end;