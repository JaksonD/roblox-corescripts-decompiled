local v0 = require(script.Utilities.createSignalMap);
return {
    CoreScriptsRootProvider = require(script.CoreScriptsRootProvider), 
    Scrim = require(script.Scrim), 
    Traversal = require(script.Traversal), 
    ["jest.config"] = script["jest.config"], 
    useScreenSize = require(script.useScreenSize), 
    Utilities = {
        createSignalMap = v0, 
        sortTableByValue = require(script.Utilities.sortTableByValue)
    }
};