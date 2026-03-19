local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_RoduxFriends_0 = require(l_script_FirstAncestor_0.dependencies).RoduxFriends;
local v2 = require(script.Parent.convertActions);
local v3 = require(script.Parent.friendsActionAdaptor);
local v4 = {
    countsByUserId = {}, 
    byUserId = {}, 
    requests = {
        receivedCount = 0
    }
};
return function(v5) --[[ Line: 16 ]]
    -- upvalues: v2 (copy), l_RoduxFriends_0 (copy), v3 (copy), v4 (copy)
    return v2(l_RoduxFriends_0.installReducer(), v3(v5), v4);
end;