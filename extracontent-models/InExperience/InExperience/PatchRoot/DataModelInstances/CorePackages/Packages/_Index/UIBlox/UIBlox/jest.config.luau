local l_Parent_0 = script.Parent.Parent;
return {
    testMatch = {
        "**/*.spec"
    }, 
    setupFilesAfterEnv = {
        l_Parent_0.Utilities.UIBloxInitializer
    }
};