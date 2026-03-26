local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Dev.JestConfigs);
return {
    displayName = "GameJoinCard", 
    rootDir = l_Parent_0, 
    testMatch = {
        "**/*.test"
    }, 
    setupFilesAfterEnv = {
        v2.setupFiles.LogHandler, 
        v2.setupFiles.UIBloxInitializer, 
        v2.setupFiles.createPromiseRejectionHandler()
    }
};