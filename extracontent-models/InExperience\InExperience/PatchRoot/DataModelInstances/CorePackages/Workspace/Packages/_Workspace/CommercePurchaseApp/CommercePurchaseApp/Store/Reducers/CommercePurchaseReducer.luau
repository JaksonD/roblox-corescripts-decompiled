local l_Parent_0 = script:FindFirstAncestor("CommercePurchaseApp").Parent;
local v1 = require(l_Parent_0.Rodux);
local l_CurrentToastMessagesReducer_0 = require(l_Parent_0.ToastLite).Reducers.CurrentToastMessagesReducer;
local v3 = require(script.Parent.PromptStateReducer);
return v1.combineReducers({
    commercePurchaseState = v3, 
    currentToastMessages = l_CurrentToastMessagesReducer_0
});