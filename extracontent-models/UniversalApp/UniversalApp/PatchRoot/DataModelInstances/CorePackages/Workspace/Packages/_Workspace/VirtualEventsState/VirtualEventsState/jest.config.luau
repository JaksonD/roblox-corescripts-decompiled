local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEventsState");
local v1 = require(l_script_FirstAncestor_0.Parent.Dev.JestConfigs);
return {
    displayName = "VirtualEventsState", 
    testMatch = {
        "**/*.test"
    }, 
    setupFilesAfterEnv = {
        v1.setupFiles.LogHandler, 
        v1.setupFiles.createPromiseRejectionHandler()
    }
};