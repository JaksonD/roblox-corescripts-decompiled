local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v2 = require(l_Parent_0.Lumberyak);
local v3 = require(l_Parent_0.ShareLinksNetworking);
local v4 = require(l_Parent_0.ShareLinksRodux);
local l_RoduxNetworking_0 = v1.RoduxNetworking;
local l_httpRequest_0 = v1.httpRequest;
local v7 = v2.Logger.new(nil, "ShareGame");
local v8 = game:DefineFastInt("ShareGameHttpRetryCount", 3);
local v9 = v7:new("ShareGame Networking");
local v15 = l_httpRequest_0.config({
    requestFunction = function(v10, v11, v12) --[[ Line: 17 ]] --[[ Name: requestFunction ]]
        -- upvalues: v9 (copy), l_httpRequest_0 (copy)
        v9:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v11, v10));
        return l_httpRequest_0.requestFunctions.HttpRbxApi(v10, v11, v12);
    end, 
    postRequestFunction = function(v13, v14) --[[ Line: 21 ]] --[[ Name: postRequestFunction ]]
        -- upvalues: v9 (copy)
        v9:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v14.requestMethod, v14.url, v13.StatusCode, v13.Body));
    end, 
    maxRetryCount = v8
});
local v16 = l_RoduxNetworking_0.config({
    keyPath = "NetworkStatus", 
    networkImpl = v15
});
return {
    ShareLinksRodux = v4.config({
        keyPath = "ShareGame.ShareLinks"
    }), 
    RoduxNetworking = v16, 
    ShareLinksNetworking = v3.config({
        roduxNetworking = v16
    })
};