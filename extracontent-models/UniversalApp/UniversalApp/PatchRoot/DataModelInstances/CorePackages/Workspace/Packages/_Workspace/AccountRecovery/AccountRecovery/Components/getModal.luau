local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountRecovery");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Enums.ModalState);
local v6 = require(l_script_FirstAncestor_0.Components.Modal.UpdateEmail);
local v7 = require(l_script_FirstAncestor_0.Components.Modal.SaveOrDeleteTwoStepMethod);
local v8 = require(l_script_FirstAncestor_0.Components.Modal.AddNewPasskey);
return l_memoize_0(function(v9) --[[ Line: 13 ]]
    -- upvalues: v5 (copy), v2 (copy), v6 (copy), v7 (copy), v8 (copy)
    if v9.modalState == v5.UPDATE_EMAIL then
        return v2.createElement(v6, v9.props);
    elseif v9.modalState == v5.SAVE_OR_DELETE_TWO_STEP_METHOD then
        return v2.createElement(v7, v9.props);
    elseif v9.modalState == v5.ADD_NEW_PASSKEY then
        return v2.createElement(v8, v9.props);
    else
        return nil;
    end;
end);