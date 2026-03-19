local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.LuaSocialLibrariesDeps);
local l_httpRequest_0 = v2.httpRequest;
local l_RODUX_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY;
local v5 = require(l_Parent_0.Lumberyak).Logger.new(nil, l_RODUX_KEY_0):new(l_RODUX_KEY_0 .. " Networking");
local v6 = game:DefineFastInt("ProfilePlatformHttpRetryCount", 3);
local l_ChallengeRequestWrapper_0 = require(l_Parent_0.GenericChallenges).Middleware.ChallengeRequestWrapper;
local v8 = game:DefineFastFlag("EnableProfilePlatformChallengeInterceptor", false);
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformUseRoduxNetworkingRefactor);
local v10 = require(l_script_FirstAncestor_0.Networking.myRoduxNetworkingImpl);
local v16 = l_httpRequest_0.config({
    requestFunction = function(v11, v12, v13) --[[ Line: 22 ]] --[[ Name: requestFunction ]]
        -- upvalues: v5 (copy), l_httpRequest_0 (copy)
        v5:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v12, v11));
        return l_httpRequest_0.requestFunctions.RequestInternal(v11, v12, v13);
    end, 
    postRequestFunction = function(v14, v15) --[[ Line: 26 ]] --[[ Name: postRequestFunction ]]
        -- upvalues: v5 (copy)
        v5:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v15.requestMethod, v15.url, v14.StatusCode, v14.Body));
    end, 
    maxRetryCount = v6
});
local l_RoduxNetworking_0 = v2.RoduxNetworking;
local v18 = if v9 then v10 else v16;
return (l_RoduxNetworking_0.config({
    keyPath = l_RODUX_KEY_0 .. ".NetworkStatus", 
    networkImpl = v8 and l_ChallengeRequestWrapper_0(v18) or v18
}));