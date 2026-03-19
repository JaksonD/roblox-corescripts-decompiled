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
local l_BlackbirdUpsellBanner_0 = require(l_Parent_1.RobloxSubscriptionPurchaseApp).Components.BlackbirdUpsellBanner;
local l_FFlagUnifiedPurchaseModalLayoutRefactor_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseModalLayoutRefactor;
local function v67(v38) --[[ Line: 106 ]] --[[ Name: UnifiedProductPurchaseModal ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), l_FFlagAddUnifiedTestPurchaseDisclaimer_0 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), v24 (copy), v2 (copy), v16 (copy), v30 (copy), v31 (copy), v17 (copy), l_Checkbox_0 (copy), l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 (copy), l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0 (copy), l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_V2_0 (copy), l_Sheet_0 (copy), v29 (copy), l_useScaledValue_0 (copy), v15 (copy), l_View_0 (copy), v13 (copy), v12 (copy), v14 (copy), l_FFlagUnifiedPurchaseModalLayoutRefactor_0 (copy), l_Button_0 (copy), l_FillBehavior_0 (copy), l_ButtonVariant_0 (copy), l_BlackbirdUpsellBanner_0 (copy), l_Text_0 (copy)
    local v39 = l_useLocalization_0({
        Buy = "IAPExperience.PurchasePrompt.Action.Buy", 
        Subscribe = "Feature.Subscription.Action.Subscribe", 
        BuyItem = "IAPExperience.PurchasePrompt.Title.BuyItem", 
        BuyItemV2 = l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "IAPExperience.PurchasePrompt.Title.BuyItemV2" or nil, 
        GetSubscription = "IAPExperience.SubscriptionPurchasePrompt.Label.GetSubscription", 
        BuyExperience = "IAPExperience.PurchasePrompt.Title.BuyExperience", 
        BuyItems = "IAPExperience.PurchasePrompt.Title.BuyItems", 
        BuyAvatar = l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "IAPExperience.PurchasePrompt.Header.BuyAvatar" or nil, 
        TestPurchaseDisclaimer = l_FFlagAddUnifiedTestPurchaseDisclaimer_0 and "IAPExperience.PurchasePrompt.Text.TestPurchase" or nil, 
        PerMonth = l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and "Feature.Subscription.Text.PerMonth" or nil
    });
    local v40 = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v38.purchaseModalType == v24.DeveloperSubscription then v39.PerMonth else nil;
    local v41, v42 = v2.useState(v38.postPurchaseActions or {});
    local v43, v44 = v2.useState(v39.BuyItem);
    local v45 = v16(v38.buttons.isDisabled);
    v2.useEffect(function() --[[ Line: 137 ]]
        -- upvalues: v38 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (ref), v24 (ref), v44 (copy), v39 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (ref)
        local l_purchaseModalType_0 = v38.purchaseModalType;
        if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and l_purchaseModalType_0 == v24.DeveloperSubscription then
            v44(v39.GetSubscription);
            return;
        elseif l_purchaseModalType_0 == v24.MultiItem then
            if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
                v44(v39.BuyAvatar);
                return;
            else
                v44(v39.BuyItems);
                return;
            end;
        elseif l_purchaseModalType_0 == v24.Experience then
            v44(v39.BuyExperience);
            return;
        elseif l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
            v44(v39.BuyItemV2);
            return;
        else
            v44(v39.BuyItem);
            return;
        end;
    end, {
        v38.purchaseModalType
    });
    local v48 = v2.useCallback(function(v47) --[[ Line: 161 ]]
        -- upvalues: v38 (copy)
        if v47 and v38.onBuyItemButtonMounted then
            v38.onBuyItemButtonMounted(v47);
        end;
    end, {
        v38.onBuyItemButtonMounted
    });
    if v30 then
        v48 = v2.useCallback(function(v49) --[[ Line: 170 ]]
            -- upvalues: v38 (copy), v45 (copy)
            if v49 and v38.onBuyItemButtonMounted and not v45 then
                v38.onBuyItemButtonMounted(v49);
            end;
        end, {
            v38.onBuyItemButtonMounted, 
            v45
        });
    end;
    local v50 = nil;
    local v51 = nil;
    if v31 then
        local v52, v53 = v17(v38.buttons.cancelActivated, v38.onBuyItemButtonMounted);
        v50 = v52;
        v51 = v53;
    end;
    local v54 = v2.useCallback(function() --[[ Line: 184 ]]
        -- upvalues: v41 (copy), v38 (copy)
        if v41 and v38.setPostPurchaseActions then
            v38.setPostPurchaseActions(v41);
        end;
        v38.buttons.buyItemActivated();
    end, {
        v38.buttons.buyItemActivated, 
        v41
    });
    v2.useEffect(function() --[[ Line: 192 ]]
        -- upvalues: v42 (copy), v38 (copy)
        v42(v38.postPurchaseActions or {});
    end, {
        v38.postPurchaseActions
    });
    local v55 = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v38.purchaseModalType == v24.DeveloperSubscription then v39.Subscribe else v39.Buy;
    local v63 = v2.useMemo(function() --[[ Line: 201 ]]
        -- upvalues: v41 (copy), v2 (ref), l_Checkbox_0 (ref), v45 (copy), v42 (copy)
        local v56 = {};
        local l_ipairs_0 = ipairs;
        local v58 = v41 or {};
        for v59, v60 in l_ipairs_0(v58) do
            v56["PostPurchaseActionCheckBox_" .. tostring(v59)] = v2.createElement(l_Checkbox_0, {
                LayoutOrder = v59, 
                size = "XSmall", 
                label = v60.label, 
                isChecked = not v45 and v60.isActionSelected, 
                isDisabled = v45, 
                onActivated = function() --[[ Line: 210 ]] --[[ Name: onActivated ]]
                    -- upvalues: v42 (ref), v59 (copy), v60 (copy)
                    v42(function(v61) --[[ Line: 211 ]]
                        -- upvalues: v59 (ref), v60 (ref)
                        local v62 = table.clone(v61);
                        v62[v59] = {
                            label = v60.label, 
                            isActionSelected = not v60.isActionSelected, 
                            actionKey = v60.actionKey
                        };
                        return v62;
                    end);
                end
            });
        end;
        return v56;
    end, {
        v41, 
        v45
    });
    local v64 = if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then v38.product.itemPrice else nil;
    local v65 = if v64 then v64.priceInRobux else v38.product.itemRobuxCost;
    local l_l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0_0 = l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0;
    if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
        l_l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0_0 = l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_V2_0;
    end;
    return v2.createElement(l_Sheet_0.Root, {
        onClose = v38.buttons.cancelActivated, 
        snapPoints = if v29 then {
            l_useScaledValue_0(l_l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0_0), 
            0.8
        } else {
            0.4, 
            0.8
        }, 
        preferCenterSheet = true, 
        ref = if v45 then nil else if v31 then v50 else nil
    }, {
        Header = v2.createElement(l_Sheet_0.Header, {
            hasCloseAffordance = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v38.hideUserRobuxBalance and true or nil else nil
        }, {
            ModalHeader = v2.createElement(v15, {
                titleText = v43, 
                robuxBalanceAmount = v38.robuxBalanceAmount, 
                hideUserRobuxBalance = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v38.hideUserRobuxBalance else nil
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
                    ProductDetails = if v38.purchaseModalType == v24.MultiItem then v2.createElement(v13, {
                        amount = v65, 
                        itemPrice = v64
                    }) else v2.createElement(v12, {
                        isPortrait = false, 
                        itemIcon = v38.product.itemIcon, 
                        itemName = v38.product.itemName, 
                        itemRobuxCost = v65, 
                        itemPrice = v64, 
                        itemDisplayPrice = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then v38.product.itemDisplayPrice else nil, 
                        priceSuffix = v40, 
                        model = v38.product.model
                    })
                }), 
                DiscountSummary = if v64 then v2.createElement(l_View_0, {
                    tag = "auto-y size-full-0 padding-top-small", 
                    LayoutOrder = 2
                }, {
                    Discount = v2.createElement(v14, {
                        itemPrice = v64
                    })
                }) else nil, 
                PostPurchaseActions = if next(v63) then v2.createElement(l_View_0, {
                    tag = l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "col gap-medium auto-y size-full-0 align-x-start align-y-start padding-top-small" or "col gap-medium auto-y size-full-0 align-x-start align-y-start", 
                    LayoutOrder = 3
                }, {
                    v63
                }) else nil
            })
        }), 
        Actions = if l_FFlagUnifiedPurchaseModalLayoutRefactor_0 then v2.createElement(l_Sheet_0.Actions, {
            LayoutOrder = 3
        }, {
            v2.createElement(l_View_0, {
                tag = "row wrap auto-xy align-y-center align-x-center size-full-0 gap-medium", 
                LayoutOrder = 1
            }, {
                BuyButton = v2.createElement(l_Button_0, {
                    text = v55, 
                    onActivated = v54, 
                    inputDelay = (not v38.buttons.buyItemEnableInputDelayed or v45) and 0 or 2.5, 
                    isDisabled = v45, 
                    ref = if v31 then v51 else v48, 
                    fillBehavior = l_FillBehavior_0.Fill, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    LayoutOrder = 1
                }), 
                BlackbirdUpsellBanner = if v38.BlackbirdUpsellBannerProductInfo and v38.onBlackbirdUpsellActivated then v2.createElement(l_BlackbirdUpsellBanner_0, {
                    productInfo = v38.BlackbirdUpsellBannerProductInfo, 
                    onActivated = v38.onBlackbirdUpsellActivated, 
                    LayoutOrder = 2
                }) else nil, 
                TestPurchaseDisclaimer = if l_FFlagAddUnifiedTestPurchaseDisclaimer_0 and v38.isTestPurchase then v2.createElement(l_Text_0, {
                    Text = v39.TestPurchaseDisclaimer, 
                    tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap", 
                    LayoutOrder = 3
                }) else nil
            })
        }) else v2.createElement(l_Sheet_0.Actions, {
            LayoutOrder = 3
        }, {
            if l_FFlagAddUnifiedTestPurchaseDisclaimer_0 and v38.isTestPurchase then v2.createElement(l_View_0, {
                LayoutOrder = 1, 
                tag = "row wrap auto-xy align-y-center align-x-center size-full-0 gap-medium"
            }, {
                BuyButton = v2.createElement(l_Button_0, {
                    text = v55, 
                    onActivated = v54, 
                    inputDelay = (not v38.buttons.buyItemEnableInputDelayed or v45) and 0 or 2.5, 
                    isDisabled = v45, 
                    ref = if v31 then v51 else v48, 
                    fillBehavior = l_FillBehavior_0.Fill, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    LayoutOrder = 1
                }), 
                BlackbirdUpsellBanner = if v38.BlackbirdUpsellBannerProductInfo and v38.onBlackbirdUpsellActivated then v2.createElement(l_BlackbirdUpsellBanner_0, {
                    productInfo = v38.BlackbirdUpsellBannerProductInfo, 
                    onActivated = v38.onBlackbirdUpsellActivated, 
                    LayoutOrder = 2
                }) else nil, 
                TestPurchaseDisclaimer = if v38.isTestPurchase then v2.createElement(l_Text_0, {
                    Text = v39.TestPurchaseDisclaimer, 
                    tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap", 
                    LayoutOrder = 3
                }) else nil
            }) else v2.createElement(l_Button_0, {
                text = v55, 
                onActivated = v54, 
                inputDelay = (not v38.buttons.buyItemEnableInputDelayed or v45) and 0 or 2.5, 
                isDisabled = v45, 
                ref = if v31 then v51 else v48, 
                fillBehavior = l_FillBehavior_0.Fill, 
                variant = l_ButtonVariant_0.Emphasis
            })
        })
    });
end;
return function(v68) --[[ Line: 397 ]] --[[ Name: UnifiedProductPurchaseModalContainer ]]
    -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v67 (copy)
    return v2.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        ProductPurchaseModal = v2.createElement(v67, v68)
    });
end;