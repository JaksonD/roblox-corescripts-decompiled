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
return function(v11) --[[ Line: 20 ]]
    -- upvalues: v2 (copy), v10 (copy), v7 (copy), v9 (copy), v4 (copy), v5 (copy), v6 (copy)
    local l_friendsNetworking_0 = v11.friendsNetworking;
    return v2.createReducer(v10, {
        [l_friendsNetworking_0.AcceptFriendRequestFromUserId.Succeeded.name] = function(v13, v14) --[[ Line: 24 ]]
            -- upvalues: v7 (ref)
            local l_ids_0 = v14.ids;
            return v7(v13, l_ids_0);
        end, 
        [l_friendsNetworking_0.DeclineFriendRequestFromUserId.Succeeded.name] = function(v16, v17) --[[ Line: 29 ]]
            -- upvalues: v7 (ref)
            local l_ids_1 = v17.ids;
            return v7(v16, l_ids_1);
        end, 
        [l_friendsNetworking_0.GetFriendRequests.Succeeded.name] = function(v19, v20) --[[ Line: 34 ]]
            -- upvalues: v9 (ref)
            local l_data_0 = v20.responseBody.data;
            local v22 = {};
            for _, v24 in pairs(l_data_0) do
                v22[tostring(v24.id)] = true;
            end;
            return (v9.Dictionary.join(v19, v22));
        end, 
        [v4.name] = function(v25, v26) --[[ Line: 46 ]]
            -- upvalues: v9 (ref)
            local l_requesteeId_0 = v26.requesteeId;
            return v9.Dictionary.join(v25, {
                [tostring(l_requesteeId_0)] = true
            });
        end, 
        [v5.name] = function(v28, v29) --[[ Line: 53 ]]
            -- upvalues: v7 (ref)
            local l_ids_2 = v29.ids;
            return v7(v28, l_ids_2);
        end, 
        [v6.name] = function(v31, v32) --[[ Line: 58 ]]
            -- upvalues: v7 (ref)
            assert(type(v32.payload.userId1) == "string", "Expected userId1 to be a string");
            assert(type(v32.payload.userId2) == "string", "Expected userId2 to be a string");
            return v7(v31, {
                v32.payload.userId1, 
                v32.payload.userId2
            });
        end, 
        [l_friendsNetworking_0.DeclineAllFriendRequests.Succeeded.name] = function() --[[ Line: 64 ]]
            return {};
        end
    });
end;