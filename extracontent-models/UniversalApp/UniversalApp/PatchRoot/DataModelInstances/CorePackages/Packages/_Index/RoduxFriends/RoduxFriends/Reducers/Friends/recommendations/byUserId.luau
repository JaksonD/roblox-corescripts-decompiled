local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_1.llama);
local l_Models_0 = l_Parent_0.Models;
local v5 = require(l_Models_0.Recommendation);
local l_Actions_0 = l_Parent_0.Actions;
local v7 = require(l_Actions_0.RecommendationCreated);
local v8 = require(l_Actions_0.FriendshipCreated);
local v9 = require(l_Actions_0.RecommendationDestroyed);
local _ = require(l_Parent_0.roduxFriendsTypes);
local v11 = {};
local function _(v12, v13) --[[ Line: 18 ]]
    -- upvalues: v3 (copy)
    local v14 = v13[v12.baseUserId];
    if v14 then
        return (v3.Dictionary.removeKey(v14, v12.recommendedUserId));
    else
        return nil;
    end;
end;
local function v24(v16, v17) --[[ Line: 27 ]]
    -- upvalues: v3 (copy)
    local l_join_0 = v3.Dictionary.join;
    local l_v17_0 = v17;
    local v20 = {};
    local l_userId1_0 = v16.userId1;
    local v22 = {
        baseUserId = v16.userId1, 
        recommendedUserId = v16.userId2
    };
    local v23 = v17[v22.baseUserId];
    v20[l_userId1_0] = if v23 then v3.Dictionary.removeKey(v23, v22.recommendedUserId) else nil;
    l_userId1_0 = v16.userId2;
    v22 = {
        baseUserId = v16.userId2, 
        recommendedUserId = v16.userId1
    };
    v23 = v17[v22.baseUserId];
    v20[l_userId1_0] = if v23 then v3.Dictionary.removeKey(v23, v22.recommendedUserId) else nil;
    return l_join_0(l_v17_0, v20);
end;
local function _(v25, v26) --[[ Line: 40 ]]
    -- upvalues: v3 (copy), v24 (copy)
    local l_v26_0 = v26;
    v3.Dictionary.map(v25.users, function(v28) --[[ Line: 43 ]]
        -- upvalues: l_v26_0 (ref), v24 (ref), v25 (copy)
        l_v26_0 = v24({
            userId1 = v25.baseFriendId, 
            userId2 = tostring(v28.id)
        }, l_v26_0);
    end);
    return l_v26_0;
end;
return function(v30) --[[ Line: 53 ]]
    -- upvalues: v2 (copy), v11 (copy), v7 (copy), v3 (copy), v5 (copy), v9 (copy), v8 (copy), v24 (copy)
    local l_friendsNetworking_0 = v30.friendsNetworking;
    local l_networkingBlocking_0 = v30.networkingBlocking;
    return v2.createReducer(v11, {
        [v7.name] = function(v33, v34) --[[ Line: 58 ]]
            -- upvalues: v3 (ref), v5 (ref)
            local v35 = tostring(v34.payload.baseUserId);
            local v36 = tostring(v34.payload.recommendedUser.id);
            local v37 = v33[v35] or {};
            return v3.Dictionary.join(v33, {
                [v35] = v3.Dictionary.join(v37, {
                    [v36] = v5.format(v34.payload.recommendedUser)
                })
            });
        end, 
        [v9.name] = function(v38, v39) --[[ Line: 75 ]]
            -- upvalues: v3 (ref)
            local l_join_1 = v3.Dictionary.join;
            local l_v38_0 = v38;
            local v42 = {};
            local l_baseUserId_0 = v39.payload.baseUserId;
            local l_payload_0 = v39.payload;
            local v45 = v38[l_payload_0.baseUserId];
            v42[l_baseUserId_0] = if v45 then v3.Dictionary.removeKey(v45, l_payload_0.recommendedUserId) else nil;
            return l_join_1(l_v38_0, v42);
        end, 
        [l_friendsNetworking_0.GetFriendRecommendationsFromUserId.Succeeded.name] = function(v46, v47) --[[ Line: 84 ]]
            -- upvalues: v3 (ref), v5 (ref)
            local v48 = tostring(v47.namedIds.users);
            local l_data_0 = v47.responseBody.data;
            local v53 = v3.Dictionary.map(l_data_0, function(v50, _) --[[ Line: 91 ]]
                -- upvalues: v5 (ref)
                local v52 = if v50.contextType == "Contacts" then v50.contactId else tostring(v50.id);
                return v5.format({
                    id = v52, 
                    contactId = v50.contactId, 
                    mutualFriendsList = v50.mutualFriendsList, 
                    rank = v50.rank, 
                    contextType = v50.contextType, 
                    thumbnailEntities = v50.thumbnailEntities, 
                    displayName = v50.displayName
                }), v52;
            end);
            local v54 = v46[v48] or {};
            return v3.Dictionary.join(v46, {
                [v48] = v3.Dictionary.join(v54, v53)
            });
        end, 
        [v8.name] = function(v55, v56) --[[ Line: 113 ]]
            -- upvalues: v24 (ref)
            return v24(v56.payload, v55);
        end, 
        [l_friendsNetworking_0.GetFriendsFromUserId.Succeeded.name] = function(v57, v58) --[[ Line: 120 ]]
            -- upvalues: v3 (ref), v24 (ref)
            local v59 = {
                baseFriendId = tostring(v58.namedIds.users), 
                users = v58.responseBody.data
            };
            local l_v57_0 = v57;
            v3.Dictionary.map(v59.users, function(v61) --[[ Line: 43 ]]
                -- upvalues: l_v57_0 (ref), v24 (ref), v59 (copy)
                l_v57_0 = v24({
                    userId1 = v59.baseFriendId, 
                    userId2 = tostring(v61.id)
                }, l_v57_0);
            end);
            return l_v57_0;
        end, 
        [l_friendsNetworking_0.AcceptFriendRequestFromUserId.Succeeded.name] = function(v62, v63) --[[ Line: 130 ]]
            -- upvalues: v24 (ref)
            local v64 = tostring(v63.ids[1]);
            local v65 = tostring(v63.additionalData.currentUserId);
            return v24({
                userId1 = v65, 
                userId2 = v64
            }, v62);
        end, 
        [l_networkingBlocking_0.BlockUserById.Succeeded.name] = function(v66, v67) --[[ Line: 143 ]]
            -- upvalues: v24 (ref)
            local v68 = tostring(v67.additionalData.currentUserId);
            local v69 = tostring(v67.namedIds.users);
            return v24({
                userId1 = v68, 
                userId2 = v69
            }, v66);
        end
    });
end;