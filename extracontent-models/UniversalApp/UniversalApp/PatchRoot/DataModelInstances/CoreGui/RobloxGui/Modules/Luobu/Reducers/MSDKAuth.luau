local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_Modules_0.Luobu.Actions.SetMSDKLoginErrMessageKey);
local v5 = require(l_Modules_0.Luobu.Actions.SetTokenAuthErrMessageKey);
local v6 = require(l_Modules_0.Luobu.Actions.SetMSDKLoginInProgress);
local v7 = require(l_Modules_0.Luobu.Actions.SetMSDKLoginOpenId);
return v3.createReducer({
    MSDKLoginErrMessageKey = nil, 
    tokenAuthErrMessageKey = nil, 
    loginInProgress = false, 
    openId = ""
}, {
    [v4.name] = function(v8, v9) --[[ Line: 16 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v8, {
            MSDKLoginErrMessageKey = v9.errMessageKey
        });
    end, 
    [v5.name] = function(v10, v11) --[[ Line: 21 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v10, {
            tokenAuthErrMessageKey = v11.errMessageKey
        });
    end, 
    [v6.name] = function(v12, v13) --[[ Line: 26 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v12, {
            loginInProgress = v13.loginInProgress
        });
    end, 
    [v7.name] = function(v14, v15) --[[ Line: 31 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v14, {
            openId = v15.openId
        });
    end
});