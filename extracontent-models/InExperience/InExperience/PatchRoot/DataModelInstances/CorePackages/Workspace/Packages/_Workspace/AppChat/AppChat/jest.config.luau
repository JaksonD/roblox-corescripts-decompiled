local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Dev.JestConfigs);
local l_setupJest_0 = script.Parent.setupJest;
local l_setupLogger_0 = script.Parent.setupLogger;
return {
    displayName = "AppChat", 
    testMatch = {
        "**/*.test"
    }, 
    setupFilesAfterEnv = {
        v1.setupFiles.UIBloxInitializer, 
        v1.setupFiles.createPromiseRejectionHandler(), 
        l_setupJest_0, 
        l_setupLogger_0
    }
};