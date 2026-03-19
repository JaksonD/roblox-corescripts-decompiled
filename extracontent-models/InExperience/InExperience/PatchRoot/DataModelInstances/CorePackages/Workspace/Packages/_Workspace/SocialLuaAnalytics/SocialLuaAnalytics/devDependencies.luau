local l_Parent_0 = script:FindFirstAncestor("SocialLuaAnalytics").Parent;
return {
    RoduxFriends = require(l_Parent_0.Dev.FriendsRodux).config({
        keyPath = "SocialLuaAnalytics.Friends"
    })
};