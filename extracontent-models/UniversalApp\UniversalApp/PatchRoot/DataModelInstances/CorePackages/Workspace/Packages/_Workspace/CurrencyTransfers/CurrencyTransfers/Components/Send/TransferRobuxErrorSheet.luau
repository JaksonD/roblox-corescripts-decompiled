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
local v16 = require(l_script_FirstAncestor_0.Components.Generic.TransferRobuxHeader);
local v17 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
local function v23(v18, v19, v20) --[[ Line: 34 ]] --[[ Name: getErrorMessageAndButton ]]
    -- upvalues: v15 (copy)
    if not v18 then
        return v19.GenericError, v19.TryAgain;
    else
        local l_OK_0 = v19.OK;
        local v22 = nil;
        if v18 == v15.TransferDailyLimitExceeded then
            v22 = v19.DailyLimitExceeded;
        elseif v18 == v15.TransferMonthlyLimitExceeded then
            v22 = v19.MonthlyLimitExceeded;
        elseif v18 == v15.TransferDisabledForUser then
            v22 = v19.AccountDisabled;
        elseif v18 == v15.UserNotAllowed then
            v22 = string.gsub(v19.ReceiverNotAllowed, "{username}", (tostring(v20)));
        else
            v22 = v19.GenericError;
            l_OK_0 = v19.TryAgain;
        end;
        return v22, l_OK_0;
    end;
end;
return function(_) --[[ Line: 60 ]] --[[ Name: TransferRobuxErrorSheet ]]
    -- upvalues: v17 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), v23 (copy), v2 (copy), l_Sheet_0 (copy), l_useScaledValue_0 (copy), v16 (copy), l_View_0 (copy), l_Icon_0 (copy), l_Enums_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy)
    local v25 = v17();
    local v26 = l_useTokens_0();
    local v27 = v25.getRobuxBalanceAmount(false);
    local v28 = v25.getErrorTransferModel(false);
    local v29 = v25.getRecipient(false);
    local l_triggerOnClose_0 = v25.triggerOnClose;
    local v31 = l_useLocalization_0({
        SendRobux = "Features.Transfers.RobuxTransfer.Heading.SendRobux", 
        GenericError = "Features.Transfers.Body.GenericSentError", 
        DailyLimitExceeded = "Features.Transfers.Body.DailyLimitExceededError", 
        MonthlyLimitExceeded = "Features.Transfers.Body.MonthlyLimitExceededError", 
        AccountDisabled = "Features.Transfers.Body.UnableSendRobuxError", 
        ReceiverNotAllowed = "Features.Transfers.RobuxTransfer.Error.ReceiverNotAllowed", 
        TryAgain = "Features.Transfers.RobuxTransfer.Action.TryAgain", 
        OK = "Features.Transfers.Action.Ok"
    });
    local v32 = if v29 then v29.targetName else nil;
    local v33 = if v28 then v28.failureReason else nil;
    local v34, v35 = v23(v33, v31, v32);
    return v2.createElement(l_Sheet_0.Root, {
        preferCenterSheet = true, 
        snapPoints = {
            l_useScaledValue_0(300), 
            0.5
        }, 
        onClose = l_triggerOnClose_0
    }, {
        Header = v2.createElement(l_Sheet_0.Header, {}, {
            TransferRobuxHeader = v2.createElement(v16, {
                titleText = v31.SendRobux, 
                robuxBalanceAmount = v27
            })
        }), 
        Content = v2.createElement(l_Sheet_0.Content, {
            LayoutOrder = 2
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
                        size = v26.Size.Size_1200, 
                        tag = "content-inverse-emphasis"
                    })
                }), 
                ErrorMessage = v2.createElement(l_Text_0, {
                    Text = v34, 
                    tag = "text-body-large content-emphasis text-align-x-center auto-y text-wrap", 
                    Size = UDim2.new(1, 0, 0, 0), 
                    LayoutOrder = 2
                })
            })
        }), 
        Actions = v2.createElement(l_Sheet_0.Actions, {
            LayoutOrder = 3
        }, {
            v2.createElement(l_View_0, {
                tag = "col auto-y align-y-center align-x-center size-full-0 gap-small"
            }, {
                v2.createElement(l_View_0, {
                    tag = "row auto-y size-full-0 gap-small"
                }, {
                    v2.createElement(l_Button_0, {
                        text = v35, 
                        onActivated = l_triggerOnClose_0, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        fillBehavior = l_FillBehavior_0.Fill
                    })
                })
            })
        })
    });
end;