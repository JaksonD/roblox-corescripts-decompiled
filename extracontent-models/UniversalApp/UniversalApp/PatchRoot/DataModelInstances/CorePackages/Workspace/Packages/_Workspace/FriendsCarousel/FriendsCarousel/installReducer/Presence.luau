local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_RoduxPresence_0 = v1.RoduxPresence;
local l_convertActions_0 = v1.convertActions;
local l_presenceActionAdaptor_0 = v1.presenceActionAdaptor;
local v5 = {
    byUserId = {}, 
    byGameId = {}, 
    byGameInstanceId = {}, 
    byPlaceId = {}
};
return l_convertActions_0(l_RoduxPresence_0.installReducer(), l_presenceActionAdaptor_0(l_RoduxPresence_0), v5);