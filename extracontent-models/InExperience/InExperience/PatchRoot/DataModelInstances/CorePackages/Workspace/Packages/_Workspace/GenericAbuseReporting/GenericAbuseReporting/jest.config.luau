local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Dev.JestConfigs);
local l_extendExpectations_0 = script.Parent.extendExpectations;
return {
    displayName = "GenericAbuseReporting", 
    setupFilesAfterEnv = {
        v1.setupFiles.LogHandler, 
        v1.setupFiles.UIBloxInitializer, 
        v1.setupFiles.createPromiseRejectionHandler(), 
        l_extendExpectations_0
    }
};