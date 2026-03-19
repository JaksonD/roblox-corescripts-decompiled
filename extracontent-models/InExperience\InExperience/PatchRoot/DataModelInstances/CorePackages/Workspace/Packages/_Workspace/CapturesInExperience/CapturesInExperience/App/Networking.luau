local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuaSocialLibrariesDeps);
local v3 = require(l_Parent_1.Lumberyak);
local v4 = require(l_Parent_1.ShareLinksNetworking);
local v5 = require(l_Parent_1.ShareLinksRodux);
local l_httpRequest_0 = v2.httpRequest;
local l_RoduxNetworking_0 = v2.RoduxNetworking;
local v8 = require(l_Parent_0.Constants);
local v9 = v3.Logger.new(nil, v8.LoggerKey);
local v13 = l_httpRequest_0.config({
    requestFunction = function(v10, v11, v12) --[[ Line: 17 ]] --[[ Name: requestFunction ]]
        -- upvalues: v9 (copy), l_httpRequest_0 (copy)
        v9:debug((("Request: [ requestMethod = %*, url = %* ]"):format(v11, v10)));
        return l_httpRequest_0.requestFunctions.HttpRbxApi(v10, v11, v12);
    end, 
    maxRetryCount = game:DefineFastInt("CapturesMaxHttpRequestRetries", 2), 
    maxWaitTime = game:DefineFastInt("CapturesMaxHttpRequestWaitTime", 8)
});
local v14 = l_RoduxNetworking_0.config({
    keyPath = "NetworkStatus", 
    networkImpl = v13
});
return {
    RoduxNetworking = v14, 
    ShareLinksNetworking = v4.config({
        roduxNetworking = v14
    }), 
    ShareLinksRodux = v5.config({
        keyPath = "ShareLinks"
    })
};