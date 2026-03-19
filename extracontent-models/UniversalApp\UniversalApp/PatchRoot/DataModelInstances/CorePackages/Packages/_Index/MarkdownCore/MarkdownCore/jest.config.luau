local l__Workspace_0 = script:FindFirstAncestor("Packages")._Workspace;
local l_setupJest_0 = script.Parent.setupJest;
return {
    testMatch = {
        "**/*.test"
    }, 
    testPathIgnorePatterns = {
        "_Index"
    }, 
    setupFilesAfterEnv = {
        l_setupJest_0
    }, 
    rootDir = l__Workspace_0
};