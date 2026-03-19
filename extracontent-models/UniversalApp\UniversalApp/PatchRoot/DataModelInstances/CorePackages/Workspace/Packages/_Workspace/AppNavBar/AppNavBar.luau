return {
    Placement = require(script.Enum.Placement), 
    AppNavBar = require(script.Components.AppNavBar), 
    StudioCTAIcon = require(script.Components.StudioCTAIcon), 
    useNavBarPlacement = require(script.Hooks.useNavBarPlacement), 
    useNavBarSize = require(script.Hooks.useNavBarSize), 
    VisibilityControl = require(script.VisibilityControl), 
    Constants = require(script.Constants), 
    Mocks = require(script.Mocks), 
    getScrollAwayEnabled = require(script.getScrollAwayEnabled), 
    ["jest.config"] = script["jest.config"]
};