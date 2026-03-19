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
local v20 = require(l_Parent_0.Generic.Hooks.useInitialButtonDisableDelay);
local v21 = require(l_Parent_0.Generic.Hooks.useFocusNavigationRefs);
local v22 = require(l_Parent_0.Enums.UnifiedPurchaseModalTypeEnum);
local v23 = require(l_Parent_0.Utility.formatNumber);
local v24 = require(l_Parent_0.Generic.Constants);
local l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0 = v24.UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT;
local l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES_0 = v24.UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES;
local v27 = require(l_Parent_0.Flags.FFlagUnifiedPurchaseModalUiImprovements);
local v28 = require(l_Parent_0.Flags.FFlagFixUnifiedModalsMountedTwice);
local v29 = require(l_Parent_0.Flags.FFlagAddFocusNavigationToUnifiedPurchase);
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local v31 = require(l_Parent_0.Flags.FFlagAddCompactUnifiedUpsellModalMode);
local v32 = game:DefineFastInt("CompactUpsellModalBreakpoint", 400);
local _ = require(l_Parent_0.Api.PaymentsGateway.GetUpsellSuggestionsTypes);
local v34 = require(l_Parent_0.Enums.BadgeType);
local _ = require(l_Parent_0.Enums.VirtualItemBadgeType);
local function v44(v36) --[[ Line: 73 ]] --[[ Name: UpsellProductDetails ]]
    -- upvalues: l_useLocalization_0 (copy), v34 (copy), v31 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy), v23 (copy), l_LocalizationService_0 (copy), v17 (copy)
    local v37 = l_useLocalization_0({
        Popular = "IAPExperience.RobuxUpsell.Text.PopularItem", 
        LastPurchased = "IAPExperience.RobuxUpsell.Text.LastPurchased"
    });
    local v38 = if v36.badgeType == v34.Popular then v37.Popular else if v36.badgeType == v34.LastPurchased then v37.LastPurchased else nil;
    local v39 = v36.badgeType == v34.Popular and "icons/menu/fire_fill" or nil;
    local v40 = "size-full-1400 radius-medium padding-x-large row";
    v40 = if v36.selected then v40 .. " bg-surface-200 stroke-system-contrast stroke-thick" else v40 .. " bg-surface-300 stroke-emphasis stroke-standard";
    local v41 = v31 and v36.isCompact and "auto-xy text-title-small content-emphasis text-align-x-left" or "auto-xy text-title-large content-emphasis text-align-x-left";
    local v42 = v31 and v36.isCompact and "auto-xy text-title-small content-muted text-align-x-left" or "auto-xy text-title-large content-muted text-align-x-left";
    local v43 = v31 and v36.isCompact and "auto-xy text-title-small content-emphasis text-align-x-right" or "auto-xy text-title-large content-emphasis text-align-x-right";
    return v2.createElement(l_View_0, {
        LayoutOrder = v36.layoutOrder, 
        onActivated = v36.onSelected, 
        tag = v40, 
        Size = if v31 and v36.isCompact then UDim2.new(1, 0, 0, 40) else nil
    }, {
        LeftSide = v2.createElement(l_View_0, {
            LayoutOrder = 1, 
            tag = "row gap-small align-y-center align-x-start", 
            Size = UDim2.new(0.5, 0, 1, 0)
        }, {
            RobuxAmount = v2.createElement(l_Text_0, {
                LayoutOrder = 1, 
                Text = utf8.char(57346) .. " " .. v23(l_LocalizationService_0.RobloxLocaleId, v36.product.robuxAmount), 
                tag = if v31 then v41 else "auto-xy text-title-large content-emphasis text-align-x-left"
            }), 
            RobuxAmountBonus = v36.product.robuxAmountBeforeBonus and v2.createElement(l_Text_0, {
                LayoutOrder = 2, 
                RichText = true, 
                Text = "<s>" .. utf8.char(57346) .. v23(l_LocalizationService_0.RobloxLocaleId, v36.product.robuxAmountBeforeBonus) .. "</s>", 
                tag = if v31 then v42 else "auto-xy text-title-large content-muted text-align-x-left"
            })
        }), 
        RightSide = v2.createElement(l_View_0, {
            LayoutOrder = 2, 
            tag = "row align-y-center align-x-right gap-large", 
            Size = UDim2.new(0.5, 0, 1, 0)
        }, {
            Badge = if v38 then v2.createElement(v17, {
                LayoutOrder = 1, 
                Text = v38, 
                Icon = v39
            }) else nil, 
            RobuxPrice = v2.createElement(l_Text_0, {
                LayoutOrder = 2, 
                Text = v36.product.price or "", 
                tag = if v31 then v43 else "auto-xy text-title-large content-emphasis text-align-x-right"
            })
        })
    });
end;
local function v67(v45) --[[ Line: 196 ]] --[[ Name: UnifiedRobuxUpsellModal ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), v31 (copy), v32 (copy), v20 (copy), v27 (copy), v2 (copy), l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0 (copy), v22 (copy), v28 (copy), l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES_0 (copy), v29 (copy), v21 (copy), l_Sheet_0 (copy), l_useScaledValue_0 (copy), v19 (copy), l_View_0 (copy), v18 (copy), v16 (copy), v44 (copy), v3 (copy), l_FillBehavior_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), l_Text_0 (copy)
    local v46 = l_useLocalization_0({
        Buy = "IAPExperience.PurchasePrompt.Action.Buy", 
        DisclosurePayment = "IAPExperience.RobuxUpsell.Text.DisclosurePayment", 
        DisclosureTermsURL = "IAPExperience.RobuxUpsell.Text.DisclosureTermsURL", 
        TermsOfUse = "IAPExperience.RobuxUpsell.Text.TermsOfUse", 
        BuyRobuxAndExperience = "IAPExperience.PurchasePrompt.BuyRobuxAndExperience", 
        BuyRobuxAndItem = "IAPExperience.PurchasePrompt.Title.BuyRobuxAndItem", 
        BuyRobuxAndItems = "IAPExperience.PurchasePrompt.Title.BuyRobuxAndItems", 
        BuyRobuxAndAvatar = l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "IAPExperience.PurchasePrompt.Header.BuyRobuxAndAvatar" or nil
    });
    local v47 = nil;
    if v31 then
        v47 = v45.screenSize.Y < v32;
    end;
    local v48 = v20(false);
    local v49 = nil;
    local v50 = nil;
    if v27 then
        local v51, v52 = v2.useState(l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0);
        v49 = v51;
        v50 = v52;
    end;
    local v53, v54 = v2.useState(v46.BuyItem);
    v2.useEffect(function() --[[ Line: 228 ]]
        -- upvalues: v45 (copy), v22 (ref), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (ref), v54 (copy), v46 (copy)
        local l_purchaseModalType_0 = v45.purchaseModalType;
        if l_purchaseModalType_0 == v22.MultiItem then
            if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
                v54(v46.BuyRobuxAndAvatar);
                return;
            else
                v54(v46.BuyRobuxAndItems);
                return;
            end;
        elseif l_purchaseModalType_0 == v22.Experience then
            v54(v46.BuyRobuxAndExperience);
            return;
        else
            v54(v46.BuyRobuxAndItem);
            return;
        end;
    end, {
        v45.purchaseModalType
    });
    local v57 = v2.useCallback(function(v56) --[[ Line: 243 ]]
        -- upvalues: v45 (copy)
        if v56 and v45.onBuyItemButtonMounted then
            v45.onBuyItemButtonMounted(v56);
        end;
    end, {
        v45.onBuyItemButtonMounted
    });
    if v28 then
        v57 = v2.useCallback(function(v58) --[[ Line: 252 ]]
            -- upvalues: v45 (copy), v48 (copy)
            if v58 and v45.onBuyItemButtonMounted and not v48 then
                v45.onBuyItemButtonMounted(v58);
            end;
        end, {
            v45.onBuyItemButtonMounted, 
            v48
        });
    end;
    if v27 then
        v2.useEffect(function() --[[ Line: 262 ]]
            -- upvalues: v45 (copy), v50 (ref), l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES_0 (ref)
            if #v45.upsellSuggestions > 1 then
                v50(l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES_0);
            end;
        end, {
            v45.upsellSuggestions
        });
    end;
    local v59 = nil;
    local v60 = nil;
    if v29 then
        local v61, v62 = v21(v45.buttons.cancelPurchaseActivated, v45.onBuyItemButtonMounted);
        v59 = v61;
        v60 = v62;
    end;
    v2.useEffect(function() --[[ Line: 275 ]]

    end, {
        v45.upsellSuggestions
    });
    local function _(v63) --[[ Line: 278 ]]
        -- upvalues: v45 (copy)
        v45.onUpsellSuggestionsSelected(v63);
    end;
    local v65 = string.split(v46.DisclosureTermsURL, " {termsofuse} ");
    local l_TermsOfUse_0 = v46.TermsOfUse;
    if v45.termsOfUseActivated then
        l_TermsOfUse_0 = "<u>" .. l_TermsOfUse_0 .. "</u>";
    end;
    return v2.createElement(l_Sheet_0.Root, {
        onClose = v45.buttons.cancelPurchaseActivated, 
        snapPoints = if v27 then {
            l_useScaledValue_0(v49), 
            0.8
        } else {
            0.52, 
            0.8
        }, 
        preferCenterSheet = true, 
        ref = if v29 then if v48 then nil else v59 else nil
    }, {
        Header = v2.createElement(l_Sheet_0.Header, {
            hasCloseAffordance = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v45.hideUserRobuxBalance and true or nil else nil
        }, {
            ModalHeader = v2.createElement(v19, {
                titleText = v53, 
                robuxBalanceAmount = v45.userBalance, 
                hideUserRobuxBalance = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v45.hideUserRobuxBalance else nil
            })
        }), 
        Content = v2.createElement(l_Sheet_0.Content, {
            LayoutOrder = 2
        }, {
            SheetContentContainer = v2.createElement(l_View_0, {
                tag = "col gap-medium auto-y size-full-0 align-x-center align-y-start"
            }, {
                ProductDetailsContainer = v2.createElement(l_View_0, {
                    tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center", 
                    LayoutOrder = 1
                }, {
                    ProductDetails = if v45.purchaseModalType == v22.MultiItem then v2.createElement(v18, {
                        amount = v45.product.itemRobuxCost
                    }) else v2.createElement(v16, {
                        isPortrait = false, 
                        isCompact = if v31 then v47 else nil, 
                        itemIcon = v45.product.itemIcon, 
                        itemName = v45.product.itemName, 
                        itemRobuxCost = v45.product.itemRobuxCost, 
                        model = v45.product.model
                    })
                }), 
                UpsellSuggestions = v2.createElement(l_View_0, {
                    LayoutOrder = 2, 
                    tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center padding-x-xsmall padding-y-small padding-bottom-xxlarge"
                }, {
                    UpsellPackage1 = v2.createElement(v44, {
                        layoutOrder = 1, 
                        product = v45.upsellSuggestions[1], 
                        selected = v45.selectedUpsellIndex == 1, 
                        isCompact = if v31 then v47 else nil, 
                        onSelected = function() --[[ Line: 344 ]] --[[ Name: onSelected ]]
                            -- upvalues: v45 (copy)
                            v45.onUpsellSuggestionsSelected(1);
                        end
                    }), 
                    UpsellPackage2 = if #v45.upsellSuggestions > 1 then v2.createElement(v44, {
                        layoutOrder = 2, 
                        product = v45.upsellSuggestions[2], 
                        selected = v45.selectedUpsellIndex == 2, 
                        isCompact = if v31 then v47 else nil, 
                        onSelected = function() --[[ Line: 354 ]] --[[ Name: onSelected ]]
                            -- upvalues: v45 (copy)
                            v45.onUpsellSuggestionsSelected(2);
                        end, 
                        badgeType = v45.upsellSuggestions[2].badgeType
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
                    text = v46.Buy, 
                    onActivated = v45.buttons.buyItemActivated, 
                    inputDelay = (not v45.buttons.buyItemEnableInputDelayed or v48) and 0 or 2.5, 
                    isDisabled = v48, 
                    ref = if v29 then v60 else v57, 
                    fillBehavior = l_FillBehavior_0.Fill, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    size = if v31 and v47 then l_InputSize_0.Small else nil
                }); 
                DisclosureTerms = v2.createElement(l_View_0, {
                    LayoutOrder = 2, 
                    tag = "row wrap auto-y align-y-center align-x-center size-full-0 gap-xxsmall"
                }, {
                    DisclosurePayment = v2.createElement(l_Text_0, {
                        LayoutOrder = 1, 
                        Text = v46.DisclosurePayment, 
                        tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small"
                    }), 
                    BeforeText = v2.createElement(l_Text_0, {
                        LayoutOrder = 2, 
                        Text = v65[1], 
                        tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small"
                    }), 
                    TextLink = v2.createElement(l_Text_0, {
                        LayoutOrder = 3, 
                        RichText = true, 
                        Text = l_TermsOfUse_0, 
                        tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small", 
                        onActivated = v45.termsOfUseActivated
                    }), 
                    AfterText = v2.createElement(l_Text_0, {
                        LayoutOrder = 4, 
                        Text = v65[2], 
                        tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small"
                    })
                })
            })
        })
    });
end;
return function(v68) --[[ Line: 413 ]] --[[ Name: UnifiedRobuxUpsellModalContainer ]]
    -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v67 (copy)
    return v2.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        UnifiedRobuxUpsellModal = v2.createElement(v67, v68)
    });
end;