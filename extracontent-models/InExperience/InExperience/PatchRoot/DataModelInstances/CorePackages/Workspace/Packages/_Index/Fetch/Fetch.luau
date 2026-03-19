local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local l_Headers_0 = require(script.Headers).Headers;
local l_Request_0 = require(script.Request).Request;
local l_Response_0 = require(script.Response).Response;
local l_Body_0 = require(script.Body).Body;
local v6 = require(script.fetch);
local v7 = v6(game:GetService("HttpService"));
local l_AbortSignal_0 = require(script.AbortSignal).AbortSignal;
return {
    Headers = l_Headers_0, 
    Request = l_Request_0, 
    Response = l_Response_0, 
    Body = l_Body_0, 
    fetch = v7, 
    buildFetch = v6, 
    AbortSignal = l_AbortSignal_0
};