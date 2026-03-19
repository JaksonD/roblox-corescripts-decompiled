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
local v12 = require(l_script_FirstAncestor_0.Thunks.GetCurrentTwoStepMethod);
local v13 = require(l_script_FirstAncestor_0.Thunks.DisableTwoStepMethod);
local _ = require(l_script_FirstAncestor_0.Common.AccountRecoveryRequestTypes);
local v15 = require(l_script_FirstAncestor_0.Enums.ModalState);
local v16 = require(l_script_FirstAncestor_0.Enums.AccountRecoveryActionType);
return function(v17) --[[ Line: 33 ]]
    -- upvalues: v2 (copy), v7 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v12 (copy), l_useLocalization_0 (copy), v16 (copy), v15 (copy), v13 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_ButtonVariant_0 (copy)
    local v18 = v2.useContext(v7);
    local v19 = l_useDispatch_0();
    local v20 = l_useRoactService_0(l_RoactNetworking_0);
    local v21, v22 = v2.useState("");
    local v23, v24 = v2.useState(false);
    local v25, v26 = v2.useState("");
    local v27, v28 = v2.useState(true);
    v2.useEffect(function() --[[ Line: 44 ]]
        -- upvalues: v19 (copy), v12 (ref), v20 (copy), v18 (copy), v22 (copy), v28 (copy)
        v19(v12(v20, v18.state.recoverySessionId)):andThen(function(v29) --[[ Line: 46 ]]
            -- upvalues: v22 (ref), v28 (ref)
            if not v29.isError then
                v22(v29.data.twoStepMethod);
            end;
            v28(false);
        end);
    end, {});
    local v30 = l_useLocalization_0({
        headingText = "Authentication.AccountRecovery.Heading.SaveTwoStepMethod", 
        bodyText = "Authentication.AccountRecovery.Description.SaveTwoStepMethod", 
        saveButtonText = "Authentication.AccountRecovery.Action.Save", 
        deleteButtonText = "Authentication.AccountRecovery.Action.Delete", 
        requestErrorText = v25 ~= "" and v25 or nil
    });
    local function v31() --[[ Line: 63 ]]
        -- upvalues: v17 (copy), v18 (copy), v16 (ref), v15 (ref)
        if v17.shouldUpdateEmail then
            v18.dispatch({
                type = v16.SET_MODAL_STATE_AND_PROPS, 
                data = {
                    modalStateAndProps = {
                        modalState = v15.UPDATE_EMAIL, 
                        props = {
                            email = v17.email, 
                            onPasswordResetSuccess = v17.onPasswordResetSuccess
                        }
                    }
                }
            });
            return;
        else
            v17.onPasswordResetSuccess();
            return;
        end;
    end;
    local function v33() --[[ Line: 82 ]]
        -- upvalues: v23 (copy), v21 (copy), v27 (copy), v24 (copy), v26 (copy), v19 (copy), v13 (ref), v20 (copy), v18 (copy), v31 (copy)
        if v23 or v21 == "" or v27 then
            return;
        else
            v24(true);
            v26("");
            v19(v13(v20, {
                recoverySessionId = v18.state.recoverySessionId, 
                twoStepMethod = v21
            })):andThen(function(v32) --[[ Line: 91 ]]
                -- upvalues: v24 (ref), v26 (ref), v31 (ref)
                v24(false);
                if v32.isError then
                    v26(v32.errorKey);
                    return;
                else
                    v31();
                    return;
                end;
            end);
            return;
        end;
    end;
    local function _() --[[ Line: 101 ]]
        -- upvalues: v23 (copy), v27 (copy), v24 (copy), v26 (copy), v31 (copy)
        if v23 or v27 then
            return;
        else
            v24(true);
            v26("");
            v31();
            return;
        end;
    end;
    local l_createElement_0 = v2.createElement;
    local l_Root_0 = l_Dialog_0.Root;
    local v37 = {
        size = l_DialogSize_0.Small, 
        disablePortal = false, 
        hasBackdrop = true
    };
    local v38 = {
        DialogTitle = not v27 and v2.createElement(l_Dialog_0.Title, {
            LayoutOrder = 1, 
            text = v30.headingText
        })
    };
    local v39 = not v27;
    if v39 then
        v39 = v2.createElement;
        local l_Content_0 = l_Dialog_0.Content;
        local v41 = {
            LayoutOrder = 2
        };
        local v42 = {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            DialogText = v2.createElement(l_Dialog_0.Text, {
                LayoutOrder = 1, 
                Text = v30.bodyText
            })
        };
        local v43 = false;
        if v25 ~= "" then
            v43 = v2.createElement(l_Dialog_0.Text, {
                LayoutOrder = 2, 
                Text = v30.requestErrorText or ""
            });
        end;
        v42.RequestErrorText = v43;
        v39 = v39(l_Content_0, v41, v42);
    end;
    v38.DialogContent = v39;
    v38.DialogActions = not v27 and v2.createElement(l_Dialog_0.Actions, {
        LayoutOrder = 3, 
        actions = {
            {
                text = v30.saveButtonText, 
                variant = l_ButtonVariant_0.Emphasis, 
                onActivated = function() --[[ Line: 141 ]] --[[ Name: onActivated ]]
                    -- upvalues: v23 (copy), v27 (copy), v24 (copy), v26 (copy), v31 (copy)
                    if not v23 then
                        if v27 then
                            return;
                        else
                            v24(true);
                            v26("");
                            v31();
                        end;
                    end;
                end
            }, 
            {
                text = v30.deleteButtonText, 
                variant = l_ButtonVariant_0.Standard, 
                onActivated = function() --[[ Line: 148 ]] --[[ Name: onActivated ]]
                    -- upvalues: v33 (copy)
                    v33();
                end
            }
        }
    });
    return l_createElement_0(l_Root_0, v37, v38);
end;