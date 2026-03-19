local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local l_MockUser_0 = require(l_Parent_0.UserLib).Models.MockUser;
local v4 = require(l_script_FirstAncestor_0.Users.MockUserData);
local v5 = l_MockUser_0.new();
local l_1_0 = v4.USERS["1"];
v5.name = l_1_0.displayName;
v5.id = l_1_0.id;
v5.presence = l_UserModel_0.PresenceType.ONLINE;
v5.lastLocation = l_1_0.lastLocation;
v5.isFriend = true;
local v7 = l_MockUser_0.new();
local l_2_0 = v4.USERS["2"];
v7.name = l_2_0.displayName;
v7.id = l_2_0.id;
v7.presence = l_UserModel_0.PresenceType.IN_GAME;
v7.lastLocation = l_2_0.lastLocation;
v7.isFriend = true;
local v9 = l_MockUser_0.new();
local l_3_0 = v4.USERS["3"];
v9.name = l_3_0.displayName;
v9.id = l_3_0.id;
v9.isFriend = true;
return {
    Users = {
        [1] = v5, 
        [2] = v7, 
        [3] = v9
    }, 
    ChatAppReducer = {
        Presence = {
            byUserId = v4.createMockPresenceData()
        }
    }
};