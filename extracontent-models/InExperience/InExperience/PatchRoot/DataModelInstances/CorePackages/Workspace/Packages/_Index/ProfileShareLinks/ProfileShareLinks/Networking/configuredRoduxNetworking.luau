local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileShareLinks");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.LuaSocialLibrariesDeps);
local l_httpRequest_0 = v2.httpRequest;
local l_RoduxNetworking_0 = v2.RoduxNetworking;
local l_RODUX_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY;
local v6 = require(l_Parent_0.Lumberyak).Logger.new(nil, "ProfileShareLinks"):new("ProfileShareLinks Networking");
local v7 = game:DefineFastInt("ProfileShareLinksHttpRetryCount", 3);
local v13 = l_httpRequest_0.config({
    requestFunction = function(v8, v9, v10) --[[ Line: 14 ]] --[[ Name: requestFunction ]]
        -- upvalues: v6 (copy), l_httpRequest_0 (copy)
        v6:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v9, v8));
        return l_httpRequest_0.requestFunctions.RequestInternal(v8, v9, v10);
    end, 
    postRequestFunction = function(v11, v12) --[[ Line: 18 ]] --[[ Name: postRequestFunction ]]
        -- upvalues: v6 (copy)
        v6:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v12.requestMethod, v12.url, v11.StatusCode, v11.Body));
    end, 
    maxRetryCount = v7
});
return (l_RoduxNetworking_0.config({
    keyPath = l_RODUX_KEY_0 .. ".NetworkStatus", 
    networkImpl = v13
}));