local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Foundation);
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_Checkbox_0 = v3.Checkbox;
local l_Sheet_0 = v3.Sheet;
local l_Button_0 = v3.Button;
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_FillBehavior_0 = v3.Enums.FillBehavior;
local l_useScaledValue_0 = v3.Hooks.useScaledValue;
local v12 = require(l_Parent_0.Generic.UnifiedProductDetails);
local v13 = require(l_Parent_0.Generic.PriceSummary);
local v14 = require(l_Parent_0.Generic.DiscountSummary);
local v15 = require(l_Parent_0.Generic.UnifiedPurchaseModalHeader);
local v16 = require(l_Parent_0.Generic.Hooks.useInitialButtonDisableDelay);
local v17 = require(l_Parent_0.Generic.Hooks.useFocusNavigationRefs);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_1.AppLocales).Localization;
local v20 = require(l_Parent_1.Localization);
local l_LocalizationProvider_0 = v20.LocalizationProvider;
local l_useLocalization_0 = v20.Hooks.useLocalization;
local _ = require(script.Parent.UnifiedProductPurchaseModalTypes);
local v24 = require(l_Parent_0.Enums.UnifiedPurchaseModalTypeEnum);
local v25 = require(l_Parent_0.Generic.Constants);
local l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0 = v25.UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT;
local l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_V2_0 = v25.UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_V2;
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_Parent_0.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local v29 = require(l_Parent_0.Flags.FFlagUnifiedPurchaseModalUiImprovements);
local v30 = require(l_Parent_0.Flags.FFlagFixUnifiedModalsMountedTwice);
local v31 = require(l_Parent_0.Flags.FFlagAddFocusNavigationToUnifiedPurchase);
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local l_FFlagAddUnifiedTestPurchaseDisclaimer_0 = require(l_Parent_0.Parent.SharedFlags).FFlagAddUnifiedTestPurchaseDisclaimer;
local l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 = require(l_Parent_0.Parent.SharedFlags).FFlagEnableDiscountInfoInUnifiedPurchaseModal;
local _ = require(l_Parent_0.ProductPurchase.PricingTypes);
local function v63(v36) --[[ Line: 94 ]] --[[ Name: UnifiedProductPurchaseModal ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), l_FFlagAddUnifiedTestPurchaseDisclaimer_0 (copy), v2 (copy), v16 (copy), v24 (copy), v30 (copy), v31 (copy), v17 (copy), l_Checkbox_0 (copy), l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 (copy), l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0 (copy), l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_V2_0 (copy), l_Sheet_0 (copy), v29 (copy), l_useScaledValue_0 (copy), v15 (copy), l_View_0 (copy), v13 (copy), v12 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), v14 (copy), l_Button_0 (copy), l_FillBehavior_0 (copy), l_ButtonVariant_0 (copy), l_Text_0 (copy)
    local v37 = l_useLocalization_0({
        Buy = "IAPExperience.PurchasePrompt.Action.Buy", 
        BuyItem = "IAPExperience.PurchasePrompt.Title.BuyItem", 
        BuyItemV2 = l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "IAPExperience.PurchasePrompt.Title.BuyItemV2" or nil, 
        BuyExperience = "IAPExperience.PurchasePrompt.Title.BuyExperience", 
        BuyItems = "IAPExperience.PurchasePrompt.Title.BuyItems", 
        BuyAvatar = l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "IAPExperience.PurchasePrompt.Header.BuyAvatar" or nil, 
        TestPurchaseDisclaimer = l_FFlagAddUnifiedTestPurchaseDisclaimer_0 and "IAPExperience.PurchasePrompt.Text.TestPurchase" or nil
    });
    local v38, v39 = v2.useState(v36.postPurchaseActions or {});
    local v40, v41 = v2.useState(v37.BuyItem);
    local v42 = v16(v36.buttons.isDisabled);
    v2.useEffect(function() --[[ Line: 117 ]]
        -- upvalues: v36 (copy), v24 (ref), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (ref), v41 (copy), v37 (copy)
        local l_purchaseModalType_0 = v36.purchaseModalType;
        if l_purchaseModalType_0 == v24.MultiItem then
            if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
                v41(v37.BuyAvatar);
                return;
            else
                v41(v37.BuyItems);
                return;
            end;
        elseif l_purchaseModalType_0 == v24.Experience then
            v41(v37.BuyExperience);
            return;
        elseif l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
            v41(v37.BuyItemV2);
            return;
        else
            v41(v37.BuyItem);
            return;
        end;
    end, {
        v36.purchaseModalType
    });
    local v45 = v2.useCallback(function(v44) --[[ Line: 136 ]]
        -- upvalues: v36 (copy)
        if v44 and v36.onBuyItemButtonMounted then
            v36.onBuyItemButtonMounted(v44);
        end;
    end, {
        v36.onBuyItemButtonMounted
    });
    if v30 then
        v45 = v2.useCallback(function(v46) --[[ Line: 145 ]]
            -- upvalues: v36 (copy), v42 (copy)
            if v46 and v36.onBuyItemButtonMounted and not v42 then
                v36.onBuyItemButtonMounted(v46);
            end;
        end, {
            v36.onBuyItemButtonMounted, 
            v42
        });
    end;
    local v47 = nil;
    local v48 = nil;
    if v31 then
        local v49, v50 = v17(v36.buttons.cancelActivated, v36.onBuyItemButtonMounted);
        v47 = v49;
        v48 = v50;
    end;
    local v51 = v2.useCallback(function() --[[ Line: 159 ]]
        -- upvalues: v38 (copy), v36 (copy)
        if v38 and v36.setPostPurchaseActions then
            v36.setPostPurchaseActions(v38);
        end;
        v36.buttons.buyItemActivated();
    end, {
        v36.buttons.buyItemActivated, 
        v38
    });
    v2.useEffect(function() --[[ Line: 167 ]]
        -- upvalues: v39 (copy), v36 (copy)
        v39(v36.postPurchaseActions or {});
    end, {
        v36.postPurchaseActions
    });
    local v59 = v2.useMemo(function() --[[ Line: 171 ]]
        -- upvalues: v38 (copy), v2 (ref), l_Checkbox_0 (ref), v42 (copy), v39 (copy)
        local v52 = {};
        local l_ipairs_0 = ipairs;
        local v54 = v38 or {};
        for v55, v56 in l_ipairs_0(v54) do
            v52["PostPurchaseActionCheckBox_" .. tostring(v55)] = v2.createElement(l_Checkbox_0, {
                LayoutOrder = v55, 
                size = "XSmall", 
                label = v56.label, 
                isChecked = not v42 and v56.isActionSelected, 
                isDisabled = v42, 
                onActivated = function() --[[ Line: 180 ]] --[[ Name: onActivated ]]
                    -- upvalues: v39 (ref), v55 (copy), v56 (copy)
                    v39(function(v57) --[[ Line: 181 ]]
                        -- upvalues: v55 (ref), v56 (ref)
                        local v58 = table.clone(v57);
                        v58[v55] = {
                            label = v56.label, 
                            isActionSelected = not v56.isActionSelected, 
                            actionKey = v56.actionKey
                        };
                        return v58;
                    end);
                end
            });
        end;
        return v52;
    end, {
        v38, 
        v42
    });
    local v60 = if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then v36.product.itemPrice else nil;
    local v61 = if v60 then v60.priceInRobux else v36.product.itemRobuxCost;
    local l_l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0_0 = l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0;
    if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
        l_l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0_0 = l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_V2_0;
    end;
    return v2.createElement(l_Sheet_0.Root, {
        onClose = v36.buttons.cancelActivated, 
        snapPoints = if v29 then {
            l_useScaledValue_0(l_l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0_0), 
            0.8
        } else {
            0.4, 
            0.8
        }, 
        preferCenterSheet = true, 
        ref = if v42 then nil else if v31 then v47 else nil
    }, {
        Header = v2.createElement(l_Sheet_0.Header, {
            hasCloseAffordance = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v36.hideUserRobuxBalance and true or nil else nil
        }, {
            ModalHeader = v2.createElement(v15, {
                titleText = v40, 
                robuxBalanceAmount = v36.robuxBalanceAmount, 
                hideUserRobuxBalance = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v36.hideUserRobuxBalance else nil
            })
        }), 
        Content = v2.createElement(l_Sheet_0.Content, {
            LayoutOrder = 2
        }, {
            SheetContentContainer = v2.createElement(l_View_0, {
                tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center"
            }, {
                ProductDetailsContainer = v2.createElement(l_View_0, {
                    tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center", 
                    LayoutOrder = 1
                }, {
                    ProductDetails = if v36.purchaseModalType == v24.MultiItem then v2.createElement(v13, {
                        amount = v61, 
                        itemPrice = v60
                    }) else v2.createElement(v12, {
                        isPortrait = false, 
                        itemIcon = v36.product.itemIcon, 
                        itemName = v36.product.itemName, 
                        itemRobuxCost = v61, 
                        itemPrice = v60, 
                        itemDisplayPrice = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then v36.product.itemDisplayPrice else nil, 
                        model = v36.product.model
                    })
                }), 
                DiscountSummary = if v60 then v2.createElement(l_View_0, {
                    tag = "auto-y size-full-0 padding-top-small", 
                    LayoutOrder = 2
                }, {
                    Discount = v2.createElement(v14, {
                        itemPrice = v60
                    })
                }) else nil, 
                PostPurchaseActions = if next(v59) then v2.createElement(l_View_0, {
                    tag = l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "col gap-medium auto-y size-full-0 align-x-start align-y-start padding-top-small" or "col gap-medium auto-y size-full-0 align-x-start align-y-start", 
                    LayoutOrder = 3
                }, {
                    v59
                }) else nil
            })
        }), 
        Actions = v2.createElement(l_Sheet_0.Actions, {
            LayoutOrder = 3
        }, {
            if l_FFlagAddUnifiedTestPurchaseDisclaimer_0 and v36.isTestPurchase then v2.createElement(l_View_0, {
                LayoutOrder = 1, 
                tag = "row wrap auto-xy align-y-center align-x-center size-full-0 gap-medium"
            }, {
                BuyButton = v2.createElement(l_Button_0, {
                    text = v37.Buy, 
                    onActivated = v51, 
                    inputDelay = (not v36.buttons.buyItemEnableInputDelayed or v42) and 0 or 2.5, 
                    isDisabled = v42, 
                    ref = if v31 then v48 else v45, 
                    fillBehavior = l_FillBehavior_0.Fill, 
                    variant = l_ButtonVariant_0.Emphasis
                }), 
                TestPurchaseDisclaimer = if v36.isTestPurchase then v2.createElement(l_Text_0, {
                    Text = v37.TestPurchaseDisclaimer, 
                    tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap", 
                    LayoutOrder = 2
                }) else nil
            }) else v2.createElement(l_Button_0, {
                text = v37.Buy, 
                onActivated = v51, 
                inputDelay = (not v36.buttons.buyItemEnableInputDelayed or v42) and 0 or 2.5, 
                isDisabled = v42, 
                ref = if v31 then v48 else v45, 
                fillBehavior = l_FillBehavior_0.Fill, 
                variant = l_ButtonVariant_0.Emphasis
            })
        })
    });
end;
return function(v64) --[[ Line: 315 ]] --[[ Name: UnifiedProductPurchaseModalContainer ]]
    -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v63 (copy)
    return v2.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        ProductPurchaseModal = v2.createElement(v63, v64)
    });
end;