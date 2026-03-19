local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserActivationFramework");
local v1 = require(l_script_FirstAncestor_0.Enums.UserActivationSignupPageState);
local v2 = require(l_script_FirstAncestor_0.Enums.NavigationAction);
local v3 = require(l_script_FirstAncestor_0.Enums.PayloadKey);
local _ = require(l_script_FirstAncestor_0.Enums.Namespace);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagEnableMultipageSignupNonInteractiveUserAgreementsPage_0 = require(l_Parent_0.SharedFlags).FFlagEnableMultipageSignupNonInteractiveUserAgreementsPage;
containsValue = function(v7, v8) --[[ Line: 19 ]] --[[ Name: containsValue ]]
    for _, v10 in pairs(v7) do
        if v10 == v8 then
            return true;
        end;
    end;
    return false;
end;
return function(v11, v12, v13, v14, v15, v16) --[[ Line: 28 ]] --[[ Name: UpdateActivationWorkflow ]]
    -- upvalues: v2 (copy), l_FFlagEnableMultipageSignupNonInteractiveUserAgreementsPage_0 (copy), v1 (copy), v3 (copy)
    if v14 == v2.Close then
        return nil;
    else
        local v17 = {};
        v17 = if l_FFlagEnableMultipageSignupNonInteractiveUserAgreementsPage_0 then {
            [v1.EnterBirthday] = v1.NonInteractiveStoreUserAgreements, 
            [v1.NonInteractiveStoreUserAgreements] = v1.EnterUserIdentifier, 
            [v1.EnterUserIdentifier] = v1.AddAuthMethod, 
            [v1.AddAuthMethod] = v1.SelectGender, 
            [v1.SelectGender] = v1.Complete, 
            [v1.Complete] = v1.Complete
        } else {
            [v1.EnterBirthday] = v1.EnterUserIdentifier, 
            [v1.EnterUserIdentifier] = v1.AddAuthMethod, 
            [v1.AddAuthMethod] = v1.SelectGender, 
            [v1.SelectGender] = v1.Complete, 
            [v1.Complete] = v1.Complete
        };
        v17[v1.TestingPageA] = v1.TestingPageB;
        v17[v1.TestingPageB] = v1.TestingPageC;
        local v18 = {
            [v1.EnterBirthday] = {
                v2.Next, 
                v2.Close
            }, 
            [v1.EnterUserIdentifier] = {
                v2.Next, 
                v2.Back
            }, 
            [v1.NonInteractiveStoreUserAgreements] = {
                v2.Next, 
                v2.Back
            }, 
            [v1.AddAuthMethod] = {
                v2.Next, 
                v2.Back
            }, 
            [v1.SelectGender] = {
                v2.Next, 
                v2.Back
            }, 
            [v1.Complete] = {}, 
            [v1.TestingPageA] = {
                v2.Next
            }, 
            [v1.TestingPageB] = {
                v2.Next, 
                v2.Back
            }, 
            [v1.TestingPageC] = {}
        };
        local l_v12_0 = v12;
        local v20 = table.clone(v15);
        if v14 == v2.Next or v14 == v2.Skip then
            if v12 == v1.EnterUserIdentifier and v16 and v16[v3.SignupPasskeyResult] and #v16[v3.SignupPasskeyResult] > 0 then
                l_v12_0 = v1.SelectGender;
            else
                l_v12_0 = v17[v12];
                if l_v12_0 == nil then
                    return nil;
                end;
            end;
            table.insert(v20, l_v12_0);
        elseif v14 == v2.Back then
            if not containsValue(v18[v12], v2.Back) then
                return nil;
            else
                table.remove(v20);
                if #v20 == 0 then
                    return nil;
                else
                    l_v12_0 = v20[#v20];
                end;
            end;
        elseif v14 == v2.Reset then
            l_v12_0 = v15[1];
            v20 = if #v15 > 0 then {
                l_v12_0
            } else {};
        end;
        local v21 = v18[l_v12_0] or {};
        if l_v12_0 == v1.SelectGender and v16 and v16[v3.SignupPasskeyResult] and #v16[v3.SignupPasskeyResult] > 0 then
            v21 = {
                v2.Next
            };
        end;
        return {
            namespace = v11, 
            state = l_v12_0, 
            availableActions = v21, 
            payload = v13, 
            history = v20
        };
    end;
end;