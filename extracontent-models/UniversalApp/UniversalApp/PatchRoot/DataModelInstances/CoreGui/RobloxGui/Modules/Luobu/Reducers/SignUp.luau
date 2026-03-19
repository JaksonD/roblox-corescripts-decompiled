local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_Modules_0.Luobu.Actions.SetSignUpInProgress);
local v5 = require(l_Modules_0.Luobu.Actions.SetSignUpInfo);
local v6 = require(l_Modules_0.Luobu.Actions.SetAgreedUserAgreements);
return v3.createReducer({
    signUpInProgress = false, 
    prefilledDisplayName = "", 
    signUpVoucher = "", 
    authMethod = "", 
    channelId = -1, 
    agreedUserAgreements = {}
}, {
    [v4.name] = function(v7, v8) --[[ Line: 17 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v7, {
            signUpInProgress = v8.signUpInProgress
        });
    end, 
    [v5.name] = function(v9, v10) --[[ Line: 22 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v9, {
            prefilledDisplayName = v10.prefilledDisplayName, 
            signUpVoucher = v10.signUpVoucher, 
            authMethod = v10.authMethod, 
            channelId = v10.channelId
        });
    end, 
    [v6.name] = function(v11, v12) --[[ Line: 30 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v11, {
            agreedUserAgreements = v12.agreedUserAgreements
        });
    end
});