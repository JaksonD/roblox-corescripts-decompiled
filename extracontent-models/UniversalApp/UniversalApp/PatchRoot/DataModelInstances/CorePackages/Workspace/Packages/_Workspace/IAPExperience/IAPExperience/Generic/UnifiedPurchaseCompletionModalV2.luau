local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Foundation);
local l_ButtonVariant_0 = require(l_Parent_1.Foundation).Enums.ButtonVariant;
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_Icon_0 = v3.Icon;
local l_Dialog_0 = v3.Dialog;
local l_DialogSize_0 = v3.Enums.DialogSize;
local l_Orientation_0 = v3.Enums.Orientation;
local l_useTokens_0 = v3.Hooks.useTokens;
local v12 = require(l_Parent_1.LoggingProtocol);
local l_UnifiedProductPurchaseCompletionModalShownCounter_0 = require(l_Parent_0.Generic.Events.UnifiedPurchaseCompletionCounter).UnifiedProductPurchaseCompletionModalShownCounter;
local l_useLocalization_0 = require(l_Parent_1.Localization).Hooks.useLocalization;
local v15 = require(l_Parent_0.Utility.formatTextWithParams);
local v16 = require(l_Parent_0.Generic.Hooks.useFocusNavigationRefs);
return function(v17) --[[ Line: 47 ]] --[[ Name: UnifiedPurchaseCompletionModalV2 ]]
    -- upvalues: l_useLocalization_0 (copy), v16 (copy), l_useTokens_0 (copy), v2 (copy), v3 (copy), v12 (copy), l_UnifiedProductPurchaseCompletionModalShownCounter_0 (copy), v15 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_View_0 (copy), l_Icon_0 (copy), l_Text_0 (copy), l_Orientation_0 (copy), l_ButtonVariant_0 (copy)
    local v18 = l_useLocalization_0({
        PurchaseCompleteTitle = "IAPExperience.PurchasePrompt.Title.PurchaseCompleted", 
        PurchaseCompleteBody = "IAPExperience.PurchasePrompt.Body.PurchaseCompleted", 
        ErrorTitle = "CoreScripts.PremiumModal.Title.Error", 
        GenericErrorBody = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName", 
        OkButtonText = "CoreScripts.PurchasePrompt.Button.OK", 
        MultiItemPurchaseCompleteBody = "IAPExperience.PurchasePrompt.Body.PurchaseItemsSuccess"
    });
    local v19 = nil;
    local v20 = nil;
    local v21, v22 = v16(v17.buttons.onClose or v17.buttons.onActivated, nil);
    v19 = v21;
    v20 = v22;
    v21 = l_useTokens_0();
    local v23;
    v22, v23 = v2.useState(v3.Enums.IconName.CircleCheck);
    v2.useEffect(function() --[[ Line: 61 ]]
        -- upvalues: v12 (ref), l_UnifiedProductPurchaseCompletionModalShownCounter_0 (ref)
        v12.default:logRobloxTelemetryCounter(l_UnifiedProductPurchaseCompletionModalShownCounter_0, 1, {});
    end, {});
    local v24 = v2.useMemo(function() --[[ Line: 65 ]]
        -- upvalues: v17 (copy), v18 (copy)
        if v17.title then
            return v17.title;
        elseif v17.isError then
            return v18.ErrorTitle;
        else
            return v18.PurchaseCompleteTitle;
        end;
    end, {
        v17.title, 
        v17.isError
    });
    local v25 = v2.useMemo(function() --[[ Line: 75 ]]
        -- upvalues: v17 (copy), v18 (copy), v15 (ref)
        if v17.bodyText then
            return v17.bodyText;
        elseif v17.isError then
            return v18.GenericErrorBody;
        elseif v17.isMultiItem then
            return v18.MultiItemPurchaseCompleteBody;
        else
            return v15(v18.PurchaseCompleteBody, {
                ITEM_NAME = v17.itemName or ""
            });
        end;
    end, {
        v17.bodyText, 
        v17.isError, 
        v17.isMultiItem, 
        v17.itemName
    });
    v2.useEffect(function() --[[ Line: 89 ]]
        -- upvalues: v17 (copy), v23 (copy), v3 (ref)
        if v17.isError then
            v23(v3.Enums.IconName.TriangleExclamation);
            return;
        else
            v23(v3.Enums.IconName.CircleCheck);
            return;
        end;
    end, {
        v17.isError
    });
    return v2.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Medium, 
        closeOnClickOutside = true, 
        onClose = if v17.buttons.onClose then v17.buttons.onClose else v17.buttons.onActivated, 
        ref = v19, 
        disablePortal = false
    }, {
        DialogTitle = v2.createElement(l_Dialog_0.Title, {
            text = v24
        }), 
        DialogContent = v2.createElement(l_Dialog_0.Content, nil, {
            Body = v2.createElement(l_View_0, {
                tag = "col gap-large auto-y size-full-0 align-x-center align-y-center padding-top-small"
            }, {
                DialogIcon = v2.createElement(l_Icon_0, {
                    name = v22, 
                    size = v21.Size.Size_1200, 
                    tag = "auto-xy"
                }), 
                Message = v2.createElement(l_Text_0, {
                    Text = v25, 
                    tag = "auto-xy text-body content-default text-align-x-left text-body-medium text-wrap"
                })
            })
        }), 
        DialogActions = v2.createElement(l_Dialog_0.Actions, {
            orientation = l_Orientation_0.Horizontal, 
            actions = {
                {
                    text = if v17.buttons and v17.buttons.text then v17.buttons.text else v18.OkButtonText, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = v17.buttons.onActivated, 
                    ref = v20, 
                    isDisabled = false
                }
            }
        })
    });
end;