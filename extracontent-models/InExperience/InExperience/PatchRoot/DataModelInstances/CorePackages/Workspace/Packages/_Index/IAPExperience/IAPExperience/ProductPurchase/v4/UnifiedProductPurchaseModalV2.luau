local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local l_BlackbirdUpsellBanner_0 = require(l_Parent_1.RobloxSubscriptionPurchaseApp).Components.BlackbirdUpsellBanner;
local v4 = require(l_Parent_1.Foundation);
local l_ButtonVariant_0 = v4.Enums.ButtonVariant;
local l_Dialog_0 = v4.Dialog;
local l_Checkbox_0 = v4.Checkbox;
local l_View_0 = v4.View;
local l_DialogSize_0 = v4.Enums.DialogSize;
local v10 = require(l_Parent_0.Generic.UnifiedProductDetails);
local v11 = require(l_Parent_0.Generic.PriceSummary);
local v12 = require(l_Parent_0.Generic.DiscountSummary);
local v13 = require(l_Parent_0.Generic.ProductDetailsContainer);
local v14 = require(l_Parent_0.Generic.Hooks.useFocusNavigationRefs);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_1.AppLocales).Localization;
local v17 = require(l_Parent_1.Localization);
local l_LocalizationProvider_0 = v17.LocalizationProvider;
local l_useLocalization_0 = v17.Hooks.useLocalization;
local l_UrlBuilder_0 = require(l_Parent_1.UrlBuilder).UrlBuilder;
local v21 = require(script.Parent.SubtitleComponentMap);
local _ = require(script.Parent.Parent.v3.UnifiedProductPurchaseModalTypes);
local v23 = require(l_Parent_0.Enums.UnifiedPurchaseModalTypeEnum);
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local l_FFlagAddUnifiedTestPurchaseDisclaimer_0 = require(l_Parent_0.Parent.SharedFlags).FFlagAddUnifiedTestPurchaseDisclaimer;
local l_FFlagUnifiedPurchaseAddSkeleton_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseAddSkeleton;
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_Parent_0.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 = require(l_Parent_0.Parent.SharedFlags).FFlagEnableDiscountInfoInUnifiedPurchaseModal;
local l_FFlagUnifiedPurchaseModalLayoutRefactor_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseModalLayoutRefactor;
local v30 = game:DefineFastFlag("FixCheckboxesMissingUnifiedPurchase", false);
local v31 = game:DefineFastFlag("UnifiedPurchaseFixTitleFlash", false);
local l_FFlagRefactorUnifiedProductDetails_0 = require(l_Parent_0.Parent.SharedFlags).FFlagRefactorUnifiedProductDetails;
local _ = require(l_Parent_0.ProductPurchase.PricingTypes);
local function v66(v34) --[[ Line: 103 ]] --[[ Name: UnifiedProductPurchaseModalV2 ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), l_FFlagAddUnifiedTestPurchaseDisclaimer_0 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), l_UrlBuilder_0 (copy), v23 (copy), v2 (copy), v31 (copy), v14 (copy), l_Checkbox_0 (copy), l_FFlagUnifiedPurchaseAddSkeleton_0 (copy), v21 (copy), l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 (copy), l_View_0 (copy), v11 (copy), v10 (copy), l_FFlagUnifiedPurchaseModalLayoutRefactor_0 (copy), l_FFlagRefactorUnifiedProductDetails_0 (copy), v13 (copy), v12 (copy), l_ButtonVariant_0 (copy), v4 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), v30 (copy), l_BlackbirdUpsellBanner_0 (copy)
    local v35 = l_useLocalization_0({
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
    local v36 = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v34.purchaseModalType == v23.DeveloperSubscription then v35.PerMonth else nil;
    local v37, v38 = v2.useState(v34.postPurchaseActions or {});
    local v39 = nil;
    local v40 = nil;
    if not v31 then
        local v41, v42 = v2.useState(v35.BuyItem);
        v39 = v41;
        v40 = v42;
        v2.useEffect(function() --[[ Line: 140 ]]
            -- upvalues: v34 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (ref), v23 (ref), v40 (ref), v35 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (ref)
            local l_purchaseModalType_0 = v34.purchaseModalType;
            if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and l_purchaseModalType_0 == v23.DeveloperSubscription then
                v40(v35.GetSubscription);
                return;
            elseif l_purchaseModalType_0 == v23.MultiItem then
                if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
                    v40(v35.BuyAvatar);
                    return;
                else
                    v40(v35.BuyItems);
                    return;
                end;
            elseif l_purchaseModalType_0 == v23.Experience then
                v40(v35.BuyExperience);
                return;
            elseif l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
                v40(v35.BuyItemV2);
                return;
            else
                v40(v35.BuyItem);
                return;
            end;
        end, {
            v34.purchaseModalType
        });
    else
        local l_purchaseModalType_1 = v34.purchaseModalType;
        v39 = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and l_purchaseModalType_1 == v23.DeveloperSubscription then v35.GetSubscription else if l_purchaseModalType_1 == v23.MultiItem then v35.BuyAvatar else if l_purchaseModalType_1 == v23.Experience then v35.BuyExperience else v35.BuyItemV2;
    end;
    local v45 = nil;
    local v46 = nil;
    local v47, v48 = v14(v34.buttons.cancelActivated, v34.onBuyItemButtonMounted);
    v45 = v47;
    v46 = v48;
    v47 = v2.useCallback(function() --[[ Line: 183 ]]
        -- upvalues: v37 (copy), v34 (copy)
        if v37 and v34.setPostPurchaseActions then
            v34.setPostPurchaseActions(v37);
        end;
        v34.buttons.buyItemActivated();
    end, {
        v34.buttons.buyItemActivated, 
        v37
    });
    v2.useEffect(function() --[[ Line: 191 ]]
        -- upvalues: v38 (copy), v34 (copy)
        v38(v34.postPurchaseActions or {});
    end, {
        v34.postPurchaseActions
    });
    v48 = v2.useMemo(function() --[[ Line: 195 ]]
        -- upvalues: v37 (copy), v2 (ref), l_Checkbox_0 (ref), v34 (copy), l_FFlagUnifiedPurchaseAddSkeleton_0 (ref), v38 (copy)
        local v49 = {};
        local l_ipairs_0 = ipairs;
        local v51 = v37 or {};
        for v52, v53 in l_ipairs_0(v51) do
            v49["PostPurchaseActionCheckBox_" .. tostring(v52)] = v2.createElement(l_Checkbox_0, {
                LayoutOrder = v52, 
                size = "XSmall", 
                label = v53.label, 
                isChecked = v53.isActionSelected, 
                isDisabled = v34.buttons.isDisabled or if l_FFlagUnifiedPurchaseAddSkeleton_0 then v34.isLoading else nil, 
                onActivated = function() --[[ Line: 206 ]] --[[ Name: onActivated ]]
                    -- upvalues: v38 (ref), v52 (copy), v53 (copy)
                    v38(function(v54) --[[ Line: 207 ]]
                        -- upvalues: v52 (ref), v53 (ref)
                        local v55 = table.clone(v54);
                        v55[v52] = {
                            label = v53.label, 
                            isActionSelected = not v53.isActionSelected, 
                            actionKey = v53.actionKey
                        };
                        return v55;
                    end);
                end
            });
        end;
        return v49;
    end, {
        v37, 
        if l_FFlagUnifiedPurchaseAddSkeleton_0 then v34.isLoading else nil
    });
    local v56 = nil;
    if v34.subtitleView then
        local v57 = v21[v34.subtitleView.componentName];
        if v57 then
            v56 = v2.createElement(v57, v34.subtitleView.props);
        end;
    end;
    local v58 = if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then v34.product.itemPrice else nil;
    local v59 = if v58 then v58.priceInRobux else v34.product.itemRobuxCost;
    local v60 = v2.createElement(l_View_0, {
        tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center", 
        LayoutOrder = 1
    }, {
        ProductDetails = if v34.purchaseModalType == v23.MultiItem then v2.createElement(v11, {
            amount = v59, 
            itemPrice = v58
        }) else v2.createElement(v10, {
            isPortrait = false, 
            itemIcon = v34.product.itemIcon, 
            itemName = v34.product.itemName, 
            itemRobuxCost = v59, 
            itemPrice = v58, 
            itemDisplayPrice = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then v34.product.itemDisplayPrice else nil, 
            priceSuffix = v36, 
            model = v34.product.model, 
            isLoading = if l_FFlagUnifiedPurchaseAddSkeleton_0 then v34.isLoading else nil, 
            subtitleView = if l_FFlagUnifiedPurchaseModalLayoutRefactor_0 then v56 else nil
        })
    });
    if l_FFlagRefactorUnifiedProductDetails_0 then
        v60 = v2.createElement(v13, {
            purchaseModalType = v34.purchaseModalType, 
            product = v34.product, 
            subtitleView = v56, 
            priceSuffix = v36, 
            isLoading = if l_FFlagUnifiedPurchaseAddSkeleton_0 then v34.isLoading else nil
        });
    end;
    local v61 = if v58 then v2.createElement(l_View_0, {
        tag = "auto-y size-full-0 padding-xxsmall", 
        LayoutOrder = 2
    }, {
        Discount = v2.createElement(v12, {
            itemPrice = v58
        })
    }) else nil;
    local v62 = if next(v48) then v2.createElement(l_View_0, {
        tag = not l_FFlagUnifiedPurchaseModalLayoutRefactor_0 and l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "col gap-medium auto-y size-full-0 align-x-start align-y-start padding-top-small" or "col gap-medium auto-y size-full-0 align-x-start align-y-start", 
        LayoutOrder = l_FFlagUnifiedPurchaseModalLayoutRefactor_0 and 1 or 3
    }, {
        v48
    }) else nil;
    local v63 = {
        {
            text = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v34.purchaseModalType == v23.DeveloperSubscription then v35.Subscribe else v35.Buy, 
            variant = l_ButtonVariant_0.Emphasis, 
            onActivated = v47, 
            isDisabled = v34.buttons.isDisabled or if l_FFlagUnifiedPurchaseAddSkeleton_0 then v34.isLoading else nil, 
            ref = v46, 
            inputDelay = (not v34.buttons.buyItemEnableInputDelayed or v34.buttons.isDisabled) and 0 or 2.5
        }
    };
    local v64 = nil;
    if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v34.purchaseModalType == v23.DeveloperSubscription then
        local v65 = string.gsub(v35.SubscribeTermsAgreement or "", "<a.->(.-)</a>", "%1");
        v65 = string.gsub(v65, "<.->", "");
        v64 = v2.createElement(v4.Text, {
            LayoutOrder = l_FFlagUnifiedPurchaseModalLayoutRefactor_0 and 6 or 5, 
            Text = v65, 
            tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap"
        });
    end;
    return v2.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Medium, 
        onClose = v34.buttons.cancelActivated, 
        ref = v45, 
        disablePortal = false
    }, {
        DialogTitle = v2.createElement(l_Dialog_0.Title, {
            text = v39
        }), 
        DialogContent = if l_FFlagUnifiedPurchaseModalLayoutRefactor_0 then v2.createElement(l_View_0, {
            tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center", 
            LayoutOrder = 1
        }, {
            ProductDetailsContainer = v60, 
            DiscountSummary = if not l_FFlagRefactorUnifiedProductDetails_0 then v61 else nil
        }) else v2.createElement(l_Dialog_0.Content, nil, {
            ContentView = v2.createElement(l_View_0, {
                tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center"
            }, {
                ProductDetails = if v34.purchaseModalType == v23.MultiItem then v2.createElement(v11, {
                    amount = v59, 
                    itemPrice = v58
                }) else v2.createElement(v10, {
                    isPortrait = false, 
                    itemIcon = v34.product.itemIcon, 
                    itemName = v34.product.itemName, 
                    subtitleView = v56, 
                    itemRobuxCost = v59, 
                    itemPrice = v58, 
                    itemDisplayPrice = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then v34.product.itemDisplayPrice else nil, 
                    priceSuffix = v36, 
                    model = v34.product.model, 
                    isLoading = if l_FFlagUnifiedPurchaseAddSkeleton_0 then v34.isLoading else nil
                }), 
                PostPurchaseActions = if v30 then v62 else nil
            })
        }), 
        ActionsSection = if l_FFlagUnifiedPurchaseModalLayoutRefactor_0 then v2.createElement(l_View_0, {
            tag = "col size-full-0 auto-y gap-xlarge", 
            LayoutOrder = 3
        }, {
            PostPurchaseActions = v62, 
            BuyAndUpsell = v2.createElement(l_View_0, {
                tag = "col size-full-0 auto-y gap-medium", 
                LayoutOrder = 2
            }, {
                DialogActions = v2.createElement(l_Dialog_0.Actions, {
                    LayoutOrder = 1, 
                    orientation = v4.Enums.Orientation.Horizontal, 
                    actions = v63
                }), 
                BlackbirdUpsellBanner = if v34.BlackbirdUpsellBannerProductInfo and v34.onBlackbirdUpsellActivated then v2.createElement(l_BlackbirdUpsellBanner_0, {
                    productInfo = v34.BlackbirdUpsellBannerProductInfo, 
                    onActivated = v34.onBlackbirdUpsellActivated, 
                    LayoutOrder = 2
                }) else nil
            })
        }) else nil, 
        DialogActions = if not l_FFlagUnifiedPurchaseModalLayoutRefactor_0 then v2.createElement(l_Dialog_0.Actions, {
            LayoutOrder = 3, 
            orientation = v4.Enums.Orientation.Horizontal, 
            actions = v63
        }) else nil, 
        TestDisclaimer = if l_FFlagAddUnifiedTestPurchaseDisclaimer_0 and v34.isTestPurchase then v2.createElement(v4.Text, {
            LayoutOrder = l_FFlagUnifiedPurchaseModalLayoutRefactor_0 and 5 or 4, 
            Text = v35.TestPurchaseDisclaimer, 
            tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap"
        }) else nil, 
        SubscribeTerms = v64
    });
end;
return function(v67) --[[ Line: 410 ]] --[[ Name: UnifiedProductPurchaseModalV2Container ]]
    -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v66 (copy)
    return v2.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        ProductPurchaseModal = v2.createElement(v66, v67)
    });
end;