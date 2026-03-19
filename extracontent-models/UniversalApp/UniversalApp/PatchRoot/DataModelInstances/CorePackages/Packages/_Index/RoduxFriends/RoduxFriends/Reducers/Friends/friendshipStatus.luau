local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_1.llama);
local l_Actions_0 = l_Parent_0.Actions;
local v5 = require(l_Actions_0.FriendshipCreated);
local v6 = require(l_Actions_0.FriendshipDestroyed);
local v7 = require(l_Actions_0.FriendRequestCreated);
local v8 = require(l_Actions_0.FriendRequestDeclined);
local _ = require(l_Parent_0.roduxFriendsTypes);
local v10 = {};
local function _(v11) --[[ Line: 18 ]] --[[ Name: mapFriendshipStatusToEnum ]]
    if v11 == "NotFriends" then
        return Enum.FriendStatus.NotFriend;
    elseif v11 == "Friends" then
        return Enum.FriendStatus.Friend;
    elseif v11 == "RequestSent" then
        return Enum.FriendStatus.FriendRequestSent;
    elseif v11 == "RequestReceived" then
        return Enum.FriendStatus.FriendRequestReceived;
    else
        return Enum.FriendStatus.Unknown;
    end;
end;
local function v24(v13, v14) --[[ Line: 32 ]] --[[ Name: difference ]]
    local v15 = {};
    for _, v17 in pairs(v13) do
        v15[v17] = true;
    end;
    for _, v19 in pairs(v14) do
        v15[v19] = nil;
    end;
    local v20 = {};
    local v21 = 0;
    for _, v23 in pairs(v13) do
        if v15[v23] then
            v21 = v21 + 1;
            v20[v21] = v23;
        end;
    end;
    return v20;
end;
return function(v25) --[[ Line: 54 ]]
    -- upvalues: v2 (copy), v10 (copy), v3 (copy), v24 (copy), v6 (copy), v5 (copy), v7 (copy), v8 (copy)
    local l_friendsNetworking_0 = v25.friendsNetworking;
    return v2.createReducer(v10, {
        [l_friendsNetworking_0.GetFriendshipStatus.Succeeded.name] = function(v27, v28) --[[ Line: 58 ]]
            -- upvalues: v3 (ref)
            local v29 = {};
            for _, v31 in pairs(v28.responseBody.data) do
                local v32 = tostring(v31.id);
                local l_status_0 = v31.status;
                v29[v32] = if l_status_0 == "NotFriends" then Enum.FriendStatus.NotFriend else if l_status_0 == "Friends" then Enum.FriendStatus.Friend else if l_status_0 == "RequestSent" then Enum.FriendStatus.FriendRequestSent else if l_status_0 == "RequestReceived" then Enum.FriendStatus.FriendRequestReceived else Enum.FriendStatus.Unknown;
            end;
            return v3.Dictionary.join(v27, v29);
        end, 
        [l_friendsNetworking_0.GetExtendedFriendshipStatus.Succeeded.name] = function(v34, v35) --[[ Line: 66 ]]
            -- upvalues: v3 (ref)
            local v36 = tostring(v35.ids[1]);
            local l_join_0 = v3.Dictionary.join;
            local l_v34_0 = v34;
            local v39 = {};
            local l_status_1 = v35.responseBody.status;
            v39[v36] = if l_status_1 == "NotFriends" then Enum.FriendStatus.NotFriend else if l_status_1 == "Friends" then Enum.FriendStatus.Friend else if l_status_1 == "RequestSent" then Enum.FriendStatus.FriendRequestSent else if l_status_1 == "RequestReceived" then Enum.FriendStatus.FriendRequestReceived else Enum.FriendStatus.Unknown;
            return l_join_0(l_v34_0, v39);
        end, 
        [l_friendsNetworking_0.GetFriendsFromUserId.Succeeded.name] = function(v41, v42) --[[ Line: 71 ]]
            -- upvalues: v3 (ref), v24 (ref)
            local v44 = v3.Dictionary.keys(v3.Dictionary.filter(v41, function(v43) --[[ Line: 72 ]]
                return v43 == Enum.FriendStatus.Friend;
            end));
            local v46 = v3.List.map(v3.Dictionary.values(v42.responseBody.data), function(v45) --[[ Line: 75 ]]
                return (tostring(v45.id));
            end);
            local v47 = v24(v46, v44);
            local v48 = v24(v44, v46);
            for _, v50 in pairs(v47) do
                v41 = v3.Dictionary.join(v41, {
                    [v50] = Enum.FriendStatus.Friend
                });
            end;
            for _, v52 in pairs(v48) do
                v41 = v3.Dictionary.join(v41, {
                    [v52] = Enum.FriendStatus.Unknown
                });
            end;
            return v41;
        end, 
        [l_friendsNetworking_0.UnfriendTargetUserId.Succeeded.name] = function(v53, v54) --[[ Line: 94 ]]
            -- upvalues: v3 (ref)
            local v55 = tostring(v54.namedIds.users);
            return v3.Dictionary.join(v53, {
                [v55] = Enum.FriendStatus.NotFriend
            });
        end, 
        [l_friendsNetworking_0.AcceptFriendRequestFromUserId.Succeeded.name] = function(v56, v57) --[[ Line: 101 ]]
            -- upvalues: v3 (ref)
            local v58 = tostring(v57.ids[1]);
            return v3.Dictionary.join(v56, {
                [v58] = Enum.FriendStatus.Friend
            });
        end, 
        [l_friendsNetworking_0.DeclineFriendRequestFromUserId.Succeeded.name] = function(v59, v60) --[[ Line: 108 ]]
            -- upvalues: v3 (ref)
            local l_ids_0 = v60.ids;
            local v62 = {};
            for _, v64 in pairs(l_ids_0) do
                v62[tostring(v64)] = Enum.FriendStatus.NotFriend;
            end;
            return v3.Dictionary.join(v59, v62);
        end, 
        [l_friendsNetworking_0.GetFriendRequests.Succeeded.name] = function(v65, v66) --[[ Line: 117 ]]
            -- upvalues: v3 (ref)
            local l_data_0 = v66.responseBody.data;
            local v68 = {};
            for _, v70 in pairs(l_data_0) do
                v68[tostring(v70.id)] = Enum.FriendStatus.FriendRequestReceived;
            end;
            return v3.Dictionary.join(v65, v68);
        end, 
        [l_friendsNetworking_0.DeclineAllFriendRequests.Succeeded.name] = function(v71) --[[ Line: 126 ]]
            -- upvalues: v3 (ref)
            local v72 = {};
            for v73, v74 in pairs(v71) do
                if v74 == Enum.FriendStatus.FriendRequestReceived then
                    v72[tostring(v73)] = Enum.FriendStatus.NotFriend;
                end;
            end;
            return v3.Dictionary.join(v71, v72);
        end, 
        [l_friendsNetworking_0.RequestFriendshipFromUserId.Succeeded.name] = function(v75, v76) --[[ Line: 136 ]]
            -- upvalues: v3 (ref)
            local v77 = tostring(v76.namedIds.users);
            return v3.Dictionary.join(v75, {
                [v77] = Enum.FriendStatus.FriendRequestSent
            });
        end, 
        [l_friendsNetworking_0.RequestFriendshipFromContactId.Succeeded.name] = function(v78, v79) --[[ Line: 143 ]]
            -- upvalues: v3 (ref)
            local v80 = tostring(v79.namedIds.contacts);
            return v3.Dictionary.join(v78, {
                [v80] = Enum.FriendStatus.FriendRequestSent
            });
        end, 
        [v6.name] = function(v81, v82) --[[ Line: 150 ]]
            -- upvalues: v3 (ref)
            local v83 = tostring(v82.payload.userId1);
            return v3.Dictionary.join(v81, {
                [v83] = Enum.FriendStatus.NotFriend
            });
        end, 
        [v5.name] = function(v84, v85) --[[ Line: 157 ]]
            -- upvalues: v3 (ref)
            local v86 = tostring(v85.payload.userId1);
            return v3.Dictionary.join(v84, {
                [v86] = Enum.FriendStatus.Friend
            });
        end, 
        [v7.name] = function(v87, v88) --[[ Line: 164 ]]
            -- upvalues: v3 (ref)
            local v89 = tostring(v88.requesteeId);
            return v3.Dictionary.join(v87, {
                [v89] = Enum.FriendStatus.FriendRequestReceived
            });
        end, 
        [v8.name] = function(v90, v91) --[[ Line: 171 ]]
            -- upvalues: v3 (ref)
            local l_ids_1 = v91.ids;
            local v93 = {};
            for _, v95 in pairs(l_ids_1) do
                v93[tostring(v95)] = Enum.FriendStatus.NotFriend;
            end;
            return v3.Dictionary.join(v90, v93);
        end
    });
end;