local l_Parent_0 = script:FindFirstAncestor("PreHomePage").Parent;
local l_LaunchContext_0 = require(l_Parent_0.AppStartup).Enums.LaunchContext;
local l_GetPasswordManagerUsageStore_0 = require(l_Parent_0.AuthCommon).Stores.GetPasswordManagerUsageStore;
return {
    userJustLoggedIn = function(v3) --[[ Line: 14 ]] --[[ Name: userJustLoggedIn ]]
        -- upvalues: l_LaunchContext_0 (copy)
        v3:flush();
        return v3:getState().LaunchContext == l_LaunchContext_0.Login;
    end, 
    didUsePasswordManagerMediatedLogin = function() --[[ Line: 20 ]] --[[ Name: didUsePasswordManagerMediatedLogin ]]
        -- upvalues: l_GetPasswordManagerUsageStore_0 (copy)
        local v4 = l_GetPasswordManagerUsageStore_0(false);
        if v4 == nil then
            return false;
        else
            return v4.getLoggedinUsingSavedPassword(false) or v4.getSavedPasswordAfterLogin(false);
        end;
    end
};