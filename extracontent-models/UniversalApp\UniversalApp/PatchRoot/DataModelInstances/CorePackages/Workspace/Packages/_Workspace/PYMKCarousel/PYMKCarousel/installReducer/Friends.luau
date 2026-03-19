local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_RoduxFriends_0 = v1.RoduxFriends;
local l_convertActions_0 = v1.convertActions;
local l_friendsActionAdaptor_0 = v1.friendsActionAdaptor;
local l_llama_0 = v1.llama;
local v6 = require(script.Parent.friendsOmniActionAdaptor);
local v7 = {
    countsByUserId = {}, 
    byUserId = {}, 
    requests = {
        receivedCount = 0, 
        newFriendRequestsCount = 0, 
        byUserId = {}, 
        mutualFriends = {}, 
        sentAt = {}, 
        sourceUniverseIds = {}
    }, 
    recommendations = {
        byUserId = {}, 
        bySource = {}
    }, 
    friendshipStatus = {}, 
    friendsRankByUserId = {}
};
local v8 = l_RoduxFriends_0.installReducer();
local function _(v9) --[[ Line: 30 ]]
    -- upvalues: l_llama_0 (copy), l_friendsActionAdaptor_0 (copy), l_RoduxFriends_0 (copy), v6 (copy)
    return l_llama_0.Dictionary.join(l_friendsActionAdaptor_0(l_RoduxFriends_0), v6(v9));
end;
return function(v11) --[[ Line: 34 ]]
    -- upvalues: l_convertActions_0 (copy), v8 (copy), l_llama_0 (copy), l_friendsActionAdaptor_0 (copy), l_RoduxFriends_0 (copy), v6 (copy), v7 (copy)
    return l_convertActions_0(v8, l_llama_0.Dictionary.join(l_friendsActionAdaptor_0(l_RoduxFriends_0), v6(v11)), v7);
end;