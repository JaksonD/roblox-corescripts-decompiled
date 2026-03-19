local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.llama);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v5 = require(l_Actions_0.FriendshipCreated);
local v6 = require(l_Actions_0.FriendshipDestroyed);
local _ = require(l_script_FirstAncestor_0.roduxFriendsTypes);
local v8 = require(script.Parent.utils.addUser);
local v9 = require(script.Parent.utils.removeUser);
local v10 = require(script.Parent.utils.setFriendshipsInStore);
local v11 = require(script.Parent.utils.removeTargetUserFriendshipInStore);
local v12 = {};
return function(v13) --[[ Line: 19 ]]
    -- upvalues: v2 (copy), v12 (copy), v5 (copy), v3 (copy), v8 (copy), v6 (copy), v9 (copy), v10 (copy), v11 (copy)
    local l_friendsNetworking_0 = v13.friendsNetworking;
    return v2.createReducer(v12, {
        [v5.name] = function(v15, v16) --[[ Line: 23 ]]
            -- upvalues: v3 (ref), v8 (ref)
            assert(type(v16.payload.userId1) == "string", "Expected userId1 to be a string");
            assert(type(v16.payload.userId2) == "string", "Expected userId2 to be a string");
            return v3.Dictionary.join(v15, {
                [v16.payload.userId1] = v8(v15[v16.payload.userId1], v16.payload.userId2), 
                [v16.payload.userId2] = v8(v15[v16.payload.userId2], v16.payload.userId1)
            });
        end, 
        [v6.name] = function(v17, v18) --[[ Line: 33 ]]
            -- upvalues: v3 (ref), v9 (ref)
            assert(type(v18.payload.userId1) == "string", "Expected userId1 to be a string");
            assert(type(v18.payload.userId2) == "string", "Expected userId2 to be a string");
            return v3.Dictionary.join(v17, {
                [v18.payload.userId1] = v9(v17[v18.payload.userId1], v18.payload.userId2), 
                [v18.payload.userId2] = v9(v17[v18.payload.userId2], v18.payload.userId1)
            });
        end, 
        [l_friendsNetworking_0.GetFriendsFromUserId.Succeeded.name] = function(v19, v20) --[[ Line: 43 ]]
            -- upvalues: v10 (ref)
            return v10(v19, v20);
        end, 
        [l_friendsNetworking_0.UnfriendTargetUserId.Succeeded.name] = function(v21, v22) --[[ Line: 50 ]]
            -- upvalues: v11 (ref)
            return v11(v21, v22);
        end, 
        [l_friendsNetworking_0.AcceptFriendRequestFromUserId.Succeeded.name] = function(v23, v24) --[[ Line: 56 ]]
            -- upvalues: v3 (ref), v8 (ref)
            local v25 = tostring(v24.ids[1]);
            local v26 = tostring(v24.additionalData.currentUserId);
            return v3.Dictionary.join(v23, {
                [v25] = v8(v23[v25], v26), 
                [v26] = v8(v23[v26], v25)
            });
        end
    });
end;