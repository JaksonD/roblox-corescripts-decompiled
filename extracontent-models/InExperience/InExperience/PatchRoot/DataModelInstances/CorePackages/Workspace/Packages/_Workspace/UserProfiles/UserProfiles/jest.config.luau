local l_Parent_0 = script:FindFirstAncestor("UserProfiles").Parent;
local v1 = require(l_Parent_0.Dev.JestConfigs);
return {
    displayName = "UserProfiles", 
    testMatch = {
        "**/*.test", 
        "!**/Stores/**/*.test"
    }, 
    setupFilesAfterEnv = {
        v1.setupFiles.LogHandler, 
        v1.setupFiles.UIBloxInitializer, 
        v1.setupFiles.createPromiseRejectionHandler()
    }
};