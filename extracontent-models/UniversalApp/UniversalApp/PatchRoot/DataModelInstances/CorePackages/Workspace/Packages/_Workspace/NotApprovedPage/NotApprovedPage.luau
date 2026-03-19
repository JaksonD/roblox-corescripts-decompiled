local v0 = require(script.Components.NotApprovedPage);
local v1 = require(script.Components.NotApprovedPageV2);
local v2 = require(script.Components.AccountReactivationPrompt.AccountReactivationPrompt);
return {
    NotApprovedPage = v0, 
    NotApprovedPageV2 = v1, 
    AccountReactivationPrompt = v2, 
    ["jest.config"] = script["jest.config"]
};