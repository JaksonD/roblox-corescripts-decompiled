local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_script_FirstAncestor_0.NetworkRequests.getBalanceRequest);
local v5 = require(l_script_FirstAncestor_0.Hooks.useUserNameFromUserId);
local v6 = require(l_Parent_0.Foundation);
local l_Sheet_0 = v6.Sheet;
local l_View_0 = v6.View;
local l_Text_0 = v6.Text;
local l_Button_0 = v6.Button;
local l_Icon_0 = v6.Icon;
local l_ButtonVariant_0 = v6.Enums.ButtonVariant;
local l_FillBehavior_0 = v6.Enums.FillBehavior;
local l_useScaledValue_0 = v6.Hooks.useScaledValue;
local l_useTokens_0 = v6.Hooks.useTokens;
local l_Enums_0 = v6.Enums;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v18 = require(l_script_FirstAncestor_0.Enums.FailureReason);
local v19 = require(l_script_FirstAncestor_0.Components.Generic.TransferRobuxHeader);
local v20 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
local function v27(v21, v22, v23) --[[ Line: 38 ]] --[[ Name: getErrorMessageAndButton ]]
    -- upvalues: v18 (copy)
    if not v21 then
        return v22.GenericError, v22.TryAgain;
    else
        local l_OK_0 = v22.OK;
        local v25 = nil;
        if v21 == v18.TransferDailyLimitExceeded then
            v25 = v22.DailyLimitExceeded;
        elseif v21 == v18.TransferMonthlyLimitExceeded then
            v25 = v22.MonthlyLimitExceeded;
        elseif v21 == v18.TransferDisabledForUser then
            v25 = v22.AccountDisabled;
        elseif v21 == v18.ReceiverNotAllowed then
            local v26 = tostring(v23 or "");
            v25 = v22.ReceiverNotAllowed:gsub("{username}", v26):gsub("{userName}", v26);
        else
            v25 = v22.GenericError;
            l_OK_0 = v22.TryAgain;
        end;
        return v25, l_OK_0;
    end;
end;
return function(_) --[[ Line: 65 ]] --[[ Name: TransferRobuxErrorSheet ]]
    -- upvalues: v20 (copy), l_useTokens_0 (copy), v3 (copy), v18 (copy), v5 (copy), v2 (copy), v4 (copy), l_useLocalization_0 (copy), v27 (copy), l_Sheet_0 (copy), l_useScaledValue_0 (copy), v19 (copy), l_View_0 (copy), l_Icon_0 (copy), l_Enums_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy)
    local v29 = v20();
    local v30 = l_useTokens_0();
    local v31 = v3.useSignalState(v29.getRobuxBalanceAmount) or 0;
    local v32 = v29.getBalanceReceivedFromApi(false);
    local v33 = v29.getErrorTransferModel(false);
    local v34 = v29.getRecipient(false);
    local v35 = v29.getRecipientUserId(false);
    local l_triggerOnClose_0 = v29.triggerOnClose;
    local v37 = if v33 then v33.failureReason else nil;
    local v38 = false;
    if v37 == v18.ReceiverNotAllowed then
        v38 = not v34 and v35 and v35 ~= 0;
    end;
    local v39 = v5(if v38 and v35 and v35 ~= 0 then v35 else nil);
    v2.useEffect(function() --[[ Line: 85 ]]
        -- upvalues: v32 (copy), v4 (ref), v29 (copy)
        if v32 then
            return;
        else
            v4():andThen(function(v40) --[[ Line: 90 ]]
                -- upvalues: v29 (ref)
                v29.setRobuxBalanceAmount(v40);
                v29.setBalanceReceivedFromApi(true);
            end):catch(function() --[[ Line: 94 ]]

            end);
            return;
        end;
    end, {
        v32
    });
    local v41 = l_useLocalization_0({
        SendRobux = "Features.Transfers.RobuxTransfer.Heading.SendRobux", 
        GenericError = "Features.Transfers.Body.GenericSentError", 
        DailyLimitExceeded = "Features.Transfers.Body.DailyLimitExceededError", 
        MonthlyLimitExceeded = "Features.Transfers.Body.MonthlyLimitExceededError", 
        AccountDisabled = "Features.Transfers.Body.UnableSendRobuxError", 
        ReceiverNotAllowed = "Features.Transfers.RobuxTransfer.Error.ReceiverNotAllowed", 
        TryAgain = "Features.Transfers.RobuxTransfer.Action.TryAgain", 
        OK = "Features.Transfers.Action.Ok"
    });
    local v42 = if v34 and (v34.targetName or v34.targetDisplayName) then v34.targetName or v34.targetDisplayName else if v38 and v39 and v39 ~= "" then v39 else nil;
    local v43, v44 = v27(v37, v41, v42 or "");
    return v2.createElement(l_Sheet_0.Root, {
        preferCenterSheet = true, 
        snapPoints = {
            l_useScaledValue_0(300), 
            0.5
        }, 
        onClose = l_triggerOnClose_0
    }, {
        Header = v2.createElement(l_Sheet_0.Header, {}, {
            TransferRobuxHeader = v2.createElement(v19, {
                titleText = v41.SendRobux or "", 
                robuxBalanceAmount = v31
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
                        size = v30.Size.Size_1200, 
                        tag = "content-inverse-emphasis"
                    })
                }), 
                ErrorMessage = v2.createElement(l_Text_0, {
                    Text = v43, 
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
                        text = v44, 
                        onActivated = l_triggerOnClose_0, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        fillBehavior = l_FillBehavior_0.Fill
                    })
                })
            })
        })
    });
end;