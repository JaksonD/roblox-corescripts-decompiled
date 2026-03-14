local v0 = require(script.renderSystemScrim);
local v1 = require(script["data-model"]);
return {
    renderSystemScrim = v0, 
    SystemScrimSignalStore = v1.SystemScrimSignalStore, 
    ["jest.config"] = script["jest.config"]
};