local l_Parent_0 = script.Parent.Parent.Parent;
local l_Contexts_0 = require(l_Parent_0.dependencies).SocialLuaAnalytics.Analytics.Enums.Contexts;
return {
    AddFriends = l_Contexts_0.AddFriends, 
    HomePage = ("%*FriendsSort"):format(l_Contexts_0.HomePage), 
    HomePageProfile = ("%*Profile"):format(l_Contexts_0.HomePage), 
    SocialTabProfile = ("%*Profile"):format(l_Contexts_0.SocialTab), 
    ContactsList = ("%*FindFriendsBanner"):format(l_Contexts_0.ContactImport)
};