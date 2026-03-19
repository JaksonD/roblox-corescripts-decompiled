local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_script_FirstAncestor_0.Rodux.ProfileTypes.Community);
local v4 = require(l_script_FirstAncestor_0.Rodux.ProfileTypes.User);
local v5 = require(l_script_FirstAncestor_0.Rodux.ProfileTypes.Contact);
return v2.combineReducers({
    Community = v3, 
    User = v4, 
    Contact = v5
});