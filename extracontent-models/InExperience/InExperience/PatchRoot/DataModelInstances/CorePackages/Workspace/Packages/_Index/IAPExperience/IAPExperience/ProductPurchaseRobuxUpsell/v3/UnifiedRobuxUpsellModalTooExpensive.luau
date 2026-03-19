local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Foundation);
local l_View_0 = v3.View;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_FillBehavior_0 = v3.Enums.FillBehavior;
local l_Button_0 = v3.Button;
local l_Sheet_0 = v3.Sheet;
local l_useScaledValue_0 = v3.Hooks.useScaledValue;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_1.AppLocales).Localization;
local v12 = require(l_Parent_1.Localization);
local l_LocalizationProvider_0 = v12.LocalizationProvider;
local l_useLocalization_0 = v12.Hooks.useLocalization;
local v15 = require(l_Parent_0.Generic.UnifiedProductDetails);
local v16 = require(l_Parent_0.Generic.PriceSummary);
local v17 = require(l_Parent_0.Generic.UnifiedPurchaseModalHeader);
local v18 = require(l_Parent_0.Enums.UnifiedPurchaseModalTypeEnum);
local v19 = require(l_Parent_0.Utility.logger);
local v20 = require(l_Parent_0.Utility.getAppContext);
local l_default_0 = require(l_Parent_1.LoggingProtocol).default;
local l_TooExpensiveUnifiedUpsellShownCounter_0 = require(l_Parent_0.Generic.Events.TooExpensiveUpsellCounter).TooExpensiveUnifiedUpsellShownCounter;
local v23 = require(l_Parent_0.Generic.Hooks.useFocusNavigationRefs);
local v24 = require(l_Parent_0.Generic.Hooks.useInitialButtonDisableDelay);
local l_UNIFIED_ROBUX_UPSELL_MODAL_TOO_EXPENSIVE_MIN_HEIGHT_PIXELS_0 = require(l_Parent_0.Generic.Constants).UNIFIED_ROBUX_UPSELL_MODAL_TOO_EXPENSIVE_MIN_HEIGHT_PIXELS;
local v26 = require(l_Parent_0.Flags.FFlagUnifiedPurchaseModalUiImprovements);
local v27 = require(l_Parent_0.Flags.FFlagAddFocusNavigationToUnifiedPurchase);
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local function v36(v29) --[[ Line: 79 ]] --[[ Name: UnifiedRobuxUpsellModalTooExpensive ]]
    -- upvalues: l_useLocalization_0 (copy), v27 (copy), v23 (copy), v24 (copy), v2 (copy), v19 (copy), v20 (copy), l_default_0 (copy), l_TooExpensiveUnifiedUpsellShownCounter_0 (copy), l_Sheet_0 (copy), v26 (copy), l_useScaledValue_0 (copy), l_UNIFIED_ROBUX_UPSELL_MODAL_TOO_EXPENSIVE_MIN_HEIGHT_PIXELS_0 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), v17 (copy), l_View_0 (copy), v18 (copy), v16 (copy), v15 (copy), l_Button_0 (copy), l_FillBehavior_0 (copy), l_ButtonVariant_0 (copy), v3 (copy)
    local v30 = l_useLocalization_0({
        NeedMoreRobux = "IAPExperience.RobuxUpsell.Text.NeedMoreRobux", 
        ButtonCancel = "IAPExperience.InsufficientRobux.Action.Cancel", 
        BuyRobux = "IAPExperience.InsufficientRobux.Action.BuyRobux"
    });
    local v31 = nil;
    local v32 = nil;
    local v33 = false;
    if v27 then
        local v34, v35 = v23(v29.buttons.cancelPurchaseActivated, nil);
        v31 = v34;
        v32 = v35;
        v33 = v24();
    end;
    v2.useEffect(function() --[[ Line: 92 ]]
        -- upvalues: v19 (ref), v29 (copy), v20 (ref), l_default_0 (ref), l_TooExpensiveUnifiedUpsellShownCounter_0 (ref)
        v19.debug({
            message = "Too Expensive Unified Upsell Modal Shown", 
            screenHeight = v29.screenSize.Y, 
            screenWidth = v29.screenSize.X, 
            portrait = v29.screenSize.X < v29.screenSize.Y, 
            appContext = v20()
        });
        l_default_0:logRobloxTelemetryCounter(l_TooExpensiveUnifiedUpsellShownCounter_0, 1, {
            screenHeight = v29.screenSize.Y, 
            screenWidth = v29.screenSize.X, 
            portrait = v29.screenSize.X < v29.screenSize.Y, 
            appContext = v20()
        });
    end, {});
    return v2.createElement(l_Sheet_0.Root, {
        onClose = v29.buttons.cancelPurchaseActivated, 
        snapPoints = if v26 then {
            l_useScaledValue_0(l_UNIFIED_ROBUX_UPSELL_MODAL_TOO_EXPENSIVE_MIN_HEIGHT_PIXELS_0), 
            0.8
        } else {
            0.4, 
            0.8
        }, 
        preferCenterSheet = true, 
        ref = if v27 then if v33 then nil else v31 else nil
    }, {
        Header = v2.createElement(l_Sheet_0.Header, {
            hasCloseAffordance = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v29.hideUserRobuxBalance and true or nil else nil
        }, {
            ModalHeader = v2.createElement(v17, {
                titleText = v30.NeedMoreRobux, 
                robuxBalanceAmount = v29.balanceAmount, 
                hideUserRobuxBalance = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v29.hideUserRobuxBalance else nil
            })
        }), 
        Content = v2.createElement(l_Sheet_0.Content, {
            LayoutOrder = 2
        }, {
            SheetContentContainer = v2.createElement(l_View_0, {
                tag = "col gap-medium auto-y size-full-0 align-x-center align-y-start padding-bottom-medium"
            }, {
                ProductDetails = if v29.purchaseModalType == v18.MultiItem then v2.createElement(v16, {
                    amount = v29.product.itemRobuxCost
                }) else v2.createElement(v15, {
                    layoutOrder = 1, 
                    isPortrait = v29.screenSize.X < v29.screenSize.Y, 
                    model = v29.product.model, 
                    itemIcon = v29.product.itemIcon, 
                    itemName = v29.product.itemName, 
                    itemRobuxCost = v29.product.itemRobuxCost
                })
            })
        }), 
        Actions = v2.createElement(l_Sheet_0.Actions, {
            LayoutOrder = 3
        }, {
            if v29.isQuest then v2.createElement(l_Button_0, {
                text = v30.ButtonCancel, 
                onActivated = v29.buttons.cancelPurchaseActivated, 
                fillBehavior = l_FillBehavior_0.Fill, 
                variant = l_ButtonVariant_0.Standard
            }) else v2.createElement(l_Button_0, {
                text = v30.BuyRobux, 
                onActivated = v29.buttons.buyItemActivated, 
                fillBehavior = l_FillBehavior_0.Fill, 
                variant = l_ButtonVariant_0.Emphasis, 
                icon = v3.Enums.IconName.ArrowUpRightFromSquare, 
                isDisabled = if v27 then v33 else false, 
                ref = if v27 then v32 else nil
            })
        })
    });
end;
return function(v37) --[[ Line: 173 ]] --[[ Name: UnifiedRobuxUpsellModalTooExpensiveContainer ]]
    -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v36 (copy)
    return v2.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        RobuxUpsellModalTooExpensive = v2.createElement(v36, v37)
    });
end;