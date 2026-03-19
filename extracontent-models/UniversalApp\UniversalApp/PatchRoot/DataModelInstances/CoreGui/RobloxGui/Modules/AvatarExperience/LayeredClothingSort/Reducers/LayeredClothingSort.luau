local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent;
local v3 = require(l_Parent_0.LastSavedSort);
local v4 = require(l_Parent_0.CurrentSort);
local v5 = require(l_Parent_0.EntryPage);
local v6 = require(l_Parent_0.CharacterUpdatesLocked);
return v1.combineReducers({
    LastSavedSort = v3, 
    CurrentSort = v4, 
    EntryPage = v5, 
    CharacterUpdatesLocked = v6
});