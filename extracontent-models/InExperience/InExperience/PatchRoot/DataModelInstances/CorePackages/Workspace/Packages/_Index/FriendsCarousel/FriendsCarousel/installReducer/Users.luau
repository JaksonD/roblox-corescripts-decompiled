local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_RoduxUsers_0 = v1.RoduxUsers;
local l_convertActions_0 = v1.convertActions;
local l_usersActionAdaptor_0 = v1.usersActionAdaptor;
local v5 = {
    byUserId = {}, 
    byUsername = {}
};
return l_convertActions_0(l_RoduxUsers_0.installReducer(), l_usersActionAdaptor_0(l_RoduxUsers_0), v5);