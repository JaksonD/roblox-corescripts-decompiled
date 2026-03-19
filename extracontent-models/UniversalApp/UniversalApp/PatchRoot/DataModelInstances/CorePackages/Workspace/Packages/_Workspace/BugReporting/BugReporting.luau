local v0 = require(script.BugReporterEventReceiver);
local v1 = require(script.BugReporterModalContainer);
local _ = require(script.BugReporterTypes);
return {
    BugReporterEventReceiver = v0, 
    BugReporterModalContainer = v1, 
    ["jest.config"] = script["jest.config"]
};