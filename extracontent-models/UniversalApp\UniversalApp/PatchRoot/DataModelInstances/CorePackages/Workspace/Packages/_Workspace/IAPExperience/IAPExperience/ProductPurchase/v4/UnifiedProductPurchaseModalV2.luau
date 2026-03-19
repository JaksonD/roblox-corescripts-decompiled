local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Foundation);
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_Dialog_0 = v3.Dialog;
local l_Checkbox_0 = v3.Checkbox;
local l_View_0 = v3.View;
local l_DialogSize_0 = v3.Enums.DialogSize;
local v9 = require(l_Parent_0.Generic.UnifiedProductDetails);
local v10 = require(l_Parent_0.Generic.PriceSummary);
local v11 = require(l_Parent_0.Generic.DiscountSummary);
local v12 = require(l_Parent_0.Generic.Hooks.useFocusNavigationRefs);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_1.AppLocales).Localization;
local v15 = require(l_Parent_1.Localization);
local l_LocalizationProvider_0 = v15.LocalizationProvider;
local l_useLocalization_0 = v15.Hooks.useLocalization;
local v18 = require(script.Parent.SubtitleComponentMap);
local _ = require(script.Parent.Parent.v3.UnifiedProductPurchaseModalTypes);
local v20 = require(l_Parent_0.Enums.UnifiedPurchaseModalTypeEnum);
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local l_FFlagAddUnifiedTestPurchaseDisclaimer_0 = require(l_Parent_0.Parent.SharedFlags).FFlagAddUnifiedTestPurchaseDisclaimer;
local l_FFlagUnifiedPurchaseAddSkeleton_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseAddSkeleton;
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_Parent_0.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 = require(l_Parent_0.Parent.SharedFlags).FFlagEnableDiscountInfoInUnifiedPurchaseModal;
local v26 = game:DefineFastFlag("UnifiedPurchaseFixTitleFlash", false);
local _ = require(l_Parent_0.ProductPurchase.PricingTypes);
local function v53(v28) --[[ Line: 92 ]] --[[ Name: UnifiedProductPurchaseModalV2 ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), l_FFlagAddUnifiedTestPurchaseDisclaimer_0 (copy), v2 (copy), v26 (copy), v20 (copy), v12 (copy), l_Checkbox_0 (copy), l_FFlagUnifiedPurchaseAddSkeleton_0 (copy), v18 (copy), l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_View_0 (copy), v10 (copy), v9 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), v11 (copy), v3 (copy), l_ButtonVariant_0 (copy)
    local v29 = l_useLocalization_0({
        Buy = "IAPExperience.PurchasePrompt.Action.Buy", 
        BuyItem = "IAPExperience.PurchasePrompt.Title.BuyItem", 
        BuyItemV2 = l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "IAPExperience.PurchasePrompt.Title.BuyItemV2" or nil, 
        BuyExperience = "IAPExperience.PurchasePrompt.Title.BuyExperience", 
        BuyItems = "IAPExperience.PurchasePrompt.Title.BuyItems", 
        BuyAvatar = l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "IAPExperience.PurchasePrompt.Header.BuyAvatar" or nil, 
        TestPurchaseDisclaimer = l_FFlagAddUnifiedTestPurchaseDisclaimer_0 and "IAPExperience.PurchasePrompt.Text.TestPurchase" or nil
    });
    local v30, v31 = v2.useState(v28.postPurchaseActions or {});
    local v32 = nil;
    local v33 = nil;
    if not v26 then
        local v34, v35 = v2.useState(v29.BuyItem);
        v32 = v34;
        v33 = v35;
        v2.useEffect(function() --[[ Line: 113 ]]
            -- upvalues: v28 (copy), v20 (ref), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (ref), v33 (ref), v29 (copy)
            local l_purchaseModalType_0 = v28.purchaseModalType;
            if l_purchaseModalType_0 == v20.MultiItem then
                if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
                    v33(v29.BuyAvatar);
                    return;
                else
                    v33(v29.BuyItems);
                    return;
                end;
            elseif l_purchaseModalType_0 == v20.Experience then
                v33(v29.BuyExperience);
                return;
            elseif l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
                v33(v29.BuyItemV2);
                return;
            else
                v33(v29.BuyItem);
                return;
            end;
        end, {
            v28.purchaseModalType
        });
    else
        local l_purchaseModalType_1 = v28.purchaseModalType;
        v32 = if l_purchaseModalType_1 == v20.MultiItem then v29.BuyAvatar else if l_purchaseModalType_1 == v20.Experience then v29.BuyExperience else v29.BuyItemV2;
    end;
    local v38 = nil;
    local v39 = nil;
    local v40, v41 = v12(v28.buttons.cancelActivated, v28.onBuyItemButtonMounted);
    v38 = v40;
    v39 = v41;
    v40 = v2.useCallback(function() --[[ Line: 146 ]]
        -- upvalues: v30 (copy), v28 (copy)
        if v30 and v28.setPostPurchaseActions then
            v28.setPostPurchaseActions(v30);
        end;
        v28.buttons.buyItemActivated();
    end, {
        v28.buttons.buyItemActivated, 
        v30
    });
    v2.useEffect(function() --[[ Line: 154 ]]
        -- upvalues: v31 (copy), v28 (copy)
        v31(v28.postPurchaseActions or {});
    end, {
        v28.postPurchaseActions
    });
    v41 = v2.useMemo(function() --[[ Line: 158 ]]
        -- upvalues: v30 (copy), v2 (ref), l_Checkbox_0 (ref), v28 (copy), l_FFlagUnifiedPurchaseAddSkeleton_0 (ref), v31 (copy)
        local v42 = {};
        local l_ipairs_0 = ipairs;
        local v44 = v30 or {};
        for v45, v46 in l_ipairs_0(v44) do
            v42["PostPurchaseActionCheckBox_" .. tostring(v45)] = v2.createElement(l_Checkbox_0, {
                LayoutOrder = v45, 
                size = "XSmall", 
                label = v46.label, 
                isChecked = v46.isActionSelected, 
                isDisabled = v28.buttons.isDisabled or if l_FFlagUnifiedPurchaseAddSkeleton_0 then v28.isLoading else nil, 
                onActivated = function() --[[ Line: 169 ]] --[[ Name: onActivated ]]
                    -- upvalues: v31 (ref), v45 (copy), v46 (copy)
                    v31(function(v47) --[[ Line: 170 ]]
                        -- upvalues: v45 (ref), v46 (ref)
                        local v48 = table.clone(v47);
                        v48[v45] = {
                            label = v46.label, 
                            isActionSelected = not v46.isActionSelected, 
                            actionKey = v46.actionKey
                        };
                        return v48;
                    end);
                end
            });
        end;
        return v42;
    end, {
        v30, 
        if l_FFlagUnifiedPurchaseAddSkeleton_0 then v28.isLoading else nil
    });
    local v49 = nil;
    if v28.subtitleView then
        local v50 = v18[v28.subtitleView.componentName];
        if v50 then
            v49 = v2.createElement(v50, v28.subtitleView.props);
        end;
    end;
    local v51 = if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then v28.product.itemPrice else nil;
    local v52 = if v51 then v51.priceInRobux else v28.product.itemRobuxCost;
    return v2.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Medium, 
        onClose = v28.buttons.cancelActivated, 
        ref = v38, 
        disablePortal = false
    }, {
        DialogTitle = v2.createElement(l_Dialog_0.Title, {
            text = v32
        }), 
        DialogContent = v2.createElement(l_Dialog_0.Content, nil, {
            ContentView = v2.createElement(l_View_0, {
                tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center"
            }, {
                ProductDetailsContainer = v2.createElement(l_View_0, {
                    tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center", 
                    LayoutOrder = 1
                }, {
                    ProductDetails = if v28.purchaseModalType == v20.MultiItem then v2.createElement(v10, {
                        amount = v52, 
                        itemPrice = v51
                    }) else v2.createElement(v9, {
                        isPortrait = false, 
                        itemIcon = v28.product.itemIcon, 
                        itemName = v28.product.itemName, 
                        subtitleView = v49, 
                        itemRobuxCost = v52, 
                        itemPrice = v51, 
                        itemDisplayPrice = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then v28.product.itemDisplayPrice else nil, 
                        model = v28.product.model, 
                        isLoading = if l_FFlagUnifiedPurchaseAddSkeleton_0 then v28.isLoading else nil
                    })
                }), 
                DiscountSummary = if v51 then v2.createElement(l_View_0, {
                    tag = "auto-y size-full-0 padding-xxsmall", 
                    LayoutOrder = 2
                }, {
                    Discount = v2.createElement(v11, {
                        itemPrice = v51
                    })
                }) else nil, 
                PostPurchaseActions = if next(v41) then v2.createElement(l_View_0, {
                    tag = l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "col gap-medium auto-y size-full-0 align-x-start align-y-start padding-top-small" or "col gap-medium auto-y size-full-0 align-x-start align-y-start", 
                    LayoutOrder = 3
                }, {
                    v41
                }) else nil
            })
        }), 
        DialogActions = v2.createElement(l_Dialog_0.Actions, {
            LayoutOrder = 3, 
            orientation = v3.Enums.Orientation.Horizontal, 
            actions = {
                {
                    text = v29.Buy, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = v40, 
                    isDisabled = v28.buttons.isDisabled or if l_FFlagUnifiedPurchaseAddSkeleton_0 then v28.isLoading else nil, 
                    ref = v39, 
                    inputDelay = (not v28.buttons.buyItemEnableInputDelayed or v28.buttons.isDisabled) and 0 or 2.5
                }
            }
        }), 
        TestDisclaimer = if l_FFlagAddUnifiedTestPurchaseDisclaimer_0 and v28.isTestPurchase then v2.createElement(v3.Text, {
            LayoutOrder = 4, 
            Text = v29.TestPurchaseDisclaimer, 
            tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap"
        }) else nil
    });
end;
return function(v54) --[[ Line: 279 ]] --[[ Name: UnifiedProductPurchaseModalV2Container ]]
    -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v53 (copy)
    return v2.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        ProductPurchaseModal = v2.createElement(v53, v54)
    });
end;