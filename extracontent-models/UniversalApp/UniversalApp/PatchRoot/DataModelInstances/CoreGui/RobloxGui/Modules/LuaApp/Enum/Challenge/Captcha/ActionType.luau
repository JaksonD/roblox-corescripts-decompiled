local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.addRawValueMethodToEnum);
local v3 = require(l_CorePackages_0.Packages.enumerate);
local v4 = {
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
local v5 = v3(script.Name, v4);
v2(v5, v4);
return v5;