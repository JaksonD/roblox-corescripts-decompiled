local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_FFlagLuaAppDefaultHttpRetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDefaultHttpRetry;
local v2 = require(l_Parent_0.HttpRequest);
local v3 = require(l_Parent_0.RoduxNetworking);
local v4 = require(l_Parent_0.Loggers).Logger:new("AppChat");
return v3.config({
    keyPath = "ChatAppReducer.networkStatus", 
    networkImpl = v2.config({
        requestFunction = function(v5, v6, v7) --[[ Line: 14 ]] --[[ Name: requestFunction ]]
            -- upvalues: v4 (copy), v2 (copy)
            v4:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v6, v5));
            return v2.requestFunctions.HttpRbxApi(v5, v6, v7);
        end, 
        postRequestFunction = function(v8, v9) --[[ Line: 18 ]] --[[ Name: postRequestFunction ]]
            -- upvalues: v4 (copy)
            v4:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s ]", v9.requestMethod, v9.url, v8.StatusCode));
        end, 
        maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("AppChatRoduxNetworkingHttpRetryCount", 4) else nil
    }), 
    killRequestWithFilteredIds = true
});