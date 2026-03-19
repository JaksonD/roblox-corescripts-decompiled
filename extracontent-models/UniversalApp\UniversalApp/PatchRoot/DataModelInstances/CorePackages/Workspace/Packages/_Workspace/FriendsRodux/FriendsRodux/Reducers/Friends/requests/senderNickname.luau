local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local l_Actions_0 = l_Parent_0.Actions;
local v4 = require(l_Actions_0.FriendRequestCreated);
local v5 = require(l_Actions_0.FriendRequestDeclined);
local _ = require(l_Parent_0.roduxFriendsTypes);
local v7 = require(l_Parent_0.Reducers.Friends.utils.removeIdsFromRequestsStore);
local v8 = require(l_Parent_1.llama);
local v9 = {};
return function(v10) --[[ Line: 17 ]]
    -- upvalues: v2 (copy), v9 (copy), v7 (copy), v8 (copy), v4 (copy), v5 (copy)
    local l_friendsNetworking_0 = v10.friendsNetworking;
    return v2.createReducer(v9, {
        [l_friendsNetworking_0.AcceptFriendRequestFromUserId.Succeeded.name] = function(v12, v13) --[[ Line: 21 ]]
            -- upvalues: v7 (ref)
            local l_ids_0 = v13.ids;
            return v7(v12, l_ids_0);
        end, 
        [l_friendsNetworking_0.DeclineFriendRequestFromUserId.Succeeded.name] = function(v15, v16) --[[ Line: 26 ]]
            -- upvalues: v7 (ref)
            local l_ids_1 = v16.ids;
            return v7(v15, l_ids_1);
        end, 
        [l_friendsNetworking_0.GetFriendRequests.Succeeded.name] = function(v18, v19) --[[ Line: 34 ]]
            -- upvalues: v8 (ref)
            local l_data_0 = v19.responseBody.data;
            local v21 = {};
            for _, v23 in pairs(l_data_0) do
                v21[tostring(v23.id)] = v23.friendRequest.senderNickname;
            end;
            return (v8.Dictionary.join(v18, v21));
        end, 
        [v4.name] = function(v24, v25) --[[ Line: 49 ]]
            -- upvalues: v8 (ref)
            local l_requesteeId_0 = v25.requesteeId;
            local l_senderNickname_0 = v25.senderNickname;
            return v8.Dictionary.join(v24, {
                [tostring(l_requesteeId_0)] = l_senderNickname_0
            });
        end, 
        [v5.name] = function(v28, v29) --[[ Line: 57 ]]
            -- upvalues: v7 (ref)
            local l_ids_2 = v29.ids;
            return v7(v28, l_ids_2);
        end, 
        [l_friendsNetworking_0.DeclineAllFriendRequests.Succeeded.name] = function() --[[ Line: 62 ]]
            return {};
        end
    });
end;