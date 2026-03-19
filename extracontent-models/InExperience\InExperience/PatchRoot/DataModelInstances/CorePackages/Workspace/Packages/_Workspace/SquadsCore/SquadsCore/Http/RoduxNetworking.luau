local l_Parent_0 = script:FindFirstAncestor("SquadsCore").Parent;
local v1 = require(l_Parent_0.HttpRequest);
local v2 = require(l_Parent_0.RoduxNetworking);
local v3 = require(l_Parent_0.Loggers).Logger:new("SquadsCore");
local v4 = game:DefineFastInt("SquadHttpRetryCount", 3);
return v2.config({
    keyPath = "Squad.NetworkStatus", 
    networkImpl = v1.config({
        requestFunction = function(v5, v6, v7) --[[ Line: 15 ]] --[[ Name: requestFunction ]]
            -- upvalues: v3 (copy), v1 (copy)
            v3:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v6, v5));
            return v1.requestFunctions.RequestInternal(v5, v6, v7);
        end, 
        postRequestFunction = function(v8, v9) --[[ Line: 19 ]] --[[ Name: postRequestFunction ]]
            -- upvalues: v3 (copy)
            v3:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v9.requestMethod, v9.url, v8.StatusCode, v8.Body));
        end, 
        maxRetryCount = v4
    })
});