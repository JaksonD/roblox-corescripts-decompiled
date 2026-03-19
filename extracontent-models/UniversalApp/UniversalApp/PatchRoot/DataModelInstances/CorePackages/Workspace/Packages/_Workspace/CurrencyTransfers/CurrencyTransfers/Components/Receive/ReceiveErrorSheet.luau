local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_Sheet_0 = v3.Sheet;
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_Button_0 = v3.Button;
local l_Icon_0 = v3.Icon;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_FillBehavior_0 = v3.Enums.FillBehavior;
local l_useScaledValue_0 = v3.Hooks.useScaledValue;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_Enums_0 = v3.Enums;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v15 = require(l_script_FirstAncestor_0.Enums.FailureReason);
local v16 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
local function _(v17, v18, v19) --[[ Line: 32 ]] --[[ Name: getErrorMessageAndButton ]]
    -- upvalues: v15 (copy)
    if not v17 then
        return v18.GenericError, v18.TryAgain;
    else
        local l_OK_0 = v18.OK;
        local v21 = nil;
        if v17 == v15.TransferDisabledForUser then
            v21 = v18.AccountDisabled;
        elseif v17 == v15.TransferExpired then
            v21 = string.gsub(v18.TransferExpired, "{username}", (tostring(v19)));
        else
            v21 = v18.GenericError;
            l_OK_0 = v18.TryAgain;
        end;
        return v21, l_OK_0;
    end;
end;
return function(_) --[[ Line: 58 ]] --[[ Name: ReceiveErrorSheet ]]
    -- upvalues: v16 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), v15 (copy), v2 (copy), l_Sheet_0 (copy), l_useScaledValue_0 (copy), l_View_0 (copy), l_Icon_0 (copy), l_Enums_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy)
    local v24 = v16();
    local v25 = l_useTokens_0();
    local v26 = v24.getErrorTransferModel(false);
    local v27 = v24.getRobuxTransfer(false);
    local l_triggerOnClose_0 = v24.triggerOnClose;
    local v29 = l_useLocalization_0({
        GenericError = "Features.Transfers.Body.GenericSentError", 
        AccountDisabled = "Features.Transfers.Body.UnableSendRobuxError", 
        TransferExpired = "Features.Transfers.Body.ExpiredTransferError", 
        TryAgain = "Features.Transfers.RobuxTransfer.Action.TryAgain", 
        OK = "Features.Transfers.Action.Ok"
    });
    local v30 = if v27 and v27.sender then v27.sender.targetName else nil;
    local v31 = if v26 then v26.failureReason else nil;
    local v32, v33;
    if not v31 then
        v32 = v29.GenericError;
        v33 = v29.TryAgain;
    else
        local l_OK_1 = v29.OK;
        local v35 = nil;
        if v31 == v15.TransferDisabledForUser then
            v35 = v29.AccountDisabled;
        elseif v31 == v15.TransferExpired then
            v35 = string.gsub(v29.TransferExpired, "{username}", (tostring(v30)));
        else
            v35 = v29.GenericError;
            l_OK_1 = v29.TryAgain;
        end;
        v32 = v35;
        v33 = l_OK_1;
    end;
    return v2.createElement(l_Sheet_0.Root, {
        preferCenterSheet = true, 
        snapPoints = {
            l_useScaledValue_0(300), 
            0.5
        }, 
        onClose = l_triggerOnClose_0
    }, {
        Content = v2.createElement(l_Sheet_0.Content, {
            LayoutOrder = 1
        }, {
            SheetContentContainer = v2.createElement(l_View_0, {
                tag = "col gap-xlarge auto-y size-full-0 align-x-center align-y-center padding-top-xlarge"
            }, {
                ErrorIconContainer = v2.createElement(l_View_0, {
                    tag = "size-1200-1200 radius-circle align-x-center align-y-center bg-inverse-emphasis", 
                    LayoutOrder = 1
                }, {
                    ErrorIcon = v2.createElement(l_Icon_0, {
                        name = l_Enums_0.IconName.TriangleExclamation, 
                        size = v25.Size.Size_1200, 
                        tag = "content-inverse-emphasis"
                    })
                }), 
                ErrorMessage = v2.createElement(l_Text_0, {
                    Text = v32, 
                    tag = "text-body-large content-emphasis text-align-x-center auto-y text-wrap", 
                    Size = UDim2.new(1, 0, 0, 0), 
                    LayoutOrder = 2
                })
            })
        }), 
        Actions = v2.createElement(l_Sheet_0.Actions, {
            LayoutOrder = 2
        }, {
            v2.createElement(l_View_0, {
                tag = "col auto-y align-y-center align-x-center size-full-0 gap-small"
            }, {
                v2.createElement(l_View_0, {
                    tag = "row auto-y size-full-0 gap-small"
                }, {
                    v2.createElement(l_Button_0, {
                        text = v33, 
                        onActivated = l_triggerOnClose_0, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        fillBehavior = l_FillBehavior_0.Fill
                    })
                })
            })
        })
    });
end;