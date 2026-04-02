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
local v21 = require(l_script_FirstAncestor_0.Events.CurrencyTransferTelemetry);
local v22 = require(l_script_FirstAncestor_0.Utils.logCurrencyTransferCounter);
local v23 = require(l_script_FirstAncestor_0.Utils.getTransferRequestInternalId);
return function(v24) --[[ Line: 51 ]] --[[ Name: VPCBlockContainer ]]
    -- upvalues: l_useLocalization_0 (copy), v9 (copy), v14 (copy), v2 (copy), v22 (copy), v21 (copy), v13 (copy), v23 (copy), v20 (copy), l_InExpAmpWizardController_0 (copy), l_AccessResponseEnum_0 (copy), v15 (copy), v11 (copy), v12 (copy), v10 (copy), v19 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_Orientation_0 (copy), l_ButtonVariant_0 (copy)
    local v25 = l_useLocalization_0({
        AskParentTitle = "Features.Transfers.Action.VPC.AskParentTitle", 
        AskParentBodyReceive = "Features.Transfers.Action.VPC.AskParentBodyReceive", 
        AskParentBodySend = "Features.Transfers.Action.VPC.AskParentBodySend", 
        Ask = "Features.Transfers.Action.VPC.Ask", 
        Cancel = "Features.Transfers.Action.Cancel"
    });
    local v26 = v9();
    local l_direction_0 = v24.direction;
    local l_triggerOnClose_0 = v26.triggerOnClose;
    local v29 = v26.getSelectedAmount(false);
    local v30 = v26.getTransferRetryOrigin(false);
    local v31 = v26.getTransferRequestId(false);
    local v32 = if l_direction_0 == v14.Send then v25.AskParentBodySend else v25.AskParentBodyReceive;
    v2.useEffect(function() --[[ Line: 71 ]]
        -- upvalues: v22 (ref), v26 (copy), v21 (ref)
        v22(v26, v21.CurrencyTransferVPCBlockDialogShownCounter, {
            recourseSurface = "vpc"
        });
        return nil;
    end, {});
    local function v33() --[[ Line: 78 ]] --[[ Name: onCancelClicked ]]
        -- upvalues: v22 (ref), v26 (copy), v21 (ref), l_triggerOnClose_0 (copy)
        v22(v26, v21.CurrencyTransferVPCBlockCancelClickedCounter, {
            recourseSurface = "vpc"
        });
        l_triggerOnClose_0();
    end;
    local function v41() --[[ Line: 85 ]] --[[ Name: openAmpWizard ]]
        -- upvalues: v22 (ref), v26 (copy), v21 (ref), v24 (copy), l_triggerOnClose_0 (copy), v13 (ref), v23 (ref), v31 (copy), v29 (copy), v20 (ref), l_direction_0 (copy), l_InExpAmpWizardController_0 (ref), l_AccessResponseEnum_0 (ref), v30 (copy), v15 (ref), v11 (ref), v12 (ref), v10 (ref), v14 (ref), v19 (ref)
        v22(v26, v21.CurrencyTransferVPCBlockAskClickedCounter, {
            recourseSurface = "vpc"
        });
        if not v24.ampFeatureCheck then
            l_triggerOnClose_0();
            return;
        else
            local v34 = v26.getPromptState(false);
            v26.setPreviousPromptState(v34);
            v26.setPromptState(v13.Hidden);
            local v35 = {
                transferType = "Robux", 
                transferId = v23(v31), 
                robuxTransferAmount = tostring(v29 or 0)
            };
            local v36 = v20(v26, l_direction_0);
            local v37 = nil;
            if v36 then
                v37 = {
                    {
                        name = "targetUser", 
                        value = tostring(v36), 
                        type = "UserId"
                    }
                };
            end;
            l_InExpAmpWizardController_0.OpenAmpWizardContainerInExp(v24.ampFeatureCheck, function(v38, _) --[[ Line: 114 ]]
                -- upvalues: l_AccessResponseEnum_0 (ref), v26 (ref), v30 (ref), v15 (ref), v11 (ref), v12 (ref), v10 (ref), v29 (ref), l_direction_0 (ref), v14 (ref), l_triggerOnClose_0 (ref)
                if v38 == l_AccessResponseEnum_0.Granted then
                    local v40 = v26.getPreviousPromptState(false);
                    if v40 then
                        v26.setPromptState(v40);
                    end;
                    if v30 == v15.AcceptTransfer then
                        v11(v26);
                        return;
                    elseif v30 == v15.InitiateTransfer then
                        v12(v26);
                        return;
                    elseif v30 == v15.ProcessTransfer then
                        v10(v26, v29 or 0);
                        return;
                    elseif l_direction_0 == v14.Receive then
                        v11(v26);
                        return;
                    else
                        v10(v26, v29 or 0);
                        return;
                    end;
                else
                    l_triggerOnClose_0();
                    return;
                end;
            end, v35, v19.ENTRY_POINT_EVENT_CTX, v37, v19.NAMESPACE_NAME);
            return;
        end;
    end;
    return v2.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Small, 
        hasBackdrop = true, 
        closeOnClickOutside = true, 
        onClose = v33
    }, {
        DialogTitle = v2.createElement(l_Dialog_0.Title, {
            text = v25.AskParentTitle
        }), 
        DialogContent = v2.createElement(l_Dialog_0.Content, nil, {
            DialogText = v2.createElement(l_Dialog_0.Text, {
                Text = v32
            })
        }), 
        DialogActions = v2.createElement(l_Dialog_0.Actions, {
            orientation = l_Orientation_0.Vertical, 
            actions = {
                {
                    text = v25.Ask, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = v41
                }, 
                {
                    text = v25.Cancel, 
                    variant = l_ButtonVariant_0.Standard, 
                    onActivated = v33
                }
            }
        })
    });
end;