local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.AppChatAccountSettingsEventReceiver);
local v3 = require(script.Parent.AppChatInterventionEventReceiver);
local v4 = require(script.Parent.AppChatThirdPartySettingsEventReceiver);
local v5 = require(script.Parent.AppChatNotificationEventReceiver);
local v6 = require(script.Parent.AppChatRemoveThirdPartyRestriction);
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
local l_getFFlagAppChatEnableIntervention_0 = require(l_Parent_0.InterventionShared).Flags.getFFlagAppChatEnableIntervention;
return function(v9) --[[ Line: 19 ]] --[[ Name: AppChatPersistentEventReceivers ]]
    -- upvalues: v1 (copy), v2 (copy), l_getFFlagAppChatEnableIntervention_0 (copy), v3 (copy), l_ThirdPartyUserService_0 (copy), v4 (copy), v6 (copy), v5 (copy)
    return v1.createElement(v1.Fragment, nil, {
        accountSettings = v1.createElement(v2, {
            isInExperience = v9.isInExperience
        }), 
        intervention = if l_getFFlagAppChatEnableIntervention_0() then v1.createElement(v3, {}) else nil, 
        thirdPartySettings = v1.createElement(if l_ThirdPartyUserService_0 ~= nil and l_ThirdPartyUserService_0:IsChatRestrictionSupported() then v4 else v6), 
        notification = v1.createElement(v5)
    });
end;