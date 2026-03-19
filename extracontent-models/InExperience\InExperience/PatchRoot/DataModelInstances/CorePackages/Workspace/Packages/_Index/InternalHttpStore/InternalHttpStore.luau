local _ = require(script.HttpStoreTypes);
return {
    ["jest.config"] = script["jest.config"], 
    createHttpStore = require(script.createHttpStore), 
    GetHttpStore = require(script.GetHttpStore), 
    createMockHttpStore = require(script.createMockHttpStore)
};