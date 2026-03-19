local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local l_Actions_0 = l_Parent_0.Actions;
local v4 = require(l_Actions_0.FriendRequestCreated);
local v5 = require(l_Actions_0.FriendRequestDeclined);
local v6 = require(l_Actions_0.FriendshipCreated);
local v7 = require(l_Parent_0.Reducers.Friends.utils.removeIdsFromRequestsStore);
local _ = require(l_Parent_0.roduxFriendsTypes);
local v9 = require(l_Parent_1.llama);
local v10 = {};
return function(v11) --[[ Line: 19 ]]
    -- upvalues: v2 (copy), v10 (copy), v7 (copy), v9 (copy), v4 (copy), v5 (copy), v6 (copy)
    local l_friendsNetworking_0 = v11.friendsNetworking;
    local l_networkingBlocking_0 = v11.networkingBlocking;
    return v2.createReducer(v10, {
        [l_friendsNetworking_0.AcceptFriendRequestFromUserId.Succeeded.name] = function(v14, v15) --[[ Line: 24 ]]
            -- upvalues: v7 (ref)
            local l_ids_0 = v15.ids;
            return v7(v14, l_ids_0);
        end, 
        [l_friendsNetworking_0.DeclineFriendRequestFromUserId.Succeeded.name] = function(v17, v18) --[[ Line: 29 ]]
            -- upvalues: v7 (ref)
            local l_ids_1 = v18.ids;
            return v7(v17, l_ids_1);
        end, 
        [l_friendsNetworking_0.GetFriendRequests.Succeeded.name] = function(v20, v21) --[[ Line: 34 ]]
            -- upvalues: v9 (ref)
            local l_data_0 = v21.responseBody.data;
            local v23 = {};
            for _, v25 in pairs(l_data_0) do
                v23[tostring(v25.id)] = true;
            end;
            return (v9.Dictionary.join(v20, v23));
        end, 
        [v4.name] = function(v26, v27) --[[ Line: 49 ]]
            -- upvalues: v9 (ref)
            local l_requesteeId_0 = v27.requesteeId;
            return v9.Dictionary.join(v26, {
                [tostring(l_requesteeId_0)] = true
            });
        end, 
        [v5.name] = function(v29, v30) --[[ Line: 56 ]]
            -- upvalues: v7 (ref)
            local l_ids_2 = v30.ids;
            return v7(v29, l_ids_2);
        end, 
        [v6.name] = function(v32, v33) --[[ Line: 61 ]]
            -- upvalues: v7 (ref)
            assert(type(v33.payload.userId1) == "string", "Expected userId1 to be a string");
            assert(type(v33.payload.userId2) == "string", "Expected userId2 to be a string");
            return v7(v32, {
                v33.payload.userId1, 
                v33.payload.userId2
            });
        end, 
        [l_friendsNetworking_0.DeclineAllFriendRequests.Succeeded.name] = function() --[[ Line: 67 ]]
            return {};
        end, 
        [l_networkingBlocking_0.BlockUserById.Succeeded.name] = function(v34, v35) --[[ Line: 71 ]]
            -- upvalues: v7 (ref)
            local v36 = {
                (tostring(v35.namedIds.users))
            };
            return v7(v34, v36);
        end
    });
end;