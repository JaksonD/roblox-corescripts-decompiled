local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.Dev.JestConfigs);
return {
    displayName = l_script_FirstAncestor_0.Name, 
    setupFilesAfterEnv = {
        v1.setupFiles.ErrorLogHandler, 
        v1.setupFiles.UIBloxInitializer, 
        v1.setupFiles.createPromiseRejectionHandler()
    }
};