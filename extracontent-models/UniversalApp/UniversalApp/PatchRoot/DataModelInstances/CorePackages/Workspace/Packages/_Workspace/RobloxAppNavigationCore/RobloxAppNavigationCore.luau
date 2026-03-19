return {
    AppReadyHandler = require(script.AppReadyHandler), 
    createRootNavigator = require(script.Navigators.createRootNavigator), 
    RnBypassAdapter = require(script.RnBypassAdapter), 
    AppStackView = require(script.Views.AppStackView), 
    AppSwitchView = require(script.Views.AppSwitchView), 
    AppCard = require(script.Views.AppCard), 
    ["jest.config"] = script["jest.config"]
};