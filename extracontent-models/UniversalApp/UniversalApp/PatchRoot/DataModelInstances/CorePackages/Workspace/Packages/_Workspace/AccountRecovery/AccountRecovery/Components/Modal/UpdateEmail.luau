local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountRecovery");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v7 = require(l_script_FirstAncestor_0.Store.AccountRecoveryContext);
local v8 = require(l_Parent_0.Foundation);
local l_ButtonVariant_0 = v8.Enums.ButtonVariant;
local l_Dialog_0 = v8.Dialog;
local l_DialogSize_0 = v8.Enums.DialogSize;
local v12 = require(l_script_FirstAncestor_0.Thunks.SetEmail);
local _ = require(l_script_FirstAncestor_0.Common.AccountRecoveryRequestTypes);
return function(v14) --[[ Line: 27 ]]
    -- upvalues: v2 (copy), v7 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v12 (copy), l_useLocalization_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_ButtonVariant_0 (copy)
    local v15 = v2.useContext(v7);
    local v16 = l_useDispatch_0();
    local v17 = l_useRoactService_0(l_RoactNetworking_0);
    local v18, v19 = v2.useState(false);
    local function _(v20) --[[ Line: 35 ]]
        -- upvalues: v16 (copy), v12 (ref), v17 (copy)
        return v16(v12(v17, {
            recoverySessionId = v20
        }));
    end;
    local _ = function() --[[ Line: 41 ]]
        -- upvalues: v18 (copy), v19 (copy), v15 (copy), v16 (copy), v12 (ref), v17 (copy), v14 (copy)
        if v18 then
            return;
        else
            v19(true);
            local l_recoverySessionId_0 = v15.state.recoverySessionId;
            v16(v12(v17, {
                recoverySessionId = l_recoverySessionId_0
            })):andThen(function(_) --[[ Line: 47 ]]
                -- upvalues: v14 (ref)
                v14.onPasswordResetSuccess();
            end);
            return;
        end;
    end;
    local v25 = l_useLocalization_0({
        updateEmailHeadingText = "Authentication.AccountRecovery.Heading.UpdateEmail", 
        updateEmailBodyText = {
            "Authentication.AccountRecovery.Description.UpdateEmailConfirmation"; 
            email = ("%*"):format(v14.email)
        }, 
        okButtonText = "Authentication.AccountRecovery.Action.Ok"
    });
    return v2.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Small, 
        disablePortal = false, 
        hasBackdrop = true
    }, {
        DialogTitle = v2.createElement(l_Dialog_0.Title, {
            LayoutOrder = 1, 
            text = v25.updateEmailHeadingText
        }), 
        DialogContent = v2.createElement(l_Dialog_0.Content, {
            LayoutOrder = 2
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            DialogText = v2.createElement(l_Dialog_0.Text, {
                LayoutOrder = 1, 
                Text = v25.updateEmailBodyText
            })
        }), 
        DialogActions = v2.createElement(l_Dialog_0.Actions, {
            LayoutOrder = 3, 
            actions = {
                {
                    text = v25.okButtonText, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = function() --[[ Line: 89 ]] --[[ Name: onActivated ]]
                        -- upvalues: v18 (copy), v19 (copy), v15 (copy), v16 (copy), v12 (ref), v17 (copy), v14 (copy)
                        if v18 then
                            return;
                        else
                            v19(true);
                            local l_recoverySessionId_1 = v15.state.recoverySessionId;
                            v16(v12(v17, {
                                recoverySessionId = l_recoverySessionId_1
                            })):andThen(function(_) --[[ Line: 47 ]]
                                -- upvalues: v14 (ref)
                                v14.onPasswordResetSuccess();
                            end);
                            return;
                        end;
                    end
                }
            }
        })
    });
end;