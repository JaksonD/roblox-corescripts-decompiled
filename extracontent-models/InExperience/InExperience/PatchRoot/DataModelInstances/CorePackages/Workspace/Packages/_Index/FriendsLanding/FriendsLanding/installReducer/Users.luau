local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_RoduxUsers_0 = require(l_script_FirstAncestor_0.dependencies).RoduxUsers;
local v2 = require(script.Parent.convertActions);
local v3 = require(script.Parent.usersActionAdaptor);
local v4 = {
    byUserId = {}, 
    byUsername = {}
};
return v2(l_RoduxUsers_0.installReducer(), v3, v4);