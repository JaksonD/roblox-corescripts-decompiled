local l_Parent_0 = script:FindFirstAncestor("ContactsToast").Parent;
local l_DiagEventTypes_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.DiagEventTypes;
local v2 = require(script.Parent.EventNames);
return {
    [v2.ContactsToastSeen] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ContactsToastSeen", "ContactsToastSeen")
    }, 
    [v2.ContactsToastDismissed] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ContactsToastDismissed", "ContactsToastDismissed")
    }, 
    [v2.ContactsToastButtonPressed] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ContactsToastButtonPressed", "ContactsToastButtonPressed")
    }
};