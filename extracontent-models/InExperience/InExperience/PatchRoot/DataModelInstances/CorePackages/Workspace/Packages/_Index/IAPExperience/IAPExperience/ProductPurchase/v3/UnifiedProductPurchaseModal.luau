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
local v16 = require(l_Parent_0.Generic.ProductDetailsContainer);
local l_UrlBuilder_0 = require(l_Parent_1.UrlBuilder).UrlBuilder;
local v18 = require(l_Parent_0.Generic.Hooks.useInitialButtonDisableDelay);
local v19 = require(l_Parent_0.Generic.Hooks.useFocusNavigationRefs);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_1.AppLocales).Localization;
local v22 = require(l_Parent_1.Localization);
local l_LocalizationProvider_0 = v22.LocalizationProvider;
local l_useLocalization_0 = v22.Hooks.useLocalization;
local _ = require(script.Parent.UnifiedProductPurchaseModalTypes);
local v26 = require(l_Parent_0.Enums.UnifiedPurchaseModalTypeEnum);
local v27 = require(l_Parent_0.Generic.Constants);
local l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0 = v27.UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT;
local l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_V2_0 = v27.UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_V2;
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_Parent_0.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local v31 = require(l_Parent_0.Flags.FFlagUnifiedPurchaseModalUiImprovements);
local v32 = require(l_Parent_0.Flags.FFlagFixUnifiedModalsMountedTwice);
local v33 = require(l_Parent_0.Flags.FFlagAddFocusNavigationToUnifiedPurchase);
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local l_FFlagAddUnifiedTestPurchaseDisclaimer_0 = require(l_Parent_0.Parent.SharedFlags).FFlagAddUnifiedTestPurchaseDisclaimer;
local l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 = require(l_Parent_0.Parent.SharedFlags).FFlagEnableDiscountInfoInUnifiedPurchaseModal;
local l_FFlagRefactorUnifiedProductDetails_0 = require(l_Parent_0.Parent.SharedFlags).FFlagRefactorUnifiedProductDetails;
local _ = require(l_Parent_0.ProductPurchase.PricingTypes);
local l_BlackbirdUpsellBanner_0 = require(l_Parent_1.RobloxSubscriptionPurchaseApp).Components.BlackbirdUpsellBanner;
local l_FFlagUnifiedPurchaseModalLayoutRefactor_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseModalLayoutRefactor;
local function v74(v41) --[[ Line: 104 ]] --[[ Name: UnifiedProductPurchaseModal ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), l_FFlagAddUnifiedTestPurchaseDisclaimer_0 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), l_UrlBuilder_0 (copy), v26 (copy), v2 (copy), v18 (copy), v32 (copy), v33 (copy), v19 (copy), l_Checkbox_0 (copy), l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 (copy), l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0 (copy), l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_V2_0 (copy), l_Text_0 (copy), l_FFlagRefactorUnifiedProductDetails_0 (copy), v16 (copy), l_Sheet_0 (copy), v31 (copy), l_useScaledValue_0 (copy), v15 (copy), l_View_0 (copy), v13 (copy), v12 (copy), v14 (copy), l_FFlagUnifiedPurchaseModalLayoutRefactor_0 (copy), l_Button_0 (copy), l_FillBehavior_0 (copy), l_ButtonVariant_0 (copy), l_BlackbirdUpsellBanner_0 (copy)
    local v42 = l_useLocalization_0({
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
    local v43 = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v41.purchaseModalType == v26.DeveloperSubscription then v42.PerMonth else nil;
    local v44, v45 = v2.useState(v41.postPurchaseActions or {});
    local v46, v47 = v2.useState(v42.BuyItem);
    local v48 = v18(v41.buttons.isDisabled);
    v2.useEffect(function() --[[ Line: 143 ]]
        -- upvalues: v41 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (ref), v26 (ref), v47 (copy), v42 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (ref)
        local l_purchaseModalType_0 = v41.purchaseModalType;
        if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and l_purchaseModalType_0 == v26.DeveloperSubscription then
            v47(v42.GetSubscription);
            return;
        elseif l_purchaseModalType_0 == v26.MultiItem then
            if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
                v47(v42.BuyAvatar);
                return;
            else
                v47(v42.BuyItems);
                return;
            end;
        elseif l_purchaseModalType_0 == v26.Experience then
            v47(v42.BuyExperience);
            return;
        elseif l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
            v47(v42.BuyItemV2);
            return;
        else
            v47(v42.BuyItem);
            return;
        end;
    end, {
        v41.purchaseModalType
    });
    local v51 = v2.useCallback(function(v50) --[[ Line: 167 ]]
        -- upvalues: v41 (copy)
        if v50 and v41.onBuyItemButtonMounted then
            v41.onBuyItemButtonMounted(v50);
        end;
    end, {
        v41.onBuyItemButtonMounted
    });
    if v32 then
        v51 = v2.useCallback(function(v52) --[[ Line: 176 ]]
            -- upvalues: v41 (copy), v48 (copy)
            if v52 and v41.onBuyItemButtonMounted and not v48 then
                v41.onBuyItemButtonMounted(v52);
            end;
        end, {
            v41.onBuyItemButtonMounted, 
            v48
        });
    end;
    local v53 = nil;
    local v54 = nil;
    if v33 then
        local v55, v56 = v19(v41.buttons.cancelActivated, v41.onBuyItemButtonMounted);
        v53 = v55;
        v54 = v56;
    end;
    local v57 = v2.useCallback(function() --[[ Line: 190 ]]
        -- upvalues: v44 (copy), v41 (copy)
        if v44 and v41.setPostPurchaseActions then
            v41.setPostPurchaseActions(v44);
        end;
        v41.buttons.buyItemActivated();
    end, {
        v41.buttons.buyItemActivated, 
        v44
    });
    v2.useEffect(function() --[[ Line: 198 ]]
        -- upvalues: v45 (copy), v41 (copy)
        v45(v41.postPurchaseActions or {});
    end, {
        v41.postPurchaseActions
    });
    local v58 = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v41.purchaseModalType == v26.DeveloperSubscription then v42.Subscribe else v42.Buy;
    local v66 = v2.useMemo(function() --[[ Line: 207 ]]
        -- upvalues: v44 (copy), v2 (ref), l_Checkbox_0 (ref), v48 (copy), v45 (copy)
        local v59 = {};
        local l_ipairs_0 = ipairs;
        local v61 = v44 or {};
        for v62, v63 in l_ipairs_0(v61) do
            v59["PostPurchaseActionCheckBox_" .. tostring(v62)] = v2.createElement(l_Checkbox_0, {
                LayoutOrder = v62, 
                size = "XSmall", 
                label = v63.label, 
                isChecked = not v48 and v63.isActionSelected, 
                isDisabled = v48, 
                onActivated = function() --[[ Line: 216 ]] --[[ Name: onActivated ]]
                    -- upvalues: v45 (ref), v62 (copy), v63 (copy)
                    v45(function(v64) --[[ Line: 217 ]]
                        -- upvalues: v62 (ref), v63 (ref)
                        local v65 = table.clone(v64);
                        v65[v62] = {
                            label = v63.label, 
                            isActionSelected = not v63.isActionSelected, 
                            actionKey = v63.actionKey
                        };
                        return v65;
                    end);
                end
            });
        end;
        return v59;
    end, {
        v44, 
        v48
    });
    local v67 = if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then v41.product.itemPrice else nil;
    local v68 = if v67 then v67.priceInRobux else v41.product.itemRobuxCost;
    local l_l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0_0 = l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0;
    if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
        l_l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0_0 = l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_V2_0;
    end;
    local v70 = l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v41.purchaseModalType == v26.DeveloperSubscription;
    local v71 = nil;
    if v70 then
        local v72 = string.gsub(v42.SubscribeTermsAgreement or "", "<a.->(.-)</a>", "%1");
        v72 = string.gsub(v72, "<.->", "");
        v71 = v2.createElement(l_Text_0, {
            LayoutOrder = 4, 
            Text = v72, 
            tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap"
        });
    end;
    local v73 = nil;
    if l_FFlagRefactorUnifiedProductDetails_0 then
        v73 = v2.createElement(v16, {
            purchaseModalType = v41.purchaseModalType, 
            product = v41.product, 
            priceSuffix = v43
        });
    end;
    return v2.createElement(l_Sheet_0.Root, {
        onClose = v41.buttons.cancelActivated, 
        snapPoints = if not l_FFlagRefactorUnifiedProductDetails_0 then if v31 then {
            l_useScaledValue_0(l_l_UNIFIED_PRODUCT_PURCHASE_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0_0), 
            0.8
        } else {
            0.4, 
            0.8
        } else nil, 
        preferCenterSheet = true, 
        ref = if v48 then nil else if v33 then v53 else nil
    }, {
        Header = v2.createElement(l_Sheet_0.Header, {
            hasCloseAffordance = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v41.hideUserRobuxBalance and true or nil else nil
        }, {
            ModalHeader = v2.createElement(v15, {
                titleText = v46, 
                robuxBalanceAmount = v41.robuxBalanceAmount, 
                hideUserRobuxBalance = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v41.hideUserRobuxBalance else nil
            })
        }), 
        Content = v2.createElement(l_Sheet_0.Content, {
            LayoutOrder = 2
        }, {
            SheetContentContainer = v2.createElement(l_View_0, {
                tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center"
            }, {
                ProductDetailsContainer = if l_FFlagRefactorUnifiedProductDetails_0 and v73 then v73 else v2.createElement(l_View_0, {
                    tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center", 
                    LayoutOrder = 1
                }, {
                    ProductDetails = if v41.purchaseModalType == v26.MultiItem then v2.createElement(v13, {
                        amount = v68, 
                        itemPrice = v67
                    }) else v2.createElement(v12, {
                        isPortrait = false, 
                        itemIcon = v41.product.itemIcon, 
                        itemName = v41.product.itemName, 
                        itemRobuxCost = v68, 
                        itemPrice = v67, 
                        itemDisplayPrice = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then v41.product.itemDisplayPrice else nil, 
                        priceSuffix = v43, 
                        model = v41.product.model
                    })
                }), 
                DiscountSummary = if not v67 or l_FFlagRefactorUnifiedProductDetails_0 then nil else v2.createElement(l_View_0, {
                    tag = "auto-y size-full-0 padding-top-small", 
                    LayoutOrder = 2
                }, {
                    Discount = v2.createElement(v14, {
                        itemPrice = v67
                    })
                }), 
                PostPurchaseActions = if next(v66) then v2.createElement(l_View_0, {
                    tag = l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "col gap-medium auto-y size-full-0 align-x-start align-y-start padding-top-small" or "col gap-medium auto-y size-full-0 align-x-start align-y-start", 
                    LayoutOrder = 3
                }, {
                    v66
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
                    text = v58, 
                    onActivated = v57, 
                    inputDelay = (not v41.buttons.buyItemEnableInputDelayed or v48) and 0 or 2.5, 
                    isDisabled = v48, 
                    ref = if v33 then v54 else v51, 
                    fillBehavior = l_FillBehavior_0.Fill, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    LayoutOrder = 1
                }), 
                BlackbirdUpsellBanner = if v41.BlackbirdUpsellBannerProductInfo and v41.onBlackbirdUpsellActivated then v2.createElement(l_BlackbirdUpsellBanner_0, {
                    productInfo = v41.BlackbirdUpsellBannerProductInfo, 
                    onActivated = v41.onBlackbirdUpsellActivated, 
                    LayoutOrder = 2
                }) else nil, 
                TestPurchaseDisclaimer = if l_FFlagAddUnifiedTestPurchaseDisclaimer_0 and v41.isTestPurchase then v2.createElement(l_Text_0, {
                    Text = v42.TestPurchaseDisclaimer, 
                    tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap", 
                    LayoutOrder = 3
                }) else nil, 
                SubscribeTerms = v71
            })
        }) else v2.createElement(l_Sheet_0.Actions, {
            LayoutOrder = 3
        }, {
            if l_FFlagAddUnifiedTestPurchaseDisclaimer_0 and v41.isTestPurchase or v70 then v2.createElement(l_View_0, {
                LayoutOrder = 1, 
                tag = "row wrap auto-xy align-y-center align-x-center size-full-0 gap-medium"
            }, {
                BuyButton = v2.createElement(l_Button_0, {
                    text = v58, 
                    onActivated = v57, 
                    inputDelay = (not v41.buttons.buyItemEnableInputDelayed or v48) and 0 or 2.5, 
                    isDisabled = v48, 
                    ref = if v33 then v54 else v51, 
                    fillBehavior = l_FillBehavior_0.Fill, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    LayoutOrder = 1
                }), 
                BlackbirdUpsellBanner = if v41.BlackbirdUpsellBannerProductInfo and v41.onBlackbirdUpsellActivated then v2.createElement(l_BlackbirdUpsellBanner_0, {
                    productInfo = v41.BlackbirdUpsellBannerProductInfo, 
                    onActivated = v41.onBlackbirdUpsellActivated, 
                    LayoutOrder = 2
                }) else nil, 
                TestPurchaseDisclaimer = if v41.isTestPurchase then v2.createElement(l_Text_0, {
                    Text = v42.TestPurchaseDisclaimer, 
                    tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap", 
                    LayoutOrder = 3
                }) else nil, 
                SubscribeTerms = v71
            }) else v2.createElement(l_Button_0, {
                text = v58, 
                onActivated = v57, 
                inputDelay = (not v41.buttons.buyItemEnableInputDelayed or v48) and 0 or 2.5, 
                isDisabled = v48, 
                ref = if v33 then v54 else v51, 
                fillBehavior = l_FillBehavior_0.Fill, 
                variant = l_ButtonVariant_0.Emphasis
            })
        })
    });
end;
return function(v75) --[[ Line: 432 ]] --[[ Name: UnifiedProductPurchaseModalContainer ]]
    -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v74 (copy)
    return v2.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        ProductPurchaseModal = v2.createElement(v74, v75)
    });
end;