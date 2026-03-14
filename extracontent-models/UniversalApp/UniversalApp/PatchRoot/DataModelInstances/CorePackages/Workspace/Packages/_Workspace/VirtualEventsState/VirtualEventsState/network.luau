local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEventsState");
local v1 = require(l_script_FirstAncestor_0.Parent.HttpRequest);
local v2 = require(l_script_FirstAncestor_0.Parent.RoduxNetworking);
local v3 = require(l_script_FirstAncestor_0.Parent.NetworkingVirtualEvents);
local v4 = require(l_script_FirstAncestor_0.Parent.NetworkingGames);
local v5 = require(l_script_FirstAncestor_0.logger);
local v6 = game:DefineFastInt("VirtualEventsHttpRetryCount", 3);
local v12 = v1.config({
    requestFunction = function(v7, v8, v9) --[[ Line: 12 ]] --[[ Name: requestFunction ]]
        -- upvalues: v5 (copy), v1 (copy)
        v5:debug("GET {}", v7);
        return v1.requestFunctions.RequestInternal(v7, v8, v9);
    end, 
    postRequestFunction = function(v10, v11) --[[ Line: 21 ]] --[[ Name: postRequestFunction ]]
        -- upvalues: v5 (copy)
        v5:debug("{} {} {}", v10.StatusCode, v11.url, v10.Body);
    end, 
    maxRetryCount = v6
});
local v13 = v2.config({
    keyPath = "VirtualEvents.networkStatus", 
    networkImpl = v12
});
local v14 = v3.config({
    roduxNetworking = v13
});
local v15 = v4.config({
    roduxNetworking = v13
});
return {
    RoduxNetworking = v13, 
    NetworkingVirtualEvents = v14, 
    NetworkingGames = v15
};