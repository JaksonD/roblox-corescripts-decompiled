local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v6 = require(l_script_FirstAncestor_0.Utils.WebViewServiceWrapper);
local v7 = require(l_script_FirstAncestor_0.Constants.PurchaseRobuxConstants);
local v8 = require(l_script_FirstAncestor_0.Enums.TransferOrigination);
local v9 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v10 = require(l_script_FirstAncestor_0.Actions.Send.setTransferPromptState);
local v11 = require(l_Parent_0.Foundation);
local l_Sheet_0 = v11.Sheet;
local l_View_0 = v11.View;
local l_Text_0 = v11.Text;
local l_Button_0 = v11.Button;
local l_Icon_0 = v11.Icon;
local l_ButtonVariant_0 = v11.Enums.ButtonVariant;
local l_FillBehavior_0 = v11.Enums.FillBehavior;
local l_useScaledValue_0 = v11.Hooks.useScaledValue;
local l_useTokens_0 = v11.Hooks.useTokens;
local l_Enums_0 = v11.Enums;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v23 = require(l_script_FirstAncestor_0.Components.Generic.TransferRobuxHeader);
local v24 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
return function(_) --[[ Line: 41 ]] --[[ Name: InsufficientBalanceSheet ]]
    -- upvalues: v24 (copy), l_useDispatch_0 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), v10 (copy), v9 (copy), v8 (copy), v6 (copy), v7 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v2 (copy), l_Sheet_0 (copy), l_useScaledValue_0 (copy), v23 (copy), l_View_0 (copy), l_Icon_0 (copy), l_Enums_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy)
    local v26 = v24();
    local v27 = l_useDispatch_0();
    local v28 = l_useTokens_0();
    local v29 = l_useLocalization_0({
        SendRobux = "Features.Transfers.RobuxTransfer.Heading.SendRobux", 
        InsufficientBalance = "Features.Transfers.Error.InsufficientBalance", 
        BuyRobux = "Features.Transfers.Action.BuyRobux"
    });
    local v30 = v26.getRobuxBalanceAmount(false);
    local function v31() --[[ Line: 52 ]] --[[ Name: goBackToInputAndOpenBuyRobux ]]
        -- upvalues: v10 (ref), v26 (copy), v9 (ref), v8 (ref), v6 (ref), v7 (ref), v27 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v10(v26, v9.TransferInput);
        if v26.getTransferOrigination(false) == v8.InExperience then
            v6.new({
                url = v7.PURCHASE_ROBUX_URL, 
                title = v7.PURCHASE_ROBUX_WEBVIEW_TITLE
            }):open();
            return;
        else
            v27(l_NavigateDown_0({
                name = l_AppPage_0.PurchaseRobux
            }));
            return;
        end;
    end;
    local function v32() --[[ Line: 68 ]] --[[ Name: handleClose ]]
        -- upvalues: v10 (ref), v26 (copy), v9 (ref)
        v10(v26, v9.TransferInput);
    end;
    return v2.createElement(l_Sheet_0.Root, {
        preferCenterSheet = true, 
        snapPoints = {
            l_useScaledValue_0(300), 
            0.5
        }, 
        onClose = v32
    }, {
        Header = v2.createElement(l_Sheet_0.Header, {}, {
            TransferRobuxHeader = v2.createElement(v23, {
                titleText = v29.SendRobux, 
                robuxBalanceAmount = v30
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
                        size = v28.Size.Size_1200, 
                        tag = "content-inverse-emphasis"
                    })
                }), 
                ErrorMessage = v2.createElement(l_Text_0, {
                    Text = v29.InsufficientBalance or "", 
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
                        text = v29.BuyRobux or "Buy", 
                        onActivated = v31, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        fillBehavior = l_FillBehavior_0.Fill
                    })
                })
            })
        })
    });
end;