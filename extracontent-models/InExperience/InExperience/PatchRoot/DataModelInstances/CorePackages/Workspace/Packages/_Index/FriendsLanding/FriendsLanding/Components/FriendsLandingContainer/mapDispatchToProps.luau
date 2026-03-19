local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_FriendsNetworking_0 = require(l_script_FirstAncestor_0.dependencies).FriendsNetworking;
return function(v2) --[[ Line: 6 ]]
    -- upvalues: l_FriendsNetworking_0 (copy)
    return {
        fetchFriends = function(v3) --[[ Line: 8 ]] --[[ Name: fetchFriends ]]
            -- upvalues: v2 (copy), l_FriendsNetworking_0 (ref)
            return v2(l_FriendsNetworking_0.GetFriendsFromUserId.API(v3));
        end, 
        getFriendRequestsCount = function() --[[ Line: 11 ]] --[[ Name: getFriendRequestsCount ]]
            -- upvalues: v2 (copy), l_FriendsNetworking_0 (ref)
            return v2(l_FriendsNetworking_0.GetFriendRequestsCount.API());
        end, 
        getInactiveFriends = function(v4) --[[ Line: 14 ]] --[[ Name: getInactiveFriends ]]
            -- upvalues: v2 (copy), l_FriendsNetworking_0 (ref)
            return v2(l_FriendsNetworking_0.GetInactiveFriends.API(v4));
        end, 
        unfriendTargetUser = function(v5) --[[ Line: 17 ]] --[[ Name: unfriendTargetUser ]]
            -- upvalues: v2 (copy), l_FriendsNetworking_0 (ref)
            return v2(l_FriendsNetworking_0.UnfriendTargetUserId.API(v5));
        end
    };
end;