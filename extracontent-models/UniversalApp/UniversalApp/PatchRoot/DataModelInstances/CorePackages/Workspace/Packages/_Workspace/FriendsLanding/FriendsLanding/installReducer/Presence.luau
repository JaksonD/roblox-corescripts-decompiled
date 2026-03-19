local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_RoduxPresence_0 = require(l_script_FirstAncestor_0.dependencies).RoduxPresence;
local v2 = require(script.Parent.convertActions);
local v3 = require(script.Parent.presenceActionAdaptor);
local v4 = {
    byUserId = {}, 
    byGameId = {}, 
    byGameInstanceId = {}, 
    byPlaceId = {}
};
return v2(l_RoduxPresence_0.installReducer(), v3, v4);