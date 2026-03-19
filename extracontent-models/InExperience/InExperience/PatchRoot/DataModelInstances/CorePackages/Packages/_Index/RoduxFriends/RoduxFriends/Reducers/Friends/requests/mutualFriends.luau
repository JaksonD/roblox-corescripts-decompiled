local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local l_Actions_0 = l_Parent_0.Actions;
local v4 = require(l_Actions_0.FriendRequestCreated);
local v5 = require(l_Actions_0.FriendRequestDeclined);
local v6 = require(l_Parent_0.Reducers.Friends.utils.removeIdsFromRequestsStore);
local _ = require(l_Parent_0.roduxFriendsTypes);
local v8 = require(l_Parent_1.llama);
local v9 = {};
return function(v10) --[[ Line: 19 ]]
    -- upvalues: v2 (copy), v9 (copy), v6 (copy), v8 (copy), v4 (copy), v5 (copy)
    local l_friendsNetworking_0 = v10.friendsNetworking;
    return v2.createReducer(v9, {
        [l_friendsNetworking_0.AcceptFriendRequestFromUserId.Succeeded.name] = function(v12, v13) --[[ Line: 23 ]]
            -- upvalues: v6 (ref)
            local l_ids_0 = v13.ids;
            return v6(v12, l_ids_0);
        end, 
        [l_friendsNetworking_0.DeclineFriendRequestFromUserId.Succeeded.name] = function(v15, v16) --[[ Line: 28 ]]
            -- upvalues: v6 (ref)
            local l_ids_1 = v16.ids;
            return v6(v15, l_ids_1);
        end, 
        [l_friendsNetworking_0.GetFriendRequests.Succeeded.name] = function(v18, v19) --[[ Line: 33 ]]
            -- upvalues: v8 (ref)
            local l_data_0 = v19.responseBody.data;
            local v21 = {};
            for _, v23 in pairs(l_data_0) do
                if v23.mutualFriendsList then
                    v21[tostring(v23.id)] = v8.List.map(v23.mutualFriendsList, function(v24) --[[ Line: 40 ]]
                        return (tostring(v24));
                    end);
                end;
            end;
            return (v8.Dictionary.join(v18, v21));
        end, 
        [v4.name] = function(v25, v26) --[[ Line: 49 ]]
            -- upvalues: v8 (ref)
            local l_requesteeId_0 = v26.requesteeId;
            local l_mutualFriends_0 = v26.mutualFriends;
            return v8.Dictionary.join(v25, {
                [tostring(l_requesteeId_0)] = v8.List.map(l_mutualFriends_0, function(v29) --[[ Line: 54 ]]
                    return (tostring(v29));
                end)
            });
        end, 
        [v5.name] = function(v30, v31) --[[ Line: 59 ]]
            -- upvalues: v6 (ref)
            local l_ids_2 = v31.ids;
            return v6(v30, l_ids_2);
        end, 
        [l_friendsNetworking_0.DeclineAllFriendRequests.Succeeded.name] = function() --[[ Line: 64 ]]
            return {};
        end
    });
end;