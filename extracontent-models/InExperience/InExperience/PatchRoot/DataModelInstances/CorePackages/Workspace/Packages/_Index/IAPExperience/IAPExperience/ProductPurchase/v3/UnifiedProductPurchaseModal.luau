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
local l_UrlBuilder_0 = require(l_Parent_1.UrlBuilder).UrlBuilder;
local v17 = require(l_Parent_0.Generic.Hooks.useInitialButtonDisableDelay);
local v18 = require(l_Parent_0.Generic.Hooks.useFocusNavigationRefs);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_1.AppLocales).Localization;
local v21 = require(l_Parent_1.Localization);
local l_LocalizationProvider_0 = v21.LocalizationProvider;
local l_useLocalization_0 = v21.Hooks.useLocalization;
local _ = require(script.Parent.UnifiedProductPurchaseModalTypes);
local v25 = require(l_Parent_0.Enums.UnifiedPurchaseModalTypeEnum);
local v26 = require(l_Parent_0.Generic.Constants);
local l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0 = v26.UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT;
local l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_V2_0 = v26.UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_V2;
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_Parent_0.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local v30 = require(l_Parent_0.Flags.FFlagUnifiedPurchaseModalUiImprovements);
local v31 = require(l_Parent_0.Flags.FFlagFixUnifiedModalsMountedTwice);
local v32 = require(l_Parent_0.Flags.FFlagAddFocusNavigationToUnifiedPurchase);
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local l_FFlagAddUnifiedTestPurchaseDisclaimer_0 = require(l_Parent_0.Parent.SharedFlags).FFlagAddUnifiedTestPurchaseDisclaimer;
local l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 = require(l_Parent_0.Parent.SharedFlags).FFlagEnableDiscountInfoInUnifiedPurchaseModal;
local _ = require(l_Parent_0.ProductPurchase.PricingTypes);
local l_BlackbirdUpsellBanner_0 = require(l_Parent_1.RobloxSubscriptionPurchaseApp).Components.BlackbirdUpsellBanner;
local l_FFlagUnifiedPurchaseModalLayoutRefactor_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseModalLayoutRefactor;
local function v71(v39) --[[ Line: 109 ]] --[[ Name: UnifiedProductPurchaseModal ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), l_FFlagAddUnifiedTestPurchaseDisclaimer_0 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), l_UrlBuilder_0 (copy), v25 (copy), v2 (copy), v17 (copy), v31 (copy), v32 (copy), v18 (copy), l_Checkbox_0 (copy), l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 (copy), l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0 (copy), l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_V2_0 (copy), l_Text_0 (copy), l_Sheet_0 (copy), v30 (copy), l_useScaledValue_0 (copy), v15 (copy), l_View_0 (copy), v13 (copy), v12 (copy), v14 (copy), l_FFlagUnifiedPurchaseModalLayoutRefactor_0 (copy), l_Button_0 (copy), l_FillBehavior_0 (copy), l_ButtonVariant_0 (copy), l_BlackbirdUpsellBanner_0 (copy)
    local v40 = l_useLocalization_0({
        Buy = "IAPExperience.PurchasePrompt.Action.Buy", 
        Subscribe = "Feature.Subscription.Action.Subscribe", 
        BuyItem = "IAPExperience.PurchasePrompt.Title.BuyItem", 
        BuyItemV2 = l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "IAPExperience.PurchasePrompt.Title.BuyItemV2" or nil, 
        GetSubscription = "IAPExperience.SubscriptionPurchasePrompt.Label.GetSubscription", 
        BuyExperience = "IAPExperience.PurchasePrompt.Title.BuyExperience", 
        BuyItems = "IAPExperience.PurchasePrompt.Title.BuyItems", 
        BuyAvatar = l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "IAPExperience.PurchasePrompt.Header.BuyAvatar" or nil, 
        TestPurchaseDisclaimer = l_FFlagAddUnifiedTestPurchaseDisclaimer_0 and "IAPExperience.PurchasePrompt.Text.TestPurchase" or nil, 
        PerMonth = l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and "Feature.Subscription.Text.PerMonth" or nil, 
        SubscribeTermsAgreement = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then {
            "Feature.Subscription.Footer.PurchasePromptLegalText"; 
            SubscribeButtonTitle = "\"Subscribe\"", 
            tosUrl = l_UrlBuilder_0.static.about.terms()
        } else nil
    });
    local v41 = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v39.purchaseModalType == v25.DeveloperSubscription then v40.PerMonth else nil;
    local v42, v43 = v2.useState(v39.postPurchaseActions or {});
    local v44, v45 = v2.useState(v40.BuyItem);
    local v46 = v17(v39.buttons.isDisabled);
    v2.useEffect(function() --[[ Line: 148 ]]
        -- upvalues: v39 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (ref), v25 (ref), v45 (copy), v40 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (ref)
        local l_purchaseModalType_0 = v39.purchaseModalType;
        if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and l_purchaseModalType_0 == v25.DeveloperSubscription then
            v45(v40.GetSubscription);
            return;
        elseif l_purchaseModalType_0 == v25.MultiItem then
            if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
                v45(v40.BuyAvatar);
                return;
            else
                v45(v40.BuyItems);
                return;
            end;
        elseif l_purchaseModalType_0 == v25.Experience then
            v45(v40.BuyExperience);
            return;
        elseif l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
            v45(v40.BuyItemV2);
            return;
        else
            v45(v40.BuyItem);
            return;
        end;
    end, {
        v39.purchaseModalType
    });
    local v49 = v2.useCallback(function(v48) --[[ Line: 172 ]]
        -- upvalues: v39 (copy)
        if v48 and v39.onBuyItemButtonMounted then
            v39.onBuyItemButtonMounted(v48);
        end;
    end, {
        v39.onBuyItemButtonMounted
    });
    if v31 then
        v49 = v2.useCallback(function(v50) --[[ Line: 181 ]]
            -- upvalues: v39 (copy), v46 (copy)
            if v50 and v39.onBuyItemButtonMounted and not v46 then
                v39.onBuyItemButtonMounted(v50);
            end;
        end, {
            v39.onBuyItemButtonMounted, 
            v46
        });
    end;
    local v51 = nil;
    local v52 = nil;
    if v32 then
        local v53, v54 = v18(v39.buttons.cancelActivated, v39.onBuyItemButtonMounted);
        v51 = v53;
        v52 = v54;
    end;
    local v55 = v2.useCallback(function() --[[ Line: 195 ]]
        -- upvalues: v42 (copy), v39 (copy)
        if v42 and v39.setPostPurchaseActions then
            v39.setPostPurchaseActions(v42);
        end;
        v39.buttons.buyItemActivated();
    end, {
        v39.buttons.buyItemActivated, 
        v42
    });
    v2.useEffect(function() --[[ Line: 203 ]]
        -- upvalues: v43 (copy), v39 (copy)
        v43(v39.postPurchaseActions or {});
    end, {
        v39.postPurchaseActions
    });
    local v56 = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v39.purchaseModalType == v25.DeveloperSubscription then v40.Subscribe else v40.Buy;
    local v64 = v2.useMemo(function() --[[ Line: 212 ]]
        -- upvalues: v42 (copy), v2 (ref), l_Checkbox_0 (ref), v46 (copy), v43 (copy)
        local v57 = {};
        local l_ipairs_0 = ipairs;
        local v59 = v42 or {};
        for v60, v61 in l_ipairs_0(v59) do
            v57["PostPurchaseActionCheckBox_" .. tostring(v60)] = v2.createElement(l_Checkbox_0, {
                LayoutOrder = v60, 
                size = "XSmall", 
                label = v61.label, 
                isChecked = not v46 and v61.isActionSelected, 
                isDisabled = v46, 
                onActivated = function() --[[ Line: 221 ]] --[[ Name: onActivated ]]
                    -- upvalues: v43 (ref), v60 (copy), v61 (copy)
                    v43(function(v62) --[[ Line: 222 ]]
                        -- upvalues: v60 (ref), v61 (ref)
                        local v63 = table.clone(v62);
                        v63[v60] = {
                            label = v61.label, 
                            isActionSelected = not v61.isActionSelected, 
                            actionKey = v61.actionKey
                        };
                        return v63;
                    end);
                end
            });
        end;
        return v57;
    end, {
        v42, 
        v46
    });
    local v65 = if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then v39.product.itemPrice else nil;
    local v66 = if v65 then v65.priceInRobux else v39.product.itemRobuxCost;
    local l_l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0_0 = l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0;
    if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
        l_l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0_0 = l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_V2_0;
    end;
    local v68 = l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v39.purchaseModalType == v25.DeveloperSubscription;
    local v69 = nil;
    if v68 then
        local v70 = string.gsub(v40.SubscribeTermsAgreement or "", "<a.->(.-)</a>", "%1");
        v70 = string.gsub(v70, "<.->", "");
        v69 = v2.createElement(l_Text_0, {
            LayoutOrder = 4, 
            Text = v70, 
            tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap"
        });
    end;
    return v2.createElement(l_Sheet_0.Root, {
        onClose = v39.buttons.cancelActivated, 
        snapPoints = if v30 then {
            l_useScaledValue_0(l_l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0_0), 
            0.8
        } else {
            0.4, 
            0.8
        }, 
        preferCenterSheet = true, 
        ref = if v46 then nil else if v32 then v51 else nil
    }, {
        Header = v2.createElement(l_Sheet_0.Header, {
            hasCloseAffordance = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v39.hideUserRobuxBalance and true or nil else nil
        }, {
            ModalHeader = v2.createElement(v15, {
                titleText = v44, 
                robuxBalanceAmount = v39.robuxBalanceAmount, 
                hideUserRobuxBalance = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v39.hideUserRobuxBalance else nil
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
                    ProductDetails = if v39.purchaseModalType == v25.MultiItem then v2.createElement(v13, {
                        amount = v66, 
                        itemPrice = v65
                    }) else v2.createElement(v12, {
                        isPortrait = false, 
                        itemIcon = v39.product.itemIcon, 
                        itemName = v39.product.itemName, 
                        itemRobuxCost = v66, 
                        itemPrice = v65, 
                        itemDisplayPrice = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then v39.product.itemDisplayPrice else nil, 
                        priceSuffix = v41, 
                        model = v39.product.model
                    })
                }), 
                DiscountSummary = if v65 then v2.createElement(l_View_0, {
                    tag = "auto-y size-full-0 padding-top-small", 
                    LayoutOrder = 2
                }, {
                    Discount = v2.createElement(v14, {
                        itemPrice = v65
                    })
                }) else nil, 
                PostPurchaseActions = if next(v64) then v2.createElement(l_View_0, {
                    tag = l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "col gap-medium auto-y size-full-0 align-x-start align-y-start padding-top-small" or "col gap-medium auto-y size-full-0 align-x-start align-y-start", 
                    LayoutOrder = 3
                }, {
                    v64
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
                    text = v56, 
                    onActivated = v55, 
                    inputDelay = (not v39.buttons.buyItemEnableInputDelayed or v46) and 0 or 2.5, 
                    isDisabled = v46, 
                    ref = if v32 then v52 else v49, 
                    fillBehavior = l_FillBehavior_0.Fill, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    LayoutOrder = 1
                }), 
                BlackbirdUpsellBanner = if v39.BlackbirdUpsellBannerProductInfo and v39.onBlackbirdUpsellActivated then v2.createElement(l_BlackbirdUpsellBanner_0, {
                    productInfo = v39.BlackbirdUpsellBannerProductInfo, 
                    onActivated = v39.onBlackbirdUpsellActivated, 
                    LayoutOrder = 2
                }) else nil, 
                TestPurchaseDisclaimer = if l_FFlagAddUnifiedTestPurchaseDisclaimer_0 and v39.isTestPurchase then v2.createElement(l_Text_0, {
                    Text = v40.TestPurchaseDisclaimer, 
                    tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap", 
                    LayoutOrder = 3
                }) else nil, 
                SubscribeTerms = v69
            })
        }) else v2.createElement(l_Sheet_0.Actions, {
            LayoutOrder = 3
        }, {
            if l_FFlagAddUnifiedTestPurchaseDisclaimer_0 and v39.isTestPurchase or v68 then v2.createElement(l_View_0, {
                LayoutOrder = 1, 
                tag = "row wrap auto-xy align-y-center align-x-center size-full-0 gap-medium"
            }, {
                BuyButton = v2.createElement(l_Button_0, {
                    text = v56, 
                    onActivated = v55, 
                    inputDelay = (not v39.buttons.buyItemEnableInputDelayed or v46) and 0 or 2.5, 
                    isDisabled = v46, 
                    ref = if v32 then v52 else v49, 
                    fillBehavior = l_FillBehavior_0.Fill, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    LayoutOrder = 1
                }), 
                BlackbirdUpsellBanner = if v39.BlackbirdUpsellBannerProductInfo and v39.onBlackbirdUpsellActivated then v2.createElement(l_BlackbirdUpsellBanner_0, {
                    productInfo = v39.BlackbirdUpsellBannerProductInfo, 
                    onActivated = v39.onBlackbirdUpsellActivated, 
                    LayoutOrder = 2
                }) else nil, 
                TestPurchaseDisclaimer = if v39.isTestPurchase then v2.createElement(l_Text_0, {
                    Text = v40.TestPurchaseDisclaimer, 
                    tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap", 
                    LayoutOrder = 3
                }) else nil, 
                SubscribeTerms = v69
            }) else v2.createElement(l_Button_0, {
                text = v56, 
                onActivated = v55, 
                inputDelay = (not v39.buttons.buyItemEnableInputDelayed or v46) and 0 or 2.5, 
                isDisabled = v46, 
                ref = if v32 then v52 else v49, 
                fillBehavior = l_FillBehavior_0.Fill, 
                variant = l_ButtonVariant_0.Emphasis
            })
        })
    });
end;
return function(v72) --[[ Line: 424 ]] --[[ Name: UnifiedProductPurchaseModalContainer ]]
    -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v71 (copy)
    return v2.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        ProductPurchaseModal = v2.createElement(v71, v72)
    });
end;