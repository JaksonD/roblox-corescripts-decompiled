local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoduxNetworking);
local v3 = require(l_script_FirstAncestor_0.url.HttpRequest);
return v2.config({
    keyPath = "ChatAppReducer.networkStatus", 
    networkImpl = v3.default, 
    killRequestWithFilteredIds = true
});