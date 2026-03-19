local l_Parent_0 = script:FindFirstAncestor("EditProfileBackground").Parent;
local l_Enums_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v4 = require(script.Parent.Enums.EventNames);
local v5 = require(script.Parent.Enums.ButtonNames);
return {
    [v4.EditProfileBackgroundOpened] = {
        context = l_Contexts_0.EditProfile, 
        eventType = l_EventTypes_0.PageLoad, 
        additionalInfo = {
            btn = v5.EditProfileBackgroundOpened
        }
    }, 
    [v4.BackgroundSelected] = {
        context = l_Contexts_0.EditProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v5.BackgroundSelected
        }
    }
};