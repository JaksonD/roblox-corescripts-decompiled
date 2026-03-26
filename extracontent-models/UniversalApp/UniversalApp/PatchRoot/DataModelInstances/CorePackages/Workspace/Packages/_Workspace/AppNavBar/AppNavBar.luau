local l_Parent_0 = script.Parent;
local l_FFlagAppNavObservability_0 = require(l_Parent_0.SharedFlags).FFlagAppNavObservability;
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
    AppNavTelemetry = if l_FFlagAppNavObservability_0 then require(script.Telemetry.AppNavTelemetry) else nil, 
    ["jest.config"] = script["jest.config"]
};