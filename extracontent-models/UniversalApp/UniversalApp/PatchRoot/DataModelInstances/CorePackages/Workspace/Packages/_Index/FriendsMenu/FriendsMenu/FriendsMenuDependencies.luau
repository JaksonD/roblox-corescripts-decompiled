local l_Parent_0 = script.Parent.Parent;
local l_FFlagLuaAppDefaultHttpRetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDefaultHttpRetry;
local v2 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v3 = require(l_Parent_0.HttpRequest);
local v4 = v3.config({
    requestFunction = v3.requestFunctions.HttpRbxApi, 
    maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("FriendsMenuHttpRetryCount", 4) else nil
});
local l_sortFriendsByCorrectedPresenceAndRank_0 = v2.SocialLibraries.config({}).User.sortFriendsByCorrectedPresenceAndRank;
return {
    networkImpl = v4, 
    sortFriendsByCorrectedPresenceAndRank = l_sortFriendsByCorrectedPresenceAndRank_0
};