local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Dev.JestConfigs);
return {
    displayName = "AuthCommon", 
    testMatch = {
        "**/*.test"
    }, 
    setupFilesAfterEnv = {
        v1.setupFiles.ErrorLogHandler, 
        v1.setupFiles.UIBloxInitializer, 
        v1.setupFiles.createPromiseRejectionHandler()
    }
};