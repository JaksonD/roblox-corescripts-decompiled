local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Foundation);
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_Dialog_0 = v3.Dialog;
local l_DialogSize_0 = v3.Enums.DialogSize;
local l_Orientation_0 = v3.Enums.Orientation;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_1.AppLocales).Localization;
local v12 = require(l_Parent_1.Localization);
local l_LocalizationProvider_0 = v12.LocalizationProvider;
local l_useLocalization_0 = v12.Hooks.useLocalization;
local v15 = require(l_Parent_0.Generic.UnifiedProductDetails);
local v16 = require(l_Parent_0.Generic.YellowBadge);
local v17 = require(l_Parent_0.Generic.PriceSummary);
local v18 = require(l_Parent_0.Generic.ProductDetailsContainer);
local v19 = require(l_Parent_0.Generic.Hooks.useFocusNavigationRefs);
local v20 = require(l_Parent_0.Enums.UnifiedPurchaseModalTypeEnum);
local v21 = require(l_Parent_0.Utility.formatNumber);
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local v23 = require(l_Parent_0.Flags.FFlagAddCompactUnifiedUpsellModalMode);
local v24 = game:DefineFastInt("CompactUpsellModalBreakpoint", 400);
local l_FFlagRefactorUnifiedProductDetails_0 = require(l_Parent_0.Parent.SharedFlags).FFlagRefactorUnifiedProductDetails;
local _ = require(l_Parent_0.Api.PaymentsGateway.GetUpsellSuggestionsTypes);
local v27 = require(l_Parent_0.Enums.BadgeType);
local _ = require(l_Parent_0.Enums.VirtualItemBadgeType);
local _ = require(l_Parent_0.ProductPurchase.PricingTypes);
local function v38(v30) --[[ Line: 67 ]] --[[ Name: UpsellProductDetails ]]
    -- upvalues: l_useLocalization_0 (copy), v27 (copy), v23 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy), v21 (copy), l_LocalizationService_0 (copy), v16 (copy)
    local v31 = l_useLocalization_0({
        Popular = "IAPExperience.RobuxUpsell.Text.PopularItem", 
        LastPurchased = "IAPExperience.RobuxUpsell.Text.LastPurchased"
    });
    local v32 = if v30.badgeType == v27.Popular then v31.Popular else if v30.badgeType == v27.LastPurchased then v31.LastPurchased else nil;
    local v33 = v30.badgeType == v27.Popular and "icons/menu/fire_fill" or nil;
    local v34 = "size-full-1400 radius-medium padding-x-large row";
    v34 = if v30.selected then v34 .. " bg-surface-200 stroke-system-contrast stroke-thick" else v34 .. " bg-surface-300 stroke-emphasis stroke-standard";
    local v35 = v23 and v30.isCompact and "auto-xy text-title-small content-emphasis text-align-x-left" or "auto-xy text-title-large content-emphasis text-align-x-left";
    local v36 = v23 and v30.isCompact and "auto-xy text-title-small content-muted text-align-x-left" or "auto-xy text-title-large content-muted text-align-x-left";
    local v37 = v23 and v30.isCompact and "auto-xy text-title-small content-emphasis text-align-x-right" or "auto-xy text-title-large content-emphasis text-align-x-right";
    return v2.createElement(l_View_0, {
        LayoutOrder = v30.layoutOrder, 
        onActivated = v30.onSelected, 
        tag = v34, 
        Size = if v23 and v30.isCompact then UDim2.new(1, 0, 0, 40) else nil
    }, {
        LeftSide = v2.createElement(l_View_0, {
            LayoutOrder = 1, 
            tag = "row gap-small align-y-center align-x-start", 
            Size = UDim2.new(0.5, 0, 1, 0)
        }, {
            RobuxAmount = v2.createElement(l_Text_0, {
                LayoutOrder = 1, 
                Text = utf8.char(57346) .. " " .. v21(l_LocalizationService_0.RobloxLocaleId, v30.product.robuxAmount), 
                tag = v35
            }), 
            RobuxAmountBonus = v30.product.robuxAmountBeforeBonus and v2.createElement(l_Text_0, {
                LayoutOrder = 2, 
                RichText = true, 
                Text = "<s>" .. utf8.char(57346) .. v21(l_LocalizationService_0.RobloxLocaleId, v30.product.robuxAmountBeforeBonus) .. "</s>", 
                tag = v36
            })
        }), 
        RightSide = v2.createElement(l_View_0, {
            LayoutOrder = 2, 
            tag = "row align-y-center align-x-right gap-large", 
            Size = UDim2.new(0.5, 0, 1, 0)
        }, {
            Badge = if v32 then v2.createElement(v16, {
                LayoutOrder = 1, 
                Text = v32, 
                Icon = v33
            }) else nil, 
            RobuxPrice = v2.createElement(l_Text_0, {
                LayoutOrder = 2, 
                Text = v30.product.price or "", 
                tag = v37
            })
        })
    });
end;
local function v52(v39) --[[ Line: 174 ]] --[[ Name: UnifiedRobuxUpsellModalV2 ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), v23 (copy), v24 (copy), v2 (copy), v20 (copy), v19 (copy), l_FFlagRefactorUnifiedProductDetails_0 (copy), v18 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_View_0 (copy), v17 (copy), v15 (copy), v38 (copy), l_Orientation_0 (copy), l_ButtonVariant_0 (copy), l_Text_0 (copy)
    local v40 = l_useLocalization_0({
        Buy = "IAPExperience.PurchasePrompt.Action.Buy", 
        DisclosurePayment = "IAPExperience.RobuxUpsell.Text.DisclosurePayment", 
        DisclosureTermsURL = "IAPExperience.RobuxUpsell.Text.DisclosureTermsURL", 
        TermsOfUse = "IAPExperience.RobuxUpsell.Text.TermsOfUse", 
        BuyRobuxAndExperience = "IAPExperience.PurchasePrompt.BuyRobuxAndExperience", 
        BuyRobuxAndItem = "IAPExperience.PurchasePrompt.Title.BuyRobuxAndItem", 
        BuyRobuxAndItems = "IAPExperience.PurchasePrompt.Title.BuyRobuxAndItems", 
        BuyRobuxAndAvatar = l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "IAPExperience.PurchasePrompt.Header.BuyRobuxAndAvatar" or nil
    });
    local v41 = nil;
    if v23 then
        v41 = v39.screenSize.Y < v24;
    end;
    local v42, v43 = v2.useState(v40.BuyRobuxAndItem);
    v2.useEffect(function() --[[ Line: 194 ]]
        -- upvalues: v39 (copy), v20 (ref), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (ref), v43 (copy), v40 (copy)
        local l_purchaseModalType_0 = v39.purchaseModalType;
        if l_purchaseModalType_0 == v20.MultiItem then
            if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
                v43(v40.BuyRobuxAndAvatar);
                return;
            else
                v43(v40.BuyRobuxAndItems);
                return;
            end;
        elseif l_purchaseModalType_0 == v20.Experience then
            v43(v40.BuyRobuxAndExperience);
            return;
        else
            v43(v40.BuyRobuxAndItem);
            return;
        end;
    end, {
        v39.purchaseModalType
    });
    local v45 = nil;
    local v46 = nil;
    local v47, v48 = v19(v39.buttons.cancelPurchaseActivated, v39.onBuyItemButtonMounted);
    v45 = v47;
    v46 = v48;
    v2.useEffect(function() --[[ Line: 214 ]]

    end, {
        v39.upsellSuggestions
    });
    v47 = function(v49) --[[ Line: 216 ]]
        -- upvalues: v39 (copy)
        v39.onUpsellSuggestionsSelected(v49);
    end;
    v48 = string.split(v40.DisclosureTermsURL, " {termsofuse} ");
    local l_TermsOfUse_0 = v40.TermsOfUse;
    if v39.termsOfUseActivated then
        l_TermsOfUse_0 = "<u>" .. l_TermsOfUse_0 .. "</u>";
    end;
    local v51 = if l_FFlagRefactorUnifiedProductDetails_0 then v2.createElement(v18, {
        purchaseModalType = v39.purchaseModalType, 
        product = v39.product, 
        isCompact = v41, 
        model = v39.product.model
    }) else nil;
    return v2.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Medium, 
        onClose = v39.buttons.cancelPurchaseActivated, 
        ref = v45, 
        disablePortal = false
    }, {
        DialogTitle = v2.createElement(l_Dialog_0.Title, {
            text = v42
        }), 
        DialogContent = v2.createElement(l_Dialog_0.Content, nil, {
            ContentView = v2.createElement(l_View_0, {
                tag = "col gap-medium auto-y size-full-0 align-x-center align-y-start"
            }, {
                ProductDetailsContainer = v51 or v2.createElement(l_View_0, {
                    tag = "col gap-medium size-full-0 align-x-center align-y-center", 
                    LayoutOrder = 1
                }, {
                    ProductDetails = if v39.purchaseModalType == v20.MultiItem then v2.createElement(v17, {
                        amount = v39.product.itemRobuxCost
                    }) else v2.createElement(v15, {
                        isPortrait = false, 
                        isCompact = if v23 then v41 else nil, 
                        itemIcon = v39.product.itemIcon, 
                        itemName = v39.product.itemName, 
                        itemRobuxCost = v39.product.itemRobuxCost, 
                        model = v39.product.model
                    })
                }), 
                UpsellSuggestions = v2.createElement(l_View_0, {
                    LayoutOrder = 2, 
                    tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center padding-x-xsmall padding-y-small padding-bottom-xxlarge"
                }, {
                    UpsellPackage1 = v2.createElement(v38, {
                        layoutOrder = 1, 
                        product = v39.upsellSuggestions[1], 
                        selected = v39.selectedUpsellIndex == 1, 
                        isCompact = if v23 then v41 else nil, 
                        onSelected = function() --[[ Line: 277 ]] --[[ Name: onSelected ]]
                            -- upvalues: v39 (copy)
                            v39.onUpsellSuggestionsSelected(1);
                        end
                    }), 
                    UpsellPackage2 = if #v39.upsellSuggestions > 1 then v2.createElement(v38, {
                        layoutOrder = 2, 
                        product = v39.upsellSuggestions[2], 
                        selected = v39.selectedUpsellIndex == 2, 
                        isCompact = if v23 then v41 else nil, 
                        onSelected = function() --[[ Line: 287 ]] --[[ Name: onSelected ]]
                            -- upvalues: v39 (copy)
                            v39.onUpsellSuggestionsSelected(2);
                        end, 
                        badgeType = v39.upsellSuggestions[2].badgeType
                    }) else nil
                })
            })
        }), 
        DialogActions = v2.createElement(l_Dialog_0.Actions, {
            LayoutOrder = 4, 
            orientation = l_Orientation_0.Horizontal, 
            actions = {
                {
                    text = v40.Buy, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = v39.buttons.buyItemActivated, 
                    isDisabled = v39.buttons.buyItemDisabled, 
                    ref = v46, 
                    inputDelay = (not v39.buttons.buyItemEnableInputDelayed or v39.buttons.buyItemDisabled) and 0 or 2.5
                }
            }
        }), 
        DisclosureTerms = v2.createElement(l_View_0, {
            LayoutOrder = 5, 
            tag = "row wrap auto-y align-y-center align-x-center size-full-0 gap-xxsmall"
        }, {
            DisclosurePayment = v2.createElement(l_Text_0, {
                LayoutOrder = 1, 
                Text = v40.DisclosurePayment, 
                tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small"
            }), 
            BeforeText = v2.createElement(l_Text_0, {
                LayoutOrder = 2, 
                Text = v48[1], 
                tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small"
            }), 
            TextLink = v2.createElement(l_Text_0, {
                LayoutOrder = 3, 
                RichText = true, 
                Text = l_TermsOfUse_0, 
                tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small", 
                onActivated = v39.termsOfUseActivated
            }), 
            AfterText = v2.createElement(l_Text_0, {
                LayoutOrder = 4, 
                Text = v48[2], 
                tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small"
            })
        })
    });
end;
return function(v53) --[[ Line: 342 ]] --[[ Name: UnifiedRobuxUpsellModalV2Container ]]
    -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v52 (copy)
    return v2.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        UnifiedRobuxUpsellModalV2 = v2.createElement(v52, v53)
    });
end;