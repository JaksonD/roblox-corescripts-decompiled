local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Foundation);
local l_View_0 = v3.View;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_Dialog_0 = v3.Dialog;
local l_DialogSize_0 = v3.Enums.DialogSize;
local l_Orientation_0 = v3.Enums.Orientation;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_1.AppLocales).Localization;
local v11 = require(l_Parent_1.Localization);
local l_LocalizationProvider_0 = v11.LocalizationProvider;
local l_useLocalization_0 = v11.Hooks.useLocalization;
local v14 = require(l_Parent_0.Generic.UnifiedProductDetails);
local v15 = require(l_Parent_0.Generic.PriceSummary);
local v16 = require(l_Parent_0.Enums.UnifiedPurchaseModalTypeEnum);
local v17 = require(l_Parent_0.Utility.logger);
local v18 = require(l_Parent_0.Utility.getAppContext);
local l_default_0 = require(l_Parent_1.LoggingProtocol).default;
local l_TooExpensiveUnifiedUpsellShownCounter_0 = require(l_Parent_0.Generic.Events.TooExpensiveUpsellCounter).TooExpensiveUnifiedUpsellShownCounter;
local v21 = require(l_Parent_0.Generic.Hooks.useFocusNavigationRefs);
local function v28(v22) --[[ Line: 63 ]] --[[ Name: UnifiedRobuxUpsellModalTooExpensiveV2 ]]
    -- upvalues: l_useLocalization_0 (copy), v21 (copy), v2 (copy), v17 (copy), v18 (copy), l_default_0 (copy), l_TooExpensiveUnifiedUpsellShownCounter_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_View_0 (copy), v16 (copy), v15 (copy), v14 (copy), l_Orientation_0 (copy), l_ButtonVariant_0 (copy), v3 (copy)
    local v23 = l_useLocalization_0({
        NeedMoreRobux = "IAPExperience.RobuxUpsell.Text.NeedMoreRobux", 
        ButtonCancel = "IAPExperience.InsufficientRobux.Action.Cancel", 
        BuyRobux = "IAPExperience.InsufficientRobux.Action.BuyRobux"
    });
    local v24 = nil;
    local v25 = nil;
    local v26, v27 = v21(v22.buttons.cancelPurchaseActivated, nil);
    v24 = v26;
    v25 = v27;
    v2.useEffect(function() --[[ Line: 73 ]]
        -- upvalues: v17 (ref), v22 (copy), v18 (ref), l_default_0 (ref), l_TooExpensiveUnifiedUpsellShownCounter_0 (ref)
        v17.debug({
            message = "Too Expensive Unified Upsell Modal Shown (Dialog)", 
            screenHeight = v22.screenSize.Y, 
            screenWidth = v22.screenSize.X, 
            portrait = v22.screenSize.X < v22.screenSize.Y, 
            appContext = v18()
        });
        l_default_0:logRobloxTelemetryCounter(l_TooExpensiveUnifiedUpsellShownCounter_0, 1, {
            screenHeight = v22.screenSize.Y, 
            screenWidth = v22.screenSize.X, 
            portrait = v22.screenSize.X < v22.screenSize.Y, 
            appContext = v18()
        });
    end, {});
    return v2.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Medium, 
        onClose = v22.buttons.cancelPurchaseActivated, 
        ref = v24, 
        disablePortal = false
    }, {
        DialogTitle = v2.createElement(l_Dialog_0.Title, {
            text = v23.NeedMoreRobux
        }), 
        DialogContent = v2.createElement(l_Dialog_0.Content, nil, {
            ContentView = v2.createElement(l_View_0, {
                tag = "col gap-medium auto-y size-full-0 align-x-center align-y-start padding-bottom-medium"
            }, {
                ProductDetails = if v22.purchaseModalType == v16.MultiItem then v2.createElement(v15, {
                    amount = v22.product.itemRobuxCost
                }) else v2.createElement(v14, {
                    layoutOrder = 1, 
                    isPortrait = v22.screenSize.X < v22.screenSize.Y, 
                    model = v22.product.model, 
                    itemIcon = v22.product.itemIcon, 
                    itemName = v22.product.itemName, 
                    itemRobuxCost = v22.product.itemRobuxCost
                })
            })
        }), 
        DialogActions = v2.createElement(l_Dialog_0.Actions, {
            LayoutOrder = 3, 
            orientation = l_Orientation_0.Horizontal, 
            actions = {
                {
                    text = v23.BuyRobux, 
                    onActivated = v22.buttons.buyItemActivated, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    icon = v3.Enums.IconName.ArrowUpRightFromSquare, 
                    isDisabled = false, 
                    ref = v25
                }
            }
        })
    });
end;
return function(v29) --[[ Line: 133 ]] --[[ Name: UnifiedRobuxUpsellModalTooExpensiveV2Container ]]
    -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v28 (copy)
    return v2.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        RobuxUpsellModalTooExpensiveV2 = v2.createElement(v28, v29)
    });
end;