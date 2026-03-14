local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.dependencies).enumerate(script.Name, {
    IsMyself = "isMyself", 
    PreviousUsername = "previousUsername", 
    Friend = "friend", 
    Following = "following", 
    MutualFriends = "mutualFriends", 
    Frequents = "frequents"
});