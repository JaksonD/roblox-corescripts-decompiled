local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("MultiPageSignup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v9 = require(l_Parent_0.UserActivationFramework);
local l_UserActivationSignupPageState_0 = v9.Enums.UserActivationSignupPageState;
local _ = require(l_Parent_0.Navigation);
local v12 = require(l_Parent_0.React);
local v13 = require(l_script_FirstAncestor_0.Components.EnterBirthdayComponent);
local v14 = require(l_script_FirstAncestor_0.Components.EnterUserIdentifierComponent);
local v15 = require(l_script_FirstAncestor_0.Components.AddAuthMethodComponent);
local v16 = require(l_script_FirstAncestor_0.Components.SelectGenderComponent);
local v17 = require(l_script_FirstAncestor_0.Components.NonInteractiveStoreUserAgreementsComponent);
local v18 = require(l_Parent_0.Cryo);
local l_Namespace_0 = v9.Enums.Namespace;
local function _(v20) --[[ Line: 19 ]]
    -- upvalues: v18 (copy), l_Namespace_0 (copy), v12 (copy)
    return function(v21) --[[ Line: 20 ]]
        -- upvalues: v18 (ref), l_Namespace_0 (ref), v12 (ref), v20 (copy)
        v21 = v18.Dictionary.join(v21, {
            namespace = l_Namespace_0.MultiPageSignup
        });
        return v12.createElement(v20, v21);
    end;
end;
return function() --[[ Line: 28 ]]
    -- upvalues: l_UserActivationSignupPageState_0 (copy), v13 (copy), v18 (copy), l_Namespace_0 (copy), v12 (copy), v17 (copy), v14 (copy), v15 (copy), v16 (copy)
    local v23 = {};
    local v24 = {};
    local l_EnterBirthday_0 = l_UserActivationSignupPageState_0.EnterBirthday;
    local l_v13_0 = v13;
    local l_l_v13_0_0 = l_v13_0 --[[ copy: 4 -> 9 ]];
    v24[l_EnterBirthday_0] = function(v28) --[[ Line: 20 ]]
        -- upvalues: v18 (ref), l_Namespace_0 (ref), v12 (ref), l_l_v13_0_0 (copy)
        v28 = v18.Dictionary.join(v28, {
            namespace = l_Namespace_0.MultiPageSignup
        });
        return v12.createElement(l_l_v13_0_0, v28);
    end;
    l_EnterBirthday_0 = {};
    local l_NonInteractiveStoreUserAgreements_0 = l_UserActivationSignupPageState_0.NonInteractiveStoreUserAgreements;
    local l_v17_0 = v17;
    local l_l_v17_0_0 = l_v17_0 --[[ copy: 5 -> 10 ]];
    l_EnterBirthday_0[l_NonInteractiveStoreUserAgreements_0] = function(v32) --[[ Line: 20 ]]
        -- upvalues: v18 (ref), l_Namespace_0 (ref), v12 (ref), l_l_v17_0_0 (copy)
        v32 = v18.Dictionary.join(v32, {
            namespace = l_Namespace_0.MultiPageSignup
        });
        return v12.createElement(l_l_v17_0_0, v32);
    end;
    l_NonInteractiveStoreUserAgreements_0 = {};
    l_v13_0 = l_UserActivationSignupPageState_0.EnterUserIdentifier;
    local l_v14_0 = v14;
    local l_l_v14_0_0 = l_v14_0 --[[ copy: 6 -> 11 ]];
    l_NonInteractiveStoreUserAgreements_0[l_v13_0] = function(v35) --[[ Line: 20 ]]
        -- upvalues: v18 (ref), l_Namespace_0 (ref), v12 (ref), l_l_v14_0_0 (copy)
        v35 = v18.Dictionary.join(v35, {
            namespace = l_Namespace_0.MultiPageSignup
        });
        return v12.createElement(l_l_v14_0_0, v35);
    end;
    l_v13_0 = {};
    l_v17_0 = l_UserActivationSignupPageState_0.AddAuthMethod;
    local l_v15_0 = v15;
    l_v13_0[l_v17_0] = function(v37) --[[ Line: 20 ]]
        -- upvalues: v18 (ref), l_Namespace_0 (ref), v12 (ref), l_v15_0 (copy)
        v37 = v18.Dictionary.join(v37, {
            namespace = l_Namespace_0.MultiPageSignup
        });
        return v12.createElement(l_v15_0, v37);
    end;
    l_v17_0 = {};
    l_v14_0 = l_UserActivationSignupPageState_0.SelectGender;
    local l_v16_0 = v16;
    l_v17_0[l_v14_0] = function(v39) --[[ Line: 20 ]]
        -- upvalues: v18 (ref), l_Namespace_0 (ref), v12 (ref), l_v16_0 (copy)
        v39 = v18.Dictionary.join(v39, {
            namespace = l_Namespace_0.MultiPageSignup
        });
        return v12.createElement(l_v16_0, v39);
    end;
    v6(v23, 1, v24, l_EnterBirthday_0, l_NonInteractiveStoreUserAgreements_0, l_v13_0, l_v17_0);
    return v23;
end;