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
local v19 = require(script.Parent.SubtitleComponentMap);
local _ = require(script.Parent.Parent.v3.UnifiedProductPurchaseModalTypes);
local v21 = require(l_Parent_0.Enums.UnifiedPurchaseModalTypeEnum);
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local l_FFlagAddUnifiedTestPurchaseDisclaimer_0 = require(l_Parent_0.Parent.SharedFlags).FFlagAddUnifiedTestPurchaseDisclaimer;
local l_FFlagUnifiedPurchaseAddSkeleton_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseAddSkeleton;
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_Parent_0.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 = require(l_Parent_0.Parent.SharedFlags).FFlagEnableDiscountInfoInUnifiedPurchaseModal;
local l_FFlagUnifiedPurchaseModalLayoutRefactor_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseModalLayoutRefactor;
local v28 = game:DefineFastFlag("FixCheckboxesMissingUnifiedPurchase", false);
local v29 = game:DefineFastFlag("UnifiedPurchaseFixTitleFlash", false);
local _ = require(l_Parent_0.ProductPurchase.PricingTypes);
local function v61(v31) --[[ Line: 104 ]] --[[ Name: UnifiedProductPurchaseModalV2 ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), l_FFlagAddUnifiedTestPurchaseDisclaimer_0 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), v21 (copy), v2 (copy), v29 (copy), v13 (copy), l_Checkbox_0 (copy), l_FFlagUnifiedPurchaseAddSkeleton_0 (copy), v19 (copy), l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 (copy), l_View_0 (copy), v11 (copy), v10 (copy), v12 (copy), l_FFlagUnifiedPurchaseModalLayoutRefactor_0 (copy), l_ButtonVariant_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), v28 (copy), v4 (copy), l_BlackbirdUpsellBanner_0 (copy)
    local v32 = l_useLocalization_0({
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
    local v33 = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v31.purchaseModalType == v21.DeveloperSubscription then v32.PerMonth else nil;
    local v34, v35 = v2.useState(v31.postPurchaseActions or {});
    local v36 = nil;
    local v37 = nil;
    if not v29 then
        local v38, v39 = v2.useState(v32.BuyItem);
        v36 = v38;
        v37 = v39;
        v2.useEffect(function() --[[ Line: 134 ]]
            -- upvalues: v31 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (ref), v21 (ref), v37 (ref), v32 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (ref)
            local l_purchaseModalType_0 = v31.purchaseModalType;
            if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and l_purchaseModalType_0 == v21.DeveloperSubscription then
                v37(v32.GetSubscription);
                return;
            elseif l_purchaseModalType_0 == v21.MultiItem then
                if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
                    v37(v32.BuyAvatar);
                    return;
                else
                    v37(v32.BuyItems);
                    return;
                end;
            elseif l_purchaseModalType_0 == v21.Experience then
                v37(v32.BuyExperience);
                return;
            elseif l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
                v37(v32.BuyItemV2);
                return;
            else
                v37(v32.BuyItem);
                return;
            end;
        end, {
            v31.purchaseModalType
        });
    else
        local l_purchaseModalType_1 = v31.purchaseModalType;
        v36 = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and l_purchaseModalType_1 == v21.DeveloperSubscription then v32.GetSubscription else if l_purchaseModalType_1 == v21.MultiItem then v32.BuyAvatar else if l_purchaseModalType_1 == v21.Experience then v32.BuyExperience else v32.BuyItemV2;
    end;
    local v42 = nil;
    local v43 = nil;
    local v44, v45 = v13(v31.buttons.cancelActivated, v31.onBuyItemButtonMounted);
    v42 = v44;
    v43 = v45;
    v44 = v2.useCallback(function() --[[ Line: 177 ]]
        -- upvalues: v34 (copy), v31 (copy)
        if v34 and v31.setPostPurchaseActions then
            v31.setPostPurchaseActions(v34);
        end;
        v31.buttons.buyItemActivated();
    end, {
        v31.buttons.buyItemActivated, 
        v34
    });
    v2.useEffect(function() --[[ Line: 185 ]]
        -- upvalues: v35 (copy), v31 (copy)
        v35(v31.postPurchaseActions or {});
    end, {
        v31.postPurchaseActions
    });
    v45 = v2.useMemo(function() --[[ Line: 189 ]]
        -- upvalues: v34 (copy), v2 (ref), l_Checkbox_0 (ref), v31 (copy), l_FFlagUnifiedPurchaseAddSkeleton_0 (ref), v35 (copy)
        local v46 = {};
        local l_ipairs_0 = ipairs;
        local v48 = v34 or {};
        for v49, v50 in l_ipairs_0(v48) do
            v46["PostPurchaseActionCheckBox_" .. tostring(v49)] = v2.createElement(l_Checkbox_0, {
                LayoutOrder = v49, 
                size = "XSmall", 
                label = v50.label, 
                isChecked = v50.isActionSelected, 
                isDisabled = v31.buttons.isDisabled or if l_FFlagUnifiedPurchaseAddSkeleton_0 then v31.isLoading else nil, 
                onActivated = function() --[[ Line: 200 ]] --[[ Name: onActivated ]]
                    -- upvalues: v35 (ref), v49 (copy), v50 (copy)
                    v35(function(v51) --[[ Line: 201 ]]
                        -- upvalues: v49 (ref), v50 (ref)
                        local v52 = table.clone(v51);
                        v52[v49] = {
                            label = v50.label, 
                            isActionSelected = not v50.isActionSelected, 
                            actionKey = v50.actionKey
                        };
                        return v52;
                    end);
                end
            });
        end;
        return v46;
    end, {
        v34, 
        if l_FFlagUnifiedPurchaseAddSkeleton_0 then v31.isLoading else nil
    });
    local v53 = nil;
    if v31.subtitleView then
        local v54 = v19[v31.subtitleView.componentName];
        if v54 then
            v53 = v2.createElement(v54, v31.subtitleView.props);
        end;
    end;
    local v55 = if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then v31.product.itemPrice else nil;
    local v56 = if v55 then v55.priceInRobux else v31.product.itemRobuxCost;
    local v57 = v2.createElement(l_View_0, {
        tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center", 
        LayoutOrder = 1
    }, {
        ProductDetails = if v31.purchaseModalType == v21.MultiItem then v2.createElement(v11, {
            amount = v56, 
            itemPrice = v55
        }) else v2.createElement(v10, {
            isPortrait = false, 
            itemIcon = v31.product.itemIcon, 
            itemName = v31.product.itemName, 
            itemRobuxCost = v56, 
            itemPrice = v55, 
            itemDisplayPrice = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then v31.product.itemDisplayPrice else nil, 
            priceSuffix = v33, 
            model = v31.product.model, 
            isLoading = if l_FFlagUnifiedPurchaseAddSkeleton_0 then v31.isLoading else nil
        })
    });
    local v58 = if v55 then v2.createElement(l_View_0, {
        tag = "auto-y size-full-0 padding-xxsmall", 
        LayoutOrder = 2
    }, {
        Discount = v2.createElement(v12, {
            itemPrice = v55
        })
    }) else nil;
    local v59 = if next(v45) then v2.createElement(l_View_0, {
        tag = not l_FFlagUnifiedPurchaseModalLayoutRefactor_0 and l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "col gap-medium auto-y size-full-0 align-x-start align-y-start padding-top-small" or "col gap-medium auto-y size-full-0 align-x-start align-y-start", 
        LayoutOrder = l_FFlagUnifiedPurchaseModalLayoutRefactor_0 and 1 or 3
    }, {
        v45
    }) else nil;
    local v60 = {
        {
            text = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v31.purchaseModalType == v21.DeveloperSubscription then v32.Subscribe else v32.Buy, 
            variant = l_ButtonVariant_0.Emphasis, 
            onActivated = v44, 
            isDisabled = v31.buttons.isDisabled or if l_FFlagUnifiedPurchaseAddSkeleton_0 then v31.isLoading else nil, 
            ref = v43, 
            inputDelay = (not v31.buttons.buyItemEnableInputDelayed or v31.buttons.isDisabled) and 0 or 2.5
        }
    };
    return v2.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Medium, 
        onClose = v31.buttons.cancelActivated, 
        ref = v42, 
        disablePortal = false
    }, {
        DialogTitle = v2.createElement(l_Dialog_0.Title, {
            text = v36
        }), 
        DialogContent = if l_FFlagUnifiedPurchaseModalLayoutRefactor_0 then v2.createElement(l_View_0, {
            tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center", 
            LayoutOrder = 1
        }, {
            ProductDetailsContainer = v57, 
            DiscountSummary = v58
        }) else v2.createElement(l_Dialog_0.Content, nil, {
            ContentView = v2.createElement(l_View_0, {
                tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center"
            }, {
                ProductDetails = if v31.purchaseModalType == v21.MultiItem then v2.createElement(v11, {
                    amount = v56, 
                    itemPrice = v55
                }) else v2.createElement(v10, {
                    isPortrait = false, 
                    itemIcon = v31.product.itemIcon, 
                    itemName = v31.product.itemName, 
                    subtitleView = v53, 
                    itemRobuxCost = v56, 
                    itemPrice = v55, 
                    itemDisplayPrice = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then v31.product.itemDisplayPrice else nil, 
                    priceSuffix = v33, 
                    model = v31.product.model, 
                    isLoading = if l_FFlagUnifiedPurchaseAddSkeleton_0 then v31.isLoading else nil
                }), 
                PostPurchaseActions = if v28 then v59 else nil
            })
        }), 
        ActionsSection = if l_FFlagUnifiedPurchaseModalLayoutRefactor_0 then v2.createElement(l_View_0, {
            tag = "col size-full-0 auto-y gap-xlarge", 
            LayoutOrder = 3
        }, {
            PostPurchaseActions = v59, 
            BuyAndUpsell = v2.createElement(l_View_0, {
                tag = "col size-full-0 auto-y gap-medium", 
                LayoutOrder = 2
            }, {
                DialogActions = v2.createElement(l_Dialog_0.Actions, {
                    LayoutOrder = 1, 
                    orientation = v4.Enums.Orientation.Horizontal, 
                    actions = v60
                }), 
                BlackbirdUpsellBanner = if v31.BlackbirdUpsellBannerProductInfo and v31.onBlackbirdUpsellActivated then v2.createElement(l_BlackbirdUpsellBanner_0, {
                    productInfo = v31.BlackbirdUpsellBannerProductInfo, 
                    onActivated = v31.onBlackbirdUpsellActivated, 
                    LayoutOrder = 2
                }) else nil
            })
        }) else nil, 
        DialogActions = if not l_FFlagUnifiedPurchaseModalLayoutRefactor_0 then v2.createElement(l_Dialog_0.Actions, {
            LayoutOrder = 3, 
            orientation = v4.Enums.Orientation.Horizontal, 
            actions = v60
        }) else nil, 
        TestDisclaimer = if l_FFlagAddUnifiedTestPurchaseDisclaimer_0 and v31.isTestPurchase then v2.createElement(v4.Text, {
            LayoutOrder = l_FFlagUnifiedPurchaseModalLayoutRefactor_0 and 5 or 4, 
            Text = v32.TestPurchaseDisclaimer, 
            tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap"
        }) else nil
    });
end;
return function(v62) --[[ Line: 378 ]] --[[ Name: UnifiedProductPurchaseModalV2Container ]]
    -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v61 (copy)
    return v2.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        ProductPurchaseModal = v2.createElement(v61, v62)
    });
end;