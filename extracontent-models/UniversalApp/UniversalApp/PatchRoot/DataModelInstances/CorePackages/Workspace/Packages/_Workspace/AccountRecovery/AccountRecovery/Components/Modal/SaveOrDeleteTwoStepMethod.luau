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
local l_GetFFlagEnableTwoStepMethodDynamicText_0 = require(l_script_FirstAncestor_0.Flags).GetFFlagEnableTwoStepMethodDynamicText;
local v13 = require(l_script_FirstAncestor_0.Thunks.GetCurrentTwoStepMethod);
local v14 = require(l_script_FirstAncestor_0.Thunks.DisableTwoStepMethod);
local _ = require(l_script_FirstAncestor_0.Common.AccountRecoveryRequestTypes);
local v16 = require(l_script_FirstAncestor_0.Enums.ModalState);
local v17 = require(l_script_FirstAncestor_0.Enums.AccountRecoveryActionType);
return function(v18) --[[ Line: 36 ]]
    -- upvalues: v2 (copy), v7 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v13 (copy), l_useLocalization_0 (copy), v17 (copy), v16 (copy), v14 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_GetFFlagEnableTwoStepMethodDynamicText_0 (copy), l_ButtonVariant_0 (copy)
    local v19 = v2.useContext(v7);
    local v20 = l_useDispatch_0();
    local v21 = l_useRoactService_0(l_RoactNetworking_0);
    local v22, v23 = v2.useState("");
    local v24, v25 = v2.useState(false);
    local v26, v27 = v2.useState("");
    local v28, v29 = v2.useState(true);
    v2.useEffect(function() --[[ Line: 47 ]]
        -- upvalues: v20 (copy), v13 (ref), v21 (copy), v19 (copy), v23 (copy), v29 (copy)
        v20(v13(v21, v19.state.recoverySessionId)):andThen(function(v30) --[[ Line: 49 ]]
            -- upvalues: v23 (ref), v29 (ref)
            if not v30.isError then
                v23(v30.data.twoStepMethod);
            end;
            v29(false);
        end);
    end, {});
    local v31 = l_useLocalization_0({
        email = "Authentication.AccountRecovery.Label.Email2sv", 
        authenticator = "Authentication.AccountRecovery.Label.Authenticator2sv", 
        securityKey = "Authentication.AccountRecovery.Label.SecurityKey2sv"
    });
    local function _(v32) --[[ Line: 64 ]]
        -- upvalues: v31 (copy)
        if v32 == "Email" then
            return v31.email;
        elseif v32 == "Authenticator" then
            return v31.authenticator;
        elseif v32 == "SecurityKey" then
            return v31.securityKey;
        else
            return "";
        end;
    end;
    local v34 = l_useLocalization_0({
        headingText = "Authentication.AccountRecovery.Heading.SaveTwoStepMethod", 
        bodyText = "Authentication.AccountRecovery.Description.SaveTwoStepMethod", 
        dynamicBodyText = {
            "Description.KeepTwoStepMethodDynamic"; 
            twoStepMethod = if v22 == "Email" then v31.email else if v22 == "Authenticator" then v31.authenticator else if v22 == "SecurityKey" then v31.securityKey else ""
        }, 
        saveButtonText = "Authentication.AccountRecovery.Action.Save", 
        deleteButtonText = "Authentication.AccountRecovery.Action.Delete", 
        requestErrorText = v26 ~= "" and v26 or nil
    });
    local function v35() --[[ Line: 87 ]]
        -- upvalues: v18 (copy), v19 (copy), v17 (ref), v16 (ref)
        if v18.shouldUpdateEmail then
            v19.dispatch({
                type = v17.SET_MODAL_STATE_AND_PROPS, 
                data = {
                    modalStateAndProps = {
                        modalState = v16.UPDATE_EMAIL, 
                        props = {
                            email = v18.email, 
                            onPasswordResetSuccess = v18.onPasswordResetSuccess
                        }
                    }
                }
            });
            return;
        else
            v18.onPasswordResetSuccess();
            return;
        end;
    end;
    local function v37() --[[ Line: 106 ]]
        -- upvalues: v24 (copy), v22 (copy), v28 (copy), v25 (copy), v27 (copy), v20 (copy), v14 (ref), v21 (copy), v19 (copy), v35 (copy)
        if v24 or v22 == "" or v28 then
            return;
        else
            v25(true);
            v27("");
            v20(v14(v21, {
                recoverySessionId = v19.state.recoverySessionId, 
                twoStepMethod = v22
            })):andThen(function(v36) --[[ Line: 115 ]]
                -- upvalues: v25 (ref), v27 (ref), v35 (ref)
                v25(false);
                if v36.isError then
                    v27(v36.errorKey);
                    return;
                else
                    v35();
                    return;
                end;
            end);
            return;
        end;
    end;
    local function _() --[[ Line: 125 ]]
        -- upvalues: v24 (copy), v28 (copy), v25 (copy), v27 (copy), v35 (copy)
        if v24 or v28 then
            return;
        else
            v25(true);
            v27("");
            v35();
            return;
        end;
    end;
    local l_createElement_0 = v2.createElement;
    local l_Root_0 = l_Dialog_0.Root;
    local v41 = {
        size = l_DialogSize_0.Small, 
        disablePortal = false, 
        hasBackdrop = true
    };
    local v42 = {
        DialogTitle = not v28 and v2.createElement(l_Dialog_0.Title, {
            LayoutOrder = 1, 
            text = v34.headingText
        })
    };
    local v43 = not v28;
    if v43 then
        v43 = v2.createElement;
        local l_Content_0 = l_Dialog_0.Content;
        local v45 = {
            LayoutOrder = 2
        };
        local v46 = {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            DialogText = v2.createElement(l_Dialog_0.Text, {
                LayoutOrder = 1, 
                Text = if l_GetFFlagEnableTwoStepMethodDynamicText_0() then v34.dynamicBodyText else v34.bodyText
            })
        };
        local v47 = false;
        if v26 ~= "" then
            v47 = v2.createElement(l_Dialog_0.Text, {
                LayoutOrder = 2, 
                Text = v34.requestErrorText or ""
            });
        end;
        v46.RequestErrorText = v47;
        v43 = v43(l_Content_0, v45, v46);
    end;
    v42.DialogContent = v43;
    v42.DialogActions = not v28 and v2.createElement(l_Dialog_0.Actions, {
        LayoutOrder = 3, 
        actions = {
            {
                text = v34.saveButtonText, 
                variant = l_ButtonVariant_0.Emphasis, 
                onActivated = function() --[[ Line: 167 ]] --[[ Name: onActivated ]]
                    -- upvalues: v24 (copy), v28 (copy), v25 (copy), v27 (copy), v35 (copy)
                    if not v24 then
                        if v28 then
                            return;
                        else
                            v25(true);
                            v27("");
                            v35();
                        end;
                    end;
                end
            }, 
            {
                text = v34.deleteButtonText, 
                variant = l_ButtonVariant_0.Standard, 
                onActivated = function() --[[ Line: 174 ]] --[[ Name: onActivated ]]
                    -- upvalues: v37 (copy)
                    v37();
                end
            }
        }
    });
    return l_createElement_0(l_Root_0, v41, v42);
end;