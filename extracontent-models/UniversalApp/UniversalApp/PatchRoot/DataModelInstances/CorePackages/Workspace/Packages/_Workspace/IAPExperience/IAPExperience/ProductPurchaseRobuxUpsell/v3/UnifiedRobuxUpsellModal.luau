local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Foundation);
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_FillBehavior_0 = v3.Enums.FillBehavior;
local l_Sheet_0 = v3.Sheet;
local l_useScaledValue_0 = v3.Hooks.useScaledValue;
local l_InputSize_0 = v3.Enums.InputSize;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_1.AppLocales).Localization;
local v13 = require(l_Parent_1.Localization);
local l_LocalizationProvider_0 = v13.LocalizationProvider;
local l_useLocalization_0 = v13.Hooks.useLocalization;
local v16 = require(l_Parent_0.Generic.UnifiedProductDetails);
local v17 = require(l_Parent_0.Generic.YellowBadge);
local v18 = require(l_Parent_0.Generic.PriceSummary);
local v19 = require(l_Parent_0.Generic.UnifiedPurchaseModalHeader);
local v20 = require(l_Parent_0.Generic.ProductDetailsContainer);
local v21 = require(l_Parent_0.Generic.Hooks.useInitialButtonDisableDelay);
local v22 = require(l_Parent_0.Generic.Hooks.useFocusNavigationRefs);
local v23 = require(l_Parent_0.Enums.UnifiedPurchaseModalTypeEnum);
local v24 = require(l_Parent_0.Utility.formatNumber);
local v25 = require(l_Parent_0.Generic.Constants);
local l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0 = v25.UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT;
local l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES_0 = v25.UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES;
local v28 = require(l_Parent_0.Flags.FFlagUnifiedPurchaseModalUiImprovements);
local v29 = require(l_Parent_0.Flags.FFlagFixUnifiedModalsMountedTwice);
local v30 = require(l_Parent_0.Flags.FFlagAddFocusNavigationToUnifiedPurchase);
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local v32 = require(l_Parent_0.Flags.FFlagAddCompactUnifiedUpsellModalMode);
local v33 = game:DefineFastInt("CompactUpsellModalBreakpoint", 400);
local l_FFlagRefactorUnifiedProductDetails_0 = require(l_Parent_0.Parent.SharedFlags).FFlagRefactorUnifiedProductDetails;
local _ = require(l_Parent_0.Api.PaymentsGateway.GetUpsellSuggestionsTypes);
local v36 = require(l_Parent_0.Enums.BadgeType);
local _ = require(l_Parent_0.Enums.VirtualItemBadgeType);
local _ = require(l_Parent_0.ProductPurchase.PricingTypes);
local function v47(v39) --[[ Line: 79 ]] --[[ Name: UpsellProductDetails ]]
    -- upvalues: l_useLocalization_0 (copy), v36 (copy), v32 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy), v24 (copy), l_LocalizationService_0 (copy), v17 (copy)
    local v40 = l_useLocalization_0({
        Popular = "IAPExperience.RobuxUpsell.Text.PopularItem", 
        LastPurchased = "IAPExperience.RobuxUpsell.Text.LastPurchased"
    });
    local v41 = if v39.badgeType == v36.Popular then v40.Popular else if v39.badgeType == v36.LastPurchased then v40.LastPurchased else nil;
    local v42 = v39.badgeType == v36.Popular and "icons/menu/fire_fill" or nil;
    local v43 = "size-full-1400 radius-medium padding-x-large row";
    v43 = if v39.selected then v43 .. " bg-surface-200 stroke-system-contrast stroke-thick" else v43 .. " bg-surface-300 stroke-emphasis stroke-standard";
    local v44 = v32 and v39.isCompact and "auto-xy text-title-small content-emphasis text-align-x-left" or "auto-xy text-title-large content-emphasis text-align-x-left";
    local v45 = v32 and v39.isCompact and "auto-xy text-title-small content-muted text-align-x-left" or "auto-xy text-title-large content-muted text-align-x-left";
    local v46 = v32 and v39.isCompact and "auto-xy text-title-small content-emphasis text-align-x-right" or "auto-xy text-title-large content-emphasis text-align-x-right";
    return v2.createElement(l_View_0, {
        LayoutOrder = v39.layoutOrder, 
        onActivated = v39.onSelected, 
        tag = v43, 
        Size = if v32 and v39.isCompact then UDim2.new(1, 0, 0, 40) else nil
    }, {
        LeftSide = v2.createElement(l_View_0, {
            LayoutOrder = 1, 
            tag = "row gap-small align-y-center align-x-start", 
            Size = UDim2.new(0.5, 0, 1, 0)
        }, {
            RobuxAmount = v2.createElement(l_Text_0, {
                LayoutOrder = 1, 
                Text = utf8.char(57346) .. " " .. v24(l_LocalizationService_0.RobloxLocaleId, v39.product.robuxAmount), 
                tag = if v32 then v44 else "auto-xy text-title-large content-emphasis text-align-x-left"
            }), 
            RobuxAmountBonus = v39.product.robuxAmountBeforeBonus and v2.createElement(l_Text_0, {
                LayoutOrder = 2, 
                RichText = true, 
                Text = "<s>" .. utf8.char(57346) .. v24(l_LocalizationService_0.RobloxLocaleId, v39.product.robuxAmountBeforeBonus) .. "</s>", 
                tag = if v32 then v45 else "auto-xy text-title-large content-muted text-align-x-left"
            })
        }), 
        RightSide = v2.createElement(l_View_0, {
            LayoutOrder = 2, 
            tag = "row align-y-center align-x-right gap-large", 
            Size = UDim2.new(0.5, 0, 1, 0)
        }, {
            Badge = if v41 then v2.createElement(v17, {
                LayoutOrder = 1, 
                Text = v41, 
                Icon = v42
            }) else nil, 
            RobuxPrice = v2.createElement(l_Text_0, {
                LayoutOrder = 2, 
                Text = v39.product.price or "", 
                tag = if v32 then v46 else "auto-xy text-title-large content-emphasis text-align-x-right"
            })
        })
    });
end;
local function v71(v48) --[[ Line: 194 ]] --[[ Name: UnifiedRobuxUpsellModal ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), v32 (copy), v33 (copy), v21 (copy), v28 (copy), v2 (copy), l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0 (copy), v23 (copy), v29 (copy), l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES_0 (copy), v30 (copy), v22 (copy), l_FFlagRefactorUnifiedProductDetails_0 (copy), v20 (copy), l_Sheet_0 (copy), l_useScaledValue_0 (copy), v19 (copy), l_View_0 (copy), v18 (copy), v16 (copy), v47 (copy), v3 (copy), l_FillBehavior_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), l_Text_0 (copy)
    local v49 = l_useLocalization_0({
        Buy = "IAPExperience.PurchasePrompt.Action.Buy", 
        DisclosurePayment = "IAPExperience.RobuxUpsell.Text.DisclosurePayment", 
        DisclosureTermsURL = "IAPExperience.RobuxUpsell.Text.DisclosureTermsURL", 
        TermsOfUse = "IAPExperience.RobuxUpsell.Text.TermsOfUse", 
        BuyRobuxAndExperience = "IAPExperience.PurchasePrompt.BuyRobuxAndExperience", 
        BuyRobuxAndItem = "IAPExperience.PurchasePrompt.Title.BuyRobuxAndItem", 
        BuyRobuxAndItems = "IAPExperience.PurchasePrompt.Title.BuyRobuxAndItems", 
        BuyRobuxAndAvatar = l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "IAPExperience.PurchasePrompt.Header.BuyRobuxAndAvatar" or nil
    });
    local v50 = nil;
    if v32 then
        v50 = v48.screenSize.Y < v33;
    end;
    local v51 = v21(false);
    local v52 = nil;
    local v53 = nil;
    if v28 then
        local v54, v55 = v2.useState(l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0);
        v52 = v54;
        v53 = v55;
    end;
    local v56, v57 = v2.useState(v49.BuyItem);
    v2.useEffect(function() --[[ Line: 226 ]]
        -- upvalues: v48 (copy), v23 (ref), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (ref), v57 (copy), v49 (copy)
        local l_purchaseModalType_0 = v48.purchaseModalType;
        if l_purchaseModalType_0 == v23.MultiItem then
            if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
                v57(v49.BuyRobuxAndAvatar);
                return;
            else
                v57(v49.BuyRobuxAndItems);
                return;
            end;
        elseif l_purchaseModalType_0 == v23.Experience then
            v57(v49.BuyRobuxAndExperience);
            return;
        else
            v57(v49.BuyRobuxAndItem);
            return;
        end;
    end, {
        v48.purchaseModalType
    });
    local v60 = v2.useCallback(function(v59) --[[ Line: 241 ]]
        -- upvalues: v48 (copy)
        if v59 and v48.onBuyItemButtonMounted then
            v48.onBuyItemButtonMounted(v59);
        end;
    end, {
        v48.onBuyItemButtonMounted
    });
    if v29 then
        v60 = v2.useCallback(function(v61) --[[ Line: 250 ]]
            -- upvalues: v48 (copy), v51 (copy)
            if v61 and v48.onBuyItemButtonMounted and not v51 then
                v48.onBuyItemButtonMounted(v61);
            end;
        end, {
            v48.onBuyItemButtonMounted, 
            v51
        });
    end;
    if v28 then
        v2.useEffect(function() --[[ Line: 260 ]]
            -- upvalues: v48 (copy), v53 (ref), l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES_0 (ref)
            if #v48.upsellSuggestions > 1 then
                v53(l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES_0);
            end;
        end, {
            v48.upsellSuggestions
        });
    end;
    local v62 = nil;
    local v63 = nil;
    if v30 then
        local v64, v65 = v22(v48.buttons.cancelPurchaseActivated, v48.onBuyItemButtonMounted);
        v62 = v64;
        v63 = v65;
    end;
    v2.useEffect(function() --[[ Line: 273 ]]

    end, {
        v48.upsellSuggestions
    });
    local function _(v66) --[[ Line: 276 ]]
        -- upvalues: v48 (copy)
        v48.onUpsellSuggestionsSelected(v66);
    end;
    local v68 = string.split(v49.DisclosureTermsURL, " {termsofuse} ");
    local l_TermsOfUse_0 = v49.TermsOfUse;
    if v48.termsOfUseActivated then
        l_TermsOfUse_0 = "<u>" .. l_TermsOfUse_0 .. "</u>";
    end;
    local v70 = if l_FFlagRefactorUnifiedProductDetails_0 then v2.createElement(v20, {
        purchaseModalType = v48.purchaseModalType, 
        product = v48.product, 
        isCompact = v50, 
        model = v48.product.model
    }) else nil;
    return v2.createElement(l_Sheet_0.Root, {
        onClose = v48.buttons.cancelPurchaseActivated, 
        snapPoints = if l_FFlagRefactorUnifiedProductDetails_0 then if v28 then {
            l_useScaledValue_0(v52), 
            0.8
        } else {
            0.52, 
            0.8
        } else nil, 
        preferCenterSheet = true, 
        ref = if v30 then if v51 then nil else v62 else nil
    }, {
        Header = v2.createElement(l_Sheet_0.Header, {
            hasCloseAffordance = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v48.hideUserRobuxBalance and true or nil else nil
        }, {
            ModalHeader = v2.createElement(v19, {
                titleText = v56, 
                robuxBalanceAmount = v48.userBalance, 
                hideUserRobuxBalance = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v48.hideUserRobuxBalance else nil
            })
        }), 
        Content = v2.createElement(l_Sheet_0.Content, {
            LayoutOrder = 2
        }, {
            SheetContentContainer = v2.createElement(l_View_0, {
                tag = "col gap-medium auto-y size-full-0 align-x-center align-y-start"
            }, {
                ProductDetailsContainer = v70 or v2.createElement(l_View_0, {
                    tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center", 
                    LayoutOrder = 1
                }, {
                    ProductDetails = if v48.purchaseModalType == v23.MultiItem then v2.createElement(v18, {
                        amount = v48.product.itemRobuxCost
                    }) else v2.createElement(v16, {
                        isPortrait = false, 
                        isCompact = if v32 then v50 else nil, 
                        itemIcon = v48.product.itemIcon, 
                        itemName = v48.product.itemName, 
                        itemRobuxCost = v48.product.itemRobuxCost, 
                        model = v48.product.model
                    })
                }), 
                UpsellSuggestions = v2.createElement(l_View_0, {
                    LayoutOrder = 2, 
                    tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center padding-x-xsmall padding-y-small padding-bottom-xxlarge"
                }, {
                    UpsellPackage1 = v2.createElement(v47, {
                        layoutOrder = 1, 
                        product = v48.upsellSuggestions[1], 
                        selected = v48.selectedUpsellIndex == 1, 
                        isCompact = if v32 then v50 else nil, 
                        onSelected = function() --[[ Line: 355 ]] --[[ Name: onSelected ]]
                            -- upvalues: v48 (copy)
                            v48.onUpsellSuggestionsSelected(1);
                        end
                    }), 
                    UpsellPackage2 = if #v48.upsellSuggestions > 1 then v2.createElement(v47, {
                        layoutOrder = 2, 
                        product = v48.upsellSuggestions[2], 
                        selected = v48.selectedUpsellIndex == 2, 
                        isCompact = if v32 then v50 else nil, 
                        onSelected = function() --[[ Line: 365 ]] --[[ Name: onSelected ]]
                            -- upvalues: v48 (copy)
                            v48.onUpsellSuggestionsSelected(2);
                        end, 
                        badgeType = v48.upsellSuggestions[2].badgeType
                    }) else nil
                })
            })
        }), 
        Actions = v2.createElement(l_Sheet_0.Actions, {
            LayoutOrder = 3
        }, {
            v2.createElement(l_View_0, {
                LayoutOrder = 1, 
                tag = "row wrap auto-xy align-y-center align-x-center size-full-0 gap-medium"
            }, {
                v2.createElement(v3.Button, {
                    LayoutOrder = 1, 
                    text = v49.Buy, 
                    onActivated = v48.buttons.buyItemActivated, 
                    inputDelay = (not v48.buttons.buyItemEnableInputDelayed or v51) and 0 or 2.5, 
                    isDisabled = v51, 
                    ref = if v30 then v63 else v60, 
                    fillBehavior = l_FillBehavior_0.Fill, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    size = if v32 and v50 then l_InputSize_0.Small else nil
                }); 
                DisclosureTerms = v2.createElement(l_View_0, {
                    LayoutOrder = 2, 
                    tag = "row wrap auto-y align-y-center align-x-center size-full-0 gap-xxsmall"
                }, {
                    DisclosurePayment = v2.createElement(l_Text_0, {
                        LayoutOrder = 1, 
                        Text = v49.DisclosurePayment, 
                        tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small"
                    }), 
                    BeforeText = v2.createElement(l_Text_0, {
                        LayoutOrder = 2, 
                        Text = v68[1], 
                        tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small"
                    }), 
                    TextLink = v2.createElement(l_Text_0, {
                        LayoutOrder = 3, 
                        RichText = true, 
                        Text = l_TermsOfUse_0, 
                        tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small", 
                        onActivated = v48.termsOfUseActivated
                    }), 
                    AfterText = v2.createElement(l_Text_0, {
                        LayoutOrder = 4, 
                        Text = v68[2], 
                        tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small"
                    })
                })
            })
        })
    });
end;
return function(v72) --[[ Line: 424 ]] --[[ Name: UnifiedRobuxUpsellModalContainer ]]
    -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v71 (copy)
    return v2.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        UnifiedRobuxUpsellModal = v2.createElement(v71, v72)
    });
end;