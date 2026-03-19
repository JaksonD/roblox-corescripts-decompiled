local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_httpRequest_0 = require(l_Parent_0.LuaSocialLibrariesDeps).httpRequest;
local l_RODUX_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY;
local v4 = require(l_Parent_0.Lumberyak).Logger.new(nil, l_RODUX_KEY_0):new(l_RODUX_KEY_0 .. " Networking");
local v5 = game:DefineFastInt("ProfilePlatformHttpRetryCount", 3);
return (l_httpRequest_0.config({
    requestFunction = function(v6, v7, v8) --[[ Line: 13 ]] --[[ Name: requestFunction ]]
        -- upvalues: v4 (copy), l_httpRequest_0 (copy)
        v4:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v7, v6));
        return l_httpRequest_0.requestFunctions.RequestInternal(v6, v7, v8);
    end, 
    postRequestFunction = function(v9, v10) --[[ Line: 17 ]] --[[ Name: postRequestFunction ]]
        -- upvalues: v4 (copy)
        v4:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v10.requestMethod, v10.url, v9.StatusCode, v9.Body));
    end, 
    maxRetryCount = v5
}));