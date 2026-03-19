local v0 = require(script.ActionHandlers);
return {
    createSignalsMiddleware = require(script.SignalsMiddleware), 
    ActionHandlers = v0, 
    ["jest.config"] = script["jest.config"]
};