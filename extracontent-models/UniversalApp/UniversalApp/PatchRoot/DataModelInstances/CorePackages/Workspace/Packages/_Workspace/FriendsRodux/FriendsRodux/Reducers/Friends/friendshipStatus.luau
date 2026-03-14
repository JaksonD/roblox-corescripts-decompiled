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
local function _(v11) --[[ Line: 16 ]] --[[ Name: mapFriendshipStatusToEnum ]]
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
local function v24(v13, v14) --[[ Line: 30 ]] --[[ Name: difference ]]
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
return function(v25) --[[ Line: 52 ]]
    -- upvalues: v2 (copy), v10 (copy), v3 (copy), v24 (copy), v6 (copy), v5 (copy), v7 (copy), v8 (copy)
    local l_friendsNetworking_0 = v25.friendsNetworking;
    return v2.createReducer(v10, {
        [l_friendsNetworking_0.GetFriendshipStatus.Succeeded.name] = function(v27, v28) --[[ Line: 55 ]]
            -- upvalues: v3 (ref)
            local v29 = {};
            for _, v31 in pairs(v28.responseBody.data) do
                local v32 = tostring(v31.id);
                local l_status_0 = v31.status;
                v29[v32] = if l_status_0 == "NotFriends" then Enum.FriendStatus.NotFriend else if l_status_0 == "Friends" then Enum.FriendStatus.Friend else if l_status_0 == "RequestSent" then Enum.FriendStatus.FriendRequestSent else if l_status_0 == "RequestReceived" then Enum.FriendStatus.FriendRequestReceived else Enum.FriendStatus.Unknown;
            end;
            return v3.Dictionary.join(v27, v29);
        end, 
        [l_friendsNetworking_0.GetFriendshipStatuses.Succeeded.name] = function(v34, v35) --[[ Line: 66 ]]
            -- upvalues: v3 (ref)
            local v36 = {};
            for _, v38 in pairs(v35.responseBody.data) do
                local v39 = tostring(v38.id);
                local l_status_1 = v38.status;
                v36[v39] = if l_status_1 == "NotFriends" then Enum.FriendStatus.NotFriend else if l_status_1 == "Friends" then Enum.FriendStatus.Friend else if l_status_1 == "RequestSent" then Enum.FriendStatus.FriendRequestSent else if l_status_1 == "RequestReceived" then Enum.FriendStatus.FriendRequestReceived else Enum.FriendStatus.Unknown;
            end;
            return v3.Dictionary.join(v34, v36);
        end, 
        [l_friendsNetworking_0.GetExtendedFriendshipStatus.Succeeded.name] = function(v41, v42) --[[ Line: 77 ]]
            -- upvalues: v3 (ref)
            local v43 = tostring(v42.ids[1]);
            local l_join_0 = v3.Dictionary.join;
            local l_v41_0 = v41;
            local v46 = {};
            local l_status_2 = v42.responseBody.status;
            v46[v43] = if l_status_2 == "NotFriends" then Enum.FriendStatus.NotFriend else if l_status_2 == "Friends" then Enum.FriendStatus.Friend else if l_status_2 == "RequestSent" then Enum.FriendStatus.FriendRequestSent else if l_status_2 == "RequestReceived" then Enum.FriendStatus.FriendRequestReceived else Enum.FriendStatus.Unknown;
            return l_join_0(l_v41_0, v46);
        end, 
        [l_friendsNetworking_0.GetFriendsFromUserId.Succeeded.name] = function(v48, v49) --[[ Line: 82 ]]
            -- upvalues: v3 (ref), v24 (ref)
            local v51 = v3.Dictionary.keys(v3.Dictionary.filter(v48, function(v50) --[[ Line: 86 ]]
                return v50 == Enum.FriendStatus.Friend;
            end));
            local v53 = v3.List.map(v3.Dictionary.values(v49.responseBody.data), function(v52) --[[ Line: 89 ]]
                return (tostring(v52.id));
            end);
            local v54 = v24(v53, v51);
            local v55 = v24(v51, v53);
            for _, v57 in pairs(v54) do
                v48 = v3.Dictionary.join(v48, {
                    [v57] = Enum.FriendStatus.Friend
                });
            end;
            for _, v59 in pairs(v55) do
                v48 = v3.Dictionary.join(v48, {
                    [v59] = Enum.FriendStatus.Unknown
                });
            end;
            return v48;
        end, 
        [l_friendsNetworking_0.UnfriendTargetUserId.Succeeded.name] = function(v60, v61) --[[ Line: 108 ]]
            -- upvalues: v3 (ref)
            local v62 = tostring(v61.namedIds.users);
            return v3.Dictionary.join(v60, {
                [v62] = Enum.FriendStatus.NotFriend
            });
        end, 
        [l_friendsNetworking_0.AcceptFriendRequestFromUserId.Succeeded.name] = function(v63, v64) --[[ Line: 118 ]]
            -- upvalues: v3 (ref)
            local v65 = tostring(v64.ids[1]);
            return v3.Dictionary.join(v63, {
                [v65] = Enum.FriendStatus.Friend
            });
        end, 
        [l_friendsNetworking_0.DeclineFriendRequestFromUserId.Succeeded.name] = function(v66, v67) --[[ Line: 128 ]]
            -- upvalues: v3 (ref)
            local l_ids_0 = v67.ids;
            local v69 = {};
            for _, v71 in pairs(l_ids_0) do
                v69[tostring(v71)] = Enum.FriendStatus.NotFriend;
            end;
            return v3.Dictionary.join(v66, v69);
        end, 
        [l_friendsNetworking_0.GetFriendRequests.Succeeded.name] = function(v72, v73) --[[ Line: 140 ]]
            -- upvalues: v3 (ref)
            local l_data_0 = v73.responseBody.data;
            local v75 = {};
            for _, v77 in pairs(l_data_0) do
                v75[tostring(v77.id)] = Enum.FriendStatus.FriendRequestReceived;
            end;
            return v3.Dictionary.join(v72, v75);
        end, 
        [l_friendsNetworking_0.DeclineAllFriendRequests.Succeeded.name] = function(v78) --[[ Line: 152 ]]
            -- upvalues: v3 (ref)
            local v79 = {};
            for v80, v81 in pairs(v78) do
                if v81 == Enum.FriendStatus.FriendRequestReceived then
                    v79[tostring(v80)] = Enum.FriendStatus.NotFriend;
                end;
            end;
            return v3.Dictionary.join(v78, v79);
        end, 
        [l_friendsNetworking_0.RequestFriendshipFromUserId.Succeeded.name] = function(v82, v83) --[[ Line: 164 ]]
            -- upvalues: v3 (ref)
            local v84 = tostring(v83.namedIds.users);
            return v3.Dictionary.join(v82, {
                [v84] = Enum.FriendStatus.FriendRequestSent
            });
        end, 
        [l_friendsNetworking_0.RequestFriendshipFromContactId.Succeeded.name] = function(v85, v86) --[[ Line: 174 ]]
            -- upvalues: v3 (ref)
            local v87 = tostring(v86.namedIds.contacts);
            return v3.Dictionary.join(v85, {
                [v87] = Enum.FriendStatus.FriendRequestSent
            });
        end, 
        [v6.name] = function(v88, v89) --[[ Line: 184 ]]
            -- upvalues: v3 (ref)
            local v90 = tostring(v89.payload.userId1);
            return v3.Dictionary.join(v88, {
                [v90] = Enum.FriendStatus.NotFriend
            });
        end, 
        [v5.name] = function(v91, v92) --[[ Line: 194 ]]
            -- upvalues: v3 (ref)
            local v93 = tostring(v92.payload.userId1);
            return v3.Dictionary.join(v91, {
                [v93] = Enum.FriendStatus.Friend
            });
        end, 
        [v7.name] = function(v94, v95) --[[ Line: 204 ]]
            -- upvalues: v3 (ref)
            local v96 = tostring(v95.requesteeId);
            return v3.Dictionary.join(v94, {
                [v96] = Enum.FriendStatus.FriendRequestReceived
            });
        end, 
        [v8.name] = function(v97, v98) --[[ Line: 214 ]]
            -- upvalues: v3 (ref)
            local l_ids_1 = v98.ids;
            local v100 = {};
            for _, v102 in pairs(l_ids_1) do
                v100[tostring(v102)] = Enum.FriendStatus.NotFriend;
            end;
            return v3.Dictionary.join(v97, v100);
        end
    });
end;