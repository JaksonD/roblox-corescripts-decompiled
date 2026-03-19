local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local l_ContactList_0 = l_CoreGui_0:WaitForChild("RobloxGui").Modules.ContactList;
local v4 = require(l_ContactList_0.dependencies);
local l_RoduxCall_0 = v4.RoduxCall;
local l_RoduxFriends_0 = v4.RoduxFriends;
local l_RoduxPresence_0 = v4.RoduxPresence;
local l_RoduxUsers_0 = v4.RoduxUsers;
local l_RoduxNetworking_0 = v4.RoduxNetworking;
local v10 = require(script.Navigation);
local v11 = require(script.Dialog);
local v12 = require(script.PlayerMenu);
local v13 = require(script.LastRemovedFriend);
return (v2.combineReducers({
    Navigation = v10, 
    Dialog = v11, 
    PlayerMenu = v12, 
    LastRemovedFriend = v13, 
    Call = l_RoduxCall_0.installReducer(), 
    Friends = l_RoduxFriends_0.installReducer(), 
    Presence = l_RoduxPresence_0.installReducer(), 
    Users = l_RoduxUsers_0.installReducer(), 
    NetworkStatus = l_RoduxNetworking_0.installReducer()
}));