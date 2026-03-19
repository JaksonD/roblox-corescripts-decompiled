local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuaSocialLibrariesDeps);
local v3 = require(l_Parent_1.Lumberyak);
local v4 = require(l_Parent_1.ContentSharingNetworking);
local v5 = require(l_Parent_1.ContentSharingRodux);
local l_httpRequest_0 = v2.httpRequest;
local l_NetworkingCurrentlyWearing_0 = v2.NetworkingCurrentlyWearing;
local v8 = require(l_Parent_1.NetworkingGames);
local v9 = require(l_Parent_1.NetworkingUsers);
local v10 = require(l_Parent_1.RoduxGames);
local l_RoduxNetworking_0 = v2.RoduxNetworking;
local v12 = require(l_Parent_1.RoduxUsers);
local v13 = require(l_Parent_1.ShareLinksNetworking);
local v14 = require(l_Parent_1.ShareLinksRodux);
local v15 = require(l_Parent_0.Constants);
local v16 = v3.Logger.new(nil, v15.LoggerKey);
local v22 = l_httpRequest_0.config({
    requestFunction = function(v17, v18, v19) --[[ Line: 24 ]] --[[ Name: requestFunction ]]
        -- upvalues: v16 (copy), l_httpRequest_0 (copy)
        v16:debug((("Request: [ requestMethod = %*, url = %* ]"):format(v18, v17)));
        return l_httpRequest_0.requestFunctions.HttpRbxApi(v17, v18, v19);
    end, 
    postRequestFunction = function(v20, v21) --[[ Line: 29 ]] --[[ Name: postRequestFunction ]]
        -- upvalues: v16 (copy)
        v16:debug((("Response: [ requestMethod = %*, url = %*, statusCode = %*, body = %* ]"):format(v21.requestMethod, v21.url, v20.StatusCode, v20.Body)));
    end, 
    maxRetryCount = game:DefineFastInt("ContentFeedMaxHttpRequestRetries", 2), 
    maxWaitTime = game:DefineFastInt("ContentFeedMaxHttpRequestWaitTime", 8)
});
local v23 = l_RoduxNetworking_0.config({
    keyPath = "NetworkStatus", 
    networkImpl = v22
});
return {
    ContentFeedNetworkImpl = v22, 
    ContentSharingNetworking = v4.config({
        roduxNetworking = v23
    }), 
    ContentSharingRodux = v5.config({
        keyPath = "ContentSharing"
    }), 
    NetworkingCurrentlyWearing = l_NetworkingCurrentlyWearing_0.config({
        roduxNetworking = v23
    }), 
    NetworkingGames = v8.config({
        roduxNetworking = v23
    }), 
    NetworkingUsers = v9.config({
        roduxNetworking = v23
    }), 
    RoduxGames = v10.config({
        keyPath = "Games"
    }), 
    RoduxNetworking = v23, 
    RoduxUsers = v12.config({
        keyPath = "Users"
    }), 
    ShareLinksNetworking = v13.config({
        roduxNetworking = v23
    }), 
    ShareLinksRodux = v14.config({
        keyPath = "ShareLinks"
    })
};