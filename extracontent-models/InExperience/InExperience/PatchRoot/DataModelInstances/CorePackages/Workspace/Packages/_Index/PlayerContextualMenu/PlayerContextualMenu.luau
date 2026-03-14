local v0 = require(script.Components);
return {
    openPlayerContextualMenu = require(script.openPlayerContextualMenu), 
    Component = v0.PlayerContextualMenu, 
    installReducer = require(script.Reducers.installReducer), 
    ["jest.config"] = script["jest.config"]
};