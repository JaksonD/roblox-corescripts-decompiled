local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v7 = require(l_script_FirstAncestor_0.Utils.WebViewServiceWrapper);
local v8 = require(l_script_FirstAncestor_0.Constants.PurchaseRobuxConstants);
local v9 = require(l_script_FirstAncestor_0.Enums.TransferOrigination);
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
return function(_) --[[ Line: 43 ]] --[[ Name: InsufficientBalanceSheet ]]
    -- upvalues: v25 (copy), l_useDispatch_0 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), v26 (copy), l_LocalizationService_0 (copy), v2 (copy), v11 (copy), v10 (copy), v9 (copy), v7 (copy), v8 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_Sheet_0 (copy), l_useScaledValue_0 (copy), v24 (copy), l_View_0 (copy), l_Icon_0 (copy), l_Enums_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy)
    local v28 = v25();
    local v29 = l_useDispatch_0();
    local v30 = l_useTokens_0();
    local v31 = l_useLocalization_0({
        SendRobux = "Features.Transfers.RobuxTransfer.Heading.SendRobux", 
        InsufficientBalance = "Features.Transfers.Error.InsufficientBalance", 
        BuyRobux = "Features.Transfers.Action.BuyRobux"
    });
    local v32 = v28.getRobuxBalanceAmount(false);
    local v33 = math.max(0, (v28.getSelectedAmount(false) or 0) - v32);
    local v34 = v26(l_LocalizationService_0.RobloxLocaleId, v33);
    local v35 = v2.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: v31 (copy), v34 (copy)
        return string.gsub(v31.InsufficientBalance or "", "{amount}", (tostring(v34)));
    end, {
        v34, 
        v31.InsufficientBalance
    });
    local function v36() --[[ Line: 60 ]] --[[ Name: goBackToInputAndOpenBuyRobux ]]
        -- upvalues: v11 (ref), v28 (copy), v10 (ref), v9 (ref), v7 (ref), v8 (ref), v29 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v11(v28, v10.TransferInput);
        if v28.getTransferOrigination(false) == v9.InExperience then
            v7.new({
                url = v8.PURCHASE_ROBUX_URL, 
                title = v8.PURCHASE_ROBUX_WEBVIEW_TITLE
            }):open();
            return;
        else
            v29(l_NavigateDown_0({
                name = l_AppPage_0.PurchaseRobux
            }));
            return;
        end;
    end;
    local function v37() --[[ Line: 76 ]] --[[ Name: handleClose ]]
        -- upvalues: v11 (ref), v28 (copy), v10 (ref)
        v11(v28, v10.TransferInput);
    end;
    return v2.createElement(l_Sheet_0.Root, {
        preferCenterSheet = true, 
        snapPoints = {
            l_useScaledValue_0(300), 
            0.5
        }, 
        onClose = v37
    }, {
        Header = v2.createElement(l_Sheet_0.Header, {}, {
            TransferRobuxHeader = v2.createElement(v24, {
                titleText = v31.SendRobux, 
                robuxBalanceAmount = v32
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
                    Text = v35, 
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
                        text = v31.BuyRobux or "Buy", 
                        onActivated = v36, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        fillBehavior = l_FillBehavior_0.Fill
                    })
                })
            })
        })
    });
end;