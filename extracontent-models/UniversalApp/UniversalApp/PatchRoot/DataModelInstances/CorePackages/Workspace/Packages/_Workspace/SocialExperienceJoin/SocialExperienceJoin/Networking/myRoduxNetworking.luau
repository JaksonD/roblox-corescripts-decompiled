local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialExperienceJoin");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.LuaSocialLibrariesDeps);
local l_httpRequest_0 = v2.httpRequest;
local l_RODUX_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY;
local v5 = require(l_Parent_0.Lumberyak).Logger.new(nil, l_RODUX_KEY_0):new(l_RODUX_KEY_0 .. " Networking");
local v6 = game:DefineFastInt("SocialExperienceJoinHttpRetryCount", 3);
local v12 = l_httpRequest_0.config({
    requestFunction = function(v7, v8, v9) --[[ Line: 13 ]] --[[ Name: requestFunction ]]
        -- upvalues: v5 (copy), l_httpRequest_0 (copy)
        v5:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v8, v7));
        return l_httpRequest_0.requestFunctions.RequestInternal(v7, v8, v9);
    end, 
    postRequestFunction = function(v10, v11) --[[ Line: 17 ]] --[[ Name: postRequestFunction ]]
        -- upvalues: v5 (copy)
        v5:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v11.requestMethod, v11.url, v10.StatusCode, v10.Body));
    end, 
    maxRetryCount = v6
});
return (v2.RoduxNetworking.config({
    keyPath = l_RODUX_KEY_0 .. ".NetworkStatus", 
    networkImpl = v12
}));