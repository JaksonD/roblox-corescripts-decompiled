local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_Dialog_0 = v3.Dialog;
local l_DialogSize_0 = v3.Enums.DialogSize;
local l_Orientation_0 = v3.Enums.Orientation;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v9 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
local v10 = require(l_script_FirstAncestor_0.Actions.Send.processTransfer);
local v11 = require(l_script_FirstAncestor_0.Actions.Receive.acceptTransfer);
local v12 = require(l_script_FirstAncestor_0.Actions.Send.initiateTransfer);
local v13 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v14 = require(l_script_FirstAncestor_0.Enums.TransferDirection);
local v15 = require(l_script_FirstAncestor_0.Enums.TransferRetryOrigin);
local v16 = require(l_Parent_0.AmpUpsell);
local l_AccessResponseEnum_0 = v16.AmpEnums.AccessResponseEnum;
local l_InExpAmpWizardController_0 = v16.InExpAmpWizardController;
local v19 = require(l_script_FirstAncestor_0.Constants.AmpWizardTransferConstants);
local v20 = require(l_script_FirstAncestor_0.Utils.getCounterUserId);
return function(v21) --[[ Line: 48 ]] --[[ Name: VPCBlockContainer ]]
    -- upvalues: l_useLocalization_0 (copy), v9 (copy), v14 (copy), v13 (copy), v20 (copy), l_InExpAmpWizardController_0 (copy), l_AccessResponseEnum_0 (copy), v15 (copy), v11 (copy), v12 (copy), v10 (copy), v19 (copy), v2 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_Orientation_0 (copy), l_ButtonVariant_0 (copy)
    local v22 = l_useLocalization_0({
        AskParentTitle = "Features.Transfers.Action.VPC.AskParentTitle", 
        AskParentBodyReceive = "Features.Transfers.Action.VPC.AskParentBodyReceive", 
        AskParentBodySend = "Features.Transfers.Action.VPC.AskParentBodySend", 
        Ask = "Features.Transfers.Action.VPC.Ask", 
        Cancel = "Features.Transfers.Action.Cancel"
    });
    local v23 = v9();
    local l_direction_0 = v21.direction;
    local l_triggerOnClose_0 = v23.triggerOnClose;
    local v26 = v23.getSelectedAmount(false);
    local v27 = v23.getTransferRetryOrigin(false);
    local v28 = v23.getTransferRequestId(false);
    local v29 = if l_direction_0 == v14.Send then v22.AskParentBodySend else v22.AskParentBodyReceive;
    local function v37() --[[ Line: 68 ]] --[[ Name: openAmpWizard ]]
        -- upvalues: v21 (copy), l_triggerOnClose_0 (copy), v23 (copy), v13 (ref), v28 (copy), v26 (copy), v20 (ref), l_direction_0 (copy), l_InExpAmpWizardController_0 (ref), l_AccessResponseEnum_0 (ref), v27 (copy), v15 (ref), v11 (ref), v12 (ref), v10 (ref), v14 (ref), v19 (ref)
        if not v21.ampFeatureCheck then
            l_triggerOnClose_0();
            return;
        else
            local v30 = v23.getPromptState(false);
            v23.setPreviousPromptState(v30);
            v23.setPromptState(v13.Hidden);
            local v31 = {
                transferType = "Robux", 
                transferId = v28 or "", 
                robuxTransferAmount = tostring(v26 or 0)
            };
            local v32 = v20(v23, l_direction_0);
            local v33 = nil;
            if v32 then
                v33 = {
                    {
                        name = "targetUser", 
                        value = tostring(v32), 
                        type = "UserId"
                    }
                };
            end;
            l_InExpAmpWizardController_0.OpenAmpWizardContainerInExp(v21.ampFeatureCheck, function(v34, _) --[[ Line: 94 ]]
                -- upvalues: l_AccessResponseEnum_0 (ref), v23 (ref), v27 (ref), v15 (ref), v11 (ref), v12 (ref), v10 (ref), v26 (ref), l_direction_0 (ref), v14 (ref), l_triggerOnClose_0 (ref)
                if v34 == l_AccessResponseEnum_0.Granted then
                    local v36 = v23.getPreviousPromptState(false);
                    if v36 then
                        v23.setPromptState(v36);
                    end;
                    if v27 == v15.AcceptTransfer then
                        v11(v23);
                        return;
                    elseif v27 == v15.InitiateTransfer then
                        v12(v23);
                        return;
                    elseif v27 == v15.ProcessTransfer then
                        v10(v23, v26 or 0);
                        return;
                    elseif l_direction_0 == v14.Receive then
                        v11(v23);
                        return;
                    else
                        v10(v23, v26 or 0);
                        return;
                    end;
                else
                    l_triggerOnClose_0();
                    return;
                end;
            end, v31, v19.ENTRY_POINT_EVENT_CTX, v33, v19.NAMESPACE_NAME);
            return;
        end;
    end;
    return v2.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Small, 
        hasBackdrop = true, 
        closeOnClickOutside = true, 
        onClose = l_triggerOnClose_0
    }, {
        DialogTitle = v2.createElement(l_Dialog_0.Title, {
            text = v22.AskParentTitle
        }), 
        DialogContent = v2.createElement(l_Dialog_0.Content, nil, {
            DialogText = v2.createElement(l_Dialog_0.Text, {
                Text = v29
            })
        }), 
        DialogActions = v2.createElement(l_Dialog_0.Actions, {
            orientation = l_Orientation_0.Vertical, 
            actions = {
                {
                    text = v22.Ask, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = v37
                }, 
                {
                    text = v22.Cancel, 
                    variant = l_ButtonVariant_0.Standard, 
                    onActivated = l_triggerOnClose_0
                }
            }
        })
    });
end;