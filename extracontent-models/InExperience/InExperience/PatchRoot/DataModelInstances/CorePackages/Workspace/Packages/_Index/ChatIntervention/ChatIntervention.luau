local v0 = require(script.Actions.UpdateShowChatFeedbackModalAction);
local v1 = require(script.Actions.UpdateShowChatFeedbackPillAction);
local v2 = require(script.Reducers.ChatInterventionReducer);
return {
    ["jest.config"] = script["jest.config"], 
    UpdateShowChatFeedbackModalAction = v0, 
    UpdateShowChatFeedbackPillAction = v1, 
    ChatInterventionReducer = v2
};