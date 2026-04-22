local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SharedFlags);
local v4 = require(l_script_FirstAncestor_0.Localization.TransferLocalizationKeys);
local v5 = require(l_Parent_0.Foundation);
local l_ButtonVariant_0 = v5.Enums.ButtonVariant;
local l_Dialog_0 = v5.Dialog;
local l_DialogSize_0 = v5.Enums.DialogSize;
local l_Orientation_0 = v5.Enums.Orientation;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v11 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
local v12 = require(l_script_FirstAncestor_0.Actions.Send.processTransfer);
local v13 = require(l_script_FirstAncestor_0.Actions.Receive.acceptTransfer);
local v14 = require(l_script_FirstAncestor_0.Actions.Send.initiateTransfer);
local v15 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v16 = require(l_script_FirstAncestor_0.Enums.TransferDirection);
local v17 = require(l_script_FirstAncestor_0.Enums.TransferRetryOrigin);
local v18 = require(l_Parent_0.AmpUpsell);
local l_AccessResponseEnum_0 = v18.AmpEnums.AccessResponseEnum;
local l_ActionTypeEnum_0 = v18.AmpEnums.ActionTypeEnum;
local l_ActionStatusEnum_0 = v18.AmpEnums.ActionStatusEnum;
local l_InExpAmpWizardController_0 = v18.InExpAmpWizardController;
local v23 = require(l_script_FirstAncestor_0.Constants.AmpWizardTransferConstants);
local v24 = require(l_script_FirstAncestor_0.Utils.getCounterUserId);
local v25 = require(l_script_FirstAncestor_0.Events.CurrencyTransferTelemetry);
local v26 = require(l_script_FirstAncestor_0.Enums.RobuxTransferFlowEventName);
local v27 = require(l_script_FirstAncestor_0.Utils.logCurrencyTransferCounter);
local v28 = require(l_script_FirstAncestor_0.Utils.logRobuxTransferFlowEvent);
local v29 = require(l_script_FirstAncestor_0.Utils.getTransferRequestInternalId);
local function _(v30) --[[ Line: 59 ]] --[[ Name: isVpcRequestSubmitted ]]
    -- upvalues: l_ActionTypeEnum_0 (copy), l_ActionStatusEnum_0 (copy)
    if type(v30) ~= "table" then
        return false;
    else
        local v31 = true;
        if v30[l_ActionTypeEnum_0.ParentConsent] ~= l_ActionStatusEnum_0.Success then
            v31 = v30[l_ActionTypeEnum_0.ParentLink] == l_ActionStatusEnum_0.Success;
        end;
        return v31;
    end;
end;
return function(v33) --[[ Line: 67 ]] --[[ Name: VPCBlockContainer ]]
    -- upvalues: l_useLocalization_0 (copy), v4 (copy), v11 (copy), v16 (copy), v2 (copy), v27 (copy), v25 (copy), v3 (copy), v28 (copy), v26 (copy), v15 (copy), v29 (copy), v24 (copy), l_InExpAmpWizardController_0 (copy), l_ActionTypeEnum_0 (copy), l_ActionStatusEnum_0 (copy), l_AccessResponseEnum_0 (copy), v17 (copy), v13 (copy), v14 (copy), v12 (copy), v23 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_Orientation_0 (copy), l_ButtonVariant_0 (copy)
    local v34 = l_useLocalization_0(v4.Presets.VPCBlockContainer);
    local v35 = v11();
    local l_direction_0 = v33.direction;
    local l_triggerOnClose_0 = v35.triggerOnClose;
    local v38 = v35.getSelectedAmount(false);
    local v39 = v35.getTransferRetryOrigin(false);
    local v40 = v35.getTransferRequestId(false);
    local v41 = if l_direction_0 == v16.Send then v34.AskParentBodySend else v34.AskParentBodyReceive;
    v2.useEffect(function() --[[ Line: 81 ]]
        -- upvalues: v27 (ref), v35 (copy), v25 (ref), v3 (ref), v28 (ref), v26 (ref)
        v27(v35, v25.CurrencyTransferVPCBlockDialogShownCounter, {
            recourseSurface = "vpc"
        });
        if v3.FFlagEnableRobuxTransferFlowEventIngest then
            v28(v35, v26.vpc_block_shown);
        end;
        return nil;
    end, {
        v35
    });
    local function v42() --[[ Line: 91 ]] --[[ Name: onCancelClicked ]]
        -- upvalues: v27 (ref), v35 (copy), v25 (ref), v3 (ref), v28 (ref), v26 (ref), l_triggerOnClose_0 (copy)
        v27(v35, v25.CurrencyTransferVPCBlockCancelClickedCounter, {
            recourseSurface = "vpc"
        });
        if v3.FFlagEnableRobuxTransferFlowEventIngest then
            v28(v35, v26.vpc_cancel_clicked);
        end;
        l_triggerOnClose_0();
    end;
    local function v51() --[[ Line: 101 ]] --[[ Name: openAmpWizard ]]
        -- upvalues: v27 (ref), v35 (copy), v25 (ref), v3 (ref), v28 (ref), v26 (ref), v33 (copy), l_triggerOnClose_0 (copy), v15 (ref), v29 (ref), v40 (copy), v38 (copy), v24 (ref), l_direction_0 (copy), l_InExpAmpWizardController_0 (ref), l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref), l_AccessResponseEnum_0 (ref), v39 (copy), v17 (ref), v13 (ref), v14 (ref), v12 (ref), v16 (ref), v23 (ref)
        v27(v35, v25.CurrencyTransferVPCBlockAskClickedCounter, {
            recourseSurface = "vpc"
        });
        if v3.FFlagEnableRobuxTransferFlowEventIngest then
            v28(v35, v26.vpc_ask_clicked);
        end;
        if not v33.ampFeatureCheck then
            l_triggerOnClose_0();
            return;
        else
            local v43 = v35.getPromptState(false);
            v35.setPreviousPromptState(v43);
            v35.setPromptState(v15.Hidden);
            local v44 = {
                transferType = "Robux", 
                transferId = v29(v40), 
                robuxTransferAmount = tostring(v38 or 0)
            };
            local v45 = v24(v35, l_direction_0);
            local v46 = nil;
            if v45 then
                v46 = {
                    {
                        name = "targetUser", 
                        value = tostring(v45), 
                        type = "UserId"
                    }
                };
            end;
            l_InExpAmpWizardController_0.OpenAmpWizardContainerInExp(v33.ampFeatureCheck, function(v47, v48) --[[ Line: 133 ]]
                -- upvalues: l_ActionTypeEnum_0 (ref), l_ActionStatusEnum_0 (ref), v3 (ref), v28 (ref), v35 (ref), v26 (ref), l_AccessResponseEnum_0 (ref), v39 (ref), v17 (ref), v13 (ref), v14 (ref), v12 (ref), v38 (ref), l_direction_0 (ref), v16 (ref), l_triggerOnClose_0 (ref)
                local v49 = type(v48) == "table" and (v48[l_ActionTypeEnum_0.ParentConsent] == l_ActionStatusEnum_0.Success or v48[l_ActionTypeEnum_0.ParentLink] == l_ActionStatusEnum_0.Success);
                if v3.FFlagEnableRobuxTransferFlowEventIngest and v49 then
                    v28(v35, v26.vpc_submitted);
                end;
                if v47 == l_AccessResponseEnum_0.Granted then
                    local v50 = v35.getPreviousPromptState(false);
                    if v50 then
                        v35.setPromptState(v50);
                    end;
                    if v39 == v17.AcceptTransfer then
                        v13(v35);
                        return;
                    elseif v39 == v17.InitiateTransfer then
                        v14(v35);
                        return;
                    elseif v39 == v17.ProcessTransfer then
                        v12(v35, v38 or 0);
                        return;
                    elseif l_direction_0 == v16.Receive then
                        v13(v35);
                        return;
                    else
                        v12(v35, v38 or 0);
                        return;
                    end;
                else
                    l_triggerOnClose_0();
                    return;
                end;
            end, v44, v23.ENTRY_POINT_EVENT_CTX, v46, v23.NAMESPACE_NAME);
            return;
        end;
    end;
    return v2.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Small, 
        hasBackdrop = true, 
        closeOnClickOutside = true, 
        onClose = v42
    }, {
        DialogTitle = v2.createElement(l_Dialog_0.Title, {
            text = v34.AskParentTitle
        }), 
        DialogContent = v2.createElement(l_Dialog_0.Content, nil, {
            DialogText = v2.createElement(l_Dialog_0.Text, {
                Text = v41
            })
        }), 
        DialogActions = v2.createElement(l_Dialog_0.Actions, {
            orientation = l_Orientation_0.Vertical, 
            actions = {
                {
                    text = v34.Ask, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = v51
                }
            }
        })
    });
end;