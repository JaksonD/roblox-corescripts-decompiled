local l_FFlagLuaAppsServerTriggeredModals_0 = require(script.Parent.SharedFlags).FFlagLuaAppsServerTriggeredModals;
return {
    ["jest.config"] = script["jest.config"], 
    CheckForSduiModal = if l_FFlagLuaAppsServerTriggeredModals_0 then require(script.CheckForSduiModal) else nil, 
    SduiModal = if l_FFlagLuaAppsServerTriggeredModals_0 then require(script.SduiModal) else nil
};