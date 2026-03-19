local l_Parent_0 = script:FindFirstAncestor("SocialModalsCommon").Parent;
local v1 = require(l_Parent_0.Dev.JestConfigs);
return {
    displayName = "SocialModalsCommon", 
    testMatch = {
        "**/*.test"
    }, 
    setupFilesAfterEnv = {
        v1.setupFiles.LogHandler, 
        v1.setupFiles.UIBloxInitializer, 
        v1.setupFiles.createPromiseRejectionHandler()
    }
};