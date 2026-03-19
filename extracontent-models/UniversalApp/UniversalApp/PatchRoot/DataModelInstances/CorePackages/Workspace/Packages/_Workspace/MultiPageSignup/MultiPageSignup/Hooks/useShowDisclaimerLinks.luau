local l_Parent_0 = script:FindFirstAncestor("MultiPageSignup").Parent;
local v1 = require(l_Parent_0.React);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v3 = require(l_Parent_0.UserActivationFramework);
local l_PayloadKey_0 = v3.Enums.PayloadKey;
local l_UserActivationSignupPageState_0 = v3.Enums.UserActivationSignupPageState;
local l_FullPageActivationFrameworkContext_0 = v3.Context.FullPageActivationFrameworkContext;
return function() --[[ Line: 10 ]] --[[ Name: useShowDisclaimerLinks ]]
    -- upvalues: l_useAppPolicy_0 (copy), v1 (copy), l_FullPageActivationFrameworkContext_0 (copy), l_PayloadKey_0 (copy), l_UserActivationSignupPageState_0 (copy)
    local v8 = l_useAppPolicy_0(function(v7) --[[ Line: 11 ]]
        return v7;
    end);
    local v9 = v8.getShowDisclaimerLinkForUnderageSignupsOnAllSignupPages();
    local v10 = v8.getAgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages();
    local v11 = v1.useContext(l_FullPageActivationFrameworkContext_0);
    return v1.useMemo(function() --[[ Line: 20 ]]
        -- upvalues: v11 (copy), l_PayloadKey_0 (ref), v10 (copy), l_UserActivationSignupPageState_0 (ref), v9 (copy)
        local l_activationFrameworkState_0 = v11.activationFrameworkState;
        local v13 = (tonumber(l_activationFrameworkState_0.payloadTable[l_PayloadKey_0.SignupAge]) or -1) < v10;
        if l_activationFrameworkState_0.currentState == l_UserActivationSignupPageState_0.EnterBirthday then
            return true;
        elseif v13 and v9 then
            return true;
        else
            return false;
        end;
    end, {
        v11, 
        v9
    });
end;