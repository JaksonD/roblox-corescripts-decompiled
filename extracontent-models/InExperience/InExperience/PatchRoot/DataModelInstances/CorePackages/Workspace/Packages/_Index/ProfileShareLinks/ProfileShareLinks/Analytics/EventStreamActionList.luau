local l_Parent_0 = script:FindFirstAncestor("ProfileShareLinks").Parent;
local v1 = require(l_Parent_0.Dash);
local l_EventTypes_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.EventTypes;
local v3 = require(script.Parent.EventNames);
return {
    [v3.ProfileShareLinkActivated] = {
        context = "", 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v3.ProfileShareLinkActivated
        }, 
        formatRulesForAdditionalInfo = {
            context = v1.identity, 
            shareType = v1.identity, 
            stamp = v1.identity
        }
    }
};