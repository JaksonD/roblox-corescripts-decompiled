local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.LuaSocialLibrariesDeps);
local l_RODUX_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY;
local l_RoduxNetworking_0 = v2.RoduxNetworking;
local v5 = require(script.Parent.myHttpRequest);
local l_ChallengeRequestWrapper_0 = require(l_Parent_0.GenericChallenges).Middleware.ChallengeRequestWrapper;
local v7 = game:DefineFastFlag("EnableUserSearchChallengeInterceptor", false);
return (l_RoduxNetworking_0.config({
    keyPath = l_RODUX_KEY_0 .. ".NetworkStatus", 
    networkImpl = if v7 then l_ChallengeRequestWrapper_0(v5) else v5
}));