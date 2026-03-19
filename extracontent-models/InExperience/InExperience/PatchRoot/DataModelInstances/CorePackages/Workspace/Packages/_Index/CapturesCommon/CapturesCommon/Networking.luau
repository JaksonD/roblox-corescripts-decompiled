local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v2 = require(l_Parent_0.ContentSharingNetworking);
local l_httpRequest_0 = v1.httpRequest;
local l_RoduxNetworking_0 = v1.RoduxNetworking;
local v10 = l_httpRequest_0.config({
    requestFunction = function(v5, v6, v7) --[[ Line: 11 ]] --[[ Name: requestFunction ]]
        -- upvalues: l_httpRequest_0 (copy)
        return l_httpRequest_0.requestFunctions.HttpRbxApi(v5, v6, v7);
    end, 
    postRequestFunction = function(_, _) --[[ Line: 15 ]] --[[ Name: postRequestFunction ]]

    end, 
    maxRetryCount = game:DefineFastInt("CapturesCommonMaxHttpRequestRetries", 2), 
    maxWaitTime = game:DefineFastInt("CapturesCommonMaxHttpRequestWaitTime", 8)
});
local v11 = l_RoduxNetworking_0.config({
    keyPath = "NetworkStatus", 
    networkImpl = v10
});
return {
    CapturesCommonNetworkImpl = v10, 
    CapturesCommonNetworking = v2.config({
        roduxNetworking = v11
    })
};