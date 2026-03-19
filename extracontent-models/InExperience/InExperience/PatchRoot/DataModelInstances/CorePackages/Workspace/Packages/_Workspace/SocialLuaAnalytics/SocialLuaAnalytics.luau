local _ = require(script.Analytics.Types);
local _ = require(script.Analytics.Enums.Contexts);
local _ = require(script.Analytics.Enums.PlatformSpecificity);
local v3 = require(script.Telemetry.telemetryNewConfig);
local v4 = require(script.Performance);
return {
    ["jest.config"] = script["jest.config"], 
    Analytics = require(script.Analytics), 
    TestingAnalytics = require(script.TestingAnalytics), 
    Performance = v4, 
    Telemetry = {
        new = v3, 
        createEmitter = require(script.Telemetry.telemetryCreateEmitter)
    }
};