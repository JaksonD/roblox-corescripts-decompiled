local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.SocialLibraries);
local v3 = require(l_Parent_1.RoduxNetworking);
local l_httpRequest_0 = v2.httpRequest;
local l_RODUX_KEY_0 = require(l_Parent_0.Common.Constants).RODUX_KEY;
local v6 = game:DefineFastInt("FriendRequestNicknamesMaxHttpRetries", 5);
local v10 = l_httpRequest_0.config({
    requestFunction = function(v7, v8, v9) --[[ Line: 11 ]] --[[ Name: requestFunction ]]
        -- upvalues: l_httpRequest_0 (copy)
        return l_httpRequest_0.requestFunctions.RequestInternal(v7, v8, v9);
    end, 
    maxRetryCount = v6
});
return (v3.config({
    keyPath = l_RODUX_KEY_0 .. ".NetworkStatus", 
    networkImpl = v10
}));