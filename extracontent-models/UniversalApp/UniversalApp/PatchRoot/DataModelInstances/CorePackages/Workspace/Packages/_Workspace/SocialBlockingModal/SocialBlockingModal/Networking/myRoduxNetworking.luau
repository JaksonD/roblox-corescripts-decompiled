local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialBlockingModal");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoduxNetworking);
local l_ChallengeRequestWrapper_0 = require(l_Parent_0.GenericChallenges).Middleware.ChallengeRequestWrapper;
local v4 = require(l_Parent_0.HttpRequest);
local v5 = game:DefineFastInt("AddFriendsHttpRetryCount", 3);
local v6 = require(l_script_FirstAncestor_0.Rodux.RODUX_KEY);
local v10 = v4.config({
    requestFunction = function(v7, v8, v9) --[[ Line: 13 ]] --[[ Name: requestFunction ]]
        -- upvalues: v4 (copy)
        return v4.requestFunctions.RequestInternal(v7, v8, v9);
    end, 
    maxRetryCount = v5
});
return (v2.config({
    keyPath = ("%*.NetworkStatus"):format(v6), 
    networkImpl = l_ChallengeRequestWrapper_0(v10)
}));