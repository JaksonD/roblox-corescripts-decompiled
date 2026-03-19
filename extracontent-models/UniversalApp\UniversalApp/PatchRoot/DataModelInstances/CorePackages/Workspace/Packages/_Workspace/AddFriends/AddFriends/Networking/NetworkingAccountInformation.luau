local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local l_myRoduxNetworking_0 = require(l_Parent_0.AddFriendsState).Networking.myRoduxNetworking;
return require(l_Parent_0.LuaSocialLibrariesDeps).NetworkingAccountInformation.config({
    roduxNetworking = l_myRoduxNetworking_0
});