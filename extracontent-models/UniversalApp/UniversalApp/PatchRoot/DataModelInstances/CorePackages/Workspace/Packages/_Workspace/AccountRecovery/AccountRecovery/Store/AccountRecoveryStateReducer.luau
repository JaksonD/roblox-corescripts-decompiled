local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountRecovery");
local _ = require(l_script_FirstAncestor_0.Store.State);
local _ = require(l_script_FirstAncestor_0.Store.Action);
local v3 = require(l_script_FirstAncestor_0.Enums.ModalState);
local v4 = require(l_script_FirstAncestor_0.Enums.AccountRecoveryActionType);
return function(v5, v6, _) --[[ Line: 8 ]] --[[ Name: AccountRecoveryStateReducer ]]
    -- upvalues: v4 (copy), v3 (copy)
    local v8 = table.clone(v5);
    local l_type_0 = v6.type;
    if l_type_0 == v4.SET_RECOVERY_SESSION_ID then
        v8.recoverySessionId = v6.data.recoverySessionId;
        return v8;
    elseif l_type_0 == v4.SET_PHONE_PREFIX_LIST then
        v8.phonePrefixList = v6.data.phonePrefixList;
        return v8;
    elseif l_type_0 == v4.SET_MODAL_STATE_AND_PROPS then
        v8.modalStateAndProps = v6.data.modalStateAndProps;
        return v8;
    else
        if l_type_0 == v4.RESET_RECOVERY_FLOW then
            v8.continuingRecovery = v6.data.continuingRecovery;
            v8.recoverySessionId = v6.data.recoverySessionId;
            v8.autofillIdentifier = v6.data.autofillIdentifier;
            v8.recover2sv = v6.data.recover2sv;
            v8.recoverPassword = v6.data.recoverPassword;
            v8.deeplinkUuid = v6.data.deeplinkUuid;
            v8.modalStateAndProps = {
                modalState = v3.NONE, 
                props = nil
            };
        end;
        return v8;
    end;
end;