local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_script_FirstAncestor_0.NetworkRequests.getBalanceRequest);
local v5 = require(l_script_FirstAncestor_0.Hooks.useUserNameFromUserId);
local v6 = require(l_script_FirstAncestor_0.Localization.TransferLocalizationKeys);
local v7 = require(l_script_FirstAncestor_0.Localization.transferLocaleFormat);
local v8 = require(l_Parent_0.Foundation);
local l_Sheet_0 = v8.Sheet;
local l_View_0 = v8.View;
local l_Text_0 = v8.Text;
local l_Button_0 = v8.Button;
local l_Icon_0 = v8.Icon;
local l_ButtonVariant_0 = v8.Enums.ButtonVariant;
local l_FillBehavior_0 = v8.Enums.FillBehavior;
local l_useScaledValue_0 = v8.Hooks.useScaledValue;
local l_useTokens_0 = v8.Hooks.useTokens;
local l_Enums_0 = v8.Enums;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v20 = require(l_script_FirstAncestor_0.Enums.FailureReason);
local v21 = require(l_script_FirstAncestor_0.Flags.GetFIntCurrencyTransferMinAmount);
local v22 = require(l_script_FirstAncestor_0.Flags.GetFIntCurrencyTransferMaxAmount);
local v23 = require(l_script_FirstAncestor_0.Components.Generic.TransferRobuxHeader);
local v24 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
local function v32(v25, v26, v27, v28, v29) --[[ Line: 44 ]] --[[ Name: getErrorMessageAndButton ]]
    -- upvalues: v20 (copy), v7 (copy)
    if not v25 then
        return v26.GenericError, v26.TryAgain;
    else
        local l_OK_0 = v26.OK;
        local v31 = nil;
        if v25 == v20.TransferDailyLimitExceeded then
            v31 = v26.DailyLimitExceeded;
        elseif v25 == v20.TransferMonthlyLimitExceeded then
            v31 = v26.MonthlyLimitExceeded;
        elseif v25 == v20.TransferDisabledForUser then
            v31 = v26.AccountDisabled;
        elseif v25 == v20.ReceiverNotAllowed then
            v31 = v7.substituteUsername(v26.ReceiverNotAllowed, v27 or "");
        elseif v25 == v20.TransferAmountBelowMinimum then
            v31 = v7.substituteMinAmount(v26.TransferAmountBelowMinimum, (tostring(v28)));
            l_OK_0 = v26.TryAgain;
        elseif v25 == v20.TransferAmountExceedsMaximum then
            v31 = v7.substituteMaxAmount(v26.TransferAmountExceedsMaximum, (tostring(v29)));
            l_OK_0 = v26.TryAgain;
        else
            v31 = v26.GenericError;
            l_OK_0 = v26.TryAgain;
        end;
        return v31, l_OK_0;
    end;
end;
return function(_) --[[ Line: 78 ]] --[[ Name: TransferRobuxErrorSheet ]]
    -- upvalues: v24 (copy), l_useTokens_0 (copy), v3 (copy), v20 (copy), v5 (copy), v2 (copy), v4 (copy), l_useLocalization_0 (copy), v6 (copy), v21 (copy), v22 (copy), v32 (copy), l_Sheet_0 (copy), l_useScaledValue_0 (copy), v23 (copy), l_View_0 (copy), l_Icon_0 (copy), l_Enums_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy)
    local v34 = v24();
    local v35 = l_useTokens_0();
    local v36 = v3.useSignalState(v34.getRobuxBalanceAmount) or 0;
    local v37 = v34.getBalanceReceivedFromApi(false);
    local v38 = v34.getErrorTransferModel(false);
    local v39 = v34.getRecipient(false);
    local v40 = v34.getRecipientUserId(false);
    local l_triggerOnClose_0 = v34.triggerOnClose;
    local v42 = if v38 then v38.failureReason else nil;
    local v43 = false;
    if v42 == v20.ReceiverNotAllowed then
        v43 = not v39 and v40 and v40 ~= 0;
    end;
    local v44 = v5(if v43 and v40 and v40 ~= 0 then v40 else nil);
    v2.useEffect(function() --[[ Line: 98 ]]
        -- upvalues: v37 (copy), v4 (ref), v34 (copy)
        if v37 then
            return;
        else
            v4():andThen(function(v45) --[[ Line: 103 ]]
                -- upvalues: v34 (ref)
                v34.setRobuxBalanceAmount(v45);
                v34.setBalanceReceivedFromApi(true);
            end):catch(function() --[[ Line: 107 ]]

            end);
            return;
        end;
    end, {
        v37
    });
    local v46 = l_useLocalization_0(v6.Presets.TransferRobuxErrorSheet);
    local v47 = v21();
    local v48 = v22();
    local v49 = if v39 and (v39.targetName or v39.targetDisplayName) then v39.targetName or v39.targetDisplayName else if v43 and v44 and v44 ~= "" then v44 else nil;
    local v50, v51 = v32(v42, v46, v49 or "", v47, v48);
    return v2.createElement(l_Sheet_0.Root, {
        preferCenterSheet = true, 
        snapPoints = {
            l_useScaledValue_0(300), 
            0.5
        }, 
        onClose = l_triggerOnClose_0
    }, {
        Header = v2.createElement(l_Sheet_0.Header, {}, {
            TransferRobuxHeader = v2.createElement(v23, {
                titleText = v46.SendRobux or "", 
                robuxBalanceAmount = v36
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
                        size = v35.Size.Size_1200, 
                        tag = "content-inverse-emphasis"
                    })
                }), 
                ErrorMessage = v2.createElement(l_Text_0, {
                    Text = v50, 
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
                        text = v51, 
                        onActivated = l_triggerOnClose_0, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        fillBehavior = l_FillBehavior_0.Fill
                    })
                })
            })
        })
    });
end;