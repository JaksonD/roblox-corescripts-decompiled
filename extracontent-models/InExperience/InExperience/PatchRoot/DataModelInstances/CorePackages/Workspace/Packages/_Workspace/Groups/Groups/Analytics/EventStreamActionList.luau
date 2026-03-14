local l_Parent_0 = script:FindFirstAncestor("Groups").Parent;
local _ = require(l_Parent_0.SocialLuaAnalytics);
local v2 = require(script.Parent.EventNames);
return {
    [v2.GroupsListCreateGroupClicked] = {
        context = "myGroups", 
        eventType = "groupPageClickEvent", 
        additionalInfo = {
            clickTargetType = "createGroup"
        }
    }, 
    [v2.GroupsListPageExposure] = {
        context = "myGroups", 
        eventType = "groupPageExposureEvent", 
        additionalInfo = {
            exposureType = "myGroups"
        }
    }
};