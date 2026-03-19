local l_Parent_0 = script:FindFirstAncestor("EditProfileBackground").Parent;
local v1 = require(l_Parent_0.LuaSocialLibrariesDeps);
local l_RoduxNetworking_0 = v1.RoduxNetworking;
local l_httpRequest_0 = v1.httpRequest;
local v4 = require(l_Parent_0.Lumberyak).Logger.new(nil, "EditProfileBackground"):new("EditProfileBackground Networking");
local v5 = game:DefineFastInt("EditProfileBackgroundHttpRetryCount", 3);
local v11 = l_httpRequest_0.config({
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
});
return (l_RoduxNetworking_0.config({
    keyPath = "EditProfileBackground.networkStatus", 
    networkImpl = v11
}));