local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChatShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v3 = require(l_Parent_0.Rodux);
local v4 = require(l_Flags_0.getFFlagUseCharacterStore);
return v3.combineReducers({
    byUserId = require(script.Parent.byUserId), 
    byDisplayName = require(script.Parent.byDisplayName), 
    byUsername = require(script.Parent.byUsername), 
    charactersByUserId = if v4() then nil else require(script.Parent.charactersByUserId)
});