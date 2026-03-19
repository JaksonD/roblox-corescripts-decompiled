local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Dev.JestConfigs);
local l_setupJest_0 = script.Parent.setupJest;
return {
    displayName = "ExpChat", 
    testMatch = {
        "**/*.test"
    }, 
    testPathIgnorePatterns = {
        "GetChatModerationStore"
    }, 
    mockDataModel = false, 
    setupFilesAfterEnv = {
        v1.setupFiles.LogHandler, 
        v1.setupFiles.UIBloxInitializer, 
        v1.setupFiles.createPromiseRejectionHandler(), 
        l_setupJest_0
    }
};