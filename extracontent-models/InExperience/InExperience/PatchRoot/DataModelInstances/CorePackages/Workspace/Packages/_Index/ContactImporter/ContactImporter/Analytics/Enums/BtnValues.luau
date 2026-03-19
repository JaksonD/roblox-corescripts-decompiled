local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.dependencies).enumerate(script.Name, {
    RequestFriendship = "requestFriendship", 
    InviteContact = "inviteContact", 
    CloseContactListButton = "closeContactListButton", 
    CloseContactListCross = "closeContactListCross", 
    ContactImporter = "contactImporter", 
    AddFriends = "addFriendsUniversal", 
    Close = "closeX", 
    FindFriendsButton = "findFriends"
});