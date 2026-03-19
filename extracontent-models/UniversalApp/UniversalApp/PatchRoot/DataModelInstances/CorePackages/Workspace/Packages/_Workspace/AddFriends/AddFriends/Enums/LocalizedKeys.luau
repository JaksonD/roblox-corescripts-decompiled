local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
return require(l_Parent_0.enumerate)(script.Name, {
    AddFriend = "Feature.Friends.Action.Add", 
    RequestPending = "Feature.Friends.Label.Pending"
});