local v0 = require(script.httpRequestCreator);
local v1 = require(script.RequestFunctions);
local v2 = require(script.HttpSession);
return {
    config = v0, 
    requestFunctions = v1, 
    startNewSession = v2.startNewSession
};