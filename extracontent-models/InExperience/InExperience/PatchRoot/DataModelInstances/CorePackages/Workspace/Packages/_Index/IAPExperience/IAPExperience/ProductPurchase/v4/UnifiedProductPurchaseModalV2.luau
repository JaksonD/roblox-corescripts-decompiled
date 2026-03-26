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
local v13 = require(l_Parent_0.Generic.Hooks.useFocusNavigationRefs);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_1.AppLocales).Localization;
local v16 = require(l_Parent_1.Localization);
local l_LocalizationProvider_0 = v16.LocalizationProvider;
local l_useLocalization_0 = v16.Hooks.useLocalization;
local l_UrlBuilder_0 = require(l_Parent_1.UrlBuilder).UrlBuilder;
local v20 = require(script.Parent.SubtitleComponentMap);
local _ = require(script.Parent.Parent.v3.UnifiedProductPurchaseModalTypes);
local v22 = require(l_Parent_0.Enums.UnifiedPurchaseModalTypeEnum);
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local l_FFlagAddUnifiedTestPurchaseDisclaimer_0 = require(l_Parent_0.Parent.SharedFlags).FFlagAddUnifiedTestPurchaseDisclaimer;
local l_FFlagUnifiedPurchaseAddSkeleton_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseAddSkeleton;
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_Parent_0.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 = require(l_Parent_0.Parent.SharedFlags).FFlagEnableDiscountInfoInUnifiedPurchaseModal;
local l_FFlagUnifiedPurchaseModalLayoutRefactor_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseModalLayoutRefactor;
local v29 = game:DefineFastFlag("FixCheckboxesMissingUnifiedPurchase", false);
local v30 = game:DefineFastFlag("UnifiedPurchaseFixTitleFlash", false);
local _ = require(l_Parent_0.ProductPurchase.PricingTypes);
local function v64(v32) --[[ Line: 107 ]] --[[ Name: UnifiedProductPurchaseModalV2 ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), l_FFlagAddUnifiedTestPurchaseDisclaimer_0 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), l_UrlBuilder_0 (copy), v22 (copy), v2 (copy), v30 (copy), v13 (copy), l_Checkbox_0 (copy), l_FFlagUnifiedPurchaseAddSkeleton_0 (copy), v20 (copy), l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 (copy), l_View_0 (copy), v11 (copy), v10 (copy), l_FFlagUnifiedPurchaseModalLayoutRefactor_0 (copy), v12 (copy), l_ButtonVariant_0 (copy), v4 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), v29 (copy), l_BlackbirdUpsellBanner_0 (copy)
    local v33 = l_useLocalization_0({
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
    local v34 = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v32.purchaseModalType == v22.DeveloperSubscription then v33.PerMonth else nil;
    local v35, v36 = v2.useState(v32.postPurchaseActions or {});
    local v37 = nil;
    local v38 = nil;
    if not v30 then
        local v39, v40 = v2.useState(v33.BuyItem);
        v37 = v39;
        v38 = v40;
        v2.useEffect(function() --[[ Line: 144 ]]
            -- upvalues: v32 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (ref), v22 (ref), v38 (ref), v33 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (ref)
            local l_purchaseModalType_0 = v32.purchaseModalType;
            if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and l_purchaseModalType_0 == v22.DeveloperSubscription then
                v38(v33.GetSubscription);
                return;
            elseif l_purchaseModalType_0 == v22.MultiItem then
                if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
                    v38(v33.BuyAvatar);
                    return;
                else
                    v38(v33.BuyItems);
                    return;
                end;
            elseif l_purchaseModalType_0 == v22.Experience then
                v38(v33.BuyExperience);
                return;
            elseif l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
                v38(v33.BuyItemV2);
                return;
            else
                v38(v33.BuyItem);
                return;
            end;
        end, {
            v32.purchaseModalType
        });
    else
        local l_purchaseModalType_1 = v32.purchaseModalType;
        v37 = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and l_purchaseModalType_1 == v22.DeveloperSubscription then v33.GetSubscription else if l_purchaseModalType_1 == v22.MultiItem then v33.BuyAvatar else if l_purchaseModalType_1 == v22.Experience then v33.BuyExperience else v33.BuyItemV2;
    end;
    local v43 = nil;
    local v44 = nil;
    local v45, v46 = v13(v32.buttons.cancelActivated, v32.onBuyItemButtonMounted);
    v43 = v45;
    v44 = v46;
    v45 = v2.useCallback(function() --[[ Line: 187 ]]
        -- upvalues: v35 (copy), v32 (copy)
        if v35 and v32.setPostPurchaseActions then
            v32.setPostPurchaseActions(v35);
        end;
        v32.buttons.buyItemActivated();
    end, {
        v32.buttons.buyItemActivated, 
        v35
    });
    v2.useEffect(function() --[[ Line: 195 ]]
        -- upvalues: v36 (copy), v32 (copy)
        v36(v32.postPurchaseActions or {});
    end, {
        v32.postPurchaseActions
    });
    v46 = v2.useMemo(function() --[[ Line: 199 ]]
        -- upvalues: v35 (copy), v2 (ref), l_Checkbox_0 (ref), v32 (copy), l_FFlagUnifiedPurchaseAddSkeleton_0 (ref), v36 (copy)
        local v47 = {};
        local l_ipairs_0 = ipairs;
        local v49 = v35 or {};
        for v50, v51 in l_ipairs_0(v49) do
            v47["PostPurchaseActionCheckBox_" .. tostring(v50)] = v2.createElement(l_Checkbox_0, {
                LayoutOrder = v50, 
                size = "XSmall", 
                label = v51.label, 
                isChecked = v51.isActionSelected, 
                isDisabled = v32.buttons.isDisabled or if l_FFlagUnifiedPurchaseAddSkeleton_0 then v32.isLoading else nil, 
                onActivated = function() --[[ Line: 210 ]] --[[ Name: onActivated ]]
                    -- upvalues: v36 (ref), v50 (copy), v51 (copy)
                    v36(function(v52) --[[ Line: 211 ]]
                        -- upvalues: v50 (ref), v51 (ref)
                        local v53 = table.clone(v52);
                        v53[v50] = {
                            label = v51.label, 
                            isActionSelected = not v51.isActionSelected, 
                            actionKey = v51.actionKey
                        };
                        return v53;
                    end);
                end
            });
        end;
        return v47;
    end, {
        v35, 
        if l_FFlagUnifiedPurchaseAddSkeleton_0 then v32.isLoading else nil
    });
    local v54 = nil;
    if v32.subtitleView then
        local v55 = v20[v32.subtitleView.componentName];
        if v55 then
            v54 = v2.createElement(v55, v32.subtitleView.props);
        end;
    end;
    local v56 = if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then v32.product.itemPrice else nil;
    local v57 = if v56 then v56.priceInRobux else v32.product.itemRobuxCost;
    local v58 = v2.createElement(l_View_0, {
        tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center", 
        LayoutOrder = 1
    }, {
        ProductDetails = if v32.purchaseModalType == v22.MultiItem then v2.createElement(v11, {
            amount = v57, 
            itemPrice = v56
        }) else v2.createElement(v10, {
            isPortrait = false, 
            itemIcon = v32.product.itemIcon, 
            itemName = v32.product.itemName, 
            itemRobuxCost = v57, 
            itemPrice = v56, 
            itemDisplayPrice = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then v32.product.itemDisplayPrice else nil, 
            priceSuffix = v34, 
            model = v32.product.model, 
            isLoading = if l_FFlagUnifiedPurchaseAddSkeleton_0 then v32.isLoading else nil, 
            subtitleView = if l_FFlagUnifiedPurchaseModalLayoutRefactor_0 then v54 else nil
        })
    });
    local v59 = if v56 then v2.createElement(l_View_0, {
        tag = "auto-y size-full-0 padding-xxsmall", 
        LayoutOrder = 2
    }, {
        Discount = v2.createElement(v12, {
            itemPrice = v56
        })
    }) else nil;
    local v60 = if next(v46) then v2.createElement(l_View_0, {
        tag = not l_FFlagUnifiedPurchaseModalLayoutRefactor_0 and l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "col gap-medium auto-y size-full-0 align-x-start align-y-start padding-top-small" or "col gap-medium auto-y size-full-0 align-x-start align-y-start", 
        LayoutOrder = l_FFlagUnifiedPurchaseModalLayoutRefactor_0 and 1 or 3
    }, {
        v46
    }) else nil;
    local v61 = {
        {
            text = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v32.purchaseModalType == v22.DeveloperSubscription then v33.Subscribe else v33.Buy, 
            variant = l_ButtonVariant_0.Emphasis, 
            onActivated = v45, 
            isDisabled = v32.buttons.isDisabled or if l_FFlagUnifiedPurchaseAddSkeleton_0 then v32.isLoading else nil, 
            ref = v44, 
            inputDelay = (not v32.buttons.buyItemEnableInputDelayed or v32.buttons.isDisabled) and 0 or 2.5
        }
    };
    local v62 = nil;
    if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v32.purchaseModalType == v22.DeveloperSubscription then
        local v63 = string.gsub(v33.SubscribeTermsAgreement or "", "<a.->(.-)</a>", "%1");
        v63 = string.gsub(v63, "<.->", "");
        v62 = v2.createElement(v4.Text, {
            LayoutOrder = l_FFlagUnifiedPurchaseModalLayoutRefactor_0 and 6 or 5, 
            Text = v63, 
            tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap"
        });
    end;
    return v2.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Medium, 
        onClose = v32.buttons.cancelActivated, 
        ref = v43, 
        disablePortal = false
    }, {
        DialogTitle = v2.createElement(l_Dialog_0.Title, {
            text = v37
        }), 
        DialogContent = if l_FFlagUnifiedPurchaseModalLayoutRefactor_0 then v2.createElement(l_View_0, {
            tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center", 
            LayoutOrder = 1
        }, {
            ProductDetailsContainer = v58, 
            DiscountSummary = v59
        }) else v2.createElement(l_Dialog_0.Content, nil, {
            ContentView = v2.createElement(l_View_0, {
                tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center"
            }, {
                ProductDetails = if v32.purchaseModalType == v22.MultiItem then v2.createElement(v11, {
                    amount = v57, 
                    itemPrice = v56
                }) else v2.createElement(v10, {
                    isPortrait = false, 
                    itemIcon = v32.product.itemIcon, 
                    itemName = v32.product.itemName, 
                    subtitleView = v54, 
                    itemRobuxCost = v57, 
                    itemPrice = v56, 
                    itemDisplayPrice = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then v32.product.itemDisplayPrice else nil, 
                    priceSuffix = v34, 
                    model = v32.product.model, 
                    isLoading = if l_FFlagUnifiedPurchaseAddSkeleton_0 then v32.isLoading else nil
                }), 
                PostPurchaseActions = if v29 then v60 else nil
            })
        }), 
        ActionsSection = if l_FFlagUnifiedPurchaseModalLayoutRefactor_0 then v2.createElement(l_View_0, {
            tag = "col size-full-0 auto-y gap-xlarge", 
            LayoutOrder = 3
        }, {
            PostPurchaseActions = v60, 
            BuyAndUpsell = v2.createElement(l_View_0, {
                tag = "col size-full-0 auto-y gap-medium", 
                LayoutOrder = 2
            }, {
                DialogActions = v2.createElement(l_Dialog_0.Actions, {
                    LayoutOrder = 1, 
                    orientation = v4.Enums.Orientation.Horizontal, 
                    actions = v61
                }), 
                BlackbirdUpsellBanner = if v32.BlackbirdUpsellBannerProductInfo and v32.onBlackbirdUpsellActivated then v2.createElement(l_BlackbirdUpsellBanner_0, {
                    productInfo = v32.BlackbirdUpsellBannerProductInfo, 
                    onActivated = v32.onBlackbirdUpsellActivated, 
                    LayoutOrder = 2
                }) else nil
            })
        }) else nil, 
        DialogActions = if not l_FFlagUnifiedPurchaseModalLayoutRefactor_0 then v2.createElement(l_Dialog_0.Actions, {
            LayoutOrder = 3, 
            orientation = v4.Enums.Orientation.Horizontal, 
            actions = v61
        }) else nil, 
        TestDisclaimer = if l_FFlagAddUnifiedTestPurchaseDisclaimer_0 and v32.isTestPurchase then v2.createElement(v4.Text, {
            LayoutOrder = l_FFlagUnifiedPurchaseModalLayoutRefactor_0 and 5 or 4, 
            Text = v33.TestPurchaseDisclaimer, 
            tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap"
        }) else nil, 
        SubscribeTerms = v62
    });
end;
return function(v65) --[[ Line: 404 ]] --[[ Name: UnifiedProductPurchaseModalV2Container ]]
    -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v64 (copy)
    return v2.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        ProductPurchaseModal = v2.createElement(v64, v65)
    });
end;