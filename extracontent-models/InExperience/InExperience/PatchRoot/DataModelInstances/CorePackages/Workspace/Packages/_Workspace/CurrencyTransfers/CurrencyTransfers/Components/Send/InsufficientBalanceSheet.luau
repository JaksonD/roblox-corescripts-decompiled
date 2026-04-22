local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Localization.TransferLocalizationKeys);
local v4 = require(l_script_FirstAncestor_0.Localization.transferLocaleFormat);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v6 = require(l_script_FirstAncestor_0.Utils.WebViewServiceWrapper);
local v7 = require(l_script_FirstAncestor_0.Constants.PurchaseRobuxConstants);
local v8 = require(l_script_FirstAncestor_0.Enums.TransferOrigination);
local v9 = require(l_script_FirstAncestor_0.NetworkRequests.getBalanceRequest);
local v10 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v11 = require(l_script_FirstAncestor_0.Actions.Send.setTransferPromptState);
local v12 = require(l_Parent_0.Foundation);
local l_Sheet_0 = v12.Sheet;
local l_View_0 = v12.View;
local l_Text_0 = v12.Text;
local l_Button_0 = v12.Button;
local l_Icon_0 = v12.Icon;
local l_ButtonVariant_0 = v12.Enums.ButtonVariant;
local l_FillBehavior_0 = v12.Enums.FillBehavior;
local l_useScaledValue_0 = v12.Hooks.useScaledValue;
local l_useTokens_0 = v12.Hooks.useTokens;
local l_Enums_0 = v12.Enums;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v24 = require(l_script_FirstAncestor_0.Components.Generic.TransferRobuxHeader);
local v25 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
local v26 = require(l_script_FirstAncestor_0.Utils.formatNumber);
return function(_) --[[ Line: 42 ]] --[[ Name: InsufficientBalanceSheet ]]
    -- upvalues: v25 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), v3 (copy), v26 (copy), l_LocalizationService_0 (copy), v2 (copy), v4 (copy), v7 (copy), v6 (copy), v8 (copy), v11 (copy), v10 (copy), v9 (copy), l_Sheet_0 (copy), l_useScaledValue_0 (copy), v24 (copy), l_View_0 (copy), l_Icon_0 (copy), l_Enums_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy)
    local v28 = v25();
    local v29 = l_useTokens_0();
    local v30 = l_useLocalization_0(v3.Presets.InsufficientBalanceSheet);
    local v31 = v28.getRobuxBalanceAmount(false);
    local v32 = math.max(0, (v28.getSelectedAmount(false) or 0) - v31);
    local v33 = v26(l_LocalizationService_0.RobloxLocaleId, v32);
    local v34 = v2.useMemo(function() --[[ Line: 50 ]]
        -- upvalues: v4 (ref), v30 (copy), v33 (copy)
        return v4.substituteAmount(v30.InsufficientBalance or "", (tostring(v33)));
    end, {
        v33, 
        v30.InsufficientBalance
    });
    local function v41() --[[ Line: 54 ]] --[[ Name: goBackToInputAndOpenBuyRobux ]]
        -- upvalues: v28 (copy), v7 (ref), v6 (ref), v8 (ref), v11 (ref), v10 (ref), v9 (ref)
        local v35 = v28.getTransferOrigination(false);
        local v36 = v7.getPurchaseRobuxUrl();
        local l_PURCHASE_ROBUX_WEBVIEW_TITLE_0 = v7.PURCHASE_ROBUX_WEBVIEW_TITLE;
        v6.new({
            url = v36, 
            title = l_PURCHASE_ROBUX_WEBVIEW_TITLE_0, 
            closeCallback = function() --[[ Line: 61 ]] --[[ Name: closeCallback ]]
                -- upvalues: v35 (copy), v8 (ref), v11 (ref), v28 (ref), v10 (ref), v9 (ref)
                local function _() --[[ Line: 62 ]] --[[ Name: applyPromptAfterBalance ]]
                    -- upvalues: v35 (ref), v8 (ref), v11 (ref), v28 (ref), v10 (ref)
                    if v35 == v8.InExperience then
                        v11(v28, v10.TransferConfirm);
                        return;
                    else
                        v11(v28, v10.TransferInput);
                        return;
                    end;
                end;
                v9():andThen(function(v39) --[[ Line: 70 ]]
                    -- upvalues: v28 (ref), v35 (ref), v8 (ref), v11 (ref), v10 (ref)
                    v28.setRobuxBalanceAmount(v39);
                    v28.setBalanceReceivedFromApi(true);
                    if v35 == v8.InExperience then
                        v11(v28, v10.TransferConfirm);
                        return;
                    else
                        v11(v28, v10.TransferInput);
                        return;
                    end;
                end):catch(function(_) --[[ Line: 75 ]]
                    -- upvalues: v35 (ref), v8 (ref), v11 (ref), v28 (ref), v10 (ref)
                    if v35 == v8.InExperience then
                        v11(v28, v10.TransferConfirm);
                        return;
                    else
                        v11(v28, v10.TransferInput);
                        return;
                    end;
                end);
            end
        }):open();
    end;
    local function v42() --[[ Line: 83 ]] --[[ Name: handleClose ]]
        -- upvalues: v28 (copy), v8 (ref), v11 (ref), v10 (ref)
        if v28.getTransferOrigination(false) == v8.InExperience then
            v28.triggerOnClose();
            return;
        else
            v11(v28, v10.TransferInput);
            return;
        end;
    end;
    return v2.createElement(l_Sheet_0.Root, {
        preferCenterSheet = true, 
        snapPoints = {
            l_useScaledValue_0(300), 
            0.5
        }, 
        onClose = v42
    }, {
        Header = v2.createElement(l_Sheet_0.Header, {}, {
            TransferRobuxHeader = v2.createElement(v24, {
                titleText = v30.SendRobux, 
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
                        size = v29.Size.Size_1200, 
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
                        text = v30.BuyRobux or "Buy", 
                        onActivated = v41, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        fillBehavior = l_FillBehavior_0.Fill
                    })
                })
            })
        })
    });
end;