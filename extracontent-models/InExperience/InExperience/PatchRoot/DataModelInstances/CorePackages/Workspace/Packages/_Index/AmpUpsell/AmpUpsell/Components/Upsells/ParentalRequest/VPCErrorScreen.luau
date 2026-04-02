local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_vpcErrorScreenStrings_0 = require(l_script_FirstAncestor_0.Common.LocalizationStrings).vpcErrorScreenStrings;
local l_getRetryBehaviorFromErrorCodeAndRetryNum_0 = require(l_script_FirstAncestor_0.Common.VPCErrorUtils).getRetryBehaviorFromErrorCodeAndRetryNum;
local l_getStringsFromErrorCodeAndRetryNum_0 = require(l_script_FirstAncestor_0.Common.VPCErrorUtils).getStringsFromErrorCodeAndRetryNum;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v8 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v8.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v8.App.Button.Enum.ButtonType;
local v11 = require(l_Parent_0.Cryo);
local l_VPCRetryBehaviorEnum_0 = require(l_script_FirstAncestor_0.Common.Enums).VPCRetryBehaviorEnum;
local v13 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableFoundationUIVPCUpsell);
local v14 = require(l_Parent_0.Foundation);
local l_Dialog_0 = v14.Dialog;
local l_DialogSize_0 = v14.Enums.DialogSize;
local l_ButtonVariant_0 = v14.Enums.ButtonVariant;
local function v19(v18) --[[ Line: 33 ]] --[[ Name: selectScreenSize ]]
    return v18.ScreenSize;
end;
return function(v20) --[[ Line: 37 ]] --[[ Name: VPCErrorScreen ]]
    -- upvalues: l_useSelector_0 (copy), v19 (copy), l_getRetryBehaviorFromErrorCodeAndRetryNum_0 (copy), l_getStringsFromErrorCodeAndRetryNum_0 (copy), l_useLocalization_0 (copy), v11 (copy), l_vpcErrorScreenStrings_0 (copy), l_VPCRetryBehaviorEnum_0 (copy), v13 (copy), l_ButtonVariant_0 (copy), l_ButtonType_0 (copy), v2 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_InteractiveAlert_0 (copy)
    local l_errorCode_0 = v20.errorCode;
    local l_onRetryAmp_0 = v20.onRetryAmp;
    local l_onRetryVPC_0 = v20.onRetryVPC;
    local l_onCancel_0 = v20.onCancel;
    local l_onSuccess_0 = v20.onSuccess;
    local l_retryNum_0 = v20.retryNum;
    local v27 = l_useSelector_0(v19);
    local v28 = l_getRetryBehaviorFromErrorCodeAndRetryNum_0(l_errorCode_0, l_retryNum_0);
    local v29 = l_getStringsFromErrorCodeAndRetryNum_0(l_errorCode_0, l_retryNum_0);
    local v30 = l_useLocalization_0(v11.Dictionary.join(l_vpcErrorScreenStrings_0, {
        titleText = v29.title, 
        bodyText = v29.body
    }));
    local v31 = {};
    local v32 = {};
    if v28 == l_VPCRetryBehaviorEnum_0.RetryVPC or v28 == l_VPCRetryBehaviorEnum_0.RetryAMP then
        local v33 = nil;
        v33 = if v28 == l_VPCRetryBehaviorEnum_0.RetryVPC then l_onRetryVPC_0 else l_onRetryAmp_0;
        if v13() then
            v32 = {
                {
                    text = v30.cancelButton, 
                    variant = l_ButtonVariant_0.Standard, 
                    onActivated = l_onCancel_0
                }, 
                {
                    text = v30.retryButton, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = v33
                }
            };
        else
            v31 = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = l_onCancel_0, 
                        text = v30.cancelButton
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v33, 
                        text = v30.retryButton
                    }
                }
            };
        end;
    elseif v28 == l_VPCRetryBehaviorEnum_0.Success then
        if v13() then
            v32 = {
                {
                    text = v30.okButton, 
                    variant = l_ButtonVariant_0.Standard, 
                    onActivated = l_onSuccess_0
                }
            };
        else
            v31 = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = l_onSuccess_0, 
                        text = v30.okButton
                    }
                }
            };
        end;
    elseif v13() then
        v32 = {
            {
                text = v30.okButton, 
                variant = l_ButtonVariant_0.Standard, 
                onActivated = l_onCancel_0
            }
        };
    else
        v31 = {
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = l_onCancel_0, 
                    text = v30.okButton
                }
            }
        };
    end;
    if v13() then
        return v2.createElement(l_Dialog_0.Root, {
            size = l_DialogSize_0.Small, 
            onClose = l_onCancel_0
        }, {
            DialogTitle = v2.createElement(l_Dialog_0.Title, {
                text = v30.titleText
            }), 
            DialogContent = v2.createElement(l_Dialog_0.Content, {
                LayoutOrder = 2
            }, {
                DialogText = v2.createElement(l_Dialog_0.Text, {
                    Text = v30.bodyText
                })
            }), 
            DialogActions = v2.createElement(l_Dialog_0.Actions, {
                LayoutOrder = 3, 
                actions = v32
            })
        });
    else
        return v2.createElement(l_InteractiveAlert_0, {
            anchorPoint = Vector2.new(0.5, 0.5), 
            position = UDim2.new(0.5, 0, 0.5, 0), 
            screenSize = v27, 
            title = v30.titleText, 
            bodyText = v30.bodyText, 
            buttonStackInfo = {
                buttons = v31
            }
        });
    end;
end;