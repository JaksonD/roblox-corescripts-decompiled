local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserActivationFramework");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppStorageUtilities_0 = require(l_Parent_0.AuthCommon).Utils.AppStorageUtilities;
local v3 = require(l_script_FirstAncestor_0.Enums.UserActivationSignupPageState);
local v4 = require(l_script_FirstAncestor_0.Enums.NavigationAction);
local _ = require(l_script_FirstAncestor_0.Enums.PayloadKey);
local _ = require(l_script_FirstAncestor_0.Enums.Namespace);
return function(v7, v8, v9) --[[ Line: 23 ]] --[[ Name: CreateActivationWorkflow ]]
    -- upvalues: l_AppStorageUtilities_0 (copy), v3 (copy), v4 (copy)
    if v9 then
        l_AppStorageUtilities_0.setSignupActionRequired("");
        l_AppStorageUtilities_0.flush();
    end;
    local l_EnterBirthday_0 = v3.EnterBirthday;
    local v11 = {};
    if l_EnterBirthday_0 == v3.EnterBirthday then
        v11 = {
            v4.Close, 
            v4.Next
        };
    elseif l_EnterBirthday_0 == v3.AddAuthMethod then
        v11 = {
            v4.Next
        };
    end;
    return {
        namespace = v7, 
        state = l_EnterBirthday_0, 
        availableActions = v11, 
        payload = v8, 
        history = {
            l_EnterBirthday_0
        }
    };
end;