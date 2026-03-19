local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Rodux.RoduxPresence);
local l_convertActions_0 = require(l_Parent_0.SocialReducerAdaptors).convertActions;
local l_presenceActionAdaptor_0 = require(l_Parent_0.SocialReducerAdaptors).presenceActionAdaptor;
local v5 = {
    byUserId = {}, 
    byGameId = {}, 
    byGameInstanceId = {}, 
    byPlaceId = {}
};
return l_convertActions_0(v2.installReducer(), l_presenceActionAdaptor_0(v2), v5);