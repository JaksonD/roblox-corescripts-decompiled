local l_Parent_0 = script.Parent.Parent.Parent;
local l_Contexts_0 = require(l_Parent_0.dependencies).SocialLuaAnalytics.Analytics.Enums.Contexts;
return {
    HomePage = ("%*FriendsSort"):format(l_Contexts_0.HomePage), 
    AddFriends = l_Contexts_0.AddFriends
};