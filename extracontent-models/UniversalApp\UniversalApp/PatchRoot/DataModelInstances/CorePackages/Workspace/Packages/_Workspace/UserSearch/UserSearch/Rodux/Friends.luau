local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Rodux.RoduxFriends);
local l_convertActions_0 = require(l_Parent_0.SocialReducerAdaptors).convertActions;
local l_friendsActionAdaptor_0 = require(l_Parent_0.SocialReducerAdaptors).friendsActionAdaptor;
local v5 = {
    countsByUserId = {}, 
    byUserId = {}, 
    requests = {
        receivedCount = 0
    }, 
    recommendations = {}, 
    friendshipStatus = {}, 
    followings = {}, 
    friendsRankByUserId = {}
};
return l_convertActions_0(v2.installReducer(), l_friendsActionAdaptor_0(v2), v5);