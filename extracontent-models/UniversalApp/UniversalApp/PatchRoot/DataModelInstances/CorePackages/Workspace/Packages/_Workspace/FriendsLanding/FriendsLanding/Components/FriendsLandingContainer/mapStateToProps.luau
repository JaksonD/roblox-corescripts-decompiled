local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.Friends.mapToUsers);
return function(v2, _) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    return {
        localUserId = v2.LocalUserId, 
        friends = v1(v2)(v2.LocalUserId)
    };
end;