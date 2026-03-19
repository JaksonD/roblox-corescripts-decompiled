local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxFriends");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.llama);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v4 = require(l_Actions_0.FriendshipCreated);
local v5 = require(l_Actions_0.FriendshipDestroyed);
local v6 = require(script.Parent.utils.addUser);
local v7 = require(script.Parent.utils.removeUser);
local v8 = require(script.Parent.utils.setFriendshipsInStore);
local v9 = require(script.Parent.utils.removeTargetUserFriendshipInStore);
local v10 = require(script.Parent.utils.countUserFriendsInStore);
local v11 = {
    byUserId = {}, 
    countsByUserId = {}
};
return function(v12) --[[ Line: 20 ]]
    -- upvalues: v11 (copy), v4 (copy), v2 (copy), v6 (copy), v5 (copy), v7 (copy), v8 (copy), v10 (copy), v9 (copy)
    local l_friendsNetworking_0 = v12.friendsNetworking;
    return function(v14, v15) --[[ Line: 23 ]]
        -- upvalues: v11 (ref), v4 (ref), v2 (ref), v6 (ref), v5 (ref), v7 (ref), l_friendsNetworking_0 (copy), v8 (ref), v10 (ref), v9 (ref)
        local v16 = v14 or v11;
        if v15 and v15.type == v4.name then
            assert(type(v15.payload.userId1) == "string", "Expected userId1 to be a string");
            assert(type(v15.payload.userId2) == "string", "Expected userId2 to be a string");
            return v2.Dictionary.join(v16.countsByUserId, {
                [v15.payload.userId1] = #v6(v16.byUserId[v15.payload.userId1], v15.payload.userId2), 
                [v15.payload.userId2] = #v6(v16.byUserId[v15.payload.userId2], v15.payload.userId1)
            });
        elseif v15 and v15.type == v5.name then
            assert(type(v15.payload.userId1) == "string", "Expected userId1 to be a string");
            assert(type(v15.payload.userId2) == "string", "Expected userId2 to be a string");
            return v2.Dictionary.join(v16.countsByUserId, {
                [v15.payload.userId1] = #v7(v16.byUserId[v15.payload.userId1], v15.payload.userId2), 
                [v15.payload.userId2] = #v7(v16.byUserId[v15.payload.userId2], v15.payload.userId1)
            });
        elseif v15 and v15.type == l_friendsNetworking_0.GetFriendsFromUserId.Succeeded.name then
            local v17 = v8(v16.byUserId, v15);
            return v10(v17);
        elseif v15 and v15.type == l_friendsNetworking_0.UnfriendTargetUserId.Succeeded.name then
            local v18 = v9(v14.byUserId, v15);
            return v10(v18);
        else
            return v16.countsByUserId;
        end;
    end;
end;