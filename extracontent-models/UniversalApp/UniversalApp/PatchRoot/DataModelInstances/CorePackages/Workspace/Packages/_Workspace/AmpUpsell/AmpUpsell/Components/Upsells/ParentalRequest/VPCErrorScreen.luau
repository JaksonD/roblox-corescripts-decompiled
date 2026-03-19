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
local function v14(v13) --[[ Line: 27 ]] --[[ Name: selectScreenSize ]]
    return v13.ScreenSize;
end;
return function(v15) --[[ Line: 31 ]] --[[ Name: VPCErrorScreen ]]
    -- upvalues: l_useSelector_0 (copy), v14 (copy), l_getRetryBehaviorFromErrorCodeAndRetryNum_0 (copy), l_getStringsFromErrorCodeAndRetryNum_0 (copy), l_useLocalization_0 (copy), v11 (copy), l_vpcErrorScreenStrings_0 (copy), l_VPCRetryBehaviorEnum_0 (copy), l_ButtonType_0 (copy), v2 (copy), l_InteractiveAlert_0 (copy)
    local l_errorCode_0 = v15.errorCode;
    local l_onRetryAmp_0 = v15.onRetryAmp;
    local l_onRetryVPC_0 = v15.onRetryVPC;
    local l_onCancel_0 = v15.onCancel;
    local l_onSuccess_0 = v15.onSuccess;
    local l_retryNum_0 = v15.retryNum;
    local v22 = l_useSelector_0(v14);
    local v23 = l_getRetryBehaviorFromErrorCodeAndRetryNum_0(l_errorCode_0, l_retryNum_0);
    local v24 = l_getStringsFromErrorCodeAndRetryNum_0(l_errorCode_0, l_retryNum_0);
    local v25 = l_useLocalization_0(v11.Dictionary.join(l_vpcErrorScreenStrings_0, {
        titleText = v24.title, 
        bodyText = v24.body
    }));
    local v26 = {};
    if v23 == l_VPCRetryBehaviorEnum_0.RetryVPC or v23 == l_VPCRetryBehaviorEnum_0.RetryAMP then
        local v27 = nil;
        v27 = if v23 == l_VPCRetryBehaviorEnum_0.RetryVPC then l_onRetryVPC_0 else l_onRetryAmp_0;
        v26 = {
            {
                buttonType = l_ButtonType_0.Secondary, 
                props = {
                    onActivated = l_onCancel_0, 
                    text = v25.cancelButton
                }
            }, 
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = v27, 
                    text = v25.retryButton
                }
            }
        };
    else
        v26 = if v23 == l_VPCRetryBehaviorEnum_0.Success then {
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = l_onSuccess_0, 
                    text = v25.okButton
                }
            }
        } else {
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = l_onCancel_0, 
                    text = v25.okButton
                }
            }
        };
    end;
    return v2.createElement(l_InteractiveAlert_0, {
        anchorPoint = Vector2.new(0.5, 0.5), 
        position = UDim2.new(0.5, 0, 0.5, 0), 
        screenSize = v22, 
        title = v25.titleText, 
        bodyText = v25.bodyText, 
        buttonStackInfo = {
            buttons = v26
        }
    });
end;