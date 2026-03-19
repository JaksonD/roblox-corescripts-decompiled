local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Foundation);
local l_ButtonVariant_0 = require(l_Parent_1.Foundation).Enums.ButtonVariant;
local l_FillBehavior_0 = require(l_Parent_1.Foundation).Enums.FillBehavior;
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_Icon_0 = v3.Icon;
local l_Sheet_0 = v3.Sheet;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useScaledValue_0 = v3.Hooks.useScaledValue;
local v12 = require(l_Parent_1.LoggingProtocol);
local l_UnifiedProductPurchaseCompletionModalShownCounter_0 = require(l_Parent_0.Generic.Events.UnifiedPurchaseCompletionCounter).UnifiedProductPurchaseCompletionModalShownCounter;
local l_useLocalization_0 = require(l_Parent_1.Localization).Hooks.useLocalization;
local v15 = require(l_Parent_0.Utility.formatTextWithParams);
local v16 = require(l_Parent_0.Generic.Hooks.useFocusNavigationRefs);
local v17 = require(l_Parent_0.Generic.Hooks.useInitialButtonDisableDelay);
local l_UNIFIED_PURCHASE_COMPLETION_MODAL_MIN_HEIGHT_PIXELS_0 = require(l_Parent_0.Generic.Constants).UNIFIED_PURCHASE_COMPLETION_MODAL_MIN_HEIGHT_PIXELS;
local v19 = require(l_Parent_0.Flags.FFlagUnifiedPurchaseModalUiImprovements);
local v20 = require(l_Parent_0.Flags.FFlagAddFocusNavigationToUnifiedPurchase);
return function(v21) --[[ Line: 58 ]] --[[ Name: UnifiedPurchaseCompletionModal ]]
    -- upvalues: l_useLocalization_0 (copy), v20 (copy), v16 (copy), v17 (copy), l_useTokens_0 (copy), v2 (copy), v3 (copy), v12 (copy), l_UnifiedProductPurchaseCompletionModalShownCounter_0 (copy), v15 (copy), l_Sheet_0 (copy), v19 (copy), l_useScaledValue_0 (copy), l_UNIFIED_PURCHASE_COMPLETION_MODAL_MIN_HEIGHT_PIXELS_0 (copy), l_Text_0 (copy), l_View_0 (copy), l_Icon_0 (copy), l_FillBehavior_0 (copy), l_ButtonVariant_0 (copy)
    local v22 = l_useLocalization_0({
        PurchaseCompleteTitle = "IAPExperience.PurchasePrompt.Title.PurchaseCompleted", 
        PurchaseCompleteBody = "IAPExperience.PurchasePrompt.Body.PurchaseCompleted", 
        ErrorTitle = "CoreScripts.PremiumModal.Title.Error", 
        GenericErrorBody = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName", 
        OkButtonText = "CoreScripts.PurchasePrompt.Button.OK", 
        MultiItemPurchaseCompleteBody = "IAPExperience.PurchasePrompt.Body.PurchaseItemsSuccess"
    });
    local v23 = nil;
    local v24 = nil;
    local v25 = false;
    if v20 then
        local v26, v27 = v16(v21.buttons.onClose, nil);
        v23 = v26;
        v24 = v27;
        v25 = v17();
    end;
    local v28 = l_useTokens_0();
    local v29, v30 = v2.useState(v3.Enums.IconName.CircleCheck);
    v2.useEffect(function() --[[ Line: 77 ]]
        -- upvalues: v12 (ref), l_UnifiedProductPurchaseCompletionModalShownCounter_0 (ref)
        v12.default:logRobloxTelemetryCounter(l_UnifiedProductPurchaseCompletionModalShownCounter_0, 1, {});
    end, {});
    local v31 = v2.useMemo(function() --[[ Line: 81 ]]
        -- upvalues: v21 (copy), v22 (copy)
        if v21.title then
            return v21.title;
        elseif v21.isError then
            return v22.ErrorTitle;
        else
            return v22.PurchaseCompleteTitle;
        end;
    end, {
        v21.title, 
        v21.isError
    });
    local v32 = v2.useMemo(function() --[[ Line: 91 ]]
        -- upvalues: v21 (copy), v22 (copy), v15 (ref)
        if v21.bodyText then
            return v21.bodyText;
        elseif v21.isError then
            return v22.GenericErrorBody;
        elseif v21.isMultiItem then
            return v22.MultiItemPurchaseCompleteBody;
        else
            return v15(v22.PurchaseCompleteBody, {
                ITEM_NAME = v21.itemName
            });
        end;
    end, {
        v21.bodyText, 
        v21.isError, 
        v21.isMultiItem, 
        v21.itemName
    });
    local v33 = nil;
    v33 = if v21.buttons and v21.buttons.text then v21.buttons.text else v22.OkButtonText;
    v2.useEffect(function() --[[ Line: 112 ]]
        -- upvalues: v21 (copy), v30 (copy), v3 (ref)
        if v21.isError then
            v30(v3.Enums.IconName.TriangleExclamation);
            return;
        else
            v30(v3.Enums.IconName.CircleCheck);
            return;
        end;
    end, {
        v21.isError
    });
    return v2.createElement(l_Sheet_0.Root, {
        onClose = if v21.buttons.onClose then v21.buttons.onClose else v21.buttons.onActivated, 
        snapPoints = if v19 then {
            l_useScaledValue_0(l_UNIFIED_PURCHASE_COMPLETION_MODAL_MIN_HEIGHT_PIXELS_0), 
            0.8
        } else {
            0.4, 
            0.8
        }, 
        preferCenterSheet = true, 
        ref = if v20 then if v25 then nil else v23 else nil
    }, {
        Header = v2.createElement(l_Sheet_0.Header, {}, {
            Title = v2.createElement(l_Text_0, {
                Text = v31, 
                tag = "auto-xy text-heading-small content-default text-align-x-left"
            })
        }), 
        Content = v2.createElement(l_Sheet_0.Content, {
            LayoutOrder = 2
        }, {
            Body = v2.createElement(l_View_0, {
                tag = v19 and "col gap-large auto-y size-full-0 align-x-center align-y-center padding-top-small" or "col gap-medium auto-y size-full-0 align-x-center align-y-center", 
                LayoutOrder = 1
            }, {
                Icon = v2.createElement(l_Icon_0, {
                    name = v29, 
                    size = v28.Size.Size_1200, 
                    tag = "auto-xy"
                }), 
                Message = v2.createElement(l_Text_0, {
                    Text = v32, 
                    tag = "auto-xy text-body content-default text-align-x-left text-body-medium text-wrap"
                })
            })
        }), 
        Actions = v2.createElement(l_Sheet_0.Actions, {
            LayoutOrder = 3
        }, {
            v2.createElement(v3.Button, {
                text = v33, 
                onActivated = v21.buttons.onActivated, 
                fillBehavior = l_FillBehavior_0.Fill, 
                variant = l_ButtonVariant_0.Emphasis, 
                ref = if v20 then v24 else nil, 
                isDisabled = v25
            })
        })
    });
end;