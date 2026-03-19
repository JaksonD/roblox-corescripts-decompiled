local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_Modules_0.Luobu.Reducers.TencentAuthInfo);
local v4 = require(l_Modules_0.Luobu.Reducers.TencentNotice);
local v5 = require(l_Modules_0.Luobu.Reducers.TencentNoticeReadStatus);
local v6 = require(l_Modules_0.Luobu.Reducers.MSDKAuth);
local v7 = require(l_Modules_0.Luobu.Reducers.SignUp);
return v2.combineReducers({
    TencentAuthInfo = v3, 
    TencentNotice = v4, 
    TencentNoticeReadStatus = v5, 
    MSDKAuth = v6, 
    SignUp = v7
});