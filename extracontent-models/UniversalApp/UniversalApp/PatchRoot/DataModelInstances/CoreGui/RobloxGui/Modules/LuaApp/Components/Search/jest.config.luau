local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.JestConfigs);
return {
    displayName = "Search", 
    testMatch = {
        "**/*.test"
    }, 
    snapshotFormat = {
        printInstanceDefaults = false
    }, 
    setupFilesAfterEnv = {
        v1.setupFiles.UIBloxInitializer, 
        v1.setupFiles.createPromiseRejectionHandler()
    }
};