local l_script_FirstAncestor_0 = script:FindFirstAncestor("AddFriendsState");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoduxNetworking);
local l_ChallengeRequestWrapper_0 = require(l_Parent_0.GenericChallenges).Middleware.ChallengeRequestWrapper;
local v4 = require(l_script_FirstAncestor_0.RODUX_KEY);
local v5 = require(script.Parent.myHttpRequest);
return (v2.config({
    keyPath = ("%*.NetworkStatus"):format(v4), 
    networkImpl = l_ChallengeRequestWrapper_0(v5)
}));