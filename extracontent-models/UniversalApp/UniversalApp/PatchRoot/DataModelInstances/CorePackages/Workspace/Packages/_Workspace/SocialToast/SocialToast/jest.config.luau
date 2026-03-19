local l_Parent_0 = script:FindFirstAncestor("SocialToast").Parent;
local v1 = require(l_Parent_0.Dev.JestConfigs);
return {
    displayName = "SocialToast", 
    testMatch = {
        "**/*.test"
    }, 
    setupFilesAfterEnv = {
        v1.setupFiles.LogHandler, 
        v1.setupFiles.UIBloxInitializer, 
        v1.setupFiles.createPromiseRejectionHandler()
    }
};