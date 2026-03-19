local _ = require(script.Analytics.uiStatusBarTappedEvent);
local v1 = require(script.Hooks.useLogInputTypeChanged);
local v2 = require(script.Hooks.useLogOrientationChanged);
local v3 = require(script.Hooks.useLogStatusBarTapped);
local v4 = require(script.Analytics.switchAccountScrimError);
local v5 = require(script.createAppLaunchReactProfilerLogger);
return {
    ["jest.config"] = script["jest.config"], 
    useLogInputTypeChanged = v1, 
    useLogOrientationChanged = v2, 
    useLogStatusBarTapped = v3, 
    switchAccountScrimError = v4, 
    createAppLaunchReactProfilerLogger = v5
};