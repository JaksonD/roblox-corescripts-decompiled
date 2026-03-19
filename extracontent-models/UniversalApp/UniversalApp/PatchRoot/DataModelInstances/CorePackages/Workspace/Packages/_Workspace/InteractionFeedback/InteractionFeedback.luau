local v0 = require(script.InteractionFeedbackContext);
local v1 = require(script.useTriggerFeedback);
local v2 = require(script.FeedbackManagerInjectionContextProvider);
local v3 = require(script.withTriggerFeedback);
return {
    InteractionFeedbackContext = v0, 
    useTriggerFeedback = v1, 
    withTriggerFeedback = v3, 
    FeedbackManagerInjectionContextProvider = v2, 
    ["jest.config"] = script["jest.config"]
};