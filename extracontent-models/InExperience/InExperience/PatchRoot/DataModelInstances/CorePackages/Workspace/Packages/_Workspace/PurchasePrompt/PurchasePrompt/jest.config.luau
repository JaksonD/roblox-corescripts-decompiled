local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Dev.JestConfigs);
return {
    displayName = "PurchasePrompt", 
    setupFilesAfterEnv = {
        v1.setupFiles.UIBloxInitializer, 
        v1.setupFiles.createPromiseRejectionHandler()
    }, 
    coveragePathIgnorePatterns = {
        "Localization/Locales/.*%.lua$"
    }
};