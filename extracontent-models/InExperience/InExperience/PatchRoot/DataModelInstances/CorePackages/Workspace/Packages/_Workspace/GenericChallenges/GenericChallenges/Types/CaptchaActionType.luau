local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Utils_0 = l_script_FirstAncestor_0.Utils;
local v3 = require(l_Utils_0.addRawValueMethodToEnum);
local v4 = require(l_Parent_0.enumerate);
local v5 = {
    Login = "Login", 
    AppLogin = "AppLogin", 
    Signup = "Signup", 
    AppSignup = "AppSignup", 
    GroupJoin = "GroupJoin", 
    GroupWallPost = "GroupWallPost", 
    ResetPassword = "ResetPassword", 
    ToyCodeRedeem = "ToyCodeRedeem", 
    GameCardRedeem = "GameCardRedeem", 
    FollowUser = "FollowUser"
};
local v6 = v4(script.Name, v5);
v3(v6, v5);
return v6;