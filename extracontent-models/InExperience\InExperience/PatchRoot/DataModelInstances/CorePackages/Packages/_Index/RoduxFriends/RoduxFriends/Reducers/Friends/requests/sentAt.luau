local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local _ = require(l_Parent_0.roduxFriendsTypes);
local l_Actions_0 = l_Parent_0.Actions;
local v5 = require(l_Actions_0.FriendRequestCreated);
local v6 = require(l_Actions_0.FriendRequestDeclined);
local v7 = require(l_Actions_0.FriendshipCreated);
local v8 = require(l_Parent_0.Reducers.Friends.utils.removeIdsFromRequestsStore);
local v9 = require(l_Parent_1.llama);
local v10 = {};
return function(v11) --[[ Line: 20 ]]
    -- upvalues: v2 (copy), v10 (copy), v8 (copy), v9 (copy), v5 (copy), v6 (copy), v7 (copy)
    local l_friendsNetworking_0 = v11.friendsNetworking;
    return v2.createReducer(v10, {
        [l_friendsNetworking_0.AcceptFriendRequestFromUserId.Succeeded.name] = function(v13, v14) --[[ Line: 24 ]]
            -- upvalues: v8 (ref)
            local l_ids_0 = v14.ids;
            return v8(v13, l_ids_0);
        end, 
        [l_friendsNetworking_0.DeclineFriendRequestFromUserId.Succeeded.name] = function(v16, v17) --[[ Line: 29 ]]
            -- upvalues: v8 (ref)
            local l_ids_1 = v17.ids;
            return v8(v16, l_ids_1);
        end, 
        [l_friendsNetworking_0.GetFriendRequests.Succeeded.name] = function(v19, v20) --[[ Line: 34 ]]
            -- upvalues: v9 (ref)
            local l_data_0 = v20.responseBody.data;
            local v22 = {};
            for _, v24 in pairs(l_data_0) do
                v22[tostring(v24.id)] = DateTime.fromIsoDate(v24.friendRequest.sentAt);
            end;
            return v9.Dictionary.join(v19, v22);
        end, 
        [v5.name] = function(v25, v26) --[[ Line: 45 ]]
            -- upvalues: v9 (ref)
            local v27 = tostring(v26.requesteeId);
            local l_sentAt_0 = v26.sentAt;
            return v9.Dictionary.join(v25, {
                [v27] = DateTime.fromIsoDate(l_sentAt_0)
            });
        end, 
        [v6.name] = function(v29, v30) --[[ Line: 53 ]]
            -- upvalues: v8 (ref)
            local l_ids_2 = v30.ids;
            return v8(v29, l_ids_2);
        end, 
        [v7.name] = function(v32, v33) --[[ Line: 58 ]]
            -- upvalues: v8 (ref)
            return v8(v32, {
                v33.payload.userId1, 
                v33.payload.userId2
            });
        end, 
        [l_friendsNetworking_0.DeclineAllFriendRequests.Succeeded.name] = function() --[[ Line: 61 ]]
            -- upvalues: v10 (ref)
            return v10;
        end
    });
end;