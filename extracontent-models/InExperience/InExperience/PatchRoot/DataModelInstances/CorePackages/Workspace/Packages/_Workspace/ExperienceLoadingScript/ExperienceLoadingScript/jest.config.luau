local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Dev.JestConfigs);
return {
    displayName = "ExperienceLoadingScript", 
    setupFilesAfterEnv = {
        l_Parent_0.LogHandler, 
        v2.setupFiles.UIBloxInitializer, 
        v2.setupFiles.createPromiseRejectionHandler()
    }
};