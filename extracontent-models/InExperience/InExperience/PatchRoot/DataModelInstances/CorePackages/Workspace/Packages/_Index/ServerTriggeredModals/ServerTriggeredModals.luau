local v0 = require(script.Parent.SharedFlags);
local v1 = require(script.SduiV2);
local l_FFlagLuaAppsServerTriggeredModals_0 = v0.FFlagLuaAppsServerTriggeredModals;
local l_FFlagEnableProfileCompletion_0 = v0.FFlagEnableProfileCompletion;
return {
    ["jest.config"] = script["jest.config"], 
    CheckForSduiModal = if l_FFlagLuaAppsServerTriggeredModals_0 then require(script.CheckForSduiModal) else nil, 
    SduiModal = if l_FFlagLuaAppsServerTriggeredModals_0 then require(script.SduiModal) else nil, 
    fetchPrompts = if l_FFlagEnableProfileCompletion_0 then v1.fetchPrompts else nil, 
    PromptsEntryPoint = if l_FFlagEnableProfileCompletion_0 then v1.PromptsEntryPoint else nil, 
    reportPromptImpression = if l_FFlagEnableProfileCompletion_0 then require(script.reportPromptImpression) else nil
};